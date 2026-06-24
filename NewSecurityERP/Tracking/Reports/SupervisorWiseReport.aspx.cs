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
    public partial class SupervisorWiseReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindSupervisorDropDown();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }

        }

        public void BindSupervisorDropDown()
        {
            try
            {
                int CompId = Convert.ToInt32(Session["CompanyID"]);
                SqlParameter[] sp =
                {
                     new SqlParameter("@CompID" ,CompId)

                };

                DataTable dt = DBClass.GetDataTableByProc("GetAllSupervisor_Tracking", sp);
                lstSupervisor.DataSource = dt;
                lstSupervisor.DataTextField = "EmpNameWithCode";
                lstSupervisor.DataValueField = "empcode";
                lstSupervisor.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void BindGrid()
        {
            StringBuilder SupervisorIdvalue = new StringBuilder();
            foreach (ListItem item in lstSupervisor.Items)
            {
                if (item.Selected)
                {
                    SupervisorIdvalue.Append(item.Value).Append(",");
                }
            }
            string SupervisorId = SupervisorIdvalue.ToString().TrimEnd(',');
            DateTime startdate = Convert.ToDateTime(txtStartDate.Text);
            DateTime EndDate = Convert.ToDateTime(txtEndDate.Text);
            if (!String.IsNullOrEmpty(SupervisorId))
            {
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.BindSupervisorWiseDetailData(SupervisorId, startdate, EndDate);
                if (dt.Rows.Count > 0)
                {
                    gvSupervisorWiseReport.DataSource = dt;
                    gvSupervisorWiseReport.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("No Record Found !!!")})</script>", false);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Please Select Any Supervisor !!!")})</script>", false);
            }
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void gvSupervisorWiseReport_RowCommand(object sender, GridViewCommandEventArgs e)
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
                string visitcat=args[5];
                string CreateDateTime = args[6];
                if (isVisited.ToLower() == "visited")
                {
                    string url = $"/report-detail?supervisor={supervisorId}&unitcode={unitCode}&startdate={startDate}&VisitType={visitType}&visitcat={visitcat}&CreateDateTime={CreateDateTime}";

                    // Register JavaScript to open the URL in a new tab
                    string script = $"window.open('{url}', '_blank');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "OpenReport", script, true);
                }                
            }
        }
    }
}
