param (
    [string]$repoPath = ""
)

if ($repoPath -eq "") {
    Write-Host "Nenhum diretório informado. Saindo..."
    exit
}

cd $repoPath

# Verifica se é um repositório Git
if (-not (Test-Path "$repoPath\.git")) {
    Write-Host "O diretório selecionado não é um repositório Git."
    exit
}

$branch = "main"
$commitMessage = "Auto commit: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

git add .
git commit -m "$commitMessage"
git push origin $branch

Write-Host "Commit e push concluídos com sucesso!"
