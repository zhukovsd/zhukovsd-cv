# zhukovsd-cv

Based on [posquit0/Awesome-CV](https://github.com/posquit0/Awesome-CV)

CI workflow:
- Jenkins runs pipeline defined in [Jenkinsfile](Jenkinsfile)
- 'Build' stage consists in executing `sh 'xelatex cv.tex'`
- 'Deploy' stage runs [deploy.sh](deploy.sh) script which publishes compiled PDF to [gh-pages branch](https://github.com/zhukovsd/zhukovsd-cv/tree/gh-pages)
