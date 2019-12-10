<!--#include file="../../config/config.asp"-->
<%
	accessDenied					= False
	Response.Cookies( "CK_PAGE" )	= ""
	pagina							= url_lojista

	PaginaAtual		= Request.ServerVariables( "SCRIPT_NAME" )
	aPaginaAtual 	= Split(PaginaAtual, "/")
	PaginaAtual		= LCase( aPaginaAtual( UBound( aPaginaAtual ) ) )
	
	If PaginaAtual = "default.asp" Then PaginaAtual = ""

	If aPaginaAtual( uBound(aPaginaAtual) - 1 ) <> "auth" Then
		Response.Cookies("CK_PAGE") = url_lojista & PaginaAtual

		usuarioId    = Session("S_USUARIOID") 
		usuarioTipo  = Session("S_USUARIOTIPO") 
		usuarioEmail = Session("S_USUARIOEMAIL")
		usuarioNome  = Session("S_USUARIONOME")
		
		If usuarioId = "" OR Not IsNumeric(usuarioId) Then usuarioId = 0
		'If usuarioTipo = "" OR Not IsNumeric(usuarioTipo) Then usuarioTipo = 0

		SQL = 	"SELECT COUNT( * ) AS total "&_
				"FROM usuarios "&_
				"WHERE id = "&usuarioId&" AND email = '"&usuarioEmail&"';"

		Set query = getSQL(SQL)

		If CInt(query("total")) = 0 Then accessDenied = True

		If accessDenied Then Response.Redirect("//" & url_lojista & "auth/")
	End If
%>