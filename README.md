# hubot-links

[![Build Status](https://travis-ci.org/ClaudeBot/hubot-links.svg)](https://travis-ci.org/ClaudeBot/hubot-links)
[![devDependency Status](https://david-dm.org/ClaudeBot/hubot-links/dev-status.svg)](https://david-dm.org/ClaudeBot/hubot-links#info=devDependencies)

A Hubot script for keeping track of what's been shared.

See [`src/hubot-links.coffee`](src/hubot-links.coffee) for full documentation.


## Installation via NPM

1. Install the **hubot-links** module as a Hubot dependency by running:

    ```
    npm install --save hubot-links
    ```

2. Enable the module by adding the **hubot-links** entry to your `external-scripts.json` file:

    ```json
    [
        "hubot-links"
    ]
    ```

3. Run your bot and see below for available config / commands


## Commands

Command | Listener ID | Description
--- | --- | ---
hubot links clear | `links.clear` | Clears all tracked links
hubot links list `[number]` | `links.list` | Returns the last 5 (or `number` if specified) links shared


## Sample Interaction

```
user1>> https://www.fyianlai.com/
user1>> https://github.com/ClaudeBot/hubot-links
user1>> hubot links list 1
hubot>> https://github.com/ClaudeBot/hubot-links
user1>> hubot links clear
hubot>> user1: Cleared all tracked links.
```
