using BalLayer;
using DalLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSecurityERP.Masters
{
    public partial class UserCreationMaster : System.Web.UI.Page
    {
        public int CompId = 0;
        loginCommonClass lc = new loginCommonClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            CompId = Convert.ToInt32(Session["CompanyID"].ToString());
            try
            {
                if (!IsPostBack)
                {
                    ViewState["flag"] = 0;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }

        protected void ClearFormData()
        {
            txtEmpCode.Text = txtUserName.Text = txtUserId.Text = txtUserPass.Text = txtUserEmailId.Text = txtMobile.Text = string.Empty;
            ddlStatus.SelectedValue = ddlUserType.SelectedValue = "0";
            SaveBtn.Text = "Save";
            ViewState["flag"] = 0;
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            try
            {
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.BindTableDataValue("Employee", "Empcode", txtEmpCode.Text.ToString());
                if (dt.Rows.Count > 0)
                {
                    txtUserName.Text = dt.Rows[0]["Empname"].ToString();
                    ddlStatus.SelectedValue = dt.Rows[0]["EmpStatus"].ToString();
                    txtMobile.Text = dt.Rows[0]["ContactNo"].ToString();
                    txtUserEmailId.Text = dt.Rows[0]["EmailID"].ToString();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Info", $"<script>info({JsonConvert.SerializeObject("Record Not Found !!!")})</script>", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            try
            {
                ClearFormData();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            UserCreationMasters um = new UserCreationMasters();
            um.Id = Convert.ToInt32(HdnFieldUserCreationId.Value);
            um.Flag = Convert.ToInt32(ViewState["flag"]);
            um.EmpCode = txtEmpCode.Text;
            um.UserName = txtUserName.Text;
            um.UserId = txtUserId.Text;
            um.UserPassword = lc.Encrypt(txtUserPass.Text);
            um.UserType = ddlUserType.SelectedValue;
            um.Status = ddlStatus.SelectedValue;
            um.EmailId = txtUserEmailId.Text;
            um.MobileNo = txtMobile.Text;
            um.CompID = Convert.ToInt32(Session["CompanyID"]);
            um.CreatedBy = Convert.ToString(Session["UserID"]);
            MasterCommonClass mc = new MasterCommonClass();
            string result = mc.InsertUserCreationMasterData(um);
            if (result == "Record Saved Successfully")
            {
                ClearFormData();
                BindGridView();
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("Record Saved Successfully")})</script>", false);
            }
        }

        protected void BindGridView()
        {
            try
            {
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.BindTableData("USERS", "ID");
                gvUserCreationMaster.DataSource = dt;
                gvUserCreationMaster.DataBind();
                Session["UserEditData"] = dt;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
            }
        }

        protected void gvUserCreationMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "EditUser")
                {
                    string Id = e.CommandArgument.ToString();
                    DataTable dtFromSession = (DataTable)Session["UserEditData"];
                    DataRow[] rows = dtFromSession.Select("ID = " + Id);
                    if (rows.Length > 0)
                    {
                        DataRow row = rows[0];
                        HdnFieldUserCreationId.Value = Id;
                        txtEmpCode.Text = rows[0]["EmpCode"].ToString();
                        txtUserName.Text = rows[0]["UserName"].ToString();
                        txtUserId.Text = rows[0]["UserID"].ToString();
                        String Password = rows[0]["UserPassword"].ToString();
                        txtUserPass.Text = lc.Decrypt(Password);
                        ddlUserType.SelectedValue = rows[0]["UserType"].ToString();
                        ddlStatus.SelectedValue = rows[0]["ActiveStatus"].ToString();
                        txtUserEmailId.Text = rows[0]["EmailId"].ToString();
                        txtMobile.Text = rows[0]["MobileNo"].ToString();
                        ViewState["flag"] = 1;
                        btnShow.Enabled = false;
                        SaveBtn.Text = "Update";
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + "No Such Record Found !!!")})</script>", false);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
            }
        }
    }
}