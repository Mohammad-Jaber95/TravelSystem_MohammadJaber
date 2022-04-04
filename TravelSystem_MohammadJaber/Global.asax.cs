using log4net.Config;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace TravelSystem_MohammadJaber
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            string _LogFilePath = AppDomain.CurrentDomain.BaseDirectory + "logs\\";
            Directory.CreateDirectory(_LogFilePath);

            log4net.GlobalContext.Properties["LogFileName"] = _LogFilePath + "Tracking_Log";
            //XmlConfigurator.Configure();

            FileInfo _fileinfo = new System.IO.FileInfo(AppDomain.CurrentDomain.BaseDirectory + "log4net.config");
            XmlConfigurator.ConfigureAndWatch(_fileinfo);
        }
    }
}