<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="NewUserRegistration.aspx.cs" Inherits="NewSecurityERP.CandidateRegistration.NewUserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content overflow-hidden">
        <div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between bg-galaxy-transparent">
                            <h5 class="my-2">Candidate Registration</h5>
                        </div>
                    </div>
                </div>
                <!-- end page title -->


                <!-- Card Details  start -->
                <div id="register_details" runat="server" style="display: none">
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="flex-grow-1">
                                            <p class="text-uppercase fw-semibold fs-12 text-muted mb-1">RegistrationID : </p>
                                            <h4 class="mb-0">
                                                <asp:Label ID="lblCan_RegId" runat="server" Text=""></asp:Label></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="flex-grow-1">
                                            <p class="text-uppercase fw-semibold fs-12 text-muted mb-1">Aadhar No : </p>
                                            <h4 class="mb-0">
                                                <asp:Label ID="lblCan_adharNo" runat="server" Text=""></asp:Label></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="flex-grow-1">
                                            <p class="text-uppercase fw-semibold fs-12 text-muted mb-1">Candidate Name : </p>
                                            <h4 class="mb-0">
                                                <asp:Label ID="lblCan_Name" runat="server" Text=""></asp:Label></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="flex-grow-1">
                                            <p class="text-uppercase fw-semibold fs-12 text-muted mb-1">Father Name : </p>
                                            <h4 class=" mb-0">
                                                <asp:Label ID="lblCan_FatherName" runat="server" Text=""></asp:Label></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Card Details  end -->

                <asp:HiddenField ID="activeTab" runat="server" Value="1" />
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-body checkout-tab">
                                <!-- Tabs Start -->
                                <ul class="nav nav-pills arrow-navtabs nav-success bg-light mb-3" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link <% if (activeTab.Value == "1")
                                            { %>active<% } %>"
                                            data-bs-toggle="tab" id="personal-details-tab" href="#personal-details" role="tab" aria-selected="false" tabindex="-1">
                                            <span class="d-block d-sm-none"><i class="mdi mdi-home-variant"></i></span>
                                            <span class="d-none d-sm-block">Personal Detail</span>
                                        </a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link <% if (activeTab.Value == "2")
                                            { %>active<% } %>"
                                            data-bs-toggle="tab" href="#communication-details" role="tab" aria-selected="false" tabindex="-1">
                                            <span class="d-block d-sm-none"><i class="mdi mdi-account"></i></span>
                                            <span class="d-none d-sm-block">Comm Detail</span>
                                        </a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link <% if (activeTab.Value == "3")
                                            { %>active<% } %>"
                                            data-bs-toggle="tab" href="#add-family" role="tab" aria-selected="false">
                                            <span class="d-block d-sm-none"><i class="mdi mdi-email"></i></span>
                                            <span class="d-none d-sm-block">Add Family</span>
                                        </a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link <% if (activeTab.Value == "4")
                                            { %>active<% } %>"
                                            data-bs-toggle="tab" href="#add-employment" role="tab" aria-selected="false">
                                            <span class="d-block d-sm-none"><i class="mdi mdi-email"></i></span>
                                            <span class="d-none d-sm-block">Add Employment</span>
                                        </a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link <% if (activeTab.Value == "5")
                                            { %>active<% } %>"
                                            data-bs-toggle="tab" href="#physical-details" role="tab" aria-selected="false">
                                            <span class="d-block d-sm-none"><i class="mdi mdi-email"></i></span>
                                            <span class="d-none d-sm-block">Physical Detail</span>
                                        </a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link <% if (activeTab.Value == "6")
                                            { %>active<% } %>"
                                            data-bs-toggle="tab" href="#add-experience" role="tab" aria-selected="false">
                                            <span class="d-block d-sm-none"><i class="mdi mdi-email"></i></span>
                                            <span class="d-none d-sm-block">Add Experience</span>
                                        </a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link <% if (activeTab.Value == "7")
                                            { %>active<% } %>"
                                            data-bs-toggle="tab" href="#guarantor-details" role="tab" aria-selected="false">
                                            <span class="d-block d-sm-none"><i class="mdi mdi-email"></i></span>
                                            <span class="d-none d-sm-block">Guarantor Detail</span>
                                        </a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link <% if (activeTab.Value == "8")
                                            { %>active<% } %>"
                                            data-bs-toggle="tab" href="#gunman-details" role="tab" aria-selected="false">
                                            <span class="d-block d-sm-none"><i class="mdi mdi-email"></i></span>
                                            <span class="d-none d-sm-block">Gunman Detail</span>
                                        </a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link <% if (activeTab.Value == "9")
                                            { %>active<% } %>"
                                            data-bs-toggle="tab" href="#add-document" role="tab" aria-selected="false">
                                            <span class="d-block d-sm-none"><i class="mdi mdi-email"></i></span>
                                            <span class="d-none d-sm-block">Add Document</span>
                                        </a>
                                    </li>
                                </ul>
                                <!-- Tabs End -->




                                <div class="tab-content">
                                    <!-- Personnal Details Tab Panel start -->
                                    <div class="tab-pane fade <% if (activeTab.Value == "1")
                                        { %>show active<% } %>"
                                        id="personal-details" role="tabpanel" aria-labelledby="personal-details-tab">
                                        <div>
                                            <h5 class="mb-1">Personnal Details</h5>
                                            <p class="text-muted mb-4">Please fill all information below</p>
                                        </div>

                                        <div>
                                            <div class="row">
                                                <div class="col-lg-9">
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <label class="form-label">Registration ID</label>
                                                                <asp:TextBox ID="txtRegistrationID" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <label class="form-label">Aadhar No</label><span class="text-danger">*</span>
                                                                <asp:TextBox ID="txtAadharNo" runat="server" MaxLength="12" MinLength="12" type="text" class="form-control" placeholder="Enter Aadhar Number" value="" onkeypress="return isNumeric(event)"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAadharNo" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Aadhar No." SetFocusOnError="true" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAadharNo" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Aadhar No." SetFocusOnError="true" ValidationGroup="GroupAadhar"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtAadharNo" ID="RegularExpressionValidator1" ValidationExpression="^[0-9]{12}$" runat="server" ErrorMessage="Minimum 12 characters required." ForeColor="Red"></asp:RegularExpressionValidator>
                                                                <asp:Button ID="btnCurrentData" runat="server" type="button" class="btn btn-info btn-sm mt-1" ValidationGroup="GroupAadhar" OnClick="btnCurrentData_Click" Text="Verify Current Data"></asp:Button>
                                                                <asp:Button ID="btnAadhar" runat="server" type="button" class="btn btn-success btn-sm mt-1 ms-1" ValidationGroup="GroupAadhar" OnClick="btnAadhar_Click" Text="Get OTP"></asp:Button>
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <label class="form-label">Aadhar OTP</label><span class="text-danger">*</span>
                                                                <asp:TextBox ID="txtOTP" runat="server" type="text" MaxLength="6" MinLength="6" class="form-control" placeholder="Enter OTP" value="" onkeypress="return isNumeric(event)"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtOTP" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Aadhar OTP" SetFocusOnError="true" ValidationGroup="GroupOTP"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtOTP" ID="RegularExpressionValidator6" ValidationExpression="^[0-9]{6}$" runat="server" ErrorMessage="Enter 6 Digit OTP" ForeColor="Red"></asp:RegularExpressionValidator>
                                                                <asp:Button ID="btnSubmitOTP" runat="server" type="button" class="btn btn-info btn-sm mt-1" ValidationGroup="GroupOTP" OnClick="btnSubmitOTP_Click" Text="Verify Aadhar Data"></asp:Button>
                                                                <button id="btnShowAadhar" type="button" class="btn btn-success btn-sm mt-1 ms-1" data-bs-toggle="modal" data-bs-target="#AadharModal">View Aadhar</button>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <label class="form-label">Salutation</label><span class="text-danger">*</span>
                                                                <asp:DropDownList ID="ddlSalutation" runat="server" CssClass="form-select">
                                                                    <asp:ListItem Selected="True" disabled="" Value="0">--SELECT--</asp:ListItem>
                                                                    <asp:ListItem Value="MR">MR</asp:ListItem>
                                                                    <asp:ListItem Value="MS">MS</asp:ListItem>
                                                                    <asp:ListItem Value="MRS">MRS</asp:ListItem>
                                                                    <asp:ListItem Value="DR">DR</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="ddlSalutation" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Select a value" InitialValue="0" SetFocusOnError="true" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <label class="form-label">Name As Per Aadhar</label><span class="text-danger">*</span>
                                                                <asp:TextBox ID="txtCandidateName" runat="server" type="text" class="form-control" placeholder="Enter Name"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCandidateName" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Name" SetFocusOnError="true" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <label class="form-label">Father Name</label><span class="text-danger">*</span>
                                                                <asp:TextBox ID="txtFatherName" runat="server" type="text" class="form-control" placeholder="Enter Father Name"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtFatherName" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Father Name" SetFocusOnError="true" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="mb-4">
                                                                <h5 class="fs-14 mb-2 text-center">Candidate Image</h5>
                                                                <div class="text-center">
                                                                    <div class="position-relative d-inline-block">
                                                                        <div class="position-absolute top-100 start-100 translate-middle">
                                                                            <label for="avatarUpload" class="mb-0" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Select Image" data-bs-original-title="Select Image">
                                                                                <div class="avatar-xs">
                                                                                    <div class="avatar-title bg-light border rounded-circle text-muted cursor-pointer" onclick="triggerFileInput()">
                                                                                        <i class="ri-image-fill"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </label>
                                                                            <input class="form-control d-none" id="avatarUpload" runat="server" type="file" capture="camera" accept="image/png, image/gif, image/jpeg" onchange="previewImage(this)">
                                                                        </div>
                                                                        <div class="avatar-lg">
                                                                            <div class="avatar-title bg-light rounded">
                                                                                <asp:Image ID="imgCandidate" runat="server" CssClass="avatar-md h-auto" ImageUrl="/assets/img/Photo.jpg" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <label class="form-label">Mother Name</label>
                                                        <asp:TextBox ID="txtMotherName" runat="server" type="text" class="form-control" placeholder="Enter Mother Name"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <label class="form-label">Date of Birth As Per Aadhar</label><span class="text-danger">*</span>
                                                        <asp:TextBox ID="txtDateofBirth" runat="server" type="date" class="form-control" placeholder="Enter DOB"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDateofBirth" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter DOB" SetFocusOnError="true" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <label class="form-label">Gender</label><span class="text-danger">*</span>
                                                        <asp:DropDownList ID="ddlGender" runat="server" type="text" class="form-select" placeholder="Enter last name" value="">
                                                            <asp:ListItem Value="0" disabled="" Selected="true">--Select--</asp:ListItem>
                                                            <asp:ListItem Value="Male">Male</asp:ListItem>
                                                            <asp:ListItem Value="Female">Female</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlGender" Display="Dynamic" ForeColor="Red" ErrorMessage="Select a value" InitialValue="0" SetFocusOnError="true" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <label class="form-label">Maritial Status</label><span class="text-danger">*</span>
                                                        <asp:DropDownList ID="ddlMarried" runat="server" class="form-select" value="" ClientIDMode="AutoID">
                                                            <asp:ListItem Value="0" disabled="" Selected="True">--Select--</asp:ListItem>
                                                            <asp:ListItem Value="Married">Married</asp:ListItem>
                                                            <asp:ListItem Value="UnMarried">UnMarried</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlMarried" Display="Dynamic" ForeColor="Red" ErrorMessage="Select a value" SetFocusOnError="true" InitialValue="0" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="col-sm-3" id="colSpouseName" runat="server">
                                                    <div class="mb-3">
                                                        <label class="form-label">Spouse Name</label>
                                                        <asp:TextBox ID="txtSpouse" runat="server" type="text" class="form-control" placeholder="Enter Spouse Name"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <label class="form-label">Date of Joining</label><span class="text-danger">*</span>
                                                        <asp:TextBox ID="txtDoj" runat="server" type="date" class="form-control" placeholder="Enter Date"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtDoj" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter DOJ" SetFocusOnError="true" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <label class="form-label">Job Type</label><span class="text-danger">*</span>
                                                        <asp:DropDownList ID="ddlJobType" runat="server" type="text" class="form-select" placeholder="Enter last name" value="">
                                                            <asp:ListItem Value="0" disabled="" Selected="True">--Select--</asp:ListItem>
                                                            <asp:ListItem Value="Permanent">Permanent</asp:ListItem>
                                                            <asp:ListItem Value="Probation">Probation</asp:ListItem>
                                                            <asp:ListItem Value="Contractual">Contractual</asp:ListItem>
                                                            <asp:ListItem Value="Trainee">Trainee</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlJobType" Display="Dynamic" ForeColor="Red" ErrorMessage="Select a value" SetFocusOnError="true" InitialValue="0" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <label class="form-label">PAN No.</label>
                                                        <asp:TextBox ID="txtPANNo" runat="server" type="text" class="form-control" placeholder="Enter Pan No." onkeyup="this.value = this.value.toUpperCase();" MaxLength="10"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ControlToValidate="txtPANNo" Display="Dynamic" ForeColor="Red" ErrorMessage="Invalid PAN Number" ValidationGroup="Group1" ValidationExpression="[A-Z]{5}\d{4}[A-Z]{1}"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <label class="form-label">Email-Id</label>
                                                        <asp:TextBox ID="txtEmail" runat="server" type="email" class="form-control" placeholder="Enter Email ID"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email address" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <label class="form-label">Previous UAN.</label>
                                                        <asp:RadioButtonList ID="rdoPreUAN" runat="server" AutoPostBack="false" CssClass="form-control" Height="36px" RepeatDirection="Horizontal">
                                                            <asp:ListItem>Yes &nbsp &nbsp</asp:ListItem>
                                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3" id="colUAN">
                                                    <div class="mb-3">
                                                        <label class="form-label">UAN No.</label>
                                                        <asp:TextBox ID="txtPreviousUAN" runat="server" type="text" class="form-control" placeholder="Enter UAN No."></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <label class="form-label">Previous ESI</label>
                                                        <asp:RadioButtonList ID="rdoESI" runat="server" AutoPostBack="false" CssClass="form-control" Height="36px" RepeatDirection="Horizontal">
                                                            <asp:ListItem>Yes &nbsp &nbsp</asp:ListItem>
                                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3" id="colESI">
                                                    <div class="mb-3">
                                                        <label class="form-label">ESI No.</label>
                                                        <asp:TextBox ID="txtPreviousESICode" runat="server" type="text" class="form-control" placeholder="Enter ESI No."></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <label class="form-label">Is Rejoin </label>
                                                        <asp:RadioButtonList ID="rblRegion" runat="server" AutoPostBack="false" CssClass="form-control" Height="36px" RepeatDirection="Horizontal">
                                                            <asp:ListItem>Yes &nbsp &nbsp</asp:ListItem>
                                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3" id="colISRejoin">
                                                    <div class="mb-3">
                                                        <label class="form-label">Old Employee Code</label>
                                                        <asp:TextBox ID="txtOldEmployeeCode" runat="server" type="text" class="form-control" placeholder="Enter Old Employee Code"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="d-flex align-items-start gap-3 mt-3">
                                                <asp:Button ID="btnNext" runat="server" type="button" class="btn btn-success right ms-auto nexttab" OnClick="btnNext_Click" ValidationGroup="Group1" Text="Proceed to Next"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Personnal Details Tab Panel End -->

                                    <!-- Comminication Details Tab Panel End -->
                                    <div class="tab-pane fade <% if (activeTab.Value == "2")
                                        { %>show active<% } %>"
                                        id="communication-details" role="tabpanel" aria-labelledby="communication-details-tab">
                                        <div>
                                            <h5 class="mb-1">Communication Details</h5>
                                            <p class="text-muted mb-4">Please fill all information below</p>
                                        </div>

                                        <div class="row">
                                            <div class="col-xxl-6">
                                                <div class="card custom-shadow">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Present Address</h4>
                                                    </div>
                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <div class="row">

                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Village/House No</label>
                                                                    <asp:TextBox ID="txtVillHouseNo" runat="server" type="text" class="form-control" placeholder="Enter your House No."></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Street / Sector / Post Office</label>
                                                                    <asp:TextBox ID="txtPostOffice" runat="server" type="text" class="form-control" placeholder="Enter Street/PostOffice..."></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Police Station</label>
                                                                    <asp:TextBox ID="txtPoliceStation" runat="server" type="text" class="form-control" placeholder="Enter Police Station"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-md-6" id="state" runat="server">
                                                                <div class="mb-3">
                                                                    <label class="form-label">State</label><span class="text-danger">*</span>
                                                                    <asp:DropDownList ID="ddlState" runat="server" class="form-select" AutoPostBack="false" size="1">
                                                                        <asp:ListItem Value="0" Selected="True">--SELECT--</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlState" Display="Dynamic" ForeColor="Red" ErrorMessage="Select a value" SetFocusOnError="true" InitialValue="0" ValidationGroup="Communication"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">District</label><span class="text-danger">*</span>
                                                                    <asp:TextBox ID="txtDistrict" runat="server" type="text" class="form-control" placeholder="Enter District Name"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtDistrict" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter district name" SetFocusOnError="true" ValidationGroup="Communication"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-md-6" id="city" runat="server">
                                                                <div class="mb-3">
                                                                    <label class="form-label">City</label><span class="text-danger">*</span>
                                                                    <asp:TextBox ID="txtCity" runat="server" type="text" class="form-control" placeholder="Enter City Name"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtCity" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter city name" SetFocusOnError="true" ValidationGroup="Communication"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Tehsil</label><span class="text-danger">*</span>
                                                                    <asp:TextBox ID="txtTehsilPre" runat="server" type="text" class="form-control" placeholder="Enter Tehsil"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtTehsilPre" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Tehsil" SetFocusOnError="true" ValidationGroup="Communication"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">PinCode</label><span class="text-danger">*</span>
                                                                    <asp:TextBox ID="txtPinCodePre" runat="server" type="text" class="form-control" MaxLength="6" MinLength="6" placeholder="Enter PinCode" onkeypress="return isNumeric(event)"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtPinCodePre" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter PinCode" SetFocusOnError="true" ValidationGroup="Communication"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtPinCodePre" ID="RegularExpressionValidator7" ValidationExpression="^[0-9]{6}$" runat="server" ErrorMessage="Minimum 10 characters required." ForeColor="Red"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Mobile No</label><span class="text-danger">*</span>
                                                                    <asp:TextBox ID="txtMobileNo" runat="server" type="text" MaxLength="10" MinLength="10" class="form-control" placeholder="Enter Mobile No." onkeypress="return isNumeric(event)"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtMobileNo" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter PinCode" SetFocusOnError="true" ValidationGroup="Communication"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtMobileNo" ID="RegularExpressionValidator5" ValidationExpression="^[0-9]{10}$" runat="server" ErrorMessage="Minimum 10 characters required." ForeColor="Red"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Phone No</label>
                                                                    <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="10" MinLength="10" type="text" class="form-control" placeholder="Enter Phone No." onkeypress="return isNumeric(event)"></asp:TextBox>
                                                                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtPhoneNo" ID="RegularExpressionValidator4" ValidationExpression="^[0-9]{10}$" runat="server" ErrorMessage="Minimum 10 characters required." ForeColor="Red"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-6">
                                                <div class="card custom-shadow">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Permanent Address</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="default" class="form-label text-muted">Same As Present Address</label>
                                                                <input id="chkSame" class="form-check-input code-switcher" onchange="copyAddress()" type="checkbox" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Village/House No</label>
                                                                    <asp:TextBox ID="txtVillHouseNoPer" runat="server" type="text" class="form-control" placeholder="Enter your House No."></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Street / Sector / Post Office</label>
                                                                    <asp:TextBox ID="txtPostOfficePer" runat="server" type="text" class="form-control" placeholder="Enter Street/PostOffice..."></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Police Station</label>
                                                                    <asp:TextBox ID="txtPoliceStationPer" runat="server" type="text" class="form-control" placeholder="Enter Police Station"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-md-6" id="statePer" runat="server">
                                                                <div class="mb-3">
                                                                    <label class="form-label">State</label><span class="text-danger">*</span>
                                                                    <asp:DropDownList ID="ddlStatePer" runat="server" class="form-select" AutoPostBack="false" size="1">
                                                                        <asp:ListItem Value="0" Selected="True">--SELECT--</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="ddlStatePer" Display="Dynamic" ForeColor="Red" ErrorMessage="Select a value" SetFocusOnError="true" InitialValue="0" ValidationGroup="Communication"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-md-6" id="districtPer" runat="server">
                                                                <div class="mb-3">
                                                                    <label class="form-label">District</label><span class="text-danger">*</span>
                                                                    <asp:TextBox ID="txtDistrictPer" runat="server" type="text" class="form-control" placeholder="Enter District Name"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtDistrictPer" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter district name" SetFocusOnError="true" ValidationGroup="Communication"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-md-6" id="cityPer" runat="server">
                                                                <div class="mb-3">
                                                                    <label class="form-label">City</label><span class="text-danger">*</span>
                                                                    <asp:TextBox ID="txtCityPer" runat="server" type="text" class="form-control" placeholder="Enter City Name"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtCityPer" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter city name" SetFocusOnError="true" ValidationGroup="Communication"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Tehsil</label><span class="text-danger">*</span>
                                                                    <asp:TextBox ID="txtTehsilPer" runat="server" type="text" class="form-control" placeholder="Enter Tehsil"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtTehsilPer" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Tehsil" SetFocusOnError="true" ValidationGroup="Communication"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">PinCode</label><span class="text-danger">*</span>
                                                                    <asp:TextBox ID="txtPinCodePer" runat="server" type="text" MaxLength="6" MinLength="6" class="form-control" placeholder="Enter PinCode"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtPinCodePer" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter PinCode" SetFocusOnError="true" ValidationGroup="Communication"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtPinCodePer" ID="RegularExpressionValidator8" ValidationExpression="^[0-9]{6}$" runat="server" ErrorMessage="Minimum 10 characters required." ForeColor="Red"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Mobile No</label><span class="text-danger">*</span>
                                                                    <asp:TextBox ID="txtMobileNoPer" runat="server" type="text" MaxLength="10" MinLength="10" class="form-control" placeholder="Enter Mobile No." onkeypress="return isNumeric(event)"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtMobileNoPer" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter PinCode" SetFocusOnError="true" ValidationGroup="Communication"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtMobileNoPer" ID="RegularExpressionValidator2" ValidationExpression="^[0-9]{10}$" runat="server" ErrorMessage="Minimum 10 characters required." ForeColor="Red"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Phone No</label>
                                                                    <asp:TextBox ID="txtPhoneNoPer" runat="server" type="text" MaxLength="10" MinLength="10" class="form-control" placeholder="Enter Phone No." onkeypress="return isNumeric(event)"></asp:TextBox>
                                                                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtPhoneNoPer" ID="RegularExpressionValidator3" ValidationExpression="^[0-9]{10}$" runat="server" ErrorMessage="Minimum 10 characters required." ForeColor="Red"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end col -->
                                        </div>


                                        <div class="d-flex align-items-start gap-3 mt-4">
                                            <asp:Button ID="btnNextComm" type="button" runat="server" class="btn btn-success right ms-auto nexttab" ValidationGroup="Communication" OnClick="btnNextComm_Click" Text="Proceed To Next"></asp:Button>
                                        </div>
                                    </div>
                                    <!-- Communication Details Tab Panel End -->

                                    <!-- Add Family Details Tab Panel End -->
                                    <div class="tab-pane fade <% if (activeTab.Value == "3")
                                        { %>show active<% } %>"
                                        id="add-family" role="tabpanel" aria-labelledby="add-family-tab">
                                        <div>
                                            <h5 class="mb-1">Add Family Details</h5>
                                            <p class="text-muted mb-4">Please fill all information below</p>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Name</label><span class="text-danger">*</span>
                                                    <asp:TextBox ID="txtCanFamMemName" runat="server" type="text" class="form-control" placeholder="Enter Father Name"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtCanFamMemName" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Family Member Name" SetFocusOnError="true" ValidationGroup="Family"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Relation with Candidate</label><span class="text-danger">*</span>
                                                    <asp:TextBox ID="txtRelation" runat="server" type="text" class="form-control" placeholder="Enter Mother Name"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtRelation" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Relation" SetFocusOnError="true" ValidationGroup="Family"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Date of Birth</label><span class="text-danger">*</span>
                                                    <asp:TextBox ID="txtDOBFamMem" runat="server" type="date" class="form-control" placeholder="Enter Date"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtDOBFamMem" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Family Member DOB" SetFocusOnError="true" ValidationGroup="Family"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Address</label>
                                                    <asp:TextBox ID="txtFamMemAddress" runat="server" type="text" class="form-control" placeholder="Enter Address"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Mobile No</label><span class="text-danger">*</span>
                                                    <asp:TextBox ID="txtMbNo" runat="server" type="text" MaxLength="10" MinLength="10" class="form-control" placeholder="Enter Mobile No." onkeypress="return isNumeric(event)"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtMbNo" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter PinCode" SetFocusOnError="true" ValidationGroup="Family"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtMbNo" ID="RegularExpressionValidator10" ValidationExpression="^[0-9]{10}$" runat="server" ErrorMessage="Minimum 10 characters required." ForeColor="Red"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Residing With Him/Her</label>
                                                    <asp:RadioButtonList ID="rblFamilyResiding" runat="server" AutoPostBack="false" CssClass="form-control" Height="36px" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="1">Yes &nbsp &nbsp</asp:ListItem>
                                                        <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Is Dependent</label>
                                                    <asp:RadioButtonList ID="rblFamilyDependent" runat="server" AutoPostBack="false" CssClass="form-control" Height="36px" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="1">Yes &nbsp &nbsp</asp:ListItem>
                                                        <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">PFNominee</label>
                                                    <asp:RadioButtonList ID="rblPFNominee" runat="server" AutoPostBack="false" CssClass="form-control" Height="36px" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="1">Yes &nbsp &nbsp</asp:ListItem>
                                                        <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="d-flex align-items-start gap-3 mt-4">
                                            <asp:Button ID="btnFamilyNext" type="button" runat="server" class="btn btn-success right ms-auto nexttab" ValidationGroup="Family" OnClick="btnFamilyNext_Click" Text="Proceed To Next"></asp:Button>
                                        </div>
                                    </div>
                                    <!-- Add Family Details Tab Panel End -->

                                    <!-- Add Employment Details Tab Panel End -->
                                    <div class="tab-pane fade <% if (activeTab.Value == "4")
                                        { %>show active<% } %>"
                                        id="add-employment" role="tabpanel" aria-labelledby="add-employment-tab">
                                        <div>
                                            <h5 class="mb-1">Add Employment Details</h5>
                                            <p class="text-muted mb-4">Please fill all information below</p>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Client Name</label>
                                                    <asp:DropDownList ID="ddlClientName" runat="server" class="form-select" OnSelectedIndexChanged="ddlClientName_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Unit Name</label>
                                                    <asp:DropDownList ID="ddlUnitName" runat="server" class="form-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Branch Name</label>
                                                    <asp:DropDownList ID="ddlBranchName" runat="server" class="form-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Applied Designation</label>
                                                    <asp:DropDownList ID="ddlDesignation" runat="server" class="form-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="mb-3">
                                                    <label class="form-label">ESI Zone</label>
                                                    <asp:DropDownList ID="ddlESIZone" runat="server" class="form-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Zonal Office</label><span class="text-danger">*</span>
                                                    <asp:DropDownList ID="ddlZonalOffice" runat="server" class="form-select"></asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="d-flex align-items-start gap-3 mt-4">
                                            <asp:Button ID="btnAddEmployement" runat="server" type="button" class="btn btn-success right ms-auto nexttab" ValidationGroup="Employeement" OnClick="btnAddEmployement_Click" Text="Proceed To Next"></asp:Button>
                                        </div>
                                    </div>
                                    <!-- Add Employment Details Tab Panel End -->

                                    <!-- Add Physical Details Tab Panel Start -->
                                    <div class="tab-pane fade <% if (activeTab.Value == "5")
                                        { %>show active<% } %>"
                                        id="physical-details" role="tabpanel" aria-labelledby="physical-details-tab">
                                        <div>
                                            <h5 class="mb-1">Add Physical Details</h5>
                                            <p class="text-muted mb-4">Please fill all information below</p>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Height (cm.)</label>
                                                    <asp:TextBox ID="txtHeight" runat="server" type="text" MaxLength="5" class="form-control" placeholder="Enter Height" onkeypress="return isNumeric(event)"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Weight (kg.)</label>
                                                    <asp:TextBox ID="txtWeight" runat="server" type="text" MaxLength="3" class="form-control" placeholder="Enter Weight" onkeypress="return isNumeric(event)"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Color</label>
                                                    <asp:TextBox ID="txtColour" runat="server" type="text" class="form-control" placeholder="Enter Color"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Blood Group</label>
                                                    <asp:DropDownList ID="ddlPhysicalBloodGroup" runat="server" CssClass="form-select">
                                                        <asp:ListItem disabled="">Select</asp:ListItem>
                                                        <asp:ListItem Value="A+">A+</asp:ListItem>
                                                        <asp:ListItem Value="A-">A-</asp:ListItem>
                                                        <asp:ListItem Value="A1+">A1+</asp:ListItem>
                                                        <asp:ListItem Value="A1-">A1-</asp:ListItem>
                                                        <asp:ListItem Value="A1B+">A1B+</asp:ListItem>
                                                        <asp:ListItem Value="A1B-">A1B-</asp:ListItem>
                                                        <asp:ListItem Value="A2+">A2+</asp:ListItem>
                                                        <asp:ListItem Value="A2-">A2-</asp:ListItem>
                                                        <asp:ListItem Value="A2B+">A2B+</asp:ListItem>
                                                        <asp:ListItem Value="A2B-">A2B-</asp:ListItem>
                                                        <asp:ListItem Value="B+">B+</asp:ListItem>
                                                        <asp:ListItem Value="B-">B-</asp:ListItem>
                                                        <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                                        <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                                        <asp:ListItem Value="O+">O+</asp:ListItem>
                                                        <asp:ListItem Value="O-">O-</asp:ListItem>
                                                        <asp:ListItem Selected="True">Other</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Chest</label>
                                                    <div class="d-flex">
                                                        <asp:TextBox ID="txtChestNormal" runat="server" type="text" class="form-control" MaxLength="3" placeholder="Normal" onkeypress="return isNumeric(event)"></asp:TextBox>
                                                        <asp:TextBox ID="txtChestExpanded" runat="server" type="text" class="form-control" MaxLength="3" placeholder="Expanded" onkeypress="return isNumeric(event)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Current Status of Illness</label>
                                                    <asp:TextBox ID="txtillnessStatus" runat="server" type="text" class="form-control" placeholder="Enter Status of illness"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Identity Marks</label>
                                                    <asp:TextBox ID="txtIdentityMarks" runat="server" type="text" TextMode="MultiLine" Height="36px" class="form-control" placeholder="Enter Identity Mark"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start gap-3 mt-4">
                                            <asp:Button ID="btnPhysicalDetails" runat="server" type="button" class="btn btn-success right ms-auto nexttab" ValidationGroup="Physical" OnClick="btnPhysicalDetails_Click" Text="Proceed To Next"></asp:Button>
                                        </div>
                                    </div>
                                    <!-- Add Physical Details Tab Panel Start -->

                                    <!-- Add Experience Details Tab Panel Start -->
                                    <div class="tab-pane fade <% if (activeTab.Value == "6")
                                        { %>show active<% } %>"
                                        id="add-experience" role="tabpanel" aria-labelledby="add-experience-tab">
                                        <div>
                                            <h5 class="mb-1">Add Experience Details</h5>
                                            <p class="text-muted mb-4">Please fill all information below</p>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Previous Company Name</label>
                                                    <asp:TextBox ID="txtPreviousCompany" runat="server" type="text" class="form-control" placeholder="Enter Previous Company Name"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Previous Employer's ESI Code</label>
                                                    <asp:TextBox ID="txtPreviousEmployerESI" runat="server" type="text" class="form-control" placeholder="Enter Previous ESI Code"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Location/Place</label>
                                                    <asp:TextBox ID="txtPreviousLocation" runat="server" type="text" class="form-control" placeholder="Enter Location"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Designation</label>
                                                    <asp:TextBox ID="txtPreviousDesignation" runat="server" type="text" class="form-control" placeholder="Enter Designation"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Joining Date</label>
                                                    <asp:TextBox ID="txtPreviousJoinDate" runat="server" type="date" class="form-control" placeholder="Enter Joining Date"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Resignation Date</label>
                                                    <asp:TextBox ID="txtPreviousLeftDate" runat="server" type="date" class="form-control" placeholder="Enter Resignation Date"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Last Salary Drawn</label>
                                                    <asp:TextBox ID="txtLastDrawnSalary" runat="server" type="text" class="form-control" onkeypress="return isNumeric(event)" placeholder="Enter Last Salary"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start gap-3 mt-4">
                                            <asp:Button ID="btnExperienceNext" runat="server" type="button" class="btn btn-success right ms-auto nexttab" OnClick="btnExperienceNext_Click" Text="Proceed To Next"></asp:Button>
                                        </div>
                                    </div>
                                    <!-- Add Experience Details Tab Panel Start -->

                                    <!-- Add Guarantor Details Tab Panel Start -->
                                    <div class="tab-pane fade <% if (activeTab.Value == "7")
                                        { %>show active<% } %>"
                                        id="guarantor-details" role="tabpanel" aria-labelledby="guarantor-details-tab">
                                        <div>
                                            <h5 class="mb-1">Add Guarantor Details</h5>
                                            <p class="text-muted mb-4">Please fill all information below</p>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div>
                                                    <h5 class="fs-14 mb-3 text-muted">Guarantor 1</h5>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <div class="mb-3">
                                                                <label class="form-label">Guarantor Name</label>
                                                                <asp:TextBox ID="txtNameG1" runat="server" type="text" class="form-control" placeholder="Enter Guarantor Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="mb-3">
                                                                <label class="form-label">Guarantor Father Name</label>
                                                                <asp:TextBox ID="txtFatherNameG1" runat="server" type="text" class="form-control" placeholder="Enter Guarantor Father Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="mb-3">
                                                                <label class="form-label">Guarantor Mobile No.</label>
                                                                <asp:TextBox ID="txtMobileNoG1" runat="server" type="text" class="form-control" placeholder="Enter Guarantor Mobile No." onkeypress="return isNumeric(event)"></asp:TextBox>
                                                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtMobileNoG1" ID="RegularExpressionValidator11" ValidationExpression="^[0-9]{10}$" runat="server" ErrorMessage="Minimum 10 characters required." ForeColor="Red"></asp:RegularExpressionValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="mb-3">
                                                                <label class="form-label">Guarantor Address</label>
                                                                <asp:TextBox ID="txtAddressG1" runat="server" type="text" class="form-control" placeholder="Enter Guarantor Address"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="border mt-3 border-dashed"></div>

                                                <div class="mt-4">
                                                    <h6 class="mb-3 fs-14 text-muted">Guarantor 2</h6>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <div class="mb-3">
                                                                <label class="form-label">Guarantor Name</label>
                                                                <asp:TextBox ID="txtNameG2" runat="server" type="text" class="form-control" placeholder="Enter Guarantor Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="mb-3">
                                                                <label class="form-label">Guarantor Father Name</label>
                                                                <asp:TextBox ID="txtFatherNameG2" runat="server" type="text" class="form-control" placeholder="Enter Guarantor Father Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="mb-3">
                                                                <label class="form-label">Guarantor Mobile No.</label>
                                                                <asp:TextBox ID="txtMobileNoG2" runat="server" type="text" class="form-control" placeholder="Enter Guarantor Mobile No." onkeypress="return isNumeric(event)"></asp:TextBox>
                                                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtMobileNoG2" ID="RegularExpressionValidator12" ValidationExpression="^[0-9]{10}$" runat="server" ErrorMessage="Minimum 10 characters required." ForeColor="Red"></asp:RegularExpressionValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="mb-3">
                                                                <label class="form-label">Guarantor Address</label>
                                                                <asp:TextBox ID="txtAddressG2" runat="server" type="text" class="form-control" placeholder="Enter Guarantor Address"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start gap-3 mt-4">
                                            <asp:Button ID="btnGurantorNext" runat="server" type="button" class="btn btn-success right ms-auto nexttab" OnClick="btnGurantorNext_Click" Text="Proceed To Next"></asp:Button>
                                        </div>
                                    </div>
                                    <!-- Add Guarantor Details Tab Panel Start -->

                                    <!-- Add Gunman Details Tab Panel Start -->
                                    <div class="tab-pane fade <% if (activeTab.Value == "8")
                                        { %>show active<% } %>"
                                        id="gunman-details" role="tabpanel" aria-labelledby="gunman-details-tab">
                                        <div>
                                            <h5 class="mb-1">Add Gunman Details</h5>
                                            <p class="text-muted mb-4">Please fill all information below</p>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Licence No.</label>
                                                    <asp:TextBox ID="txtLicenceNo" runat="server" type="text" class="form-control" placeholder="Enter Licence Number"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Licence Name</label>
                                                    <asp:TextBox ID="txtLicenceName" runat="server" type="text" class="form-control" placeholder="Enter Licence Name"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Weapon No.</label>
                                                    <asp:TextBox ID="txtWeponNo" runat="server" type="text" class="form-control" placeholder="Enter Weapon Number"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Weapon type</label>
                                                    <asp:DropDownList ID="ddlWeaponType" runat="server" CssClass="form-select">
                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                        <asp:ListItem Value="Rifal">Rifal</asp:ListItem>
                                                        <asp:ListItem Value="Pistol">Pistol</asp:ListItem>
                                                        <asp:ListItem Value="Others">Others</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Ammunition Stock</label>
                                                    <asp:TextBox ID="txtAmmuniStock" runat="server" type="text" class="form-control" MaxLength="2" placeholder="Enter Ammunition Stock" onkeypress="return isNumeric(event)"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Issuing Authority</label>
                                                    <asp:TextBox ID="txtissuingAuth" runat="server" type="text" class="form-control" placeholder="Enter Issuing Authority"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Licence Issue Date</label>
                                                    <asp:TextBox ID="txtIssueDate" runat="server" type="date" class="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Valid Upto</label>
                                                    <asp:TextBox ID="txtValidUpto" runat="server" type="date" class="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Licence Address</label>
                                                    <asp:TextBox ID="txtLicAddress" runat="server" type="text" TextMode="MultiLine" class="form-control" placeholder="Enter Licence Address Here..."></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start gap-3 mt-4">
                                            <asp:Button ID="btnGunmanNext" runat="server" type="button" class="btn btn-success right ms-auto nexttab" OnClick="btnGunmanNext_Click" Text="Proceed To Next"></asp:Button>
                                        </div>
                                    </div>
                                    <!-- Add Gunman Details Tab Panel Start -->

                                    <!-- Add Document Details Tab Panel Start -->
                                    <div class="tab-pane fade <% if (activeTab.Value == "9")
                                        { %>show active<% } %>"
                                        id="add-document" role="tabpanel" aria-labelledby="add-document-tab">
                                        <div>
                                            <h5 class="mb-1">Add Document Details</h5>
                                            <p class="text-muted mb-4">Please fill all information below</p>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div>
                                                    <h5 class="fs-14 mb-3 text-muted">Bank Deetails</h5>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <div class="mb-3">
                                                                <label class="form-label">Pay Mode</label>
                                                                <asp:DropDownList ID="ddlPayMode" runat="server" CssClass="form-select">
                                                                    <asp:ListItem disabled="">--Select--</asp:ListItem>
                                                                    <asp:ListItem>CASH</asp:ListItem>
                                                                    <asp:ListItem Selected="True">NEFT</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="mb-3">
                                                                <label class="form-label">Bank Name</label>
                                                                <asp:DropDownList ID="ddlBankName" runat="server" CssClass="form-select"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="ddlBankName" Display="Dynamic" ForeColor="Red" ErrorMessage="Select a value" InitialValue="0" SetFocusOnError="true" ValidationGroup="Document"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="mb-3">
                                                                <label class="form-label">Account Number</label><span class="text-danger">*</span>
                                                                <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="form-control" placeholder="Enter Account Number" onkeypress="return isNumeric(event)"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtIFSCode" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Account Number" SetFocusOnError="true" ValidationGroup="Document"></asp:RequiredFieldValidator>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtIFSCode" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Account Number" SetFocusOnError="true" ValidationGroup="GroupBank"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="mb-3">
                                                                <label class="form-label">IFSC Code</label><span class="text-danger">*</span>
                                                                <asp:TextBox ID="txtIFSCode" runat="server" type="text" class="form-control" placeholder="Enter IFSC Code" value=""></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtIFSCode" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Bank IFSC Code" SetFocusOnError="true" ValidationGroup="Document"></asp:RequiredFieldValidator>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtIFSCode" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Bank IFSC Code" SetFocusOnError="true" ValidationGroup="GroupBank"></asp:RequiredFieldValidator>
                                                                <asp:Button ID="btnVerifyBank" runat="server" type="button" class="btn btn-info btn-sm mt-1" ValidationGroup="GroupBank" OnClick="btnVerifyBank_Click" Text="Verify Bank Details"></asp:Button>
                                                                <button id="btnShowBankDetails" type="button" class="btn btn-success btn-sm mt-1 ms-1" data-bs-toggle="modal" data-bs-target="#BankModal">View Data</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="border mt-3 border-dashed"></div>

                                                <div class="mt-4">
                                                    <h6 class="mb-3 fs-14 text-muted">Upload Document</h6>
                                                    <div class="row">
                                                        <div class="col-sm-4"></div>
                                                        <div class="col-sm-4">
                                                            <label for="nameInput" class="form-label">Front Side Image</label>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label for="nameInput" class="form-label">Back Side Image</label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <div class="row align-items-baseline">
                                                                    <div class="col-lg-5">
                                                                        <label for="nameInput" class="form-label">Highest Qualification</label>
                                                                    </div>
                                                                    <div class="col-lg-7">
                                                                        <asp:DropDownList ID="ddlHighestQual" runat="server" CssClass="form-select">
                                                                            <asp:ListItem Selected="True" disabled="">--SELECT--</asp:ListItem>
                                                                            <asp:ListItem>MATRICULATION</asp:ListItem>
                                                                            <asp:ListItem>INTERMEDIATE</asp:ListItem>
                                                                            <asp:ListItem>DIPLOMA</asp:ListItem>
                                                                            <asp:ListItem>GRADUATE</asp:ListItem>
                                                                            <asp:ListItem>POST GRADUATE</asp:ListItem>
                                                                            <asp:ListItem>OTHERS</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <asp:FileUpload ID="fuHighestQualFront" runat="server" class="form-control" type="file" />
                                                                <asp:Label ID="lblQualification" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <div class="row align-items-baseline">
                                                                    <div class="col-lg-5">
                                                                        <label for="nameInput" class="form-label">ID Proof</label><span class="text-danger">*</span>
                                                                    </div>
                                                                    <div class="col-lg-7">
                                                                        <asp:DropDownList ID="ddlIdProof" runat="server" CssClass="form-select">
                                                                            <asp:ListItem Value="0" Selected="True" disabled="">--SELECT--</asp:ListItem>
                                                                            <asp:ListItem>AADHAR CARD</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="ddlIdProof" Display="Dynamic" ForeColor="Red" ErrorMessage="Select a value" InitialValue="0" SetFocusOnError="true" ValidationGroup="Document"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <asp:FileUpload ID="fuIDProofFront" runat="server" class="form-control" type="file" />
                                                                <asp:Label ID="lblIdProof" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <asp:FileUpload ID="fuIDProofBack" runat="server" class="form-control" type="file" />
                                                                <asp:Label ID="lblIdProofBack" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <div class="row align-items-baseline">
                                                                    <div class="col-lg-5">
                                                                        <label for="nameInput" class="form-label">Residential Proof</label>
                                                                    </div>
                                                                    <div class="col-lg-7">
                                                                        <asp:DropDownList ID="ddlResidential" runat="server" CssClass="form-select">
                                                                            <asp:ListItem Selected="True" disabled="">--SELECT--</asp:ListItem>
                                                                            <asp:ListItem>Voter ID Card</asp:ListItem>
                                                                            <asp:ListItem>Driving Licence</asp:ListItem>
                                                                            <asp:ListItem>Ration CARD</asp:ListItem>
                                                                            <asp:ListItem>Passport</asp:ListItem>
                                                                            <asp:ListItem>Phone Bill</asp:ListItem>
                                                                            <asp:ListItem>Electricity Bill</asp:ListItem>
                                                                            <asp:ListItem>Current Residential Proof</asp:ListItem>
                                                                            <asp:ListItem>Aadhar Card</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <asp:FileUpload ID="fuResidentFront" runat="server" class="form-control" type="file" />
                                                                <asp:Label ID="lblResidentProof" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <asp:FileUpload ID="fuResidentBack" runat="server" class="form-control" type="file" />
                                                                <asp:Label ID="lblResidentBack" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <div class="row align-items-baseline">
                                                                    <div class="col-lg-5">
                                                                        <label for="nameInput" class="form-label">Experience Letter</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <asp:FileUpload ID="fuExperience" runat="server" class="form-control" type="file" />
                                                                <asp:Label ID="lblExpLetter" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <div class="row align-items-baseline">
                                                                    <div class="col-lg-5">
                                                                        <label for="nameInput" class="form-label">Gun Licence</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <asp:FileUpload ID="fuGunLicence" runat="server" class="form-control" type="file" />
                                                                <asp:Label ID="lblGunLicence" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <div class="row align-items-baseline">
                                                                    <div class="col-lg-5">
                                                                        <label for="nameInput" class="form-label">Hands Impression</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <asp:FileUpload ID="fuHandsImpression" runat="server" class="form-control" type="file" />
                                                                <asp:Label ID="lblHandsImp" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <div class="row align-items-baseline">
                                                                    <div class="col-lg-5">
                                                                        <label for="nameInput" class="form-label">Bank Passbook</label><span class="text-danger">*</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <asp:FileUpload ID="fuBankPassbook" runat="server" class="form-control" type="file" />
                                                                <asp:Label ID="lblBankPassBook" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <div class="row align-items-baseline">
                                                                    <div class="col-lg-5">
                                                                        <label for="nameInput" class="form-label">Profile Video</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <asp:FileUpload ID="fuProfileVideo" runat="server" class="form-control" type="file" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <label class="form-label">Residential Proof ID No.</label>
                                                                <asp:TextBox ID="txtIdNumber" runat="server" type="text" class="form-control" placeholder="Enter Residential Proof ID No."></asp:TextBox>
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-4">
                                                            <div class="mb-3">
                                                                <label class="form-label">Date</label>
                                                                <asp:TextBox ID="txIdtDate" runat="server" type="date" class="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start gap-3 mt-4">
                                            <asp:Button ID="btnSave" runat="server" type="button" class="btn btn-success right ms-auto" ValidationGroup="Document" OnClick="btnSave_Click" Text="Submit"></asp:Button>
                                        </div>
                                        <!-- Add Document Details Tab Panel Start -->

                                    </div>
                                    <!-- end tab content -->

                                </div>
                                <!-- end card body -->
                            </div>
                            <!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->

                </div>
                <!-- container-fluid -->
            </div>
            <!-- End Page-content -->
        </div>
    </div>


    <!--Aadhar Modal Start -->
    <div id="AadharModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-light p-3">
                    <h5 class="modal-title" id="myModalLabel">Aadhar Data</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12">
                            <h5>Unique Identification Authority of India Government of India</h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <table class="table table-borderless mb-0 aadhar-table">
                                <tbody>
                                    <tr>
                                        <td>Name :</td>
                                        <td class="text-end">
                                            <asp:Label ID="lblName" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>DOB :</td>
                                        <td class="text-end">
                                            <asp:Label ID="lblDOB" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Gender :</td>
                                        <td class="text-end">
                                            <asp:Label ID="lblGender" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Aadhar Number :</td>
                                        <td class="text-end">
                                            <asp:Label ID="lblAadhaar" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-4">
                            <div class="row">
                                <div class="col-12">
                                    <div class="text-center">
                                        <div class="position-relative d-inline-block">
                                            <div class="avatar-lg">
                                                <div class="avatar-title bg-light rounded">
                                                    <asp:Image ID="imgUser" runat="server" CssClass="avatar-md h-auto" ImageUrl="/assets/img/Photo.jpg" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-6">
                            <table class="table table-borderless mb-0 aadhar-table">
                                <tbody>
                                    <tr>
                                        <td>House :</td>
                                        <td class="text-end">
                                            <asp:Label ID="lblHouse" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Street :</td>
                                        <td class="text-end">
                                            <asp:Label ID="lblStreet" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Landmark :</td>
                                        <td class="text-end">
                                            <asp:Label ID="lblLandmark" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Country :</td>
                                        <td class="text-end">
                                            <asp:Label ID="lblCountry" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Vill/Town/City :</td>
                                        <td class="text-end">
                                            <asp:Label ID="lblVTC" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-6">
                            <table class="table table-borderless mb-0 aadhar-table">
                                <tbody>
                                    <tr>
                                        <td>Sub District :</td>
                                        <td class="text-end">
                                            <asp:Label ID="lblSDist" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>District :</td>
                                        <td class="text-end">
                                            <asp:Label ID="lblDist" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Pincode :</td>
                                        <td class="text-end">
                                            <asp:Label ID="lblPincode" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>State :</td>
                                        <td class="text-end">
                                            <asp:Label ID="lblState" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="btnImport" runat="server" OnClick="btnImport_Click" type="button" class="btn btn-success" Text="Import"></asp:Button>
                </div>
            </div>
        </div>
    </div>
    <!-- Aadhar Modal End -->

    <!--Bank Details Modal Start -->
    <div id="BankModal" class="modal fade" tabindex="-1" aria-labelledby="myBankModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-light p-3">
                    <h5 class="modal-title" id="myBankModalLabel">Bank Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12">
                            <table class="table table-borderless mb-0 aadhar-table">
                                <tbody>
                                    <tr>
                                        <td class="w-50">Customer Name :</td>
                                        <td>
                                            <asp:Label ID="lblBankUserName" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Client Id. :</td>
                                        <td>
                                            <asp:Label ID="lblBankclient_id" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>A/C no. :</td>
                                        <td>
                                            <asp:Label ID="lblAccNo" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>IFS Code :</td>
                                        <td>
                                            <asp:Label ID="lblIFSCode" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Bank Name :</td>
                                        <td>
                                            <asp:Label ID="lblBankName" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Branch :</td>
                                        <td>
                                            <asp:Label ID="lblBranch" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Bank Address :</td>
                                        <td>
                                            <asp:Label ID="lblBankAddress" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>District :</td>
                                        <td>
                                            <asp:Label ID="lblDistrict" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>State :</td>
                                        <td>
                                            <asp:Label ID="lblBankState" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>City :</td>
                                        <td>
                                            <asp:Label ID="lblBankCity" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Bank Details Modal End -->

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderJavaScript" runat="server">

    <script src="/assets/js/countries.js"></script>

    <script>
        $(document).ready(function () {

            $("#colUAN").addClass("d-none");
            $("#<%= rdoPreUAN.ClientID %> input[type='radio']").change(function () {
                if ($(this).val() === "No") {
                    $("#colUAN").addClass("d-none");
                    $("#<%= txtPreviousUAN.ClientID %>").val("");
                } else {
                    $("#colUAN").removeClass("d-none");
                }
            });


            $("#colESI").addClass("d-none");
            $("#<%= rdoESI.ClientID %> input[type='radio']").change(function () {
                if ($(this).val() === "No") {
                    $("#colESI").addClass("d-none");
                    $("#<%= txtPreviousESICode.ClientID %>").val("");
                } else {
                    $("#colESI").removeClass("d-none");
                }
            });

            $("#colISRejoin").addClass("d-none");
            $("#<%= rblRegion.ClientID %> input[type='radio']").change(function () {
                if ($(this).val() === "No") {
                    $("#colISRejoin").addClass("d-none");
                    $("#<%= txtOldEmployeeCode.ClientID %>").val("");
                } else {
                    $("#colISRejoin").removeClass("d-none");
                }
            });

            debugger;
            $("#<%= colSpouseName.ClientID %>").addClass("d-none");
            $("#<%= ddlMarried.ClientID %>").change(function () {
                if ($(this).val() === "Married") {
                    $("#<%= colSpouseName.ClientID %>").removeClass("d-none");
                } else {
                    $("#<%= colSpouseName.ClientID %>").addClass("d-none");
                    $("#<%= txtSpouse.ClientID %>").val("");
                }
            });

        });
    </script>


    <script>
        // function to verify input is number
        function isNumeric(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }     



        // function to show the preview User Image
        function previewImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    var img = document.getElementById('<%= imgCandidate.ClientID %>');
                    img.src = e.target.result;
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        // function to open the filemanager to select image.
        function triggerFileInput() {
            var fileInput = document.getElementById('<%= avatarUpload.ClientID %>');
            fileInput.click();
        }

        // Function to show Aadhar Data Modal
        function showAadharDataModal() {
            $("#AadharModal").modal('show');
        }

        // function to copy Present Address to Permanent Address TextBoxs.
        function copyAddress() {

            var presentAddressFields = document.querySelectorAll('#<%= txtVillHouseNo.ClientID%>, #<%= txtPostOffice.ClientID%>, #<%= txtPoliceStation.ClientID%>, #<%= ddlState.ClientID%>, #<%= txtDistrict.ClientID%>, #<%= txtCity.ClientID%>, #<%= txtTehsilPre.ClientID%>, #<%= txtPinCodePre.ClientID%>, #<%= txtMobileNo.ClientID%>, #<%= txtPhoneNo.ClientID%>');
            var permanentAddressFields = document.querySelectorAll('#<%= txtVillHouseNoPer.ClientID%>, #<%= txtPostOfficePer.ClientID%>, #<%= txtPoliceStationPer.ClientID%>, #<%= ddlStatePer.ClientID%>, #<%= txtDistrictPer.ClientID%>, #<%= txtCityPer.ClientID%>, #<%= txtTehsilPer.ClientID%>, #<%= txtPinCodePer.ClientID%>, #<%= txtMobileNoPer.ClientID%>, #<%= txtPhoneNoPer.ClientID%>');
            var checkBox = document.getElementById('chkSame');

            if (checkBox.checked) {

                presentAddressFields.forEach(function (field, index) {
                    permanentAddressFields[index].value = field.value;
                });

            } else {
                permanentAddressFields.forEach(function (field) {
                    field.value = '';
                });
                var statePerDropDown = document.getElementById('<%= ddlStatePer.ClientID %>');
                statePerDropDown.value = 0;
            }
        }
    </script>

</asp:Content>



