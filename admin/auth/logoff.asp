<!-- #include file = "../../config/config.asp" -->
<%
    Session.Contents.RemoveAll()
    Response.Cookies("CK_PAGE")         = ""

    Response.Redirect("//" & url_admin)
%>