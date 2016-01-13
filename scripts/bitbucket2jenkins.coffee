# Description:
#   bitbucket to Jenkins
#
# Configuration:
#   MUST: (Enviroment Variable)
#     HUBOT_JENKINS_URL
#   OPTION:
#   (Enviroment Variable)
#     HUBOT_BITBUCKET2JENKINS_BRANCH	(default: master)
#   (GET params)
#     branch	(optional)
#     job	(required)
#     token	(required)
#     http:.../bitbucket2jenkins?branch=develop&token=xxxxxx
#     ...etc
#
#     - GET params is priority than Enviroment Variable
#
# Author:
#   t_ikeda

querystring = require('querystring')

module.exports = (robot) ->

  config =
    branch: process.env.HUBOT_BITBUCKET2JENKINS_BRANCH || "master"

  robot.router.post "/bitbucket2jenkins", (req, res) ->
    body = JSON.parse req.body.payload

    query = querystring.parse(req._parsedUrl.query)
    { branch, token, job } = query
    { branch } = config unless branch?

    event_type = req.get 'X-Event-Key'
    res.end "OK(not repo:push)" if event_type != "repo:push"
  
    pushbranch = body.push.changes[0].new.name;
    res.end "OK(branch(#{pushbranch}) is not #{branch})" if pushbranch != branch
  
    jenkinsurl = process.env.HUBOT_JENKINS_URL;

    robot.http("#{jenkinsurl}/job/#{job}/build?token=#{token}")
      .get() (e, r, b) ->
        res.end "OK(#{e}:#{r})"
