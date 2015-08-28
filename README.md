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
hubot links `number` | links.list | Returns the last `number` links shared


## Sample Interaction

```
user1>> 
user1>> hubot links 1
hubot>> 
```
