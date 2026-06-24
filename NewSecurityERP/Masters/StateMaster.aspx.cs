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
	public partial class StateMaster : System.Web.UI.Page
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
			try
			{
				MasterCommonClass mc = new MasterCommonClass();
				DataTable dt = mc.BindTableData("STATE", "stateName");
				gvStateMaster.DataSource = dt;
				gvStateMaster.DataBind();
				Session["StateMaster"] = dt;
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}
		}
		public void BindMaxID()
		{
			MasterCommonClass mc = new MasterCommonClass();
			int MaxID = mc.FatchMaxRecord("STATE", "stateCode");
			txtStateCode.Text = (MaxID + 1).ToString();
		}
		#endregion
		#region "Button:- Save"
		protected void btnSave_Click(object sender, EventArgs e)
		{
			try
			{
				StateMasters sm = new StateMasters();

				sm.flag = Convert.ToInt32(ViewState["flag"].ToString());
				sm.StateCode = Convert.ToInt32(txtStateCode.Text);
				sm.StateName = txtStateName.Text;
				sm.StateRemark = txtStateRemark.Text;
				sm.Compid = Convert.ToInt32(Session["CompanyID"]);
				sm.CreatedBy = Convert.ToString(Session["UserId"]);
				MasterCommonClass my = new MasterCommonClass();
				string result = my.InsertStateDetail(sm);
				if (result == "Record Saved Successfully")
				{
					ClearFormText();
					BindGridView();
					BindMaxID();
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
		protected void ClearFormText()
		{
			txtStateName.Text = string.Empty;
			txtStateRemark.Text = string.Empty;
			btnSave.Text = "Save";
		}
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
		#region "Data Editing "
		protected void gvStateMaster_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			try
			{
				if (e.CommandName == "update")
				{
					string state = e.CommandArgument.ToString();
					DataTable dtFromSession = (DataTable)Session["StateMaster"];
					DataRow[] rows = dtFromSession.Select("StateCode = " + state);
					if (rows.Length > 0)
					{
						DataRow row = rows[0];
						txtStateCode.Text = rows[0]["StateCode"].ToString();
						txtStateName.Text = rows[0]["StateName"].ToString();
						txtStateRemark.Text = rows[0]["StateRemark"].ToString();
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
		protected void gvStateMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{

		}
		protected void gvStateMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{

		}
		#endregion
	}
}
