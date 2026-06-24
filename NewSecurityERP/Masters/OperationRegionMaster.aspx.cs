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
	public partial class OperationRegionMaster : System.Web.UI.Page
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
		#region "Bind Data of Department master"
		protected void BindGridView()
		{
			MasterCommonClass mc = new MasterCommonClass();
			DataTable dt = mc.BindTableData("OPERATIONAREAMASTER", "OPAreaName");
			gvOPRegionMaster.DataSource = dt;
			gvOPRegionMaster.DataBind();
			Session["OperationMaster"] = dt;
		}

		public void BindMaxID()
		{
			MasterCommonClass mc = new MasterCommonClass();
			int MaxID = mc.FatchMaxRecord("OperationAreaMaster", "OPAreaCode");
			txtOPAreaCode.Text = (MaxID + 1).ToString();
		}
		#endregion

		#region "Button:- Save"
		protected void btnSave_Click(object sender, EventArgs e)
		{
			try
			{
				OperationAreaMasters om = new OperationAreaMasters();
				om.flag = Convert.ToInt32(ViewState["flag"].ToString());
				om.OPAreaCode = Convert.ToInt32(txtOPAreaCode.Text);
				om.OPAreaName = txtOPAreaName.Text;
				om.OPAreaRemark = txtOPAreaRemark.Text;
				om.Compid = Convert.ToInt32(Session["CompanyID"]);
				om.CreatedBy = Convert.ToString(Session["UserId"]);
				MasterCommonClass mc = new MasterCommonClass();
				string result = mc.InsertOperationAreaDetail(om);
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
			txtOPAreaName.Text = string.Empty;
			txtOPAreaRemark.Text = string.Empty;
			BindMaxID();
			btnSave.Text = "Save";
		}
		#endregion
		#region "Button:- Cancel/Clear"
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			ClearFormText();
			ViewState["flag"] = 0;
		}
		#endregion
		#region Edit
		protected void gvOPRegionMaster_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName == "update")
			{
				string Operational = e.CommandArgument.ToString();
				DataTable dtFromSession = (DataTable)Session["OperationMaster"];
				DataRow[] rows = dtFromSession.Select("OPAreaCode = " + Operational);
				if (rows.Length > 0)
				{
					DataRow row = rows[0];
					txtOPAreaCode.Text = rows[0]["OPAreaCode"].ToString();
					txtOPAreaName.Text = rows[0]["OPAreaName"].ToString();
					txtOPAreaRemark.Text = rows[0]["OPAreaRemark"].ToString();
					ViewState["flag"] = 1;
					btnSave.Text = "Update";
				}
			}
		}
		protected void gvOPRegionMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{

		}
		protected void gvOPRegionMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{

		}
		#endregion

	}
}