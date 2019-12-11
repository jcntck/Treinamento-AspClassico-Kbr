<!--#include file="../../../config/config.asp"-->
<!--#include file="../../auth/auth.asp"-->
<!-- #include file="../../../config/functions/md5.asp" -->
<%
    Dim fileUpload
    Set fileUpload = Server.CreateObject("SoftArtisans.FileUp") 

    id               = fileUpload.Form("id")
    razao_social     = limpa(fileUpload.Form("razao_social"))
    nome_responsavel = limpa(fileUpload.Form("nome_responsavel"))
    email            = fileUpload.Form("email")
    senha            = fileUpload.Form("senha")
    contato          = limpa(fileUpload.Form("contato"))
    logotipo         = fileUpload.Form("logotipo_antigo")

    fileUpload.Path = Server.MapPath("..\..\uploads\logotipo\")

    SQL = "SELECT id FROM usuarios WHERE email = '"&email&"' AND id <> "&id&";"
    Set emailUnique = getSQL(SQL)

    IF emailUnique.EOF Then
        If IsObject(fileUpload.Form("logotipo")) AND Not fileUpload.Form("logotipo").IsEmpty Then
            
            fileNameArray = Split(fileUpload.UserFilename, ".")
            ext           = fileNameArray(UBound(fileNameArray))

            If  logotipo <> "" Then
                fileUpload.Delete Server.MapPath("..\..\uploads\logotipo\"&logotipo)
            End If

            logotipo = geraNomeArquivo(ext)
            fileUpload.SaveAs(Server.MapPath("..\..\uploads\logotipo\"&logotipo))
            
        End If


        If senha <> "" Then
            senha = md5(senha)
            SQL = "UPDATE usuarios SET razao_social = '"&razao_social&"', nome_responsavel = '"&nome_responsavel&"', email = '"&email&"', senha = '"&senha&"', celular = '"&contato&"', logotipo = '"&logotipo&"' WHERE id = "&id&";"
            execSQL(SQL)
        Else
            SQL = "UPDATE usuarios SET razao_social = '"&razao_social&"', nome_responsavel = '"&nome_responsavel&"', email = '"&email&"', celular = '"&contato&"', logotipo = '"&logotipo&"' WHERE id = "&id&";"
            execSQL(SQL)
        End If
    End If

    Response.Redirect("edit.asp?id="&id&"")
%>