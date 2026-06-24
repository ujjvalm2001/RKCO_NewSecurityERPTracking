using BalLayer;
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

namespace NewSecurityERP.Transaction
{
    public partial class SendNotification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindGridView();
                    BindSupervisorDropDown();
                    BindMaxID();
                    ViewState["flag"] = 0;
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
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.BindTableDataValue("Employee", "ISSuperVisor", 1);
                ddlSendTo.DataSource = dt;
                ddlSendTo.DataTextField = "Empname";
                ddlSendTo.DataValueField = "Empcode";
                ddlSendTo.DataBind();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
            }
        }

        public void BindMaxID()
        {
            MasterCommonClass mc = new MasterCommonClass();
            int MaxID = mc.FatchMaxRecord("USERNOTIFICATIONS", "NotificationId");
            txtNotificationCode.Text = (MaxID + 1).ToString();
        }

        protected void ClearFormData()
        {
            txtNotificationTitle.Text = txtNotificationMessage.Text = string.Empty;
            ddlSendTo.Items.Clear();
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
                StringBuilder SendToValues = new StringBuilder();
                foreach (ListItem item in ddlSendTo.Items)
                {
                    if (item.Selected)
                    {
                        SendToValues.Append(item.Value).Append(",");
                    }
                }

                if (SendToValues.Length > 0)
                {
                    SendNotificationMasters nm = new SendNotificationMasters();
                    nm.NotificationCode = Convert.ToInt32(txtNotificationCode.Text);
                    nm.flag = Convert.ToInt32(ViewState["flag"]);
                    nm.NotificationTitle = txtNotificationTitle.Text;
                    nm.NotificationMessage = txtNotificationMessage.Text;
                    string sendToIds = SendToValues.ToString().TrimEnd(',');
                    nm.SendToIds = sendToIds;
                    nm.UserID = Convert.ToString(Session["UserID"]);
                    nm.CompID = Convert.ToInt32(Session["CompanyID"]);
                    MasterCommonClass mc = new MasterCommonClass();
                    string result = mc.InsertNotificationDetails(nm);
                    if (result == "Record Saved Successfully")
                    {
                        ClearFormData();
                        BindGridView();
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("Record Saved Successfully")})</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Record Saved Successfully")})</script>", false);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", $"<script>warning({JsonConvert.SerializeObject("Please Select at least one Option.")})</script>", false);
                }               
            }
            catch (SqlException SqlEx)
            {
                if (SqlEx.Number == 2627)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Data already exists.")})</script>", false);
                    BindGridView();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(SqlEx.Message)})</script>", false);
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
                DataTable dt = mc.BindTableData("USERNOTIFICATIONS", "NotificationId");
                gvSendNotification.DataSource = dt;
                gvSendNotification.DataBind();
                Session["NotificationData"] = dt;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
            }
        }

        protected void gvSendNotification_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "EditNotification")
                {
                    string ID = e.CommandArgument.ToString();
                    DataTable dtFromSession = (DataTable)Session["NotificationData"];
                    DataRow[] rows = dtFromSession.Select("NotificationId = " + ID);
                    if (rows.Length > 0)
                    {
                        DataRow row = rows[0];
                        txtNotificationCode.Text = rows[0]["NotificationId"].ToString();
                        txtNotificationTitle.Text = rows[0]["NotificationTitle"].ToString();
                        txtNotificationMessage.Text = rows[0]["NotificationMessage"].ToString();
                        string SendToIds = rows[0]["NotificationReceiverId"].ToString();
                        ViewState["flag"] = 1;
                        SaveBtn.Text = "Update";

                        BindSupervisorDropDown();

                        string[] selectedIds = SendToIds.Split(',');

                        foreach (ListItem item in ddlSendTo.Items)
                        {
                            if (selectedIds.Contains(item.Value))
                            {
                                item.Selected = true;
                            }
                        }
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