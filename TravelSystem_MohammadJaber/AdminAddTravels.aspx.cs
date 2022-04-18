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
    public partial class AdminViewTravels : System.Web.UI.Page
    {
        log4net.ILog log = log4net.LogManager.GetLogger("LogFileTravelSystem");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"].ToString().ToLower() == "normal")
                Response.Redirect("NormalDefaultPage.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminEdit.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            log.Info("Start Adding Travels");
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    var da = new SqlDataAdapter("AdminTravels", con);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.AddWithValue("@FromCountry", txtBox1.Text);
                    da.SelectCommand.Parameters.AddWithValue("@ToCountry", txtBox2.Text);
                    da.SelectCommand.Parameters.AddWithValue("@CurrencyISO", txtISO.Text);
                    da.SelectCommand.Parameters.AddWithValue("@TravelTime", txtTime.Value);
                    da.SelectCommand.Parameters.AddWithValue("@TravelPrice", txtPrice.Text);
                    da.SelectCommand.Parameters.AddWithValue("@PassengersCount", txtCount.Text);

                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    Response.Redirect("AdminDefaultPage.aspx");
                }
                log.Info("End Adding Travels");
            }
            catch (Exception ex)
            {
                log.Error(ex.Message);
            }
        }
    }
}