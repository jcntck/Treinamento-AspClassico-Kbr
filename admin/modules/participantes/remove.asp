<!--#include file="../../../config/config.asp"-->
<!--#include file="../../auth/auth.asp"-->
<%
    Dim postChecks
    postChecks = Request.Form("checks")

    arrayChecks = split(postChecks, "|")

    ingressos = ""
    for i=0 to UBound(arrayChecks)
        ingressos = ingressos & "'" & arrayChecks(i) & "',"
    next

    ingressos = Left(ingressos, CInt(Len(ingressos) - 1))
    
    SQL = "DELETE FROM participantes WHERE ingresso IN ("&ingressos&");"

    execSQL(SQL)

    response.write(true)
%>