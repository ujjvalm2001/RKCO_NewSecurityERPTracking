<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UnitDetailsReport.aspx.cs" Inherits="NewSecurityERP.Tracking.Reports.UnitDetailsReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content overflow-hidden">
        <div class="page-content">
            <div class="container-fluid">

                <div class="row mb-3 pb-1">
                    <div class="col-12">
                        <div class="d-flex align-items-lg-center flex-lg-row flex-column float-end">
                            <div class="mt-3 mt-lg-0">
                                <div class="row g-3 mb-0 align-items-center">
                                    <!--end col-->
                                    <div class="col-auto">
                                        <button id="download-report-btn" type="button" class="btn btn-soft-success material-shadow-none"><i class="ri-add-circle-line align-middle me-1"></i>Download Report</button>
                                    </div>

                                    <!--end col-->
                                </div>
                                <!--end row-->
                            </div>
                        </div>
                        <!-- end card header -->
                    </div>
                    <!--end col-->
                </div>

                <div id="report">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-3 col-sm-6">
                                            <div class="p-2 border border-dashed rounded">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar-sm me-2">
                                                        <div class="avatar-title rounded bg-transparent text-success fs-24">
                                                            <i class="ri-money-dollar-circle-fill"></i>
                                                        </div>
                                                    </div>
                                                    <div class="flex-grow-1">
                                                        <p class="text-muted mb-1">Name :</p>
                                                        <h5 class="mb-0">
                                                            <asp:Label ID="lblEmpName" runat="server"></asp:Label></h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end col -->
                                        <div class="col-lg-3 col-sm-6">
                                            <div class="p-2 border border-dashed rounded">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar-sm me-2">
                                                        <div class="avatar-title rounded bg-transparent text-success fs-24">
                                                            <i class="ri-file-copy-2-fill"></i>
                                                        </div>
                                                    </div>
                                                    <div class="flex-grow-1">
                                                        <p class="text-muted mb-1">Date :</p>
                                                        <h5 class="mb-0">
                                                            <asp:Label ID="lblDate" runat="server"></asp:Label>
                                                        </h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end col -->
                                        <div class="col-lg-3 col-sm-6">
                                            <div class="p-2 border border-dashed rounded">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar-sm me-2">
                                                        <div class="avatar-title rounded bg-transparent text-success fs-24">
                                                            <i class="ri-stack-fill"></i>
                                                        </div>
                                                    </div>
                                                    <div class="flex-grow-1">
                                                        <p class="text-muted mb-1">VisitType :</p>
                                                        <h5 class="mb-0 text-capitalize">
                                                            <asp:Label ID="lblVisitType" runat="server"></asp:Label>
                                                        </h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end col -->
                                        <div class="col-lg-3 col-sm-6">
                                            <div class="p-2 border border-dashed rounded">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar-sm me-2">
                                                        <div class="avatar-title rounded bg-transparent text-success fs-24">
                                                            <i class="ri-inbox-archive-fill"></i>
                                                        </div>
                                                    </div>
                                                    <div class="flex-grow-1">
                                                        <p class="text-muted mb-1">Status :</p>
                                                        <h5 class="mb-0">
                                                            <asp:Label ID="lblStatus" runat="server"></asp:Label></h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end col -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <asp:Repeater runat="server" ID="rptAccordion">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-xxl-12">
                                    <div class="card">
                                        <div class="card-header align-items-center">
                                            <div class="d-flex mb-1">
                                                <div class="avatar-sm">
                                                    <div class="avatar-title bg-light rounded">
                                                        <img src="/assets/img/img-7.png" alt="" class="avatar-xxs companyLogo-img">
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
                                        <!-- end card header -->
                                        <div class="card-body">
                                            <div class="live-preview">
                                                <div class="collapse show" id='<%# "collapseWithicon_" + (Container.ItemIndex + 1) %>'>
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
                                                                                <div id='<%# "collapseOne_" + Eval("AnswerID") + "_" + Container.ItemIndex %>' class="accordion-collapse collapse show" aria-labelledby="'<%# "headingOne_" + (Container.ItemIndex + 1) %>'" data-bs-parent="#accordionExample">
                                                                                    <div class="accordion-body ms-2 ps-5 pt-0">
                                                                                        <div class="row">
                                                                                            <div class="col-lg-12">
                                                                                                <h6 class="mb-1">Answer : <%# Eval("AnswerText") %></h6>
                                                                                                <div class="row mt-3">


                                                                                                    <asp:PlaceHolder runat="server" Visible='<%# HasUploadedImages(Eval("UploadedImages")) %>'>
                                                                                                        <div class="col-lg-4">
                                                                                                            <%-- <h6 class="mb-1">Uploaded Images : </h6>--%>
                                                                                                            <div class="row border border-dashed gx-2 p-2 mb-2">
                                                                                                                <asp:Repeater runat="server" DataSource='<%# Eval("UploadedImages") %>'>
                                                                                                                    <ItemTemplate>
                                                                                                                        <div class="col-4 mb-2">
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
        integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>


    <script type="text/javascript">
        $(document).ready(function () {

            $("#download-report-btn").click(function (e) {

                e.preventDefault();
                debugger;
                const element = document.getElementById('report');
                var opt = {
                    filename: 'UnitWiseDetailReport.pdf'
                };
                html2pdf(element, opt);

            });
        });


        function showMediaModal(fileName, fileType) {
            debugger;
            $('#mediaModal').modal('show'); // Show the media modal

            // Set content based on file type
            if (fileType === 'image') {
                // Display image content
                $('#mediaContent').html(`<img src="${fileName}" class="img-fluid" alt="Image" style="width: 100%; max-width: 400px; height: 400px;">`);
            } else if (fileType === 'audio') {
                // Display audio content
                $('#mediaContent').html(`<audio controls><source src="http://160.25.111.30:88/TrackingDocs/audio/${fileName}" type="audio/mpeg">Your browser does not support the audio element.</audio>`);
            } else if (fileType === 'video') {
                debugger;
                // Display video content
                $('#mediaContent').html(`<video controls style="width: 100%; max-width: 400px; height: 400px;"><source src="http://160.25.111.30:88/TrackingDocs/video/${fileName}" type="video/mp4">Your browser does not support the video tag.</video>`);
            }
        }
    </script>
</asp:Content>
