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
                    <h1 class="h3 my-4 text-gray-800">Participantes</h1>
                    <p>Está é a área de gerenciamento dos Participantes de seu evento. Aqui você poderá fazer o upload para gerar os participantes, atualizar, excluir e vizualizar todas as pessoas que compareçerão em seu evento.</p>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex justify-content-between">
                            <h6 class="m-0 font-weight-bold align-self-center">Dados cadastrados:</h6>
                            <a href="upload.asp" role="button" class="btn btn-primary text-light" data-toggle="tooltip" data-placement="top" title="Clique aqui para fazer o upload da planilha.">
                                <i class="fas fa-upload"></i>
                                <span>Carregar participantes</span>
                            </a>
                        </div>
                        <div class="card-body table-responsive">
                            <div>
                                <button id="excluirDados" type='button' class='btn btn-danger btnExcluir' data-toggle='modal' data-target='#excluir'><i class='fas fa-trash-alt mx-2'></i><span>Excluir dados</span></button>
                            </div>
                            <input type="checkbox" name="allItems" id="allItems"><label for="allItems" class="mx-3">Selecionar todos os itens desta página</label> 
                            <table class="table table-striped table-sm" id="participantes">
                                <thead class="bg-primary text-white text-nowrap">
                                    <tr>
                                        <th class="align-top"></th>
                                        <th class="align-top">Ingresso</th>
                                        <th class="align-top">Nome</th>
                                        <th class="align-top">Sobrenome</th>
                                        <th class="align-top">Tipo de ingresso</th>
                                        <th class="align-top">E-mail</th>
                                        <th class="align-top">Telefone</th>
                                        <th class="align-top">Data Festa</th>
                                        <th class="align-top">Status Planejamento</th>
                                        <th class="align-top">Editar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        Set participantes = getAllSQL("participantes", "", "ingresso")
                                        Do until participantes.EOF
                                            Response.Write "<tr>"
                                            Response.Write "<td class='align-middle'><input type='checkbox' name='item' value='"&participantes("ingresso")&"'></td>"
                                            For Each td in participantes.Fields
                                                If td.Name = "email" Then
                                                Response.Write "<td class='p-2 text-justify'><div style='width: 200px'>"&td&"</div></td>"
                                                Else
                                                Response.Write "<td class='p-2 text-justify'>"&td&"</td>"
                                                End If
                                            Next
			                                Response.Write "<td class='align-middle'><a href='edit.asp?ingresso="&participantes("ingresso")&"'>Editar</a></td>"
			                                Response.Write "</tr>"
			                                participantes.MoveNext
		                                Loop                                         
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
