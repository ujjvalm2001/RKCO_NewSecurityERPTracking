using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BalLayer;
using Newtonsoft.Json;

namespace NewSecurityERP
{
    public partial class Dashboard : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            string alertMsg = Session["AlertMessage"] as string;
            if (!string.IsNullOrEmpty(alertMsg))
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject(alertMsg)})</script>", false);
                Session.Remove("AlertMessage"); 
            }
            try
            {
                if (!string.IsNullOrEmpty(Convert.ToString(Session["CompanyID"])))
                {
                    string LoginType = Convert.ToString(Session["loginType"]);
                    string UserID = Convert.ToString(Session["UserID"]);

                    if (!IsPostBack)
                    {
                        if (LoginType != "")
                        {
                            BindCandidateGrid(UserID, Convert.ToString(Session["CompanyID"]));
                        }
                    }
                }
                else Response.Redirect("~/Default.aspx");
            }
            catch (Exception ex) { Response.Write(ex.Message); }
        }
        #endregion

        public void BindCandidateGrid(string UserId, string CompanyId)
        {
            CanRegistration canReg = new CanRegistration();

            DataTable dt = canReg.GetCandiDateDetails(UserId, CompanyId);

            if (dt.Rows.Count > 0)
            {
                gvCandidateDetails.DataSource = dt;
            }

            else
            {
                gvCandidateDetails.DataSource = null;

            }
            gvCandidateDetails.DataBind();


            DataTable dt1 = canReg.GetCandiDateDetailsForCorrection(UserId, CompanyId);

            if (dt1.Rows.Count > 0)
            {
                gvCandidateforCorrection.DataSource = dt1;

            }
            else
            {
                gvCandidateforCorrection.DataSource = null;

            }
            gvCandidateforCorrection.DataBind();


        }


        protected void gvCandidateDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpDate")
            {
                LinkButton lnkbtn = (LinkButton)e.CommandSource;
                int index = Convert.ToInt32(lnkbtn.CommandArgument);
                GridViewRow row = gvCandidateDetails.Rows[index];

                // Find the cell values using cell index
                string lblRegId = row.Cells[2].Text; // Assuming RegistrationID is the first column
                string lblAadharNo = row.Cells[3].Text; // Assuming AadharCardNo is the second column

                Response.Redirect("~/NewUserRegistration?RegId=" + lblRegId + "&AadharNo=" + lblAadharNo + "");
            }
        }


        protected void gvCandidateDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void gvCandidateforCorrection_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpDate")
            {
                LinkButton lnkbtn = (LinkButton)e.CommandSource;
                int index = Convert.ToInt32(lnkbtn.CommandArgument);
                GridViewRow row = gvCandidateforCorrection.Rows[index];

                // Find the cell values using cell index
                string lblRegId = row.Cells[2].Text; // Assuming RegistrationID is the first column
                string lblAadharNo = row.Cells[3].Text; // Assuming AadharCardNo is the second column

                Response.Redirect("~/NewUserRegistration?RegId=" + lblRegId + "&AadharNo=" + lblAadharNo + "");
            }
        }

        protected void gvCandidateforCorrection_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}
