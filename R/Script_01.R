#==============================================================================#
#                   UNIVERSIDADE ESTADUAL DO MARANHÃO - UEMA                   #
#           CENTRO DE EDUCAÇÃO, CIÊNCIAS EXATAS E NATURAIS - CECEN             #
#               COMPUTAÇÃO APLICADA ÀS CIÊNCIAS ATMOSFÉRICAS I                 #
#         Referência: https://github.com/PExCCA-UENF/Scripts-R-Cursos          #
#                                  Script 01                                   #
#==============================================================================#

# 1. INTRODUÇÃO: R E RSTUDIO --------------------------------------------------
# R é uma linguagem de programação e ambiente de software gratuito, livre e de
# código aberto (open source).

# O RStudio é um ambiente de desenvolvimento integrado, que fornece uma interface,
# gráfica mais amigável para programação em linguagem R.
# Outras interfaces: Visual Code, Positron...

# 1.1 RStudio ------------------------------------------------------
# A interface do RStudio é dividida, inicialmente, em 4 partes:
## 1° - Script
## 2° - Console, Terminal...
## 3° - Environment, History...
## 4° - Files, Plots, Packages, Help, Viewer...

## Exemplo: Podemos usar o R como uma calculadora, ao escrever o comando 5+4 
# no console e apertar a tecla ENTER, o console mostra automaticamente o resultado
# dessa operação. 

## Se você escrever algum comando incompleto como, por exemplo, faltando um par 
# de parênteses ou uma virgula, e apertar ENTER para ser executado, o símbolo >
# do console será substituído por +, indicando que falta algo no seu comando.
# Escreva no console 1+ e aperte ENTER.

## O Script R é um editor de texto.
# Ao usar um script você pode fazer alterações e correções em seus comandos.
# No RStudio, podemos abrir um script:
# Manualmente: Clique em File > New File > R Script.
# Ou por um atalho de teclado: Ctrl + Shift + N

# No script, para executar um comando, devemos colocar o cursor na linha do
# comando ou selecioná-lo e pressionar Ctrl + Enter e o resultado será mostrado
# no console.

# No script, é possível fazer comentários usando o caractere #.

# Para salvar o script, clique em File > Save As..., dê um nome ao arquivo e
# inclua a extensão .R (editor de texto do R).

# 2. ESTRUTURAS BÁSICAS DA LINGUAGEM R ----------------------------------------

## 2.1 Objetos no R ----------------------------------------

## Uma das principais características do R, é que ele é uma linguagem orientada 
# a objeto.
## Os objetos permitem armazenar os valores, funções e resultados que você produz, 
# que pode posteriormente ser manipulado. 
## Para isso, usamos a expressão de atribuição “<-”.

## Em suma, os nomes dos objetos podem conter os seguintes tipos de caracteres: 
# Letras;
# Números;
# _(underline);
# •(ponto).

## O nome de um objeto não deve começar por: _(underline),número ou ponto seguido
# de um número.

## Exemplo: 
Temp1 <- 25.5   # lê-se "Temp1 recebe 25.5"

## Ao executarmos o comando acima, o resultado não será mostrado na tela, mas o
# objeto Temp1 foi criado na memória do computador. Para exibirmos o conteúdo de
# Temp1, basta digitar o nome do objeto na linha de comando e pressionar Enter.

## Também podemos utilizar a seta invertida, mas a ponta dela deve sempre estar
# apontada para o nome do objeto.
26.8 -> Temp2

## O "=" também pode ser utilizado para atribuição dos objetos, mas não é 
# recomendado seu uso para evitar ambiguidade com outros termos da linguagem R.


## IMPORTANTE
## A linguagem R diferencia letras maiúsculas de letras minúsculas.
## Por padrão, o separador decimal utilizado é o ponto (.).
## A vírgula (,) é reservada para separar diferentes objetos dentro de uma função.


## Listagem e remoção de objetos:
ls()                # Lista todos os objetos armazenadas.
remove(Temp1)       # Remove o objeto especificado. 
rm(Temp2)           # Também remove o objeto especificado. 
rm(impar, par)      # Remove os objetos especificados.           
remove(list = ls()) # Remove todos os objetos criados na sessão.


# Os símbolos da linguagem R para realizar as operações matemáticas básicas são
# os mesmos das calculadoras científicas: + (adição), * (multiplização),
# / (divisão) e - (subtração).
100 + 50    # Soma
100 - 50    # Subtração
100 * 50    # Multiplicação
100 / 50    # Divisão
2 ^ 4       # Potenciação
2 ** 4      # Potenciação
sqrt(9)     # Raiz quadrada
log(4)      # Função logarítmica

# Nota: log() e sqrt() são funções do R.

# Os operadores relacionais relacionam dois elementos e retorna um valor lógico.
# Valores lógicos: TRUE(verdadeiro) e FALSE(falso).
# Frequentemente utilizados para testar condições e criar expressões condicionais.

