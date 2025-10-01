#!/bin/bash

# You need to change the volume mount path to your local path
# In this example, I mount /Users/aiml/Documents/dev to /home/devuser/workspace
# Please change it to your local path
# e.g. -v /path/to/your/local/dir:/home/devuser/workspace
echo "Running Docker"
docker run -dit \
  --name ubuntu_miniconda \
  -v /Users/aiml/Documents/dev:/home/devuser/workspace \
  -w /home/devuser/workspace \
  ubuntu-miniconda \
  /bin/bash -l

# You need to change the password for devuser to use sudo
# Use the command passwd devuser
# You need to type the password twice
# Type exit to exit the container
echo "Change Password for devuser"
echo "You need to change password for the devuser, please use following command:"
echo "type: passwd devuser"
echo "set a password for devuser"
echo "type: exit when done"
echo ""
docker exec -it -u root ubuntu_miniconda /bin/bash
