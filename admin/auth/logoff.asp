<!-- #include file = "../../config/config.asp" -->
<%
    Response.Cookies("CK_USUARIOID")    = ""
    Response.Cookies("CK_USUARIOTIPO")  = ""
    Response.Cookies("CK_USUARIOEMAIL") = ""
    Response.Cookies("CK_USUARIONOME")  = ""
    Response.Cookies("CK_PAGE")         = ""

    Response.Redirect("//" & url_admin)
%>