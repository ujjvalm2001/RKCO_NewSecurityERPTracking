function showMediaModal(fileName, fileType) {
    $('#mediaModal').modal('show'); // Show the media modal

    // Set content based on file type
    if (fileType === 'image') {
        // Display image content
        $('#mediaContent').html(`<img src="${fileName}" class="img-fluid" alt="Image">`);
    } else if (fileType === 'audio') {
        // Display audio content
        $('#mediaContent').html(`<audio controls><source src="http://160.25.111.30:86/TrackingDocs/audio/${fileName}" type="audio/mpeg">Your browser does not support the audio element.</audio>`);
    } else if (fileType === 'video') {
        // Display video content
        $('#mediaContent').html(`<video controls style="width: 100%; max-width: 400px; height: 400px;"><source src="http://160.25.111.30:86/TrackingDocs/video/${fileName}" type="video/mp4">Your browser does not support the video tag.</video>`);
    }
}
//< !--Map Script Start-- >
var map;
var openInfoWindow = null;
var directionsService;
var directionsRenderer;
var startLatLng;
var userLocations = [];
var assignedUnits = [];

// function to init the map.
function initMap() {

    map = new google.maps.Map(document.getElementById("map"), {
        zoom: 12,
        center: { lat: 0, lng: 0 },  // Center map initially; will update on AJAX response
        mapId: "DEMO_MAP_ID", // Map ID is required for advanced markers.
    });

    directionsService = new google.maps.DirectionsService();

    directionsRenderer = new google.maps.DirectionsRenderer({
        map: map,
        suppressMarkers: false, // Suppress default markers from directions service
        polylineOptions: {
            strokeColor: '#0f53ff', //  blue color
            strokeWeight: 8
        }
    });

    // Get data via AJAX
    getUserStartPoint();
    getUserLocationHistory();
    getUserAssignedUnits();

    initMap = function () { };
}

// Function To Find the User Start Point Lat lng.
function getUserStartPoint() {
    var urlParams = new URLSearchParams(window.location.search);
    var empcode = urlParams.get('empcode');
    var data = JSON.stringify({ EmpCode: empcode });

    $.ajax({
        type: 'POST',
        url: 'Tracking/LiveTrackingDetails.aspx/GetUserStartPoint',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: data,
        async: false,
        success: function (response) {
            if (response.d && response.d.error) {
                error(response.d.error);
            }
            else {
                startLatLng = new google.maps.LatLng(response.d.Latitude, response.d.Longitude);
                map.setCenter(startLatLng);

                const icon = document.createElement("div");

                icon.innerHTML = '<i class="fa-solid fa-a"></i>';

                const faPin = new google.maps.marker.PinElement({
                    glyph: icon,
                    glyphColor: "#ffffff",       // white color
                    background: "#ea4335",       // red color
                    borderColor: "#a50e0e",      // dark red color
                });
                const faMarker = new google.maps.marker.AdvancedMarkerElement({
                    map,
                    position: startLatLng,
                    content: faPin.element,
                    title: "User Start Point.",
                });
            }
        },
        error: function (xhr, status, errorMsg) {
            if (!errorMsg || errorMsg.trim() === '') {
                error("Something Went Wrong.");
            } else {
                error(errorMsg);
            }
        }
    });
}

