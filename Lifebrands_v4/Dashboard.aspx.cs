﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Threading.Tasks;

namespace Lifebrands_v4
{
    public partial class Dashboard1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.Visible = false;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string eventname = TextBox1.Text;
            string eventdate = TextBox2.Text;
            string eventdesc = TextBox3.Text;
            string id = Guid.NewGuid().ToString();

            string idsale = Guid.NewGuid().ToString();
            string cost = DropDownList7.SelectedItem.Value;
            string squantity = TextBox4.Text;
            string pip = Guid.NewGuid().ToString();

            string aspid = Guid.NewGuid().ToString();

            SqlConnection conn = new SqlConnection(@"Data Source=tcp:lifebrand.database.windows.net,1433;Initial Catalog=Lifebrands_v2;Persist Security Info=False;User ID=lifebrand;Password=Passw0rd!;MultipleActiveResultSets=False;Connect Timeout=30;Encrypt=True;TrustServerCertificate=False");

            string sql = "insert into Event (IdEvent, Event_Name, Event_Date, Event_Description) values (@id, @eventname, @eventdate, @eventdesc)";

            // string getcost = "Insert into Sale (IdSale, Quantity, Cost, Event_IdEvent, Product_IdProduct) Values (@idsale, @squantity, @cost, @id, @pip)"; 

            string sql2 = "insert into Sale (IdSale, Quantity, Cost, Event_IdEvent, Product_IdProduct) values (@idsale, @squantity, @cost, @id, @pip)";

            string sql3 = "insert into Aspnetusers_Has_Event (aspnetusers_Id, Event_IdEvent) values (@aspid, @id)";

            try
            {
                conn.Open();

              /*  SqlCommand cmdcost = new SqlCommand(getcost, conn);
                cmdcost.Parameters.Add("@cost", SqlDbType.VarChar);
                cmdcost.Parameters["@cost"].Value = cost; 

                cmdcost.ExecuteNonQuery(); */


                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.Add("@id", SqlDbType.VarChar);
                cmd.Parameters["@id"].Value = id;

                cmd.Parameters.Add("@eventname", SqlDbType.VarChar);
                cmd.Parameters["@eventname"].Value = eventname;

                cmd.Parameters.Add("@eventdate", SqlDbType.VarChar);
                cmd.Parameters["@eventdate"].Value = eventdate;

                cmd.Parameters.Add("@eventdesc", SqlDbType.VarChar);
                cmd.Parameters["@eventdesc"].Value = eventdesc;

                cmd.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand(sql2, conn);

                cmd2.Parameters.Add("@idsale", SqlDbType.VarChar);
                cmd2.Parameters["@idsale"].Value = idsale;

                cmd2.Parameters.Add("@squantity", SqlDbType.VarChar);
                cmd2.Parameters["@squantity"].Value = squantity;

                cmd2.Parameters.Add("@cost", SqlDbType.VarChar);
                cmd2.Parameters["@cost"].Value = cost;

                cmd2.Parameters.Add("@id", SqlDbType.VarChar);
                cmd2.Parameters["@id"].Value = id;

                cmd2.Parameters.Add("@pip", SqlDbType.VarChar);
                cmd2.Parameters["@pip"].Value = pip;

                cmd2.ExecuteNonQuery();

                SqlCommand cmd3 = new SqlCommand(sql3, conn);

                cmd.Parameters.Add("@aspid", SqlDbType.VarChar);
                cmd.Parameters["@aspid"].Value = aspid;

                cmd.Parameters.Add("@id", SqlDbType.VarChar);
                cmd.Parameters["@id"].Value = id;
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
            }
            finally
            {
                conn.Close();
            }

                    
            Label1.Text = "success"; //result must be in string format otherwise convert it to string

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
            GridView1.Visible = true;
        }
    }
}