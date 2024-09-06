using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace masterpage1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Who"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void postbtn_Click(object sender, EventArgs e)
        {
            if (PostArt.HasFile)
            {
                string str = PostArt.FileName;
                PostArt.PostedFile.SaveAs(Server.MapPath("Artwork/" + str));
                string imgpath = "Artwork/" + str.ToString();

                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into Art (Art_Name, Description, Stock, Art_Price, Image, Artist_ID) values(@Art_Name,@Description,@Stock,@Art_Price,@Image,@Artist_ID)", conn);
                cmd.Parameters.AddWithValue("@Art_Name", nametxt.Text);
                cmd.Parameters.AddWithValue("@Description", desctxt.Text);
                cmd.Parameters.AddWithValue("@Stock", stocktxt.Text);
                cmd.Parameters.AddWithValue("@Art_Price", pricetxt.Text);
                cmd.Parameters.AddWithValue("@Image", imgpath);
                cmd.Parameters.AddWithValue("@Artist_ID", Session["ARTISTID"]);
                cmd.ExecuteNonQuery();
                conn.Close();
                LabMsg.Text = "Post Succesfully...";
                LabMsg.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                LabMsg.Text = "Failed to Upload.....";
                LabMsg.ForeColor = System.Drawing.Color.Red;
            }
        }


    }
}