using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace ASP
{
    public partial class Employee : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                JP();
                Grd();
                BindCountry();
                ddlstate.Enabled = false;
                ddlstate.Items.Insert(0, new ListItem("--Select--", "0"));
                ddlcity.Enabled = false;
                ddlcity.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        public void Clear()
        {
            txtname.Text = "";
            txtmob.Text = "";
            txtemail.Text = "";
            txtage.Text = "";
            ddlcountry.SelectedValue = "0";
            ddlstate.SelectedValue = "0";
            ddlstate.Enabled = false;
            ddlcity.SelectedValue = "0";
            ddlcity.Enabled = false;
            txtcomment.Text = "";
            rblgender.ClearSelection();
            ddljp.SelectedValue = "0";
            skl.Visible = false;
            cblskl.ClearSelection();
            img.ImageUrl = null;
            img.Visible = false;
            ViewState["prof"] = null;
            ViewState["id"] = null;
            btnins.Text = "Submit";
        }

        public void JP()
        {
            SqlCommand cmd = new SqlCommand("sp_JP", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddljp.DataValueField = "jpid";
            ddljp.DataTextField = "jpname";
            ddljp.DataSource = dt;
            ddljp.DataBind();
            ddljp.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void SKL()
        {
            SqlCommand cmd = new SqlCommand("sp_Skl", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@jpid", ddljp.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cblskl.DataValueField = "sid";
            cblskl.DataTextField = "sname";
            cblskl.DataSource = dt;
            cblskl.DataBind();
        }

        public void BindCountry()
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@mode", 8);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlcountry.DataValueField = "cntid";
            ddlcountry.DataTextField = "cntname";
            ddlcountry.DataSource = dt;
            ddlcountry.DataBind();
            ddlcountry.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindState()
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@mode", 9);
            cmd.Parameters.AddWithValue("@cntid", ddlcountry.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlstate.DataValueField = "sttid";
            ddlstate.DataTextField = "sttname";
            ddlstate.DataSource = dt;
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindCity()
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@mode", 10);
            cmd.Parameters.AddWithValue("@sttid", ddlstate.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlcity.DataValueField = "cid";
            ddlcity.DataTextField = "cname";
            ddlcity.DataSource = dt;
            ddlcity.DataBind();
            ddlcity.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        protected void Ddljp_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddljp.SelectedValue == "0")
            {
                skl.Visible = false;
            }
            else
            {
                skl.Visible = true;
                SKL();
            }
        }

        protected void Btnins_Click(object sender, EventArgs e)
        {
            string fe = System.IO.Path.GetExtension(fuimg.PostedFile.FileName);
            string skl = "";
            for (int i = 0; i < cblskl.Items.Count; i++)
            {
                if (cblskl.Items[i].Selected == true)
                {
                    skl += cblskl.Items[i].Text + ",";
                }
            }
            skl = skl.TrimEnd(',');

            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Emp", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@mobno", txtmob.Text);
            cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
            cmd.Parameters.AddWithValue("@jp", ddljp.SelectedValue);
            cmd.Parameters.AddWithValue("@skl", skl);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@password", txtpassword.Text);
            cmd.Parameters.AddWithValue("@age", txtage.Text);
            cmd.Parameters.AddWithValue("@country", ddlcountry.SelectedValue);
            cmd.Parameters.AddWithValue("@state", ddlstate.SelectedValue);
            cmd.Parameters.AddWithValue("@city", ddlcity.SelectedValue);
            cmd.Parameters.AddWithValue("@comment", txtcomment.Text);
            if (fe.ToString().ToLower() == ".jpg" || fe.ToString().ToLower() == ".jpeg" || fe.ToString().ToLower() == ".png")
            {
                string fn;
                if (btnins.Text == "Submit")
                {
                    fn = System.IO.Path.GetFileName(fuimg.PostedFile.FileName);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@mode", 1);
                    if (fn != "")
                    {
                        fn = DateTime.Now.Ticks.ToString() + fn;
                        fuimg.SaveAs(Server.MapPath("Profile" + "\\" + fn));
                        cmd.Parameters.AddWithValue("@prof", fn);
                        cmd.ExecuteNonQuery();
                        lblmsg.Text = "Your record has been saved sucessfully !!";
                    }
                    else
                    {
                        string profile = "Please Select Your Profile Image !!";
                        ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + profile + "');", true);
                    }
                }
                else if (btnins.Text == "Update")
                {
                    fn = System.IO.Path.GetFileName(fuimg.PostedFile.FileName);
                    cmd.Parameters.AddWithValue("@mode", 5);
                    cmd.Parameters.AddWithValue("@id", ViewState["id"]);
                    if (fn == "")
                    {
                        cmd.Parameters.AddWithValue("@prof", ViewState["prof"]);
                    }
                    else
                    {
                        fn = DateTime.Now.Ticks.ToString() + fn;
                        System.IO.File.Delete(Server.MapPath("Profile" + "\\" + ViewState["prof"]));
                        fuimg.SaveAs(Server.MapPath("Profile" + "\\" + fn));
                        cmd.Parameters.AddWithValue("@prof", fn);
                    }
                    cmd.ExecuteNonQuery();
                    lblmsg.Text = "Your record has been updated sucessfully !!";
                }
                con.Close();
                Grd();
                Clear();
            }
            else
            {
                lblmsg.Text = "Please upload only jpg,jpeg or png files !!";
            }
        }

        protected void Ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlstate.Enabled = true;
            BindState();
        }

        protected void Ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlcity.Enabled = true;
            BindCity();
        }

        public void Grd()
        {
            SqlCommand cmd = new SqlCommand("sp_Emp", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@mode", 2);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grd.DataSource = dt;
            grd.DataBind();
        }

        protected void Grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "D")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Emp", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@mode", 3);
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                System.IO.File.Delete(Server.MapPath("Profile" + "\\" + "@prof"));
                cmd.ExecuteNonQuery();
                con.Close();
                Grd();
                Clear();
            }

            else if (e.CommandName == "E")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Emp", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@mode", 4);
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txtname.Text = dt.Rows[0]["name"].ToString();
                rblgender.Text = dt.Rows[0]["gender"].ToString();
                txtmob.Text = dt.Rows[0]["mobno"].ToString();
                txtemail.Text = dt.Rows[0]["email"].ToString();
                txtpassword.Text = dt.Rows[0]["password"].ToString();
                txtage.Text = dt.Rows[0]["age"].ToString();
                ddlcountry.Text = dt.Rows[0]["country"].ToString();
                ddlstate.Enabled = true;
                BindState();
                ddlstate.Text = dt.Rows[0]["state"].ToString();
                ddlcity.Enabled = true;
                BindCity();
                ddlcity.Text = dt.Rows[0]["city"].ToString();
                txtcomment.Text = dt.Rows[0]["comment"].ToString();

                ddljp.SelectedValue = dt.Rows[0]["jp"].ToString();
                skl.Visible = true;
                SKL();
                string[] arr = dt.Rows[0]["skl"].ToString().Split(',');
                for (int i = 0; i < cblskl.Items.Count; i++)
                {
                    for (int j = 0; j < arr.Length; j++)
                    {
                        if (cblskl.Items[i].Text == arr[j])
                        {
                            cblskl.Items[i].Selected = true;
                        }
                    }
                }
                img.Visible = true;
                img.ImageUrl = "~/Profile" + "\\" + dt.Rows[0]["prof"].ToString();
                ViewState["prof"] = dt.Rows[0]["prof"].ToString();
                ViewState["id"] = e.CommandArgument;
                btnins.Text = "Update";
            }
        }
    }
}