// Function To Get User Location History Data.
function getUserLocationHistory() {
    var urlParams = new URLSearchParams(window.location.search);
    var empcode = urlParams.get('empcode');
    var companyId = urlParams.get('compid');
    compid = parseInt(companyId, 10);
    var data = JSON.stringify({ EmpCode: empcode, CompID: compid });

    $.ajax({
        type: 'POST',
        url: 'Tracking/LiveTrackingDetails.aspx/GetUserLocationHistory',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: data,
        async: false,
        success: function (response) {
            if (response.d && response.d.error) {
                error(response.d.error)
            }
            else if (response.d && Array.isArray(response.d.data) && response.d.data.length > 0) {
                userLocations = response.d.data;
                calculateAndDisplayRoute();
            }
        },
        error: function (xhr, status, errorMsg) {
            if (!errorMsg || errorMsg.trim() === '') {
                error("Something Went Wrong.");
            } else {
                error(errorMsg);
            }
        }
    });
}
// Function To Get User Assigned Unit Data.
function getUserAssignedUnits() {
    var urlParams = new URLSearchParams(window.location.search);
    var empcode = urlParams.get('empcode');
    var companyId = urlParams.get('compid');
    compid = parseInt(companyId, 10);
    var data = JSON.stringify({ EmpCode: empcode, CompID: compid });

    $.ajax({
        type: 'POST',
        url: 'Tracking/LiveTrackingDetails.aspx/GetUserAssignedUnits',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: data,
        async: false,
        success: function (response) {
            debugger;
            if (response.d && response.d.error) {
                error(response.d.error);
            } else if (response.d && Array.isArray(response.d.data) && response.d.data.length > 0) {
                assignedUnits = response.d.data;
                displayAssignedUnits();
            }
        },
        error: function (xhr, status, errorMsg) {
            if (!errorMsg || errorMsg.trim() === '') {
                error("Something Went Wrong.");
            } else {
                error(errorMsg);
            }
        }
    });
}

