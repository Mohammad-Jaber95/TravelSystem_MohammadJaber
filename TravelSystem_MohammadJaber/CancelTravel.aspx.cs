using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelSystem_MohammadJaber
{
    public partial class CancelTravel : System.Web.UI.Page
    {
        log4net.ILog log = log4net.LogManager.GetLogger("LogFileTravelSystem");
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["Id"] == null)
                Response.Redirect("SignIn.aspx");
            if (Session["UserType"].ToString().ToLower() == "admin")
                Response.Redirect("AdminDefaultPage.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            log.Info("Start Canceling The Travels That The User Have Reserved It");
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    var da = new SqlDataAdapter("spNormalCancelReserve", con);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;

                    int UserId = Convert.ToInt32(Session["Id"]);

                    da.SelectCommand.Parameters.AddWithValue("@UserId", UserId);
                    da.SelectCommand.Parameters.AddWithValue("@TravelId", Session["TravelId"].ToString());
                    da.SelectCommand.Parameters.AddWithValue("@Status", "Canceled");
                    da.SelectCommand.Parameters.AddWithValue("@Message", txtMessage.Text);

                    DataSet ds = new DataSet();
                    da.Fill(ds);
                }
                log.Info("End Canceling The Travels That The User Have Reserved It");
            }
            catch (Exception ex)
            {
                log.Error(ex.Message);
            }

            Response.Redirect("NormalDefaultPage.aspx");
        }
    }
}