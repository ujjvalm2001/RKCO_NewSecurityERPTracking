using BalLayer;
using DalLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSecurityERP.Tracking.Reports
{
    public partial class UnitWiseReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindUnitDropDown();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }


        public void BindUnitDropDown()
        {
            try
            {
                int CompId = Convert.ToInt32(Session["CompanyID"]);
                SqlParameter[] sp =
                {
                     new SqlParameter("@CompID" ,CompId)

                };

                DataTable dt = DBClass.GetDataTableByProc("GetAllUnit_Tracking", sp);
                lstUnitCode.DataSource = dt;
                lstUnitCode.DataTextField = "UnitNameWithCode";
                lstUnitCode.DataValueField = "unitcode";
                lstUnitCode.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        public void BindGrid()
        {
            StringBuilder UnitCodevalue = new StringBuilder();
            foreach (ListItem item in lstUnitCode.Items)
            {
                if (item.Selected)
                {
                    UnitCodevalue.Append(item.Value).Append(",");
                }
            }
            string UnitCodes = UnitCodevalue.ToString().TrimEnd(',');
            DateTime startdate = Convert.ToDateTime(txtStartDate.Text);
            DateTime EndDate = Convert.ToDateTime(txtEndDate.Text);
            if (!String.IsNullOrEmpty(UnitCodes))
            {
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.BindUnitWiseDetailData(UnitCodes, startdate, EndDate);
                if (dt.Rows.Count > 0)
                {
                    gvUnitWiseReport.DataSource = dt;
                    gvUnitWiseReport.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("No Record Found !!!")})</script>", false);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Please Select Any UnitCode !!!")})</script>", false);
            }
        }

        protected void gvUnitWiseReport_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "ShowDetails")
            {
                string argument = e.CommandArgument.ToString();
                string[] args = argument.Split('|');
                string unitCode = args[0];
                string supervisorId = args[1];
                string startDate = args[2];
                string visitType = args[3];
                string isVisited = args[4];
                if(isVisited.ToLower() == "visited")
                {
                    string url = $"/report-detail?supervisor={supervisorId}&unitcode={unitCode}&startdate={startDate}&VisitType={visitType}";

                    // Register JavaScript to open the URL in a new tab
                    string script = $"window.open('{url}', '_blank');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "OpenReport", script, true);
                }                
            }
        }
    }
}