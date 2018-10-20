provider "mysql" {
  endpoint = "0.0.0.0:33060"
  username = "root"
}

# resource "mysql_database" "sample" {
#   name = "my_sample_db"
#   default_character_set = "utf8mb4"
#   default_collation = "utf8mb4_general_ci"
# }

resource "mysql_user" "hfm" {
  user = "hfm"
  host = "%"
  plaintext_password = "samplehfmpassword"
}

resource "mysql_grant" "hfm" {
  user = "${mysql_user.hfm.user}"
  host = "%"
  database = "sample"
  privileges = ["ALL"]
}
