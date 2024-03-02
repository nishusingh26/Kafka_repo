# VPC Configuration
vpc-cidr = "172.18.0.0/16"
instance-tenancy = "default"
vpc-name = "kafka-vpc-01"

# Public Subnet Configuration
public-subnets-cidr = ["172.18.0.0/19","172.18.32.0/19" ]
subnets-azs = ["us-east-1a","us-east-1b"]
pub-sub-name = ["kafka-pub-sub-01","kafka-pub-sub-02"]

# Private Subnet Configuration
private-subnets-cidr = ["172.18.64.0/19","172.18.96.0/19"]
pri-sub-name = ["kafka-priv-sub-01","kafka-priv-sub-02"]

## Public SG
pub-sg-name = "public-sg1"
pub-sg-ports = [0]
cidr_blocks = ["0.0.0.0/0"]
public-sg-protocol = "-1"

## Private SG
pvt-sg-name = "private-sg1"
pvt-sg-ports = [22, 80, 443, 8080, 9092, 2181]
pvt_cidr_blocks = ["0.0.0.0/0"]

# Other Configuration
nat_name = "kafka-nat-01"
eip-domain = "vpc"
igw_name = "kafka-igw-01"
private-rt-name = "kafka-route-priv-01"
destination-cidr = "0.0.0.0/0"
public-rt-name = "public-route-pub-01"
existing_vpc_cidr_block = "10.0.0.0/16"

existing_vpc_route_table_id = "rtb-0d9e9df770fad8a6b"
new_vpc_cidr_block = "172.18.0.0/16"

ami-id = "ami-0c7217cdde317cfec"
instance-type = "t2.medium"
key-name = "kafka_new"
bastion-instance-name = "bastion"
private-instance-name = ["kafka-instance-01", "kafka-instance-02"]

## Target tg
target_group_name = "kafka-tg"
target_group_port = "8080"
target_group_protocol = "HTTP"
health_check_path = "/"
health_check_protocol = "HTTP"
health_check_port = "8080"
health_check_interval = "5"
health_check_timeout = "2"
health_check_healthy_threshold = "2"
health_check_unhealthy_threshold = "2"
listener_port = "80"
listener_protocol = "HTTP"


## ALB

alb_name = "kafka-alb"
internal = "false"


## vpc peering
peer_vpc_id = "vpc-00e59ad4b212fe57b"
peer_owner_id = "590183760755"
peering_tag = "kafka_vpc_peering"
auto_accept = true
accepter_allow_remote_vpc_dns_resolution = true
requester_allow_remote_vpc_dns_resolution = true
