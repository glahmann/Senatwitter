using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Senatwitter
{
    public partial class AdminPage : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string sqlString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=" + Server.MapPath("app_data\\Senatwitter.mdf; Integrated Security=True")));
            conn.Open();
            sqlString = "select * from Admins where username = '" + username.Text + "' AND password = '" + password.Text + "'";
            comm = new SqlCommand(sqlString, conn);
            reader = comm.ExecuteReader();
            if (reader.HasRows)
                Response.Redirect("InsertPolitician.aspx");
            else
                Response.Redirect("AccessDenied.aspx");

        }
    }
}