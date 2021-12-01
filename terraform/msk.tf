resource "aws_msk_cluster" "example" {
  cluster_name = "demo-cluster-1"
  kafka_version = "2.6.2"
  number_of_broker_nodes = 2
  broker_node_group_info {
    instance_type = "kafka.m5.large"
    ebs_volume_size = 100
    client_subnets = [
      "subnet-143ac063",
      "subnet-c1e442a4"]
    security_groups = [
      "sg-0d278d68"]
  }
}