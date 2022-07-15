# Check if that respective Instance Type is supported in that Specific Region in list of availability Zones
# Get the List of Availability Zones in a Particular region where that respective Instance Type is supported
# Datasource
data  "aws_ec2_instance_type_offerings" "my_inst_type2"{
  for_each = toset(["ap-south-1a","ap-south-1b","ap-south-1c"])
  filter {
    name = "instance-type"
    values = ["t2.micro"]
  }
  filter {
    name = "locatioin"
    values = [each.key]
  }
  location_type = "availability-zone"
}

# Outputs
output "output_v2_1" {
  value = toset([for i in data.aws_ec2_instance_type_offerings.my_inst_type2: i.instance_types])

}
