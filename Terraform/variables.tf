variable "region" {
  type        = string
  default     = "ir-thr-ba1"
  description = "Region for resource deployment"
}

variable "ssh_key_name" {
  type        = string
  default = "AP"
  description = "Registered SSH key name"
}

variable "chosen_distro_name" {
  type        = string
  default     = "ubuntu"
  description = "Distro name (e.g. ubuntu)"
}

variable "chosen_name" {
  type        = string
  default     = "24.04"
  description = "Image release Version"
}

variable "chosen_plan_id" {
  type        = string
  default     = "g2-4-2-0"
  description = "Plan ID"
}

variable "node_names" {
  type        = list(string)
  default     = ["controller", "compute1", "compute2", "monitoring"]
  description = "List of OpenStack node names"
}
