#==============================================================================#
#                   UNIVERSIDADE ESTADUAL DO MARANHÃO - UEMA                   #
#           CENTRO DE EDUCAÇÃO, CIÊNCIAS EXATAS E NATURAIS - CECEN             #
#               COMPUTAÇÃO APLICADA ÀS CIÊNCIAS ATMOSFÉRICAS I                 #
#         Referência: https://github.com/PExCCA-UENF/Scripts-R-Cursos          #
#                                  Script 02                                   #
#==============================================================================#

# 1. TIPOS E ESTRUTURAS DE DADOS------------------------------------------------

## 1.1 Vetores --------------------------------

## São sequências de dados de um mesmo tipo.
#Para criarmos um vetor no R a função utilizada é c().

## Função "c()" (concatenar ou combinar).

vn <- c(2, 3, 6, 9)   # Vetor numérico.
is.vector(vn)           # Verifica se é vetor e retorna TRUE ou FALSE.
class(vn)               # Retorna o tipo de dado.
length(vn)              # Retorna o tamanho do vetor.

vc <- c('a', 'b', 'c', 'd')   # Vetor de characters.
is.vector(vc); class(vc); length(vc)

## Nota: Os caracteres ou cadeias de texto devem ser colocados entre aspas
# simples ' ' ou duplas " ".

vetor <- c(1, 2, 3, "a")  
is.vector(vetor); class(vetor); length(vetor)
# Como um vetor só pode ter uma classe de objeto dentro dele, sempre que tiver 
# números e texto em um vetor, os números virarão texto.

## Também podemos criar um vetor através de funções que retornam por padrão esse 
# tipo de estrutura como, por exemplo, as funções que servem para criar sequências
# no R. 
## Exemplos: 
seq1 <- seq(from = 1, to = 10)   # Sequência que vai do nº 1 ao número 10.
is.vector(seq1)
class(seq1)
length(seq1)

seq2 <- seq(from = 13, to = 1, by = -1)   # Sequência decrescente do 13 ao 1.
is.vector(seq2)
class(seq2)
length(seq2)

rep1 <- rep(x = 1:5, times = 3)   # Repete 3 vezes os valores de 1 a 5.
is.vector(rep1)
class(rep1)
length(rep1)

rep2 <- rep(x = 1:3, times = 1:3)   # Repete o 1º valor do intervalo uma vez,
                                      # o 2º duas vezes e o 3º três vezes.
is.vector(rep2)
class(rep2)
length(rep2)

# Nota: Os argumentos de uma função são sempre separados por vírgulas.
# As funções podem receber argumentos, que são usados para passar dados para a função. 


## 1.2 Matriz --------------------------------

## Matrizes são tabelas organizadas em linhas e colunas no formato m x n, onde
# m representa o número de linhas (horizontal) e n o número de colunas (vertical),
# tem uma estrutura de dados homogêneas (armazenam o mesmo tipo de dados).

## Para criarmos uma matriz no R a função utilizada é matrix().

mtx <-
  matrix(
    rep1,           # Vetor com os valores usados para preencher a matriz.
    nrow = 3,       # Define a quantidade de linhas.
    ncol = 5,       # Define a quantidade de colunas.
    byrow = TRUE    # Se FALSE (o padrão) a matriz é preenchida por colunas, TRUE a matriz é preenchida por linhas.
  )
mtx

dim(mtx)        # Retorna a dimensão da matriz (Nº Linhas, Nº Colunas).
is.matrix(mtx)  # Verifica se é uma matriz e retorna TRUE ou FALSE.

## 1.3 Data frames --------------------

## Data frames são tabelas em que cada coluna pode armazenar um tipo de dado
# diferente.

# É possível criar um data frame com a função data.frame():
df <- data.frame(vn, vc)
is.data.frame(df)   # Verifica se é um data frame e retorna TRUE ou FALSE.

dim(df)     # Retorna a dimensão da matriz (Nº Linhas, Nº Colunas).
ncol(df)    # Retorna o númuro de colunas do data frame.
nrow(df)    # Retorna o númuro de linhas do data frame.
names(df)   # Retorna os nomes das colunas.
str(df)     # Retorna uma síntese da estrutura da base de dados.

## Podemos acessar as colunas do data frame usando o operador de indexação "$".
df$vn   # Retorna os elementos da coluna "vn".
df$vc   # Retorna os elementos da coluna "vc".

## Também podemos acessar os elementos usando o operador 
# de indexação [Linhas, Colunas].
df[ ,1]        # Retorna a primeira coluna do conjunto de dados.
df[, -1]       # Retorna todos os dados, exceto os da coluna 1.
df[1:3, ]      # Retorna os dados da linha 1 até a linha 3.
df[c(2,4), ]   # Retorna os dados das linhas 2 e 4.
df[, 'vn']
df[, c('vn', 'vc')]

## R vem com muitos conjuntos de dados pré-instalados. 
# Como exemplo o conjunto de dados de qualidade do ar.
# Eles podem ser úteis para praticar as análises que você deseja realizar
# em seus próprios dados.

## Digite ?airquality para acessar as informações de ajuda sobre esse conjunto
# de dados.

s.data.frame(airquality)
str(airquality)

print(airquality)         # Imprime os resultados no console.
head(airquality, n = 3)   # Retorna as primeiras n linhas (por padrão 6 linhas). 
tail(airquality, n = 3)   # Retorna as últimas n linhas (por padrão 6 linhas).


# ATIVIDADE ---------------------------------------------------------------

 
## Usando o conjunto de dados "airquality" responda as seguintes questões:

# 1: Calcule os valores médios, máximos e mínimos da variável radiação solar (Solar.R).

# 2. Selecione apenas as colunas referentes à temperatura (Temp) e à quantidade 
# de ozônio (Ozone) utilizando o operador de indexação [ , ]. Armazene o resultado 
# em um novo objeto chamado dados_sel.



#Material criando e disponibilizado pelo Projeto de Extensão 
# “Processamento e Análise de Dados Ambientais com R” do Laboratório de 
# Meteorologia (LAMET) da Universidade Estadual do Norte Fluminense Darcy 
# Ribeiro (UENF).
