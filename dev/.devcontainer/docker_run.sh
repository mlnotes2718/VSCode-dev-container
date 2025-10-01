echo "Running Docker"
docker run -dit \
  --name ubuntu_miniconda \
  -v /Users/aiml/Documents/dev:/home/devuser/workspace \
  -w /home/devuser/workspace \
  ubuntu-miniconda \
  /bin/bash -l

echo "Change Password for devuser"
echo "You need to change password for the devuser, please use following command:"
echo "type: `passwd devuser`"
echo "set a password for devuser"
echo "type: `exit` when done"
echo ""
docker exec -it -u root ubuntu_miniconda /bin/bash
