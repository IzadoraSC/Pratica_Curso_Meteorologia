#==============================================================================#
#                   UNIVERSIDADE ESTADUAL DO MARANHÃO - UEMA                   #
#           CENTRO DE EDUCAÇÃO, CIÊNCIAS EXATAS E NATURAIS - CECEN             #
#               COMPUTAÇÃO APLICADA ÀS CIÊNCIAS ATMOSFÉRICAS I                 #
#         Referência: https://github.com/PExCCA-UENF/Scripts-R-Cursos          #
#                                  Script 03                                   #
#==============================================================================#

# 1. R BASE E PACOTE------------------------------------------------

## A linguagem R é composta por um conjunto de pacotes que oferecem as funcionalidades 
## básicas da linguagem. Alguns desses pacotes são base (funções de uso geral) e 
## stats (funções para análises e operações estatísticas).
## Esses pacotes fazem parte da instalação básica do R e estão disponíveis através
## do Comprehensive R Archive Network (CRAN R).

## Além dos pacotes da base do R, podemos instalar pacotes (packages) com funcionalidades 
## específicas criadas por colaboradores. A grande maioria desses pacotes também estão
## disponíveis através do CRAN R, mas alguns estão disponíveis em outras plataformas, como o GitHub.

# Para instalar um pacote do R, podemos usar a função install. packages("nome_do_pacote").
install.packages("tidyverse")   # Instala o pacote "tidyverse".

# Nota: O pacote pode ser desinstalado com a função remove.packages("nome_do_pacote").

# Após a instalação, o pacote deve ser carregado.
# Podemos usar a função library(nome_do_pacote) ou require(nome_do_pacote).
library(tidyverse)   # Carrega o pacote.
require(tidyverse)   # Carrega o pacote.

# A função library(), por padrão, retorna um erro quando o pacote não está instalado.
# A função require() retorna um warning caso o pacote não esteja instalado.

search()   # Retorna todos os pacotes carregados.

# Podemos realizar uma breve inspeção nas funções do pacote utilizando a função ls().
# Assim, podemos procurar alguma função que atenda às nossas necessidades.

ls("package:tidyverse")   # Lista os comandos do pacote.

tidyverse_packages()   # Lista os pacotes pertencentes ao projeto.

# 2. CRIANDO PROJETOS NO RSTUDIO (.RPROJ) -------------------------------------

# Trabalhar com programação exige um nível de organização, que é importante para 
# manter a eficiência e reprodutibilidade. No R, existem algumas maneiras de aumentar 
# esse nível de organização, como Rprojects e controle do diretório de trabalho.

# O diretório de trabalho é, em suma, a pasta onde o R vai procurar os arquivos na
# na hora de ler informações e vai gravar os arquivos na hora de salvar informações.
# A definição do diretório de trabalho é uma etapa opcional, mas que pode economizar 
# muito tempo no processo de análise de dados.

# A função getwd() pode ser utilizada para verificar o diretório de trabalho atual.
getwd() 

# A função setwd()  pode ser utilizada para mudar o diretório de trabalho. 
setwd() 
## Ex.: setwd('C:/Users/Documentos/R')

## Nota: Na função `setwd()`, devemos usar a barra oblíqua (`/`) para definir o caminho.

# Caso opte por definir o diretório manualmente, podemos realizá-lo em:
# -- Session > Set Working Directory > Choose Directory.
# Podemos utilizar também o atalho de teclado: Ctrl + Shift + H.

# No RStudio podemos ainda criar projetos (Rproject).
# O Rproject nada mais é do que uma pasta no seu computador específica para uma análise.
# Alguns dos principais benefícios do Rproject:

# 1. Organização de arquivos: Você pode organizar todos os arquivos relacionados 
#    a um projeto em um único diretório, facilitando a localização e o gerenciamento 
#    de scripts, dados, gráficos, relatórios e outros arquivos associados.

