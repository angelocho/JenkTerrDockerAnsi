variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
  }))
  default = [
    {
      internal = 22
      external = 2222
    }
  ]
}

variable "docker_image_name" {
  type = string
  default = "angelocho/ubuntu-serverssh"
}
variable "docker_image_version" {
  type = string
  default = ":v1"
}
variable "docker_container_name" {
  type = string
  default = "ubuntu-ssh-python3.11"
}