<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<html lang="pt-br">
<!-- #include file = "../../inc/head.asp" -->
<body>
<!-- Page Wrapper -->
    <div id="wrapper">
        <!-- #include file = "../../inc/header.asp" -->
         <!-- Content Wrapper -->
        <div id="content-wrapper">
            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 my-4 text-gray-800">Lojistas</h1>
                    <p>Está é a área de cadastro de Lojistas. Aqui é onde você adicionará todos os anunciantes de seu evento.</p>
                    
                    <%
                        action = Request("action")
                        If Not isNullOrEmpty( action ) AND action = "invalid_password" Then
                            Call messageError("Senhas não correspondem.")
                        Elseif Not isNullOrEmpty( action ) AND action = "email_already" Then
                            Call messageError("E-mail já cadastrado")
                        End If
                    %>

                    <div class="card shadow mb-4">

                        <div class="card-header d-flex justify-content-between">
                            <h6 class="m-0 font-weight-bold align-self-center">Formulário de cadastro:</h6>
                            <a class="btn btn-primary align-self-center" href="default.asp" role="button">
                                <i class="fas fa-arrow-left"></i>
                                <span>Voltar</span>    
                            </a>
                        </div>    

                        <div class="card-body">
                            
                            <form method="post" action="store.asp" name="formLojista" id="formLojista" enctype="multipart/form-data">

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="razao_social">Razão Social: </label>
                                        <input type="text" class="form-control" name="razao_social" id="razao_social" placeholder="Razão Social da Empresa" data-error=".errorRazaoSocial" maxlength="255" required autofocus value="<%= Session("razao_social") %>">
                                        <div class="errorRazaoSocial"></div>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="nome_responsavel">Nome Responsável: </label>
                                        <input type="text" class="form-control" name="nome_responsavel" id="nome_responsavel" placeholder="Nome responsável pela Empresa" data-error=".errorNomeResponsavel" maxlength="255" required value="<%= Session("nome_responsavel") %>">
                                        <div class="errorNomeResponsavel"></div>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="email">Endereço de e-mail: </label>
                                        <input type="email" class="form-control" name="email" id="email" placeholder="Endereço de e-email da Empresa" aria-describedby="emailHelp" data-error=".errorEmail" maxlength="255" required value="<% If Not isNullOrEmpty( action ) AND action = "email_already" Then Session("email") End If %>">
                                        <small id="emailHelp" class="form-text text-muted">Será utilizado para entrar no sistema.</small>
                                        <div class="errorEmail"></div>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="senha">Senha: </label>
                                        <input type="password" class="form-control" name="senha" id="senha" placeholder="Senha para a Empresa" aria-describedby="senhaHelp" maxlength="255" required>
                                        <small id="senhaHelp" class="form-text text-muted">Será utilizado para entrar no sistema.</small>
                                    </div>
                                    <div class="col">
                                        <label for="confirmar_senha">Confirme a Senha: </label>
                                        <input type="password" class="form-control" name="confirmar_senha" id="confirmar_senha" placeholder="Digite a senha novamente" maxlength="255" required>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="contato">Telefone / Celular: </label>
                                        <input type="tel" class="form-control" name="contato" id="contato" placeholder="Telefone ou celular da Empresa" maxlength="11" required value="<%= Session("contato") %>">
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="logotipo">Logotipo da empresa: </label>
                                        <input type="file" accept="image/*" class="form-control-file" id="logotipo" name="logotipo">
                                    </div>
                                </div>

                                <div class="mt-4 d-flex flex-row-reverse">
                                    <button type="submit" class="btn btn-primary align-self-center">
                                        <i class="fas fa-user-plus"></i>
                                        <span>Cadastrar</span>
                                    </button>
                                </div>

                            </form>
                        </div>
                    
                    </div>

                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Treinamento ASP Clássico 2019</span>
                </div>
                </div>
            </footer>
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
<!-- #include file = "../../inc/footer.asp" -->
<script src="../js/validate.js"></script>
</body>
</html>
