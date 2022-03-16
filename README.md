# Terraform 101

* General Terraform training documentation. This should be used in collaboration with other presentation documentation for internal and external purposed.
* The Terraform command line tool is available for MacOS, FreeBSD, OpenBSD, Windows, Solaris and Linux.
* The Terraform language is designed to be both human and machine-readable.
* Most modern code editors support Terraform syntax highlighting.


## 👋 Getting to Know Terraform
* Let's start with some basic Terraform commands. Run the following commands on the "Shell" tab.
* Check the version of Terraform running on your machine:

```
terraform version
```

* You can always get help if you're curious about command syntax:

```
terraform --help
```

* Terraform runs on Windows, OSX, or Linux. You can install it on your laptop or on a cloud based workstation.


## 🔐 Connecting Terraform to AWS
* In order to authenticate to AWS and build resources, Terraform requires you to provide a set of credentials, backed by an appropriate IAM policy.
* For your environment, we have prepared some temporary AWS credentials and stored them as environment variables. Terraform will automatically read and use the environment variables that are configured in your shell environment.
* Run the following commands on the "Shell" tab:

```
echo $AWS_ACCESS_KEY_ID
echo $AWS_SECRET_ACCESS_KEY
```
* You should see valid AWS keys. If not, return to the track home page by clicking the Close button, stop the track, and then restart it.
* Do not ever store your credentials in source code files, as they can be accidentally exposed or copied to a public repository.
* Terraform will read anything in the current directory that ends in *.tf or *.tfvars.
* By convention most Terraform workspaces will contain main.tf, variables.tf, and outputs.tf files.

* You can also group your Terraform code into files by purpose. For example, you might place all your load balancer configuration code into a file called load_balancer.tf.


## 👨‍💻 What does Terraform code look like?
* We've downloaded some Terraform code onto your workstation. Run the following command to see the Terraform code files:
```
ls *.tf
```
* The same files are visible in the file explorer pane on the left. Terraform files are marked with the purple T icon.

* Terraform code always ends with a .tf extension. You can have as many Terraform files as you want, but these three are commonly created first:

```
main.tf - Where most of your Terraform code is stored. This is the part that does the building of resources.
variables.tf - Use this file to define which variables will be available to your users.
outputs.tf - This file contains outputs that will be shown at the end of a successful Terraform run.
```

* Files that end in anything other than *.tf or *.tfvars are ignored by Terraform.
* The Terraform core program isn't very useful by itself. Terraform needs the help of a provider to be able to talk to cloud APIs. Terraform has hundreds of different providers. You can browse the provider list here:
* https://registry.terraform.io/browse/providers
* Today we'll be using a few different providers, but the main one is the aws provider.


## 🏡 Terraform Init - Install the Providers
* We have downloaded some Terraform code for the Git repo . We'll be using this source code for the rest of the track.
* Before we can do anything with Terraform we need to initialize our workspace. Run the following command in your "Shell" tab:
```
terraform init 
```
* The terraform init command scans your Terraform code, identifies any providers that are needed, and downloads them.

* Run the following command to verify that the aws provider was installed under the ".terraform" directory:


## 👩‍⚖️ Terraform Validate - Test Your Code
* Terraform comes with a built-in subcommand called validate. This is useful when you want to do a quick syntax check of your code to make sure it parses correctly.
* Validate your code:
```
terraform validate
```

* terraform validate is most often used in automated CI/CD test pipelines. It allows you to quickly catch errors in your code before any other steps are taken.
* terraform plan allows you to preview any changes to your environment in a safe way.
* This can help you identify any unexpected changes before you deploy them, not after they are already built.


## 🤔 Terraform Plan - Dry Run Mode
* Run the terraform plan command:

```
terraform plan 
```

## 📈 Terraform Graph
* Try running the terraform graph command:

```
terraform graph
```

* This generates code that can be used to create a visual map of your infrastructure. The graph data is in DOT graph description language format. There are several graphing tools you can use to visualize this data, including the free Blast Radius tool. You can learn more about Blast Radius here:
* https://28mm.github.io/blast-radius-docs/
* https://github.com/28mm/blast-radius

* Start up a Blast Radius server with the following command:
```
blast-radius --serve .
```

* Now switch to the Terraform Graph tab to view the infrastructure graph. If the web page is blank, you may need to click the refresh icon (which looks like a circular arrow)
* Explore the Terraform graph for your infrastructure. Dependencies are automatically mapped out for you. This graph was generated using the free Blast Radius tool.

* NOTE: Due to a known bug you may not be able to drag and zoom the graph. The main point of this exercise is to see how terraform maps out complex infrastructure. So don't worry if your graph doesn't show color.
* Terraform uses this graph to determine which resources can be built in parallel for maximum efficiency.
* By default, the terraform apply command runs a Terraform plan to show you what changes it wants to make.
* Terraform maps out all the changes it needs to make before applying them.


## 👨‍💻 Terraform Plan and Terraform Apply
* Now that we've configured our required variables we can apply our changes.
* Run the terraform plan command first to see what will happen:

```
terraform plan
```

* Then run terraform apply and watch your resources being built.


## Idempotent
* Terraform is an idempotent application.
* Idempotence is the property of certain operations in mathematics and computer science whereby they can be applied multiple times without changing the result beyond the initial application.
* https://en.wikipedia.org/wiki/Idempotence

