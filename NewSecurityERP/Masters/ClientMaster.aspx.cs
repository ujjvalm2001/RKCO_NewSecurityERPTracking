using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BalLayer;
using Newtonsoft.Json;

namespace NewSecurityERP.Masters
{
	public partial class ClientMaster : System.Web.UI.Page
	{
		#region Page Load
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				if (!string.IsNullOrEmpty(Convert.ToString(Session["CompanyID"])))
				{
					//if (Convert.ToString(Session["CompanyID"]) == "2") { chkComp2.Visible = false; }
					if (!IsPostBack)
					{
						BindDropDown();
						BindGridView();
						BindMaxID();
						ViewState["flag"] = 0;
						if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["cid"])))
						{
							txtClientCode.Text = Convert.ToString(Request.QueryString["cid"]);
							BindSearchData();
							Session.Remove("ClientCode");
						}
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
		#region "Function :- BindGrid or BindMaxID or SearchData"
		public void BindDropDown()
		{
			MasterCommonClass mc = new MasterCommonClass();
			ddlState.DataSource = mc.BindTableData("STATE", "stateName");
			ddlState.DataTextField = "stateName";
			ddlState.DataValueField = "stateCode";
			ddlState.DataBind();
			ddlState.Items.Insert(0, "--Select--");
		}
		public void BindGridView()
		{
			MasterCommonClass mc = new MasterCommonClass();
			DataTable dt = mc.BindTableData("CLIENT", "clientname");
			gvClientMaster.DataSource = dt;
			gvClientMaster.DataBind();
			Session["ClientMaster"] = dt;
		}
		public void BindMaxID()
		{
			MasterCommonClass mc = new MasterCommonClass();
			int MaxID = mc.FatchMaxRecord("CLIENT", "clientCode", Convert.ToInt32(Session["CompanyID"]));
			txtClientCode.Text = (MaxID + 1).ToString();
		}
		public void BindSearchData()
		{
			try
			{
				MasterCommonClass mc = new MasterCommonClass();

				int compID = string.IsNullOrEmpty(Convert.ToString(Session["CompanyID"])) ? 0 : Convert.ToInt32(Session["CompanyID"]);
				int ClientCode = string.IsNullOrEmpty(txtClientCode.Text) ? 0 : Convert.ToInt32(txtClientCode.Text);

				DataTable dt = mc.BindClientDetail(compID, ClientCode);
				if (dt.Rows.Count > 0)
				{
					txtClientName.Text = dt.Rows[0]["Client Name"].ToString();
					txtAddress.Text = dt.Rows[0]["HeadOffice"].ToString();
					txtAddress1.Text = dt.Rows[0]["Address2"].ToString();
					txtPhoneNo.Text = dt.Rows[0]["PhoneNo"].ToString();
					txtEmailID.Text = dt.Rows[0]["EmailID"].ToString();
					txtWebSite.Text = dt.Rows[0]["WebSite"].ToString();
					txtCity.Text = dt.Rows[0]["CityName"].ToString();
					txtPincode.Text = dt.Rows[0]["PinCode"].ToString();
					txtRemark.Text = dt.Rows[0]["Remark"].ToString();
					if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["stateCode"]))) { ddlState.ClearSelection(); ddlState.Items.FindByValue(Convert.ToString(dt.Rows[0]["stateCode"])).Selected = true; }
					//ddlState.Text = dt.Rows[0]["stateName"].ToString();
					//ddlState.SelectedItem.Value = dt.Rows[0]["stateCode"].ToString();
					//chkComp2.Checked = Convert.ToInt32(dt.Rows[0]["TrnsCom2"].ToString()) == 1 ? true : false;
					ViewState["flag"] = 1;
					btnSave.Text = "Update";
				}
				else
				{
					ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + "Client Code not Exists")})</script>", false);
					ClearFormText();
				}
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
				ClearFormText();

			}


		}
		#endregion

		#region "Button:- Save"
		protected void btnSave_Click(object sender, EventArgs e)
		{
			try
			{

				MasterCommonClass mc = new MasterCommonClass();
				//if (btnSave.Text == "Save")
				//{
				//	DataTable dt = mc.BindTableDataBranch("select * from client where clientcode=" + Convert.ToInt32(txtClientCode.Text) + " and clientname='" + txtClientName.Text + "' and compid=" + Convert.ToInt32(Session["CompanyID"]) + " ");
				//	if (dt.Rows.Count > 0)
				//	{
				//		ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + "Client Name Exist.....")})</script>", false);
				//		return;
				//	}
				//}
				ClientMasters cm = new ClientMasters();
				cm.flag = Convert.ToInt32(ViewState["flag"].ToString());
				cm.ClientCode = Convert.ToInt32(txtClientCode.Text);
				cm.ClientName = txtClientName.Text;
				cm.PhoneNo = txtPhoneNo.Text;
				cm.EmailID = txtEmailID.Text;
				cm.WebSite = txtWebSite.Text;
				cm.HeadOffice = txtAddress.Text;
				cm.Address2 = txtAddress1.Text;
				cm.StateID = ddlState.SelectedIndex == 0 ? 0 : Convert.ToInt32(ddlState.SelectedValue);
				cm.CityName = txtCity.Text;
				cm.PinCode = txtPincode.Text;
				cm.Remark = txtRemark.Text;
				cm.compid = Convert.ToInt32(Session["CompanyID"]);
				cm.CreatedByUserID = Convert.ToInt32(Session["UserID"]);
				cm.ModifiedByUserID = Convert.ToInt32(Session["UserID"]);
				//cm.chkComp2 = Convert.ToInt32(chkComp2.Checked);
				string Result = mc.InsertClientDetail(cm);
				if (Result == "Record Saved Successfully")
				{
					
					ScriptManager.RegisterStartupScript(this, typeof(Page), "success", $"<script>success({JsonConvert.SerializeObject("Success: " + "Record Saved Successfully")})</script>", false);
					BindGridView();
					BindMaxID();
					ClearFormText();
					ViewState["flag"] = 0;
				}
				//btnSave.Text = "Update";
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
			txtClientName.Text = string.Empty;
			txtPhoneNo.Text = string.Empty;
			txtEmailID.Text = string.Empty;
			txtWebSite.Text = string.Empty;
			txtAddress.Text = string.Empty;
			txtAddress1.Text = string.Empty;
			txtCity.Text = string.Empty;
			txtPincode.Text = string.Empty;
			txtRemark.Text = string.Empty;
			//chkComp2.Checked = false;
			ddlState.ClearSelection();
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

		#region "ButtonShow Data"
		protected void btnShow_Click(object sender, EventArgs e)
		{
			try
			{
				BindSearchData();
			}
			catch (Exception ex)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
			}

		}
		#endregion

		protected void gvClientMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{

		}
		protected void gvClientMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{

		}
		protected void gvClientMaster_RowCommand(object sender, GridViewCommandEventArgs e)
		{
		try
		{
			if (e.CommandName == "update")
			{
				string ClientID = e.CommandArgument.ToString();
				DataTable dtFromSession = (DataTable)Session["ClientMaster"];
				DataRow[] rows = dtFromSession.Select("clientCode = " + ClientID);
				if (rows.Length > 0)
				{
					DataRow row = rows[0];
					txtClientCode.Text = rows[0]["clientCode"].ToString();
					txtClientName.Text = rows[0]["ClientName"].ToString();
					txtPhoneNo.Text = rows[0]["PhoneNo"].ToString();
					txtEmailID.Text = rows[0]["EmailID"].ToString();
					txtWebSite.Text = rows[0]["Website"].ToString();
					txtAddress.Text = rows[0]["HeadOffice"].ToString();
					txtAddress1.Text = rows[0]["Address2"].ToString();
					txtCity.Text = rows[0]["CityName"].ToString();
					txtPincode.Text = rows[0]["PinCode"].ToString();
					txtRemark.Text = rows[0]["Remark"].ToString();
					ddlState.SelectedValue = rows[0]["StateCode"].ToString();
					ViewState["flag"] = 1;
					btnSave.Text = "Update";
				}
				else
				{

				}

			}
		}
		catch (Exception ex)
		{
			ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
		}
	}
	}
}