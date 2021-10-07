# slack-emoji-bulk-upload-wrapper
A wrapper for previous slack emoji uploaders with improvements


I used the slack emojinator for upload without any difficulty
https://github.com/smashwilson/slack-emojinator

Step 1: clone the emojinator  
  git clone https://github.com/smashwilson/slack-emojinator

Step 2: Install the emojinator
  git clone https://github.com/smashwilson/slack-emojinator.git
  cd slack-emojinator
  pipenv install
  *Follow instruction on that site to set your .env file correctly*
  cd ..
  
Step 3: Clone this repository
  git clone https://github.com/rolandvarriale/slack-emoji-bulk-upload-wrapper

Step 4: Run massdownload.sh (you might need to chmod u+x massdownload.sh)
   cd slack-emoji-bulk-upload-wrapper
   chmod u+x massdownlad.sh
   ./massdownload.sh

Step 5: Run emojinator to upload to your slack workspace
    pipenv run python upload.py emojjidump/
    
The only hard part is grabbing your cookie from the HTTP request headers
Some improvements to the emojinator code: (I plan on forking/merging and then I will remove this piece)
  1. I modified the timeout in the upload.py file to 180 instead of the default value (3). 
    Line 185:    sleep(180) 
    
  2. I added a UTF-8 conversion bc I was having some encoding problems in the browser I was using
    Line 38:     session.headers = {'Cookie': args.cookie.encode('utf-8')}

I left a sample line to run the emojinator to upload at the end of the scrip
