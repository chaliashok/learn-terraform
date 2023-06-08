variable "sample" {
  default = 100
}

variable "sample1" {
  default = "Hello World"
}

output "sample" {
  value = var.sample
}

output "sample1" {
  value = var.sample1
}

output "sample-txt" {
  value = "value of sample - ${var.sample1}"
}

#Plain variable declaration
variable "course" {
  default = "DevOps Training"
}
#List variable declaration
variable "courses" {
  default = [
  "devops",
  "Aws",
  "python"
  ]
}

#map variable declaration

variable "cour_detail" {
  default = {
    devops= {
      name = "Devops"
      Batch = 73
      Time = 10
    }
    aws = {
      name = aws
      batch = 90
      time = 11
    }
  }
}