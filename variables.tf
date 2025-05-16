variable "region" {
  type        = string
  default     = "ir-thr-ba1"
  description = "Region for resource deployment"
}

variable "ssh_key_name" {
  type        = string
  default = "value"
  description = "Registered SSH key name"
}

variable "chosen_distro_name" {
  type        = string
  default     = "ubuntu"
  description = "Distro name (e.g. ubuntu)"
}

variable "chosen_name" {
  type        = string
  default     = "22.04"
  description = "Image release name (e.g. 22.04)"
}

variable "chosen_plan_id" {
  type        = string
  default     = "g2-4-2-0"
  description = "Plan ID for VM sizing"
}

variable "node_names" {
  type        = list(string)
  default     = ["controller", "compute1", "compute2"]
  description = "List of OpenStack node names"
}
