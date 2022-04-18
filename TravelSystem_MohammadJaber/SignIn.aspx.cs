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
    public partial class SignIn : System.Web.UI.Page
    {
        log4net.ILog log = log4net.LogManager.GetLogger("LogFileTravelSystem");
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            log.Info("Start SignIn Page");
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    var da = new SqlDataAdapter("spSign", con);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.AddWithValue("@Email", txtEmail.Text);
                    da.SelectCommand.Parameters.AddWithValue("@Password", txtPassLog.Text);

                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    //int ErrorCode = ds.Tables[0];
                    DataTable ErrorTable = ds.Tables[0];    
                    DataRow ErrorRow = ErrorTable.Rows[0]; 
                    //int ErrorCode = (int)ErrorRow["ErrorCode"];
                    int ErrorCode = ErrorRow.Field<int>("ErrorCode");
                    string ErrorMsg = ErrorRow.Field<string>("ErrorMsg");
                    

                    if (ErrorCode == -1 || ErrorCode == -2)
                        Response.Write(ErrorMsg);
                    else
                    {
                        DataTable UserTable = ds.Tables[1];
                        DataRow UserData = UserTable.Rows[0];

                        Session["Id"] = UserData.Field<int>("Id");
                        string UserType = UserData.Field<string>("UserType");
                        Session["UserType"] = UserType;
                        Session["UserData"] = UserData;

                        if (UserType == "Admin")
                            Response.Redirect("AdminDefaultPage.aspx"); 
                        else
                            Response.Redirect("NormalDefaultPage.aspx");
                    }
                }
                log.Info("End SignIn Page");
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