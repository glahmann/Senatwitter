using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace Senatwitter
{
    public partial class InsertPolitician : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string sqlString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void insertPol_Click(object sender, EventArgs e)
        {
            Boolean pass = true;
            if (fname.Text == "") { fnameErr.Text = "Please enter a valid Name"; pass = false; }
            else { fnameErr.Text = ""; }
            if (lname.Text == ""){ lnameErr.Text = "Please enter a valid Name"; pass = false; }
            else { lnameErr.Text = ""; }
            if (phone.Text == ""){ phoneErr.Text = "Please enter a valid Phone Number (xxx-xxx-xxxx)"; pass = false; }
            else { phoneErr.Text = ""; }
            if (email.Text == ""){ emailErr.Text = "Please enter a valid Email"; pass = false; }
            else { emailErr.Text = ""; }
            if (termStart.Text == "") { termStartErr.Text = "Please enter a valid Date"; pass = false; }
            else { termStartErr.Text = ""; }

            if (pass)
            {
                conn = new SqlConnection(("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=" + Server.MapPath("app_data\\Senatwitter.mdf; Integrated Security=True")));
                conn.Open();
                sqlString = "select count(*) as rows from Politicians";
                comm = new SqlCommand(sqlString, conn);
                reader = comm.ExecuteReader();
                int len;
                using (DataTable dt = new DataTable())
                {
                    dt.Load(reader);
                    len = Convert.ToInt32(dt.Rows[0][0]);
                }
                sqlString = "insert into Politicians values (" + (len + 1) + ",'" + fname.Text + "','" + lname.Text + "','" + partyDrop.Text + "','" + stateDrop.Text + "','" + phone.Text + "','" + email.Text + "','" + termStart.Text + "')";
                comm = new SqlCommand(sqlString, conn);
                int success = comm.ExecuteNonQuery();
                if (success == 0) //unsuccessful
                {
                    notification.Text = "Failed Query. Please Try again";
                }
                else
                {
                    notification.Text = "Successfully Inserted Politician";
                }
            } else
            {
                notification.Text = "Failed Query. Please Check your input values";
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }
    }
}