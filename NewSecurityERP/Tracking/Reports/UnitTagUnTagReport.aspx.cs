using BalLayer;
using DalLayer;
using NewSecurityERP.Masters;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSecurityERP.Tracking.Reports
{
    public partial class UnitTagUnTagReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void BtnShowReport_Click(object sender, EventArgs e)
        {
            try
            {
                string status = ddlStatus.SelectedValue;

                SqlParameter[] sp =
                {
                    new SqlParameter("@Status", status)
                };
                DataTable dt = DBClass.GetDataTableByProc("GetUnitLatlngTagReport", sp);
                if (dt.Rows.Count > 0)
                {
                    gvUnitTagReport.DataSource = dt;
                    gvUnitTagReport.DataBind();
                }
                else
                {
                    gvUnitTagReport.DataSource = null;
                    gvUnitTagReport.DataBind();
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
            }
        }
    }
}