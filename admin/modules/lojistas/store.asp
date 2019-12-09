<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../../../config/config.asp"-->
<!--#include file="../../auth/auth.asp"-->
<!-- #include file="../../../config/functions/md5.asp" -->
<%
    Dim fileUpload
    Set fileUpload = Server.CreateObject("SoftArtisans.FileUp") 

    razao_social     = fileUpload.Form("razao_social")
    nome_responsavel = fileUpload.Form("nome_responsavel")
    email            = fileUpload.Form("email")
    senha            = md5(fileUpload.Form("senha"))
    contato          = fileUpload.Form("contato")
    logotipo         = ""

    fileUpload.Path = Server.MapPath("..\..\uploads\logotipo\")

    If IsObject(fileUpload.Form("logotipo")) AND Not fileUpload.Form("logotipo").IsEmpty Then    
        fileNameArray = Split(fileUpload.UserFilename, ".")
        ext           = fileNameArray(UBound(fileNameArray))

        logotipo = geraNomeArquivo(ext)
        fileUpload.SaveAs(Server.MapPath("..\..\uploads\logotipo\"&logotipo))
    End If
    
    '----- Dereference FileUp
    Set fileUpload = Nothing

    SQL = "INSERT INTO usuarios (razao_social, nome_responsavel, email, senha, celular, logotipo) "&_
          "VALUES "&_
          "('"&razao_social&"', "&_
          "'"&nome_responsavel&"', "&_
          "'"&email&"', "&_
          "'"&senha&"', "&_
          "'"&contato&"', "&_
          "'"&logotipo&"');"
    
    execSQL( SQL )

    Response.Redirect("./")
%>
