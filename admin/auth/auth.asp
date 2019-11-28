<!--#include file="../../config/config.asp"-->
<%
	accessDenied					= False
	Response.Cookies( "CK_PAGE" )	= ""
	pagina							= url_admin

	PaginaAtual		= Request.ServerVariables( "SCRIPT_NAME" )
	aPaginaAtual	= Split( PaginaAtual , "/" )
    response.write("<br>" & aPaginaAtual)
	PaginaAtual		= LCase( aPaginaAtual( UBound( aPaginaAtual ) ) )

%>