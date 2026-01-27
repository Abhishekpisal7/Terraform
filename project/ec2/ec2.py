import boto3

def create_ec2_instance():
     ec2 = boto3.resource("ec2" , region_name = "ap-south-1")
     instance = ec2.create_instances(
      ImageId = "ami-0d0ad8bb301edb745",
      InstanceType = "t2.micro",
      MinCount = 1,
      MaxCount = 1,
      KeyName = "newkey",
      SecurityGroups = ["default"]
    )
   
     print(f"Instance Id is : {instance[0].id} , {instance[1].id}")
     return [i.id for i in instance] 

def main():
     create_ec2_instance()
if __name__ =="__main__":
    main()

# import boto3

# ec2 = boto3.client('ec2')

# response = ec2.describe_availability_zones()
# print(response)
# for az in response['AvailabilityZones']:
#     print(az['ZoneName'])
# print('Availability Zones:', response['AvailabilityZones'])