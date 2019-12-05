$(document).ready(function() {
    $(".btnExcluir").click(function(e) {
        var url = $(this).attr("href")
        $('#confirm').click(function() {
            window.location = url
        })
    })
})