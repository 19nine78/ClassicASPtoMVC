<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>
<%if (ViewBag.results.HasRows)
      { %>
      <table>
        <tr>
            <th>First Name</th>
            <th>Surname</th>
            <th>Town</th>
        </tr>
        <%while (ViewBag.results.Read())
          { %>
        <tr>
            <td><%=ViewBag.results["FirstName"]%></td>
            <td><%=ViewBag.results["Surname"]%></td>
            <td><%=ViewBag.results["Town"]%></td>
        </tr>
        <%} %>

      </table>


    <%} %>
</asp:Content>
