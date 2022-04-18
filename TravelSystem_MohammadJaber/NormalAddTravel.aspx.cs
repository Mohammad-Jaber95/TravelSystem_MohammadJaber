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
    public partial class NormalAddTravel : System.Web.UI.Page
    {
        log4net.ILog log = log4net.LogManager.GetLogger("LogFileTravelSystem");
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["UserType"].ToString().ToLower() == "admin")
                Response.Redirect("AdminDefaultPage.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            log.Info("Start Viewing Travels");
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    var da = new SqlDataAdapter("AddTravels", con);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;

                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                log.Info("End Viewing Travels");
            }
            catch (Exception ex)
            {
                log.Error(ex.Message);
            }
        }

        protected void lnkReserve_Click(object sender, EventArgs e)
        {
            log.Info("Start Reservation Travels");
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    var da = new SqlDataAdapter("spNormalAddReserve", con);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    int TravelId = Convert.ToInt32((sender as LinkButton).CommandArgument);
                    int UserId = Convert.ToInt32(Session["Id"]);
                    da.SelectCommand.Parameters.AddWithValue("@UserId", UserId);
                    da.SelectCommand.Parameters.AddWithValue("@TravelId", TravelId);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    Response.Redirect("NormalDefaultPage.aspx");
                }
                log.Info("End Reservation Travels");
            }
            catch (Exception ex)
            {
                log.Error(ex.Message);
            }
        }
    }
}