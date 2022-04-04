using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelSystem_MohammadJaber
{
    public partial class Shared : System.Web.UI.MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!(Page.Request.Url.AbsolutePath.ToLower().Contains("signup") ||
                Page.Request.Url.AbsolutePath.ToLower().Contains("signin")) && Session["Id"] == null)
                Response.Redirect("SignIn.aspx");
        }
    }
}