# 2. Independência de diretórios: Cada projeto R possui seu próprio diretório de 
#    trabalho, o que significa que os caminhos para arquivos e pacotes são relativos 
#    ao diretório do projeto. Isso evita conflitos entre projetos e permite que você 
#    alterne facilmente entre projetos sem precisar reconfigurar caminhos e configurações.
#
# 3. Controle de versão: Você pode integrar o projeto R com sistemas de controle de 
#    versão, como o Git, para rastrear alterações, colaborar com outros usuários e 
#    recuperar versões anteriores do código.
#
# 4. Facilidade de compartilhamento: Ao compartilhar um projeto R, você pode incluir 
#    todos os arquivos e configurações necessários para que outras pessoas reproduzam 
#    sua análise. Isso torna mais fácil colaborar em projetos, compartilhar código 
#    e resultados, e garantir que todos estejam trabalhando no mesmo contexto.
#
# 5. Automatização: Você pode automatizar tarefas e análises por meio de scripts e 
#    funções. Isso permite que você crie fluxos de trabalho reprodutíveis e repetíveis, 
#    economizando tempo e minimizando erros.
#
## Em resumo, o uso de um projeto R ajuda na organização, reprodutibilidade, 
## compartilhamento e controle de versão, tornando suas análises mais eficientes, 
## colaborativas e confiáveis.

## Para criar um projeto vá em: File > New Project. 
## Em seguida, clique em: New Directory para criar o projeto em uma nova pasta.
## Nesta etapa, escolhemos o tipo de projeto que iremos criar, que podem ser ambientes 
## para uma análise simples, ambientes de desenvolvimentos de pacotes e até ambientes 
## para produção de livros. Para utilizar o ambiente simples, clique em New R Projetc.
## Em Directory name, insira o nome para o diretório que será criado.
## Em seguida, clique em Browse e defina um subdiretório para o projeto, local onde será criado a pasta.

## Se possuir o Git instalado, você também pode usar projetos para conectar com 
## repositórios do Github. Para isso, clique em Version Control na primeira janela 
## e siga as instruções lá fornecidas.


# IMPORTANTE --------------------------------------------------------------

# VAMOS SEMPRE TRABALHAR COM PROJETOS (.Rproj) !!!!

# Agora com seu projeto criado, vamos seguir!

# 3. IMPORTAÇÃO E EXPORTAÇÃO DE DADOS -----------------------------------------

# Vamos utilizar as 'Normais Climatológicas' obtidas do Instituto 
# Nacional de Meteorologia (INMET), disponíveis no 
# link: https://portal.inmet.gov.br/normais

# As 'Normais Climatológicas' são médias de variáveis meteorológicas, que foram 
# calculadas obedecendo os critérios recomendados pela Organização Meteorológica
# Mundial (OMM).

# Primeiro, vamor criar uma pasta denominada 'Dados':
if(!dir.exists('Dados/')){
  dir.create('Dados')
}

# Agora vamos fazer download das Normais Climatológicas (1991-2020) de 
# Temperatura Máxima Mensal e Anual (°C).

# Link para baixar os dados:
url.tmax <- 'https://portal.inmet.gov.br/uploads/normais/Normal-Climatologica-TMAX.xlsx'

# Use a função download.file() para baixar o arquivo conforme descrito por url da Internet.
download.file(url.tmax,                    # URL do arquivo a ser baixado.
              './Dados/Tmax.xlsx',   # Caminho e Nome do arquivo que será gerado.
              mode = 'wb')                 # Modo de gravação do arquivo: 'wb' para Windows.

dir('./Dados')   # Verifique se o arquivo foi salvo na pasta 'Dados_INMET/'.

##	Importação de dados em .xlsx e .xls
##	Como não tem a função no R básico, será necessário instalar e carregar 
# o pacote readxl.

#if (!require('readxl')) install.packages('readxl')
library(readxl)

TMAX <- read_excel(
  path = './Dados/Tmax.xlsx',   # Caminho e nome do arquivo que será importado.
  sheet = 1,                          # Planilha de interesse.
  na = '-',                           # Identificação dos valores ausentes.
  skip = 2)                           # Número de linhas a serem ignoradas antes de ler os dados. 

print(TMAX)   #Visualizar no console o conteúdo armazenado no objeto.
View(TMAX)    # Apresenta o conteúdo completo da base de dados em uma nova aba.

## Nota: No RStudio, podemos importar uma base de dados usando a interface gráfica. 
# Clique na aba Environment (normalmente localizada no canto superior direito da
# interface do RStudio).
# Em seguida, clique em Import Dataset e selecione From Excel (readr) se for 
# um arquivo .xlsx.

