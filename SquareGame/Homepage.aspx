<%@ Page Language="C#" %>
<!DOCTYPE html> 
<script runat="server">
        protected void cmdLink_StartClick(object sender, EventArgs e)
  {
    Response.Redirect("Start.html");
  }
        protected void cmdLink_ScoreboardClick(object sender, EventArgs e)
  {
    Response.Redirect("Scoreboard.aspx");
  }
</script> 
<html> 
<head runat="server"> 
    <title>Squares</title> 
    <style>
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
.heading {
  color: darkslategrey;
  text-align: center;
  font-size: 80px;
  font-family:'Comic Sans MS'
}
</style>
</head> 
<body runat="server"> 
    <h1 class="heading">Squares</h1>
  <div style="text-align:center;line-height:6">
    <form runat="server">
       <asp:Button ID="Startbtn" CssClass="button" runat="server" Text="Start" OnClick="cmdLink_StartClick"></asp:Button><br />
       <asp:Button ID="Scorboardbtn" CssClass="button" runat="server" Text="Scoreboard" OnClick="cmdLink_ScoreboardClick"></asp:Button>
    </form> 
  </div>
</body> 
</html>  