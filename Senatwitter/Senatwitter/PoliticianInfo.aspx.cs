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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadStateDropDown();
                LoadSenDropDown();
            }
            else
            {

                Update_Sen_Drop();
            }
            LoadGridData();
        }

        private void LoadStateDropDown()
        {
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Senatwitter"].ConnectionString))
            {
                // State drop down list
                SqlCommand cmd = new SqlCommand(@"SELECT StateID
                                                FROM State
                                                ORDER BY StateID ASC", con);
                DataSet ds = new DataSet("MyDS");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                stateDrop.DataSource = ds;
                stateDrop.DataBind();
                stateDrop.DataTextField = "StateID";
                stateDrop.DataValueField = "StateID";
                stateDrop.DataBind();
                stateDrop.Items.Insert(0, new ListItem("Select All", "0"));
            }
        }

        private void LoadSenDropDown()
        {
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Senatwitter"].ConnectionString))
            {
                SqlDataAdapter da;
                if (stateDrop.SelectedValue == "0")
                {
                    SqlCommand cmd = new SqlCommand(@"SELECT (FName + ' ' + LName) AS Senator 
                                                FROM POLITICIANS
                                                ORDER BY Senator ASC", con);
                    da = new SqlDataAdapter(cmd);
                }
                else
                {
                    SqlCommand cmd = new SqlCommand(@"SELECT DISTINCT (FName + ' ' + LName) AS Senator 
                                                FROM POLITICIANS
                                                WHERE StateID = @StateID
                                                ORDER BY Senator ASC", con);
                    cmd.Parameters.AddWithValue("@StateID", stateDrop.SelectedValue);
                    da = new SqlDataAdapter(cmd);
                }
                
                DataSet ds = new DataSet("MyDS");
                
                da.Fill(ds);
                senatorDrop.DataSource = ds;
                senatorDrop.DataBind();
                senatorDrop.DataTextField = "Senator";
                senatorDrop.DataValueField = "Senator";
                senatorDrop.DataBind();
                senatorDrop.Items.Insert(0, new ListItem("Select All", "0"));
            }
        }

        private void LoadGridData()
        {
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Senatwitter"].ConnectionString))
            {
                SqlDataAdapter da;
                if (stateDrop.SelectedValue == "0" && senatorDrop.SelectedValue == "0")
                {
                    SqlCommand cmd = new SqlCommand(@"SELECT (pl.FName + ' ' + pl.LName) AS Senator,
                                                              pt.PartyName AS [Party],
                                                              st.StateName AS [State],
                                                              pl.Phone,
                                                              pl.Email,
                                                              pl.TermStart AS [Start Date]
                                                       FROM State AS [st]
                                                       INNER JOIN POLITICIANS AS [pl]
                                                           ON st.StateID = pl.StateID
                                                       INNER JOIN Party AS [pt]
                                                           ON pl.PartyID = pt.PartyID
                                                       ORDER BY st.StateName ASC", con);
                    da = new SqlDataAdapter(cmd);
                }
                else if (stateDrop.SelectedValue != "0" && senatorDrop.SelectedValue == "0")
                {
                    SqlCommand cmd = new SqlCommand(@"SELECT (pl.FName + ' ' + pl.LName) AS Senator,
                                                              pt.PartyName AS [Party],
                                                              st.StateName AS [State],
                                                              pl.Phone,
                                                              pl.Email,
                                                              pl.TermStart AS [Start Date]
                                                       FROM State AS [st]
                                                       INNER JOIN POLITICIANS AS [pl]
                                                           ON st.StateID = pl.StateID
                                                       INNER JOIN Party AS [pt]
                                                           ON pl.PartyID = pt.PartyID
                                                       WHERE pl.StateID = @State
                                                       ORDER BY st.StateName ASC", con);
                    cmd.Parameters.AddWithValue("@State", stateDrop.SelectedValue);
                    da = new SqlDataAdapter(cmd);
                }
                else
                {
                    SqlCommand cmd = new SqlCommand(@"SELECT (pl.FName + ' ' + pl.LName) AS Senator,
                                                              pt.PartyName AS [Party],
                                                              st.StateName AS [State],
                                                              pl.Phone,
                                                              pl.Email,
                                                              pl.TermStart AS [Start Date]
                                                       FROM State AS [st]
                                                       INNER JOIN POLITICIANS AS [pl]
                                                           ON st.StateID = pl.StateID
                                                       INNER JOIN Party AS [pt]
                                                           ON pl.PartyID = pt.PartyID
                                                       WHERE (pl.FName + ' ' + pl.LName) = @Sen
                                                       ORDER BY st.StateName ASC", con);
                    cmd.Parameters.AddWithValue("@Sen", senatorDrop.SelectedValue);
                    da = new SqlDataAdapter(cmd);
                }


                DataSet ds = new DataSet("MyDS");
                //opening connection, filling dataset, closing connection
                da.Fill(ds);

                //binding datasource to GridView
                polGridView.DataSource = ds;
                polGridView.DataBind();
            }
        }
        protected void polData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            polGridView.PageIndex = e.NewPageIndex;
            LoadGridData();
        }

        protected void Update_Sen_Drop()
        {
            LoadSenDropDown();
        }

        protected void Update_Grid()
        {

        }
    }
}