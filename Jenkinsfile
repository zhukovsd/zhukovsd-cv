pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh '''
	  chmod a+x build.sh
	  bash $WORKSPACE/build.sh
	'''
      }
    }
    stage('deploy') {
      steps {
        sh '''
	  chmod a+x deploy.sh
	  bash $WORKSPACE/deploy.sh
	'''
      }
    }	
  }
}
