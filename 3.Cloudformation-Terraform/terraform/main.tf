provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_security_group" "my_security_group" {
  depends_on      = [aws_vpc.my_vpc]
  vpc_id          = aws_vpc.my_vpc.id
  name            = "Opening port 80"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_ping" {
  depends_on      = [aws_vpc.my_vpc]
  vpc_id          = aws_vpc.my_vpc.id
  name            = "SG to test ping"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }
  ingress {
    from_port   = 8
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/24"]
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  tags = {
    Name = "InternetGateway"
  }
}

resource "aws_internet_gateway_attachment" "attach_gateway" {
  vpc_id             = aws_vpc.my_vpc.id
  internet_gateway_id = aws_internet_gateway.internet_gateway.id
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "eu-central-1c"
  map_public_ip_on_launch = true
}

resource "aws_instance" "my_ec2_instance" {
  key_name      = var.key_name
  instance_type = "t2.micro"
  ami           = "ami-06dd92ecc74fdfb36"
  subnet_id     = aws_subnet.public_subnet.id
}

resource "aws_db_instance" "my_db_instance" {
  allocated_storage    = 10
  identifier           = "mydbinstance"
  engine               = "mysql"
  username      = "admin"
  password      = "password"
  instance_class       = "db.t2.micro"
  multi_az             = false
  publicly_accessible = true
}

resource "aws_elb" "elastic_load_balancer" {
  name               = "my-elb"
  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }
  security_groups    = [aws_security_group.my_security_group.id]
  subnets            = [aws_subnet.public_subnet.id]
}

resource "aws_elasticache_subnet_group" "cache_subnet_group" {
  name        = "MyCacheSubnetGroup"
  description = "Subnet group for ElastiCache"
  subnet_ids  = [aws_subnet.public_subnet.id]
}

resource "aws_elasticache_cluster" "redis_cache_cluster" {
  engine                   = "redis"
  cluster_id               = "redis-cluster"
  node_type                = "cache.t2.micro"
  num_cache_nodes          = 1
  subnet_group_name        = aws_elasticache_subnet_group.cache_subnet_group.name
  security_group_ids       = [aws_security_group.my_security_group.id]
}

resource "aws_elasticache_cluster" "memcached_cache_cluster" {
  engine                   = "memcached"
  cluster_id               = "memcached-cluster"
  node_type                = "cache.t2.micro"
  num_cache_nodes          = 1
  subnet_group_name        = aws_elasticache_subnet_group.cache_subnet_group.name
  security_group_ids       = [aws_security_group.my_security_group.id]
}