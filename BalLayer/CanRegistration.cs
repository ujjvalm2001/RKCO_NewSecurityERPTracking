using DalLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BalLayer
{
    public class CanRegistration
    {
        public string UpdateCanPhoto(string Reg_ID, int Company_ID, string File_Name)
        {
            SqlParameter[] sqlParam = {
                new SqlParameter("@RegId",Reg_ID),
                new SqlParameter("@Compid",Company_ID),
                new SqlParameter("@PhotoName",File_Name),
            };
            int row = DBClass.ExecuteProcedure("UpdateEmpPhotoName", sqlParam);
            if (row > 0)
                return "Success";
            else
                return "Failed";
        }

        public DataTable BindTableDataValue(string SelectQuery)
        {
            DataTable dt = DBClass.GetDataTable(SelectQuery);
            return dt;
        }

        public DataTable BindUnitforClient(int CompanyID, int ClientID)
        {
            SqlParameter[] sp = {
                                    new SqlParameter("@ComId" ,CompanyID),
                                    new SqlParameter("@ClientID" , ClientID)
                                };
            DataTable dt = DBClass.GetDataTableByProc("SearchUnitforClientSP", sp);
            return dt;
        }

        public DataTable GetCandidateDetails(string RegId, string AadharNo, string CompanyId)
        {
            SqlParameter[] sqlParam = {
                new SqlParameter("@RegId",RegId),
                new SqlParameter("@AadharNo",AadharNo),
                new SqlParameter("@Compid",CompanyId)
            };

            DataTable dt = DBClass.GetDataTableByProc("GetCandidateDataSP", sqlParam);
            return dt;
        }


        public DataTable GetCandiDateDetails(string UserId, string CompanyId)
        {
            SqlParameter[] sqlParam = {
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@CompId",CompanyId),
            };

            DataTable dt = DBClass.GetDataTableByProc("GetCandidateDetails", sqlParam);
            return dt;
        }

        public DataTable GetCandiDateDetailsForCorrection(string UserId, string CompanyId)
        {
            SqlParameter[] sqlParam = {
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@CompId",CompanyId),
            };

            DataTable dt = DBClass.GetDataTableByProc("GetCorrectionCandidateDetails", sqlParam);
            return dt;
        }

        public DataTable GetCandidateDetailsFromRegId(string RegId, string CompanyId)
        {
            SqlParameter[] sqlParam = {
                new SqlParameter("@RegId",RegId),
                new SqlParameter("@Compid",CompanyId)
            };

            DataTable dt = DBClass.GetDataTableByProc("GetCandidateDataFromRegIDSP", sqlParam);
            return dt;
        }


        public string UpdateCandidateRegistrationForCorrection(CRegistration reg)
        {
            string Result = string.Empty;
            try
            {
                SqlParameter[] sp = {

                                    new SqlParameter("@RegistrationID" ,reg.RegistrationID),
                                    new SqlParameter("@Deviation" ,reg.Deviation),
                                    new SqlParameter("@DeviationRemark" ,reg.DeviationRemark),
                                    new SqlParameter("@ApplicationRemarks" ,reg.ApplicationRemarks),
                                    new SqlParameter("@ApprovedBy" ,reg.ApprovedBy),
                                    new SqlParameter("@ApplicationStatus" ,reg.ApplicationStatus),
                                    new SqlParameter("@RegStatus" ,reg.RegStatus),
                                    new SqlParameter("@FilePath" ,reg.FilePath),
                                    new SqlParameter("@EmpCode" , reg.EmpCode),
                                    new SqlParameter("@Mannual" , reg.Mannual),
                                    new SqlParameter("@Compid" , reg.Compid)
                                };

                Result = DBClass.ExecuteProcedureOutParam("@outMessage", "UpdateCandidateRegistrationSP", sp);
            }
            catch (Exception ex) { throw ex; }

            return Result;
        }



        public string UpdateCandidateRegistration(CRegistration reg)
        {
            string Result = string.Empty;
            try
            {
                SqlParameter[] sp = {

                                    new SqlParameter("@RegistrationID" ,reg.RegistrationID),
                                    new SqlParameter("@Deviation" ,reg.Deviation),
                                    new SqlParameter("@ApplicationStatus" ,reg.ApplicationStatus),
                                    new SqlParameter("@DeviationRemark" ,reg.DeviationRemark),
                                    new SqlParameter("@ApplicationRemarks" ,reg.ApplicationRemarks),
                                    new SqlParameter("@ApprovedBy" ,reg.ApprovedBy),
                                    new SqlParameter("@RegStatus" ,reg.RegStatus),
                                    new SqlParameter("@FilePath" ,reg.FilePath),
                                    new SqlParameter("@EmpCode" , reg.EmpCode),
                                    new SqlParameter("@Mannual" , reg.Mannual),
                                    new SqlParameter("@Compid" , reg.Compid)
                                };

                Result = DBClass.ExecuteProcedureOutParam("@outMessage", "UpdateCandidateRegistrationSP", sp);
            }
            catch (Exception ex) { throw ex; }

            return Result;
        }

        public DataTable BindCandidateRegistrationPendingData(int UserID, string RegistrationID, string Role, int Compid)
        {
            DataTable dt = null;
            try
            {
                SqlParameter[] sp = {
                                    new SqlParameter("@UserID" , UserID),
                                    new SqlParameter("@RegistrationID" , RegistrationID),
                                    new SqlParameter("@Role" , Role),
                                    new SqlParameter("@Compid" ,Compid)
                                };

                if (Role.ToUpper() == "User".ToUpper() || Role.ToUpper() == "Administrator".ToUpper() || Role.ToString().ToLower() == "superadministrator")
                    dt = DBClass.GetDataTableByProc("SelectCandidatePendingRegistrationSP", sp);


            }
            catch (Exception ex) { throw ex; }
            return dt;
        }

		public string CheckEmployeeCode(CRegistration reg)
		{
			string Result = string.Empty;
			try
			{
				SqlParameter[] sp = {
									new SqlParameter("@EmpCode" ,reg.EmpCode),
									new SqlParameter("@Compid" , reg.Compid)
								};

				Result = DBClass.ExecuteProcedureOutParam("@outMessage", "CheckExistingEmployeeCode", sp);
			}
			catch (Exception ex) { throw ex; }

			return Result;
		}
		public class CandidateRegistrationDocument
        {
            public string PaymentMode { get; set; }
            public string BankName { get; set; }
            public string AccNo { get; set; }
            public string IFSCode { get; set; }
            public string BankAddress { get; set; }
            public string Qualification { get; set; }
            public string IdProof { get; set; }
            public string ResdentProof { get; set; }
            public string ResdentProofIdNumber { get; set; }
            public DateTime ResdentProofExpiryDate { get; set; }
            public string Qualification_Doc { get; set; }
            public string IdProof_Doc { get; set; }
            public string IdProof_Doc_Back { get; set; }
            public string ResdentProof_Doc { get; set; }
            public string ResdentProof_Doc_Back { get; set; }
            public string ExperienceLetterDoc { get; set; }
            public string GunLicenceDoc { get; set; }
            public string HandsImpressionDoc { get; set; }
            public string BankPassbookDoc { get; set; }
            public string RegistrationId { get; set; }
            public int CompId { get; set; }
        }

        public class CRegistration
        {
            public int flag { get; set; }
            public string RegistrationID { get; set; }
            public string OldEmpCode { get; set; }
            public string Salutation { get; set; }
            public string CandidateName { get; set; }
            public DateTime DOJ { get; set; }
            public DateTime DateofBirth { get; set; }
            public string Gender { get; set; }
            public string MaritalStatus { get; set; }
            public string FatherName { get; set; }
            public string MotherName { get; set; }
            public string Height { get; set; }
            public string Inches { get; set; }
            public string Weight { get; set; }
            public int ClientCode { get; set; }
            public int UnitCode { get; set; }
            public string IdentityMark { get; set; }
            public string JobType { get; set; }

            public string VillHouseNo { get; set; }
            public string PostOffice { get; set; }
            public string PoliceStation { get; set; }
            public string Districts { get; set; }
            public int StateID { get; set; }
            public string MobileNo { get; set; }
            public string PhoneNo { get; set; }

            public string VillHouseNoPer { get; set; }
            public string PostOfficePer { get; set; }
            public string PoliceStationPer { get; set; }
            public string DistrictsPer { get; set; }
            public int StateIDPer { get; set; }
            public string MobileNoPer { get; set; }
            public string PhoneNoPer { get; set; }

            public string PayMode { get; set; }
            public int BankCode { get; set; }
            public string AccNo { get; set; }
            public string IFSCCode { get; set; }
            public string BloodGroup { get; set; }



            public string Qualification { get; set; }
            public int Desicode { get; set; }
            public string Category { get; set; }
            public int BranchCode { get; set; }
            public string IsBankPassbook { get; set; }
            public string IsRejoin { get; set; }
            public string RecruitmentType { get; set; }
            public string RecruitmentTypeDetail { get; set; }
            public string IDProof { get; set; }
            public string ResidentProof { get; set; }
            public string AadharCardNo { get; set; }
            public string EduCertificationDOC { get; set; }
            public string IDProofDOC { get; set; }
            public string PassBookDoc { get; set; }
            public string EmpPhotoDOC { get; set; }
            public string ResidentialProofDOC { get; set; }
            public string Deviation { get; set; }
            public string DeviationRemark { get; set; }
            public DateTime InsertDate { get; set; }
            public string InsertedBy { get; set; }
            public DateTime ApprovedDate { get; set; }
            public string ApprovedBy { get; set; }
            public string RegStatus { get; set; }
            public int Compid { get; set; }
            public DateTime IdProofExpDate { get; set; }
            public DateTime ResiDocExpDate { get; set; }
            public string IDProofDocmentNo { get; set; }
            public string ResidentialDocmentNo { get; set; }
            public string AadharNo { get; set; }
            public string FilePath { get; set; }

            public string AadharFlag { get; set; }
            public string UANFlag { get; set; }
            public string ESIFlag { get; set; }
            public string UANNo { get; set; }
            public string ESINo { get; set; }
            public string EmpCode { get; set; }
            public int Mannual { get; set; }

            public string SpouseName { get; set; }
            public int ESIZone { get; set; }
            public string ZonalOffice { get; set; }

            public string NoName { get; set; }
            public DateTime NoDOB { get; set; }
            public string NoRelation { get; set; }
            public string NoAddress { get; set; }
            public string NoResWith { get; set; }
            public string NoIsDep { get; set; }
            public int NoIsPF { get; set; }
            public string PanNo { get; set; }
            public string BankAddress { get; set; }
            public string PrePinCode { get; set; }
            public string PerPinCode { get; set; }
            public string ApplicationRemarks { get; set; }
            public string ApplicationStatus { get; set; }


        }
    }


}
