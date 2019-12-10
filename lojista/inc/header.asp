<!-- #include file="../auth/auth.asp" -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="//<%=url_lojista%>">NaMosca - Eventos</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Alterna navegação">
            <span class="navbar-toggler-icon"></span>
        </button>
        <% If Session("S_USUARIOID") <> "" Then %>
        <div class="collapse navbar-collapse d-flex flex-row-reverse" id="navbarNavAltMarkup">
             <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <%
                        If CInt(Session("S_USUARIOTIPO")) = 0 Then
                            Response.write("Olá, Admin")
                        Else
                            Response.write("Olá, "&Session("S_USUARIONOME"))
                        End If
                    %>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="//<%=url_lojista%>">Home</a>
                        <a class="dropdown-item" href="//<%=url_auth%>logoff.asp?type=1">Sair</a>
                    </div>
                </li>
            </ul>
        </div>
        <%End if%>
    </div>
</nav>