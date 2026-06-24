using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DalLayer;

namespace BalLayer
{
	public class loginCommonClass
	{
		/*--------------------------------------------------------------- Encrypt the string ----------------------------------------------------------------*/

		public string Encrypt(string icText)
		{
			int icLen;
			string icNewText = string.Empty;
			char icChar;
			icLen = icText.Length;
			for (int i = 1; (i <= icLen); i++)
			{
				icChar = Convert.ToChar(icText.Substring((i - 1), 1));
				if (icChar >= 65 && icChar <= 90)
					icChar = ((char)((int)icChar + 127));
				if (icChar >= 97 && icChar <= 122)
					icChar = ((char)((int)icChar + 121));
				if (icChar >= 48 && icChar <= 57)
					icChar = ((char)((int)icChar + 196));
				if (icChar == 32)
					icChar = ' ';
				icNewText = (icNewText + icChar);
			}
			return icNewText;
		}
		public string Decrypt(string icText)
		{
			int icLen;
			string icNewText = string.Empty;
			char icChar;
			icLen = icText.Length;
			for (int i = 1; (i <= icLen); i++)
			{
				icChar = Convert.ToChar(icText.Substring((i - 1), 1));

				if (icChar >= 192 && icChar <= 217)
					icChar = ((char)((int)icChar - 127));
				if (icChar >= 218 && icChar <= 242)
					icChar = ((char)((int)icChar - 121));
				if (icChar >= 244 && icChar <= 253)
					icChar = ((char)((int)icChar - 196));
				if (icChar == 32)
					icChar = ' ';
				icNewText = (icNewText + icChar);
			}
			return icNewText;
		}
		public DataTable VerifyUser(string UserName, string Password, int CompanyID)
		{
			DataTable dt = new DataTable();
			SqlParameter[] sp = {
										new SqlParameter("@UserID" ,UserName),
										new SqlParameter("@UserPassword" , Password),
										new SqlParameter("@compid" , CompanyID)

									};
			dt = DBClass.GetDataTableByProc("VerifyUserPassword", sp);
			return dt;


		}
	}
}
