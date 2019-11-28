<!DOCTYPE html>
<html lang="pt-br">
<!-- #include file = "../inc/head.asp" -->
<body class="d-flex align-items-center" style="min-height: 100vh;">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header text-center">
                        <%=tituloAdmin%>
                    </div>
                    <div class="card-body">
                        <div class="col-6 m-auto text-center">
                        <form class="p-3">
                            <div class="form-group text-left py-3">
                                <label for="login">Username: </label>
                                <input type="text" class="form-control" id="login" name="login" autofocus required>
                            </div>
                            <div class="form-group text-left py-3">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <button type="submit" class="btn btn-primary my-3">
                                <i class="fas fa-sign-in-alt"></i>
                                <span>Entrar</span></button>
                        </form>
                        </div>
                    </div>
                    <div class="card-footer text-center">
                        <a href="#" title="Voltar para o site principal">Voltar para o site</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>