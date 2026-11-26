<#
.SYNOPSIS
Analisis de un registro de acceso web usando objetos.
.DESCRIPTION
Convierte cada linea de acceso.log en un objeto con propiedades y responde
cuatro preguntas agrupando y filtrando esos objetos.
Autor: Cristian Choque Characayo
Fecha: 2026-10-12
Uso: pwsh ./analizar-datos.ps1 [-Log <ruta>]
#>
param(
    [string]$Log = "acceso.log"
)
Write-Output "=== Analisis de $Log ==="
Write-Output ""
