variable "cluster_name" {
  description = "Cluster name"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the cluster"
  type        = list(string)
}

variable "security_group_ids" {
    description = "List of security group IDs"
    type        = list(string)
}

variable "base_tags" {
  description = "Map of base tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "k8s_version" {
    description = "Version of kubernetes to deploy"
    type        = string
    default     = "1.22"
}

variable "desired_size" {
    description = "Desired size of the eks node group"
    type        = number
    default     = 1
}

variable "max_size" {
    description = "Maximum allowed size of the eks node group"
    type        = number
    default     = 2
}

variable "min_size" {
    description = "Minimum allowed size of the eks node group"
    type        = number
    default     = 1
}

variable "instance_types" {
    description = "Instance types for node group"
    type        = list(string)
    default     = ["t3.medium"]
}
