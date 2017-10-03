#!/bin/bash
echo "Looking for user1 from both backends"
vagrant ssh ldapclient -c "getent passwd" | grep user1
