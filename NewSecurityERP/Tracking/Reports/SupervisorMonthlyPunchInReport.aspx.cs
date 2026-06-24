using DalLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSecurityERP.Tracking.Reports
{
    public partial class SupervisorMonthlyPunchInReport : System.Web.UI.Page
    {
        static int month;
        static int year;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindYearDropDown();
            }
        }


        protected void BindYearDropDown()
        {
            int currentYear = DateTime.Now.Year;
            int previousYear = currentYear - 1;

            ddlYear.Items.Insert(0, new ListItem("-- SELECT --", "0"));
            ddlYear.Items.Insert(1, new ListItem(currentYear.ToString(), currentYear.ToString()));
            ddlYear.Items.Insert(2, new ListItem(previousYear.ToString(), previousYear.ToString()));

        }


        [WebMethod]
        public static string GetDataForDataTable(int month, int year)
        {
            try
            {
                SqlParameter[] sp =
                {
                     new SqlParameter("@Month" ,month),
                     new SqlParameter("@Year" ,year)
                };

                DataTable dt = DBClass.GetDataTableByProc("SupervisorMonthlyPunchInReport", sp);
                string jsonResult = JsonConvert.SerializeObject(dt);
                return jsonResult;
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(new { success = false, message = ex.Message });
            }
        }



        [WebMethod]
        public static string HandleDayClick(string empcode, string fromDate, string todate)
        {
            try
            {
                //SqlParameter[] sp =
                //{
                //     new SqlParameter("@empcode" ,empcode),
                //     new SqlParameter("@selectedDay" ,day),
                //     new SqlParameter("@selectedMonth" ,month),
                //     new SqlParameter("@selectedYear" ,year)
                //};

                //DataSet ds = DBClass.GetDataSeteByProc("SupervisorAttendanceByDay", sp);
                SqlParameter[] sp =
                {
                     new SqlParameter("@SupervisorId" ,empcode),
                       new SqlParameter("@StartDate" ,fromDate),
                         new SqlParameter("@EndDate" ,todate),

                };

                DataSet ds = DBClass.GetDataSeteByProc("SuperVisorTaskHistory", sp);

                var result = new
                {
                    success = true,
                    Table1 = JsonConvert.SerializeObject(ds.Tables[0]),
                    Table2 = JsonConvert.SerializeObject(ds.Tables[1]),
                    Table3 = JsonConvert.SerializeObject(ds.Tables[2])
                };

                string jsonResult = JsonConvert.SerializeObject(result);
                return jsonResult;
            }
            catch (Exception ex)
            {
                var errorResult = new
                {
                    success = false,
                    message = ex.Message
                };

                return JsonConvert.SerializeObject(errorResult);
            }
        }
    }
}