# Para exportar os dados em csv ou txt, use a função write.table().
write.table(x = TMAX,                      # Nome do arquivo que será exportado.
            file = './Dados/TMAX_INMET.csv',     # Nome e extensão do arquivo que será gerado.
            dec = ',',                     # Separador de decimais.
            row.names = TRUE,              # FALSE: os nomes das linhas não devem ser considerados.
            sep = ';',                     # Separador de colunas.
            na = 'NA',                     # Identificação dos valores ausentes.
            fileEncoding = 'ISO-8859-1')   # Especifica a codificação a ser usada.

# Para exportar os dados em .xlsx, podemos usar a função write_xlsx() do pacote 'writexl'.

if (!require('writexl')) install.packages('writexl')
library(writexl)

write_xlsx(x = TMAX,            # Nome do arquivo que será exportado.
           path = './Dados/TMAX_INMET.xlsx')   # Nome e extensão do arquivo que será gerado.

dir('./Dados')   

# 4. MANIPULAÇÃO E PROCESSAMENTO DE DADOS COM OS PACOTES ‘DPLYR’ E ‘TIDYR’-----

# Os pacotes `dplyr` e `tidyr` fazem parte do `tidyverse`.
# O `tidyverse` é uma coleção de pacotes da linguagem R construídos para a ciência 
# de dados. Todos os pacotes compartilham uma mesma filosofia de design, gramática 
# e estrutura de dados, facilitando a programação.

# O `tidyverse` é uma coleção de pacotes da linguagem R construídos para a ciência 
# de dados. Na prática, carregar o 'tidyverse' é o mesmo que carregar os 
# seguintes pacotes:
# 'dplyr'`: para manipulação e transformação de dados;
# 'forcats': para trabalharmos com fatores;
# 'ggplot2': para visualização de dados;
# 'lubridate': para trabalharmos com datas e horas.
# 'purrr': para programação funcional;
# 'readr': para importarmos bases para o R;
# 'stringr': para trabalharmos com textos;
# 'tibble': para data frames repaginados;
# 'tidyr'`: para limpeza e organização de dados.

# Vamos usar os pacotes: ‘dplyr’, 'tidyr’, 'lubridate' e ‘ggplot2’.

#if (!require('tidyverse')) install.packages('tidyverse')
library(tidyverse)

## 4.1. Operador Pipe ---------------

# O operador pipe é uma das funcionalidades mais populares na comunidade R.
# Ele foi introduzido pelo pacote `magrittr`, criado por Stefan Milton Bache 
# e Hadley Wickham.
# Pouco tempo depois foi incorporado ao `dplyr`, onde segue como parte do
# `tidyverse`.

# O operador pipe do pacote `magrittr` é representado por `%>%`.
# A ideia principal é facilitar o processo de manipulação e transformação de dados,
# proporcionando uma sintaxe fluida e orientada a ações através do encadeamento de
# funções, evitando a criação de objetos intermediários.

# Devido ao grande sucesso do operador pipe, a equipe principal da linguagem R
# implementou na linguagem uma versão do pipe nativo com a sintaxe `|>`, que está
# disponível a partir da versão 4.1 do R. 

# A ideia do operador pipe é usar o valor resultante de uma expressão como
# primeiro argumento da próxima função, possibilitando o encadeamento de funções.
# Podemos usá-lo facilmente com o atalho Ctrl + Shift + M.

## Para ativar o atalho Ctrl + Shift + M para o operador pipe nativo (|>), 
# no Windows, basta irmos no menu Tools → Global Options → Code e ativar a caixa
# 'Use native pipe operator, |> (requires R.4.1+)'.

# Exemplo de operações com e sem o operador pipe:
# Calcule a raiz quadrada da soma dos valores de 1 a 9, salve o resultado com
## 2 casas decimais e armazene em um novo objeto chamado resultado.

#Sem o pipe
somatorio <- sum(1:9)
raiz <- sqrt(somatorio)
resultado <- round(raiz, 2)
print(resultado)

#Com o pipe
resultado <- 1:9 |> 
  sum() |> 
  sqrt() |> 
  round(digits = 2) |> 
  print()

# Perceba que ao utilizar o operador pipe, colocamos em evidência as operações
# que estamos realizando. Assim, produzimos um código limpo, organizado e legível 
# não apenas para o R, mas para nós mesmos.

## 4.2. Exploração inicial -----------------------

