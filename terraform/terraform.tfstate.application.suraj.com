{
  "version": 4,
  "terraform_version": "1.3.5",
  "serial": 3,
  "lineage": "974b89a8-ff9e-d162-98a4-24c45110aad1",
  "outputs": {},
  "resources": [
    {
      "module": "module.ec2-server",
      "mode": "managed",
      "type": "aws_instance",
      "name": "ec2_instance",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "index_key": 0,
          "schema_version": 1,
          "attributes": {
            "ami": "ami-0f5ee92e2d63afc18",
            "arn": "arn:aws:ec2:ap-south-1:264511188693:instance/i-081f2952000ace576",
            "associate_public_ip_address": true,
            "availability_zone": "ap-south-1b",
            "capacity_reservation_specification": [
              {
                "capacity_reservation_preference": "open",
                "capacity_reservation_target": []
              }
            ],
            "cpu_core_count": 2,
            "cpu_options": [
              {
                "amd_sev_snp": "",
                "core_count": 2,
                "threads_per_core": 1
              }
            ],
            "cpu_threads_per_core": 1,
            "credit_specification": [
              {
                "cpu_credits": "standard"
              }
            ],
            "disable_api_stop": false,
            "disable_api_termination": true,
            "ebs_block_device": [],
            "ebs_optimized": false,
            "enclave_options": [
              {
                "enabled": false
              }
            ],
            "ephemeral_block_device": [],
            "get_password_data": false,
            "hibernation": false,
            "host_id": "",
            "host_resource_group_arn": null,
            "iam_instance_profile": "",
            "id": "i-081f2952000ace576",
            "instance_initiated_shutdown_behavior": "stop",
            "instance_lifecycle": "",
            "instance_market_options": [],
            "instance_state": "running",
            "instance_type": "t2.medium",
            "ipv6_address_count": 0,
            "ipv6_addresses": [],
            "key_name": "terraform_test",
            "launch_template": [],
            "maintenance_options": [
              {
                "auto_recovery": "default"
              }
            ],
            "metadata_options": [
              {
                "http_endpoint": "enabled",
                "http_put_response_hop_limit": 1,
                "http_tokens": "optional",
                "instance_metadata_tags": "disabled"
              }
            ],
            "monitoring": false,
            "network_interface": [],
            "outpost_arn": "",
            "password_data": "",
            "placement_group": "",
            "placement_partition_number": 0,
            "primary_network_interface_id": "eni-09ce78ba3e8ccb24d",
            "private_dns": "ip-172-31-3-236.ap-south-1.compute.internal",
            "private_dns_name_options": [
              {
                "enable_resource_name_dns_a_record": false,
                "enable_resource_name_dns_aaaa_record": false,
                "hostname_type": "ip-name"
              }
            ],
            "private_ip": "172.31.3.236",
            "public_dns": "ec2-13-126-207-175.ap-south-1.compute.amazonaws.com",
            "public_ip": "13.126.207.175",
            "root_block_device": [
              {
                "delete_on_termination": true,
                "device_name": "/dev/sda1",
                "encrypted": false,
                "iops": 3000,
                "kms_key_id": "",
                "tags": null,
                "throughput": 125,
                "volume_id": "vol-0096d0019fe5b2972",
                "volume_size": 30,
                "volume_type": "gp3"
              }
            ],
            "secondary_private_ips": [],
            "security_groups": [
              "application.suraj.com-sg"
            ],
            "source_dest_check": true,
            "spot_instance_request_id": "",
            "subnet_id": "subnet-033f2276319b6ebfe",
            "tags": {
              "Creation_date": "2023-07-05",
              "Name": "application.suraj.com"
            },
            "tags_all": {
              "Creation_date": "2023-07-05",
              "Name": "application.suraj.com"
            },
            "tenancy": "default",
            "timeouts": null,
            "user_data": null,
            "user_data_base64": "IyEvYmluL2Jhc2gKc3VkbyBob3N0bmFtZWN0bCBzZXQtaG9zdG5hbWUgYXBwbGljYXRpb24uc3VyYWouY29tCg==",
            "user_data_replace_on_change": false,
            "volume_tags": null,
            "vpc_security_group_ids": [
              "sg-0c2f0c189d490b507"
            ]
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMCwidXBkYXRlIjo2MDAwMDAwMDAwMDB9LCJzY2hlbWFfdmVyc2lvbiI6IjEifQ==",
          "dependencies": [
            "module.ec2-server.aws_security_group.ec2_sg"
          ]
        }
      ]
    },
    {
      "module": "module.ec2-server",
      "mode": "managed",
      "type": "aws_security_group",
      "name": "ec2_sg",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:ap-south-1:264511188693:security-group/sg-0c2f0c189d490b507",
            "description": "abc.com-sg(Managed by Terraform)",
            "egress": [
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "",
                "from_port": 0,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "-1",
                "security_groups": [],
                "self": false,
                "to_port": 0
              }
            ],
            "id": "sg-0c2f0c189d490b507",
            "ingress": [
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "",
                "from_port": 22,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [],
                "self": false,
                "to_port": 22
              },
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "",
                "from_port": 443,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [],
                "self": false,
                "to_port": 443
              },
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "",
                "from_port": 80,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [],
                "self": false,
                "to_port": 80
              },
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "",
                "from_port": 8,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "icmp",
                "security_groups": [],
                "self": false,
                "to_port": 0
              }
            ],
            "name": "application.suraj.com-sg",
            "name_prefix": "",
            "owner_id": "264511188693",
            "revoke_rules_on_delete": false,
            "tags": null,
            "tags_all": {},
            "timeouts": null,
            "vpc_id": "vpc-06e17328293dcd49c"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6OTAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0="
        }
      ]
    }
  ],
  "check_results": null
}
