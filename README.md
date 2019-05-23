# Lab Instructions


* Login to your workstation

    <table>
    
    <tr>
    <td>Cloud9 URL:</td>
    <td>https://user#.stackx.govtechstack.sg/ide.html</td>
    </tr>
    
    <tr>    
    <td>User ID:</td>
    <td>user#</td>
    </tr>
    
    <tr>
    <td>Password:</td>
    <td>password#</td>
    </tr>
    
    <tr>
    <td>Git URL:</td>
    <td>https://github.com/GovTechStackSG/stackx2019-terraform-basics</td>
    </tr>
    
    </table>
     
* Create a basic Terraform configuration

    ```bash
    mkdir terraform101
    cd terraform101
    ```

    * Initialise your first terraform file - `main.tf`
    * Create provider block for AWS

    ```hcl
    provider "aws" {
      #access_key = "PLEASE_NO_SECRETS_IN_YOUR_TF"
      #secret_key = "WHAT_DID_I_JUST_SAY"
      region     = "ap-southeast-1"
    }
    ```

* Initialize and apply the configuration (create infrastructure)

    * In the same Terraform configuration, main.tf , create an AWS instance with the ID web and the following:
        
        <table>
        
        <tr>
        <td>AMI ID:</td>
        <td>ami-0fa08c0a6b3f80751</pre></td>
        </tr>

        <tr>
        <td>Instance Type:</td>
        <td>t2.micro</td>
        </tr>

        <tr>
        <td>Tags:</td>
        <td>Name</td>
        </tr>
        
        </table>
        
        TIP: You need to start with a resource called `aws_instance`.
    
        ```hcl
        resource "aws_instance" "web" {
          ami           = "ami-0fa08c0a6b3f80751"
          instance_type = "t2.micro"
        
          tags = {
            Name = "user#-HelloStackX"
          }
        }
        ```
        
    * You must run terraform init after adding or removing providers.

        ```bash
        terraform init        
        ```
        
    * Run terraform plan to see what will happen.
     
         ```bash
         terraform plan
         ```
         
    * Run terraform apply to create resources on AWS.
     
         ```bash
         terraform apply
         ```
    * Run terraform show to get details of the resources you created on AWS.
     
         ```bash
         terraform show
         ```
         
    * Define useful output values that will be highlighted to the user when Terraform applies: IP addresses, usernames, generated keys.
     
        ```hcl
        output "public_ip" {
          value = "${aws_instance.web.public_ip}"
        }
        ```
        
    * Create a new output variable named "public_dns" which outputs the instance's public_dns attribute.
    
        ```hcl
        output "public_dns" {
          value = "${aws_instance.web.public_dns}"
        }
        ```

    * Run terraform refresh to pick up the new output values.
   
        ```bash
        terraform refresh
        ```                      

    * Use the terraform output command to query for: 
      * All outputs
        ```bash
        terraform output
        ```
      * A single output
        ```bash
        terraform output public_dns
        ping $(terraform output public_dns)
        ```
    
    * Define the parameterization of Terraform configurations, using variables.
      Create two variables in the Terraform configuration:      
      * region (default: ap-southeast-1)
          ```hcl
           variable "region" {
            type    = "string"
            default = "ap-southeast-1"
          }
          ```
      
      * label (no default value)
          ```hcl
          variable "label" {
            type = "string"
          }
          ```

    * Variables' values can be interpolated into a string using the “${var.<name>}” syntax
      ```hcl
      resource "aws_instance" "web" {
        ami           = "ami-0b5a47f8865280111"
        instance_type = "t2.micro"
      
        tags = {
          Name = "${var.label}-HelloStackX"
          Creator = "Cameron Huysmans"
          TTL = "8"
        }
      }
      ```

    * Replace the hard-coded values in main.tf file with references to the newly-defined variables using the interpolation syntax.
      ```hcl
        variable "region" {
          default = "ap-southeast-1"
        }
        variable "label" {
          default = "terraform101"
        }
        
        provider "aws" {
          region     = "${var.region}"
        }

       ```

    * Run terraform plan now that the variables are parameterized. Observe what happens.

         
* Change and re-apply the configuration
