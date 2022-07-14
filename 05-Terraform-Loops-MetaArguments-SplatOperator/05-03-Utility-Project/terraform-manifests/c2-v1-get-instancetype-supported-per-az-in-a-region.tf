# Data source

data "aws_ec2_instance_type_offerings" "my_inst_type1" {
  filter {
    name = "instance_type"
    values = [ "t2.micro" ]
  }
  filter {
    name = "location"
    values = [ap-south-1]
  }
  location_type = "availability_zone"
  
}

# Outputs
output "output_v1_1" {
  value = data.aws_ec2_instance_type_offerings.my_inst_type1.instance_types 
}

