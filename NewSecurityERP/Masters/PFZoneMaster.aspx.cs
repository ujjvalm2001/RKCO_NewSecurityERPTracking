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
	public partial class PFZoneMaster : System.Web.UI.Page
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
			MasterCommonClass mc = new MasterCommonClass();
			DataTable dt = mc.BindTableData("PFMaster", "PFName");
			gvPFMaster.DataSource = dt;
			gvPFMaster.DataBind();
			Session["PFMaster"] = dt;
		}
		public void BindMaxID()
		{
			MasterCommonClass mc = new MasterCommonClass();
			int MaxID = mc.FatchMaxRecord("PFMaster", "PFCode");
			txtPFCode.Text = (MaxID + 1).ToString();
		}
		#endregion
		#region "Button:- Save"
		protected void btnSave_Click(object sender, EventArgs e)
		{
			try
			{
				PFMasters pf = new PFMasters();
				pf.flag = Convert.ToInt32(ViewState["flag"].ToString());
				pf.PFCode = Convert.ToInt32(txtPFCode.Text);
				pf.PFName = txtPFName.Text;
				pf.PFEsttCode = txtPFEsttSubCode.Text;
				pf.LocalOffice = txtAddress.Text;
				pf.Remark = txtRemark.Text;
				pf.Compid = Convert.ToInt32(Session["CompanyID"]);
				pf.CreatedBy  = Convert.ToString(Session["UserID"]);
				MasterCommonClass mc = new MasterCommonClass();
				string result = mc.InsertPFMaster(pf);
				if (result == "Record Saved Successfully")
				{
					BindGridView();
					ClearFormText();
					ViewState["flag"] = 0;
					ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("Success: " + "Record Saved Successfully !!!")})</script>", false);
				}
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}
		}
		#endregion

		#region "Clear Form and ClearLabel"
		protected void ClearFormText()
		{
			txtPFName.Text = string.Empty;
			txtPFEsttSubCode.Text = string.Empty;
			txtAddress.Text = string.Empty;
			txtRemark.Text = string.Empty;
			BindMaxID();
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
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}

		}
		#endregion
		#region "Data Editing or PageIndexing"

		protected void gvPFMaster_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			try
			{
				if (e.CommandName == "update")
				{
					string PFZone = e.CommandArgument.ToString();
					DataTable dtFromSession = (DataTable)Session["PFMaster"];
					DataRow[] rows = dtFromSession.Select("PFCode = " + PFZone);
					if (rows.Length > 0)
					{
						DataRow row = rows[0];
						txtPFCode.Text = rows[0]["PFCode"].ToString();
						txtPFName.Text = rows[0]["PFName"].ToString();
						txtPFEsttSubCode.Text = rows[0]["PFEsttCode"].ToString();
						txtAddress.Text = rows[0]["LocalOffice"].ToString();
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
		protected void gvPFMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{

		}
		protected void gvPFMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{

		}

		#endregion
	}
}