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
    public partial class AdminEdit : System.Web.UI.Page
    {
        log4net.ILog log = log4net.LogManager.GetLogger("LogFileTravelSystem");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            { 
                if (Session["UserType"].ToString().ToLower() == "normal") //Page_Init
                    Response.Redirect("NormalDefaultPage.aspx");
                HttpCookie cookie = Request.Cookies["EditValues"];
                if(cookie != null)
                {
                    txtFromCountry.Text = cookie["FromCountry"];
                    txtToCountry.Text = cookie["ToCountry"];
                    txtISO.Text = cookie["CurrencyISO"];
                    txtTime.Value = cookie["TravelTime"];
                    txtPrice.Text = cookie["TravelPrice"];
                    txtCount.Text = cookie["PassengersCount"];
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            log.Info("Start Editing Travel");
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    HttpCookie cookie = Request.Cookies["EditValues"];
                    var da = new SqlDataAdapter("AdminEdit", con);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.AddWithValue("@TravelId", Convert.ToInt32(cookie["TravelId"]));
                    da.SelectCommand.Parameters.AddWithValue("@FromCountry", txtFromCountry.Text);
                    da.SelectCommand.Parameters.AddWithValue("@ToCountry", txtToCountry.Text);
                    da.SelectCommand.Parameters.AddWithValue("@CurrencyISO", txtISO.Text);
                    da.SelectCommand.Parameters.AddWithValue("@TravelTime", txtTime.Value);
                    da.SelectCommand.Parameters.AddWithValue("@TravelPrice", txtPrice.Text);
                    da.SelectCommand.Parameters.AddWithValue("@PassengersCount", txtCount.Text);

                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    Response.Redirect("AdminDefaultPage.aspx");
                }
                log.Info("End Editing Travel");
            }
            catch (Exception ex)
            {
                log.Error(ex.Message);
            }
        }
    }
}