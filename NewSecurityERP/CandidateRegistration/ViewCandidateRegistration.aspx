<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewCandidateRegistration.aspx.cs" Inherits="NewSecurityERP.CandidateRegistration.ViewCandidateRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content overflow-hidden">
        <div class="page-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="d-sm-flex align-items-center">
                                    <h5 class="card-title flex-grow-1 mb-0">Candidate Details</h5>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="border border-dashed rounded p-2">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="alert alert-success border-0 rounded-0 m-0 d-flex align-items-center" role="alert">
                                                <div class="flex-grow-1 text-truncate">
                                                    <b>Personnal Details</b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Recruitment Type : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblRecruitmentType" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Registration ID : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblRegistrationID" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Candidate Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblCandidateName" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Mother Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblMotherName" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Marital Status : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblMaritalStatus" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Date of Birth : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblDateofBirth" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Gender : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Email ID : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Recruitment Detail : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblRecruitmentDetail" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Aadhar No : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblAadharNo" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Father Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblFatherName" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Job Type : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblJobType" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Spouse Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblSpouseName" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Date of Joining : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblDOJ" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Pan No. : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPanCardNo" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Mobile No. : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblMobileNo" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2">
                                            <div class="image-container">
                                                <asp:Image ID="imgCandidate" runat="server" class="avatar-lg rounded object-fit-cover material-shadow" ImageUrl="/assets/img/Photo.jpg" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Communication Details Start -->
                                <div class="border border-dashed rounded p-2 mt-3">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="alert alert-success border-0 rounded-0 m-0 d-flex align-items-center" role="alert">
                                                <div class="flex-grow-1 text-truncate">
                                                    <b>Communication Details</b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <h5 class="fs-14 mt-3">Present Address</h5>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Village/House No : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreVillage" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Street / Sector/ Post Office : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPrePost" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Police Station : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPrePoliceStation" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>State : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreState" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>District : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreDistrict" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>City : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreCity" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Tehsil : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreTehsil" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Pin Code : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPrePinCode" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Mobile No. : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreMobileNo" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Phone No. : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPrePhoneNo" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-lg-6">
                                            <h5 class="fs-14 mt-3">Permanent Address </h5>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Village/House No : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPerVillage" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Street / Sector/ Post Office : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPerPost" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Police Station : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPerPoliceStation" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>State : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPerState" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>District : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPerDistrict" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>City : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPerCity" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Tehsil : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPerTehsil" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Pin Code : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPerPinCode" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Mobile No. : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPerMobileNo" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Phone No. : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPerPhoneNo" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- Communication Details End -->

                                <!-- Family Details Start -->
                                <div class="border border-dashed rounded p-2 mt-3">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="alert alert-success border-0 rounded-0 m-0 d-flex align-items-center" role="alert">
                                                <div class="flex-grow-1 text-truncate">
                                                    <b>Family Details</b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblFamname" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Relation with Candidate : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblFamRelation" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>is Residing With Him/Her ? : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="LblFamResiding" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>is PF Nominee ? : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblFamPfNominee" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Date of Birth : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblFamDOB" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Address : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblFamAddress" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>is Dependent ? : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblIsDependent" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Family Details End -->

                                <!-- Employement Details Start -->
                                <div class="border border-dashed rounded p-2 mt-3">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="alert alert-success border-0 rounded-0 m-0 d-flex align-items-center" role="alert">
                                                <div class="flex-grow-1 text-truncate">
                                                    <b>Employement Details</b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Client Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblClientName" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Branch Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblBranch" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Applied Catogry : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblAppliedCategory" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>ESI Zone : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblESIZone" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>is Rejoin ? : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblIsRejoin" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-lg-6">
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Unit Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblUnitName" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Unit Location : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblUnitLocation" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Applied Designation : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblAppliedDesignation" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Zonal Office : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblZonalOffice" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Old Employee Code : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblOldEmployeeCode" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Employement Details End -->

                                <!-- Physical Details Start -->
                                <div class="border border-dashed rounded p-2 mt-3">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="alert alert-success border-0 rounded-0 m-0 d-flex align-items-center" role="alert">
                                                <div class="flex-grow-1 text-truncate">
                                                    <b>Physical Details</b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Height (cm.) : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblHeight" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Color : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblColour" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Chest Normal : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblChestNormal" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Identification Mark : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblIdentMark" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Weight : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblWeight" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Blood Group : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblBloodGroup" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Chest Expanded : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblChestExpanded" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Current Status of Illness : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblillnessStatus" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Physical Details End -->

                                <!-- Experience Details Start -->
                                <div class="border border-dashed rounded p-2 mt-3">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="alert alert-success border-0 rounded-0 m-0 d-flex align-items-center" role="alert">
                                                <div class="flex-grow-1 text-truncate">
                                                    <b>Experience Details</b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Previous Company Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreviousComapany" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Location/Place : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreviousLocation" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Previous Join Date : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreviousJoinDate" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>is Previous UAN ? : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblisPreviousUAN" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>is Previous ESI ? : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblisPreviousESI" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Last Drawn Salary : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblLastDrawnSalary" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Previous Employer's ESI Code : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreviousEmployerESI" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Previous Designation : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreviousDesignation" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Previous Left Date : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreviousLeftDate" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Previous UAN No : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreviousUANNo" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Previous ESI Code : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblPreviousESICode" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Experience Details End -->

                                <!-- Guarantor Details Start -->
                                <div class="border border-dashed rounded p-2 mt-3">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="alert alert-success border-0 rounded-0 m-0 d-flex align-items-center" role="alert">
                                                <div class="flex-grow-1 text-truncate">
                                                    <b>Guarantor Details</b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <h5 class="fs-14 mt-3">Guarantor 1</h5>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblGName1" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Father Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblGFatherName1" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Mobile No : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblGMobile1" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <h5 class="fs-14 mt-3">Guarantor 2</h5>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblGName2" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Father Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblGFatherName2" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Mobile No. : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblGMobile2" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Guarantor Details End -->

                                <!-- Gunman Details Start -->
                                <div class="border border-dashed rounded p-2 mt-3">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="alert alert-success border-0 rounded-0 m-0 d-flex align-items-center" role="alert">
                                                <div class="flex-grow-1 text-truncate">
                                                    <b>Gunman Details</b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Licence No : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblLicenceNo" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Weapon No. : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblWeaponNo" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Ammunition Stock : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblAmmunitionStock" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Licence Issue Date : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblLicenceIssueDate" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Licence Address : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblLicenceAdd" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Licence Name : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblLicenceName" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Weapon Type : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblWeaponType" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Issuing Authority : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblIssueAuth" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-flex p-1">
                                                <div class="col-6"><span><b>Valid Upto : </b></span></div>
                                                <div class="col-6">
                                                    <asp:Label ID="lblValidUpto" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Gunman Details End -->

                                <!-- Document Details Start -->
                                <div class="border border-dashed rounded p-2 mt-3">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="alert alert-success border-0 rounded-0 m-0 d-flex align-items-center" role="alert">
                                                <div class="flex-grow-1 text-truncate">
                                                    <b>Document Details</b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <h5 class="fs-14 mt-3">Bank Details</h5>
                                            <div class="col-lg-6">
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>Pay Mode : </b></span></div>
                                                    <div class="col-6">
                                                        <asp:Label ID="lblPayMode" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>Account Number : </b></span></div>
                                                    <div class="col-6">
                                                        <asp:Label ID="lblAccountNo" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>Bank Address : </b></span></div>
                                                    <div class="col-6">
                                                        <asp:Label ID="lblBankAddress" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6">
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>Bank Name : </b></span></div>
                                                    <div class="col-6">
                                                        <asp:Label ID="lblBankName" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>IFS Code : </b></span></div>
                                                    <div class="col-6">
                                                        <asp:Label ID="lblIFSCCode" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-4">
                                            <div class="col-lg-6">
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>Higest Qualification : </b></span></div>
                                                    <div class="col-6">
                                                        <asp:Label ID="lblQualification" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>ID Proof : </b></span></div>
                                                    <div class="col-6">
                                                        <asp:Label ID="lblIDProof" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>Residential Proof : </b></span></div>
                                                    <div class="col-6">
                                                        <asp:Label ID="lblResiProof" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>Experience Letter : </b></span></div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>Gun Licence : </b></span></div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>Hands Impression : </b></span></div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>Bank Passbook : </b></span></div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>Residential Proof ID No. : </b></span></div>
                                                    <div class="col-6">
                                                        <asp:Label ID="lblResIdNo" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6"><span><b>Residential Proof Expiry Date : </b></span></div>
                                                    <div class="col-6">
                                                        <asp:Label ID="lblResExipryDate" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6">
                                                <div class="d-flex p-1">
                                                    <div class="col-6">
                                                        <asp:LinkButton ID="imgEducationalCertificate" runat="server" CssClass="link" Text="NA" OnClick="imgEducationalCertificate_Click" />
                                                    </div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6">
                                                        <asp:LinkButton ID="imgIDProof" runat="server" Text="NA" CssClass="link" OnClick="imgIDProof_Click" />
                                                    </div>
                                                    <div class="col-6">
                                                        <asp:LinkButton ID="imgIDProofBack" runat="server" Text="NA" CssClass="link" OnClick="imgIDProofBack_Click" />
                                                    </div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6">
                                                        <asp:LinkButton ID="imgResidentilProof" runat="server" CssClass="link" Text="NA" OnClick="imgResidentilProof_Click" />
                                                    </div>
                                                    <div class="col-6">
                                                        <asp:LinkButton ID="imgResidentialProofBack" runat="server" CssClass="link" Text="NA" OnClick="imgResidentialProofBack_Click" />
                                                    </div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6">
                                                        <asp:LinkButton ID="imgExperienceLetter" runat="server" CssClass="link" Text="NA" OnClick="imgExperienceLetter_Click" />
                                                    </div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6">
                                                        <asp:LinkButton ID="imgGunLicence" runat="server" CssClass="link" Text="NA" OnClick="imgGunLicence_Click" />
                                                    </div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6">
                                                        <asp:LinkButton ID="imgHandsImpression" runat="server" CssClass="link" Text="NA" OnClick="imgHandsImpression_Click" />
                                                    </div>
                                                </div>
                                                <div class="d-flex p-1">
                                                    <div class="col-6">
                                                        <asp:LinkButton ID="imgBankPassBook" runat="server" CssClass="link" Text="NA" OnClick="imgBankPassBook_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Document Details End -->

                                <div class="border border-dashed rounded p-2 mt-3">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="mb-3">
                                                <label class="form-label">Deviation</label>
                                                <asp:RadioButtonList ID="rblDeviation" runat="server" AutoPostBack="false" CssClass="form-control" Height="36px" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="1">Yes &nbsp &nbsp</asp:ListItem>
                                                    <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="mb-3">
                                                <label class="form-label">Remark</label>
                                                <asp:TextBox ID="txtRemark" runat="server" type="text" TextMode="MultiLine" Height="36px" class="form-control" placeholder="Enter Remark"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRemark" ValidationGroup="View" ErrorMessage="Please Enter Remark" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="mb-3">
                                                <label class="form-label">Application Remark</label>
                                                <asp:TextBox ID="txtApplicationRemark" runat="server" type="text" TextMode="MultiLine" Height="36px" class="form-control" placeholder="Enter Application Remark"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApplicationRemark" ValidationGroup="View" ErrorMessage="Please Enter Application Remark" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="mb-3">
                                                <input class="form-check-input mb-2" type="checkbox" runat="server" id="chkBoxEmpCode" onchange="toggleTextBox()">
                                                <label class="form-check-label" for="chkBoxEmpCode">
                                                    Manual EmpCode
                                                </label>
                                                <asp:TextBox ID="txtEmpCode" runat="server" type="text" class="form-control" disabled="true"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="hstack flex-wrap gap-2 mb-3 mb-lg-0 float-end">
                                                <asp:Button ID="BtnBack" runat="server" OnClick="BtnBack_Click" class="btn btn-success btn-border" Text="Back"></asp:Button>
                                                <asp:Button ID="BtnReject" runat="server" class="btn btn-success btn-border" ValidationGroup="View" OnClick="BtnReject_Click" Text="Reject"></asp:Button>
                                                <asp:Button ID="BtnCorrection" runat="server" class="btn btn-success btn-border" ValidationGroup="View" OnClick="BtnCorrection_Click" Text="Resend for Correction"></asp:Button>
                                                <asp:Button ID="BtnApprove" runat="server" class="btn btn-success btn-border" ValidationGroup="View" OnClick="BtnApprove_Click" Text="Approve"></asp:Button>
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
    </div>

    <!--Bank Details Modal Start -->
    <div id="DocumentViewModal" class="modal fade" tabindex="-1" aria-labelledby="myDocModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-light p-3">
                    <h5 class="modal-title" id="myDocModalLabel">
                        <asp:Label ID="lblDocName" runat="server" Text=""></asp:Label></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12">
                            <asp:Image ID="ImageDoc" runat="server" class="rounded object-fit-cover doc-img-height material-shadow" ImageUrl="/assets/img/Photo.jpg" />
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
    <script type="text/javascript">
        function showDocumentModal() {
            $("#DocumentViewModal").modal('show');
        }

        function toggleTextBox() {
            var checkbox = document.getElementById("chkBoxEmpCode");
            var textBoxEmpCode = document.getElementById("<%= txtEmpCode.ClientID %>");

            if (checkbox.checked) {
                textBoxEmpCode.disabled = false;
            } else {
                textBoxEmpCode.disabled = true;
                textBoxEmpCode.value = '';
            }
        }
    </script>
</asp:Content>
