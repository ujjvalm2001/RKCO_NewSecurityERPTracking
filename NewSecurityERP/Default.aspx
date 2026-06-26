<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NewSecurityERP.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable" data-theme="default" data-theme-colors="default">
<head runat="server">
    <meta charset="utf-8" />
    <title>Sign In | NewSecurityER TESTP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="New Security ERP Dashboard" name="description" />
    <meta content="Canticle" name="author" />


    <script src="/assets/js/layout.js"></script>
    <!-- Bootstrap Css -->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="/assets/css/app.min.css" rel="stylesheet" type="text/css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- Toaster Message -->
    <link media="screen" rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script type="text/javascript" src="/assets/js/toastr-msg.js"></script> 

</head>

<body>
    <form id="form1" runat="server">
        <!-- auth-page wrapper -->
        <div class="auth-page-wrapper auth-bg-cover py-5 d-flex justify-content-center align-items-center min-vh-100">
            <div class="bg-overlay"></div>
            <!-- auth-page content -->
            <div class="auth-page-content overflow-hidden pt-lg-5">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card overflow-hidden card-bg-fill galaxy-border-none">
                                <div class="row g-0">
                                    <div class="col-lg-6">
                                        <div class="p-lg-5 p-4 auth-one-bg h-100">
                                            <div class="bg-overlay"></div>
                                            <div class="position-relative h-100 d-flex flex-column">
                                                <div class="mb-4">
                                                    <a href="index.html" class="d-block">
                                                        <%--<img src="/assets/img/logo-light.png" alt="" height="18" />--%>
                                                    </a>
                                                </div>
                                                <div class="mt-auto">
                                                    <div class="mb-3">
                                                        <i class="ri-double-quotes-l display-4 text-success"></i>
                                                    </div>

                                                    <div id="qoutescarouselIndicators" class="carousel slide" data-bs-ride="carousel">
                                                        <div class="carousel-indicators">
                                                            <button type="button" data-bs-target="#qoutescarouselIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                                            <button type="button" data-bs-target="#qoutescarouselIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                                            <button type="button" data-bs-target="#qoutescarouselIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                                        </div>
                                                        <div class="carousel-inner text-center text-white-50 pb-5">
                                                            <div class="carousel-item active">
                                                                <p class="fs-15 fst-italic">" Real-time tracking for instant insights and enhanced efficiency. "</p>
                                                            </div>
                                                            <div class="carousel-item">
                                                                <p class="fs-15 fst-italic">" GPS-based accuracy promotes transparency and accountability."</p>
                                                            </div>
                                                            <div class="carousel-item">
                                                                <p class="fs-15 fst-italic">" Intuitive interface for seamless operations and optimal resource management. "</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end carousel -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end col -->

                                    <div class="col-lg-6">
                                        <div class="p-lg-5 p-4">
                                            <div>
                                                <h5 class="text-primary">Welcome To RKCO Group !</h5>
                                                <p class="text-muted">Sign in to continue to RKCO Group.</p>
                                            </div>

                                            <div class="mt-4">
                                                <div class="mb-3">
                                                    <label for="ddlCompany" class="form-label">Company</label><span class="text-danger">*</span>
                                                    <asp:DropDownList ID="ddlCompany" class="form-select" runat="server" AutoPostBack="false">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RFVCompany" runat="server" ControlToValidate="ddlCompany" ForeColor="Red"
                                                        InitialValue="0" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please select a Company !!!"></asp:RequiredFieldValidator>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="username" class="form-label">Username</label><span class="text-danger">*</span>
                                                    <asp:TextBox ID="txtUserName" runat="server" type="text" class="form-control" placeholder="Enter username"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvuser" runat="server" ControlToValidate="txtUserName"
                                                        ErrorMessage="Please Enter UserName !!!" Display="Dynamic" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label" for="txtPassword">Password</label><span class="text-danger">*</span>
                                                    <div class="position-relative auth-pass-inputgroup mb-3">
                                                        <asp:TextBox runat="server" ID="txtPassword" type="password" class="form-control pe-5 password-input" placeholder="Enter password"></asp:TextBox>
                                                        <button class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon material-shadow-none" type="button" id="password-addon"><i class="ri-eye-fill align-middle"></i></button>
                                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                                                            ErrorMessage="Please Enter Password !!!" Display="Dynamic" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="mt-4">
                                                    <asp:Button ID="btnSubmit" runat="server" class="btn btn-success w-100" OnClick="btnSubmit_Click" Text="Sign In"></asp:Button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end auth page content -->

            <!-- footer -->
            <footer class="footer galaxy-border-none">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="text-center">
                                <p class="mb-0">
                                    &copy;
                                <script>document.write(new Date().getFullYear())</script>
                                    Crafted with <i class="mdi mdi-heart text-danger"></i>by CanticleIndia
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- end Footer -->
        </div>
        <!-- end auth-page-wrapper -->
    </form>


    <!-- JAVASCRIPT -->
    <script src="/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="/assets/libs/node-waves/waves.min.js"></script>
    <script src="/assets/libs/feather-icons/feather.min.js"></script>
    <script src="/assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
    <script type='text/javascript' src="/assets/libs/choice/choices.min.js"></script>
    <script type='text/javascript' src="/assets/libs/flatpickr/flatpickr.min.js"></script>

    <script>
        $(".password-addon").click(function () {
            $(this).toggleClass("fa-eye fa-eye-slash");
            input = $(this).parent().find("input");
            if (input.attr("type") == "password") {
                input.attr("type", "text");
            } else {
                input.attr("type", "password");
            }
        });

        // Disable right-click on page context menu
        document.addEventListener('contextmenu', function (event) {
            event.preventDefault();
        });

        // Disable Ctrl+U / F12 / Ctrl + Sht + I / and other shortcuts to open Developers Tools Window.
        document.addEventListener('keydown', function (event) {
            // Use event.keyCode for older browsers
            if ((event.ctrlKey && (event.key === 'u' || event.key === 'U')) ||
                event.keyCode === 123 || // F12 key
                (event.ctrlKey && event.shiftKey && (event.key === 'i' || event.key === 'I' || event.keyCode === 73))) {
                event.preventDefault();
            }
        });



    </script>
</body>
</html>
