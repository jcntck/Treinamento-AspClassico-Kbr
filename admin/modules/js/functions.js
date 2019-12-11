$(document).ready(function() {

    $(".btnExcluir").click(function(e) {
        var url = $(this).attr("href")
        $('#confirm').click(function() {
            excluirRegistros()
        })
    })

    $(".btnExcluirLojista").click(function(e) {
        var url = $(this).attr("href")
        $('#confirm').click(function() {
            window.location.replace(url)
        })
    })

    function excluirRegistros() {
        var checks = []
        $.each($('input[name="item"]:checked'), function() {
            checks.push($(this).val())
        });

        $.ajax({
            type: "POST",
            url: "remove.asp",
            data: { 'checks': checks.join('|') },
            success: function(data) {
                if (data) {
                    location.reload();
                }
            },
            error: function(data) {
                console.log(data.responseText)
            }
        })
    }

    $('input[name="allItems"]').on("click", function() {
        if ($('input[name="allItems"]').is(':checked')) {
            $('input[name="item"]').each((index, element) => $(element).prop("checked", true))
        } else {
            $('input[name="item"]').each((index, element) => $(element).prop("checked", false))
        }
    })
})