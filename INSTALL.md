# Installation

## DB Setup

Import symphony.sql into a mysql server

Add database details to symphony/symphony/config.php

## Log in

username: admin
password: password

Change password

## Run node

Node will need a start up script something like:

```
#!/bin/bash

SYMPHONY_URL='http://cms.domain.com' \
PORT=80 \
node app.server.js
```
