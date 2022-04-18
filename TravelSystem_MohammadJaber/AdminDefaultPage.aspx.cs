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
    public partial class AdminDefaultPage : System.Web.UI.Page
    {
        log4net.ILog log = log4net.LogManager.GetLogger("LogFileTravelSystem");
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["UserType"].ToString().ToLower() == "normal")
                Response.Redirect("NormalDefaultPage.aspx");
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAddTravels.aspx");
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            int TravelId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            GridViewRow DataRow = (GridViewRow)((LinkButton)sender).Parent.Parent;
            HttpCookie cookie = new HttpCookie("EditValues");
            cookie["TravelId"] = TravelId.ToString();
            cookie["FromCountry"] = DataRow.Cells[3].Text;
            cookie["ToCountry"] = DataRow.Cells[4].Text;
            cookie["CurrencyISO"] = DataRow.Cells[5].Text;
            cookie["TravelTime"] = DataRow.Cells[6].Text;
            cookie["TravelPrice"] = DataRow.Cells[7].Text;
            cookie["PassengersCount"] = DataRow.Cells[8].Text;

            Response.Cookies.Add(cookie);

            Response.Redirect("~/AdminEdit.aspx");
        }

        protected void lnkReservation_Click(object sender, EventArgs e)
        {
            int TravelId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("~/AdminViewReservations.aspx?TravelId=" + TravelId);
        }
    }
}