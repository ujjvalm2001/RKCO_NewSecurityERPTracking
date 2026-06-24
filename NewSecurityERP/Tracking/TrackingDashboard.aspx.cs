using DalLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSecurityERP
{
    public partial class TrackingDashboard : System.Web.UI.Page
    {
        string EmpImageURL = ConfigurationManager.AppSettings["EmployeeImgURL"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDashboardDetails();
                GetOnlineOfflineUsersDetails();
            }
        }

        public void GetOnlineOfflineUsersDetails()
        {
            try
            {
                int CompId = Convert.ToInt32(Session["CompanyID"]);
                SqlParameter[] sp =
                {
                    new SqlParameter("@CompId", CompId)
                };


                DataTable dt = DBClass.GetDataTableByProc("GetActiveInactiveUserData", sp);

                dt.Columns.Add("EmpPhotoUrl", typeof(string));

                foreach (DataRow row in dt.Rows)
                {
                    if (!string.IsNullOrEmpty(row["EmpPhotoName"].ToString()))
                    {
                        row["EmpPhotoUrl"] = EmpImageURL + row["EmpPhotoName"].ToString();
                    }
                    else
                    {
                        row["EmpPhotoUrl"] = ""; 
                    }
                }

                // Create DataView for active users
                DataView dvActive = new DataView(dt);
                dvActive.RowFilter = "Status = 'Active'";
                ActiveUserCount.Text = dvActive.Count.ToString();

                // Create DataView for inactive users
                DataView dvInactive = new DataView(dt);
                dvInactive.RowFilter = "Status = 'Inactive'";
                InActiveUserCount.Text = dvInactive.Count.ToString();

                // Bind data to repeaters
                repeaterActiveUsers.DataSource = dvActive;
                repeaterActiveUsers.DataBind();

                repeaterInActiveUser.DataSource = dvInactive;
                repeaterInActiveUser.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void GetDashboardDetails()
        {
            try
            {
                int CompId = Convert.ToInt32(Session["CompanyID"]);
                SqlParameter[] sp =
                {
                    new SqlParameter("@CompId", CompId)
                };

                DataTable dt = DBClass.GetDataTableByProc("GetDashboardCountDetails", sp);
                if(dt.Rows.Count > 0)
                {
                    lblTotalSupervisor.Text = dt.Rows[0]["TotalSupervisor"].ToString();
                    lblTotalUnit.Text = dt.Rows[0]["TotalUnit"].ToString();
                    lblTotalClient.Text = dt.Rows[0]["TotalClient"].ToString();
                    lblTotalBranch.Text = dt.Rows[0]["TotalBranch"].ToString();
                }                
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }
    }
}