# bancoABC
Testes automatizados voltados para processo seletivo da empresa Foursys

Passo a passo para reprodução dos cenários:

1. Git clone;
2. Instalação Python;
3. Instalação das bibliotecas (robotframework, etc) utilizando pip instal...;

O código foi dividido em duas frentes: frontend e backend.
Frontend aplica-se ao teste automatizado Web. Backend, API.

Comandos para executar os testes:
1. robot .\frontend\tests\login_test.robot (Frontend);
2. robot .\backend\tests\user.robot

**Observação**:
Cenários da API serão FAILED para Get by user, PUT e DELETE. Motivo: Quando o usuário é criado, o respectivo ID retornado da API de criação não é encontrado nos demais endpoints.
