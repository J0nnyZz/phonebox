# Sua copia do PhoneBox

Fork: https://github.com/J0nnyZz/phonebox

Branch de trabalho: `minha-versao`. `origin` e sua copia; `upstream` e o projeto original.

## Usar

Abra http://127.0.0.1:8765 no PC. Em General / Geral, localize Wi-Fi & Tailscale e escolha Pair a phone over Wi-Fi / Parear celular por Wi-Fi. No celular com o APK oficial instalado, escaneie o QR de pareamento e confirme o codigo exibido nos dois dispositivos. Ambos precisam estar na mesma rede local.

O agente inicia junto com o Windows. Atualizacoes automaticas foram desligadas para preservar a versao compilada desta copia.

## Modificar

Abra o atalho "PhoneBox - Desenvolvimento" ou, no PowerShell dentro do projeto:

```powershell
. .\scripts\ambiente-local.ps1
```

Esse ambiente usa Java 17 apenas neste terminal, mantendo o Java das outras aplicacoes.

- Painel do celular: `android/app/src/main/assets/www/`.
- Widgets do painel: `android/app/src/main/assets/www/widgets/`.
- Agente Windows e editor: `agent/PhoneBox.Agent/`.
- Catalogo e modelos: `agent/PhoneBox.Agent/widgets.json` e `templates.json`.

Depois de modificar o agente, reinstale:

```powershell
.\scripts\install.ps1 -Autostart
```

Para compilar e verificar o APK de teste:

```powershell
Push-Location android
.\gradlew.bat lintDebug assembleDebug
Pop-Location
```

Resultado: `android/app/build/outputs/apk/debug/app-debug.apk`.

O APK de teste tem assinatura diferente do APK oficial. Nao tente substitui-lo esperando manter os dados automaticamente. Antes da troca, exporte as paginas e combine uma migracao; pode ser necessario desinstalar o aplicativo oficial e parear novamente. Para uma versao pessoal permanente, configure uma chave de assinatura propria e guarde-a em backup fora do Git.

Mudancas na interface embarcada do celular exigem recompilar e reinstalar o APK. Para mostrar as mesmas mudancas no preview do PC, recompile tambem o agente.

## Salvar alteracoes no seu GitHub

Revise `git diff` e `git status`. Adicione apenas os arquivos de codigo/documentacao desejados, faca commit e execute `git push origin minha-versao`. Nao publique configuracoes pessoais, tokens ou chaves.

Configuracoes do programa: `%APPDATA%\PhoneBox`. Instalacao Windows: `%LOCALAPPDATA%\PhoneBox\app`. Esses dados ficam fora deste repositorio.
