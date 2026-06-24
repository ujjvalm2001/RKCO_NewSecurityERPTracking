using BalLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static BalLayer.CanRegistration;

namespace NewSecurityERP.CandidateRegistration
{
	public partial class ViewCandidateRegistration : System.Web.UI.Page
	{
		public int CompanyID = 1;
		static string RegStatus = string.Empty;
		static string ApplicationStatus = string.Empty;
		static string RegNumber = string.Empty;
		static string RegEmpCode = string.Empty;
		static string ClientCode = string.Empty;
		static string UnitCode = string.Empty;
		static string DesiCode = string.Empty;
		static string BankCode = string.Empty;
		string ApplicationPath = System.Web.Hosting.HostingEnvironment.MapPath(HttpContext.Current.Request.ApplicationPath);
		static string APIFolderPath = WebConfigurationManager.AppSettings.Get("APIFolderPath");


		protected void Page_Load(object sender, EventArgs e)
		{
			if (!string.IsNullOrEmpty(Convert.ToString(Session["CompanyID"])))
			{
				int CompanyID = Convert.ToInt32(Session["CompanyID"]);
				if (!IsPostBack)
				{
					BindCandidateRegistration();
				}
			}
			else { Response.Redirect("~/Default.aspx"); }
		}


		public void BindCandidateRegistration()
		{
			if (Request.QueryString["RegistrationID"] == null)
			{
				return;
			}
			DataTable dt = new DataTable();
			string RegistationID = Convert.ToString(Request.QueryString["RegistrationID"]);
			CanRegistration can = new CanRegistration();
			dt = can.GetCandidateDetailsFromRegId(RegistationID, Convert.ToString(CompanyID));
			if (dt.Rows.Count > 0)
			{
				//------------- Personnal Details --------------------

				lblRecruitmentType.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["RecruitmentType"])) ? "N/A" : Convert.ToString(dt.Rows[0]["RecruitmentType"]);
				lblRecruitmentDetail.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["RecruitmentTypeDetail"])) ? "N/A" : Convert.ToString(dt.Rows[0]["RecruitmentTypeDetail"]);
				lblRegistrationID.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["RegistrationID"])) ? "N/A" : Convert.ToString(dt.Rows[0]["RegistrationID"]);
				lblAadharNo.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["AadharCardNo"])) ? "N/A" : Convert.ToString(dt.Rows[0]["AadharCardNo"]);
				lblCandidateName.Text = Convert.ToString(dt.Rows[0]["Salutation"]) + " " + Convert.ToString(dt.Rows[0]["CandidateName"]);
				lblDateofBirth.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["DateofBirth"])) ? "N/A" : Convert.ToString(dt.Rows[0]["DateofBirth"]);
				lblDOJ.Text = dt.Rows[0]["DOJ"].ToString();
				lblGender.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Gender"])) ? "N/A" : Convert.ToString(dt.Rows[0]["Gender"]);
				lblMaritalStatus.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["MaritalStatus"])) ? "N/A" : Convert.ToString(dt.Rows[0]["MaritalStatus"]);
				lblFatherName.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["FatherName"])) ? "N/A" : Convert.ToString(dt.Rows[0]["FatherName"]);
				lblMotherName.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["MotherName"])) ? "N/A" : Convert.ToString(dt.Rows[0]["MotherName"]);
				lblJobType.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["JobType"])) ? "N/A" : Convert.ToString(dt.Rows[0]["JobType"]);
				lblSpouseName.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["SpouseName"])) ? "N/A" : Convert.ToString(dt.Rows[0]["SpouseName"]);
				lblPanCardNo.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PanNo"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PanNo"]);
				lblEmail.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["EmailID"])) ? "N/A" : Convert.ToString(dt.Rows[0]["EmailID"]);
				lblMobileNo.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["MobileNo"])) ? "N/A" : Convert.ToString(dt.Rows[0]["MobileNo"]);

				//------------- Communication Details --------------------

				// Present Address
				lblPreVillage.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["VillHouseNo"])) ? "N/A" : Convert.ToString(dt.Rows[0]["VillHouseNo"]);
				lblPrePost.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PostOffice"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PostOffice"]);
				lblPrePoliceStation.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PoliceStation"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PoliceStation"]);
				lblPreState.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["StateCode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["StateCode"]);
				lblPreDistrict.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Districts"])) ? "N/A" : Convert.ToString(dt.Rows[0]["Districts"]);
				lblPreCity.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["CityName"])) ? "N/A" : Convert.ToString(dt.Rows[0]["CityName"]);
				lblPreTehsil.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["TehsilPre"])) ? "N/A" : Convert.ToString(dt.Rows[0]["TehsilPre"]);
				lblPrePinCode.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PinCodePre"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PinCodePre"]);
				lblPreMobileNo.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["MobileNo"])) ? "N/A" : Convert.ToString(dt.Rows[0]["MobileNo"]);
				lblPrePhoneNo.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PhoneNo"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PhoneNo"]);

				// Permanent Address
				lblPerVillage.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["VillHouseNoPer"])) ? "N/A" : Convert.ToString(dt.Rows[0]["VillHouseNoPer"]);
				lblPerPost.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PostOfficePer"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PostOfficePer"]);
				lblPerPoliceStation.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PoliceStationPer"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PoliceStationPer"]);
				lblPerState.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["StateCodePer"])) ? "N/A" : Convert.ToString(dt.Rows[0]["StateCodePer"]);
				lblPerDistrict.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["DistrictsPer"])) ? "N/A" : Convert.ToString(dt.Rows[0]["DistrictsPer"]);
				lblPerCity.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["CityName"])) ? "N/A" : Convert.ToString(dt.Rows[0]["CityName"]);
				lblPerTehsil.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["TehsilPer"])) ? "N/A" : Convert.ToString(dt.Rows[0]["TehsilPer"]);
				lblPerPinCode.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PinCodePer"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PinCodePer"]);
				lblPerMobileNo.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["MobileNoPer"])) ? "N/A" : Convert.ToString(dt.Rows[0]["MobileNoPer"]);
				lblPerPhoneNo.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PhoneNoPer"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PhoneNoPer"]);

				//------------- Family Details --------------------

				lblFamname.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["NoName"])) ? "N/A" : Convert.ToString(dt.Rows[0]["NoName"]);
				lblFamDOB.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["NoDOB"])) ? "N/A" : Convert.ToString(dt.Rows[0]["NoDOB"]);
				lblFamRelation.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["NoRelation"])) ? "N/A" : Convert.ToString(dt.Rows[0]["NoRelation"]);
				lblFamAddress.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["NoAddress"])) ? "N/A" : Convert.ToString(dt.Rows[0]["NoAddress"]);
				LblFamResiding.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["NoResWith"])) ? "N/A" : Convert.ToString(dt.Rows[0]["NoResWith"]);
				lblIsDependent.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["NoIsDep"])) ? "N/A" : Convert.ToString(dt.Rows[0]["NoIsDep"]);
				lblFamPfNominee.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["NoIsPF"])) ? "N/A" : Convert.ToString(dt.Rows[0]["NoIsPF"]);

				//------------- Employement Details --------------------

				lblClientName.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["ClientCode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["ClientCode"]);
				lblUnitName.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["UnitCode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["UnitCode"]);
				lblBranch.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["BranchCode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["BranchCode"]);
				lblAppliedCategory.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Category"])) ? "N/A" : Convert.ToString(dt.Rows[0]["Category"]);
				lblAppliedDesignation.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Desicode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["Desicode"]);
				lblESIZone.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["EsiZoneCode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["EsiZoneCode"]);
				lblIsRejoin.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["IsRejoin"])) ? "N/A" : Convert.ToString(dt.Rows[0]["IsRejoin"]);
				lblOldEmployeeCode.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["OldEmpCode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["OldEmpCode"]);
				lblUnitLocation.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["UnitCode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["OldEmpCode"]);
				lblZonalOffice.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["UnitCode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["OldEmpCode"]);

				//------------- Physical Details --------------------

				lblHeight.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Height"])) ? "--" : Convert.ToString(dt.Rows[0]["Height"]) + " cm.";
				lblWeight.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Weight"])) ? "--" : Convert.ToString(dt.Rows[0]["Weight"]) + " kg.";
				lblColour.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Colour"])) ? "N/A" : Convert.ToString(dt.Rows[0]["Colour"]);
				lblBloodGroup.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["BloodGroup"])) ? "N/A" : Convert.ToString(dt.Rows[0]["BloodGroup"]);
				lblChestNormal.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["ChestNormal"])) ? "N/A" : Convert.ToString(dt.Rows[0]["ChestNormal"]);
				lblChestExpanded.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["ChestExpanded"])) ? "N/A" : Convert.ToString(dt.Rows[0]["ChestExpanded"]);
				lblIdentMark.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["IdentityMarks"])) ? "N/A" : Convert.ToString(dt.Rows[0]["IdentityMarks"]);
				lblillnessStatus.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["CurrentStatusofIllness"])) ? "N/A" : Convert.ToString(dt.Rows[0]["CurrentStatusofIllness"]);

				//------------- Experience Details --------------------

				lblPreviousComapany.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PreCompanyWorked"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PreCompanyWorked"]);
				lblPreviousEmployerESI.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PreEmployerEsiCode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PreEmployerEsiCode"]);
				lblPreviousLocation.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PreLocation"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PreLocation"]);
				lblPreviousDesignation.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PreDesination"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PreDesination"]);
				lblPreviousJoinDate.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PreJoinDate"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PreJoinDate"]);
				lblPreviousLeftDate.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PreLeftDate"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PreLeftDate"]);
				lblisPreviousUAN.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PreviousUAN"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PreviousUAN"]);
				lblPreviousUANNo.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PreUANNo"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PreUANNo"]);
				lblisPreviousESI.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PreviousESI"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PreviousESI"]);
				lblPreviousESICode.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PreESICode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PreESICode"]);
				lblLastDrawnSalary.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PreLastDrawnSalary"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PreLastDrawnSalary"]);

				//------------- Guarantor Details --------------------
				// Guarantor One
				lblGName1.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["GOneName"])) ? "N/A" : Convert.ToString(dt.Rows[0]["GOneName"]);
				lblGFatherName1.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["GOneFatherName"])) ? "N/A" : Convert.ToString(dt.Rows[0]["GOneFatherName"]);
				lblGMobile1.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["GOneMobileNo"])) ? "N/A" : Convert.ToString(dt.Rows[0]["GOneMobileNo"]);

				// Guarantor Two
				lblGName2.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["GTwoName"])) ? "N/A" : Convert.ToString(dt.Rows[0]["GTwoName"]);
				lblGFatherName2.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["GTwoFatherName"])) ? "N/A" : Convert.ToString(dt.Rows[0]["GTwoFatherName"]);
				lblGMobile2.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["GTwoMobileNo"])) ? "N/A" : Convert.ToString(dt.Rows[0]["GTwoMobileNo"]);


				//------------- Gunman Details --------------------

				lblLicenceNo.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["LicenceNo"])) ? "N/A" : Convert.ToString(dt.Rows[0]["LicenceNo"]);
				lblLicenceName.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["LicenceName"])) ? "N/A" : Convert.ToString(dt.Rows[0]["LicenceName"]);
				lblWeaponNo.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["WeaponNo"])) ? "N/A" : Convert.ToString(dt.Rows[0]["WeaponNo"]);
				lblWeaponType.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["WeaponType"])) ? "N/A" : Convert.ToString(dt.Rows[0]["WeaponType"]);
				lblAmmunitionStock.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["AmmunitionStock"])) ? "N/A" : Convert.ToString(dt.Rows[0]["AmmunitionStock"]);
				lblIssueAuth.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["IssuingAuthority"])) ? "N/A" : Convert.ToString(dt.Rows[0]["IssuingAuthority"]);
				lblLicenceIssueDate.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["LicenceIssueDate"])) ? "N/A" : Convert.ToString(dt.Rows[0]["LicenceIssueDate"]);
				lblValidUpto.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["ValidUpto"])) ? "N/A" : Convert.ToString(dt.Rows[0]["ValidUpto"]);
				lblLicenceAdd.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["LicenceAddress"])) ? "N/A" : Convert.ToString(dt.Rows[0]["LicenceAddress"]);

				//------------- Document Details --------------------
				// Bank Details
				lblPayMode.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PayMode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["PayMode"]);
				lblBankName.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["BankCode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["BankCode"]);
				lblAccountNo.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["AccNo"])) ? "N/A" : Convert.ToString(dt.Rows[0]["AccNo"]);
				lblIFSCCode.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["IFSCCode"])) ? "N/A" : Convert.ToString(dt.Rows[0]["IFSCCode"]);
				lblBankAddress.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["BankAddress"])) ? "N/A" : Convert.ToString(dt.Rows[0]["BankAddress"]);

				lblQualification.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Qualification"])) ? "N/A" : Convert.ToString(dt.Rows[0]["Qualification"]);
				lblIDProof.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["IDProof"])) ? "N/A" : Convert.ToString(dt.Rows[0]["IDProof"]);
				lblResiProof.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["ResidentProof"])) ? "N/A" : Convert.ToString(dt.Rows[0]["ResidentProof"]);
				lblResIdNo.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["ResidentialDocmentNo"])) ? "N/A" : Convert.ToString(dt.Rows[0]["ResidentialDocmentNo"]);
				lblResExipryDate.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["ResiDocExpDate"])) ? "N/A" : Convert.ToString(dt.Rows[0]["ResiDocExpDate"]);

				imgEducationalCertificate.Text = Convert.ToString(dt.Rows[0]["EduCertificationDOC"]);
				imgIDProof.Text = Convert.ToString(dt.Rows[0]["IDProofDOC"]);
				imgIDProofBack.Text = Convert.ToString(dt.Rows[0]["IDProofBackDoc"]);
				imgResidentilProof.Text = Convert.ToString(dt.Rows[0]["ResidentialProofDOC"]);
				imgResidentialProofBack.Text = Convert.ToString(dt.Rows[0]["ResidentialProofBackDOC"]);
				imgExperienceLetter.Text = Convert.ToString(dt.Rows[0]["ExpLetterDOC"]);
				imgGunLicence.Text = Convert.ToString(dt.Rows[0]["GunLicenceDOC"]);
				imgHandsImpression.Text = Convert.ToString(dt.Rows[0]["HandsImpressionDOC"]);
				imgCandidate.ImageUrl = APIFolderPath + "EmployeePhoto/"  + Convert.ToString(dt.Rows[0]["EmpPhotoDOC"]);
				rblDeviation.SelectedIndex = 0;
				imgBankPassBook.Text = Convert.ToString(dt.Rows[0]["PassBookDoc"]);
				ClientCode = Convert.ToString(dt.Rows[0]["ClientCode"]);
				UnitCode = Convert.ToString(dt.Rows[0]["UnitCode"]);
			}
		}

		protected void imgEducationalCertificate_Click(object sender, EventArgs e)
		{
			try
			{
				string filename = imgEducationalCertificate.Text;
				bool isFileName = filename.Contains(".");
				if (isFileName)
				{
					string Url = APIFolderPath + "EducationalCertificate/" + filename;
					lblDocName.Text = "Education Certificate Document";
					ImageDoc.ImageUrl = Url;
					ScriptManager.RegisterStartupScript(this, this.GetType(), "showDocumentModal", "$(document).ready(function() { showDocumentModal(); });", true);
				}
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
			}
		}

		protected void imgIDProof_Click(object sender, EventArgs e)
		{
			try
			{
				string filename = imgIDProof.Text;
				bool isFileName = filename.Contains(".");
				if (isFileName)
				{
					string Url = APIFolderPath + "IDProof/" + filename;
					lblDocName.Text = "IDProof Front Document";
					ImageDoc.ImageUrl = Url;
					ScriptManager.RegisterStartupScript(this, this.GetType(), "showDocumentModal", "$(document).ready(function() { showDocumentModal(); });", true);
				}
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
			}
		}

		protected void imgIDProofBack_Click(object sender, EventArgs e)
		{
			try
			{
				string filename = imgIDProof.Text;
				bool isFileName = filename.Contains(".");
				if (isFileName)
				{
					string Url = APIFolderPath + "IDProof/" + filename;
					lblDocName.Text = "IDProof Back Document";
					ImageDoc.ImageUrl = Url;
					ScriptManager.RegisterStartupScript(this, this.GetType(), "showDocumentModal", "$(document).ready(function() { showDocumentModal(); });", true);
				}
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
			}
		}

		protected void imgResidentilProof_Click(object sender, EventArgs e)
		{
			try
			{
				string filename = imgResidentilProof.Text;
				bool isFileName = filename.Contains(".");
				if (isFileName)
				{
					string Url = APIFolderPath + "ResidentialProof/" + filename;
					lblDocName.Text = "Residential Proof Front Document";
					ImageDoc.ImageUrl = Url;
					ScriptManager.RegisterStartupScript(this, this.GetType(), "showDocumentModal", "$(document).ready(function() { showDocumentModal(); });", true);
				}
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
			}
		}

		protected void imgResidentialProofBack_Click(object sender, EventArgs e)
		{
			try
			{
				string filename = imgResidentilProof.Text;
				bool isFileName = filename.Contains(".");
				if (isFileName)
				{
					string Url = APIFolderPath + "ResidentialProof/" + filename;
					lblDocName.Text = "Residential Proof Back Document";
					ImageDoc.ImageUrl = Url;
					ScriptManager.RegisterStartupScript(this, this.GetType(), "showDocumentModal", "$(document).ready(function() { showDocumentModal(); });", true);
				}
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
			}
		}

		protected void imgExperienceLetter_Click(object sender, EventArgs e)
		{
			try
			{
				string filename = imgExperienceLetter.Text;
				bool isFileName = filename.Contains(".");
				if (isFileName)
				{
					string Url = APIFolderPath + "ExpLetter/" + filename;
					lblDocName.Text = "Experience Letter Document";
					ImageDoc.ImageUrl = Url;
					ScriptManager.RegisterStartupScript(this, this.GetType(), "showDocumentModal", "$(document).ready(function() { showDocumentModal(); });", true);
				}
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
			}
		}

		protected void imgGunLicence_Click(object sender, EventArgs e)
		{
			try
			{
				string filename = imgGunLicence.Text;
				bool isFileName = filename.Contains(".");
				if (isFileName)
				{
					string Url = APIFolderPath + "GunLicence/" + filename;
					lblDocName.Text = "Gun Licence Document";
					ImageDoc.ImageUrl = Url;
					ScriptManager.RegisterStartupScript(this, this.GetType(), "showDocumentModal", "$(document).ready(function() { showDocumentModal(); });", true);
				}
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
			}
		}

		protected void imgHandsImpression_Click(object sender, EventArgs e)
		{
			try
			{
				string filename = imgHandsImpression.Text;
				bool isFileName = filename.Contains(".");
				if (isFileName)
				{
					string Url = APIFolderPath + "HandsImpression/" + filename;
					lblDocName.Text = "Hands Impression Document";
					ImageDoc.ImageUrl = Url;
					ScriptManager.RegisterStartupScript(this, this.GetType(), "showDocumentModal", "$(document).ready(function() { showDocumentModal(); });", true);
				}
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
			}
		}

		protected void imgBankPassBook_Click(object sender, EventArgs e)
		{
			try
			{
				string filename = imgBankPassBook.Text;
				bool isFileName = filename.Contains(".");
				if (isFileName)
				{
					string Url = APIFolderPath + "BankPassBook/" + filename;
					lblDocName.Text = "Bank PassBook Document";
					ImageDoc.ImageUrl = Url;
					ScriptManager.RegisterStartupScript(this, this.GetType(), "showDocumentModal", "$(document).ready(function() { showDocumentModal(); });", true);
				}
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
			}
		}

		protected void BtnReject_Click(object sender, EventArgs e)
		{
			try
			{
				CRegistration reg = new CRegistration();
				reg.RegistrationID = lblRegistrationID.Text;
				reg.Deviation = (rblDeviation.SelectedValue == "0") ? "No" : "Yes";
				reg.DeviationRemark = txtRemark.Text;
				reg.ApplicationRemarks = txtApplicationRemark.Text;
				reg.ApprovedBy = Convert.ToString(Session["UserID"]);
				reg.FilePath = string.Empty;
				reg.RegStatus = "Rejected";
				reg.ApplicationStatus = "Rejected";
				reg.Compid = Convert.ToInt32(Session["CompanyID"]);
				CanRegistration cr = new CanRegistration();
				string outmsg = cr.UpdateCandidateRegistration(reg);
				if (outmsg == "")
				{
					Session["AlertMessage"] = "Candidate Rejected Successfully !";
					Response.Redirect("/Dashboard");
				}
				RegStatus = "Rejected";
				ApplicationStatus = "Rejected";
				BtnApprove.Visible = false;
				BtnReject.Visible = false;
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
			}
		}

		protected void BtnCorrection_Click(object sender, EventArgs e)
		{
			try
			{
				CRegistration reg = new CRegistration();
				reg.RegistrationID = lblRegistrationID.Text;
				reg.Deviation = (rblDeviation.SelectedValue == "0") ? "No" : "Yes";
				reg.DeviationRemark = txtRemark.Text;
				reg.ApplicationRemarks = txtApplicationRemark.Text;
				reg.ApprovedBy = Convert.ToString(Session["UserID"]);
				reg.FilePath = string.Empty;
				reg.ApplicationStatus = "Correction";
				reg.RegStatus = "Complete";
				reg.Compid = Convert.ToInt32(Session["CompanyID"]);
				CanRegistration cr = new CanRegistration();
				string outmsg = cr.UpdateCandidateRegistrationForCorrection(reg);
				if (outmsg == "")
				{
					Session["AlertMessage"] = "Candidate Rejected for Correction !";
					Response.Redirect("/Dashboard");
				}
				ApplicationStatus = "Correction";
				RegStatus = "Complete";
				BtnApprove.Visible = false;
				BtnCorrection.Visible = false;
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
			}
		}

		protected void BtnApprove_Click(object sender, EventArgs e)
		{
			CanRegistration cr = new CanRegistration();
			if ((chkBoxEmpCode.Checked) && (txtEmpCode.Text != ""))
			{
				CRegistration regEmpcode = new CRegistration();
				regEmpcode.EmpCode = txtEmpCode.Text;
				regEmpcode.Compid = Convert.ToInt32(Session["CompanyID"]);
				string ChechCode = cr.CheckEmployeeCode(regEmpcode);
				if (ChechCode == "1")
				{
					ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Sorry!This Employee Code Already Exist")})</script>", false);
					return;
				}
			}
			try
			{
				//-------------End Check For Existing Employee---------------------------------
				BtnApprove.Enabled = false;
				BtnReject.Enabled = false;
				CRegistration reg = new CRegistration();
				reg.RegistrationID = lblRegistrationID.Text;
				reg.Deviation = (rblDeviation.SelectedValue == "0") ? "No" : "Yes";
				reg.DeviationRemark = txtRemark.Text;
				reg.ApplicationRemarks = txtApplicationRemark.Text;
				reg.ApprovedBy = Convert.ToString(Session["UserID"]);
				reg.FilePath = ApplicationPath + "\\HRManagementSystem\\EmployeePhoto\\";
				reg.RegStatus = "Approved";
				reg.ApplicationStatus = "Approved";
				reg.EmpCode = txtEmpCode.Text;
				reg.Mannual = Convert.ToInt32(chkBoxEmpCode.Checked);
				reg.Compid = Convert.ToInt32(Session["CompanyID"]);
				RegStatus = "Approved";
				ApplicationStatus = "Approved";
				RegNumber = lblRegistrationID.Text;

				string outmsg = cr.UpdateCandidateRegistration(reg);
				RegEmpCode = outmsg;
				if(outmsg != null)
				{
					Session["AlertMessage"] = "Candidate has been approved for Employee and Employee Code is :" + outmsg;
					Response.Redirect("/Dashboard");
				}
			}
			catch(Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
			}
		}

		protected void BtnBack_Click(object sender, EventArgs e)
		{
			Response.Redirect("/Dashboard");
		}
	}
}