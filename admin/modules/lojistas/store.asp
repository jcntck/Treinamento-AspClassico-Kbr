<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../../../config/config.asp"-->
<!--#include file="../../auth/auth.asp"-->
<!-- #include file="../../../config/functions/md5.asp" -->
<%
    razao_social     = Request.Form("razao_social")
    nome_responsavel = Request.Form("nome_responsavel")
    email            = Request.Form("email")
    senha            = md5(Request.Form("senha"))
    contato          = Request.Form("contato")

    SQL = "INSERT INTO usuarios (razao_social, nome_responsavel, email, senha, celular) "&_
          "VALUES "&_
          "('"&razao_social&"', "&_
          "'"&nome_responsavel&"', "&_
          "'"&email&"', "&_
          "'"&senha&"', "&_
          "'"&contato&"');"
    
    execSQL( SQL )

    Response.Redirect("default.asp")
%>