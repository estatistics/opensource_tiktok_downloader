# opensource tiktok downloader with name customization based on yt-dlp 

This is an open source bashscript to download tiktok videos with options to customize the name of the downloaded video/json. Please read it before use!

### What it does?
- 1st step - Download the json file with a temporary filename.
- 2nd step - Replace emoji characters with letters using sed in json file eg.  sed -e 's/🅰/A/g' 
- 3rd step - Extracting from the downloaded json these fields and saving them in a new clean json file, namely:
   - subtitles
   - channel
   - channel_id
   - uploader
   - uploader_id
   - channel_url
   - uploader_url
   - track
   - artist
   - duration
   - duration_string
   - title
   - description
   - timestamp
   - view_count
   - like_count
   - repost_count
   - comment_count
   - webpage_url
   - webpage_url_basename
   - webpage_url_domain
   - playlist_count
   - playlist
   - playlist_id
   - playlist_title
   - playlist_webpage_url
   - n_entries
   - playlist_index
   - display_id
   - fulltitle
   - upload_date
   - epoch
   - ext
   - vcodec
   - acodec
   - format_id
   - tbr
   - quality
   - preference
   - filesize
   - width
   - height
- 4rth step & final step - it downloads the tiktok video and rename/saving both mp4 and the new json file with the new name template.

## Name template 
You can customize the name template as you wish based on all the above fields. As a default option, name is constructed as following in that order: `upload_date (in form of +%Y-%m-%d), uploader, track, artist, & description`. Because there is a system restrain on filename lengths, max character restrains used on these chosen fields:
  
 -  max characters in filename is set at final stage to 150.
 -  Date has by default 11 characters (in form of 2025-12-31) - why 11 and not 10? I dont know
 -  upload(username)=25 - username cannot exists 24 characters in tiktok (as of May 2025)
 -  track - max characters 40 
 -  artist - max characters 60
 -  Description length is created using the remaining length until total max number of characters is reached (set to 150).
 -  Description length = 150-(length of Date+upload(username)+track+artist).

## Cleaning fields
Some cleaning is done on the json fields before creating the new file name. The following strings are removed entirely from json extracted fields. This can maximize the usefull information that can be stored on the filename. Note that these strings are NOT deleted from the cleaned 2nd json file. They are only removed before creation of the filename template:

- fy_fyp
- fypp
- ppp
- fupp
- viralvideos
- φοργιου (greek words)
- μπεςγαμω (greek words)
- original_sound
- noprinted characters using sed
- emoticons, symbols etc. using perl syntax `perl -CSD -pe 's/[^\p{L}\p{N}._ -]+//g'`

- Also, usernames that starts from ".", it is added "@" before the dot, in order not becoming hidden files.
- Also, perl is used to transcribe all "letters with tone/s" like "ά" to "α", keeping the nationality of the letters. 

## Info that is presented in addition of the yt-dlp info:
 - Strings of the extracted fields eg. date, uploader username, track, artist, description
 - number of characters per field
 - the url of tiktok video

## How to use it 
 - You must put the urls of tiktok video in a file called "l.txt" (links).
 - The urls must have the form of `https://www.tiktok.com/@fotomelodios/video/7497228965933747478`
 - Each url must be in a new line. No spaces, no comments, no ?lang_en, nothing else.
 - A restriction on the speed of download is set to 100K. you can change it.
 - Note that 2 requests are done per download in tiktok based on yt-dlp: For json file and the video (mp4).
 - Each video is saved under the tiktok username. If starts from ".", a "@" is added. 

In a folder that you have created the file "l.txt" with tiktok video urls, run in bash in the same folder `./tiktok_clean.sh`. 
- The download will starts.
- It must have execution permissions. 

## Problems 
`Your IP address is blocked from accessing this post`
- In this problem, I remove the specified url that caused the problem and I wait to start download the next day (12-24hours).
- I dont know what is this about or when this ban is exactly removed. Next day, I can download other urls except from the specific ones.

Note that the script creates the following file `l_notexists.txt` under the username folder, if the respond of tiktok in yt-dlp is that no json file found. 
 - `l_notexists.txt` file contains the url that yt-dlp did not found.

Have a nice tiktok downloading video experience!
