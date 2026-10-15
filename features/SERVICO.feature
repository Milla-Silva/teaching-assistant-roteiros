Feature: relatório de desempenho do roteiro (serviço)
  As a professor responsável por uma turma
  I want to comparar o desempenho da turma atual em um roteiro com o das turmas passadas que fizeram o mesmo roteiro
  so that eu possa avaliar o desempenho da turma atual em relação ao das turmas passadas

# Relatório comparativo 

Scenario: obter comparação da turma atual com a média das turmas passadas
  Given eu acesso o sistema como "professor"
  And o sistema tem a turma "ESS - 2026.2" com, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"
  And o sistema tem a turma "ESS - 2025.1" com, no roteiro "Requisitos", média de acertos "6", média de erros "4" e tempo médio de resposta "30 minutos"
  And o sistema tem o roteiro "Requisitos" da turma "ESS - 2025.1" vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  And o sistema tem a turma "ESS - 2025.2" com, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "20 minutos"
  And o sistema tem o roteiro "Requisitos" da turma "ESS - 2025.2" vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  When eu peço ao sistema o relatório de desempenho do roteiro "Requisitos" da turma "ESS - 2026.2" em comparação com as turmas passadas
  Then o sistema retorna, para "ESS - 2026.2", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"
  And o sistema retorna, para "Média das turmas passadas", média de acertos "7", média de erros "3" e tempo médio de resposta "25 minutos"
  And o sistema tem a turma "ESS - 2026.2" com, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"
  And o sistema tem a turma "ESS - 2025.1" com, no roteiro "Requisitos", média de acertos "6", média de erros "4" e tempo médio de resposta "30 minutos"
  And o sistema tem a turma "ESS - 2025.2" com, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "20 minutos"
  And o sistema tem o roteiro "Requisitos" da turma "ESS - 2025.1" vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  And o sistema tem o roteiro "Requisitos" da turma "ESS - 2025.2" vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"

Scenario: obter relatório de roteiro sem turma passada
  Given eu acesso o sistema como "professor"
  And o sistema tem a turma "ESS - 2026.2" com, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"
  And o sistema não tem turma passada com roteiro vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  When eu peço ao sistema o relatório de desempenho do roteiro "Requisitos" da turma "ESS - 2026.2" em comparação com as turmas passadas
  Then o sistema retorna, para "ESS - 2026.2", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"
  And o sistema não retorna "Média das turmas passadas"
  And o sistema tem a turma "ESS - 2026.2" com, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"

Scenario: obter relatório de roteiro ainda não respondido pela turma atual
  Given eu acesso o sistema como "professor"
  And o sistema tem a turma "ESS - 2026.2" sem respostas para o roteiro "Requisitos"
  And o sistema tem a turma "ESS - 2025.1" com, no roteiro "Requisitos", média de acertos "6", média de erros "4" e tempo médio de resposta "30 minutos"
  And o sistema tem o roteiro "Requisitos" da turma "ESS - 2025.1" vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  And o sistema tem a turma "ESS - 2025.2" com, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "20 minutos"
  And o sistema tem o roteiro "Requisitos" da turma "ESS - 2025.2" vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  When eu peço ao sistema o relatório de desempenho do roteiro "Requisitos" da turma "ESS - 2026.2" em comparação com as turmas passadas
  Then o sistema retorna, para "Média das turmas passadas", média de acertos "7", média de erros "3" e tempo médio de resposta "25 minutos"
  And o sistema não retorna "ESS - 2026.2"
  And o sistema tem a turma "ESS - 2026.2" sem respostas para o roteiro "Requisitos"

Scenario: ignorar na média turma passada com roteiro não vinculado
  Given eu acesso o sistema como "professor"
  And o sistema tem a turma "ESS - 2026.2" com, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"
  And o sistema tem a turma "ESS - 2025.1" com, no roteiro "Requisitos", média de acertos "3", média de erros "7" e tempo médio de resposta "40 minutos"
  And o sistema não tem o roteiro "Requisitos" da turma "ESS - 2025.1" vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  And o sistema tem a turma "ESS - 2025.2" com, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "20 minutos"
  And o sistema tem o roteiro "Requisitos" da turma "ESS - 2025.2" vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  When eu peço ao sistema o relatório de desempenho do roteiro "Requisitos" da turma "ESS - 2026.2" em comparação com as turmas passadas
  Then o sistema retorna, para "Média das turmas passadas", média de acertos "8", média de erros "2" e tempo médio de resposta "20 minutos"
  And o sistema tem a turma "ESS - 2025.1" com, no roteiro "Requisitos", média de acertos "3", média de erros "7" e tempo médio de resposta "40 minutos"
  And o sistema não tem o roteiro "Requisitos" da turma "ESS - 2025.1" vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"

