<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html>
<html lang="pt-br">
<!-- #include file = "../inc/head.asp" -->
<body class="d-flex align-items-center" style="min-height: 100vh;">
<%
    action = Request("action")
%>
    <div class="container">
        <div class="row">
            <div class="col">
                <%
                    If Not isNullOrEmpty( action ) AND action = "error_invalid" Then
                        Call messageError("Usuário e/ou senha inválidos.")
                    ElseIf Not isNullOrEmpty( action ) AND action = "error_permission" Then
                        Call messageError("Você não tem permissão de acessar essa área.")
                    End If
                %>
                <div class="card">
                    <div class="card-header text-center">
                        <%=tituloAdmin%>
                    </div>
                    <div class="card-body">
                        <div class="col-6 m-auto text-center">
                        <form class="p-3" method="POST" action="verify.asp?type=0">
                            <div class="form-group text-left py-3">
                                <label for="email">Endereço de e-mail: </label>
                                <input type="text" class="form-control" id="email" name="email" autofocus required>
                            </div>
                            <div class="form-group text-left py-3">
                                <label for="senha">Senha: </label>
                                <input type="password" class="form-control" id="senha" name="senha" required>
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
