using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace TravelSystem_MohammadJaber
{
    public partial class SignUp : System.Web.UI.Page
    {
        log4net.ILog log = log4net.LogManager.GetLogger("LogFileTravelSystem");

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            log.Info("Start Registration Users");
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    var da = new SqlDataAdapter("spUser", con);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;

                    da.SelectCommand.Parameters.AddWithValue("@CivilId", txtCivil.Text);
                    da.SelectCommand.Parameters.AddWithValue("@FullName", txtName.Text);
                    da.SelectCommand.Parameters.AddWithValue("@Age", txtAge.Text);
                    da.SelectCommand.Parameters.AddWithValue("@Email", txtEmail.Text);
                    da.SelectCommand.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text);
                    da.SelectCommand.Parameters.AddWithValue("@Address", txtAddress.Text);
                    da.SelectCommand.Parameters.AddWithValue("@Password", txtPass.Text);
                    da.SelectCommand.Parameters.AddWithValue("@ConPassword", txtConfPass.Text);
                    

                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    DataTable ErrorTable = ds.Tables[0];
                    DataRow ErrorRow = ErrorTable.Rows[0];
                    int ErrorCode = ErrorRow.Field<int>("ErrorCode");
                    string ErrorMsg = ErrorRow.Field<string>("ErrorMsg");

                    if (ErrorCode == -1)
                        Response.Write(ErrorMsg);
                    else
                        Response.Write("<script>alert('You Have Registered Successfully')</script>");
                }
                log.Info("End Registration Users");

            }
            catch (Exception ex)
            {

                log.Error(ex.Message);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}