/*resource "aws_backup_vault" "webapp-vault" {
  name = "webapp-vault"
}
resource "aws_backup_plan" "webapp-backup-plan" {
  name = "webapp-backup-plan"
 
  rule {
    rule_name         = "webapp-backup-rule"
    target_vault_name = aws_backup_vault.webapp-vault.name
    schedule          = "cron(0 3 * * 6)"
    lifecycle {
      cold_storage_after = 90
      delete_after = 90
    }
  }
}*/
