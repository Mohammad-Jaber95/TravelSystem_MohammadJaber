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
    public partial class AdminViewReservations : System.Web.UI.Page
    {
        log4net.ILog log = log4net.LogManager.GetLogger("LogFileTravelSystem");
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["UserType"].ToString().ToLower() == "normal")
                Response.Redirect("NormalDefaultPage.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            log.Info("Start Viewing Who Are Reservation The Travels");
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    var da = new SqlDataAdapter("spReservation", con);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;

                    int TravelId = Convert.ToInt32(Request.QueryString["TravelId"]);
                    da.SelectCommand.Parameters.AddWithValue("@TravelId", TravelId);

                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                log.Info("End Viewing Who Are Reservation The Travels");
            }
            catch (Exception ex)
            {
                log.Error(ex.Message);
            }
        }
    }
}