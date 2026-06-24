using BalLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSecurityERP.Masters
{
    public partial class DepartmentMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindGridView();
                    BindMaxID();
                    ViewState["flag"] = 0;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }


        public void BindMaxID()
        {
            MasterCommonClass mc = new MasterCommonClass();
            int MaxID = mc.FatchMaxRecord("DEPARTMENTMASTER", "DepartmentCode");
            txtDepartmentCode.Text = (MaxID + 1).ToString();
        }

        protected void ClearFormData()
        {
            txtDepartmentName.Text = string.Empty;
            SaveBtn.Text = "Save";
            ViewState["flag"] = 0;
        }


        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            try
            {
                ClearFormData();
                BindMaxID();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                DepartmentMasters dp = new DepartmentMasters();
                dp.flag = Convert.ToInt32(ViewState["flag"]);
                dp.DepartmentCode = Convert.ToInt32(txtDepartmentCode.Text);
                dp.DepartmentName = txtDepartmentName.Text;
                dp.UserID = Convert.ToString(Session["UserID"]);
                dp.CompID = Convert.ToInt32(Session["CompanyID"]);
                MasterCommonClass mc = new MasterCommonClass();
                string result = mc.InsertDepartmentDetails(dp);
                if (result == "Record Saved Successfully")
                {
                    ClearFormData();
                    BindMaxID();
                    BindGridView();
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("Record Saved Successfully")})</script>", false);
                }
            }
            catch (SqlException SqlEx)
            {
                if (SqlEx.Number == 2627)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Data already exists.")})</script>", false);
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }


        protected void BindGridView()
        {
            try
            {
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.BindTableData("DEPARTMENTMASTER", "DepartmentCode");
                gvDepartmentMaster.DataSource = dt;
                gvDepartmentMaster.DataBind();
                Session["DepartmentMasterData"] = dt;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
            }
        }


        protected void gvDepartmentMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "EditDepartment")
                {
                    string DepartmentCode = e.CommandArgument.ToString();
                    DataTable dtFromSession = (DataTable)Session["DepartmentMasterData"];
                    DataRow[] rows = dtFromSession.Select("DepartmentCode = " + DepartmentCode);
                    if (rows.Length > 0)
                    {
                        DataRow row = rows[0];
                        txtDepartmentCode.Text = rows[0]["DepartmentCode"].ToString();
                        txtDepartmentName.Text = rows[0]["DepartmentName"].ToString();
                        ViewState["flag"] = 1;
                        SaveBtn.Text = "Update";
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }
    }
}