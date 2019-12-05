<!-- Bootstrap, Datatable -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/v/bs4/dt-1.10.20/r-2.2.3/datatables.min.js"></script>

<!-- SB Admin 2 -->
<script src="//<%=url_admin%>js/sb-admin-2.min.js"></script>

<script>
    $(document).ready(function () {
        $('#lojistas, #participantes').DataTable({
            "order": [],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Portuguese-Brasil.json"
            }
        });
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    })
</script>