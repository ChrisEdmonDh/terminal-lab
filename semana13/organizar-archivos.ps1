<#
.SYNOPSIS
Organiza archivos locales por extension y exporta un resumen.
.DESCRIPTION
Genera 50 archivos de prueba en mezcla/, los clasifica en organized/ segun su
extension y escribe un resumen por categoria en resumen.csv.
Autor: Cristian Choque Characayo
Fecha: 2026-10-26
Uso: pwsh ./organizar-archivos.ps1 [-WhatIf]
#>

[CmdletBinding(SupportsShouldProcess)]
param ()

Set-StrictMode -Version Latest

# Rutas relativas al propio script, no al directorio actual
$Base = $PSScriptRoot
$Mezcla = Join-Path $Base "mezcla"
$Dest = Join-Path $Base "organized"

# Se parte de cero en cada ejecucion: asi el resultado siempre es el mismo
# -WhatIf:$false porque la preparacion debe ocurrir incluso en un ensayo
if (Test-Path $Mezcla) { Remove-Item $Mezcla -Recurse -Force -WhatIf:$false }
New-Item -ItemType Directory -Path $Mezcla -WhatIf:$false | Out-Null

1..10 | ForEach-Object {
    New-Item -ItemType File -Path "$Mezcla/script$_.sh" -Value "# script $_" -Force -WhatIf:$false | Out-Null
    New-Item -ItemType File -Path "$Mezcla/nota$_.txt" -Value "nota $_" -Force -WhatIf:$false | Out-Null
    New-Item -ItemType File -Path "$Mezcla/foto$_.jpg" -Value "jpg $_" -Force -WhatIf:$false | Out-Null
    New-Item -ItemType File -Path "$Mezcla/evento$_.log" -Value "log $_" -Force -WhatIf:$false | Out-Null
    New-Item -ItemType File -Path "$Mezcla/doc$_.md" -Value "# doc $_" -Force -WhatIf:$false | Out-Null
}

Write-Output "Archivos generados: $((Get-ChildItem $Mezcla).Count)"
