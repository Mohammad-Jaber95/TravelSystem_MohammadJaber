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
    public partial class NormalDefaultPage : System.Web.UI.Page
    {
        log4net.ILog log = log4net.LogManager.GetLogger("LogFileTravelSystem");
        protected void Page_Init(object sender, EventArgs e) 
        {
            if (Session["UserType"].ToString().ToLower() == "admin")
                Response.Redirect("AdminDefaultPage.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                log.Info("Start Viewing The Travels That The User Have Reserved It");
                try
                {
                    Label1.Text = ((DataRow)Session["UserData"]).Field<string>("FullName");
                    string CS = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        var da = new SqlDataAdapter("spNormalReservations", con);
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;

                        int UserId = Convert.ToInt32(Session["Id"]);
                        da.SelectCommand.Parameters.AddWithValue("@Id", UserId);

                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        DataTable dt = ds.Tables[0].Copy();
                        dt.Columns[0].ColumnName = "Travel ID";
                        dt.Columns[1].ColumnName = "From Country";
                        dt.Columns[2].ColumnName = "To Country";
                        dt.Columns[3].ColumnName = "Currency ISO";
                        dt.Columns[4].ColumnName = "Travel Time";
                        dt.Columns[5].ColumnName = "Travel Price";
                        dt.Columns[6].ColumnName = "Passengers Count";
                        dt.Columns[7].ColumnName = "Status";
                        dt.Columns[8].ColumnName = "Message";

                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                    log.Info("End Viewing The Travels That The User Have Reserved It");
                }
                catch (Exception ex)
                {
                    log.Error(ex.Message);
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("NormalAddTravel.aspx");
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("CancelTravel.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            log.Info("Start Canceling The Travels That The User Have Reserved It");
            try
            {
                Panel pnlCancel = (Panel)(((Button)sender).Parent);
                TextBox txtMessage = (TextBox)pnlCancel.Controls[4];
                GridViewRow row = (GridViewRow)pnlCancel.Parent.Parent;
                int travelID = Convert.ToInt32(row.Cells[1].Text);
                Session["TravelId"] = travelID.ToString();

                string CS = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    var da = new SqlDataAdapter("spNormalCancelReserve", con);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;

                    int UserId = Convert.ToInt32(Session["Id"]);

                    da.SelectCommand.Parameters.AddWithValue("@UserId", UserId);
                    da.SelectCommand.Parameters.AddWithValue("@TravelId", travelID);
                    da.SelectCommand.Parameters.AddWithValue("@Status", "Canceled");
                    da.SelectCommand.Parameters.AddWithValue("@Message", txtMessage.Text);

                    DataSet ds = new DataSet();
                    da.Fill(ds);
                }
                log.Info("End Canceling The Travels That The User Have Reserved It");

                //To Reload The Page To Show the Updated Data on the GridView
                Response.Redirect(Page.Request.Url.ToString(), true);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message);
            }
        }
    }
}