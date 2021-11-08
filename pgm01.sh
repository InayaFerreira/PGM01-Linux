#!/bin/bash

Arq(){
    echo "Nome: $name, Sexo: $sexo, Salário: $salario, Idade: $idade, Profissão: $prof" >> Cadastros.txt
    date >> Cadastros.txt
    echo >> Cadastros.txt
}

Profissao(){
    echo "######### Cadastro Realizado #########"
    echo
    echo "Nome: $name"
    echo "Profissão: $prof"
    date
    echo
}

Cadastros(){
    echo "############## Cadastros ##############"
    echo
    if [ ! -e Cadastros.txt ]; then
        echo "Nenhum cadastro realizado ainda!" ;
    else
        cat Cadastros.txt
    fi
    echo
}


Cadastro(){
    echo "######################################"
    echo "############## Cadastro ##############"
    echo "######################################"
    echo
    echo "Preencha o formulário a seguir:"
    echo
    echo "Nome: " ;read name
    while [[ "$name" =~ [^a-zA-Z\ ãÁÉÍÓáéíóÂÊÎÔâêîô] || -z "$name" ]];
    do
        echo "Digite um nome: " ;read name
    done
    echo
    echo "Sexo: [F/M] " ;read sexo
    while [ "$sexo" != "M" ] && [ "$sexo" != "m" ] && [ "$sexo" != "F" ] && [ "$sexo" != "f" ];
    do
        echo "Insira uma resposta válida (F ou M)" ;read sexo
    done
    echo
    echo "Pretensão Salarial: " ;read salario

    while [[ "$salario" =~ [^0-9] || -z "$salario" || "$salario" -gt 20000 || 1000 -gt "$salario" ]];
     do
        echo "Insíra um valor entre 1000 e 20000: " ;read salario
    done
    echo
    echo "Idade: " ;read idade

    while [[ "$idade" =~ [^0-9] || -z "$idade" || "$idade" -gt 122 || 18 -gt "$idade" ]];
    do
        echo "Insíra um valor entre 18 e 122: " ;read idade
    done
    echo
    echo "Cógigos e suas profissões:"
    echo "1 - Cartógrafo(a)"
    echo "2 - Assistente social"
    echo "3 - Psicólogo(a)"
    echo "4 - Atendente"
    echo "5 - Secretário(a) Bilíngue"
    echo "6 - Geólogo(a)"
    echo
    echo "Código da Profissão: "; read profissao
    while [[ "$profissao" =~ [^1-6] || -z "$profissao" || "$profissao" -gt 6 || 1 -gt "$profissao" ]];
    do
        echo "Insíra um valor entre 1 a 6: " ;read profissao
    done
    echo

    case "$profissao" in
      1) export prof="1 - Cartografo" ;;
      2) export prof="2 - Assistente Social" ;;
      3) export prof="3 - Psicólogo" ;;
      4) export prof="4 - Atendente" ;;
      5) export prof="5 - Secretária Bilíngue" ;;
      6) export prof="6 - Geólogo" ;;
    esac
    clear
    Arq
    Profissao
    Menu
}

Menu(){
    echo "######################################"
    echo "############### MENU #################"
    echo "######################################"
    echo
    echo "1 - Cadastrar novo candidato"
    echo "2 - Visualizar candidatos"
    echo "3 - Excluir cadastros"
    echo
    echo "0 - Sair"
    echo
    echo "Digite a opção desejada: ";read menu

    while [[ "$menu" =~ [^0-3] || -z "$menu" || "$menu" -gt 3 || 0 -gt "$menu" ]];
    do
        echo "Insíra um valor entre 0 e 3: " ;read menu
    done

    clear

    case "$menu" in
      1) Cadastro ;;
      2) Cadastros ;;
      3) rm Cadastros.txt ;echo ;;
      0) exit ;;
    esac
    Menu
}

Menu
