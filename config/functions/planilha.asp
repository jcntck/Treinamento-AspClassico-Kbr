<!-- #include file="../config.asp" -->
<%
    Response.AddHeader "Content-disposition", "attachment; filename=participantes.xls"
    Response.ContentType = "application/vnd.ms-excel"

    values = request.querystring("values")
    SQL = "SELECT * FROM participantes WHERE ingresso in ("&values&");"
    Set query = getSQL(SQL)

%>
<table>
<tr style="background-color: #ffff99">
    <th>Num. ingresso</th>
    <th>Nome</th>
    <th>Sobrenome</th>
    <th>Tipo ingresso</th>
    <th>E-mail</th>
    <th>Telefone</th>
    <th>Data festa</th>
    <th>Status planejamento</th>
</tr>

<%while not query.eof%>
<tr>
    <%For i=0 to query.fields.count - 1 %>
    <td valign=top><%= query(i) %></td>
    <%next%>
</tr>
<%query.MoveNext
wend%>

</table>