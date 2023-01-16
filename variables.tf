variable "unique_string" {
  default = "${random_string.random_string.result}"
  type = string
}
