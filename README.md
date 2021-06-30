# testflask-helm-repo

Sample helm Chart for a Flask Python Application on Openshift<br/>

## Pre-Requisites:<br/> 
- Helm Command Line

The Application being used is [testFlask](https://github.com/MoOyeg/testFlask.git)<br/>

## To run from Local Helm Charts
1 Clone this repo<br/>
2 Change directory into repo<br/>
3 Run a helm install of the Application Build in a namespace<br/>
e.g ``` helm install testflask-build ./charts/testflask-build-source/ --namespace appdev```<br/>
4 Run a helm install of the Application Deployment in a namespace <br/>
e.g ``` helm install testflask-deploy ./charts/testflask-deployment/ --namespace appdev```<br/>


## To run from Helm Repo
1 Add Helm Repo<br/>
```helm repo add testflask-repo https://mooyeg.github.io/testflask-helm-repo```<br/>
2 Update Helm Repos<br/>
```helm repo update```<br/>
3 Run a helm install of the Application Build in a namespace<br/>
e.g ```helm install testflask-build testflask-repo/testflask-build-source -n appdev```<br/>
4 Run a helm install of the Application Deployment in a namespace <br/>
e.g. ```helm install testflask-deploy testflask-repo/testflask-deployment -n appdev```<br/>

##To Uninstall
1 ```helm uninstall testflask-deploy -n appdev```<br/>
2 ```helm uninstall testflask-build -n appdev```<br/>
