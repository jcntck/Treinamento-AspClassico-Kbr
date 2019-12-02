<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html>
<html lang="pt-br">
<!-- #include file = "../../inc/head.asp" -->
<body>
<!-- Page Wrapper -->
    <div id="wrapper">
        
        <!-- #include file = "../../inc/header.asp" -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 my-4 text-gray-800">Lojistas</h1>
                    <p>Está é a área de gerenciamento dos lojistas que participarão do seu evento. Aqui você poderá cadastrar, atualizar, excluir e vizualizar com mais detalhes qualquer lojista que você tenha adicionado aqui.</p>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex justify-content-between">
                            <h6 class="m-0 font-weight-bold align-self-center">Dados cadastrados:</h6>
                            <a href="create.asp" role="button" class="btn btn-primary text-light">Adicionar novo</a>
                        </div>
                        <div class="card-body">
                            <table class="table-responsive table-bordered text-center" id="lojistas">
                                <thead>
                                    <tr>
                                        <th scope="col" class="p-1">Logotipo</th>
                                        <th scope="col" class="p-1">Razão Social</th>
                                        <th scope="col" class="p-1">Nome Responsável</th>
                                        <th scope="col" class="p-1">E-mail</th>
                                        <th scope="col" class="p-1">Celular</th>
                                        <th class="text-center" class="p-1">Ações</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        Call gerarTabela("usuarios", Array("logotipo", "razao_social", "nome_responsavel", "email", "celular"), "isLojista = 1" )                                        
                                    %>
                                </tbody>
                            </table>
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
