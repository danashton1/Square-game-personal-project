<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.OleDb" %>
<!DOCTYPE html>
<script runat="server">
    void Page_Load(){
        if (!this.IsPostBack)
        {
            String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
                        "Data Source=" + Server.MapPath("Scoreboard.accdb") + ";";
            OleDbConnection cn = new OleDbConnection(cs);
            OleDbCommand cmd;
            OleDbDataReader r;
            String i;
            string score1 = Request.QueryString["currentscore"];
            String sql;

            if (score1 != null)
            {
                sql = "INSERT INTO [Scores] " +
                      "(Score) VALUES" + "(" + score1 + ")";
                cmd = new OleDbCommand(sql, cn);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
            cmd = new OleDbCommand("SELECT * FROM Scores ORDER BY `Score` + 0 DESC", cn);
            cn.Open();
            r = cmd.ExecuteReader();

            i = "";

            while (r.Read())
            {

                i = i + r["Score"];
                if (score1 == r["Score"].ToString())
                {
                    i = i + "<-----";
                }
                i = i + "<br />";
            }
            cn.Close();
            parScore.InnerHtml = i;
        }
    }
    protected void cmdLink_Click(object sender, EventArgs e)
    {
        Response.Redirect("Homepage.aspx");
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml" runat="server">
<head runat="server">
    <title runat="server"></title>
    <style runat="server">
        #gamespace1 {
            position: absolute;
            top: 10%;
            right: 10%;
            bottom: 10%;
            left: 10%;
            border: 10px groove brown;
            background-color: sandybrown;
            width: 80%;
            height: 80%;
        }
        .button {
            padding: 15px 25px;
            font-size: 24px;
            text-align: center;
            cursor: pointer;
            outline: none;
            color: lightgreen;
            background-color: green;
            border: none;
            border-radius: 15px;
            box-shadow: 0 9px;
        }
        .button:hover {
            background-color: forestgreen
        }
        .button:active {
            background-color: forestgreen;
            box-shadow: 0 5px;
            transform: translateY(4px);
        }
        .column {
            float: left;
            width: 50%;
        }
        .row:after {
            content: "";
            display: table;
            clear: both;
        }
    </style>
</head>
<body runat="server">
    <div runat="server" id="gamespace1" class="gamespace" style="width: 80%; text-align:center; line-height:2">
       <div class="row">
          <div class="column"><p runat="server" id="parData" class="firstClass">1st<br />2nd<br />3rd<br />4th<br />5th<br />
              6th<br />7th<br />8th<br />9th<br />10th<br />
                              </p></div>
          <div class="column"><p runat="server" id="parScore" class="secondClass"></p></div>
       </div>
  <form runat="server">
    <asp:Button ID="Homepagebtn" CssClass="button" runat="server" Text="Homepage" OnClick="cmdLink_Click"></asp:Button>
  </form>     
    </div>
    
</body>
</html>