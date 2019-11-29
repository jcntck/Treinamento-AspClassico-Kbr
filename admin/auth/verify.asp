<!--#include file="../../config/config.asp"-->
<%
    accessDenied                = True
    Response.Cookies("CK_PAGE") = ""
    error                       = "?action=error"

    user_type = Request.QueryString("type")
    email     = Request.Form("email")
    senha     = Request.Form("senha")

    SQL = "SELECT * FROM usuarios "&_
          "WHERE email = '"&email&"' AND senha = '"&senha&"';"

    Set query = getSQL(SQL)

    If Not query.EOF Then
        If CInt(query("isLojista")) = 0 OR CInt(query("isLojista")) = CInt(user_type) Then
            Response.Cookies("CK_USUARIOID")    = query("id")
            Response.Cookies("CK_USUARIOTIPO")  = query("isLojista")
            Response.Cookies("CK_USUARIOEMAIL") = query("email")
            Response.Cookies("CK_USUARIONOME")  = canBeNull(query("nome_responsavel"))

            accessDenied = False
            page       = Request.Cookies("CK_PAGE")
            If page = "" Then page = url_admin
        Else
            error = error & "_permission"
        End If
    Else
        error = error & "_invalid"
    End If
    
    Set query = Nothing

    If accessDenied Then
        Response.Redirect("default.asp" & error)
    Else
        Response.Redirect("//" & page)
    End If
%>