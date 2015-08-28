# Description
#   A Hubot script for keeping track of what's been shared.
#
# Configuration:
#   None
#
# Commands:
#   hubot links clear - Clears all tracked links
#   hubot links list [<number>] - Returns the last 5 (or <number> if specified) links shared
#
# Notes:
#   None
#
# Author:
#   MrSaints

URL_REGEXP = /((https?|ftp):\/\/|www\.)[^\s\/$.?#].[^\s]*/i

module.exports = (robot) ->
    _links = []

    robot.respond /links clear/i, id: "links.clear", (res) ->
        _links = []
        res.reply "Cleared all tracked links."

    robot.respond /links list\s?(\d*)/i, id: "links.list", (res) ->
        response = ""
        limit = if res.match[1] > 0 then ~~(res.match[1]) else 5

        for link, i in _links.slice(0).reverse()
            break if i is limit
            continue if res.message.user.room isnt link[1]
            dateObj = new Date(link[2])
            date = "#{dateObj.getHours()}:#{dateObj.getMinutes()} #{dateObj.getDate()}-#{dateObj.getMonth()}-#{dateObj.getFullYear()}"
            response += "[#{link[0]} on #{date}] #{link[3]} \n"

        if response.length > 0
            res.send response
        else
            res.reply "Nothing has been shared recently."

        # Prevent scripts like hubot-youtube-info from executing
        res.finish()

    robot.hear URL_REGEXP, id: "links.track", (res) ->
        user = res.message.user
        _links.push [user.name, user.room, new Date(), res.match[0]]