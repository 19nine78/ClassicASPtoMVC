using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;

namespace ClassicASPtoMVC.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            //Define a connection string
            string connStr = @"Server=.\SQLExpress;AttachDbFilename=|DataDirectory|ClassicASPtoMVC.mdf;Database=ClassicASPtoMVC;Trusted_Connection=Yes;";

            //Set up our SQL Statement
            string sql = @"SELECT id, FirstName, Surname, Town FROM Users";

            // Create and open a Database Connection
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connStr;
            conn.Open();

            //Create a command
            SqlCommand cmd = new SqlCommand(sql, conn);

            //Execure the command into a DataReader (recordset)
            SqlDataReader results = cmd.ExecuteReader();

            ViewBag.results = results;

            return View();
        }

    }
}
