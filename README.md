# Bitbucket Notification To Jenkins

This Hubot script supports all movements of Bitbucket!!

## Supporting
- Repository Events
    + Push

## Installation

In your hubot directory, run:

`npm install bitbucket2jenkins --save`

To enable a script, add the following to the external-scripts.json

```json
["bitbucket2jenkins"]
```

## Configuration

### Bitbucket Add webhook

`https://bitbucket.org/{owner_name}/{repository_name}/admin/addon/admin/bitbucket-webhooks/bb-webhooks-repo-admin`

- Set following URL

`{hubot_url}/bitbucket2jenkins`  
(exampleURL: `http:example.com:8080/bitbucket2jenkins`)

### Two ways to configure the notification destination

- Get params(**priority**)  
`http:example.com:8080/bitbucket2jenkins?branch=develop&token=TOKEN=&job=JOBTAG`

- Enviroment variable  
`export HUBOT_JENKINS_URL=https://your.jenkins-url.com`

