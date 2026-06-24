using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BalLayer;
using NewSecurityERP.Masters;
using Newtonsoft.Json;

namespace NewSecurityERP.Masters
{
	public partial class DesignationMaster : System.Web.UI.Page
	{
		#region "Page Load"
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
		#region "Bind Data of Designation master"
		protected void BindGridView()
		{
			try
			{
				MasterCommonClass mc = new MasterCommonClass();
				DataTable dt = mc.BindTableData("DESIGNATION", "Desiname");
				gvDesignationMaster.DataSource = dt;
				gvDesignationMaster.DataBind();
				Session["DesignationMaster"] = dt;
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}
		}
		public void BindMaxID()
		{
			MasterCommonClass mc = new MasterCommonClass();
			int MaxID = mc.FatchMaxRecord("DESIGNATION", "Desicode");
			txtDesignationCode.Text = (MaxID + 1).ToString();
		}
		#endregion
		#region Save
		protected void btnSave_Click(object sender, EventArgs e)
		{
			try
			{
				DesignationMasters dm = new DesignationMasters();
				dm.flag = Convert.ToInt32(ViewState["flag"]);
				dm.Desicode = Convert.ToInt32(txtDesignationCode.Text);
				dm.Desiname = txtDesignationName.Text;
				dm.Remark = txtDesignationRemark.Text;
				dm.CreatedByUserID = Convert.ToString(Session["UserID"]);
				dm.Compid = Convert.ToInt32(Session["CompanyID"]);
				MasterCommonClass mc = new MasterCommonClass();
				string result = mc.InsertDesignationDetail(dm);
				if (result == "Record Saved Successfully")
				{

					BindGridView();
					ClearFormText();
					BindMaxID();
					ViewState["flag"] = 0;
					ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("Success: " + "Record Saved Successfully")})</script>", false);

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
			txtDesignationName.Text = string.Empty;
			txtDesignationRemark.Text = string.Empty;
			btnSave.Text = "Save";
		}
		#endregion
		#region "Button:- Cancel"
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			try
			{
				ClearFormText();
				BindMaxID();
				ViewState["flag"] = 0;

			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}

		}
		#endregion
		#region "Data Editing"
		protected void gvDesignationMaster_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			try
			{
				if (e.CommandName == "update")
				{

					string Designcode = e.CommandArgument.ToString();
					DataTable dtFromSession = (DataTable)Session["DesignationMaster"];
					DataRow[] rows = dtFromSession.Select("Desicode = " + Designcode);
					if (rows.Length > 0)
					{
						DataRow row = rows[0];
						string Desicode = rows[0]["Desicode"].ToString();
						string DesiName = rows[0]["DesiName"].ToString();
						string Remark = rows[0]["Remark"].ToString();
						txtDesignationCode.Text = Desicode;
						txtDesignationName.Text = DesiName;
						txtDesignationRemark.Text = Remark;
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
		protected void gvDesignationMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{

		}
		protected void gvDesignationMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{

		}

		#endregion

	}
}


