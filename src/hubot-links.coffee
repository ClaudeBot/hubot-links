# Description
#   A Hubot script for keeping track of what's been shared.
#
# Configuration:
#   None
#
# Commands:
#   hubot links <number> - Returns the last <number> links shared
#
# Notes:
#   None
#
# Author:
#   MrSaints

URL_REGEXP = /(?:(?:ht|f)tp(?:s?)\:\/\/|~\/|\/)?(?:\w+:\w+@)?((?:(?:[-\w\d{1-3}]+\.)+(?:com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|edu|co\.uk|ac\.uk|it|fr|tv|museum|asia|local|travel|[a-z]{2}))|((\b25[0-5]\b|\b[2][0-4][0-9]\b|\b[0-1]?[0-9]?[0-9]\b)(\.(\b25[0-5]\b|\b[2][0-4][0-9]\b|\b[0-1]?[0-9]?[0-9]\b)){3}))(?::[\d]{1,5})?(?:(?:(?:\/(?:[-\w~!$+|.,=]|%[a-f\d]{2})+)+|\/)+|\?|#)?(?:(?:\?(?:[-\w~!$+|.,*:]|%[a-f\d{2}])+=?(?:[-\w~!$+|.,*:=]|%[a-f\d]{2})*)(?:&(?:[-\w~!$+|.,*:]|%[a-f\d{2}])+=?(?:[-\w~!$+|.,*:=]|%[a-f\d]{2})*)*)*(?:#(?:[-\w~!$ |\/.,*:;=]|%[a-f\d]{2})*)?/i;

module.exports = (robot) ->
    _links = []

    robot.respond /links (\d+)/i, id: "links.list", (res) ->
        response = ""
        for link, i in _links.slice(0).reverse()
            break if i is 5
            continue if res.message.user.room isnt link[1]
            response += link[3] + " \n"
        res.send response

    robot.hear URL_REGEXP, id: "links.record", (res) ->
        user = res.message.user
        _links.push [user.name, user.room, new Date(), res.match[0]]