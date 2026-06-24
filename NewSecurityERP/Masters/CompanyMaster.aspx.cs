using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BalLayer;
using System.Data;
using NewSecurityERP.Masters;
using DalLayer;
using Newtonsoft.Json;

namespace NewSecurityERP.Masters
{
	public partial class CompanyMaster : System.Web.UI.Page
	{
		MasterCommonClass mc = new MasterCommonClass();

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

		#region "Function :- BindGrid or BindMaxID"
		public void BindGridView()
		{
			DataTable dt = mc.BindTableData("COMPANY", "compname");
			gvCompanyMaster.DataSource = dt;
			gvCompanyMaster.DataBind();
			Session["Companymaster"] = dt;
		}

		public void BindMaxID()
		{
			int MaxID = mc.FatchMaxRecord("COMPANY", "compid");
			txtCompanyCode.Text = (MaxID + 1).ToString();
		}
		#endregion

		#region "Button:- Save"
		protected void btnSave_Click(object sender, EventArgs e)
		{
			try
			{
				CompanyMasters cm = new CompanyMasters();
				cm.flag = Convert.ToInt32(ViewState["flag"].ToString());
				cm.compid = Convert.ToInt32(txtCompanyCode.Text);
				cm.compname = txtCompanyName.Text;
				cm.compaddress = txtAddress.Text;
				cm.City = txtCityName.Text;
				cm.state = txtState.Text;
				cm.pincode = txtPinCode.Text;
				cm.phoneno = txtPhoneNo.Text;
				cm.Email = txtEmailID.Text;
				cm.website = txtWebSite.Text;
				cm.PANNo = txtPanNo.Text;
				cm.ReqAddress = txtReqAddress.Text;
				cm.CINNo = txtCINNo.Text;
				cm.GSTINID = txtGSTINID.Text;
				cm.CreatedByUserID = Convert.ToString(Session["UserID"]);

				string result = mc.InsertCompanyDetail(cm);

				if (result == "Record Saved Successfully")
				{
					ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("Success: " + "Record Saved Successfully !!!")})</script>", false);
					ClearFormText();
					BindGridView();
					BindMaxID();
					ViewState["flag"] = 0;
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
			txtGSTINID.Text = string.Empty;
			txtCompanyName.Text = string.Empty;
			txtAddress.Text = string.Empty;
			txtState.Text = string.Empty;
			txtCityName.Text = string.Empty;
			txtPinCode.Text = "0";
			txtPhoneNo.Text = string.Empty;
			txtEmailID.Text = string.Empty;
			txtWebSite.Text = string.Empty;
			txtPanNo.Text = string.Empty;
			txtReqAddress.Text = string.Empty;
			txtCINNo.Text = string.Empty;
			btnSave.Text = "Save";
		}

		#endregion

		#region "Button:- Cancel/Clear"
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			try
			{
				ViewState["flag"] = 0; ClearFormText(); BindMaxID();
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}

		}
		#endregion

		#region "Data Editing or PageIndexing"
		protected void gvCompanyMaster_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			try
			{
				if (e.CommandName == "update")
				{
					string CompanyID = e.CommandArgument.ToString();
					DataTable dtFromSession = (DataTable)Session["Companymaster"];
					DataRow[] rows = dtFromSession.Select("compid = " + CompanyID);
					if (rows.Length > 0)
					{
						DataRow row = rows[0];
						string CompanyIDD = rows[0]["Compid"].ToString();
						string CompName = rows[0]["CompName"].ToString();
						string CompAddress = rows[0]["CompAddress"].ToString();
						string State = rows[0]["State"].ToString();
						string City = rows[0]["City"].ToString();
						string pincode = rows[0]["pincode"].ToString();
						string phoneno = rows[0]["phoneno"].ToString();
						string EmailID = rows[0]["Email"].ToString();
						string WebSite = rows[0]["WebSite"].ToString();
						string PANNo = rows[0]["PANNo"].ToString();
						string ReqAddress = rows[0]["ReqAddress"].ToString();
						string GSTINNo = rows[0]["GSTINNo"].ToString();
						string CINNo = rows[0]["CINNo"].ToString();
						txtCompanyCode.Text = CompanyIDD;
						txtCompanyName.Text = CompName;
						txtAddress.Text = CompAddress;
						txtState.Text = State;
						txtCityName.Text = City;
						txtPinCode.Text = pincode;
						txtPhoneNo.Text = phoneno;
						txtEmailID.Text = EmailID;
						txtWebSite.Text = WebSite;
						txtPanNo.Text = PANNo;
						txtReqAddress.Text = ReqAddress;
						txtGSTINID.Text = GSTINNo;
						txtCINNo.Text = CINNo;
						ViewState["flag"] = 1;
						btnSave.Text = "Update";
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
		protected void gvCompanyMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{

		}
		protected void gvCompanyMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{

		}
		#endregion
	}
}


