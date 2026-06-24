<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="LiveTrackingDetails.aspx.cs" Inherits="NewSecurityERP.Tracking.LiveTrackingDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <style>
        .task-card {
            border-radius: 16px;
            background: #e9ebec;
            transition: 0.2s;
        }

            .task-card:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            }

        .timeline {
            position: relative;
            padding-left: 20px;
            border-left: 2px solid #e9ecef;
        }

        .timeline-dot {
            position: absolute;
            left: -26px;
            width: 12px;
            height: 12px;
            border-radius: 50%;
        }

        .time-label {
            font-size: 12px;
            color: #6c757d;
        }

        .time-value {
            font-weight: 600;
            font-size: 13px;
        }

        .address-text {
            font-size: 12px;
            color: #6c757d;
        }
         .profile-card {
        background: #ffffff;
        border-radius: 16px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        border: 1px solid #f1f3f5;
    }

    .profile-img {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        object-fit: cover;
        border: 3px solid #e5e7eb;
        padding-bottom: 41px;
    padding-left: 47px;
    }

    .info-row {
        display: flex;
        gap: 6px;
        font-size: 12px;
        margin-top: 2px;
    }

    .info-label {
        color: #6b7280;
        min-width: 80px;
    }

    .info-value {
        font-weight: 500;
        color: #111827;
    }
    </style>
    <div class="main-content overflow-hidden">
        <div class="page-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card card-height-100">
                            <div class="card-header align-items-center d-flex">
                                <h4 class="card-title mb-0 flex-grow-1">Employee Details</h4>
                                <div class="flex-shrink-0">
                                    <span id="distanceTravel" class="badge bg-success-subtle text-success fs-12">0.00 KM</span>
                                </div>
                            </div>
                            <div class="card-body p-3">
                                <div class="profile-card d-flex  p-3">

                                    <!-- Avatar -->
                                    <div class="me-3">
                                        <img id="empPhoto" runat="server"
                                            src="/assets/img/User.png"
                                            class="avatar-xs rounded-circle me-2 material-shadow"
                                            alt="user">
                                    </div>

                                    <!-- Details -->
                                    <div class="flex-grow-1">

                                        <!-- Name + Role -->
                                        <div class="fw-semibold text-dark fs-6">
                                            <asp:Label ID="lblEmpName" runat="server" Text=""></asp:Label>
                                        </div>

                                        <div class="text-muted small mb-1">
                                            Supervisor
                                        </div>

                                        <!-- Punch Info -->
                                        <div class="info-row">
                                            <span class="info-label">🕒 Punch In</span>
                                            <span class="info-value">
                                                <asp:Label runat="server" ID="lblPunchInTime"></asp:Label>
                                            </span>
                                        </div>

                                        <div class="info-row">
                                            <span class="info-label">📍 Location</span>
                                            <span class="info-value  address-text">
                                                <asp:Label runat="server" ID="lblPunchInAddress"></asp:Label>
                                            </span>
                                        </div>

                                    </div>

                                </div>

                                <!-- Trip Details Card Start -->
                                <div class="row mt-2">
                                    <div class="col">
                                        <ul class="nav nav-tabs-custom card-header-tabs border-bottom-0 justify-content-between">
                                            <li class="nav-item">
                                                <a class="nav-link fw-semibold">Total : <span class="badge bg-danger-subtle text-danger align-middle rounded-pill ms-1">
                                                    <asp:Label ID="TotalTask" runat="server" Text=""></asp:Label></span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link fw-semibold">Completed : <span class="badge bg-success-subtle text-success align-middle rounded-pill ms-1">
                                                    <asp:Label ID="CompletedTask" runat="server" Text=""></asp:Label></span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link fw-semibold">Pending : <span class="badge bg-danger-subtle text-danger align-middle rounded-pill ms-1">
                                                    <asp:Label ID="PendingTask" runat="server" Text=""></asp:Label></span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div data-simplebar style="height: 350px;">
                                        <asp:Repeater ID="TaskRepeator" runat="server">
                                            <ItemTemplate>

                                                <div class="task-card shadow-sm mb-3 p-3">

                                                    <!-- Header -->
                                                    <div class="d-flex justify-content-between">
                                                        <div>
                                                            <div class="fw-bold text-dark" >
                                                                <%--<%# Eval("TaskName") %>--%>
                                                               Activity <%# Container.ItemIndex + 1 %>
                                                            </div>
                                                            <div class="text-muted small">
                                                                <%# Eval("UnitCode") %> - <%# Eval("UnitName") %>
                                                            </div>
                                                        </div>

                                                        <div class="text-end">
                                                            <div class="badge bg-light text-primary border mb-1">
                                                               <%# Eval("VisitType").ToString() == "Planned" ? "Scheduled" : "Patrolling" %>
                                                            </div>
                                                            <div class='<%# Eval("VisitStatus").ToString()=="Completed" ? "badge bg-success" : "badge bg-warning text-dark" %>'>
                                                                <%# Eval("VisitStatus") %>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Address -->
                                                    <div class="mt-2 address-text">
                                                        📍 <%# Eval("Address") %>
                                                    </div>

                                                    <!-- Timeline -->
                                                    <div class="timeline mt-3">

                                                        <!-- Site Visit -->
                                                        <div class='mb-3 position-relative <%# Eval("SiteVisitDateTime")==DBNull.Value?"d-none":"" %>'>
                                                            <span class="timeline-dot bg-success"></span>

                                                            <div class="time-label">Site Visit</div>
                                                            <div class="time-value">
                                                                <%# Eval("SiteVisitDateTime") %>
                                                            </div>
                                                            <div class="address-text">
                                                                📍
                                                              <%# Eval("SiteVisitAddress") %>
                                                            </div>
                                                        </div>

                                                        <!-- Task Start -->
                                                        <div class="mb-3 position-relative">
                                                            <span class="timeline-dot bg-primary"></span>

                                                            <div class="time-label">Task Start</div>
                                                            <div class='time-value <%# String.IsNullOrEmpty(Eval("time_mismatch_remark").ToString()) ? "" : "text-danger" %>'>
                                                                <%# Eval("VisitedStartDateTime") %>
                                                            </div>
                                                        </div>

                                                        <!-- Task End -->
                                                        <div class="mb-3 position-relative">
                                                            <span class="timeline-dot bg-info"></span>

                                                            <div class="time-label">Task End</div>
                                                            <div class='time-value <%# String.IsNullOrEmpty(Eval("time_mismatch_remark").ToString()) ? "" : "text-danger" %>'>
                                                                <%# Eval("VisitedEndDateTime") %>
                                                            </div>
                                                        </div>

                                                        <!-- Site Leave -->
                                                        <div class='mb-2 position-relative <%# Eval("SiteLeaveDateTime")==DBNull.Value?"d-none":"" %>'>
                                                            <span class="timeline-dot bg-danger"></span>

                                                            <div class="time-label">Site Leave</div>
                                                            <div class="time-value">
                                                                <%# Eval("SiteLeaveDateTime") %>
                                                            </div>
                                                            <div class="address-text">
                                                                📍
                                                                <%# Eval("SiteLeaveAddress") %>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <!-- Footer -->
                                                    <div class="d-flex justify-content-between align-items-center mt-3">

                                                        <div class="badge bg-success-subtle text-success">
                                                            🚗 <%# Eval("TaskVisitKM") %> KM
                                                        </div>

                                                        <div class='<%# string.IsNullOrEmpty(Eval("TotalVisitDuration").ToString()) ? "d-none" : "badge bg-light text-dark" %>'>
                                                            ⏱ <%# Eval("TotalVisitDuration") %>
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
                    <div class="col-lg-8">
                        <div class="card card-height-100">
                            <div class="card-header align-items-center d-flex justify-content-between p-2">
                                <h4 class="card-title mb-0">Live Tracking Details</h4>

                                <div class="header-marker">
                                    <img src="/assets/img/startpoint.png" alt="icon" class="marker-icon">
                                    <h4 class="card-title mb-0">Start Point</h4>
                                </div>
                                <div class="header-marker">
                                    <img src="/assets/img/greenmarker.png" alt="icon" class="marker-icon">
                                    <h4 class="card-title mb-0">Visited Site</h4>
                                </div>
                                <div class="header-marker">
                                    <img src="/assets/img/bluemarker.png" alt="icon" class="marker-icon">
                                    <h4 class="card-title mb-0">Not Visited Site</h4>
                                </div>
                            </div>
                            <div class="card-body p-0">
                                <div id="map" style="height: 500px;"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--  Show Question According to Unit. -->
                <asp:Repeater runat="server" ID="rptAccordion">
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-xxl-12">
                                <div class="card">
                                    <div class="card-header align-items-center">
                                        <div class="d-flex mb-1">
                                            <div class="avatar-sm">
                                                <div class="avatar-title bg-light rounded">
                                                    <img src="https://themesbrand.com/velzon/html/master/assets/images/companies/img-7.png" alt="" class="avatar-xxs companyLogo-img">
                                                </div>
                                            </div>
                                            <div class="ms-3 flex-grow-1">
                                                <img src="assets/images/small/img-8.jpg" alt="" class="d-none cover-img">
                                                <a href="#!">
                                                    <h5 class="job-title">Unit Name : <%# Eval("UnitName") %></h5>
                                                </a>
                                                <p class="company-name text-muted mb-0">Address : <%# Eval("Address") %></p>
                                            </div>
                                            <div>
                                                <button class="btn btn-light" type="button" data-bs-toggle="collapse" data-bs-target='<%# "#collapseWithicon_" + (Container.ItemIndex + 1) %>' aria-expanded="true" aria-controls='<%# "collapseWithicon_" + (Container.ItemIndex + 1) %>'>
                                                    <i class="ri-arrow-down-circle-line fs-18"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="card-body">
                                        <div class="live-preview">
                                            <div class="collapse" id='<%# "collapseWithicon_" + (Container.ItemIndex + 1) %>'>
                                                <div class="card mb-0">
                                                    <div class="card-body">
                                                        <div class="profile-timeline">
                                                            <div class="accordion accordion-flush" id="accordionFlushExample">
                                                                <asp:Repeater runat="server" DataSource='<%# Eval("Questions") %>'>
                                                                    <ItemTemplate>
                                                                        <div class="accordion-item border-0">
                                                                            <div class="accordion-header" id='<%# "headingOne_" + (Container.ItemIndex + 1) %>'>
                                                                                <a class="accordion-button p-2 shadow-none" data-bs-toggle="collapse" href='<%# "#collapseOne_" + Eval("AnswerID") + "_" + Container.ItemIndex %>' aria-expanded="true" aria-controls="collapseOne">
                                                                                    <div class="d-flex align-items-center">
                                                                                        <div class="flex-shrink-0 avatar-xs">
                                                                                            <div class="avatar-title bg-success rounded-circle material-shadow">
                                                                                                <%# Container.ItemIndex + 1 %>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="flex-grow-1 ms-3">
                                                                                            <h6 class="fs-15 mb-0 fw-semibold"><%# Eval("QuestionText") %></h6>
                                                                                        </div>
                                                                                    </div>
                                                                                </a>
                                                                            </div>
                                                                            <div id='<%# "collapseOne_" + Eval("AnswerID") + "_" + Container.ItemIndex %>' class="accordion-collapse collapse" aria-labelledby="'<%# "headingOne_" + (Container.ItemIndex + 1) %>'" data-bs-parent="#accordionExample">
                                                                                <div class="accordion-body ms-2 ps-5 pt-0">
                                                                                    <div class="row">
                                                                                        <div class="col-lg-12">
                                                                                            <h6 class="mb-1">Answer : <%# Eval("AnswerText") %></h6>
                                                                                            <div class="row mt-3">

                                                                                                <asp:PlaceHolder runat="server" Visible='<%# HasUploadedImages(Eval("UploadedImages")) %>'>
                                                                                                    <div class="col-lg-4">
                                                                                                        <%--<h6 class="mb-1">Uploaded Images : </h6>--%>
                                                                                                        <div class="row border border-dashed gx-2 p-2 mb-2">
                                                                                                            <asp:Repeater runat="server" DataSource='<%# Eval("UploadedImages") %>'>
                                                                                                                <ItemTemplate>
                                                                                                                    <div class="col-4 mb-2">
                                                                                                                        <%--<a href='<%# Eval("FileName") %>'  target="_blank">
                                                                                                                            <img src='<%# Eval("FileName") %>' alt="" class="img-fluid rounded Ques_Image">
                                                                                                                        </a>--%>
                                                                                                                        <a href="!#" onclick='showMediaModal("<%# Eval("FileName") %>", "image"); return false;' target="_blank">
                                                                                                                            <img src='<%# Eval("FileName") %>' alt="" class="img-fluid rounded Ques_Image">
                                                                                                                        </a>
                                                                                                                    </div>
                                                                                                                </ItemTemplate>
                                                                                                            </asp:Repeater>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </asp:PlaceHolder>
                                                                                                <asp:Repeater runat="server" DataSource='<%# Eval("UploadedMedia") %>' Visible='<%# HasFiles(Eval("UploadedMedia")) %>'>
                                                                                                    <ItemTemplate>
                                                                                                        <div class="col-lg-4">
                                                                                                            <div class="border rounded border-dashed p-2">
                                                                                                                <div class="d-flex align-items-center">
                                                                                                                    <div class="flex-shrink-0 me-3">
                                                                                                                        <div class="avatar-sm">
                                                                                                                            <div class="avatar-title bg-light text-secondary rounded fs-24">
                                                                                                                                <%# Eval("FileType").ToString() == "audio" ? "<i class='ri-volume-up-line'></i>" :  "<i class='ri-video-download-line'></i>" %>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    <div class="flex-grow-1 overflow-hidden">
                                                                                                                        <h5 class="fs-13 mb-1">
                                                                                                                            <a href="#" onclick="showMediaModal('<%# Eval("FileName") %>', '<%# Eval("FileType") %>'); return false;" class="text-body text-truncate d-block"><%# Eval("FileName") %></a>
                                                                                                                        </h5>
                                                                                                                    </div>
                                                                                                                    <div class="flex-shrink-0 ms-2">
                                                                                                                        <div class="d-flex gap-1">
                                                                                                                            <asp:LinkButton runat="server" CommandName="Download" CommandArgument='<%# Eval("FileName") + "|" + Eval("FileType") %>' OnCommand="DownloadFile_Click" CssClass="btn btn-icon text-muted btn-sm fs-18">
                                                                                                                                    <i class="ri-download-2-line"></i>
                                                                                                                             </asp:LinkButton>
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
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </div>
                                                            <!--end accordion-->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end card-body -->
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <!-- Modal Popup For Image, Audio, Video -->
    <div class="modal fade" id="mediaModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header border-bottom pb-3">
                    <h5 class="modal-title" id="mediaModalLabel">Media Preview</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center p-5" id="mediaContent">
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderJavaScript" runat="server">
    <%--    <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvFyDCnIOEovByhli-Q9UdEaO9dcjMC4k&loading=async&callback=initMap&libraries=maps,marker,geometry&v=weekly" defer></script>--%>
    <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcaA6jqyrN0CnjsZPZ055-Lc0pwHLBln0&loading=async&callback=initMap&libraries=maps,marker,geometry&v=weekly" defer></script>

    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <script src="/assets/js/pages/LiveTrackingDetails.js"></script>
</asp:Content>


