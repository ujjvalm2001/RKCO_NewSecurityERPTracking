using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BalLayer;

namespace NewSecurityERP.CandidateRegistration
{
	public partial class CandidateApproval : System.Web.UI.Page
	{
		#region Page Load
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				if (!string.IsNullOrEmpty(Convert.ToString(Session["CompanyID"])))
				{
					string LoginType = Convert.ToString(Session["loginType"]);
					string UserID = Convert.ToString(Session["UserID"]);

					if (!IsPostBack)
					{
						BindGridView();
					}
				}
				else Response.Redirect("~/Default.aspx");
			}
			catch (Exception ex) { Response.Write(ex.Message); }
		}
		#endregion
		public void BindGridView()
		{
			try
			{
				DataTable dt = new DataTable();
				dt = new CanRegistration().BindCandidateRegistrationPendingData(Convert.ToInt32(Session["UserID"]), "0", Convert.ToString(Session["loginType"]), Convert.ToInt32(Session["CompanyID"]));
				if (dt.Rows.Count > 0)
				{
					gvCandidate.DataSource = dt;
					gvCandidate.DataBind();
				}
			}
			catch (Exception ex)
			{
				Response.Write(ex.Message);
			}
		}

		protected void gvCandidate_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName == "update")
			{
				LinkButton lnkbtn = (LinkButton)e.CommandSource;
				int index = Convert.ToInt32(lnkbtn.CommandArgument);
				GridViewRow row = gvCandidate.Rows[index];

				// Find the cell values using cell index
				string RegId = row.Cells[2].Text; // Assuming RegistrationID is the first column
				Response.Redirect("ViewCandidateRegistration?RegistrationID=" + RegId + "");
			}
		}

		protected void gvCandidate_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{

		}
		protected void gvCandidate_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{

		}
	}
}