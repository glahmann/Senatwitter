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
            //DropDownList1.SelectedValue = "LastName";
            //DropDownList2.SelectedValue = "FirstName";

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
                    da.Fill(ds);

                    //binding datasource to GridView
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Senatwitter"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(@"SELECT DISTINCT (pl.[FName] + ' ' + pl.[LName]) AS [Senator] 
                                                FROM [POLITICIANS] AS [pl], POLTWEETS AS [pt]
                                                WHERE pl.[PID] = pt.[PID]
                                                ORDER BY [Senator] ASC", con);
                    DataSet ds = new DataSet("MyDS");
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    fullname.DataSource = ds;
                    fullname.DataBind();
                    fullname.DataTextField = "Senator";
                    fullname.DataValueField = "Senator";
                    fullname.DataBind();
                    fullname.Items.Insert(0, new ListItem("Select All", "0"));
                }
            }
            else
            {
                // Is PostBack
                Update_Tweet_Grid();
            }
        }

        protected void Update_Tweet_Grid()
        {
            if (fullname.SelectedValue != "0")
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Senatwitter"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(@"SELECT TOP 10 (pl.FName + ' ' + pl.LName) AS [Senator],
                                                        tw.TWEET AS [Tweet]
                                                FROM TWEETS AS [tw], POLTWEETS AS [pt], POLITICIANS AS [pl]
                                                WHERE tw.POLTWEETID = pt.POLTWEETID AND pt.PID = pl.PID AND (pl.FName + ' ' + pl.LName) = @Senator
                                                ORDER BY tw.POLTWEETID DESC", con);
                    cmd.Parameters.AddWithValue("@Senator", fullname.SelectedValue);
                    DataSet ds = new DataSet("MyDS");
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    //opening connection, filling dataset, closing connection
                    da.Fill(ds);

                    //binding datasource to GridView
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
            }
            else
            {
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
                    da.Fill(ds);

                    //binding datasource to GridView
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
            }
        }
    }
}