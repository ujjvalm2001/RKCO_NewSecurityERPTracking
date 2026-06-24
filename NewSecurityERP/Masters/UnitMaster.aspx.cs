using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using BalLayer;
using DalLayer;
using NewSecurityERP.CandidateRegistration;
using Newtonsoft.Json;

namespace NewSecurityERP.Masters
{
    public partial class UnitMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(Convert.ToString(Session["CompanyID"])))
                {
                    if (!IsPostBack)
                    {
                        BindClientMaster();
                       // BindUnitMaster();
                        BindGridView();
                    }
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
            }
        }
        public void BindClientMaster()
        {
            MasterCommonClass mc = new MasterCommonClass();
            DataTable dt = mc.BindTableData("CLIENT", "clientname");
            ddlClient.DataSource = dt;
            ddlClient.DataTextField = "ClientName";
            ddlClient.DataValueField = "ClientCode";
            ddlClient.DataBind();
            ddlClient.Items.Insert(0, new ListItem("-- Select Client --", ""));
            Session["ClientMaster"] = dt;
        }
        //public void BindUnitMaster()
        //{
        //    MasterCommonClass mc = new MasterCommonClass();
        //    DataTable dt = mc.BindTableData("Unit", "unitName");
        //    ddlUnit.DataSource = dt;
        //    ddlUnit.DataTextField = "UnitName";
        //    ddlUnit.DataValueField = "UnitCode";
        //    ddlUnit.DataBind();
        //    ddlUnit.Items.Insert(0, new ListItem("-- Select Unit --", ""));
        //    Session["UnitMaster"] = dt;
        //}
        public void BindGridView()
        {
            int CompId = Convert.ToInt32(Session["CompanyID"]);
            SqlParameter[] sp =
            {
                     new SqlParameter("@CompID" ,CompId)

            };

            DataTable dt = DBClass.GetDataTableByProc("GetAllUnit", sp);
            gvUnitMaster.DataSource = dt;
            gvUnitMaster.DataBind();
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
               
                //if (string.IsNullOrWhiteSpace(txtUnitCode.Text))
                //{
                //    ShowError("Unit Code is mandatory");
                //    return;
                //}

                if (ddlClient.SelectedValue == "" || ddlClient.SelectedValue == "0")
                {
                    ShowError("Please select Client");
                    return;
                }

                if (string.IsNullOrEmpty(txtUnitName.Text))
                {
                    ShowError("Unit Name is mandatory");
                    return;
                }

                if (string.IsNullOrEmpty(ddlStatus.SelectedValue))
                {
                    ShowError("Please select Status");
                    return;
                }

                UnitMasters um = new UnitMasters();
                MasterCommonClass mc = new MasterCommonClass();

                um.Compid = Convert.ToInt32(Session["CompanyID"]);
                um.Unitcode = string.IsNullOrEmpty(txtUnitCode.Text) ? 0 : Convert.ToInt32(txtUnitCode.Text);
                um.ClientCode = Convert.ToInt32(ddlClient.SelectedValue);
                um.UnitName = txtUnitName.Text;
                um.Status = ddlStatus.SelectedValue;
                um.Location = txtLocation.Text;
                um.Logitude = txtLongitude.Text.Trim();
                um.Latitude = txtLatitude.Text.Trim();
                um.ContactPerson1 = txtContactPerson1.Text.Trim();
                um.ContactPerson2 = txtContactPerson2.Text.Trim();
                um.ContactPerson3 = txtContactPerson3.Text.Trim();
                um.ContactPerson1Email = txtCP1Email.Text.Trim();
                um.ContactPerson2Email = txtCP2Email.Text.Trim();
                um.ContactPerson3Email = txtCP3Email.Text.Trim();
                um.ContactPerson1Phone = txtCP1Phone.Text.Trim();
                um.ContactPerson2Phone = txtCP2Phone.Text.Trim();
                um.ContactPerson3Phone = txtCP3Phone.Text.Trim();
                um.Address = txtAddress.Text.Trim();

                int result = mc.InsertUpdateUnitDetail(um);

                if (result == 1)
                {
                    ShowSuccess("Record Saved Successfully");
                    BindGridView();
                    Clearform();
                }
                else if (result == 2)
                {
                    ShowSuccess("Record Updated Successfully");
                    BindGridView();
                    Clearform();
                }
                else
                {
                    ShowError("Record not saved");
                }
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }

        private void ShowError(string message)
        {
            ScriptManager.RegisterStartupScript(
                this, typeof(Page),
                "Error",
                $"<script>error({JsonConvert.SerializeObject(message)})</script>",
                false
            );
        }

        private void ShowSuccess(string message)
        {
            ScriptManager.RegisterStartupScript(
                this, typeof(Page),
                "Success",
                $"<script>success({JsonConvert.SerializeObject(message)})</script>",
                false
            );
        }
        private void SetSelectedValue(DropDownList ddl, string value)
        {
            if (ddl.Items.FindByValue(value) != null)
            {
                ddl.SelectedValue = value;
            }
        }

        protected void gvUnitMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "editUnit")
                {
                    int UnitCodeID = Convert.ToInt32(e.CommandArgument.ToString());

                    int CompID = Convert.ToInt32(Session["CompanyID"]);
                    SqlParameter[] sp =
                    {
                     new SqlParameter("@UnitCode" ,UnitCodeID),
                     new SqlParameter("@CompId", CompID)
                    };

                    DataTable dt = DBClass.GetDataTableByProc("GetUnitDetails", sp);

                    if (dt.Rows.Count > 0)
                    {
                        DataRow row = dt.Rows[0];
                        txtUnitCode.Text = row["unitcode"].ToString();
                        ddlStatus.SelectedValue= row["status"].ToString();
                        SetSelectedValue(ddlClient, row["clientCode"].ToString());
                      //  SetSelectedValue(ddlUnit, row["UnitCode"].ToString());
                      txtUnitName.Text = row["UnitName"].ToString();
                        txtLocation.Text = row["Location"].ToString();
                        txtAddress.Text = row["Address"].ToString();
                        txtLatitude.Text = row["latitude"].ToString();
                        txtLongitude.Text = row["longitude"].ToString();
                        txtContactPerson1.Text = row["ContactPerson1"].ToString();
                        txtCP1Phone.Text = row["ContactPersonPhone1"].ToString();
                        txtCP1Email.Text = row["ContactPersonEmail1"].ToString();
                        txtContactPerson2.Text = row["ContactPerson2"].ToString();
                        txtCP2Phone.Text = row["ContactPersonPhone2"].ToString();
                        txtCP2Email.Text = row["ContactPersonEmail2"].ToString();
                        txtContactPerson3.Text = row["ContactPerson3"].ToString();
                        txtCP3Phone.Text = row["ContactPersonPhone3"].ToString();
                        txtCP3Email.Text = row["ContactPersonEmail3"].ToString();

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



        protected void btnShow_Click(object sender, EventArgs e)
        {
            try
            {
                int CompID = Convert.ToInt32(Session["CompanyID"]);
                SqlParameter[] sp =
                {
                     new SqlParameter("@UnitCode" ,txtUnitCode.Text.ToString()),
                     new SqlParameter("@CompId", CompID)
                };

                DataTable dt = DBClass.GetDataTableByProc("GetUnitDetails", sp);
                if (dt.Rows.Count > 0)
                {
                   
                    string Status = dt.Rows[0]["status"].ToString();
                    SetSelectedValue(ddlClient, dt.Rows[0]["clientCode"].ToString());
                    //SetSelectedValue(ddlUnit, dt.Rows[0]["unitCode"].ToString());
                    ddlStatus.SelectedValue = Status;
                    if (Status.ToLower() != "active")
                    {
                        btnSave.Enabled = false;
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Info", $"<script>info( 'Unit Status is {Status}' )</script>", false);
                    }
                    txtUnitName.Text = dt.Rows[0]["UnitName"].ToString();
                    txtLocation.Text = dt.Rows[0]["Location"].ToString();
                    txtAddress.Text = dt.Rows[0]["Address"].ToString();
                    txtLatitude.Text = dt.Rows[0]["latitude"].ToString();
                    txtLongitude.Text = dt.Rows[0]["longitude"].ToString();
                    txtContactPerson1.Text = dt.Rows[0]["ContactPerson1"].ToString();
                    txtCP1Phone.Text = dt.Rows[0]["ContactPersonPhone1"].ToString();
                    txtCP1Email.Text = dt.Rows[0]["ContactPersonEmail1"].ToString();
                    txtContactPerson2.Text = dt.Rows[0]["ContactPerson2"].ToString();
                    txtCP2Phone.Text = dt.Rows[0]["ContactPersonPhone2"].ToString();
                    txtCP2Email.Text = dt.Rows[0]["ContactPersonEmail2"].ToString();
                    txtContactPerson3.Text = dt.Rows[0]["ContactPerson3"].ToString();
                    txtCP3Phone.Text = dt.Rows[0]["ContactPersonPhone3"].ToString();
                    txtCP3Email.Text = dt.Rows[0]["ContactPersonEmail3"].ToString();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Info", $"<script>info({JsonConvert.SerializeObject("Record Not Found !!!")})</script>", false);
                    Clearform();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }


        protected void Clearform()
        {
            ddlStatus.ClearSelection();
            txtUnitName.Text = string.Empty;
            ddlClient.ClearSelection();
          txtLocation.Text = txtAddress.Text = txtLatitude.Text = txtLongitude.Text = txtContactPerson1.Text = txtCP1Phone.Text = txtCP1Email.Text = txtContactPerson2.Text = txtCP2Phone.Text = txtCP2Email.Text = txtContactPerson3.Text = txtCP3Phone.Text = txtCP3Email.Text = txtUnitCode.Text = string.Empty;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Clearform();
        }
    }
}