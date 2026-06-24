using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace DalLayer
{
    public class DBClass
    {
        /*-----Function For Return Connection ------------------------------------------------------------*/
        public static SqlConnection GetDatabaseConnection()
        {
            string bDir = AppDomain.CurrentDomain.BaseDirectory.ToString();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            if (cn.State == ConnectionState.Closed) cn.Open();
            else cn.Open();
            return cn;
        }
        public static SqlConnection GetConnection()
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            return cn;
        }

        /*-----Function For Close Connection -------------------------------------------------------------*/
        /*------------------------------------------------------------------------------------------------*/

        public static void OpenConnection()
        {
            SqlConnection cn = GetConnection();
            if (cn.State == ConnectionState.Closed)
            {
                cn.Open();

            }
        }

        /*-----Function For Close Connection -------------------------------------------------------------*/
        /*------------------------------------------------------------------------------------------------*/
        public static void CloseConnection()
        {
            SqlConnection cn = GetConnection();
            if (cn.State == ConnectionState.Open)
                cn.Close();
        }

        /*-----Function For Execute Reader ---------------------------------------------------------------*/
        /*------------------------------------------------------------------------------------------------*/

        public static SqlDataReader ExecuteReader(string Query)
        {
            SqlDataReader dr = null;
            SqlConnection cn = GetConnection();
            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = Query;
                cmd.CommandType = CommandType.Text;
                cmd.Connection = cn; cmd.CommandTimeout = 6000;
                dr = cmd.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dr;
        }
        /*-----Function For Execute Non Query------------------------------------------------------------*/
        /*------------------------------------------------------------------------------------------------*/
        public static int ExecuteNonQuery(string query)
        {
            int i = 0;
            using (SqlConnection cn = GetConnection())
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn;
                cn.Open();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = query;
                cmd.CommandTimeout = 6000;
                i = cmd.ExecuteNonQuery();
            }
            return i;
        }

        /*-----Function For Return Data Table ------------------------------------------------------------*/
        /*------------------------------------------------------------------------------------------------*/
        public static DataTable GetDataTable(string Query)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;
            using (SqlConnection cn = GetConnection())
            {
                try
                {
                    if (string.Compare(cn.State.ToString(), "Closed") == 0) cn.Open();
                    else cn.Close();

                    da = new SqlDataAdapter(Query, cn);
                    da.Fill(dt);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                return dt;
            }
        }

        /*-----Function For Execute Procedure------------------------------------------------*/
        /*------------------------------------------------------------------------------------------------*/
        public static int ExecuteProcedure(string DataBaseProcedure, SqlParameter[] NewParameters)
        {
            int i = 0;
            try
            {
                using (SqlConnection cn = GetConnection())
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cn.Open();
                    SqlParameter sp = new SqlParameter();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = DataBaseProcedure;
                    if (cmd.Parameters.Count > 0)
                    {
                        cmd.Parameters.Clear();
                    }
                    foreach (SqlParameter spl in NewParameters)
                    {
                        sp = spl;
                        cmd.Parameters.Add(sp);
                    }
                    cmd.CommandTimeout = 6000;
                    i = cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return i;
        }
        /*----- Begin Function For Execute Procedure with out Parameter------------------------------------------------*/

        public static string ExecuteProcedureOutParam(string OutParam, string DataBaseProcedure, SqlParameter[] NewParameters)
        {
            //int i = 0;
            string outmsg = string.Empty;
            try
            {
                using (SqlConnection cn = GetConnection())
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cn.Open();
                    SqlParameter sp = new SqlParameter();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = DataBaseProcedure;
                    if (cmd.Parameters.Count > 0)
                    {
                        cmd.Parameters.Clear();
                    }
                    foreach (SqlParameter spl in NewParameters)
                    {
                        sp = spl;
                        cmd.Parameters.Add(sp);
                    }
                    cmd.Parameters.Add(OutParam, SqlDbType.NVarChar, 50);
                    cmd.Parameters[OutParam].Direction = ParameterDirection.Output;
                    cmd.CommandTimeout = 6000;
                    cmd.ExecuteNonQuery();
                    outmsg = cmd.Parameters[OutParam].Value.ToString();
                    //return outmsg.ToString();

                    //i = cmd.ExecuteNonQuery();
                    cn.Close();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return outmsg.ToString();
        }

        /*----- End Function For Execute Procedure with out Parameter------------------------------------------------*/


        /*-----Function For Execute Query By Procedure----------------------------------------------------*/
        /*------------------------------------------------------------------------------------------------*/
        public static DataTable GetDataTableByProc(string DatabaseProcedureName, SqlParameter[] NewParameters)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;
            using (SqlConnection cn = GetConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cn.Open();
                    //cmd.CommandTimeout = 6000;
                    SqlParameter SParameter = new SqlParameter();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = DatabaseProcedureName;
                    if (cmd.Parameters.Count > 0)
                        cmd.Parameters.Clear();
                    foreach (SqlParameter LoopVarParam in NewParameters)
                    {
                        SParameter = LoopVarParam;
                        cmd.Parameters.Add(SParameter);
                    }

                    da = new SqlDataAdapter(cmd);
                    da.SelectCommand.CommandTimeout = 6000;
                    da.Fill(dt);
                    cn.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                return dt;
            }
        }
        /*-----Function For Execute Query By Procedure----------------------------------------------------*/

        public static DataSet GetDataSeteByProc(string DatabaseProcedureName, SqlParameter[] NewParameters)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da;
            using (SqlConnection cn = GetConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cn.Open();
                    //cmd.CommandTimeout = 6000;
                    SqlParameter SParameter = new SqlParameter();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = DatabaseProcedureName;
                    if (cmd.Parameters.Count > 0)
                        cmd.Parameters.Clear();
                    foreach (SqlParameter LoopVarParam in NewParameters)
                    {
                        SParameter = LoopVarParam;
                        cmd.Parameters.Add(SParameter);
                    }

                    da = new SqlDataAdapter(cmd);
                    da.SelectCommand.CommandTimeout = 6000;
                    da.Fill(ds);
                    cn.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                return ds;
            }
        }


        /*------------------------------------------------------------------------------------------------*/
        public static DataTable GetDataTableByProc(string DatabaseProcedureName)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;
            using (SqlConnection cn = GetConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = DatabaseProcedureName;
                    da = new SqlDataAdapter(cmd);
                    da.SelectCommand.CommandTimeout = 6000;
                    da.Fill(dt);
                    cn.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                return dt;
            }
        }

        /*----------Begin Function to check is any record for the query------------*/
        public static Boolean IsExistRecord(string Strqry)
        {
            try
            {
                DataTable dt = DBClass.GetDataTable(Strqry);

                if (dt != null && dt.Rows.Count > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        /*----------End Function to check is any record for the query------------*/

        public static bool ExecuteScalar(string DataBaseProcedure, SqlParameter[] NewParameters)
        {
            bool IsValid = false;
            try
            {
                using (SqlConnection cn = GetConnection())
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cn.Open();
                    SqlParameter sp = new SqlParameter();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = DataBaseProcedure;
                    if (cmd.Parameters.Count > 0)
                    {
                        cmd.Parameters.Clear();
                    }
                    foreach (SqlParameter spl in NewParameters)
                    {
                        sp = spl;
                        cmd.Parameters.Add(sp);
                    }
                    //IsValid = (bool)cmd.ExecuteScalar();
                    cmd.CommandTimeout = 6000;
                    object IsValid1 = cmd.ExecuteScalar();
                    cn.Close();
                }
            }
            catch
            {
                IsValid = false;
            }
            return IsValid;
        }

        /*-------Get Datareder value By Stored Procedure ------------------------ */ // Shahzad 03/03/2021

        public static SqlDataReader ExecuteReaderByProc(string DatabaseProcedureName, SqlParameter[] NewParameters)
        {
            SqlDataReader dr = null;
            SqlConnection cn = GetConnection();
            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand();
                SqlParameter SParameter = new SqlParameter();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = DatabaseProcedureName;
                if (cmd.Parameters.Count > 0)
                    cmd.Parameters.Clear();
                foreach (SqlParameter LoopVarParam in NewParameters)
                {
                    SParameter = LoopVarParam;
                    cmd.Parameters.Add(SParameter);
                }
                cmd.Connection = cn; cmd.CommandTimeout = 6000;
                dr = cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dr;
        }

        /*-------Get Datareder value By Stored Procedure ------------------------ */

        //************************* For Issue Module *************************** Shahzad 03/03/2021
        public static object ExecuteScalar(string query)
        {
            using (SqlConnection cn = GetConnection())
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn;
                cn.Open();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = query;
                cmd.CommandTimeout = 6000;
                return cmd.ExecuteScalar();
            }
        }
    }
}
