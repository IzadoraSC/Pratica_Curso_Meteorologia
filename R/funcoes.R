
# Função: Calcular a média e verificar aprovação --------------------------

media_aprovacao <- function(nota1, nota2, nota3) {
  # Calcular a média
  media <- mean(c(nota1, nota2, nota3))
  
  # Verificar a situação do aluno
  if (media >= 7) {
    mensagem <- paste("A média é", round(media, 2), "= Aluno Aprovado!")
  } else {
    mensagem <- paste("A média é", round(media, 2), "= Aluno Reprovado.")
  }
  
  return(mensagem)
}

# Utilizando a função
media_aprovacao(8, 7, 6) 
media_aprovacao(5, 6, 4) 


# Função:Converter temperatura em Fahrenheit para Celsius ------------------------

temp_f_c <- function(temp_f) {
  # Fórmula de conversão
  temp_c <- (temp_f - 32) * 5 / 9
  return(temp_c)
}

# ATIVIDADE 
# Função:Converter temperatura em Kelvin para Celsius ------------------------

