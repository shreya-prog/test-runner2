import subprocess

def generate_tfvars():
    # Example logic to generate Terraform variables
    with open("lambda_functions.auto.tfvars", "w") as f:
        f.write('aws_region = "us-east-1"\n')
        f.write('function_name = "my_lambda_function"\n')
    


def run_terraform():
    # Run Terraform commands
    subprocess.run(["terraform", "init"], check=True)
    subprocess.run(["terraform", "apply", "-auto-approve"], check=True)

if __name__ == "__main__":
    generate_tfvars()
    run_terraform()

print("Hello from the new test runner!")
