using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BalLayer;
using Newtonsoft.Json;

namespace NewSecurityERP.Masters
{
	public partial class BranchMaster : System.Web.UI.Page
	{
		#region Page Load
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				if (!string.IsNullOrEmpty(Convert.ToString(Session["CompanyID"])))
				{
					if (!IsPostBack)
					{
						BranchRegionMaster();
						BranchStateMaster();
						BindGridView();
						BindMaxID();
						ViewState["flag"] = 0;
					}
				}
				else Response.Redirect("~/Default.aspx");
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}
		}
		#endregion
		#region "Function :- BindGrid or BindMaxID"
		public void BindGridView()
		{
			try
			{
				MasterCommonClass mc = new MasterCommonClass();
				DataTable dt = mc.BindTableData("BRANCH", "BranchName");
				gvBranchMaster.DataSource = dt;
				gvBranchMaster.DataBind();
				Session["BranchMaster"] = dt;
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}
		}
		public void BindMaxID()
		{
			MasterCommonClass mc = new MasterCommonClass();
			int MaxID = mc.FatchMaxRecord("BRANCH", "BranchCode");
			txtBranchCode.Text = (MaxID + 1).ToString();
		}


		#endregion
		#region "Function For Branch Region
		public void BranchRegionMaster()
		{
			MasterCommonClass mc = new MasterCommonClass();
			ddlRegionName.DataSource = mc.BindTableData("REGIONMASTER", "RegionName");
			ddlRegionName.DataTextField = "RegionName";
			ddlRegionName.DataValueField = "RegionCode";
			ddlRegionName.DataBind();
			ddlRegionName.Items.Insert(0, "--Select--");
		}
		#endregion
		#region "Function For branch State
		public void BranchStateMaster()
		{
			MasterCommonClass mc = new MasterCommonClass();
			ddlStateName.DataSource = mc.BindTableData("STATE", "StateName");
			ddlStateName.DataTextField = "StateName";
			ddlStateName.DataValueField = "StateCode";
			ddlStateName.DataBind();
			ddlStateName.Items.Insert(0, "--Select--");
		}
		#endregion
		#region "Button:- Save"
		protected void btnSave_Click(object sender, EventArgs e)
		{

			try
			{
				BranchMasters bm = new BranchMasters();
				bm.flag = Convert.ToInt32(ViewState["flag"].ToString());
				bm.BranchCode = Convert.ToInt32(txtBranchCode.Text);
				bm.BranchName = txtBranchName.Text;
				bm.BranchManager = txtEmailID.Text;
				bm.Address = txtAddress.Text;
				bm.City = txtCity.Text;
				bm.PinCode = txtPin.Text;
				bm.PhoneNo = txtPhoneNo.Text;
				bm.Remark = txtRemark.Text;
				bm.BranchRegion = ddlRegionName.SelectedIndex <= 0 ? 0 : Convert.ToInt32(ddlRegionName.SelectedValue);
				bm.BranchState = ddlStateName.SelectedIndex <= 0 ? 0 : Convert.ToInt32(ddlStateName.SelectedValue);
				bm.Compid = Convert.ToInt32(Session["CompanyID"]);
				bm.CreatedBy = Convert.ToString(Session["UserId"]);
				MasterCommonClass mc = new MasterCommonClass();
				string result = mc.InsertBranchDetail(bm);
				if (result == "Record Saved Successfully")
				{
					BindGridView();
					BindMaxID();
					ClearFormText();
					ViewState["flag"] = 0;
					ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("Success: " + "Record Saved Successfully !!!")})</script>", false);
				}
				else
				{
					ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + "Something went Wrong")})</script>", false);
				}
			}
			catch (Exception ex)
			{
				//lblError.Text = "You can't Insert Duplicate Value";
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}
		}
		#endregion
		#region "Clear Form and ClearLabel"
		protected void ClearFormText()
		{
			txtBranchName.Text = string.Empty;
			txtEmailID.Text = string.Empty;
			txtAddress.Text = string.Empty;
			txtPhoneNo.Text = string.Empty;
			txtRemark.Text = string.Empty;
			txtCity.Text = string.Empty;
			txtPin.Text = string.Empty;
			ddlRegionName.ClearSelection();
			ddlStateName.ClearSelection();
			btnSave.Text = "Save";
		}
		#endregion
		#region "Button:- Cancel/Clear"
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			try
			{
				ViewState["flag"] = 0;
				ClearFormText();
				BindMaxID();
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}

		}
		#endregion
		#region "Data Editing or PageIndexing"
		protected void gvBranchMaster_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			try
			{
				if (e.CommandName == "update")
				{
					string Branch = e.CommandArgument.ToString();
					DataTable dtFromSession = (DataTable)Session["BranchMaster"];
					DataRow[] rows = dtFromSession.Select("BranchCode = " + Branch);
					if (rows.Length > 0)
					{
						DataRow row = rows[0];
						txtBranchCode.Text = rows[0]["BranchCode"].ToString();
						txtBranchName.Text = rows[0]["BranchName"].ToString();
						txtEmailID.Text = rows[0]["BManager"].ToString();
						txtPhoneNo.Text = rows[0]["BPhone"].ToString();
						txtAddress.Text = rows[0]["Baddress"].ToString();
						txtCity.Text = rows[0]["city"].ToString();
						txtPin.Text = rows[0]["PinCode"].ToString();
						txtRemark.Text = rows[0]["Remark"].ToString();
						ddlRegionName.SelectedValue = rows[0]["BranchRegionCode"].ToString();
						ddlStateName.SelectedValue = rows[0]["BranchStateCode"].ToString();
						ViewState["flag"] = 1;
						btnSave.Text = "Update";
					}
				}
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}
		}

		protected void gvBranchMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{

		}
		protected void gvBranchMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{

		}


		#endregion
	}
}