#  Vínculo entre roteiros de semestres diferentes
Scenario: informar que roteiro de turma passada corresponde ao da turma atual
  Given eu acesso o sistema como "professor"
  And o sistema não tem o roteiro "Requisitos" da turma "ESS - 2025.2" vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  When eu informo ao sistema que o roteiro "Requisitos" da turma "ESS - 2025.2" corresponde ao roteiro "Requisitos" da turma "ESS - 2026.2"
  Then o sistema armazena o roteiro "Requisitos" da turma "ESS - 2025.2" vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"

# Dados de turmas passadas: importação e cadastro 
Scenario: importar resultados de turma passada por planilha
  Given eu acesso o sistema como "professor"
  And o sistema tem a turma "ESS - 2025.2" sem resultados no roteiro "Requisitos"
  And a planilha "requisitos-2025-2.xlsx" tem o resultado "8" acertos, "2" erros e "15 minutos" do aluno "Ana Lima"
  And a planilha "requisitos-2025-2.xlsx" tem o resultado "6" acertos, "4" erros e "25 minutos" do aluno "Bruno Reis"
  When eu envio ao sistema a planilha "requisitos-2025-2.xlsx" para o roteiro "Requisitos" da turma "ESS - 2025.2"
  Then o sistema armazena o resultado "8" acertos, "2" erros e "15 minutos" do aluno "Ana Lima" no roteiro "Requisitos" da turma "ESS - 2025.2"
  And o sistema armazena o resultado "6" acertos, "4" erros e "25 minutos" do aluno "Bruno Reis" no roteiro "Requisitos" da turma "ESS - 2025.2"
  And o sistema tem a turma "ESS - 2025.2" com, no roteiro "Requisitos", média de acertos "7", média de erros "3" e tempo médio de resposta "20 minutos"

Scenario: importar arquivo que não é planilha
  Given eu acesso o sistema como "professor"
  And o sistema tem a turma "ESS - 2025.2" sem resultados no roteiro "Requisitos"
  And o sistema tem a turma "ESS - 2025.1" com, no roteiro "Requisitos", média de acertos "6", média de erros "4" e tempo médio de resposta "30 minutos"
  And o arquivo "requisitos-2025-2.pdf" não é uma planilha
  When eu envio ao sistema o arquivo "requisitos-2025-2.pdf" para o roteiro "Requisitos" da turma "ESS - 2025.2"
  Then o sistema retorna uma mensagem de erro
  And o sistema tem a turma "ESS - 2025.2" sem resultados no roteiro "Requisitos"
  And o sistema tem a turma "ESS - 2025.1" com, no roteiro "Requisitos", média de acertos "6", média de erros "4" e tempo médio de resposta "30 minutos"

Scenario: cadastrar diretamente resultado de turma passada
  Given eu acesso o sistema como "professor"
  And o sistema tem a turma "ESS - 2025.2" sem resultados no roteiro "Requisitos"
  When eu cadastro no sistema o resultado "8" acertos, "2" erros e "15 minutos" do aluno "Ana Lima" no roteiro "Requisitos" da turma "ESS - 2025.2"
  Then o sistema armazena o resultado "8" acertos, "2" erros e "15 minutos" do aluno "Ana Lima" no roteiro "Requisitos" da turma "ESS - 2025.2"

# Restrição de acesso
Scenario Outline: negar acesso ao relatório para quem não é professor
  Given eu acesso o sistema como "aluno"
  And o sistema tem a turma "ESS - 2026.2" com, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"
  When eu peço ao sistema o relatório de desempenho do roteiro "Requisitos" da turma "ESS - 2026.2" em comparação com as turmas passadas
  Then o sistema retorna uma mensagem de erro de acesso negado
  And o sistema não retorna média de acertos, média de erros nem tempo médio de resposta
  And o sistema tem a turma "ESS - 2026.2" com, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"

