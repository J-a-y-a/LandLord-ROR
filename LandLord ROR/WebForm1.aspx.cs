using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LandLord_ROR
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
      
        protected void Button1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ModalScript", "openModal();", true);
            ////// Bind the grid with data
            ////grid.DataSource = GetData();
            ////grid.DataBind();

            //// Show the popup
            //string script = "<script type='text/javascript'>"
            //              + "window.open('Popup.aspx','Popup','height=500,width=500');"
            //              + "</script>";
            //ClientScript.RegisterStartupScript(this.GetType(), "Popup", script);
        }
        //protected void ShowPopup(object sender, EventArgs e)
        //{
        //    string title = "Greetings";
        //    string body = "Welcome to ASPSnippets.com";
        //    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        //}
        //protected void btnOpenModal_Click(object sender, EventArgs e)
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ModalScript", "openModal();", true);
        //}


    }
}