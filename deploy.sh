openssl aes-256-cbc -K $encrypted_88abb8ca27c9_key -iv $encrypted_88abb8ca27c9_iv -in deploy_key.enc -out ./deploy_key -d
eval "$(ssh-agent -s)"
chmod 600 ./deploy_key
echo -e "Host $SERVER_IP_ADDRESS\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
ssh-add ./deploy_key
# Make sure connection is established
ssh -i ./deploy_key root@207.180.208.87 pwd

ssh -i ./deploy_key root@207.180.208.87
git clone https://github.com/veotani/travis-python-test
cd travis-python-test
pip install requirements.txt
python main.py