using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
           
            Double latitude = Convert.ToDouble(lat.Value);
            Double longitude = Convert.ToDouble(lng.Value);

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["StoreLocationsConnectionString"].ConnectionString;

            string query1 = "insert into Courses(longi,lati) values (@lati, @longi)";

            SqlCommand cmd1 = new SqlCommand(query1, con);
            cmd1.Parameters.AddWithValue("@lati", latitude);
            cmd1.Parameters.AddWithValue("@longi", longitude);

            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();

        }
    }
}