# language: pt
Feature: Relatório de Desempenho do Roteiro
  Como um professor responsável por uma turma
  Eu quero ver o desempenho da minha turma em um roteiro comparado a turmas passadas
  Para que eu possa avaliar se a turma está melhor ou pior que as anteriores e ajustar meu ensino

  # Cenários de GUI (Interface de Usuário)

  Scenario: Visualizar a comparação com a média de várias turmas passadas na web
    Given que estou autenticado como "Professor"
    And sou responsável pela turma "ESS - 2026.2"
    And o sistema possui o desempenho da turma "ESS - 2026.2" no roteiro "Requisitos" com média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    And o sistema possui o desempenho da turma "ESS - 2025.2" no roteiro "Requisitos" com média de acertos "65%", média de erros "35%" e tempo médio "45 min"
    And o roteiro "Requisitos" da turma "ESS - 2025.2" está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
    And o sistema possui o desempenho da turma "ESS - 2025.1" no roteiro "Requisitos" com média de acertos "80%", média de erros "20%" e tempo médio "30 min"
    And o roteiro "Requisitos" da turma "ESS - 2025.1" está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
    When eu abro a página "Relatório de desempenho do roteiro" da turma "ESS - 2026.2" para o roteiro "Requisitos"
    Then eu estou na página "Relatório de desempenho do roteiro"
    And eu vejo na linha "ESS - 2026.2" a média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    And eu vejo na linha "Média das turmas passadas" a média de acertos "72.5%", média de erros "27.5%" e tempo médio "37.5 min"
    And eu vejo na linha "Diferença" a média de acertos "-2.5 pp", média de erros "+2.5 pp" e tempo médio "+2.5 min"

  Scenario: Visualizar apenas o desempenho da turma quando não houver turmas passadas vinculadas na web
    Given que estou autenticado como "Professor"
    And sou responsável pela turma "ESS - 2026.2"
    And o sistema possui o desempenho da turma "ESS - 2026.2" no roteiro "Requisitos" com média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    And nenhum roteiro de turma passada está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
    When eu abro a página "Relatório de desempenho do roteiro" da turma "ESS - 2026.2" para o roteiro "Requisitos"
    Then eu estou na página "Relatório de desempenho do roteiro"
    And eu vejo a mensagem "Não há turmas passadas vinculadas ao roteiro Requisitos"
    And eu vejo na linha "ESS - 2026.2" a média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    And eu não vejo as linhas "Média das turmas passadas" e "Diferença"

  Scenario: Visualizar apenas a média de turmas passadas quando a turma atual não possui respostas na web
    Given que estou autenticado como "Professor"
    And sou responsável pela turma "ESS - 2026.2"
    And a turma "ESS - 2026.2" aplicou o roteiro "Requisitos", mas não possui respostas registradas
    And o sistema possui o desempenho da turma "ESS - 2025.2" no roteiro "Requisitos" com média de acertos "65%", média de erros "35%" e tempo médio "45 min"
    And o roteiro "Requisitos" da turma "ESS - 2025.2" está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
    When eu abro a página "Relatório de desempenho do roteiro" da turma "ESS - 2026.2" para o roteiro "Requisitos"
    Then eu estou na página "Relatório de desempenho do roteiro"
    And eu vejo na linha "Média das turmas passadas" a média de acertos "65%", média de erros "35%" e tempo médio "45 min"
    And eu não vejo as linhas "ESS - 2026.2" e "Diferença"

  Scenario: Turma passada sem respostas não é incluída na média na web
    Given que estou autenticado como "Professor"
    And sou responsável pela turma "ESS - 2026.2"
    And o sistema possui o desempenho da turma "ESS - 2026.2" no roteiro "Requisitos" com média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    And o sistema possui o desempenho da turma "ESS - 2025.1" no roteiro "Requisitos" com média de acertos "80%", média de erros "20%" e tempo médio "30 min"
    And o roteiro "Requisitos" da turma "ESS - 2025.1" está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
    And a turma "ESS - 2025.2" aplicou o roteiro "Requisitos", mas não possui respostas registradas
    And o roteiro "Requisitos" da turma "ESS - 2025.2" está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
    When eu abro a página "Relatório de desempenho do roteiro" da turma "ESS - 2026.2" para o roteiro "Requisitos"
    Then eu estou na página "Relatório de desempenho do roteiro"
    And eu vejo na linha "Média das turmas passadas" a média de acertos "80%", média de erros "20%" e tempo médio "30 min"
    And eu vejo na linha "Diferença" a média de acertos "-10 pp", média de erros "+10 pp" e tempo médio "+10 min"

  Scenario: Roteiro de uma turma passada que não está vinculado não é incluído na média na web
    Given que estou autenticado como "Professor"
    And sou responsável pela turma "ESS - 2026.2"
    And o sistema possui o desempenho da turma "ESS - 2026.2" no roteiro "Requisitos" com média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    And o sistema possui o desempenho da turma "ESS - 2025.2" no roteiro "Requisitos" com média de acertos "65%", média de erros "35%" e tempo médio "45 min"
    And o roteiro "Requisitos" da turma "ESS - 2025.2" está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
    And o sistema possui o desempenho da turma "ESS - 2025.1" no roteiro "Requisitos" com média de acertos "80%", média de erros "20%" e tempo médio "30 min"
    And o roteiro "Requisitos" da turma "ESS - 2025.1" não está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
    When eu abro a página "Relatório de desempenho do roteiro" da turma "ESS - 2026.2" para o roteiro "Requisitos"
    Then eu estou na página "Relatório de desempenho do roteiro"
    And eu vejo na linha "Média das turmas passadas" a média de acertos "65%", média de erros "35%" e tempo médio "45 min"
    And eu vejo na linha "Diferença" a média de acertos "+5 pp", média de erros "-5 pp" e tempo médio "-5 min"

  Scenario: Vincular o roteiro de uma turma passada ao roteiro atual na web
    Given que estou autenticado como "Professor"
    And sou responsável pela turma "ESS - 2026.2"
    And o sistema possui o desempenho da turma "ESS - 2026.2" no roteiro "Requisitos" com média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    And o sistema possui o desempenho da turma "ESS - 2025.2" no roteiro "Requisitos" com média de acertos "65%", média de erros "35%" e tempo médio "45 min"
    And o roteiro "Requisitos" da turma "ESS - 2025.2" não está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
    When eu informo que o roteiro "Requisitos" da turma "ESS - 2025.2" corresponde ao roteiro "Requisitos" da turma "ESS - 2026.2"
    Then eu estou na página "Relatório de desempenho do roteiro"
    And eu vejo na linha "Média das turmas passadas" a média de acertos "65%", média de erros "35%" e tempo médio "45 min"
    And eu vejo na linha "Diferença" a média de acertos "+5 pp", média de erros "-5 pp" e tempo médio "-5 min"

  Scenario: Importar o desempenho de uma turma passada a partir de uma planilha na web
    Given que estou autenticado como "Professor"
    And sou responsável pela turma "ESS - 2026.2"
    And o sistema não possui o desempenho da turma "ESS - 2025.2" no roteiro "Requisitos"
    And eu tenho a planilha "desempenho_ESS_2025.2" com a turma "ESS - 2025.2", o roteiro "Requisitos", média de acertos "65%", média de erros "35%" e tempo médio "45 min"
    And estou na página "Importação de desempenho de turmas passadas"
    When eu importo a planilha "desempenho_ESS_2025.2"
    Then eu vejo a mensagem "Desempenho importado com sucesso"
    And o sistema possui o desempenho da turma "ESS - 2025.2" no roteiro "Requisitos" com média de acertos "65%", média de erros "35%" e tempo médio "45 min"

  Scenario: Importar planilha sem coluna obrigatória na web
    Given que estou autenticado como "Professor"
    And sou responsável pela turma "ESS - 2026.2"
    And o sistema não possui o desempenho da turma "ESS - 2025.2" no roteiro "Requisitos"
    And eu tenho a planilha "desempenho_ESS_2025.2" sem a coluna "Média de acertos"
    And estou na página "Importação de desempenho de turmas passadas"
    When eu importo a planilha "desempenho_ESS_2025.2"
    Then eu vejo a mensagem "Planilha inválida: coluna Média de acertos ausente"
    And o sistema continua sem o desempenho da turma "ESS - 2025.2" no roteiro "Requisitos"

  @optional
  Scenario: Exportar o relatório como PDF na web
    Given que estou autenticado como "Professor"
    And sou responsável pela turma "ESS - 2026.2"
    And o sistema possui o desempenho da turma "ESS - 2026.2" no roteiro "Requisitos" com média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    And o sistema possui o desempenho da turma "ESS - 2025.2" no roteiro "Requisitos" com média de acertos "65%", média de erros "35%" e tempo médio "45 min"
    And o roteiro "Requisitos" da turma "ESS - 2025.2" está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
    And estou na página "Relatório de desempenho do roteiro" da turma "ESS - 2026.2" para o roteiro "Requisitos"
    When eu solicito exportar o relatório como PDF
    Then eu recebo um arquivo PDF com o relatório
    And o PDF contém na linha "ESS - 2026.2" a média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    And o PDF contém na linha "Média das turmas passadas" a média de acertos "65%", média de erros "35%" e tempo médio "45 min"
    And o PDF contém na linha "Diferença" a média de acertos "+5 pp", média de erros "-5 pp" e tempo médio "-5 min"

  Scenario: Aluno não pode ver o relatório na web
    Given que estou autenticado como "Aluno"
    And estou matriculado na turma "ESS - 2026.2"
    And o sistema possui o desempenho da turma "ESS - 2026.2" no roteiro "Requisitos" com média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    When eu tento abrir a página "Relatório de desempenho do roteiro" da turma "ESS - 2026.2" para o roteiro "Requisitos"
    Then eu vejo a mensagem "Acesso negado"
    And eu não vejo o desempenho de nenhuma turma

  # Cenários de Serviço (Backend/API)

  Scenario: Obter o relatório com a média de várias turmas passadas via serviço
    Given que acesso o sistema como "Professor"
    And sou responsável pela turma "ESS - 2026.2"
    And o sistema possui o desempenho da turma "ESS - 2026.2" no roteiro "Requisitos" com média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    And o sistema possui o desempenho da turma "ESS - 2025.2" no roteiro "Requisitos" com média de acertos "65%", média de erros "35%" e tempo médio "45 min"
    And o roteiro "Requisitos" da turma "ESS - 2025.2" está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
    And o sistema possui o desempenho da turma "ESS - 2025.1" no roteiro "Requisitos" com média de acertos "80%", média de erros "20%" e tempo médio "30 min"
    And o roteiro "Requisitos" da turma "ESS - 2025.1" está vinculado ao roteiro "Requisitos" da turma "ESS - 2026.2"
    When eu solicito ao sistema o relatório de desempenho da turma "ESS - 2026.2" no roteiro "Requisitos"
    Then o sistema retorna para "ESS - 2026.2" média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    And o sistema retorna para "Média das turmas passadas" média de acertos "72.5%", média de erros "27.5%" e tempo médio "37.5 min"
    And o sistema retorna para "Diferença" média de acertos "-2.5 pp", média de erros "+2.5 pp" e tempo médio "+2.5 min"
    And o sistema ainda possui o desempenho da turma "ESS - 2026.2" no roteiro "Requisitos" com média de acertos "70%", média de erros "30%" e tempo médio "40 min"

  Scenario: Vincular o roteiro de uma turma passada ao roteiro atual via serviço
    Given que acesso o sistema como "Professor"
    And sou responsável pela turma "ESS - 2026.2"
    And o sistema possui o desempenho da turma "ESS - 2026.2" no roteiro "Requirements" com média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    And o sistema possui o desempenho da turma "ESS - 2025.2" no roteiro "Requirements" com média de acertos "65%", média de erros "35%" e tempo médio "45 min"
    And o roteiro "Requirements" da turma "ESS - 2025.2" não está vinculado ao roteiro "Requirements" da turma "ESS - 2026.2"
    When eu solicito ao sistema para vincular o roteiro "Requirements" da turma "ESS - 2025.2" ao roteiro "Requirements" da turma "ESS - 2026.2"
    Then o sistema retorna a confirmação de vínculo
    And o roteiro "Requirements" da turma "ESS - 2025.2" está vinculado ao roteiro "Requirements" da turma "ESS - 2026.2"
    And o sistema ainda possui o desempenho da turma "ESS - 2026.2" no roteiro "Requirements" com média de acertos "70%", média de erros "30%" e tempo médio "40 min"
    And o sistema ainda possui o desempenho da turma "ESS - 2025.2" no roteiro "Requirements" com média de acertos "65%", média de erros "35%" e tempo médio "45 min"

  Scenario: Importar o desempenho de uma turma passada a partir de uma planilha via serviço
    Given que acesso o sistema como "Professor"
    And sou responsável pela turma "ESS - 2026.2"
    And o sistema não possui o desempenho da turma "ESS - 2025.2" no roteiro "Requisitos"
    And eu tenho a planilha "desempenho_ESS_2025.2" com a turma "ESS - 2025.2", o roteiro "Requisitos", média de acertos "65%", média de erros "35%" e tempo médio "45 min"
    When eu envio a planilha "desempenho_ESS_2025.2" para o sistema
    Then o sistema retorna a confirmação de importação
    And o sistema possui o desempenho da turma "ESS - 2025.2" no roteiro "Requisitos" com média de acertos "65%", média de erros "35%" e tempo médio "45 min"