# A manipulação de dados é uma etapa que consiste em coletar, limpar, processar
# e consolidar os dados para que sejam usados/analisados.

dplyr::glimpse(TMAX)

## 4.3 Selecionando variáveis de interesse -------------

# A função `select()` do pacote 'dplyr' permite selecionar colunas específicas 
# do conjunto de dados sem utilizar o operador de indexação '$'.

# Sem o operador pipe:
dplyr::select(
  TMAX, `Nome da Estação`, UF, Ano
)

# Com o operador pipe:
TMAX |> 
  dplyr::select(
    `Nome da Estação`, UF, Ano
  )

# Pareando a função `select()` com outras funções ou operadores, podemos selecionar
# variáveis com base em posição ou padrões presentes em seus nomes.

# Podemos selecionar sequencias de colunas com `:`.
TMAX |> 
  dplyr::select(
    Código:Janeiro
  )

# Também podemos utilizar funções para indexar parte dos nomes das variáveis com:
# 'starts_with()': Começa com um prefixo exato.
# 'ends_with()': Termina com um prefixo exato.
# 'contains()': Contém uma string literal.

TMAX |> 
  dplyr::select(
    Código:UF, starts_with('Ju')
  )

TMAX |> 
  dplyr::select(
    Código:UF, ends_with('bro')
  )

TMAX |> 
  dplyr::select(
    Código:UF, contains('em')
  )

## 4.4 Renomeando variáveis -----------------

# A função `rename()` do pacote 'dplyr' permite modificar os nomes das colunas.
# A sintaxe da função é simples, operamos com: `nome_novo` = `nome_antigo`.

TMAX_INMET <- TMAX |> 
  dplyr::rename(
    Estação = `Nome da Estação`,
    Jan = Janeiro,
    Fev = Fevereiro,
    Mar = Março,
    Abr = Abril,
    Mai = Maio,
    Jun = Junho,
    Jul = Julho,
    Ago = Agosto,
    Set = Setembro,
    Out = Outubro,
    Nov = Novembro,
    Dez = Dezembro
  )

# Também podemos utilizar a função rename_with() que opera recebendo uma função 
# com um vetor de caracteres para aplicar na base de dados.

# TMAX_INMET <- 
#   TMAX |>
#   dplyr::rename_with(
#     .fn = ~c('Código', 'Estação', 'UF', 'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 
#              'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez', 'Ano')
#   ) |> 
#   print()

## 4.5. Modificando e criando novas colunas ---------------------

# A função `mutate()` do pacote 'dplyr' permite criar ou modificar colunas.
# Ela também pode servir para excluir colunas, basta atribuir `NULL` à coluna que deseja excluir.

# Excluindo as colunas Código e Ano do conjunto de dados:
TMAX_INMET |> 
  dplyr::mutate(Código = NULL, Ano = NULL)

# Criar uma nova coluna com os nomes e UF das estações.
TMAX_INMET |> 
  dplyr::mutate(
    Estações_UF = paste(Estação, UF, sep = '-'),
    .before = Jan, 
    Código = NULL, Estação = NULL, UF = NULL
  )

## 4.6. Filtrando dados ------------------------------

# A função `filter()` do pacote 'dplyr' permite filtrar os dados com  base em expressões 
# e operadores lógicos (<, >=, !=, %in%, etc). Também podemos usar expressões que
# avaliem condições e retornem valores lógicos, como `is.na()` e `between()`.

TMAX_RJ <- TMAX_INMET |>  
  dplyr::filter(UF == 'RJ')  |>  
  print()

TMAX_INMET |> 
  dplyr::filter(
    UF %in% c('RJ', 'SP'))

# Podemos selecionar usando mais de uma condição.
TMAX_INMET |> 
  dplyr::filter(
    UF == 'RJ', Ano >= 30)

# Utilizando a função `between().
TMAX_INMET |> 
  dplyr::filter(
    between(Ano, 34, 35)
  )

## 4.7. Mudando da estrutura da base de dados------------

# Para mudar a estrutura da base de dados, podemos pivotar os dados, que é transformar 
# uma base de dados de 'largo' para 'comprido' (wide para long) e vice-versa.

# Usando a função pivot_longer() do pacote 'tidyr', indicamos quais são as colunas 
# que vamos utilizar para a “pivotagem”.

