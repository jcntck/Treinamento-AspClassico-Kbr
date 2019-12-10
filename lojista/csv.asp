<!DOCTYPE html>
<html lang="pt-br">
<!-- #include file = "inc/head.asp" -->
<body>
<!-- #include file = "inc/header.asp" -->
<main class="container d-flex align-items-center justify-content-center" style="height: 85vh">
    <div class="row">
        <div class="col-10 m-auto text-center">
            <h1>INSTRUÇÕES</h1>
            <p>Carregue o arquivo que foi gerado a partir do APP (em CSV) e em seguida será apresentada a listagem dos respectivos contatos.</p>
            <form action="carregarCsv.asp" method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="csvFile" id="csvLabel" class="btn btn-outline-info">Selecione o arquivo (apenas CSV)</label>
                    <input type="file" name="csvFile" id="csvFile" accept=".csv" class="d-none" onchange="mudarLabel('csvFile', 'csvLabel')">
                </div>
                <button type="submit" class="btn btn-info px-4 my-2">Enviar</button>
            </form>
            <p class="mt-5">Ou se preferir <a href="codigo.asp" >copie e cole os códigos</a></p>
        </div>
    </div>
</main>
<!-- #include file="inc/footer.asp" -->
<script>
    function mudarLabel(inputFile, labelFile, short = false) {
        let label = document.getElementById(labelFile)
        let file = document.getElementById(inputFile)
        
        if (short) label.innerHTML = file.value
        else label.innerHTML = "Arquivo selecionado: " + file.value
    }
</script>
</body>
</html>