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
                            <table class="table table-responsive table-bordered text-center" id="lojistas">
                                <thead class="bg-primary text-white">
                                    <tr>
                                        <th class="p-1">Logotipo</th>
                                        <th class="p-1">Razão Social</th>
                                        <th class="p-1">Nome Responsável</th>
                                        <th class="p-1">E-mail</th>
                                        <th class="p-1">Celular</th>
                                        <th class="p-1">Editar</th>
                                        <th class="p-1">Remover</th>
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

        <!-- Modal Excluir -->
        <div class="modal fade" id="excluir" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header bg-light text-danger">
                    <h4 class="modal-title">Deseja realmente remover?</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Tem certeza que deseja remover esta loja?</p>
                    <p>Os dados apagados não poderão ser recuperados.</p>
                </div>
                <div class="modal-footer">
                    <!-- <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Fechar</button> -->
                    <button type="button" class="btn btn-primary btn-danger" id="confirm"><i class="fas fa-trash-alt"></i><span class='mx-2'>Remover</span></button>
                </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Page Wrapper -->
<!-- #include file = "../../inc/footer.asp" -->
<script src="../js/functions.js"></script>
</body>
</html>