TMAX_longer <- 
  TMAX_INMET |> 
  dplyr::mutate(Ano = NULL) |> 
  tidyr::pivot_longer(
    cols = Jan:Dez,      # Seleciona as colunas a serem agrupadas.
    names_to = 'Meses',  # Nome da coluna categórica. 
    values_to = 'Tmax'   # Nome da coluna com os valores.
  ) |> 
  print()

# A função pivot_wider() faz a operação inversa da pivot_longer().
TMAX_wider <- 
  TMAX_longer |> 
  tidyr::pivot_wider(
    names_from = 'Meses',
    values_from = 'Tmax'
  ) |> 
  print()

# 5. TRABALHANDO COM DATAS COM O PACOTE ‘LUBRIDATE'----------------------------

# No R, datas são tratadas como um tipo especial de objeto, como classe date.
# Há várias formas de criar objetos dessa classe com o pacote 'lubridate'.

# Usando a função as_date():
data <- lubridate::as_date('2024-12-20')
class(data)

# A função as_date() assume que a ordem segue o padrão da língua inglesa:
# ano-mês-dia (ymd).
# No pacote 'lubridate', existem funções para todas as ordens possíveis: 
# ymd(), dmy(), mdy(), myd(), ydm() etc.

ymd('2024-12-20')
dmy('20-12-2024')
dmy('20122024')

# Se for trabalhar com data e horário, basta usar as funções do tipo ymd_h(),
# ymd_hm(), ymd_hms().
ymd_hms(20241220093010)

# O pacote 'lubridate' fornece diversas funções para extrair os componentes de 
#um objeto da classe date.
# year() - extrai o ano.
# month() - extrai o mês.
# day() - extrai o dia.
# hour() - extrai a hora.
# minute() - extrai os minutos.
# second() - extrai os segundos.

# Exemplos:
year(data)
month(data)
day(data)

# Para criar uma sequência de datas, podemos usar a função seq.Date() da base do R 
# em combinação com funções do pacote 'lubridate'.

# Primeiro, vamos definir a data inicial e final.
data_inicial <- ymd('2024-01-01')
data_final <- today()   # A função today() do pacote 'lubridate' retorna a data
                        # atual no formato Date.

# Criando uma sequência de datas diária.
seq_diaria <- seq(data_inicial, data_final, by = 'day')
print(seq_diaria)

# Criar a sequência de datas mensal.
seq_mensal <- seq(data_inicial, data_final, by = 'month')
print(seq_mensal)

# 6. VISUALIZAÇÃO DE DADOS COM O PACOTE ‘GGPLOT2’------------------------------#

# O `ggplot2` é um pacote de construção de gráficos pertencente ao `tidyverse`, carregando
# assim uma filosofia de simplicidade e transparência nos códigos. O pacote opera em uma
# estrutura de camadas, onde cada elemento pode ser personalizado à vontade do programador.

# O primeiro passo para criar o gráfico, é chamar a função `ggplot()` e informar
# qual conjunto de dados deseja utilizar.

ggplot(data = TMAX_longer)

# Perceba que essa função gerou apenas o plano de fundo cinza. 
# Agora vamos especificar como as observações serão mapeadas nos aspectos visuais  
# do gráfico e quais formas geométricas serão utilizadas.

ggplot(
  data = TMAX_longer,
  mapping = aes(x = UF, y = Tmax)
)

## A função `aes()` define o mapeamento dos elementos no plano cartesiano de nosso
## gráfico. O mapeamento pode ser definido em nível global (que se aplica a todo
## o gráfico) ou local (que se aplica apenas a uma camada). 

## Os aspectos que podem ou devem ser mapeados dependem do tipo de gráfico que 
## será construindo.

## Conjunto de mapeamentos estéticos (aesthetics) 'aes()':
# x e y: observações que serão mapeadas;
# color: define a cor de pontos e retas;
# fill: define a cor dos preenchimentos das formas com área;
# size: altera o tamanho das formas;
# alpha: altera a transparência das formas;
# shape: altera o estilo das formas;
# labels: altera o nome das observações.

## O mapeamentos estético 'aes()' pode ser usado dentro ou fora da função `ggplot()`.
ggplot(data = TMAX_longer) +
  aes(x = UF, y = Tmax)    # Mapeamento em nível global.

## Para definir o tipo de gráfico ou objeto geométrico, usamos a função 'geom_...()'.

