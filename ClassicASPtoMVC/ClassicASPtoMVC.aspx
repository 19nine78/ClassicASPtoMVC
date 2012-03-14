<%@ Page Language="C#"%>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%

    //Define a connection string
    string connStr = @"Server=.\SQLExpress;AttachDbFilename=|DataDirectory|ClassicASPtoMVC.mdf;Database=ClassicASPtoMVC;Trusted_Connection=Yes;";
    
    //Set up our SQL Statement
    string sql = @"SELECT id, FirstName, Surname, Town FROM Users";

    // Create and open a Database Connection
    SqlConnection conn = new SqlConnection();
    conn.ConnectionString = connStr;
    conn.Open();

    //Create a command
    SqlCommand cmd = new SqlCommand(sql, conn);

    //Execure the command into a DataReader (recordset)
    SqlDataReader results = cmd.ExecuteReader();
 
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
    
    <div>
    <%if (results.HasRows)
      { %>
      <table>
        <tr>
            <th>First Name</th>
            <th>Surname</th>
            <th>Town</th>
        </tr>
        <%while(results.Read()){ %>
        <tr>
            <td><%=results["FirstName"]%></td>
            <td><%=results["Surname"]%></td>
            <td><%=results["Town"]%></td>
        </tr>
        <%} %>

      </table>


    <%} %>
    </div>

</body>
</html>
