resource "local_file" "demofile" {
  filename = var.file_name
  content = "Hey, this is shreya and I'm doing terraweek challenge"
}
