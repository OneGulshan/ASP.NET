using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Newtonsoft.Json;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{
    readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    [WebMethod]
    public void InsertData(string A, string B, int C, int D, int E)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("sp_Emp", con)
        {
            CommandType = CommandType.StoredProcedure
        };
        cmd.Parameters.AddWithValue("@mode", 1);
        cmd.Parameters.AddWithValue("@name", A);
        cmd.Parameters.AddWithValue("@address", B);
        cmd.Parameters.AddWithValue("@age", C);
        cmd.Parameters.AddWithValue("@country", D);
        cmd.Parameters.AddWithValue("@state", E);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    [WebMethod]
    public void UpdateData(int ID, string A, string B, int C, int D, int E)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("sp_Emp", con)
        {
            CommandType = CommandType.StoredProcedure
        };
        cmd.Parameters.AddWithValue("@mode", 5);
        cmd.Parameters.AddWithValue("@id", ID);
        cmd.Parameters.AddWithValue("@name", A);
        cmd.Parameters.AddWithValue("@address", B);
        cmd.Parameters.AddWithValue("@age", C);
        cmd.Parameters.AddWithValue("@country", D);
        cmd.Parameters.AddWithValue("@state", E);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    [WebMethod]
    public void Delete(int A)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("sp_Emp", con)
        {
            CommandType = CommandType.StoredProcedure
        };
        cmd.Parameters.AddWithValue("@mode", 3);
        cmd.Parameters.AddWithValue("@id", A);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    [WebMethod]
    public string GetAllData()
    {
        SqlCommand cmd = new SqlCommand("sp_Emp", con)
        {
            CommandType = CommandType.StoredProcedure
        };
        cmd.Parameters.AddWithValue("@mode", 2);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        string pp = JsonConvert.SerializeObject(dt);
        return pp;
    }

    [WebMethod]
    public string Edit(int A)
    {
        SqlCommand cmd = new SqlCommand("sp_Emp", con)
        {
            CommandType = CommandType.StoredProcedure
        };
        cmd.Parameters.AddWithValue("@mode", 4);
        cmd.Parameters.AddWithValue("@id", A);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        string pp = JsonConvert.SerializeObject(dt);
        return pp;
    }

    [WebMethod]
    public string Country()
    {
        SqlCommand cmd = new SqlCommand("sp_Country", con)
        {
            CommandType = CommandType.StoredProcedure
        };
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        string pp = JsonConvert.SerializeObject(dt);
        return pp;
    }

    [WebMethod]
    public string State(int A)
    {
        SqlCommand cmd = new SqlCommand("sp_State", con)
        {
            CommandType = CommandType.StoredProcedure
        };
        cmd.Parameters.AddWithValue("@cid", A);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        string pp = JsonConvert.SerializeObject(dt);
        return pp;
    }
}

