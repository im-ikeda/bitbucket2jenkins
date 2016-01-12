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
    query = querystring.parse(req._parsedUrl.query)
    { branch, token, job } = query
    { branch } = config unless branch?
    console.log(req);
    { body } = req
  
    console.log(body);
  
    event_type = req.get 'X-Event-Key'
    res.end "OK" if event_type != "repo:push"
  
    res.end "OK" if body.changes?.new?.name? != branch
  
    jenkinsurl = process.env.HUBOT_JENKINS_URL
  
    robot.http("{#jenkinsurl}/job/{#job}/build?token={#token}").get(err, res, body) ->
      res.end "OK"
