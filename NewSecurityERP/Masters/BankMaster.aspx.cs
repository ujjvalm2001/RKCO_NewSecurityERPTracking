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
	public partial class BankMaster : System.Web.UI.Page
	{
		#region
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				if (!string.IsNullOrEmpty(Convert.ToString(Session["CompanyID"])))
				{
					if (!IsPostBack)
					{

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
				DataTable dt = mc.BindTableData("Bank", "BankName", Convert.ToInt32(Session["CompanyID"]));
				gvBankMaster.DataSource = dt;
				gvBankMaster.DataBind();
				Session["BankMaster"] = dt;
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}
		}
		public void BindMaxID()
		{
			MasterCommonClass mc = new MasterCommonClass();
			int MaxID = mc.FatchMaxRecord("BANK", "bankcode", Convert.ToInt32(Session["CompanyID"]));
			txtBankCode.Text = (MaxID + 1).ToString();
		}
		#endregion
		#region "Button:- Save"
		protected void btnSave_Click(object sender, EventArgs e)
		{
			try
			{

				BankMasters bm = new BankMasters();
				bm.flag = Convert.ToInt32(ViewState["flag"].ToString());
				bm.BankCode = Convert.ToInt32(txtBankCode.Text);
				bm.BankName = txtBankName.Text;
				bm.BranchName = txtBranchName.Text;
				bm.AccountNo = txtAccountNo.Text;
				bm.IFSCode = txtIFSCode.Text;
				bm.Address = txtAddress.Text;
				bm.Remark = txtRemark.Text;
				bm.CompanyID = Convert.ToInt32(Session["CompanyID"]);
				bm.CreatedBy = Convert.ToString(Session["UserID"]);
				MasterCommonClass mc = new MasterCommonClass();
				string result = mc.InsertBankDetail(bm);
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
					ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + "Something Went Wrong !!!")})</script>", false);
				}

			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
				//lblError.Text = "You can't Insert Duplicate Value";
			}
		}
		#endregion
		#region "Clear Form and ClearLabel"
		protected void ClearFormText()
		{
			txtBankName.Text = string.Empty;
			txtBranchName.Text = string.Empty;
			txtAccountNo.Text = string.Empty;
			txtIFSCode.Text = string.Empty;
			txtAddress.Text = string.Empty;
			txtRemark.Text = string.Empty;
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
		protected void gvBankMaster_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			try
			{
				if (e.CommandName == "update")
				{
					string Bank = e.CommandArgument.ToString();
					DataTable dtFromSession = (DataTable)Session["Bankmaster"];
					DataRow[] rows = dtFromSession.Select("BankCode = " + Bank);
					if (rows.Length > 0)
					{
						DataRow row = rows[0];
						txtBankCode.Text = rows[0]["BankCode"].ToString();
						txtBankName.Text = rows[0]["bankname"].ToString();
						txtBranchName.Text = rows[0]["BranchName"].ToString();
						txtAccountNo.Text = rows[0]["AccNo"].ToString();
						txtIFSCode.Text = rows[0]["IFSCode"].ToString();
						txtAddress.Text = rows[0]["Address"].ToString();
						txtRemark.Text = rows[0]["Remark"].ToString();
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
		protected void gvBankMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{

		}
		protected void gvBankMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{

		}
		#endregion
	}
}