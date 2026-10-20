Feature: relatório de desempenho do roteiro (GUI)
  As a professor responsável por uma turma
  I want to comparar o desempenho da turma atual em um roteiro com o das turmas passadas que fizeram o mesmo roteiro
  so that eu possa avaliar o desempenho da turma atual em relação ao das turmas passadas
# Relatório comparativo
Scenario: comparar turma atual com a média das turmas passadas web
  Given eu estou logado como "professor" com o login "mrocha" e a senha "1234"
  And a turma "ESS - 2026.2" tem, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"
  And a turma "ESS - 2025.1" tem, no roteiro "Requisitos", média de acertos "6", média de erros "4" e tempo médio de resposta "30 minutos"
  And o roteiro "Requisitos" da turma "ESS - 2025.1" está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  And a turma "ESS - 2025.2" tem, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "20 minutos"
  And o roteiro "Requisitos" da turma "ESS - 2025.2" corresponde ao roteiro "Requisitos" da turma "ESS - 2026.2"
  And eu estou na página "Relatório de desempenho do roteiro"
  When eu peço o relatório de desempenho do roteiro "Requisitos" da turma "ESS - 2026.2" em comparação com as turmas passadas
  Then continuo na página "Relatório de desempenho do roteiro"
  And vejo na tabela, na linha "ESS - 2026.2", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"
  And vejo na tabela, na linha "Média das turmas passadas", média de acertos "7", média de erros "3" e tempo médio de resposta "25 minutos"
  And não vejo na tabela linhas das turmas "ESS - 2025.1" e "ESS - 2025.2"

Scenario: ver relatório de roteiro sem turma passada web
  Given eu estou logado como "professor" com o login "mrocha" e a senha "1234"
  And a turma "ESS - 2026.2" tem, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"
  And nenhuma turma passada tem roteiro vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  And eu estou na página "Relatório de desempenho do roteiro"
  When eu peço o relatório de desempenho do roteiro "Requisitos" da turma "ESS - 2026.2" em comparação com as turmas passadas
  Then continuo na página "Relatório de desempenho do roteiro"
  And vejo na tabela, na linha "ESS - 2026.2", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"
  And não vejo na tabela a linha "Média das turmas passadas"

Scenario: ver relatório de roteiro ainda não respondido pela turma atual web
  Given eu estou logado como "professor" com o login "mrocha" e a senha "1234"
  And a turma "ESS - 2026.2" não tem respostas para o roteiro "Requisitos"
  And a turma "ESS - 2025.1" tem, no roteiro "Requisitos", média de acertos "6", média de erros "4" e tempo médio de resposta "30 minutos"
  And o roteiro "Requisitos" da turma "ESS - 2025.1" está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  And a turma "ESS - 2025.2" tem, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "20 minutos"
  And o roteiro "Requisitos" da turma "ESS - 2025.2" está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  And eu estou na página "Relatório de desempenho do roteiro"
  When eu peço o relatório de desempenho do roteiro "Requisitos" da turma "ESS - 2026.2" em comparação com as turmas passadas
  Then continuo na página "Relatório de desempenho do roteiro"
  And vejo na tabela, na linha "Média das turmas passadas", média de acertos "7", média de erros "3" e tempo médio de resposta "25 minutos"
  And não vejo na tabela a linha "ESS - 2026.2"

Scenario: ignorar na média turma passada com roteiro não vinculado web
  Given eu estou logado como "professor" com o login "mrocha" e a senha "1234"
  And a turma "ESS - 2026.2" tem, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"
  And a turma "ESS - 2025.1" tem, no roteiro "Requisitos", média de acertos "3", média de erros "7" e tempo médio de resposta "40 minutos"
  And o roteiro "Requisitos" da turma "ESS - 2025.1" não está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  And a turma "ESS - 2025.2" tem, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "20 minutos"
  And o roteiro "Requisitos" da turma "ESS - 2025.2" está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
  And eu estou na página "Relatório de desempenho do roteiro"
  When eu peço o relatório de desempenho do roteiro "Requisitos" da turma "ESS - 2026.2" em comparação com as turmas passadas
  Then continuo na página "Relatório de desempenho do roteiro"
  And vejo na tabela, na linha "Média das turmas passadas", média de acertos "8", média de erros "2" e tempo médio de resposta "20 minutos"

# Dados de turmas passadas: importação e cadastro 

Scenario: importar resultados de turma passada por planilha web
  Given eu estou logado como "professor" com o login "mrocha" e a senha "1234"
  And a turma "ESS - 2025.2" não tem resultados no roteiro "Requisitos"
  And a planilha "requisitos-2025-2.xlsx" tem o resultado "8" acertos, "2" erros e "15 minutos" do aluno "Ana Lima"
  And a planilha "requisitos-2025-2.xlsx" tem o resultado "6" acertos, "4" erros e "25 minutos" do aluno "Bruno Reis"
  And eu estou na página "Resultados de turmas passadas"
  When eu importo a planilha "requisitos-2025-2.xlsx" para o roteiro "Requisitos" da turma "ESS - 2025.2"
  Then eu vejo uma mensagem de confirmação
  And continuo na página "Resultados de turmas passadas"
  And vejo que a turma "ESS - 2025.2" tem, no roteiro "Requisitos", média de acertos "7", média de erros "3" e tempo médio de resposta "20 minutos"

Scenario: importar arquivo que não é planilha web
  Given eu estou logado como "professor" com o login "mrocha" e a senha "1234"
  And a turma "ESS - 2025.2" não tem resultados no roteiro "Requisitos"
  And o arquivo "requisitos-2025-2.pdf" não é uma planilha
  And eu estou na página "Resultados de turmas passadas"
  When eu tento importar o arquivo "requisitos-2025-2.pdf" para o roteiro "Requisitos" da turma "ESS - 2025.2"
  Then eu vejo uma mensagem de erro
  And continuo na página "Resultados de turmas passadas"
  And vejo que a turma "ESS - 2025.2" não tem resultados no roteiro "Requisitos"

Scenario: cadastrar diretamente resultado de turma passada web
  Given eu estou logado como "professor" com o login "mrocha" e a senha "1234"
  And a turma "ESS - 2025.2" não tem resultados no roteiro "Requisitos"
  And eu estou na página "Resultados de turmas passadas"
  When eu cadastro o resultado "8" acertos, "2" erros e "15 minutos" do aluno "Ana Lima" no roteiro "Requisitos" da turma "ESS - 2025.2"
  Then eu vejo uma mensagem de confirmação
  And continuo na página "Resultados de turmas passadas"
  And vejo o resultado "8" acertos, "2" erros e "15 minutos" do aluno "Ana Lima" na lista de resultados do roteiro "Requisitos" da turma "ESS - 2025.2"

#  Restrição de acesso : Seráque é necessário ?

Scenario Outline: negar acesso ao relatório para quem não é professor web
  Given eu estou logado como "monitor" com o login "jsouza" e a senha "1234"
  And a turma "ESS - 2026.2" tem, no roteiro "Requisitos", média de acertos "8", média de erros "2" e tempo médio de resposta "15 minutos"
  When eu tento ver o relatório de desempenho do roteiro "Requisitos" da turma "ESS - 2026.2" em comparação com as turmas passadas
  Then eu vejo uma mensagem de erro de acesso negado
  And não vejo média de acertos, média de erros nem tempo médio de resposta