## Gráfico de dispersão: 'geom_point()'
ggplot(data = TMAX_longer) +
  aes(x = UF, y = Tmax) +    # Mapeamento em nível global.
  geom_point()

## Usando o argumento 'color' na função `aes()` podemos constuir um gráfico por,
## categorias, basta usar alguma variável categórica.
ggplot(data = TMAX_longer) +
  geom_point(aes(x = UF, y = Tmax, color = Meses))  # Mapeamento em nível local.

## Vamos definir a ordem correta dos meses transformando a coluna 'Meses' em fator:
TMAX_longer <- 
  TMAX_longer |> 
  mutate(Meses = factor(Meses, 
                        levels = c('Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 
                                   'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez')))

corDegrade <- colorRampPalette(c('blue','red', 'goldenrod')) # Degradê de cores.

gr1 <- ggplot(data = TMAX_longer) +
  geom_point(aes(x = Meses, y = Tmax, color = Meses))+
  scale_color_manual(values = corDegrade(12))   # Alterando as cores dos pontos.
gr1

## Para alterar os aspectos visuais do gráfico, podemos usar as funções `theme_...()`.
gr1 + theme_minimal()
gr1 + theme_classic()
gr1 + theme_bw()

gr2 <- ggplot(data = TMAX_longer) +
  geom_boxplot(aes(x = Meses, y = Tmax, color = Meses))+
  scale_color_manual(values = corDegrade(12)) # Alterando as cores dos pontos.
gr2

# O ggplot2 possui mais de 30 funções 'geom_...()', veja a lista no link:
# https://ggplot2.tidyverse.org/reference

## Histograma: gráficos que apresentam a distribuição de uma variável. 
## Para gerar um histograma com o `ggplot2`, basta utilizar a função `geom_histogram()`.

TMAX_longer |> 
  ggplot(aes(x = Tmax)) +
  geom_histogram()

hist_RJ <- 
  TMAX_longer |> 
  filter(UF == 'RJ') |> 
  ggplot(aes(x = Tmax, )) +
  geom_histogram(color = 'steelblue4', fill = 'steelblue1', alpha = 0.8,
                 bins =  20)+
  theme_minimal()
hist_RJ

## Personalizando os eixos y e x do gráfico---#
hist_RJ +
  scale_y_continuous(name = 'Frequência', 
                     limits = c(0, 16), 
                     breaks = seq(0, 18, 2)) +
  scale_x_continuous(name = 'Temperatura Máxima (ºC)', 
                     breaks = seq(22, 35, 2)) 
hist_RJ <- 
  TMAX_longer |> 
  filter(UF == 'RJ') |> 
  ggplot(aes(x = Tmax, )) +
  geom_histogram(aes(y = ..density..),
    color = 'steelblue4', fill = 'steelblue1', alpha = 0.8,
    bins =  20)+
  geom_density(alpha = 0.7, fill = "orange") +
  labs(title = "Histograma Dados de Temperature (C)",
       x = 'Temperatura Máxima (ºC)',
       y = "Densidade") +
  theme_minimal()
hist_RJ


# 8. EXPORTAÇÃO DOS RESULTADOS ------------------------------------------------#

# Para exportar os gráficos, podemos navegar pela interface do RStudio ou utilizar
# as funções do `ggplot2`. Para salvar utilizando a interface, na aba Plots, procure
# pelo botão Export > Save as Image... . Selecione o formato da imagem, o diretório
# onde ela será salva e dê um nome ao gráfico. Se preferir, pode ajustar o tamanho e
# proporção digitando novos valores no canto superior direito.

# Para salvar utilizando a linha de comando, podemos operar com a função `ggsave()`.
# Nela, informamos o gráfico, o nome do arquivo e a resolução.

ggsave(
  filename = 'Gráfico_Tmax_RJ.png',       # Nome e extensão do arquivo (ex. '.png')
  plot = gr1,
  device = 'png',                        # Extensão do arquivo
  width = 3000, height = 1500,           # Largura e altura, respectivamente
  units = 'px'
)

ggsave(
  filename = 'Gráfico_Densid_Tmax_RJ.png',       # Nome e extensão do arquivo (ex. '.png')
  plot = gr2,
  device = 'png',                        # Extensão do arquivo
  width = 3000, height = 1500,           # Largura e altura, respectivamente
  units = 'px'
)

