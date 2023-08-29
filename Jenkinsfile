pipeline {
    agent any
    stages {
        stage("Clone Git Repository") {
            steps {
                git(
                    url: "https://github.com/dorra-ferah/TerraformExample.git",
                    branch: "ansible",
                    changelog: false,
                    poll: false
                )
            }
        }
        
         stage("ansible") {
            steps {
                sh "ansible all -m ping -v"
                sh "ansible-playbook playbook.yaml --extra-vars ansible_sudo_pass=123456"
                
               
            }
        }
        
    }
}
