<!DOCTYPE html>
<html lang="pt-br">

<!-- #include file="lojista/inc/head.asp" -->

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="//<%=url_lojista%>">NaMosca - Eventos</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Alterna navegação">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-flex flex-row-reverse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
            <a class="nav-item nav-link" href="//<%=url_lojista%>auth/">Login</a>
            </div>
        </div>
    </div>
    </nav>

    <section class="d-flex justify-content-center containermy-4" style="height: 80vh;">
        <div class="align-self-center text-center">
            <h1 class="my-4">Bem vindo!</h1>
            <p class="my-4">Acesse sua conta para poder utilizar as funções do site.</p>
            <a role="button" class="btn btn-dark text-light btn-lg my-4" href="//<%=url_lojista%>auth/">Acessar conta</a>
        </div>
    </section>

    
    <!-- #include file="lojista/inc/footer.asp" -->
</body>

</html>