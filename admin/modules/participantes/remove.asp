<!--#include file="../../../config/config.asp"-->
<!--#include file="../../auth/auth.asp"-->
<%

    ingresso = Request.queryString("ingresso")
    
    SQL = "DELETE FROM participantes WHERE ingresso = '"&ingresso&"';"
    execSQL(SQL)

    Response.Redirect("./")
%>