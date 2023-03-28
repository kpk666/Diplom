folder('project') {
    description('<div style="border-radius:10px; text-align: center; font-size:120%; padding:15px; background-color: powderblue;">Project management folder</div>')
}

pipelineJob('project/project_deploy') {
    description('<div style="border-radius:10px; text-align: center; font-size:120%; padding:15px; background-color: powderblue;">Create structure and deploy project pipeline</div>')
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('kpk666/Diplom', 'ssh')
                        credentials('github_ssh')
                    }
                    branch('master')
                }
            }
            scriptPath('terraform/structure/jenkinsfile_create')
        }
    }
}

pipelineJob('project/project_destroy') {
    description('<div style="border-radius:10px; text-align: center; font-size:120%; padding:15px; background-color: powderblue;">Remove project</div>')
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('kpk666/Diplom', 'ssh')
                        credentials('github_ssh')
                    }
                    branch('master')
                }
            }
            scriptPath('terraform/structure/jenkinsfile_destroy')
        }
    }
}
