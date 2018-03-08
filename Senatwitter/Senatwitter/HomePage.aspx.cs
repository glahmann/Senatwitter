using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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