<!-- #include file = "../config/config.asp" -->
<%
    Session.Contents.RemoveAll()
    Response.Cookies("CK_PAGE")         = ""
    tipo = Request.QueryString("type")

    if CInt(tipo) = 0 Then
        Response.Redirect("//" & url_admin)
    Else
        Response.Redirect("//" & url_lojista)
    End if
%>