# <   Menor que
# <=  Menor ou igual a
# >   Maior que
# >=  Maior ou igual a
# ==  Igual a
# !   Negação
# !=  Diferente de

3 < 6   # 3 é menor que 6?
3 <= 0  # 3 é menor ou igual a 0?
0 > 6   # 0 é maior que 6?
3 >= 3  # 3 é maior ou igual a 3?
3 == 6  # 3 é igual a 6?
6 == 6  # 6 é igual a 6?
3 != 6  # 3 é diferente de 6?
0 != 0  # 0 é diferente de 0?


## 2.2 Funções (noções básicas) ------------------

## As funções são blocos de códigos que executam tarefas específicas, sejam elas
# de matemática, estatística, para leitura e manipulação de dados ou arquivos, etc.

## A grande maioria das funções são escritas no seguinte formato: 
# nome_da_função(lista_de_argumentos).

## Exemplo 1: sum(..., na.rm = FALSE)
## Retorna a soma de todos os valores presentes em seus argumentos.
sum(1, 2, 3, 4, 5)
sum(1, 2, NA) 

## Por padrão, se houver valores ausentes (NA), ao calcular estatísticas básicas,
# o resultado será NA.
# Para realizar o cálculo, precisamos definir na.rm = TRUE. 

sum(1, 2, NA, na.rm = TRUE)

## Exemplo 2: round(x, digits = 0, ...)
## Arredonda valores numéricos de acordo com um número de casas decimais.
round(1.23163)
round(1.23963, digits = 2)

## Exemplos de outras funções do R:
# mean()    Retorna a média.
# min()     Retorna o mínimo.
# max()     Retorna o máximo.
# range()   Retorna o mínimo e o máximo.
# median()  Retorna a mediana.
# sd()      Retorna o desvio padrão.
# var()     Retorna a variância.
# ceiling() Arredonda para um número inteiro seguinte.
# floor()   Arredonda para um número inteiro para baixo.
# summary() Retorna um resumo estatístico dos dados.
# seq()     Retorna uma sequência, sendo possível controlar a que passo a sequência cresce.
# rep()     Retorna uma sequência de repetições.


## 2.3 Ajuda do R ------------------------------------------------------------- 

## Para ver os arquivos de ajuda do R, use o help(nome_da_função) ou ?nome_da_funcão.
## Exemplo:
help(mean)
?mean

## Nota: Se o cursor do mouse estiver no nome da função e pressionarmos F1, 
# a página de ajuda da função vai abrir no quadrante "Help"".


## Os arquivos de ajuda, geralmente, apresentam os seguintes tópicos:
# a) Description - resumo geral sobre o uso da função;
# b) Usage - mostra como a função deve ser usada e quais argumentos podem ser 
# especificados;
# c) Arguments - descrição dos argumentos;
# d) Details - alguns detalhes sobre o uso e aplicação da função;
# e) Value - explica o que sai no output após usar a função (os resultados);
# f) Note - notas sobre a função;
# g) References - referências utilizadas;
# h) See also - mostra outras funções relacionadas que podem ser consultadas;
# i ) Examples - exemplos do uso da função.
### Dica: Copie e cole os exemplos no R/RStudio para ver como funciona.

## Para descobrir o nome de uma função que faça aquilo que você deseja, use a
## a função help.search() e pesquise usando palavras-chave em inglês, pois o R é
## desenvolvido em língua inglesa.

## Exemplo:
help.search("arithmetic mean") # pesquisa função que realiza média

## O help.search() irá procurar, dentro dos arquivos de help, possíveis funções
## para calcular a média. O resultado será mostrado no quadrante "Help".

##  A função help.search() pode ser substituída por duas interrogações (??).
??"arithmetic mean"

# Para buscar ajuda na internet, use a função RSiteSearch():
RSiteSearch("arithmetic mean")

# 3. DIRETÓRIO DE TRABALHO -----------------------------------------------------

## O diretório de trabalho é uma pasta no seu computador que interage com
# o R/RStudio.

# Definindo o diretório de trabalho.
# Manualmente: 
## Session > Set Working Directory > Choose Directory

# Por atalho de teclado:
## Ctrl + Shift + H

# Com funções:
getwd() # Informa o diretório de trabalho atual.
setwd() # Seta um local como novo diretório.
dir()   # Lista os arquivos dentro do diretório de trabalho.

## Nota: Na função setwd(), devemos usar a barra oblíqua (/) para definir o caminho.
## Exemplo: setwd("C:/Users/Documentos/R")


#Material criando e disponibilizado pelo Projeto de Extensão 
# “Processamento e Análise de Dados Ambientais com R” do Laboratório de 
# Meteorologia (LAMET) da Universidade Estadual do Norte Fluminense Darcy 
# Ribeiro (UENF).
