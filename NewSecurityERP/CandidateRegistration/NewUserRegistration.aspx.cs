using BalLayer;
using DalLayer;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Security.Policy;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using static BalLayer.CanRegistration;
using static System.Net.Mime.MediaTypeNames;

namespace NewSecurityERP.CandidateRegistration
{
    public partial class NewUserRegistration : System.Web.UI.Page
    {
        static int CompanyID = 0;
        static int UserId = 0;
        static string RegistrationId = "";
        static string APIFolderPath = WebConfigurationManager.AppSettings.Get("APIFolderPath");
        static string APIURL = WebConfigurationManager.AppSettings.Get("APIURL");

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(Convert.ToString(Session["CompanyID"])))
                {
                    CompanyID = Convert.ToInt32(Session["CompanyID"]);
                    UserId = Convert.ToInt32(Session["UserID"]);

                    if (!IsPostBack)
                    {
                        BindStateMaster();
                        BindBankMaster();
                        BindClientMaster();
                        BindBranchMaster();
                        BindDesignationMaster();
                        BindESIZoneMaster();
                        BindZonalOfficeMaster();


                        string RegId = Request.QueryString["RegId"];
                        string AadharNo = Request.QueryString["AadharNo"];
                        if (!string.IsNullOrEmpty(RegId) && !string.IsNullOrEmpty(AadharNo))
                        {
                            CanRegistration can = new CanRegistration();
                            DataTable dt = can.GetCandidateDetails(RegId, AadharNo, CompanyID.ToString());

                            if (dt.Rows.Count > 0)
                            {
                                if (!string.IsNullOrEmpty(dt.Rows[0]["Stage"].ToString()))
                                {
                                    string ActiveTabIndex = dt.Rows[0]["Stage"].ToString();

                                    activeTab.Value = ActiveTabIndex;

                                    FillData(dt);
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void FillData(DataTable dt)
        {
            register_details.Style["display"] = "block";
            RegistrationId = dt.Rows[0]["RegistrationID"].ToString();

            lblCan_RegId.Text = dt.Rows[0]["RegistrationID"].ToString();
            lblCan_adharNo.Text = dt.Rows[0]["AadharCardNo"].ToString();
            lblCan_Name.Text = dt.Rows[0]["CandidateName"].ToString();
            lblCan_FatherName.Text = dt.Rows[0]["FatherName"].ToString();


            /*----------- Personnal Details -----------*/

            txtRegistrationID.Text = dt.Rows[0]["RegistrationID"].ToString();
            txtAadharNo.Text = dt.Rows[0]["AadharCardNo"].ToString();
            ddlSalutation.SelectedValue = dt.Rows[0]["Salutation"].ToString();
            txtCandidateName.Text = dt.Rows[0]["CandidateName"].ToString();
            txtFatherName.Text = dt.Rows[0]["FatherName"].ToString();
            imgCandidate.ImageUrl = "/assets/img/EmpPhoto/" + Convert.ToString(dt.Rows[0]["EmpPhotoDOC"]);
            txtMotherName.Text = dt.Rows[0]["MotherName"].ToString();
            DateTime dateOfBirth;
            if (DateTime.TryParse(dt.Rows[0]["DateofBirth"].ToString(), out dateOfBirth))
            {
                txtDateofBirth.Text = dateOfBirth.ToString("yyyy-MM-dd");
            }
            ddlGender.SelectedValue = dt.Rows[0]["Gender"].ToString();
            ddlMarried.SelectedValue = dt.Rows[0]["MaritalStatus"].ToString();
            if (ddlMarried.SelectedValue == "married")
            {
                txtSpouse.Text = dt.Rows[0]["SpouseName"].ToString();
                colSpouseName.Attributes.Remove("d-none");
            }
            DateTime dateofjoin;
            if (DateTime.TryParse(dt.Rows[0]["DOJ"].ToString(), out dateofjoin))
            {
                txtDoj.Text = dateofjoin.ToString("yyyy-MM-dd");
            }
            ddlJobType.SelectedValue = dt.Rows[0]["JobType"].ToString();
            txtPANNo.Text = dt.Rows[0]["PanNo"].ToString();
            txtEmail.Text = dt.Rows[0]["EmailID"].ToString();
            rdoPreUAN.SelectedIndex = Convert.ToString(dt.Rows[0]["PreviousUAN"]) == "Yes" ? 0 : 1;
            rdoESI.SelectedIndex = Convert.ToString(dt.Rows[0]["PreviousESI"]) == "Yes" ? 0 : 1;
            rblRegion.SelectedIndex = Convert.ToString(dt.Rows[0]["IsRejoin"]) == "Yes" ? 0 : 1;
            txtPreviousUAN.Text = dt.Rows[0]["PreUANNo"].ToString();
            txtPreviousESICode.Text = dt.Rows[0]["PreESICode"].ToString();
            txtOldEmployeeCode.Text = dt.Rows[0]["OldEmpCode"].ToString();

            /*----------- Communication Details Present Address -----------*/

            txtVillHouseNo.Text = dt.Rows[0]["VillHouseNo"].ToString();
            txtPostOffice.Text = dt.Rows[0]["PostOffice"].ToString();
            txtPoliceStation.Text = dt.Rows[0]["PoliceStation"].ToString();
            ddlState.SelectedValue = dt.Rows[0]["StateCode"].ToString();
            txtDistrict.Text = dt.Rows[0]["Districts"].ToString();
            txtCity.Text = dt.Rows[0]["CityName"].ToString();
            txtTehsilPre.Text = dt.Rows[0]["TehsilPre"].ToString();
            txtPinCodePre.Text = dt.Rows[0]["PinCodePre"].ToString();
            txtMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
            txtPhoneNo.Text = dt.Rows[0]["PhoneNo"].ToString();


            /*----------- Communication Details Permanent Address -----------*/

            txtVillHouseNoPer.Text = dt.Rows[0]["VillHouseNoPer"].ToString();
            txtPostOfficePer.Text = dt.Rows[0]["PostOfficePer"].ToString();
            txtPoliceStationPer.Text = dt.Rows[0]["PoliceStationPer"].ToString();
            ddlStatePer.SelectedValue = dt.Rows[0]["StateCodePer"].ToString();
            txtDistrictPer.Text = dt.Rows[0]["DistrictsPer"].ToString();
            txtCityPer.Text = dt.Rows[0]["CityNamePer"].ToString();
            txtTehsilPer.Text = dt.Rows[0]["TehsilPer"].ToString();
            txtPinCodePer.Text = dt.Rows[0]["PinCodePer"].ToString();
            txtMobileNoPer.Text = dt.Rows[0]["MobileNoPer"].ToString();
            txtPhoneNoPer.Text = dt.Rows[0]["PhoneNoPer"].ToString();

            /*----------- Family Details -----------*/

            txtCanFamMemName.Text = dt.Rows[0]["NoName"].ToString();
            txtRelation.Text = dt.Rows[0]["NoRelation"].ToString();
            DateTime famDOB;
            if (DateTime.TryParse(dt.Rows[0]["NoDOB"].ToString(), out famDOB))
            {
                txtDOBFamMem.Text = famDOB.ToString("yyyy-MM-dd");
            }
            txtFamMemAddress.Text = dt.Rows[0]["NoAddress"].ToString();
            txtMbNo.Text = dt.Rows[0]["FamilyMobileNo"].ToString();
            if (!string.IsNullOrEmpty(dt.Rows[0]["NoResWith"].ToString()))
                rblFamilyResiding.SelectedIndex = Convert.ToString(dt.Rows[0]["NoResWith"]) == "Yes" ? 0 : 1;
            else
                rblFamilyResiding.SelectedIndex = 1;
            if (!string.IsNullOrEmpty(dt.Rows[0]["NoIsDep"].ToString()))
                rblFamilyDependent.SelectedIndex = Convert.ToString(dt.Rows[0]["NoIsDep"]) == "Yes" ? 0 : 1;
            else
                rblFamilyDependent.SelectedIndex = 1;
            if (!string.IsNullOrEmpty(dt.Rows[0]["NoIsDep"].ToString()))
                rblPFNominee.SelectedIndex = Convert.ToString(dt.Rows[0]["NoIsPF"]) == "Yes" ? 0 : 1;
            else
                rblPFNominee.SelectedIndex = 1;

            /*----------- Employeement Details -----------*/

            ddlClientName.SelectedValue = dt.Rows[0]["ClientCode"].ToString();
            ddlUnitName.SelectedValue = dt.Rows[0]["UnitCode"].ToString();
            ddlBranchName.SelectedValue = dt.Rows[0]["BranchCode"].ToString();
            ddlDesignation.SelectedValue = dt.Rows[0]["Desicode"].ToString();
            ddlESIZone.SelectedValue = dt.Rows[0]["EsiZoneCode"].ToString();
            // ddlZonalOffice.SelectedValue = dt.Rows[0]["ZonalOffice"].ToString();

            /*----------- Physical Details -----------*/

            txtHeight.Text = dt.Rows[0]["Height"].ToString();
            txtWeight.Text = dt.Rows[0]["Weight"].ToString();
            txtColour.Text = dt.Rows[0]["Colour"].ToString();
            //if (!string.IsNullOrEmpty(dt.Rows[0]["BloodGroup"].ToString()))
            //    ddlPhysicalBloodGroup.Items.FindByText(Convert.ToString(dt.Rows[0]["BloodGroup"])).Selected = true;

            string blood = dt.Rows[0]["BloodGroup"].ToString();
            ddlPhysicalBloodGroup.SelectedValue = dt.Rows[0]["BloodGroup"].ToString();
            txtChestNormal.Text = dt.Rows[0]["ChestNormal"].ToString();
            txtChestExpanded.Text = dt.Rows[0]["ChestExpanded"].ToString();
            txtillnessStatus.Text = dt.Rows[0]["CurrentStatusofIllness"].ToString();
            txtIdentityMarks.Text = dt.Rows[0]["IdentityMarks"].ToString();

            /*----------- Experience Details -----------*/

            txtPreviousCompany.Text = dt.Rows[0]["PreCompanyWorked"].ToString();
            txtPreviousEmployerESI.Text = dt.Rows[0]["PreEmployerEsiCode"].ToString();
            txtPreviousLocation.Text = dt.Rows[0]["PreLocation"].ToString();
            txtPreviousDesignation.Text = dt.Rows[0]["PreDesination"].ToString();
            DateTime JoinDate;
            if (DateTime.TryParse(dt.Rows[0]["PreJoinDate"].ToString(), out JoinDate))
            {
                txtPreviousJoinDate.Text = JoinDate.ToString("yyyy-MM-dd");
            }
            DateTime LeftDate;
            if (DateTime.TryParse(dt.Rows[0]["PreLeftDate"].ToString(), out LeftDate))
            {
                txtPreviousLeftDate.Text = LeftDate.ToString("yyyy-MM-dd");
            }
            txtLastDrawnSalary.Text = dt.Rows[0]["PreLastDrawnSalary"].ToString();

            /*----------- Guarantor Details -----------*/

            txtNameG1.Text = dt.Rows[0]["GOneName"].ToString();
            txtFatherNameG1.Text = dt.Rows[0]["GOneFatherName"].ToString();
            txtMobileNoG1.Text = dt.Rows[0]["GOneMobileNo"].ToString();
            txtAddressG1.Text = dt.Rows[0]["GOneAddress"].ToString();
            txtNameG2.Text = dt.Rows[0]["GTwoName"].ToString();
            txtFatherNameG2.Text = dt.Rows[0]["GTwoFatherName"].ToString();
            txtMobileNoG2.Text = dt.Rows[0]["GTwoMobileNo"].ToString();
            txtAddressG2.Text = dt.Rows[0]["GTwoAddress"].ToString();

            /*----------- GunMan Details -----------*/

            txtLicenceNo.Text = dt.Rows[0]["LicenceNo"].ToString();
            txtLicenceName.Text = dt.Rows[0]["LicenceName"].ToString();
            txtWeponNo.Text = dt.Rows[0]["WeaponNo"].ToString();
            ddlWeaponType.SelectedValue = dt.Rows[0]["WeaponType"].ToString();
            txtAmmuniStock.Text = dt.Rows[0]["AmmunitionStock"].ToString();
            txtissuingAuth.Text = dt.Rows[0]["IssuingAuthority"].ToString();
            if (DateTime.TryParse(dt.Rows[0]["LicenceIssueDate"].ToString(), out DateTime IssueDate))
            {
                txtIssueDate.Text = IssueDate.ToString("yyyy-MM-dd");
            }
            if (DateTime.TryParse(dt.Rows[0]["ValidUpto"].ToString(), out DateTime ValidDate))
            {
                txtValidUpto.Text = ValidDate.ToString("yyyy-MM-dd");
            }
            txtLicAddress.Text = dt.Rows[0]["LicenceAddress"].ToString();

            /*----------- Document Details -----------*/

            if (!string.IsNullOrEmpty(dt.Rows[0]["PayMode"].ToString()))
                ddlPayMode.Items.FindByText(Convert.ToString(dt.Rows[0]["PayMode"])).Selected = true;
            ddlBankName.SelectedValue = dt.Rows[0]["BankCode"].ToString();
            txtAccountNumber.Text = dt.Rows[0]["AccNo"].ToString();
            txtIFSCode.Text = dt.Rows[0]["IFSCCode"].ToString();
            txtIdNumber.Text = dt.Rows[0]["ResidentialDocmentNo"].ToString();
            if (DateTime.TryParse(dt.Rows[0]["ResiDocExpDate"].ToString(), out DateTime ResDocExpDate))
            {
                txIdtDate.Text = ResDocExpDate.ToString("yyyy-MM-dd");
            }

            ddlHighestQual.SelectedValue = dt.Rows[0]["Qualification"].ToString();
            ddlIdProof.SelectedValue = dt.Rows[0]["IDProof"].ToString();
            ddlResidential.SelectedValue = dt.Rows[0]["ResidentProof"].ToString();
            lblQualification.Text = dt.Rows[0]["EduCertificationDOC"].ToString();
            lblIdProof.Text = dt.Rows[0]["IDProofDOC"].ToString();
            lblIdProofBack.Text = dt.Rows[0]["IDProofBackDoc"].ToString();
            lblResidentProof.Text = dt.Rows[0]["ResidentialProofDOC"].ToString();
            lblResidentBack.Text = dt.Rows[0]["ResidentialProofBackDOC"].ToString();
            lblExpLetter.Text = dt.Rows[0]["ExpLetterDOC"].ToString();
            lblGunLicence.Text = dt.Rows[0]["GunLicenceDOC"].ToString();
            lblHandsImp.Text = dt.Rows[0]["HandsImpressionDOC"].ToString();
            lblBankPassBook.Text = dt.Rows[0]["PassBookDoc"].ToString();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            string fileName = "";
            try
            {
                if (avatarUpload.PostedFile != null)
                {
                    int contentLength = avatarUpload.PostedFile.ContentLength;
                    if (contentLength != 0)
                    {
                        string contentType = avatarUpload.PostedFile.ContentType;
                        string Ext = System.IO.Path.GetExtension(avatarUpload.PostedFile.FileName);
                        DateTime now = DateTime.Now;
                        string formattedDate = now.ToString("ddMMyyyy");
                        string formattedTime = now.ToString("HHmm");
                        fileName = $"Photo_{formattedDate}_{formattedTime}_{UserId}{Ext}";
                        avatarUpload.PostedFile.SaveAs(APIFolderPath + "EmployeePhoto/" + fileName);
                    }
                }

                ConsumeApi objConsumeApi = new ConsumeApi();
                string resultMsg = "";
                string AadharNo = txtAadharNo.Text;
                string Salutation = ddlSalutation.SelectedValue;
                string Name = txtCandidateName.Text;
                string FatherName = txtFatherName.Text;
                string MotherName = txtMotherName.Text;
                string DOB = txtDateofBirth.Text;
                string Gender = ddlGender.SelectedItem.Text;
                string MaritalSts = ddlMarried.SelectedItem.Text;
                string spouseName = txtSpouse.Text;
                string DOJ = txtDoj.Text;
                string JobType = ddlJobType.SelectedItem.Text;
                string PanNo = txtPANNo.Text;
                string Email = txtEmail.Text;
                string isPreUAN = rdoPreUAN.SelectedItem.Text;
                string PreUAN = txtPreviousUAN.Text;
                string isPreESI = rdoESI.SelectedItem.Text;
                string preESICode = txtPreviousESICode.Text;
                string RegId = string.IsNullOrEmpty(txtRegistrationID.Text) ? "0" : txtRegistrationID.Text;
                string AadharVerified = string.IsNullOrEmpty(txtOTP.Text) ? "1" : txtOTP.Text;
                string isRejoin = rblRegion.SelectedIndex == 0 ? "Yes" : "No";
                string OldEmpCode = txtOldEmployeeCode.Text;
                string EmpPhoto = fileName;
                string TranSactionType = "1";

                if (RegId != "0")
                {
                    TranSactionType = "2";
                }

                string apiUrl = APIURL + "//api//CandidateRegistration//AddCandidate?PageType=1&TransactionType=" + TranSactionType + "&CandidateName=" + Name + "&AadharNo=" + AadharNo + "&Salutation=" + Salutation + "&JobType=" + JobType + "&DateofBirth=" + DOB + "&DOJ=" + DOJ + "&Gender=" + Gender + "&MaritalStatus=" + MaritalSts + "&FatherName=" + FatherName + "&MotherName=" + MotherName + "&SpouseName=" + spouseName + "&PanNo=" + PanNo + "&EmailID=" + Email + "&PreviousUAN=" + isPreUAN + "&PreUANNo=" + PreUAN + "&PreviousESI=" + isPreESI + "&PreESICode=" + preESICode + "&flag=" + AadharVerified + "&IsRejoin=" + isRejoin + "&txtOldEmpCode=" + OldEmpCode + "&EmpPhotoDOC=" + EmpPhoto + "&CompanyID=" + CompanyID + "&RegistrationID=" + RegId + "&UserID=" + UserId + "&RegStatus=InComplete";

                ConsumeApi objConsumeApi1 = new ConsumeApi();
                string resultMsg1 = objConsumeApi.ConsumePostApi(apiUrl);
                string regID = "";

                using (var ms = new MemoryStream(Encoding.Unicode.GetBytes(resultMsg1)))
                {
                    DataContractJsonSerializer deserializer = new DataContractJsonSerializer(typeof(Response));
                    Response objResponse = (Response)deserializer.ReadObject(ms);
                    resultMsg = objResponse.OutputMessage;
                    regID = objResponse.Data;
                    RegistrationId = regID;
                    txtRegistrationID.Text = regID;
                }

                if (resultMsg == "Candidate data saved successfuly!" || resultMsg == "Candidate data updated successfuly!")
                {
                    activeTab.Value = "2";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", $"<script>warning({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void btnNextComm_Click(object sender, EventArgs e)
        {
            try
            {
                string VillagePresent = string.IsNullOrEmpty(txtVillHouseNo.Text) ? "" : txtVillHouseNo.Text;
                string PostPresent = string.IsNullOrEmpty(txtPostOffice.Text) ? "" : txtPostOffice.Text;
                string PoliceStationPre = string.IsNullOrEmpty(txtPoliceStation.Text) ? "" : txtPoliceStation.Text;
                string StatePresent = ddlState.SelectedValue;
                string DistrictPre = txtDistrict.Text;
                string CityPre = txtCity.Text;
                string TehsilPresent = string.IsNullOrEmpty(txtTehsilPre.Text) ? "" : txtTehsilPre.Text;
                string PinCodePresent = string.IsNullOrEmpty(txtPinCodePre.Text) ? "" : txtPinCodePre.Text;
                string MobilePresent = string.IsNullOrEmpty(txtMobileNo.Text) ? "" : txtMobileNo.Text;
                string PhonePresent = string.IsNullOrEmpty(txtPhoneNo.Text) ? "" : txtPhoneNo.Text;

                string VillagePermanent = string.IsNullOrEmpty(txtVillHouseNoPer.Text) ? "" : txtVillHouseNoPer.Text;
                string PostPermanent = string.IsNullOrEmpty(txtPostOfficePer.Text) ? "" : txtPostOfficePer.Text;
                string PoliceStationPermanent = string.IsNullOrEmpty(txtPoliceStationPer.Text) ? "" : txtPoliceStationPer.Text;
                string StatePermanent = ddlStatePer.SelectedValue;
                string DistrictPer = txtDistrictPer.Text;
                string CityPer = txtCityPer.Text;
                string TehsilPermanent = string.IsNullOrEmpty(txtTehsilPer.Text) ? "" : txtTehsilPer.Text;
                string PinCodePermanent = string.IsNullOrEmpty(txtPinCodePer.Text) ? "" : txtPinCodePer.Text;
                string MobilePermanent = string.IsNullOrEmpty(txtMobileNoPer.Text) ? "" : txtMobileNoPer.Text;
                string PhonePermanent = string.IsNullOrEmpty(txtPhoneNoPer.Text) ? "" : txtPhoneNoPer.Text;

                string RegId = RegistrationId;


                string apiUrl = APIURL + "//api//CandidateRegistration//AddCandidate?PageType=2&TransactionType=2&VillHouseNo=" +
                    VillagePresent + "&PostOffice=" + PostPresent + "&PoliceStation=" + PoliceStationPre + "&StateID=" + StatePresent + "&DistrictPre="
                    + DistrictPre + "&CityPre=" + CityPre + "&MobileNo=" + MobilePresent + "&PhoneNo=" + PhonePresent + "&TehsilPre=" + TehsilPresent +
                    "&PinCodePre=" + PinCodePresent + "&VillHouseNoPer=" + VillagePermanent + "&PostOfficePer=" + PostPermanent + "&PoliceStationPer="
                    + PoliceStationPermanent + "&StateIDPer=" + StatePermanent + "&DistrictPer=" + DistrictPer + "&CityPer=" + CityPer +
                    "&MobileNoPer=" + MobilePermanent + "&PhoneNoPer=" + PhonePermanent + "&TehsilPer=" + TehsilPermanent + "&PinCodePer=" +
                    PinCodePermanent + "&RegistrationID=" + RegId + "&RegStatus=InComplete&UserID=" + UserId + "&CompanyID=" + CompanyID + "";

                ConsumeApi objConsumeApi = new ConsumeApi();
                string resultMsg = objConsumeApi.ConsumePostApi(apiUrl);
                string regID = "";

                using (var ms = new MemoryStream(Encoding.Unicode.GetBytes(resultMsg)))
                {

                    DataContractJsonSerializer deserializer = new DataContractJsonSerializer(typeof(Response));
                    Response objResponse = (Response)deserializer.ReadObject(ms);
                    resultMsg = objResponse.OutputMessage;
                    regID = objResponse.Data;
                }
                if (resultMsg == "Candidate data updated successfuly!")
                {
                    activeTab.Value = "3";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void btnFamilyNext_Click(object sender, EventArgs e)
        {
            try
            {
                string FamilyName = txtCanFamMemName.Text;
                string RelationWith = txtRelation.Text;
                string DateOfBirth = txtDOBFamMem.Text;
                string Address = txtFamMemAddress.Text;
                string FamilyMobileNo = txtMbNo.Text;
                string isResidingWith = rblFamilyResiding.SelectedIndex == 0 ? "Yes" : "No";
                string isDependent = rblFamilyDependent.SelectedIndex == 0 ? "Yes" : "No";
                string PfNominee = rblPFNominee.SelectedIndex == 0 ? "1" : "0";
                string RegId = RegistrationId;

                string apiUrl = APIURL + "//api//CandidateRegistration//AddCandidate?PageType=3&TransactionType=2&NoName=" + FamilyName + "&NoDOB=" + DateOfBirth + "&NoRelation=" + RelationWith + "&FamilyMobileNo=" + FamilyMobileNo + "&NoAddress=" + Address + "&NoResWith=" + isResidingWith + "&rblFamilyDependent=" + isDependent + "&chkPFNomine=" + PfNominee + "&RegistrationID=" + RegId + "&RegStatus=InComplete&UserID=" + UserId + "&CompanyID=" + CompanyID + "";

                ConsumeApi objConsumeApi = new ConsumeApi();
                string resultMsg = objConsumeApi.ConsumePostApi(apiUrl);
                string regID = "";

                using (var ms = new MemoryStream(Encoding.Unicode.GetBytes(resultMsg)))
                {
                    DataContractJsonSerializer deserializer = new DataContractJsonSerializer(typeof(Response));
                    Response objResponse = (Response)deserializer.ReadObject(ms);
                    resultMsg = objResponse.OutputMessage;
                    regID = objResponse.Data;
                }

                if (resultMsg == "Candidate data updated successfuly!")
                {
                    activeTab.Value = "4";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void btnAddEmployement_Click(object sender, EventArgs e)
        {
            try
            {
                string ClientCode = ddlClientName.SelectedIndex > 0 ? ddlClientName.SelectedValue : "";
                string UnitName = ddlUnitName.SelectedIndex > 0 ? ddlUnitName.SelectedValue : "";
                string BranchName = ddlBranchName.SelectedIndex > 0 ? ddlBranchName.SelectedValue : "";
                string CategoryCode = "GUARD";
                string DesigCode = ddlDesignation.SelectedIndex > 0 ? ddlDesignation.SelectedValue : "";
                string ESIZone = ddlESIZone.SelectedIndex > 0 ? ddlESIZone.SelectedValue : "";
                string ZonalOffice = ddlZonalOffice.SelectedIndex > 0 ? ddlZonalOffice.SelectedValue : "";

                string RegId = RegistrationId;

                string apiUrl = APIURL + "//api//CandidateRegistration//AddCandidate?PageType=4&TransactionType=2&ClientCode=" + ClientCode + "&Unitcode=" + UnitName + "&ddlBranch=" + BranchName + "&ddlCategory=" + CategoryCode + "&ddlDesignation=" + DesigCode + "&ddlESIZone=" + ESIZone + "&ddlZoffice=" + ZonalOffice + "&RegistrationID=" + RegId + "&RegStatus=InComplete&UserID=" + UserId + "&CompanyID=" + CompanyID + "";

                ConsumeApi objConsumeApi = new ConsumeApi();
                string resultMsg = objConsumeApi.ConsumePostApi(apiUrl);
                string regID = "";

                using (var ms = new MemoryStream(Encoding.Unicode.GetBytes(resultMsg)))
                {
                    DataContractJsonSerializer deserializer = new DataContractJsonSerializer(typeof(Response));
                    Response objResponse = (Response)deserializer.ReadObject(ms);
                    resultMsg = objResponse.OutputMessage;
                    regID = objResponse.Data;
                }

                if (resultMsg == "Candidate data updated successfuly!")
                {
                    activeTab.Value = "5";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void btnPhysicalDetails_Click(object sender, EventArgs e)
        {
            try
            {
                string Height = txtHeight.Text;
                string Weight = txtWeight.Text;
                string Colour = string.IsNullOrEmpty(txtColour.Text) ? "" : txtColour.Text;
                string BloodGroup = ddlPhysicalBloodGroup.SelectedValue;
                string ChestNormal = string.IsNullOrEmpty(txtChestNormal.Text) ? "0" : txtChestNormal.Text;
                string ChestExpaned = string.IsNullOrEmpty(txtChestExpanded.Text) ? "0" : txtChestExpanded.Text;
                string illnessStatus = string.IsNullOrEmpty(txtillnessStatus.Text) ? "" : txtillnessStatus.Text;
                string IdentMark = string.IsNullOrEmpty(txtIdentityMarks.Text) ? "" : txtIdentityMarks.Text;
                string RegId = RegistrationId;

                string apiUrl = APIURL + "//api//CandidateRegistration//AddCandidate?PageType=5&TransactionType=2&IdentityMark=" + IdentMark + "&BloodGroup=" + BloodGroup + "&Height=" + Height + "&Weight=" + Weight + "&ChestNormal=" + ChestNormal + "&ChestExpanded=" + ChestExpaned + "&CurrentStatusofIllness=" + illnessStatus + "&Colour=" + Colour + "&RegistrationID=" + RegId + "&RegStatus=InComplete&UserID=" + UserId + "&CompanyID=" + CompanyID + "";

                ConsumeApi objConsumeApi = new ConsumeApi();
                string resultMsg = objConsumeApi.ConsumePostApi(apiUrl);
                string regID = "";

                using (var ms = new MemoryStream(Encoding.Unicode.GetBytes(resultMsg)))
                {
                    DataContractJsonSerializer deserializer = new DataContractJsonSerializer(typeof(Response));
                    Response objResponse = (Response)deserializer.ReadObject(ms);
                    resultMsg = objResponse.OutputMessage;
                    regID = objResponse.Data;
                }

                if (resultMsg == "Candidate data updated successfuly!")
                {
                    activeTab.Value = "6";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void btnExperienceNext_Click(object sender, EventArgs e)
        {
            try
            {
                string CompanyName = string.IsNullOrEmpty(txtPreviousCompany.Text) ? "" : txtPreviousCompany.Text;
                string PreEmployersESICode = string.IsNullOrEmpty(txtPreviousEmployerESI.Text) ? "" : txtPreviousEmployerESI.Text;
                string Location = string.IsNullOrEmpty(txtPreviousLocation.Text) ? "" : txtPreviousLocation.Text;
                string Designation = string.IsNullOrEmpty(txtPreviousDesignation.Text) ? "" : txtPreviousDesignation.Text;
                string PreJoinDate = string.IsNullOrEmpty(txtPreviousJoinDate.Text) ? "" : txtPreviousJoinDate.Text;
                string PreLeftDate = string.IsNullOrEmpty(txtPreviousLeftDate.Text) ? "" : txtPreviousLeftDate.Text;
                string LastDrawnSalary = string.IsNullOrEmpty(txtLastDrawnSalary.Text) ? "" : txtLastDrawnSalary.Text;
                string RegId = RegistrationId;

                string apiUrl = APIURL + "//api//CandidateRegistration//AddCandidate?PageType=6&TransactionType=2&PreCompanyWorked=" + CompanyName + "&PreEmployerEsiCode=" + PreEmployersESICode + "&PreLocation=" + Location + "&PreDesination=" + Designation + "&PreJoinDate=" + PreJoinDate + "&PreLeftDate=" + PreLeftDate + "&PreLastDrawnSalary=" + LastDrawnSalary + "&RegistrationID=" + RegId + "&RegStatus=InComplete&UserID=" + UserId + "&CompanyID=" + CompanyID + "";

                ConsumeApi objConsumeApi = new ConsumeApi();
                string resultMsg = objConsumeApi.ConsumePostApi(apiUrl);
                string regID = "";

                using (var ms = new MemoryStream(Encoding.Unicode.GetBytes(resultMsg)))
                {
                    DataContractJsonSerializer deserializer = new DataContractJsonSerializer(typeof(Response));
                    Response objResponse = (Response)deserializer.ReadObject(ms);
                    resultMsg = objResponse.OutputMessage;
                    regID = objResponse.Data;
                }

                if (resultMsg == "Candidate data updated successfuly!")
                {
                    activeTab.Value = "7";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void btnGurantorNext_Click(object sender, EventArgs e)
        {
            try
            {
                string GName1 = string.IsNullOrEmpty(txtNameG1.Text) ? "" : txtNameG1.Text;
                string GFatherName1 = string.IsNullOrEmpty(txtFatherNameG1.Text) ? "" : txtFatherNameG1.Text;
                string GMobile1 = string.IsNullOrEmpty(txtMobileNoG1.Text) ? "" : txtMobileNoG1.Text;
                string GAddress1 = string.IsNullOrEmpty(txtAddressG1.Text) ? "" : txtAddressG1.Text;
                string GName2 = string.IsNullOrEmpty(txtNameG2.Text) ? "" : txtNameG2.Text;
                string GFatherName2 = string.IsNullOrEmpty(txtFatherNameG2.Text) ? "" : txtFatherNameG2.Text;
                string GMobile2 = string.IsNullOrEmpty(txtMobileNoG2.Text) ? "" : txtMobileNoG2.Text;
                string GAddress2 = string.IsNullOrEmpty(txtAddressG2.Text) ? "" : txtAddressG2.Text;
                string RegId = RegistrationId;

                string apiUrl = APIURL + "//api//CandidateRegistration//AddCandidate?PageType=7&TransactionType=2&GOneName=" + GName1 + "&GOneFatherName=" + GFatherName1 + "&GOneMobileNo=" + GMobile1 + "&GTwoName=" + GName2 + "&GTwoFatherName=" + GFatherName2 + "&GTwoMobileNo=" + GMobile2 + "&GOneAddress=" + GAddress1 + "&GTwoAddress=" + GAddress2 + "&RegistrationID=" + RegId + "&RegStatus=InComplete&UserID=" + UserId + "&CompanyID=" + CompanyID + "";

                ConsumeApi objConsumeApi = new ConsumeApi();
                string resultMsg = objConsumeApi.ConsumePostApi(apiUrl);
                string regID = "";

                using (var ms = new MemoryStream(Encoding.Unicode.GetBytes(resultMsg)))
                {
                    DataContractJsonSerializer deserializer = new DataContractJsonSerializer(typeof(Response));
                    Response objResponse = (Response)deserializer.ReadObject(ms);
                    resultMsg = objResponse.OutputMessage;
                    regID = objResponse.Data;
                }

                if (resultMsg == "Candidate data updated successfuly!")
                {
                    activeTab.Value = "8";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void btnGunmanNext_Click(object sender, EventArgs e)
        {
            try
            {
                string LicenceNo = string.IsNullOrEmpty(txtLicenceNo.Text) ? "" : txtLicenceNo.Text;
                string LicenceName = string.IsNullOrEmpty(txtLicenceName.Text) ? "" : txtLicenceName.Text;
                string WeaponNo = string.IsNullOrEmpty(txtWeponNo.Text) ? "" : txtWeponNo.Text;
                string WeaponType = ddlWeaponType.SelectedValue;
                string AmmStock = string.IsNullOrEmpty(txtAmmuniStock.Text) ? "0" : txtAmmuniStock.Text;
                string IssuingAuthority = string.IsNullOrEmpty(txtissuingAuth.Text) ? "" : txtissuingAuth.Text;
                string LicIssueDate = string.IsNullOrEmpty(txtIssueDate.Text) ? "" : txtIssueDate.Text;
                string ValidUpTo = string.IsNullOrEmpty(txtValidUpto.Text) ? "" : txtValidUpto.Text;
                string LicAddress = string.IsNullOrEmpty(txtLicAddress.Text) ? "" : txtLicAddress.Text;
                string RegId = RegistrationId;

                string apiUrl = APIURL + "//api//CandidateRegistration//AddCandidate?PageType=8&TransactionType=2&LicenceNo=" + LicenceNo + "&LicenceName=" + LicenceName + "&WeaponNo=" + WeaponNo + "&WeaponType=" + WeaponType + "&AmmunitionStock=" + AmmStock + "&IssuingAuthority=" + IssuingAuthority + "&LicenceIssueDate=" + LicIssueDate + "&ValidUpto=" + ValidUpTo + "&LicenceAddress=" + LicAddress + "&RegistrationID=" + RegId + "&RegStatus=InComplete&UserID=" + UserId + "&CompanyID=" + CompanyID + "";

                ConsumeApi objConsumeApi = new ConsumeApi();
                string resultMsg = objConsumeApi.ConsumePostApi(apiUrl);
                string regID = "";

                using (var ms = new MemoryStream(Encoding.Unicode.GetBytes(resultMsg)))
                {
                    DataContractJsonSerializer deserializer = new DataContractJsonSerializer(typeof(Response));
                    Response objResponse = (Response)deserializer.ReadObject(ms);
                    resultMsg = objResponse.OutputMessage;
                    regID = objResponse.Data;
                }

                if (resultMsg == "Candidate data updated successfuly!")
                {
                    activeTab.Value = "9";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(resultMsg)})</script>", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                CandidateRegistrationDocument cRegDoc = new CandidateRegistrationDocument();
                string ReturnMsg = ValidateFileSize();

                if (ReturnMsg == "Success")
                {
                    string RegId = RegistrationId;
                    string PaymentMode = ddlPayMode.SelectedItem.Text;
                    int BankCode = ddlBankName.SelectedIndex > 0 ? int.Parse(ddlBankName.SelectedValue) : 0;
                    string AccNo = string.IsNullOrEmpty(txtAccountNumber.Text) ? "" : txtAccountNumber.Text;
                    string IFSCode = string.IsNullOrEmpty(txtIFSCode.Text) ? "" : txtIFSCode.Text;
                    string BankAddress = "";
                    string Qualification = ddlHighestQual.SelectedIndex <= 0 ? "" : ddlHighestQual.SelectedItem.Text;
                    string IdProof = ddlIdProof.SelectedIndex <= 0 ? "" : ddlIdProof.SelectedItem.Text;
                    string ResdentProof = ddlResidential.SelectedIndex <= 0 ? "" : ddlResidential.SelectedItem.Text;

                    string Qualification_Doc = "";
                    string IdProof_Doc = "";
                    string IdProof_Doc_Back = "";
                    string ResdentProof_Doc = "";
                    string ResdentProof_Doc_Back = "";
                    string ExperienceLetterDoc = "";
                    string GunLicenceDoc = "";
                    string HandsImpressionDoc = "";
                    string BankPassbookDoc = "";
                    string ResdentProofIdNumber = "";

                    DateTime ResdentProofExpiryDate = Convert.ToDateTime("01/01/1753 12:00:00 AM");
                    if (fuHighestQualFront.HasFile)
                    {
                        string Ext = System.IO.Path.GetExtension(this.fuHighestQualFront.FileName);
                        Qualification_Doc = ("EDU" + RegId + Convert.ToString(CompanyID) + Ext).Trim();
                    }
                    else Qualification_Doc = "NA";

                    if (fuIDProofFront.HasFile)
                    {
                        string Ext = System.IO.Path.GetExtension(this.fuIDProofFront.FileName);
                        IdProof_Doc = ("ID" + RegId + Convert.ToString(CompanyID) + Ext).Trim();
                    }
                    else IdProof_Doc = "NA";

                    if (fuIDProofBack.HasFile)
                    {
                        string Ext = System.IO.Path.GetExtension(this.fuIDProofBack.FileName);
                        IdProof_Doc_Back = ("ID_back" + RegId + Convert.ToString(CompanyID) + Ext).Trim();
                    }
                    else IdProof_Doc_Back = "NA";

                    if (fuResidentFront.HasFile)
                    {
                        string Ext = System.IO.Path.GetExtension(this.fuResidentFront.FileName);
                        ResdentProof_Doc = ("RES" + RegId + Convert.ToString(CompanyID) + Ext).Trim();
                    }
                    else ResdentProof_Doc = "NA";

                    if (fuResidentBack.HasFile)
                    {
                        string Ext = System.IO.Path.GetExtension(this.fuResidentBack.FileName);
                        ResdentProof_Doc_Back = ("RES_back" + RegId + Convert.ToString(CompanyID) + Ext).Trim();
                    }
                    else ResdentProof_Doc_Back = "NA";

                    if (fuExperience.HasFile)
                    {
                        string Ext = System.IO.Path.GetExtension(this.fuExperience.FileName);
                        ExperienceLetterDoc = ("ExpLetter" + RegId + Convert.ToString(CompanyID) + Ext).Trim();
                    }
                    else ExperienceLetterDoc = "NA";

                    if (fuGunLicence.HasFile)
                    {
                        string Ext = System.IO.Path.GetExtension(this.fuGunLicence.FileName);
                        GunLicenceDoc = ("GunLicence" + RegId + Convert.ToString(CompanyID) + Ext).Trim();
                    }
                    else GunLicenceDoc = "NA";

                    if (fuHandsImpression.HasFile)
                    {
                        string Ext = System.IO.Path.GetExtension(this.fuHandsImpression.FileName);
                        HandsImpressionDoc = ("HandsImpression" + RegId + Convert.ToString(CompanyID) + Ext).Trim();
                    }
                    else HandsImpressionDoc = "NA";

                    if (fuBankPassbook.HasFile)
                    {
                        string Ext = System.IO.Path.GetExtension(this.fuBankPassbook.FileName);
                        BankPassbookDoc = ("PB" + RegId + Convert.ToString(CompanyID) + Ext).Trim();
                    }
                    else BankPassbookDoc = "NA";

                    DateTime dt;
                    if (string.IsNullOrEmpty(txIdtDate.Text)) ResdentProofExpiryDate = Convert.ToDateTime("01/01/1753 12:00:00 AM");
                    else if (DateTime.TryParseExact(txIdtDate.Text, "dd-MM-yyyy", null, DateTimeStyles.None, out dt) == true)
                        ResdentProofExpiryDate = DateTime.ParseExact(txIdtDate.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture);

                    ResdentProofIdNumber = string.IsNullOrEmpty(txtIdNumber.Text) ? "" : txtIdNumber.Text;

                    string apiUrl = APIURL + "//api//CandidateRegistration//AddCandidate?PageType=9&TransactionType=2&PayMode=" + PaymentMode + "&BankCode=" + BankCode + "&AccNo=" + AccNo + "&IFSCode=" + IFSCode + "&BankAddress=" + BankAddress + "&Qualification_Doc=" + Qualification_Doc + "&IdProof_Doc=" + IdProof_Doc + "&IdProof_Doc_Back=" + IdProof_Doc_Back + "&ResdentProof_Doc=" + ResdentProof_Doc + "&ResdentProof_Doc_Back=" + ResdentProof_Doc_Back + "&ExperienceLetterDoc=" + ExperienceLetterDoc + "&GunLicenceDoc=" + GunLicenceDoc + "&HandsImpressionDoc=" + HandsImpressionDoc + "&BankPassbookDoc=" + BankPassbookDoc + "&ResidentialDocmentNo=" + ResdentProofIdNumber + " &ResdentProofExpiryDate=" + ResdentProofExpiryDate + "&ResdentProof=" + ResdentProof + "&IDProof=" + IdProof + "&Qualification=" + Qualification + "&RegistrationID=" + RegId + "&RegStatus=InComplete&UserID=" + UserId + "&CompanyID=" + CompanyID + "";

                    ConsumeApi objConsumeApi = new ConsumeApi();
                    string resultMsg = objConsumeApi.ConsumePostApi(apiUrl);
                    string regID = "";

                    using (var ms = new MemoryStream(Encoding.Unicode.GetBytes(resultMsg)))
                    {
                        DataContractJsonSerializer deserializer = new DataContractJsonSerializer(typeof(Response));
                        Response objResponse = (Response)deserializer.ReadObject(ms);
                        resultMsg = objResponse.OutputMessage;
                        regID = objResponse.Data;
                    }

                    if (!string.IsNullOrEmpty(regID))
                    {
                        if (fuHighestQualFront.HasFile)
                        {
                            string EXT = System.IO.Path.GetExtension(this.fuHighestQualFront.FileName);
                            fuHighestQualFront.SaveAs(APIFolderPath + "EducationalCertificate/" + "EDU" + regID + Convert.ToString(CompanyID) + EXT);
                        }

                        if (fuIDProofFront.HasFile)
                        {
                            string EXT = System.IO.Path.GetExtension(this.fuIDProofFront.FileName);
                            fuIDProofFront.SaveAs(APIFolderPath + "IDProof/" + "ID" + regID + Convert.ToString(CompanyID) + EXT);
                        }

                        if (fuIDProofBack.HasFile)
                        {
                            string EXT = System.IO.Path.GetExtension(this.fuIDProofBack.FileName);
                            fuIDProofBack.SaveAs(APIFolderPath + "IDProof/" + "ID_back" + regID + Convert.ToString(CompanyID) + EXT);
                        }

                        if (fuResidentFront.HasFile)
                        {
                            string EXT = System.IO.Path.GetExtension(this.fuResidentFront.FileName);
                            fuResidentFront.SaveAs(APIFolderPath + "ResidentialProof/" + "RES" + regID + Convert.ToString(CompanyID) + EXT);
                        }

                        if (fuResidentBack.HasFile)
                        {
                            string EXT = System.IO.Path.GetExtension(this.fuResidentBack.FileName);
                            fuResidentBack.SaveAs(APIFolderPath + "ResidentialProof/" + "RES_back" + regID + Convert.ToString(CompanyID) + EXT);
                        }

                        if (fuGunLicence.HasFile)
                        {
                            string EXT = System.IO.Path.GetExtension(this.fuGunLicence.FileName);
                            fuGunLicence.SaveAs(APIFolderPath + "GunLicence/" + "GunLicence" + regID + Convert.ToString(CompanyID) + EXT);
                        }

                        if (fuExperience.HasFile)
                        {
                            string EXT = System.IO.Path.GetExtension(this.fuExperience.FileName);
                            fuExperience.SaveAs(APIFolderPath + "ExpLetter/" + "ExpLetter" + regID + Convert.ToString(CompanyID) + EXT);
                        }

                        if (fuHandsImpression.HasFile)
                        {
                            string EXT = System.IO.Path.GetExtension(this.fuHandsImpression.FileName);
                            fuHandsImpression.SaveAs(APIFolderPath + "HandsImpression/" + "HandsImpression" + regID + Convert.ToString(CompanyID) + EXT);
                        }

                        if (fuBankPassbook.HasFile)
                        {
                            string EXT = System.IO.Path.GetExtension(this.fuBankPassbook.FileName);
                            fuBankPassbook.SaveAs(APIFolderPath + "BankPassBook/" + "PB" + regID + Convert.ToString(CompanyID) + EXT);
                        }

                        if (fuProfileVideo.HasFile)
                        {
                            string EXT = System.IO.Path.GetExtension(this.fuProfileVideo.FileName);
                            fuProfileVideo.SaveAs(APIFolderPath + "VideoProfile/" + "VideoProfile" + regID + Convert.ToString(CompanyID) + EXT);
                        }
                    }
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully and Registration Id = " + regID + "'); window.location.href = '/NewUserRegistration';", true);

                }
                else
                {
                    activeTab.Value = "9";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ReturnMsg)})</script>", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public string ValidateFileSize()
        {
            decimal size = Math.Round(((decimal)fuHighestQualFront.PostedFile.ContentLength / (decimal)1024), 2);
            if (size > 500)
                return "Highest Qualification Document should not be greater than 500KB and less than 200KB .";
            else if (Math.Round(((decimal)fuIDProofFront.PostedFile.ContentLength / (decimal)1024), 2) > 500)
                return "Id Proof Front Document should not be greater than 500KB and less than 200KB .";
            else if (Math.Round(((decimal)fuIDProofBack.PostedFile.ContentLength / (decimal)1024), 2) > 500)
                return "Id Proof Back Document should not be greater than 500KB and less than 200KB .";
            else if (Math.Round(((decimal)fuResidentFront.PostedFile.ContentLength / (decimal)1024), 2) > 500)
                return "Resident Proof Front Document should not be greater than 500KB and less than 200KB .";
            else if (Math.Round(((decimal)fuResidentBack.PostedFile.ContentLength / (decimal)1024), 2) > 500)
                return "Resident Back Front Document should not be greater than 500KB and less than 200KB .";
            else if (Math.Round(((decimal)fuExperience.PostedFile.ContentLength / (decimal)1024), 2) > 500)
                return "Experience Letter Document should not be greater than 500KB and less than 200KB .";
            else if (Math.Round(((decimal)fuGunLicence.PostedFile.ContentLength / (decimal)1024), 2) > 500)
                return "Gun Licence Document should not be greater than 500KB and less than 200KB .";
            else if (Math.Round(((decimal)fuHandsImpression.PostedFile.ContentLength / (decimal)1024), 2) > 500)
                return "Hands Impression Documnet should not be greater than 500KB and less than 200KB .";
            else if (Math.Round((decimal)fuBankPassbook.PostedFile.ContentLength / (decimal)1024, 2) > 500)
                return "Bank PassBook Document should not be greater than 500KB and less than 200KB .";
            else return "Success";
        }

        protected void btnCurrentData_Click(object sender, EventArgs e)
        {
            try
            {
                CanRegistration cr = new CanRegistration();
                if (!string.IsNullOrEmpty(Convert.ToString(txtAadharNo.Text)))
                {
                    DataTable dt = cr.BindTableDataValue(string.Format(@" SELECT e.Empname,Convert(nvarchar,e.EmpDOB,111) EmpDOB,e.gender,e.AadharCardNo,
                e.FatherName,a.village House,a.po Street,a.PermanentLandmark Landmark,a.PermanentVTC VTC,a.tehsil SubDistrict,a.dist District,a.Pin pincode,
                a.state FROM  EMPLOYEE e LEFT JOIN HR_COMMUNICATION a ON a.EMPCODE = e.EMPCODE WHERE e.AadharCardNo ='{0}'",
                    Convert.ToString(txtAadharNo.Text)));

                    if (dt.Rows.Count > 0)
                    {
                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Empname"])))
                            lblName.Text = Convert.ToString(dt.Rows[0]["Empname"]);
                        else
                            lblName.Text = string.Empty;
                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["EmpDOB"])))
                            lblDOB.Text = Convert.ToString(dt.Rows[0]["EmpDOB"]);
                        else
                            lblDOB.Text = string.Empty;
                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["gender"])))
                            lblGender.Text = Convert.ToString(dt.Rows[0]["gender"]);
                        else
                            lblGender.Text = string.Empty;
                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["AadharCardNo"])))
                            lblAadhaar.Text = Convert.ToString(dt.Rows[0]["AadharCardNo"]);
                        else
                            lblAadhaar.Text = string.Empty;

                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["House"])))
                            lblHouse.Text = Convert.ToString(dt.Rows[0]["House"]);
                        else
                            lblHouse.Text = string.Empty;
                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Street"])))
                            lblStreet.Text = Convert.ToString(dt.Rows[0]["Street"]);
                        else
                            lblStreet.Text = string.Empty;
                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Landmark"])))
                            lblLandmark.Text = Convert.ToString(dt.Rows[0]["Landmark"]);
                        else
                            lblLandmark.Text = string.Empty;
                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["VTC"])))
                            lblVTC.Text = Convert.ToString(dt.Rows[0]["VTC"]);
                        else
                            lblVTC.Text = string.Empty;
                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["SubDistrict"])))
                            lblSDist.Text = Convert.ToString(dt.Rows[0]["SubDistrict"]);
                        else
                            lblSDist.Text = string.Empty;
                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["District"])))
                            lblDist.Text = Convert.ToString(dt.Rows[0]["District"]);
                        else
                            lblDist.Text = string.Empty;
                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["pincode"])))
                            lblPincode.Text = Convert.ToString(dt.Rows[0]["pincode"]);
                        else
                            lblPincode.Text = string.Empty;
                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["state"])))
                            lblState.Text = Convert.ToString(dt.Rows[0]["state"]);
                        else
                            lblState.Text = string.Empty;
                        lblCountry.Text = string.Empty;
                        imgUser.Attributes["src"] = ResolveUrl("data:image/png;base64," + dt.Rows[0]["Empname"]);

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showAddNewLeadModal", "$(document).ready(function() { showAadharDataModal(); });", true);
                    }
                    else
                    {
                        string customMessage = "No Data Found For This Aadhar!";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Info", $"<script>info({JsonConvert.SerializeObject(customMessage)})</script>", false);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void btnAadhar_Click(object sender, EventArgs e)
        {
            try
            {
                ConsumeApi objConsumeApi = new ConsumeApi();
                string resultMsg;
                string AadharNo = txtAadharNo.Text;
                resultMsg = objConsumeApi.ConsumePostAadhaarGenerateOTP(AadharNo);
                Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(resultMsg);
                Session["client_id"] = myDeserializedClass.data.client_id.ToString();
                if (!string.IsNullOrEmpty(Convert.ToString(Session["client_id"])))
                {
                    SqlParameter[] spp = {
                                        new SqlParameter("@CompanyName" , "Jupiter SECURITY PVT. LTD."),
                                        new SqlParameter("@CompanyID" ,Convert.ToString(Session["CompanyID"])),
                                        new SqlParameter("@AadharNo" , AadharNo),
                                        new SqlParameter("@Mode" ,"AadhaarForOTP"),
                                        new SqlParameter("@Response" ,"Success"),
                                        new SqlParameter("@Status" ,"Success"),
                                        new SqlParameter("@CreatedBy" ,Convert.ToString(Session["UserID"])),
                                          };

                    int result2 = DBClass.ExecuteProcedure("Usp_APIHitHistoryData", spp);

                    if (result2 > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("OTP Sent Successfully!")})</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Something Went Wrong!!")})</script>", false);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void btnSubmitOTP_Click(object sender, EventArgs e)
        {
            string ImageSrc = string.Empty;
            try
            {
                ConsumeApi objConsumeApi = new ConsumeApi();
                string OTP = Convert.ToString(@"" + txtOTP.Text + @"");
                string a = Convert.ToString(Session["client_id"]);
                string resultMsg1 = objConsumeApi.ConsumePostAadhaarVerification(a, OTP);
                Root myDeserializedClass1 = JsonConvert.DeserializeObject<Root>(resultMsg1.Split('#')[0]);
                var jsonObj = JsonConvert.DeserializeObject<JObject>(resultMsg1.Split('#')[0]);
                var result = myDeserializedClass1.data.full_name.ToString();
                string Response = resultMsg1.Split('#')[1];
                string abc = Convert.ToString(jsonObj["address"]);

                if (result != "")
                {
                    lblName.Text = Convert.ToString(myDeserializedClass1.data.full_name);
                    lblDOB.Text = Convert.ToString(myDeserializedClass1.data.dob);
                    lblGender.Text = Convert.ToString(myDeserializedClass1.data.gender);
                    lblAadhaar.Text = Convert.ToString(myDeserializedClass1.data.aadhaar_number);
                    lblHouse.Text = Convert.ToString(myDeserializedClass1.data.address.house);
                    lblStreet.Text = Convert.ToString(myDeserializedClass1.data.address.street);
                    lblLandmark.Text = Convert.ToString(myDeserializedClass1.data.address.landmark);
                    lblVTC.Text = Convert.ToString(myDeserializedClass1.data.address.vtc);
                    lblSDist.Text = Convert.ToString(myDeserializedClass1.data.address.subdist);
                    lblDist.Text = Convert.ToString(myDeserializedClass1.data.address.dist);
                    lblPincode.Text = Convert.ToString(myDeserializedClass1.data.zip);
                    lblState.Text = Convert.ToString(myDeserializedClass1.data.address.state);
                    lblCountry.Text = Convert.ToString(myDeserializedClass1.data.address.country);
                    imgUser.Attributes["src"] = ResolveUrl("data:image/png;base64," + myDeserializedClass1.data.profile_image);
                    ImageSrc = imgUser.ImageUrl;

                    SqlParameter[] sp = {
                                        new SqlParameter("@CompanyID" ,Convert.ToString(Session["CompanyID"])),
                                        new SqlParameter("@AadharNo" ,lblAadhaar.Text),
                                        new SqlParameter("@Name" ,lblName.Text),
                                        new SqlParameter("@DateOfBirth" ,lblDOB.Text),
                                        new SqlParameter("@Gender" ,lblGender.Text),
                                        new SqlParameter("@House" ,lblHouse.Text),
                                        new SqlParameter("@Street" ,lblStreet.Text),
                                        new SqlParameter("@LandMark" ,lblLandmark.Text),
                                        new SqlParameter("@VTC" ,lblVTC.Text),
                                        new SqlParameter("@SubDistrict" ,lblSDist.Text),
                                        new SqlParameter("@District" ,lblDist.Text),
                                        new SqlParameter("@Pincode" ,lblPincode.Text),
                                        new SqlParameter("@State" ,lblState.Text),
                                        new SqlParameter("@Country" ,lblCountry.Text),
                                        new SqlParameter("@AadharImage" ,ImageSrc),
                                        new SqlParameter("@CompanyName" ,"Choukas"),
                                        new SqlParameter("@Mode" ,"Aadhaar"),
                                        new SqlParameter("@Response" ,Response),
                                        new SqlParameter("@Status" ,"Success"),
                                        new SqlParameter("@CreatedBy" ,Convert.ToString(Session["UserID"])),

                                    };
                    int result1 = DBClass.ExecuteProcedure("Usp_AadhaarAPIHitData", sp);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showAddNewLeadModal", "$(document).ready(function() { showAadharDataModal(); });", true);
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("Aadhaar Verified Successfully!")})</script>", false);

                }
                else
                {
                    SqlParameter[] spp = {
                                        new SqlParameter("@CompanyName" , "CHOKUS SECURITY PVT. LTD."),
                                        new SqlParameter("@CompanyID" ,Convert.ToString(Session["CompanyID"])),
                                        new SqlParameter("@AadharNo" , lblAadhaar.Text),
                                        new SqlParameter("@Mode" ,"Aadhaar"),
                                        new SqlParameter("@Response" ,Response),
                                        new SqlParameter("@Status" ,"Failed"),
                                        new SqlParameter("@CreatedBy" ,Convert.ToString(Session["UserID"])),
                                          };

                    int result2 = DBClass.ExecuteProcedure("Usp_APIHitHistoryData", spp);
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("Something Went Wrong!")})</script>", false);
                }
            }
            catch (Exception ex)
            {
                SqlParameter[] spp = {
                                        new SqlParameter("@CompanyName" , "CHOKUS SECURITY PVT. LTD."),
                                        new SqlParameter("@CompanyID" ,Convert.ToString(Session["CompanyID"])),
                                        new SqlParameter("@AadharNo" , lblAadhaar.Text),
                                        new SqlParameter("@Mode" ,"Aadhaar"),
                                        new SqlParameter("@Response" ,Convert.ToString(ex.Message)),
                                        new SqlParameter("@Status" ,"Failed"),
                                        new SqlParameter("@CreatedBy" ,Convert.ToString(Session["UserID"])),
                                          };

                int result2 = DBClass.ExecuteProcedure("Usp_APIHitHistoryData", spp);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("Something Went Wrong!!")})</script>", false);
                Response.Write(ex.Message);
            }
        }

        protected void btnVerifyBank_Click(object sender, EventArgs e)
        {
            try
            {
                ConsumeApi objConsumeApi = new ConsumeApi();
                string resultMsg;
                string AccNo = txtAccountNumber.Text;
                string ifsc = txtIFSCode.Text;
                resultMsg = objConsumeApi.ConsumePostBankVerification(AccNo, ifsc);
                Root1 myDeserializedClass1 = JsonConvert.DeserializeObject<Root1>(resultMsg.Split('#')[0]);
                var jsonObj = JsonConvert.DeserializeObject<JObject>(resultMsg.Split('#')[0]);
                var result = myDeserializedClass1.data.ifsc_details.ifsc.ToString();
                string Response = resultMsg.Split('#')[1];


                if (result != "")
                {
                    lblBankclient_id.Text = Convert.ToString(myDeserializedClass1.data.client_id);
                    lblBankUserName.Text = Convert.ToString(myDeserializedClass1.data.full_name);
                    lblAccNo.Text = Convert.ToString(AccNo);
                    lblIFSCode.Text = Convert.ToString(myDeserializedClass1.data.ifsc_details.ifsc);
                    lblBankName.Text = Convert.ToString(myDeserializedClass1.data.ifsc_details.bank_name);
                    lblBranch.Text = Convert.ToString(myDeserializedClass1.data.ifsc_details.branch);
                    lblBankAddress.Text = Convert.ToString(myDeserializedClass1.data.ifsc_details.address);
                    lblDistrict.Text = Convert.ToString(myDeserializedClass1.data.ifsc_details.district);
                    lblBankState.Text = Convert.ToString(myDeserializedClass1.data.ifsc_details.state);
                    lblBankCity.Text = Convert.ToString(myDeserializedClass1.data.ifsc_details.city);
                    string message_code = Convert.ToString(myDeserializedClass1.message_code);
                    string BankCode = Convert.ToString(DalLayer.DBClass.ExecuteScalar(string.Format(@"select top 1 bankcode from BANK where bankname like '%{0}%' and compid='{1}'",
                    Convert.ToString(myDeserializedClass1.data.ifsc_details.bank_name), Convert.ToString(Session["CompanyID"]))));
                    if (!string.IsNullOrEmpty(BankCode))
                    {
                        ddlBankName.SelectedValue = BankCode;
                    }

                    SqlParameter[] sp = {
                                        new SqlParameter("@CompId" ,Convert.ToString(Session["CompanyID"])),
                                        new SqlParameter("@CompName" ,""),
                                        new SqlParameter("@Client_Id" ,lblBankclient_id.Text),
                                        new SqlParameter("@AccNo" ,lblAccNo.Text),
                                        new SqlParameter("@UserName" ,lblBankUserName.Text),
                                        new SqlParameter("@IFSC" ,lblIFSCode.Text),
                                        new SqlParameter("@BankName" ,lblBankName.Text),
                                        new SqlParameter("@Branch" ,lblBranch.Text),
                                        new SqlParameter("@BankAddress" ,lblBankAddress.Text),
                                        new SqlParameter("@District" ,lblDistrict.Text),
                                        new SqlParameter("@BankState" ,lblBankState.Text),
                                        new SqlParameter("@BankCity" ,lblBankCity.Text),
                                        new SqlParameter("@CreatedBy" ,Convert.ToString(Session["UserID"])),
                                        new SqlParameter("@Mode" ,"BankApiHit"),
                                        new SqlParameter("@Response" ,Response),
                                        new SqlParameter("@Status" , message_code),
                                    };
                    int result1 = DBClass.ExecuteProcedure("proc_AddBankDetailsByAPI", sp);
                    if (result1 > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("Bank Verified Successfully!")})</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Something Went Wrong!!")})</script>", false);
                    }

                }
                else
                {
                    SqlParameter[] spp = {
                                        new SqlParameter("@CompName" , "SK FACILITY MANAGEMENT SERVICES PVT.LTD"),
                                        new SqlParameter("@CompId" ,Convert.ToString(Session["CompanyID"])),
                                        new SqlParameter("@AccNo" , lblAccNo.Text),
                                        new SqlParameter("@Mode" ,"BankApiHit"),
                                        new SqlParameter("@Response" ,Response),
                                        new SqlParameter("@Status" ,"Failed"),
                                        new SqlParameter("@CreatedBy" ,Convert.ToString(Session["UserID"])),
                                          };

                    int result2 = DBClass.ExecuteProcedure("proc_AddBankDetailsByAPI", spp);
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Something Went Wrong!!")})</script>", false);

                }
            }
            catch (Exception ex)
            {
                SqlParameter[] spp = {
                                        new SqlParameter("@CompName" , "SK FACILITY MANAGEMENT SERVICES PVT.LTD"),
                                        new SqlParameter("@CompId" ,Convert.ToString(Session["CompanyID"])),
                                        new SqlParameter("@AccNo" , lblAccNo.Text),
                                        new SqlParameter("@Mode" ,"BankApiHit"),
                                        new SqlParameter("@Response" ,Convert.ToString(ex.Message)),
                                        new SqlParameter("@Status" ,"Failed"),
                                        new SqlParameter("@CreatedBy" ,Convert.ToString(Session["UserID"])),
                                          };

                int result2 = DBClass.ExecuteProcedure("proc_AddBankDetailsByAPI", spp);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Something Went Wrong!!")})</script>", false);
                Response.Write(ex.Message);
            }
        }

        protected void btnImport_Click(object sender, EventArgs e)
        {
            try
            {
                txtCandidateName.Text = lblName.Text;

                string gender = string.Empty;
                switch (lblGender.Text)
                {
                    case "M":
                        gender = "Male";
                        break;
                    case "F":
                        gender = "Female";
                        break;
                }
                ddlGender.SelectedValue = gender;


                DateTime aadharDate;
                if (DateTime.TryParse(lblDOB.Text, out aadharDate))
                {
                    txtDateofBirth.Text = aadharDate.ToString("yyyy-MM-dd");
                }

                txtVillHouseNoPer.Text = lblHouse.Text;
                txtPostOfficePer.Text = lblStreet.Text;
                txtTehsilPer.Text = lblSDist.Text;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void BindStateMaster()
        {
            try
            {
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.BindTableData("STATE", "statename");
                ddlState.DataSource = dt;
                ddlState.DataTextField = "statename";
                ddlState.DataValueField = "statecode";
                ddlState.DataBind();
                ddlState.Items.Insert(0, new ListItem("--Select--", "0"));

                ddlStatePer.DataSource = dt;
                ddlStatePer.DataTextField = "statename";
                ddlStatePer.DataValueField = "statecode";
                ddlStatePer.DataBind();
                ddlStatePer.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void BindBankMaster()
        {
            try
            {
                MasterCommonClass mc = new MasterCommonClass();
                ddlBankName.DataSource = mc.BindTableData("BANK", "bankname", CompanyID);
                ddlBankName.DataTextField = "bankname";
                ddlBankName.DataValueField = "bankcode";
                ddlBankName.DataBind();
                ddlBankName.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void BindClientMaster()
        {
            try
            {
                MasterCommonClass mc = new MasterCommonClass();
                ddlClientName.DataSource = mc.BindTableData("CLIENT", "clientname");
                ddlClientName.DataTextField = "clientname";
                ddlClientName.DataValueField = "clientcode";
                ddlClientName.DataBind();
                ddlClientName.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void ddlClientName_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ClientId = string.IsNullOrEmpty(ddlClientName.SelectedValue) ? 0 : Convert.ToInt32(ddlClientName.SelectedValue);
            BindUnitMaster(ClientId);
        }

        public void BindUnitMaster(int ClientID)
        {
            try
            {
                CanRegistration cr = new CanRegistration();
                ddlUnitName.DataSource = cr.BindUnitforClient(CompanyID, ClientID);
                ddlUnitName.DataTextField = "unitname";
                ddlUnitName.DataValueField = "unitcode";
                ddlUnitName.DataBind();
                ddlUnitName.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void BindBranchMaster()
        {
            try
            {
                MasterCommonClass mc = new MasterCommonClass();
                ddlBranchName.DataSource = mc.BindTableData("BRANCH", "branchname");
                ddlBranchName.DataTextField = "branchname";
                ddlBranchName.DataValueField = "branchcode";
                ddlBranchName.DataBind();
                ddlBranchName.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void BindDesignationMaster()
        {
            try
            {
                MasterCommonClass mc = new MasterCommonClass();
                ddlDesignation.DataSource = mc.BindTableData("DESIGNATION", "desiname");
                ddlDesignation.DataTextField = "desiname";
                ddlDesignation.DataValueField = "desicode";
                ddlDesignation.DataBind();
                ddlDesignation.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void BindESIZoneMaster()
        {
            try
            {
                MasterCommonClass mc = new MasterCommonClass();
                ddlESIZone.DataSource = mc.BindTableData("ESIZONE", "zonename");
                ddlESIZone.DataTextField = "zonename";
                ddlESIZone.DataValueField = "zonecode";
                ddlESIZone.DataBind();
                ddlESIZone.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void BindZonalOfficeMaster()
        {
            try
            {
                MasterCommonClass mc = new MasterCommonClass();
                ddlZonalOffice.DataSource = mc.BindTableData("REGIONMASTER", "regionname");
                ddlZonalOffice.DataTextField = "regionname";
                ddlZonalOffice.DataValueField = "regioncode";
                ddlZonalOffice.DataBind();
                ddlZonalOffice.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

    }

    public class Data
    {
        public string client_id { get; set; }
        public string pan_number { get; set; }
        public string full_name { get; set; }
        public string category { get; set; }
        public string dob { get; set; }
        public string gender { get; set; }
        public string aadhaar_number { get; set; }
        public string zip { get; set; }
        public string profile_image { get; set; }
        public string care_of { get; set; }
        public address address { get; set; }

    }

    public class Root
    {
        public Data data { get; set; }
        public int status_code { get; set; }
        public bool success { get; set; }
        public object message { get; set; }
        public string message_code { get; set; }
    }

    public class address
    {
        public string country { get; set; }
        public string dist { get; set; }
        public string state { get; set; }
        public string vtc { get; set; }
        public string subdist { get; set; }
        public string street { get; set; }
        public string house { get; set; }
        public string landmark { get; set; }
    }

    public class Root1
    {
        public Data1 data { get; set; }
        public int status_code { get; set; }
        public bool success { get; set; }
        public object message { get; set; }
        public string message_code { get; set; }
    }

    public class Data1
    {
        public string client_id { get; set; }
        public string account_exists { get; set; }
        public string upi_id { get; set; }
        public string full_name { get; set; }
        public string remarks { get; set; }
        public IFSC_DETAILS ifsc_details { get; set; }
    }

    public class IFSC_DETAILS
    {
        public string id { get; set; }
        public string ifsc { get; set; }
        public string micr { get; set; }
        public string iso3166 { get; set; }
        public string swift { get; set; }
        public string bank { get; set; }
        public string bank_code { get; set; }
        public string bank_name { get; set; }
        public string branch { get; set; }
        public string centre { get; set; }
        public string district { get; set; }
        public string state { get; set; }
        public string city { get; set; }
        public string address { get; set; }
        public string contact { get; set; }
        public string imps { get; set; }
        public string rtgs { get; set; }
        public string neft { get; set; }
        public string upi { get; set; }
        public string micr_check { get; set; }

    }
}