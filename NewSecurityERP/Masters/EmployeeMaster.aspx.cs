using BalLayer;
using DalLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace NewSecurityERP.Masters
{
    public partial class EmployeeMaster : System.Web.UI.Page
    {
        MasterCommonClass mc = new MasterCommonClass();
        loginCommonClass lc = new loginCommonClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(Convert.ToString(Session["CompanyID"])))
                {
                    if (!IsPostBack)
                    {
                        BindBranchMaster();
                        BindDepartmentMaster();
                        BindDesignationMaster();
                        BindAminDropDown();
                        BindGridView();
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }

        protected void BindBranchMaster()
        {
            try
            {
                int CompID = Convert.ToInt32(Session["CompanyID"]);

                SqlParameter[] sp =
                {
                    new SqlParameter("@CompId", CompID)
                };

                DataTable dt = DBClass.GetDataTableByProc("GetBranchMaster", sp);

                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlBranch.DataSource = dt;
                    ddlBranch.DataTextField = "BranchName";
                    ddlBranch.DataValueField = "BranchCode";
                    ddlBranch.DataBind();
                    ddlBranch.Items.Insert(0, new ListItem("-- Select Branch --", ""));
                }
                else
                {
                    ddlBranch.Items.Clear();
                    ddlBranch.Items.Insert(0, new ListItem("-- Select Branch --", ""));

                    ScriptManager.RegisterStartupScript(
                        this, typeof(Page),
                        "Info",
                        $"<script>info({JsonConvert.SerializeObject("Branch Not Found !!!")})</script>",
                        false
                    );

                    ClearFormData();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(
                    this, typeof(Page),
                    "Error",
                    $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>",
                    false
                );
            }
        }
        protected void BindDesignationMaster()
        {
            try
            {
                int CompID = Convert.ToInt32(Session["CompanyID"]);

                SqlParameter[] sp =
                {
                    new SqlParameter("@CompId", CompID)
                };

                DataTable dt = DBClass.GetDataTableByProc("GetDesignationMaster", sp);

                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlDesignation.DataSource = dt;
                    ddlDesignation.DataTextField = "Desiname";
                    ddlDesignation.DataValueField = "Desicode";
                    ddlDesignation.DataBind();
                    ddlDesignation.Items.Insert(0, new ListItem("-- Select Designation --", ""));
                }
                else
                {
                    ddlDesignation.Items.Clear();
                    ddlDesignation.Items.Insert(0, new ListItem("-- Select Designation --", ""));

                    ScriptManager.RegisterStartupScript(
                        this, typeof(Page),
                        "Info",
                        $"<script>info({JsonConvert.SerializeObject("Designation Not Found !!!")})</script>",
                        false
                    );

                    ClearFormData();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(
                    this, typeof(Page),
                    "Error",
                    $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>",
                    false
                );
            }
        }
        protected void BindDepartmentMaster()
        {
            try
            {
                int CompID = Convert.ToInt32(Session["CompanyID"]);

                SqlParameter[] sp =
                {
                    new SqlParameter("@CompId", CompID)
                };

                DataTable dt = DBClass.GetDataTableByProc("GetDepartmentMaster", sp);

                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlDepartment.DataSource = dt;
                    ddlDepartment.DataTextField = "deptname";
                    ddlDepartment.DataValueField = "deptcode";
                    ddlDepartment.DataBind();
                    ddlDepartment.Items.Insert(0, new ListItem("-- Select Department --", ""));
                }
                else
                {
                    ddlDesignation.Items.Clear();
                    ddlDesignation.Items.Insert(0, new ListItem("-- Select Department --", ""));

                    ScriptManager.RegisterStartupScript(
                        this, typeof(Page),
                        "Info",
                        $"<script>info({JsonConvert.SerializeObject("Department Not Found !!!")})</script>",
                        false
                    );

                    ClearFormData();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(
                    this, typeof(Page),
                    "Error",
                    $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>",
                    false
                );
            }
        }

        public void BindAminDropDown()
        {
            try
            {
                int CompId = Convert.ToInt32(Session["CompanyID"]);
                SqlParameter[] sp =
                {
                     new SqlParameter("@CompID" ,CompId)

                };

                DataTable dt = DBClass.GetDataTableByProc("GetAllAdmin", sp);
                lstUserAdmin.DataSource = dt;
                lstUserAdmin.DataTextField = "EmpNameWithCode";
                lstUserAdmin.DataValueField = "UserId";
                lstUserAdmin.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }
        protected void btnShow_Click(object sender, EventArgs e)
        {
            try
            {
                int CompID = Convert.ToInt32(Session["CompanyID"]);
                SqlParameter[] sp =
                {
                     new SqlParameter("@Empcode" ,txtEmpCode.Text.ToString()),
                     new SqlParameter("@CompId", CompID)
                };

                DataTable dt = DBClass.GetDataTableByProc("GetEmpDetailsForSupervisor", sp);
                if (dt.Rows.Count > 0 )
                {
                    chkSupervisor.Checked = false;
                    txtEmpName.Text = dt.Rows[0]["Empname"].ToString();
                    txtEmpFName.Text = dt.Rows[0]["FatherName"].ToString();
                    string Status = dt.Rows[0]["EmpStatus"].ToString();
                    ddlStatus.SelectedValue = Status;
                    if (Status.ToLower() != "active")
                    {
                        btnSave.Enabled = false;
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Info", $"<script>info({JsonConvert.SerializeObject("Employee Status is InActive.")})</script>", false);
                    }
                    ddlGender.SelectedValue = dt.Rows[0]["gender"].ToString();

                    DateTime dateOfJoin;
                    if (DateTime.TryParse(dt.Rows[0]["EmpDOJ"].ToString(), out dateOfJoin))
                    {
                        txtdoj.Text = dateOfJoin.ToString("yyyy-MM-dd");
                    }
                    SetSelectedValue(ddlBranch, dt.Rows[0]["BranchCode"].ToString());
                    SetSelectedValue(ddlDepartment, dt.Rows[0]["deptcode"].ToString());
                    SetSelectedValue(ddlDesignation, dt.Rows[0]["desicode"].ToString());


                    int IsSupervisor = Convert.ToInt32(dt.Rows[0]["IsSupervisor"]);
                    if (IsSupervisor == 1)
                    {
                        chkSupervisor.Checked = true;
                    }
                    int IsUser = Convert.ToInt32(dt.Rows[0]["IsUser"]);
                    string userAdminIds = dt.Rows[0]["UserAdminIds"] != DBNull.Value ? dt.Rows[0]["UserAdminIds"].ToString() : "";
                    SetSelectedAdmins(userAdminIds);
                    if (IsUser == 1)
                    {
                        divUserName.Visible = true;
                        divUserPass.Visible = true;
                        chkIsUser.Checked = true;
                        ddlUserType.SelectedValue = dt.Rows[0]["UserType"].ToString();
                        txtUserName.Text = dt.Rows[0]["UserName"].ToString();
                        txtUserPass.Text = lc.Decrypt(dt.Rows[0]["UserPass"].ToString());

                    }
                    else
                    {
                        divUserName.Visible = false;
                        divUserPass.Visible = false;
                        chkIsUser.Checked = false;
                        txtUserPass.Text = string.Empty;
                        txtUserName.Text = string.Empty;

                    }
                    IsEditFlag.Value = "1";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Info", $"<script>info({JsonConvert.SerializeObject("Record Not Found !!!")})</script>", false);
                    ClearFormData();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }
        private void SetSelectedValue(DropDownList ddl, string value)
        {
            if (ddl.Items.FindByValue(value) != null)
            {
                ddl.SelectedValue = value;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlParameter[] sp =
                {
            new SqlParameter("@Empcode", txtEmpCode.Text.Trim()),
            new SqlParameter("@CompId", Convert.ToInt32(Session["CompanyId"]))
        };

                DataTable dt = DBClass.GetDataTableByProc("GetEmpDetailsForSupervisor", sp);
                if (dt.Rows.Count > 0 && IsEditFlag.Value != "1")
                {
                    ShowError("Employee is already Exist on this employeeCode");
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtEmpCode.Text))
                {
                    ShowError("Employee Code is required");
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtEmpName.Text))
                {
                    ShowError("Employee Name is required");
                    return;
                }

                if (ddlStatus.SelectedValue == "")
                {
                    ShowError("Please select Status");
                    return;
                }

                if (ddlGender.SelectedValue == "")
                {
                    ShowError("Please select Gender");
                    return;
                }

                if (ddlBranch.SelectedValue == "")
                {
                    ShowError("Please select Branch");
                    return;
                }

                if (ddlDepartment.SelectedValue == "")
                {
                    ShowError("Please select Department");
                    return;
                }

                if (ddlDesignation.SelectedValue == "")
                {
                    ShowError("Please select Designation");
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtdoj.Text))
                {
                    ShowError("Please enter Date of Joining");
                    return;
                }

                if (ddlUserType.SelectedIndex == 0)
                {
                    ShowError("Please select UserType");
                    return;
                }

                if (chkIsUser.Checked)
                {
                    if (string.IsNullOrWhiteSpace(txtUserName.Text) || string.IsNullOrWhiteSpace(txtUserPass.Text))
                    {
                        ShowError("Please enter UserName and Password");
                        return;
                    }
                }

                DataTable adminUserTable = new DataTable();
                adminUserTable.Columns.Add("AdminUserId", typeof(int));

                foreach (ListItem item in lstUserAdmin.Items)
                {
                    if (item.Selected)
                    {
                        adminUserTable.Rows.Add(Convert.ToInt32(item.Value));
                    }
                }

                EmployeeMasters Empmaster = new EmployeeMasters
                {
                    EmpCode = txtEmpCode.Text.Trim(),
                    EmpName = txtEmpName.Text.Trim(),
                    EmpFatherName = txtEmpFName.Text.Trim(),
                    EmpStatus = ddlStatus.SelectedValue,
                    Gender = ddlGender.SelectedValue,
                    EmpDOJ = txtdoj.Text.Trim(),
                    BranchCode = Convert.ToInt32(ddlBranch.SelectedValue),
                    DeptCode = Convert.ToInt32(ddlDepartment.SelectedValue),
                    DesiCode = Convert.ToInt32(ddlDesignation.SelectedValue),
                    IsSupervisor = chkSupervisor.Checked ? 1 : 0,
                    CompID = Convert.ToInt32(Session["CompanyId"]),
                    UserType = ddlUserType.SelectedValue,
                    IsUser = chkIsUser.Checked ? 1 : 0,
                    UserName = txtUserName.Text.Trim(),
                    UserPassword = chkIsUser.Checked ? lc.Encrypt(txtUserPass.Text.Trim()) : ""
                };

                int result = mc.InsertUpdateEmployee(Empmaster, adminUserTable);

                if (result == 1)
                {
                    ClearFormData();
                    BindGridView();
                    ShowSuccess("Record Save Successfully!");
                }
                else if (result == 2)
                {
                    ClearFormData();
                    BindGridView();
                    ShowSuccess("Record Update Successfully!");
                }
                else
                {
                    ShowError("Error in Operation!");
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


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearFormData();
        }

        protected void BindGridView()
        {
            try
            {
                int CompID = Convert.ToInt32(Session["CompanyID"]);
                SqlParameter[] sp =
                {
                     new SqlParameter("@CompId" ,CompID)
                };

                DataTable dt = DBClass.GetDataTableByProc("BindAllSupervisorDetails", sp);
                gvEMPMaster.DataSource = dt;
                gvEMPMaster.DataBind();
                Session["EmployeeMasterData"] = dt;

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
            }
        }



        protected void ClearFormData()
        {
            IsEditFlag.Value = "0";
            txtEmpCode.Text = string.Empty;

            txtEmpFName.Text = string.Empty;
            txtEmpName.Text = string.Empty;
            txtdoj.Text = string.Empty;
            // chkSupervisor.Checked = false;
            chkIsUser.Checked = false;
            txtUserName.Text = string.Empty;
            txtUserPass.Text = string.Empty;
            btnShow.Enabled = true;
            ddlStatus.ClearSelection();
            ddlGender.ClearSelection();
            ddlBranch.ClearSelection();
            ddlDepartment.ClearSelection();
            ddlDesignation.ClearSelection();
        }



        protected void gvEMPMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                ClearFormData();
                if (e.CommandName == "EditEmpMaster")
                {
                    IsEditFlag.Value = "1";
                    string EmployeeCode = e.CommandArgument.ToString();
                    DataTable dtFromSession = (DataTable)Session["EmployeeMasterData"];
                    DataRow[] rows = dtFromSession.Select("Empcode = " + EmployeeCode);
                    if (rows.Length > 0)
                    {
                        DataRow row = rows[0];
                        txtEmpCode.Text = EmployeeCode;
                        txtEmpName.Text = rows[0]["Empname"].ToString();
                        ddlStatus.SelectedValue = rows[0]["EmpStatus"].ToString();
                        txtEmpFName.Text = rows[0]["FatherName"].ToString();
                        ddlGender.SelectedValue = rows[0]["gender"].ToString();
                        SetSelectedValue(ddlBranch, rows[0]["BranchCode"].ToString());
                        SetSelectedValue(ddlDepartment, rows[0]["deptcode"].ToString());
                        SetSelectedValue(ddlDesignation, rows[0]["desicode"].ToString());
                        int IsSupervisor = Convert.ToInt32(rows[0]["IsSupervisor"]);
                        if (IsSupervisor == 1)
                        {
                            chkSupervisor.Checked = true;
                        }
                        DateTime dateOfJoin;
                        if (DateTime.TryParse(rows[0]["EmpDOJ"].ToString(), out dateOfJoin))
                        {
                            txtdoj.Text = dateOfJoin.ToString("yyyy-MM-dd");
                        }
                        string userAdminIds = rows[0]["UserAdminIds"] != DBNull.Value ? rows[0]["UserAdminIds"].ToString() : "";
                        SetSelectedAdmins(userAdminIds);

                        btnShow.Enabled = false;
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
        private void SetSelectedAdmins(string userAdminIds)
        {
            
            foreach (ListItem item in lstUserAdmin.Items)
            {
                item.Selected = false;
            }

            if (string.IsNullOrWhiteSpace(userAdminIds))
                return;

            string[] adminIds = userAdminIds.Split(',');

            foreach (string id in adminIds)
            {
                string trimmedId = id.Trim();
                ListItem item = lstUserAdmin.Items.FindByValue(trimmedId);
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }
        protected void chkIsUser_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (chkIsUser.Checked)
                {
                    divUserName.Visible = true;
                    divUserPass.Visible = true;
                }
                else
                {
                    divUserName.Visible = false;
                    divUserPass.Visible = false;
                }

            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }
    }
}