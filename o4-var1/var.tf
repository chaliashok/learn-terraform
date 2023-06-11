variable "sample" {
  default = 100
}
variable "sample1" {
  default="hello world"
}
output "sample" {
  value = var.sample
}
output "sample1" {
  value = var.sample1
}
output "sample-exe" {
  value = "value of sample - ${var.sample}"
}
#list
variable "courses" {
  default = [
  "Aws",
  "python",
  "Devops"
  ]
}
#map
variable "course_details" {
  default = {
    Devops = {
      name     = "devops"
      time     = "10:00 AM"
      duration = "90days"
    }
    Aws = {
      name     = "Aws"
      time     = "11:00 AM"
      duration = "90days"
    }
  }
}

output "courses" {
  value = var.courses
}
output "course_details" {
  value = var.course_details
}