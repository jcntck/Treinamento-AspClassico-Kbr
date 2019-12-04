<!--#include file="../../../config/config.asp"-->
<!--#include file="../../auth/auth.asp"-->
<%
    Dim fileUpload
    Set fileUpload = Server.CreateObject("SoftArtisans.FileUp") 

    id = Request.queryString("id")

    lojista = getByIdSQL("usuarios", id)
    logotipo = lojista(UBound(lojista) - 1)
    
    If logotipo <> "" Then
        fileUpload.Delete Server.MapPath("..\..\uploads\logotipo\"&logotipo)
    End If

    SQL = "DELETE FROM usuarios WHERE id = "&id&";"
    execSQL(SQL)

    Response.Redirect("./")
%>