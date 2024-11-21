output "mongodb_cluster_name" {
  description = "MongoDB Atlas Cluster Name"
  value       = regex("mongodb\\+srv://(.*)\\.mongodb\\.net", mongodbatlas_cluster.cluster.connection_strings[0].standard_srv)[0]
  sensitive   = true
}