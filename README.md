# zhukovsd-cv

Based on [posquit0/Awesome-CV](https://github.com/posquit0/Awesome-CV)

[PDF](https://zhukovsd.github.io/zhukovsd-cv/cv.pdf)

| Page 1 | Page 2 |
|:---:|:---:|
| [![Résumé](https://zhukovsd.github.io/zhukovsd-cv/cv-0.png)](https://zhukovsd.github.io/zhukovsd-cv/cv.pdf)  | [![Résumé](https://zhukovsd.github.io/zhukovsd-cv/cv-1.png)](https://zhukovsd.github.io/zhukovsd-cv/cv.pdf) |

CI workflow:
- Jenkins runs a pipeline defined in [Jenkinsfile](Jenkinsfile)
- 'Build' stage runs [build.sh](build.sh) which compiles `.tex` to `.pdf` and renders `.pdf` pages to `.png`
- 'Deploy' stage runs [deploy.sh](deploy.sh) script which publishes resulting `.pdf` and `.png` files to [gh-pages branch](https://github.com/zhukovsd/zhukovsd-cv/tree/gh-pages)
