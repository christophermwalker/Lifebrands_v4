using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Lifebrands_v4
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            con.Open();

            /* 
              Just as reference
             
              Email: varchar
              Password: text
            */


            SqlCommand cmd = new SqlCommand("SELECT * FROM aspnetusers WHERE Email = @Email AND PasswordHash = @PasswordHash", con);

            cmd.Parameters.AddWithValue("@Email", TextBox1.Text);
            cmd.Parameters.AddWithValue("@PasswordHash", TextBox2.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt); 
            /* Error here referencing above SqlDataAdapter da = new SqlDataAdapter(cmd) 
            which references the Select Statement) */

            if (dt.Rows[0][0].ToString() == "1")
               /*  
                Tried this code below too.
                 
               if (dt.Rows.Count > 0) 
               */

            {
                Response.Redirect("Dashboard.aspx");
            }

            else

            {
                Label1.Visible = true;
                Label1.Text = "Wrong username and/or password!";
            }
        }
    }
}