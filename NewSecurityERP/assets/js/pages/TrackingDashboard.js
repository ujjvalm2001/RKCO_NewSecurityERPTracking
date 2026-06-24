
var map;
var userLocations = [];
var openInfoWindow = null;

// Function To Initilize the MAP
function initMap() {
    debugger;
    // advance map option
    map = new google.maps.Map(document.getElementById("map"), {
        zoom: 10,
        center: { lat: 28.6139, lng: 77.2088 },
        mapId: "DEMO_MAP_ID", // Map ID is required for advanced markers.
    });
    fetchUsersLiveLocations();

    initMap = function () { };
}

function fetchUsersLiveLocations() {
    $.ajax({
        //  url: 'https://localhost:44329/trackingAPI/GetUsersLiveLocation',
        url: 'http://160.25.111.30:88/trackingAPI/GetUsersLiveLocation',
        type: 'POST',
        async: 'true',
        contentType: 'application/json',
        success: function (data) {
            if (data.OutputCode == "200") {
                userLocations = data.Data.map(userData => ({
                    lat: parseFloat(userData.Latitude),
                    lng: parseFloat(userData.Longitude),
                    name: userData.UserName,
                    empCode: userData.EmpCode,
                    compId: userData.CompId,
                    address: userData.Address,
                    batteryPercentage: userData.BatteryPercentage,
                    completedTask: userData.CompletedTask,
                    pendingTask: userData.PendingTask,
                    lastSyncTime: new Date(userData.LocationTime).toLocaleString('en-GB', {
                        day: '2-digit',
                        month: '2-digit',
                        year: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit'
                    })
                }));

                // Call function to add markers for active users
                addMarkersForActiveUsers();
            }
            else {
                error(data.OutputMessage);
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





function addMarkersForActiveUsers() {
    debugger;
    for (const location of userLocations) { // Corrected variable name from properties to userLocations
        const AdvancedMarkerElement = new google.maps.marker.AdvancedMarkerElement({
            map,
            content: buildContent(location),
            position: { lat: location.lat, lng: location.lng }, // Updated to use lat and lng
            title: location.name, // Optionally add a title
        });

        AdvancedMarkerElement.addListener("click", () => {
            toggleHighlight(AdvancedMarkerElement, location);
        });
    }
}

function toggleHighlight(markerView, location) { // Renamed property to location
    if (markerView.content.classList.contains("highlight")) {
        markerView.content.classList.remove("highlight");
        markerView.zIndex = null;
    } else {
        markerView.content.classList.add("highlight");
        markerView.zIndex = 1;
    }
}



function buildContent(location) { // Renamed property to location
    debugger;
    let batteryIcon;
    let batteryCssClass;

    if (location.batteryPercentage >= 70) {
        batteryIcon = '<i class="ri-battery-fill"></i>';
        batteryCssClass = 'bg-success-subtle text-success';
    } else if (location.batteryPercentage >= 20 && location.batteryPercentage < 70) {
        batteryIcon = '<i class="ri-battery-low-line"></i>';
        batteryCssClass = 'bg-warning-subtle text-warning';
    } else {
        batteryIcon = '<i class="ri-battery-line"></i>';
        batteryCssClass = 'bg-danger-subtle text-danger';
    }

    const content = document.createElement("div");
    content.classList.add("property");
    content.innerHTML = `
    
    <div class="icon">
        <img src="/assets/img/supervisor-map-img.jpg" alt="" class="avatar--xs rounded-circle material-shadow img-thumbnail">
    <div class="ms-2 user-details">
  <h5 id="candidate-name" class="mb-0">${location.name}</h5>
    <ul class="list-inline mb-0 mt-2">
         <li class="list-inline-item avatar-xs">
             <a href="javascript:void(0);" class="avatar-title ${batteryCssClass} fs-15 rounded">
                ${batteryIcon}
             </a>
         </li>
         <li class="list-inline-item avatar-xs">
             <a href="javascript:void(0);" class="avatar-title bg-secondary-subtle text-secondary fs-15 rounded">
                 <i class="ri-wifi-line"></i>
             </a>
         </li>
         <li class="list-inline-item avatar-xs">
             <a href="/live-tracking-details?empcode=${location.empCode}&compid=${location.compId}" class="avatar-title bg-dark-subtle text-dark fs-15 rounded">
                 <i class="ri-walk-fill"></i>
             </a>
         </li>
   </ul>
</div>
    </div>

    <div class="details">        
        <div class="row">
          <div class="col-12">
               <div class="d-flex mt-2">
                    <div class="flex-shrink-0 avatar-xs align-self-center me-3">
                        <div class="avatar-title bg-light rounded-circle fs-16 text-primary material-shadow">
                            <i class="ri-map-pin-fill"></i>
                        </div>
                    </div>
                    <div class="flex-grow-1 overflow-hidden">
                        <p class="mb-1">${location.address}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class = "row border-top-dark border-top-dashed pt-2">
            <ul class="list-inline mb-0 d-flex justify-content-between px-0 align-items-center">
              <li class="list-inline-item">
                  <a href="#!" class="link-secondary"><h6 class="mb-0">Completed : <span class="badge bg-success-subtle text-success align-middle rounded-pill ms-1">
                       <span id="ContentPlaceHolder1_CompletedTask">${location.completedTask}</span></span></h6></a>
              </li>
              <li class="list-inline-item">
                  <a href="#!" class="link-danger"><h6 class="mb-0">Pending : <span class="badge bg-danger-subtle text-danger align-middle rounded-pill ms-1">
                    <span id="ContentPlaceHolder1_CompletedTask">${location.pendingTask}</span></span></h6></a>
              </li>
              <li class="list-inline-item">
                  <a href="/daily-task-assignment" class="link-primary"><small class="badge bg-primary-subtle text-primary ms-auto fs-13">Add Task</small></a>
              </li>
            </ul>       
        </div>
    </div>
    `;
    return content;
}


//<ul class="nav nav-tabs-custom card-header-tabs border-bottom-0 justify-content-between">
//    <li class="nav-item">
//        <a class="nav-link fw-semibold">Total : <span class="badge bg-danger-subtle text-danger align-middle rounded-pill ms-1">
//            <span id="ContentPlaceHolder1_TotalTask">${location.CompletedTask}</span></span>
//        </a>
//    </li>
//    <li class="nav-item">
//        <a class="nav-link fw-semibold">Completed : <span class="badge bg-success-subtle text-success align-middle rounded-pill ms-1">
//            <span id="ContentPlaceHolder1_CompletedTask">${location.PendingTask}</span></span>
//        </a>
//    </li>
//</ul> 



// Function To Add Markers For Users.
//function addMarkersForActiveUsers() {
//    // Loop through user locations and add markers
//    userLocations.forEach(location => {
//        // advance map option
//        let background;
//        let borderColor;
//        if (location.batteryPercentage >= 70) {
//            background = '#3bb15e'; // Full charge (green)#3bb15e
//            borderColor = '#3bb15e';
//        } else if (location.batteryPercentage >= 20 && location.batteryPercentage < 70) {
//            background = '#fcc401'; // Medium charge (yellow)
//            borderColor = '#fcc401';
//        } else if (location.batteryPercentage >= 5 && location.batteryPercentage < 20) {
//            background = '#f48023'; // Low charge (orange)
//            borderColor = '#f48023';
//        } else {
//            background = '#ed4c3e'; // Empty charge (red)
//            borderColor = '#ed4c3e';
//        }

//        const pinBackground = new google.maps.marker.PinElement({
//            background: background,
//            glyphColor: "white",
//            borderColor: borderColor
//        });


//        // advance map option
//        const marker = new google.maps.marker.AdvancedMarkerElement({
//            map: map,
//            position: { lat: location.lat, lng: location.lng },
//            title: location.name,
//            content: pinBackground.element,
//        });

//        // Create an info window content for the marker
//        const contentString = '<div id="content">' +
//            '<h4>' + location.name + '</h3>' +
//            '<p><strong>Current Address :</strong> ' + location.address + '</p>' +
//            '<p><strong>Battery Percentage :</strong> ' + location.batteryPercentage + '%</p>' +
//            '<p><strong>Last Sync Time :</strong> ' + location.lastSyncTime + '</p>' +
//            '</div>';

//        const infowindow = new google.maps.InfoWindow({
//            content: contentString
//        });

//        attachInfoWindow(marker, infowindow);
//    });

//    function attachInfoWindow(marker, infowindow) {
//        marker.addListener("click", () => {
//            if (openInfoWindow) {
//                openInfoWindow.close();
//            }
//            infowindow.open({
//                anchor: marker,
//                map: map,
//            });
//            openInfoWindow = infowindow;
//        });
//    }
//}