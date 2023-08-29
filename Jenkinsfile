pipeline {
    agent any
    stages {
        stage("Clone Git Repository") {
            steps {
                git(
                    url: "https://github.com/dorra-ferah/TerraformExample.git",
                    branch: "master",
                    changelog: false,
                    poll: false
                )
            }
        }
        
         stage("terraform") {
            steps {
            //sh "rm -f terraform.tfstate terraform.tfstate.backup"
                sh "terraform init"
                sh "terraform plan"
                sh "terraform apply -auto-approve"
                sh"git add ."
                sh "git commit -m 'Add testfile from Jenkins Pipeline'"
            }
        }
        
    }
}
