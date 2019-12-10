<!--#include file="../config/config.asp"-->
<!-- #include file="../config/functions/md5.asp" -->
<%
    accessDenied                = True
    Response.Cookies("CK_PAGE") = ""
    error                       = "?action=error"

    user_type = Request.QueryString("type")
    email     = Request.Form("email")
    senha     = md5(Request.Form("senha"))

    SQL = "SELECT * FROM usuarios "&_
          "WHERE email = '"&email&"' AND senha = '"&senha&"';"

    Set query = getSQL(SQL)

    If Not query.EOF Then

        Session("S_USUARIOID")    = query("id")
        Session("S_USUARIOTIPO")  = query("isLojista")
        Session("S_USUARIOEMAIL") = query("email")
        Session("S_USUARIONOME")  = canBeNull(query("nome_responsavel"))
        Session.Timeout = 720

        If CInt(query("isLojista")) = 0 AND CInt(user_type) = 0 Then
            accessDenied = False
            page       = Request.Cookies("CK_PAGE")
            If page = "" Then page = url_admin End if
        ElseIf CInt(user_type) = 1 Then
            accessDenied = False
            page       = Request.Cookies("CK_PAGE")
            If page = "" Then page = url_lojista End If
        Else
            error = error & "_permission"
        End If
    Else
        error = error & "_invalid"
    End If
    
    Set query = Nothing

    If accessDenied Then
        If user_type = 0 Then Response.Redirect("//"&url_admin&"auth/"& error)
        If user_type = 1 Then Response.Redirect("//"&url_lojista&"auth/"& error)
    Else
        Response.Redirect("//" & page)
    End If
%>