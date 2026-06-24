<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TrackingDashboard.aspx.cs" Inherits="NewSecurityERP.TrackingDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content overflow-hidden">
        <div class="page-content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-xl-3 col-md-6">
                        <div class="card card-animate">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h4 class="mt-0 ff-secondary fw-semibold">Total Supervisor</h4>
                                        <h4 class="mb-0 text-muted">
                                            <asp:Label ID="lblTotalSupervisor" runat="server"></asp:Label></h4>
                                    </div>
                                    <div>
                                        <div class="avatar-sm flex-shrink-0">
                                            <span class="avatar-title bg-info-subtle rounded-circle fs-2">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="rgba(70,146,221,1)">
                                                    <path d="M4 22C4 17.5817 7.58172 14 12 14C16.4183 14 20 17.5817 20 22H18C18 18.6863 15.3137 16 12 16C8.68629 16 6 18.6863 6 22H4ZM12 13C8.685 13 6 10.315 6 7C6 3.685 8.685 1 12 1C15.315 1 18 3.685 18 7C18 10.315 15.315 13 12 13ZM12 11C14.21 11 16 9.21 16 7C16 4.79 14.21 3 12 3C9.79 3 8 4.79 8 7C8 9.21 9.79 11 12 11Z"></path></svg>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card card-animate">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h4 class="mt-0 ff-secondary fw-semibold">Total Client</h4>
                                        <h4 class="mb-0 text-muted">
                                            <asp:Label ID="lblTotalClient" runat="server"></asp:Label></h4>
                                    </div>
                                    <div>
                                        <div class="avatar-sm flex-shrink-0">
                                            <span class="avatar-title bg-info-subtle rounded-circle fs-2">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="rgba(70,146,221,1)">
                                                    <path d="M20 5C20 6.65685 18.6569 8 17 8C15.3431 8 14 6.65685 14 5C14 3.34315 15.3431 2 17 2C18.6569 2 20 3.34315 20 5ZM7 3C4.79086 3 3 4.79086 3 7V9H5V7C5 5.89543 5.89543 5 7 5H10V3H7ZM17 21C19.2091 21 21 19.2091 21 17V15H19V17C19 18.1046 18.1046 19 17 19H14V21H17ZM7 16C8.65685 16 10 14.6569 10 13C10 11.3431 8.65685 10 7 10C5.34315 10 4 11.3431 4 13C4 14.6569 5.34315 16 7 16ZM17 9C14.7909 9 13 10.7909 13 13H21C21 10.7909 19.2091 9 17 9ZM3 21C3 18.7909 4.79086 17 7 17C9.20914 17 11 18.7909 11 21H3Z"></path></svg>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card card-animate">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h4 class="mt-0 ff-secondary fw-semibold">Total Unit</h4>
                                        <h4 class="mb-0 text-muted">
                                            <asp:Label ID="lblTotalUnit" runat="server"></asp:Label></h4>
                                    </div>
                                    <div>
                                        <div class="avatar-sm flex-shrink-0">
                                            <span class="avatar-title bg-info-subtle rounded-circle fs-2">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="rgba(70,146,221,1)">
                                                    <path d="M3 19V5.70046C3 5.27995 3.26307 4.90437 3.65826 4.76067L13.3291 1.24398C13.5886 1.14961 13.8755 1.28349 13.9699 1.54301C13.9898 1.59778 14 1.65561 14 1.71388V6.6667L20.3162 8.77211C20.7246 8.90822 21 9.29036 21 9.72079V19H23V21H1V19H3ZM5 19H12V3.85543L5 6.40089V19ZM19 19V10.4416L14 8.77488V19H19Z"></path></svg>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card card-animate">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h4 class="mt-0 ff-secondary fw-semibold">Total Branch</h4>
                                        <h4 class="mb-0 text-muted">
                                            <asp:Label ID="lblTotalBranch" runat="server"></asp:Label></h4>
                                    </div>
                                    <div>
                                        <div class="avatar-sm flex-shrink-0">
                                            <span class="avatar-title bg-info-subtle rounded-circle fs-2">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="rgba(70,146,221,1)">
                                                    <path d="M10 2C10.5523 2 11 2.44772 11 3V7C11 7.55228 10.5523 8 10 8H8V10H13V9C13 8.44772 13.4477 8 14 8H20C20.5523 8 21 8.44772 21 9V13C21 13.5523 20.5523 14 20 14H14C13.4477 14 13 13.5523 13 13V12H8V18H13V17C13 16.4477 13.4477 16 14 16H20C20.5523 16 21 16.4477 21 17V21C21 21.5523 20.5523 22 20 22H14C13.4477 22 13 21.5523 13 21V20H7C6.44772 20 6 19.5523 6 19V8H4C3.44772 8 3 7.55228 3 7V3C3 2.44772 3.44772 2 4 2H10ZM19 18H15V20H19V18ZM19 10H15V12H19V10ZM9 4H5V6H9V4Z"></path></svg>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-height-100">
                            <div class="card-header align-items-center d-flex">
                                <h4 class="card-title mb-0 flex-grow-1">Supervisor Overview</h4>
                                <div class="flex-shrink-0">
                                    <ul class="nav justify-content-end nav-tabs-custom rounded card-header-tabs border-bottom-0" role="tablist">
                                        <li class="nav-item">
                                            <a class="btn btn-soft-success btn-sm material-shadow-none active" data-bs-toggle="tab" href="#online" role="tab" aria-selected="false"><i class="ri-wifi-line align-middle me-1"></i>Online -
                                                <asp:Label ID="ActiveUserCount" runat="server"></asp:Label></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="btn btn-soft-danger btn-sm material-shadow-none ms-2" data-bs-toggle="tab" href="#offline" role="tab" aria-selected="true"><i class="ri-wifi-off-line align-middle me-1"></i>Offline -
                                                <asp:Label ID="InActiveUserCount" runat="server"></asp:Label></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body" style="background: #e9ebec; height: 400px;" data-simplebar>
                                <div class="tab-content p-0">
                                    <div class="tab-pane fade active show" id="online" role="tabpanel">
                                        <asp:Repeater ID="repeaterActiveUsers" runat="server">
                                            <ItemTemplate>
                                                <div class="row gy-2 mb-2">
                                                    <div class="col-12">
                                                        <div class="card mb-0">
                                                            <div class="card-body">
                                                                <div class="d-lg-flex align-items-center">
                                                                    <div class="flex-shrink-0">
                                                                        <div class="avatar-sm rounded">
                                                                            <%--<img src='<%# Eval("EmpPhotoUrl") %>' alt="Emp photo" class="member-img img-fluid d-block rounded">--%>
                                                                            <img src='/assets/img/User.png' alt="Emp photo" class="member-img img-fluid d-block rounded">
                                                                        </div>
                                                                    </div>
                                                                    <div class="flex-grow-1 ms-3">
                                                                        <h5 class="fs-16 mb-2"><%# Eval("FirstName") %></h5>
                                                                        <p class="text-info mb-0"><b>PunchIn Time :</b> <%# Eval("PunchInTime", "{0:dd-MMM-yyyy - hh:mm:ss tt}") %></p>
                                                                    </div>
                                                                    <div class="flex-shrink-0 text-end">
                                                                        <span class="badge lh-base mb-2 bg-success"><%# Eval("Status") %></span>

                                                                        <a href='/live-tracking-details?empcode=<%# Eval("empcode") %>&compid=<%# Eval("CompId") %>'>
                                                                            <p class='text-danger fs-13 mb-0'>View Details</p>
                                                                        </a>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </div>
                                    <div class="tab-pane fade" id="offline" role="tabpanel">
                                        <asp:Repeater ID="repeaterInActiveUser" runat="server">
                                            <ItemTemplate>
                                                <div class="row gy-2 mb-2">
                                                    <div class="col-12">
                                                        <div class="card mb-0">
                                                            <div class="card-body">
                                                                <div class="d-lg-flex align-items-center">
                                                                    <div class="flex-shrink-0">
                                                                        <div class="avatar-sm rounded">
                                                                            <%--<img src='<%# Eval("EmpPhotoUrl") %>' alt="Emp Photo" class="member-img img-fluid d-block rounded">--%>
                                                                            <img src='/assets/img/User.png' alt="Emp photo" class="member-img img-fluid d-block rounded">
                                                                        </div>
                                                                    </div>
                                                                    <div class="flex-grow-1 ms-3">
                                                                        <h5 class="fs-16 mb-2"><%# Eval("FirstName") %></h5>
                                                                        <p class="text-danger mb-0">PunchOut Time : <%# Eval("PunchOutTime") != DBNull.Value ? Eval("PunchOutTime", "{0:dd-MMM-yyyy - hh:mm:ss tt}") : "Not logged in yet!" %></p>
                                                                    </div>
                                                                    <div class="flex-shrink-0 text-end">
                                                                        <span class="badge lh-base mb-2 bg-danger"><%# Eval("Status") %></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card card-height-100">
                            <div class="card-header align-items-center d-flex">
                                <h4 class="card-title mb-0 flex-grow-1">Map Overview</h4>
                            </div>
                            <div class="card-body p-0">
                                <div id="map" style="height: 400px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderJavaScript" runat="server">
    <%--<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvFyDCnIOEovByhli-Q9UdEaO9dcjMC4k&loading=async&callback=initMap"></script>--%>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcaA6jqyrN0CnjsZPZ055-Lc0pwHLBln0&loading=async&callback=initMap&libraries=maps,marker&v=weekly"></script>


    <%--<script src="/assets/js/pages/TrackingDashboard.js"></script>--%>

    <script type="text/javascript">

        var map;
        var userLocations = [];
        var openInfoWindow = null;

        // Function To Initilize the MAP
        function initMap() {
            //debugger;
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
            debugger;
            $.ajax({
                //  url: 'https://localhost:44329/trackingAPI/GetUsersLiveLocation',
                url: 'http://160.25.111.30:88/trackingAPI/GetUsersLiveLocation',
                type: 'POST',
                async: 'true',
                contentType: 'application/json',
                success: function (data) {
                    if (data.OutputCode == "200") {
                        debugger;
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
                       // error("Something Went Wrong.");
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

    </script>

</asp:Content>
