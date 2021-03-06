# tweeter-reader
How I read tweets

This should work as follows:
1. Set up cron job to run the .py every 20 minutes
2. New tweets from list are saved by username in .txt files
3. Bash script to 
	- delete old index.html and create new with header.html
	- add most prolific tweeter (by filesize) to .html and remove .txt
	- until file is 100 KB, add least prolific tweeter to .html and remove .txt
4. User opens .html

## Todo
- bash script