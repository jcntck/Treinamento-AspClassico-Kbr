<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../../../config/config.asp"-->
<!--#include file="../../auth/auth.asp"-->
<!-- #include file="../../../config/functions/md5.asp" -->
<%
    id               = Request.Form("id")
    razao_social     = Request.Form("razao_social")
    nome_responsavel = Request.Form("nome_responsavel")
    email            = Request.Form("email")
    senha            = Request.Form("senha")
    contato          = Request.Form("contato")

    SQL = "SELECT id FROM usuarios WHERE email = '"&email&"' AND id <> "&id&";"
    Set emailUnique = getSQL(SQL)

    IF emailUnique.EOF Then
        If senha <> "" Then
            senha = md5(senha)
            SQL = "UPDATE usuarios SET razao_social = '"&razao_social&"', nome_responsavel = '"&nome_responsavel&"', email = '"&email&"', senha = '"&senha&"', celular = '"&contato&"' WHERE id = "&id&";"
            execSQL(SQL)
        Else
            SQL = "UPDATE usuarios SET razao_social = '"&razao_social&"', nome_responsavel = '"&nome_responsavel&"', email = '"&email&"', celular = '"&contato&"' WHERE id = "&id&";"
            execSQL(SQL)
        End If
    End If

    Response.Redirect("edit.asp?id="&id&"")
%>