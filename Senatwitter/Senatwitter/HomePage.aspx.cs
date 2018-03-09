using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Senatwitter
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "LastName";
            DropDownList2.SelectedValue = "FirstName";

            if (!Page.IsPostBack)
            {
                //setting connection
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Senatwitter"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(@"SELECT TOP 10 (pl.[FName] + ' ' + pl.[LName]) AS [Senator],
                                                        tw.[TWEET] AS [Tweet]
                                                FROM [TWEETS] AS [tw], [POLTWEETS] AS [pt], [POLITICIANS] AS [pl]
                                                WHERE tw.[POLTWEETID] = pt.[POLTWEETID] AND pt.[PID] = pl.[PID]
                                                ORDER BY tw.[POLTWEETID] DESC", con);
                    DataSet ds = new DataSet("MyDS");
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    //opening connection, filling dataset, closing connection
                    con.Open();
                    da.Fill(ds);
                    con.Close();

                    //binding datasource to GridView
                    GridView1.DataSource = ds;
                    GridView1.DataBind();

                }  
            }
        }
        protected void HomeDataSource4_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void PolTwitter_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
        }

        protected void fullname_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}