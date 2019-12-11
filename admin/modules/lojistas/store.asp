<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../../../config/config.asp"-->
<!--#include file="../../auth/auth.asp"-->
<!-- #include file="../../../config/functions/md5.asp" -->
<%
    Dim fileUpload
    Set fileUpload = Server.CreateObject("SoftArtisans.FileUp") 
    error          = false
    action         = "?action="

    razao_social     = fileUpload.Form("razao_social")
    nome_responsavel = fileUpload.Form("nome_responsavel")
    email            = fileUpload.Form("email")
    senha            = fileUpload.Form("senha")
    confirmarSenha   = fileUpload.Form("confirmar_senha")
    contato          = fileUpload.Form("contato")
    logotipo         = ""

    SQL = "SELECT id FROM usuarios WHERE email = '"&email&"';"
    Set emailUnique = getSQL(SQL)

    IF emailUnique.EOF Then

        If senha = confirmarSenha Then

            fileUpload.Path = Server.MapPath("..\..\uploads\logotipo\")

            If IsObject(fileUpload.Form("logotipo")) AND Not fileUpload.Form("logotipo").IsEmpty Then    
                fileNameArray = Split(fileUpload.UserFilename, ".")
                ext           = fileNameArray(UBound(fileNameArray))

                if ext = "jpg" OR ext = "png" OR ext = "gif" Then
                    logotipo = geraNomeArquivo(ext)
                    fileUpload.SaveAs(Server.MapPath("..\..\uploads\logotipo\"&logotipo))
                End if
            End If
            
            '----- Dereference FileUp
            Set fileUpload = Nothing

            SQL = "INSERT INTO usuarios (razao_social, nome_responsavel, email, senha, celular, logotipo) "&_
                "VALUES "&_
                "('"&razao_social&"', "&_
                "'"&nome_responsavel&"', "&_
                "'"&email&"', "&_
                "'"&md5(senha)&"', "&_
                "'"&contato&"', "&_
                "'"&logotipo&"');"
            
            execSQL( SQL )
            action = action & "success"
            
        Else
            error = true
            action = action & "invalid_password"
        End if
    Else
        error = true
        action = action & "email_already"
    End If

    if Not error then
        Session.Contents.Remove("razao_social")
        Session.Contents.Remove("nome_responsavel")
        Session.Contents.Remove("email")
        Session.Contents.Remove("contato")
        Response.Redirect("./"&action)
    else
        Session("razao_social") = razao_social
        Session("nome_responsavel") = nome_responsavel
        Session("email") = email
        Session("contato") = contato
        response.redirect("./create.asp"&action)
    end if
%>