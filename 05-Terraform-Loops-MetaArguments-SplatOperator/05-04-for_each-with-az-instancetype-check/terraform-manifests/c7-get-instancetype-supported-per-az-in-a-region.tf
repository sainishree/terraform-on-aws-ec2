# Get List of Availability Zones in a Specific Region
# Region is set in c1-versions.tf in Provider Block
# Datasource-1
data "aws_availability_zones" "my_azones" {
  filter {
    name = "opt-in-status"
    values = [ "opt-in-not-required" ]
  }
}

data  "aws_ec2_instance_type_offerings" "my_inst_type"{
  for_each =  for_each = toset(data.aws_availability_zones.my_azones.names)
  filter {
    name = "instance-type"
    values = ["t2.micro"]
  }
  filter {
    name = "location"
    values = [each.key]
  }
  location_type = "availability-zone"
}

output "output_v3_1"{
  value = { for az, details in data.aws_ec2_instance_type_offerings.my_inst_type2: az => details.instance_types
}
}