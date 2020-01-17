#!/bin/bash

ps -lu $(getent group | grep ^$1: | sed 's/.*:\(.*\)/\1/' | tr '\n' ',') 2>/dev/null || echo 'Selected group was not found'