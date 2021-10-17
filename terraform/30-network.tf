// ----------- VPC -----------
resource "aws_vpc" "test_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags                 = merge(local.tags, { "Name" = "fr-${local.tags["wavestone:project"]}-vpc-${var.environment}" })
}

// ----------- Subnet -----------
resource "aws_subnet" "test_subnet" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = var.subnet_availability_zone
  tags                    = merge(local.tags, { "Name" = "fr-${local.tags["wavestone:project"]}-subnet-${var.environment}" })
}

// ----------- Internet Gateway -----------
resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.test_vpc.id
  tags   = merge(local.tags, { "Name" = "fr-${local.tags["wavestone:project"]}-igw-${var.environment}" })
}

// ----------- Route table -----------
resource "aws_route_table" "test_route_table" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_igw.id
  }

  tags = merge(local.tags, { "Name" = "fr-${local.tags["wavestone:project"]}-route-table-${var.environment}" })
}

resource "aws_route_table_association" "test_route_association" {
  subnet_id      = aws_subnet.test_subnet.id
  route_table_id = aws_route_table.test_route_table.id
}