resource "aws_elasticache_cluster" "elasticcache" {
  cluster_id           = "${var.env}-elasticcache"
  engine               = var.engine
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.main.name
  tags = merge(
    var.tags,
    { Name = "${var.env}-subnet-group"}
  )
}

resource "aws_elasticache_subnet_group" "main" {
  name       = "${var.env}-rds"
  subnet_ids = var.subnet_ids
  tags = merge(
    var.tags,
    { Name = "${var.env}-subnet-group"}
  )
}