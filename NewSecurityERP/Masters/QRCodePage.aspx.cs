using BalLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSecurityERP.Masters
{
    public partial class QRCodePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve QR code bytes from session
                byte[] qrCodeBytes = Session["QRCodeBytes"] as byte[];
                string qrCodeUnitDetailsJson = Session["QRCodeUnitDetails"] as string;

                if (qrCodeBytes != null && qrCodeUnitDetailsJson != null)
                {
                    QRCodeUnitDetails qrCodeUnitDetails = JsonConvert.DeserializeObject<QRCodeUnitDetails>(qrCodeUnitDetailsJson);

                    // Set the QR code image
                    imgQRCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(qrCodeBytes);

                    lblUnitCode.Text = qrCodeUnitDetails.UnitMasterCode;
                    lblUnitName.Text = qrCodeUnitDetails.UnitName;
                    lblAddress.Text = qrCodeUnitDetails.Address;
                }
                else
                {
                    // Handle the case where QR code bytes are not available
                    // For example, redirect to an error page
                }
            }
        }
    }
}