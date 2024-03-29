[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat&logo=AdGuard)](LICENSE)
# ObjectScript syntax for GitLab

GitLab provides syntax [highlighting](https://docs.gitlab.com/ee/user/project/highlighting.html) on all files through the Rouge Ruby gem. It attempts to guess what language to use based on the file extension, which most of the time is sufficient.  

This a repository to test easily the current status of [rouge project fork](https://github.com/lscalese/rouge/tree/objectscript) to support ObjectScript syntax.  
It allows to have Ruby environment on docker ready for testing.  


For more information the community article is [available here](https://community.intersystems.com/post/objectscript-syntax-gitlab).


## Installation

Clone/git pull the repo into any local directory

```bash
git clone https://github.com/lscalese/objectscript-syntax-for-gitlab.git
```

Open the terminal in this directory and call the command to build and run InterSystems IRIS in container:


```bash
docker-compose build --no-cache
docker-compose up -d
```


## How to test

Open [http://localhost:9592/objectscript](http://localhost:9592/objectscript) to show the test page with an ObjectScript class sample.  

![](https://github.com/lscalese/objectscript-syntax-for-gitlab/blob/master/screen-1.png?raw=true)

You can put your own objectscript class by a simple copy/paste using this page : [http://localhost:9692/csp/irisapp/lscalese.objectscript4gitlab.test.cls](http://localhost:9692/csp/irisapp/lscalese.objectscript4gitlab.test.cls).  Click submit and the highlighted code will be open in a new page.  
Click reset to restore the default test page.  The login\password of the web application is the default _system \ SYS credential.

![](https://github.com/lscalese/objectscript-syntax-for-gitlab/blob/master/screen-2.png?raw=true)
