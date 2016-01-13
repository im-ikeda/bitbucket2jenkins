# Bitbucket Repo-Push Notification To Jenkins

This Hubot script supports repo:push event of Bitbucket.
Only for the push to the specified branch, you will be notified Jenkins.

## Supporting
- Repository Events
    + Push
- Branch specify

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

    + branch	branch name (default: master)
    + job	jenkins job name
    + token	jenkins job invoke token

- Enviroment variable  
`export HUBOT_JENKINS_URL=https://your.jenkins-url.com`
(Without the last slash)

