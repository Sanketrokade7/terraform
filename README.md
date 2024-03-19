terraform code will do the following:
creating vpc
creating 4 subnets (2 private 2 public )
creating 3 route table
creating internet gateway
attaching internet gateway to vpc
creating 2 nat-gateways in public subnets
associating route tables with subnets
creating a jump server (in public subnet)
creating a main server(in private subnet)
to check all infra is set up perfectly ssh to private server via jump server and ping 8.8.8.8
