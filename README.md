# opensource tiktok downloader with name customization based on yt-dlp 

This is an open source bashscript to download tiktok videos with options to customize the name of the downloaded video/json. 

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
- You can customize the name template as you wish based on all the above fields.
- As a default option, name is constructed as following in that order: upload_date (in form of +%Y-%m-%d), uploader, track, artist, & description  
- Specifically: `echo $upload_dt_ok"-""@"$uploaderid_grp"_tr_"$track_grp"-art_"$artist_grp"_dscr_"$descr_short_ok | sed "s/ /_/g" | sed "s/__/_/g" | awk -v n="$max_chars" '{print substr($0, 1, n)}' | transcribe_replace   );`
- Because there ir a system restrain on filename lenghts, max character restrains used on these chosen fields:
-  max characters in filename is set at final stage to 150.
-  Date has by default 11 characters (in form of 2025-12-31) - why 11 and not 10? I dont know
-  upload(username)=25 - username cannot exists 24 characters in tiktok (as of May 2025)
-  track - max characters 40 
-  artist - max characters 60
-  Description lenght is based on max characters allowed without the lenght 




       
        ntrack=40;
        nartist=60;
        
        max_chars=150;
        echo "upload date raw:" $upload_date_grp;
        echo "upload date edited:"$upload_dt_ok;
        echo "uploaded id:"$uploaderid_grp;
        echo "track:"$track_grp;
        echo "artist:"$artist_grp;
        echo "description:"$descr_grp_ok;

        # echo the number of chars per field
        echo "upload_date nm:"$upload_date_nm;
        echo "uploaderid nm:"$uploaderid_nm;
        echo "track nm:"$track_nm;
        echo "artist nm:"$artist_nm;
        echo "description nm:"$description_nm;
        tot_num=$(($upload_date_nm + $uploaderid_nm+$track_nm+$artist_nm));
        echo "total nm -descr:"$tot_num;
       max_chars=150;
       nm_no_descr=$( expr $max_chars - $tot_num);
       echo "remain nm:"$nm_no_descr;














     
