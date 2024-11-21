output "mongodb_connection_string" {
  description = "MongoDB Atlas Connection String"
  value       = mongodbatlas_cluster.cluster.connection_strings[0].standard_srv
  sensitive   = true
}

output "mongodb_cluster_host" {
  description = "MongoDB Atlas Cluster Host"
  value       = mongodbatlas_cluster.cluster.connection_strings[0].standard
  sensitive   = true
}