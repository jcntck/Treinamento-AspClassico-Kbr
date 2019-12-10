<%
    url_site = Request.ServerVariables( "SERVER_NAME" ) & "/joao/aspclassico/"
    url_config = url_site & "config/"
    url_admin = url_site & "admin/"
    url_lojista = url_site & "lojista/"
    url_auth = url_site & "auth/"

    upload_lojista = url_admin & "modules/lojistas/uploads/"
%>