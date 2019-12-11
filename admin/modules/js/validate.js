$("#formLojista").validate({
    rules: {
        razao_social: {
            required: true,
            minlength: 8
        },
        nome_responsavel: {
            required: true,
            minlength: 8
        },
        email: {
            required: true,
            email: true
        }
        // cpf: {
        //     required: true,
        //     cpf: true
        // },
        // telefone: {
        //     required: true,
        //     minlength: 14
        // },
        // celular: {
        //     required: true,
        //     minlength: 14
        // },
        // cep: {
        //     required: true
        // },
        // endereco: {
        //     required: true
        // },
        // num: {
        //     required: true,
        //     number: true
        // },
        // complemento: {
        //     maxlength: 18
        // },
        // bairro: {
        //     required: true
        // },
        // cidade: {
        //     required: true
        // },
        // estado: {
        //     required: true
        // }
    },
    messages: {
        razao_social: {
            required: "Coloque a razão social da empresa.",
            minlength: "O nome deve conter pelo menos 8 caracteres."
        },
        nome_responsavel: {
            required: "Coloque o nome responsável pela empresa.",
            minlength: "O nome deve conter pelo menos 8 caracteres."
        },
        email: {
            required: "Coloque o e-mail da empresa.",
            email: "Utilize um e-mail válido"
        }
        // cpf: {
        //     required: "Coloque o seu CPF"
        // },
        // telefone: {
        //     required: "Coloque o seu telefone",
        //     minlength: "Informe um telefone válido"
        // },
        // celular: {
        //     required: "Coloque o seu celular",
        //     minlength: "Informe um celular válido"
        // },
        // cep: {
        //     required: "Coloque o seu CEP"
        // },
        // endereco: {
        //     required: "Coloque o seu endereço"
        // },
        // num: {
        //     required: "Coloque o seu numero"
        // },
        // complemento: {
        //     maxlength: "O complemento deve conter no máximo 18 caracteres"
        // },
        // bairro: {
        //     required: "Coloque o seu bairro"
        // },
        // cidade: {
        //     required: "Coloque a sua cidade"
        // },
        // estado: {
        //     required: "Coloque o seu estado"
        // }
    },
    errorElement: 'div',
    errorPlacement: function(error, element) {
        var placement = $(element).data('error');
        if (placement) {
            $(placement).addClass("errorValidate");
            $(placement).append(error);
        } else {
            error.insertAfter(element);
        }
    }
});