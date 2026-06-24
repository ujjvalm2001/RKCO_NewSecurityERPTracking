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
	public partial class RegionMaster : System.Web.UI.Page
	{
		#region Page Load
		MasterCommonClass mc = new MasterCommonClass();
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
		#region "Bind Data of Department master"
		protected void BindGridView()
		{
			try
			{
				MasterCommonClass mc = new MasterCommonClass();
				DataTable dt = mc.BindTableData("RegionMaster", "RegionName");
				gvRegionMaster.DataSource = dt;
				gvRegionMaster.DataBind();
				Session["RegionMaster"] = dt;
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}
		}
		public void BindMaxID()
		{
			MasterCommonClass mc = new MasterCommonClass();
			int MaxID = mc.FatchMaxRecord("RegionMaster", "RegionCode");
			txtregionCode.Text = (MaxID + 1).ToString();
		}
		#endregion

		#region "Button:- Save"
		protected void btnSave_Click(object sender, EventArgs e)
		{
			try
			{
				RegionMasters rm = new RegionMasters();
				rm.flag = Convert.ToInt32(ViewState["flag"].ToString());
				rm.RegionCode = Convert.ToInt32(txtregionCode.Text);
				rm.RegionName = txtRegionName.Text;
				rm.RegionHead = txtRegionHead.Text;
				rm.ContactNo = txtContactNo.Text;
				rm.EmailID = txtEmailID.Text;
				rm.RegionRemark = txtRegionRemark.Text;
				rm.Compid = Convert.ToInt32(Session["CompanyID"]);
				rm.CreatedBy = Convert.ToString(Session["UserId"]);
				MasterCommonClass mc = new MasterCommonClass();
				string result = mc.InsertRegionDetail(rm);
				if (result == "Record Saved Successfully")
				{
					ClearFormText();
					BindGridView();
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
			}
		}
		#endregion
		#region "Clear Form"
		protected void ClearFormText()
		{
			txtRegionHead.Text = string.Empty;
			txtRegionName.Text = string.Empty;
			txtRegionRemark.Text = string.Empty;
			txtEmailID.Text = string.Empty;
			txtContactNo.Text = string.Empty;
			BindMaxID();
			btnSave.Text = "Save";
		}
		#endregion
		#region "Button:- Cancel/Clear"
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			try
			{
				ClearFormText();
				ViewState["flag"] = 0;
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}
		}
		#endregion
		protected void gvRegionMaster_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			try
			{
				if (e.CommandName == "update")
				{
					string Region = e.CommandArgument.ToString();
					DataTable dtFromSession = (DataTable)Session["Regionmaster"];
					DataRow[] rows = dtFromSession.Select("RegionCode = " + Region);
					if (rows.Length > 0)
					{
						DataRow row = rows[0];
						txtregionCode.Text = rows[0]["RegionCode"].ToString();
						txtRegionName.Text = rows[0]["RegionName"].ToString();
						txtRegionHead.Text = rows[0]["RegionHead"].ToString();
						txtContactNo.Text = rows[0]["ContactNo"].ToString();
						txtEmailID.Text = rows[0]["EmailID"].ToString();
						txtRegionRemark.Text = rows[0]["RegionRemark"].ToString();
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
		protected void gvRegionMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{

		}
		protected void gvRegionMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{

		}
	}
}