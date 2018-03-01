using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace Senatwitter
{
    public partial class AdminPage : System.Web.UI.Page
    {
        OleDbConnection conn;
        OleDbCommand comm;
        OleDbDataReader reader;
        string sqlString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            conn = new OleDbConnection(("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " + Server.MapPath(@"AppData\Senatwitter.mdf;")));
            conn.Open();

        }
    }
}