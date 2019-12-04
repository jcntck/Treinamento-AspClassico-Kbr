<html lang="pt-br">
<!-- #include file = "../../inc/head.asp" -->
<body>
    <%
        lojista = getByIdSQL("usuarios", Request.queryString("id"))
    %>
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
                    <p>Está é a área de edição de Lojistas. Aqui é onde você edita os dados os anunciantes de seu evento.</p>

                    <div class="card shadow mb-4">

                        <div class="card-header d-flex justify-content-between">
                            <h6 class="m-0 font-weight-bold align-self-center">Formulário de edição:</h6>
                            <a class="btn btn-primary align-self-center" href="default.asp" role="button">
                                <i class="fas fa-arrow-left"></i>
                                <span>Voltar</span>    
                            </a>
                        </div>    

                        <div class="card-body">
                            
                            <form method="post" action="update.asp" name="formLojista" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="<%=lojista(0)%>">
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="razao_social">Razão Social: </label>
                                        <input type="text" class="form-control" name="razao_social" id="razao_social" placeholder="Razão Social da Empresa" value="<%=lojista(2)%>" maxlength="255" required autofocus>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="nome_responsavel">Nome Responsável: </label>
                                        <input type="text" class="form-control" name="nome_responsavel" id="nome_responsavel" placeholder="Nome responsável pela Empresa" value="<%=lojista(3)%>" maxlength="255" required>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="email">Endereço de e-mail: </label>
                                        <input type="email" class="form-control" name="email" id="email" placeholder="Endereço de e-email da Empresa" aria-describedby="emailHelp" value="<%=lojista(4)%>" maxlength="255" required>
                                        <small id="emailHelp" class="form-text text-muted">Será utilizado para entrar no sistema.</small>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col-12">
                                        <p class="text-danger small">* Não digite nada nos campos de senha, caso queira permanecer com a senha atual.</p>
                                    </div>
                                    <div class="col">
                                        <label for="senha">Nova Senha: </label>
                                        <input type="password" class="form-control" name="senha" id="senha" placeholder="Senha para a Empresa" aria-describedby="senhaHelp" maxlength="255">
                                        <small id="senhaHelp" class="form-text text-muted">Será utilizado para entrar no sistema.</small>
                                    </div>
                                    <div class="col">
                                        <label for="confirmar_senha">Confirme a Senha: </label>
                                        <input type="password" class="form-control" name="confirmar_senha" id="confirmar_senha" placeholder="Digite a senha novamente" maxlength="255">
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="contato">Telefone / Celular: </label>
                                        <input type="tel" class="form-control" name="contato" id="contato" placeholder="Telefone ou celular da Empresa" value="<%=lojista(6)%>" maxlength="11" required>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col-2">
                                        <% If lojista(UBound(lojista) - 1) <> "" Then %>
                                            <img src="uploads/<%=lojista(UBound(lojista) - 1)%>" alt="Logotipo" class="img-fluid img-thumbnail">
                                        <% End If %>
                                    </div>
                                    <div class="col">
                                        <input type="hidden" name="logotipo_antigo" value="<%=lojista(UBound(lojista) - 1)%>">
                                        <label for="logotipo">Logotipo da empresa: </label>
                                        <input type="file" class="form-control-file" id="logotipo" name="logotipo">
                                    </div>
                                </div>

                                <div class="mt-4 d-flex flex-row-reverse">
                                    <button type="submit" class="btn btn-primary align-self-center">
                                        <i class="fas fa-edit"></i>
                                        <span>Editar</span>
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
</body>
</html>