// Function To Generate the Route on Map using Polyline
function calculateAndDisplayRoute() {
    debugger;
    var pathCoordinates = [];
    var bounds = new google.maps.LatLngBounds();
    var colorIndex = 0;  // Index to track which color to use next
   // var colors = ['#FF0000', '#34a853', '#0000FF', "#de6600", "#fea02f", "007a7a", "#987284", "9DBF9E"];  // Example colors
    var colors = ["#CD1818","#0000FF", "#fea02f", '#E07A5F', "#19747E", "#AE445A", '#FF9F1C', "#A27B5C",'#C84B31', "#677D6A"];
    var totalDistance = 0;
    var previousPoint = null;
    var lastPoint = null;

    // Iterate through userLocations to build the path and calculate distance
    for (var i = 0; i < userLocations.length; i++) {
        var location = userLocations[i];
        var point = new google.maps.LatLng(parseFloat(location.Latitude), parseFloat(location.Longitude));

        // Extend bounds
        bounds.extend(point);

        // Calculate distance between previousPoint and point
        if (previousPoint) {
            var distance = google.maps.geometry.spherical.computeDistanceBetween(previousPoint, point);
            totalDistance += distance;
        }

        // Update previousPoint to current point
        previousPoint = point;
        lastPoint = point;
            
        // Add the point to pathCoordinates
        pathCoordinates.push(point);

        // Check if IsTripEnd is 1 to change color for the next segment
        if (location.IsTripEnd === 1 && i < userLocations.length - 1) {
            // Create and set polyline for the current segment
            createPolyline(pathCoordinates, colors[colorIndex], location.TaskName);

            // Update color index for the next segment
            colorIndex = (colorIndex + 1) % colors.length;

            // Reset pathCoordinates for the next segment
            pathCoordinates = [point];
        }
    }

    // Create polyline for the last segment if it exists
    debugger;
    if (pathCoordinates.length > 0) {
        createPolyline(pathCoordinates, colors[colorIndex], "Not Available");
    }

    // Fit map bounds to include the entire route
    map.fitBounds(bounds);
    var listener = google.maps.event.addListener(map, "idle", function () {
        if (map.getZoom() > 14) {   // set max zoom here
            map.setZoom(14);
        }
        google.maps.event.removeListener(listener);
    });
    // Display total distance
    var distanceElement = document.getElementById('distanceTravel');
    if (distanceElement) {
        distanceElement.textContent = (totalDistance / 1000).toFixed(2) + ' KM';
    }

    // Add a marker at the last point (user's current location)
    //if (lastPoint) {
    //    var marker = new google.maps.Marker({
    //        position: lastPoint,
    //        map: map,
    //        title: 'Current Location',
    //        icon: {
    //            url: '/assets/img/blue-dot-gif.gif', // Base64-encoded 10x10 red dot
    //            scaledSize: new google.maps.Size(60, 60), // Adjust size as needed
    //            anchor: new google.maps.Point(30, 30) // Center the GIF on the location point
    //        }
    //    });
    //}


    // last location of user - Ujjval
    if (userLocations && userLocations.length > 0) {
        var lastLoc = userLocations[userLocations.length - 1];
        var lastLatLng = new google.maps.LatLng(
            parseFloat(lastLoc.Latitude),
            parseFloat(lastLoc.Longitude)
        );

        map.setCenter(lastLatLng);

        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({ location: lastLatLng }, function (results, status) {
            var address = "Address not found";
            if (status === 'OK' && results[0]) {
                address = results[0].formatted_address;
            }

            var marker = new google.maps.Marker({
                position: lastLatLng,
                map: map,
                title: address,
                icon: {
                    url: '/assets/img/blue-dot-gif.gif', 
                    scaledSize: new google.maps.Size(60, 60),
                    anchor: new google.maps.Point(30, 30)
                }
            });
            var infoWindow = new google.maps.InfoWindow({
                content: "<b>Last Tracked Address:</b><br>" + address
            });

            marker.addListener('click', function () {
                infoWindow.open(map, marker);
            });
        });
    }
}
// Function to create and display polyline
function createPolyline(pathCoordinates, color, taskName) {
    var route = new google.maps.Polyline({
        path: pathCoordinates,
        geodesic: true,
        strokeColor: color,
        strokeOpacity: 1.0,
        strokeWeight: 6,
        zIndex: 9999
    });

    // Set icons for the polyline (direction arrows)
    var icons = [{
        icon: {
            path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
            scale: 3,
            strokeColor: "#000000",
            fillColor: '#ffffff',
            fillOpacity: 1,
            strokeWeight: 2
        },
        offset: '50%',
        repeat: '50px'
    }];

    route.set('icons', icons);


    google.maps.event.addListener(route, 'click', function (event) {
        // Set the content of the InfoWindow
        if (openInfoWindow) {
            openInfoWindow.close();
        }

        var infoWindow = new google.maps.InfoWindow();
        infoWindow.setContent('<b>Task : </b>' + taskName);
        infoWindow.setPosition(event.latLng);
        infoWindow.open(map);

        openInfoWindow = infoWindow;

    });

    // Set polyline on the map
    route.setMap(map);
}
function displayAssignedUnits() {

    for (var i = 0; i < assignedUnits.length; i++) {
        var unit = assignedUnits[i];
        // Check if unit has Latitude and Longitude data
        if (unit.Latitude && unit.Longitude) {

            var markerColor;
            var circleColor;
            if (unit.IsVisited === 1) {
                markerColor = "#34a853";   // green color
                circleColor = "#34a853";   // green color
            }
            else {
                markerColor = "#1a73e8";    // blue color
                circleColor = "#4285F4";    // blue color
            }

            const pinBackground = new google.maps.marker.PinElement({
                background: markerColor,
                glyphColor: "white",
                borderColor: markerColor
            });

            const marker = new google.maps.marker.AdvancedMarkerElement({
                map: map,
                position: { lat: unit.Latitude, lng: unit.Longitude },
                title: unit.UnitName,
                content: pinBackground.element
            });

            // Create circle overlay
            var circle = new google.maps.Circle({
                strokeColor: circleColor,
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: circleColor,
                fillOpacity: 0.35,
                map: map,
                center: new google.maps.LatLng(unit.Latitude, unit.Longitude),
                radius: 500 // 1 kilometers
            });

            // Add click event to show info window
            marker.addListener('click', (function (marker, unit) {
                return function () {
                    var infowindow = new google.maps.InfoWindow({
                        content: '<strong>' + unit.UnitName + '</strong><br>' + unit.Address
                    });
                    infowindow.open(map, marker);
                }
            })(marker, unit));
        }
    }
}
    //<!--Map Script End-- >