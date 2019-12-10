<!DOCTYPE html>
<html lang="pt-br">
<!-- #include file = "inc/head.asp" -->
<body>
<!-- #include file = "inc/header.asp" -->
<main class="container d-flex align-items-center justify-content-center" style="height: 85vh">
    <div class="row">
        <div class="col text-center">
            <h1>INSTRUÇÕES</h1>
            <p>Cole os códigos, um por linha. Após isso, clique em enviar.</p>
            <form action="carregarCodigo.asp" method="POST">
                <div class="form-group col-8 m-auto">
                    <textarea name="codigos" id="codigos" class="form-control" rows="6"></textarea>
                </div>
                <button type="submit" class="btn btn-info px-4 my-3">Enviar</button>
            </form>
            <p class="mt-5">Ou se preferir, <a href="csv.asp" >carregue um arquivo CSV</a></p>
        </div>
    </div>
</main>
<!-- #include file="inc/footer.asp" -->
</body>
</html>