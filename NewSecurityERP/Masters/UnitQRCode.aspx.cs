using BalLayer;
using DalLayer;
using Newtonsoft.Json;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSecurityERP.Masters
{
    public partial class UnitQRCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindBranchDropDown();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void BindBranchDropDown()
        {
            try
            {
                DataTable dt = DBClass.GetDataTableByProc("GetAllBranch_Tracking");
                ddlBranch.DataSource = dt;
                ddlBranch.DataTextField = "BranchNameWithCode";
                ddlBranch.DataValueField = "branchcode";
                ddlBranch.DataBind();
                ddlBranch.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int BranchCode = Convert.ToInt32(ddlBranch.SelectedValue);
                int CompId = Convert.ToInt32(Session["CompanyID"]);


                SqlParameter[] sp =
                {
                     new SqlParameter("@BranchCode" ,BranchCode),
                     new SqlParameter("@CompID" ,CompId)

                };

                DataTable dt = DBClass.GetDataTableByProc("GetUnitByBranchCode_Tracking", sp);
                ddlUnit.DataSource = dt;
                ddlUnit.DataTextField = "UnitNameWithCode";
                ddlUnit.DataValueField = "unitcode";
                ddlUnit.DataBind();
                ddlUnit.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }


        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            ddlBranch.SelectedValue = ddlUnit.SelectedValue = "0";
        }

        protected void ShowQRCode_Click(object sender, EventArgs e)
        {
            try
            {
                string unitId = ddlUnit.SelectedValue;

                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.BindDataTableFromQuery("Select * from Unit where unitcode = " + unitId + "");
                QRCodeUnitDetails unitDetails = GetUnitDetailsFromDataTable(dt);

                if (unitDetails != null)
                {
                    if (!string.IsNullOrEmpty(unitDetails.Latitude) && !string.IsNullOrEmpty(unitDetails.Longitude))
                    {
                        // Save Unit Details TO Session
                        Session["QRCodeUnitDetails"] = JsonConvert.SerializeObject(unitDetails);

                        // Generate QR code
                        byte[] qrCodeBytes = GenerateQRCode(unitDetails);

                        // Convert QR code byte array to base64 string
                        Session["QRCodeBytes"] = qrCodeBytes;

                        // Use JavaScript to open the QR code page in a new tab
                        string script = "window.open('/Masters/QRCodePage.aspx', '_blank');";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenQRCodePage", script, true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Info", $"<script>info({JsonConvert.SerializeObject("Unit geo-tagging has not been updated. !")})</script>", false);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Info", $"<script>info({JsonConvert.SerializeObject("Unit Details Not Found !")})</script>", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }


        private byte[] GenerateQRCode(QRCodeUnitDetails unitDetails)
        {
            // string data = $"UnitMasterCode: {unitDetails.UnitMasterCode}, UnitName: {unitDetails.UnitName}, Latitude: {unitDetails.Latitude}, Longitude: {unitDetails.Longitude}";
            byte[] imageData = null;

            try
            {
                string jsonData = JsonConvert.SerializeObject(unitDetails);

                QRCodeGenerator qrGenerator = new QRCodeGenerator();
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(jsonData, QRCodeGenerator.ECCLevel.Q);
                QRCode qrCode = new QRCode(qrCodeData);
                Bitmap qrCodeImage = qrCode.GetGraphic(20); // Adjust the size as needed

                using (MemoryStream stream = new MemoryStream())
                {
                    qrCodeImage.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                    imageData = stream.ToArray();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }

            return imageData ?? new byte[0];
        }


        private QRCodeUnitDetails GetUnitDetailsFromDataTable(DataTable dt)
        {
            try
            {
                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    return new QRCodeUnitDetails
                    {
                        UnitMasterCode = row["UnitCode"].ToString(),
                        UnitName = row["UnitName"].ToString(),
                        Address = row["Address"].ToString(),
                        Latitude = row["Latitude"].ToString(),
                        Longitude = row["Longitude"].ToString()
                    };
                }
                return null;
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
                return null;
            }

        }


    }
}