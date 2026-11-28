# Semana 13 - Archivos, providers y datos

## Que hace

`organizar-archivos.ps1` genera 50 archivos de prueba en `mezcla/`, los
clasifica por extension en cinco categorias dentro de `organized/` y exporta un
resumen por categoria a `resumen.csv` con la cantidad de archivos y el total de
bytes. Admite `-WhatIf` para ensayar sin mover nada.

## Archivos

- `organizar-archivos.ps1` - script principal
- `resumen.csv` - resumen por categoria
- `README.md` - este archivo
- `mezcla/` y `organized/` - carpetas generadas, no se versionan

## Como se ejecuta

    cd semana13
    pwsh ./organizar-archivos.ps1 -WhatIf    # ensayo, no mueve nada
    pwsh ./organizar-archivos.ps1            # ejecucion real

## Que se aprendio

- `[CmdletBinding(SupportsShouldProcess)]` y el parametro comun `-WhatIf`.
- `$PSCmdlet.ShouldProcess` para proteger las operaciones destructivas.
- `-WhatIf` se hereda a los cmdlets internos: la preparacion lleva `-WhatIf:$false`.
- `$PSScriptRoot` y `Join-Path` para rutas independientes del directorio actual.
- `Group-Object Extension` y el uso de `.Group` para operar sobre cada grupo.
- `Export-Csv -NoTypeInformation` para producir un CSV limpio.
- `Set-StrictMode`, el equivalente de `set -u` en Bash.
- Los `.jpg` son archivos de texto con esa extension, no imagenes reales.

## Que quedo pendiente

Extension opcional: aceptar un parametro con la lista de extensiones a
clasificar, en lugar de tenerla fija en el `switch`.
