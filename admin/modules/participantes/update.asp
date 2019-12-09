<%
Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8"
%>
<!--#include file="../../../config/config.asp"-->
<!--#include file="../../auth/auth.asp"-->
<%
    ingresso      = Request.Form("ingresso")
    nome          = Request.Form("nome")
    sobrenome     = Request.Form("sobrenome")
    tipo_ingresso = Request.Form("tipo_ingresso")
    email         = Request.Form("email")
    contato       = Request.Form("contato")
    data_evento   = Request.Form("data_evento")
    fase_evento   = Request.Form("fase_evento")

    SQL = "UPDATE participantes SET nome = '"&nome&"', sobrenome = '"&sobrenome&"', tipo_ingresso = '"&tipo_ingresso&"', email = '"&email&"', telefone = '"&contato&"', data_evento = '"&data_evento&"', fase_evento = '"&fase_evento&"'  WHERE ingresso = '"&ingresso&"';"
    execSQL(SQL)

    Response.Redirect("edit.asp?id="&id&"")
%>