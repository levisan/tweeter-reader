# things to set
list_id = ''
workingDirectory = ''
consumerKey = ''
consumerSecret = ''
accessToken = ''
accessTokenSecret = ''

import tweepy

auth = tweepy.OAuthHandler(consumerKey, consumerSecret)
auth.set_access_token(accessToken, accessTokenSecret)

api = tweepy.API(auth)

# set working directory
import os
os.chdir(workingDirectory)

# get tweet id of most recent save
f2 = open("latest.txt", "r")
latestTweet = f2.read()
f2.close()

# get 100 latest tweets since most recent, no RTs
list_tweets = api.list_timeline(list_id = list_id, since_id = latestTweet, count = 100, include_rts= 0)

for tweet in list_tweets:

	# twitter user id
	uID = tweet.author.screen_name
	uID = ''.join([i for i in uID if not i.isdigit()]) 

	# tweet id, converted to string
	tweetID = str(tweet.id)

	# url of tweet to embed
	embedURL = "https://twitter.com/web/status/" + tweetID

	# code to add to txt
	embedCode = '<blockquote class="twitter-tweet"><a href="' + embedURL + '?ref_src=twsrc%5Etfw"></a></blockquote>'

	# add code plus line break
	f3 = open("src/" + uID + ".txt", "a")
	f3.write(embedCode)
	f3.write('\n')
	f3.close()

	# open recorded latest tweet file
	f4 = open("latest.txt", "r")
	# if current tweet is more recent
	if tweetID > f4.read():
		# update latest tweet file
		f5 = open("latest.txt", "w")
		f5.write(tweetID)
		f5.close()
	f4.close()
