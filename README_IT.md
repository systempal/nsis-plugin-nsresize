# nsResize NSIS Plugin

**Versione personale modificata**

---

## Descrizione Originale

**Autore:** Stuart 'Afrow UK' Welch
**Azienda:** Afrow Soft Ltd
**Data:** 13 Aprile 2013
**Versione:** 1.0.0.0

Un piccolo plug-in NSIS per spostare o ridimensionare finestre/controlli.

Vedi Examples\nsResize\*.

## Macro

nsResize.nsh include macro usate dallo script di esempio LargeWindow.

## Funzioni

### nsResize::SetRTL

```nsis
nsResize::SetRTL $(^RTL)
```

Abilita o disabilita la modalità da destra a sinistra. Necessario solo quando si usa nsResize::Set.

### nsResize::Set

```nsis
nsResize::Set control_HWND x y width height
```

Imposta le nuove coordinate X e Y e le nuove dimensioni di un controllo. Stringa vuota per x o y = non spostare. Stringa vuota per width o height = non ridimensionare.

### nsResize::Add

```nsis
nsResize::Add control_HWND x y width height
```

Aggiunge i valori X, Y, width e height. Per lingue da destra a sinistra è necessaria una gestione speciale.

### nsResize::Top

```nsis
nsResize::Top control_HWND
```

Sposta un controllo in cima all'ordine Z.

### nsResize::GetPos

```nsis
nsResize::GetPos control_HWND
Pop $X
Pop $Y
```

Ottiene la posizione del controllo in unità dialogo relative alla finestra padre.

### nsResize::GetPosPx

```nsis
nsResize::GetPosPx control_HWND
Pop $X
Pop $Y
```

Ottiene la posizione del controllo in pixel relative alla finestra padre.

### nsResize::GetSize

```nsis
nsResize::GetSize control_HWND
Pop $Width
Pop $Height
```

Ottiene le dimensioni del controllo in unità dialogo.

### nsResize::GetSizePx

```nsis
nsResize::GetSizePx control_HWND
Pop $Width
Pop $Height
```

Ottiene le dimensioni del controllo in pixel.

## Licenza

Questo plug-in viene fornito 'così com'è', senza alcuna garanzia esplicita o implicita. In nessun caso l'autore sarà responsabile per danni derivanti dall'uso di questo plug-in.

È concessa l'autorizzazione a chiunque di usare questo plug-in per qualsiasi scopo, incluse applicazioni commerciali, e di modificarlo e ridistribuirlo liberamente, soggetto alle seguenti restrizioni:

1. L'origine di questo plug-in non deve essere travisata; non si può affermare di avere scritto il plug-in originale.
2. Le versioni alterate devono essere chiaramente contrassegnate come tali.
3. Questo avviso non può essere rimosso o alterato da alcuna distribuzione.

---

## ⚠️ Differenze nella versione personale

Questa versione include le seguenti modifiche rispetto alla distribuzione originale:

### Nuova architettura supportata: x64 (amd64-unicode)

L'originale supportava solo:
- x86-ansi
- x86-unicode

La versione personale aggiunge il supporto per:
- **amd64-unicode** (x64)

### Progetto Visual Studio

L'originale includeva:
- `Contrib/nsResize/nsResize.sln` - Solution VS2012
- `Contrib/nsResize/nsResize.vcxproj` - Progetto VS2012 (solo x86)

La versione personale aggiorna a VS2022 con supporto x64:
- `Src/nsResize.sln` - Solution VS2022
- `Src/nsResize.vcxproj` - Progetto VS2022 (x86-ansi, x86-unicode, amd64-unicode)

### Struttura cartelle modificata

I file sorgenti sono stati spostati da `Contrib/nsResize/` a `Src/` per una struttura più pulita.

### File aggiunti

- `build_plugin.py` - Script Python per compilare il plugin per tutte le architetture
- `Src/api.h` - Header API NSIS
- `Src/pluginapi.c` / `Src/pluginapi.h` - API plugin NSIS
- `Src/nsis_tchar.h` - Header per supporto TCHAR
- `Src/nsis_unicode/pluginapi_x64.lib` - Libreria plugin API per x64
- `Src/build_pluginapi_x64.cmd` / `Src/build_pluginapi_x86.cmd` - Script per compilare plugin API
- `Examples/nsResize/*.exe` - Esempi compilati

### Compilazione

```powershell
python build_plugin.py                  # Compila tutte le architetture
python build_plugin.py --config x86-unicode      # Solo un'architettura (x86-ansi|x86-unicode|amd64-unicode|all)
python build_plugin.py --toolset 2026            # Toolset specifico (2022|2026|auto)
python build_plugin.py --jobs 4                  # Numero di job MSBuild paralleli (default: CPU count)
python build_plugin.py --clean                   # Pulizia dist/ prima della build
python build_plugin.py --install-dir "C:\NSIS\Plugins"  # Copia in directory NSIS aggiuntiva
python build_plugin.py --verbose                 # Output MSBuild esteso
python build_plugin.py --version                 # Stampa versione ed esce
```

I DLL vengono copiati in `dist/{platform}/nsResize.dll`.

### File rimossi

I file DLL precompilati sono stati rimossi dalla distribuzione:
- `Plugins/nsResize.dll`
- `Unicode/Plugins/nsResize.dll`

I DLL vengono generati dalla compilazione e copiati in `plugins/{platform}/`.

---

*See [README.md](README.md) for the English version.*
