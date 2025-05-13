
# to count how many operations will do
num=1;
while read -r LN
do echo "$LN" ;

# storing the main path
pth1=$(ls -d -1 "$PWD"/);

# test url
# LN="https://www.tiktok.com/@tagaccessorize/video/7294593830110661920"

# cleaning the folder name
fl_nm=$(echo "$LN" | grep -oh "@.*\/v" | sed "s/\/v//g" | sed "s/@//g");

# check if the username is starting from ".", which can be hidden,
# then adds "@" in order not to be hidden as folder

if [[ $fl_nm =~ ^\. ]];
        then
        fl_nm="@"$fl_nm;
        echo "point_"$fl_nm;
        else
        echo "nopoint_"$fl_nm;
        fi;

mkdir -p "${fl_nm}";
cd  "${fl_nm}";

# LN="https://www.tiktok.com/@marioslitsa/video/7328487429072031009";
     # download onlythejson file
     yt-dlp --limit-rate 50K --cookies-from-browser firefox --write-info-json   --skip-download  -o "%(upload_date>%Y-%m-%d)s_%(id)s_%(title).100s.%(ext)s"  --restrict-filenames --trim-filenames 100 "$LN" | grep "Writing" > writes.txt;
     jsonfile=$(tail -n 1 writes.txt | grep -oh "to:.*" | sed "s/to: //g");

    json_exists=$(cat writes.txt | wc -l)

if [ "$json_exists" -gt 0 ] ; then
        echo "json exists"

     # creating a json with ok instead on info in filename to process
     fl="$(echo "$jsonfile" | sed "s/info/ok/g")";
     touch $fl;

transcribe_replace() {
  # Step 1: Transliterate Greek characters and remove emojis using Perl
  perl -CSD -pe 's/[^\p{L}\p{N}\p{P}\p{S}]+/ /g;
                 s/ά/α/g; s/έ/ε/g; s/ή/η/g; s/ί/ι/g;
                 s/ό/ο/g; s/ύ/υ/g; s/ώ/ω/g;
                 s/Ά/Α/g; s/Έ/Ε/g; s/Ή/Η/g;
                 s/Ί/Ι/g; s/Ό/Ο/g; s/Ύ/Υ/g; s/Ώ/Ω/g' |

 perl -CSD -MUnicode::Normalize -pe '$_ = NFD($_); s/\pM//g; $_ = NFC($_);' |

  # Step 2: Replace emoji characters with letters using sed
  sed -e 's/🅰/A/g' -e 's/🅱/B/g' -e 's/🅲/C/g' -e 's/🅳/D/g' \
      -e 's/🅴/E/g' -e 's/🅵/F/g' -e 's/🅶/G/g' -e 's/🅷/H/g' \
      -e 's/🅸/I/g' -e 's/🅹/J/g' -e 's/🅺/K/g' -e 's/🅻/L/g' \
      -e 's/🅼/M/g' -e 's/🅽/N/g' -e 's/🅾/O/g' -e 's/🅿/P/g' \
      -e 's/🆀/Q/g' -e 's/🆁/R/g' -e 's/🆂/S/g' -e 's/🆃/T/g' \
      -e 's/🆄/U/g' -e 's/🆅/V/g' -e 's/🆆/W/g' -e 's/🆇/X/g' \
      -e 's/🆈/Y/g' -e 's/🆉/Z/g'
}

        # braking lines in json file in order to grep them easier
        sed -i 's/\"subtitles/\n\"subtitles/g' $jsonfile ;
        sed -i  's/\"http_headers/\n\"http_headers/g' $jsonfile ;
        sed -i  's/\"channel/\n\"channel/g' $jsonfile ;
        sed -i  's/\"channel_id/\n\"channel_id/g' $jsonfile;
        sed -i  's/\"uploader/\n\"uploader/g' $jsonfile ;
        sed -i  's/\"uploader_id/\n\"uploader_id/g' $jsonfile ;
        sed -i  's/\"channel_url/\n\"channel_url/g' $jsonfile ;
        sed -i  's/\"uploader_url/\n\"uploader_url/g' $jsonfile ;
        sed -i  's/\"track/\n\"track/g' $jsonfile ;
        sed -i  's/\"duration/\n\"duration/g' $jsonfile ;
        sed -i  's/\"title/\n\"title/' $jsonfile ;
        sed -i  's/\"description/\n\"description/g' $jsonfile ;
        sed -i  's/\"timestamp/\n\"timestamp/g' $jsonfile ;
        sed -i  's/\"view_count/\n\"view_count/g' $jsonfile ;
        sed -i  's/\"like_count/\n\"like_count/g' $jsonfile ;
        sed -i  's/\"repost_count/\n\"repost_count/g' $jsonfile ;
        sed -i  's/\"comment_count/\n\"comment_count/g' $jsonfile ;
        sed -i  's/\"webpage_url/\n\"webpage_url/g' $jsonfile ;
        sed -i  's/\"webpage_url_basename/\n\"webpage_url_basename/g' $jsonfile ;
        sed -i  's/\"webpage_url_domain/\n\"webpage_url_domain/g' $jsonfile ;
        sed -i  's/\"playlist_count/\n\"playlist_count/g' $jsonfile ;
        sed -i  's/\"playlist/\n\"playlist/g' $jsonfile ;
        sed -i  's/\"playlist_id/\n\"playlist_id/g' $jsonfile ;
        sed -i  's/\"playlist_title/\n\"playlist_title/g' $jsonfile ;
        sed -i  's/\"playlist_webpage_url/\n\"playlist_webpage_url/g' $jsonfile ;
        sed -i  's/\"n_entries/\n\"n_entries/g' $jsonfile ;
        sed -i  's/\"playlist_index/\n\"playlist_index/g' $jsonfile ;
        sed -i  's/\"thumbnail/\n\"thumbnail/g' $jsonfile ;
        sed -i  's/\"display_id/\n\"display_id/g' $jsonfile ;
        sed -i  's/\"fulltitle/\n\"fulltitle/g' $jsonfile ;
        sed -i  's/\"duration_string/\n\"duration_string/g' $jsonfile ;
        sed -i  's/\"upload_date/\n\"upload_date/g' $jsonfile ;
        sed -i  's/\"artist/\n\"artist/g' $jsonfile ;
        sed -i  's/\"epoch/\n\"epoch/g' $jsonfile ;
        sed -i  's/\"ext/\n\"ext/g' $jsonfile ;
        sed -i  's/\"vcodec/\n\"vcodec/g' $jsonfile ;
        sed -i  's/\"acodec/\n\"acodec/g' $jsonfile ;
        sed -i  's/\"format_id/\n\"format_id/g' $jsonfile ;
        sed -i  's/\"tbr/\n\"tbr/g' $jsonfile ;
        sed -i  's/\"quality/\n\"quality/g' $jsonfile ;
        sed -i  's/\"preference/\n\"preference/g' $jsonfile ;
        sed -i  's/\"filesize/\n\"filesize/g' $jsonfile ;
        sed -i  's/\"width/\n\"width/g' $jsonfile ;
        sed -i  's/\"height/\n\"height/g' $jsonfile ;
        sed -i  's/\"url/\n\"url/g' $jsonfile ;

        # grepping fields from json
        grep -oh "subtitles.*" "${jsonfile}"   >> $fl;
        grep -oh "channel\".*" "${jsonfile}"  >> $fl;
        grep -oh "channel_id.*" "${jsonfile}"   >> $fl;
        grep -oh "uploader\".*" "${jsonfile}"   >> $fl;
        grep -oh "uploader_id.*" "${jsonfile}"   >> $fl;
        grep -oh "channel_url.*" "${jsonfile}"   >> $fl;
        grep -oh "uploader_url.*" "${jsonfile}"   >> $fl;
        grep -oh "track.*" "${jsonfile}"  >> $fl;
        grep -oh "artist.*" "${jsonfile}"   >> $fl;
        grep -oh "duration\".*" "${jsonfile}"   >> $fl;
        grep -oh "duration_string.*" "${jsonfile}"   >> $fl;
        grep -oh "title.*" "${jsonfile}"   | uniq >> $fl;
        grep -oh "description.*" "${jsonfile}"  >> $fl;
        grep -oh "timestamp.*" "${jsonfile}"   >> $fl;
        grep -oh "view_count.*" "${jsonfile}"   >> $fl;
        grep -oh "like_count.*" "${jsonfile}"  >> $fl;
        grep -oh "repost_count.*" "${jsonfile}"   >> $fl;
        grep -oh "comment_count.*" "${jsonfile}"  >> $fl;
        grep -oh "webpage_url\".*" "${jsonfile}"  >> $fl;
        grep -oh "webpage_url_basename.*" "${jsonfile}"  >> $fl;
        grep -oh "webpage_url_domain.*" "${jsonfile}"   >> $fl;
        grep -oh "playlist_count.*" "${jsonfile}"  >> $fl;
        grep -oh "playlist\".*" "${jsonfile}"   >> $fl;
        grep -oh "playlist_id.*" "${jsonfile}"  >> $fl;
        grep -oh "playlist_title.*" "${jsonfile}"   >> $fl;
        grep -oh "playlist_webpage_url.*" "${jsonfile}"   >> $fl;
        grep -oh "n_entries.*" "${jsonfile}"  >> $fl;
        grep -oh "playlist_index.*" "${jsonfile}"   >> $fl;
        grep -oh "display_id.*" "${jsonfile}"  >> $fl;
        grep -oh "fulltitle.*" "${jsonfile}"   >> $fl;
        grep -oh "upload_date.*" *"${jsonfile}"   >> $fl;
        grep -oh "epoch.*" "${jsonfile}"   >> $fl;
        grep -oh  -m1 "ext.*" "${jsonfile}"   >> $fl;
        grep -oh  -m1 "vcodec.*" "${jsonfile}"   >> $fl;
        grep -oh  -m1 "acodec.*" "${jsonfile}"   >> $fl;
        grep -oh "format_id.*" "${jsonfile}"   | uniq  >> $fl;
        grep -oh "tbr.*" "${jsonfile}"  | uniq >> $fl;
        grep -oh "quality.*" "${jsonfile}"  | uniq >> $fl;
        grep -oh "preference.*" "${jsonfile}"  | uniq >> $fl;
        grep -oh "filesize.*" "${jsonfile}"    | uniq >> $fl;
        grep -oh "width.*" "${jsonfile}"   | uniq >> $fl;
        grep -oh "height.*" "${jsonfile}"   | uniq >> $fl;

        # grepping fields
        upload_date_grp=$(grep "upload_date" $fl | sed "s/\"//g" | sed "s/upload_date: //g" | sed "s/,//g" | sed "s/ //g" | transcribe_replace);
        echo $upload_date_grp;
        upload_dt_ok=$(date -d $(echo $upload_date_grp) '+%Y-%m-%d');
        echo $upload_dt_ok;

        #number of characters max?
        nupload=25
        uploaderid_grp=$(grep "uploader\"" $fl | sed "s/\"//g" | sed "s/uploader: //g" | sed "s/,//g" | sed "s/ /_/g" | awk -v n="$nupload" '{print substr($0, 1, n)}'  | transcribe_replace);
        echo $uploaderid_grp;

        #number of characters max?
        ntrack=40;
        track_grp=$(grep "track" $fl | sed "s/\"//g" | sed "s/track: //g" | sed "s/,//g" | sed "s/ /_/g" |  sed -e "s/πρωτότυπος_ήχος//g" | awk -v n="$ntrack" '{print substr($0, 1, n)}'  | iconv | transcribe_replace);
        echo $track_grp;

        #number of characters max?
        nartist=60;
        artist_grp=$(grep "artist\"" $fl | sed "s/\"//g"  | sed "s/artist: //g" | sed "s/,//g" | sed "s/ /_/g" | perl -CSD -pe 's/[^\p{L}\p{N}._ -]+//g' | awk -v n="60" '{print substr($0, 1, n)}'  | iconv | transcribe_replace);
        echo $artist_grp;

        # formating description
        description_grp=$(grep "description" $fl | sed "s/\"//g" | sed "s/description: //g" | sed "s/,//g" | sed "s/ /_/g");
        descr_grp_ok=$(echo $description_grp | sed "s/fypp//g" | sed "s/ppp//g" | sed "s/fupp//g" | sed "s/viralvideos//g" | sed "s/φοργιου//g" | sed "s/μπεςγαμω//g" | sed "s/fy_fyp//g" | sed $'s/[^[:print:]\t]//g' |  perl -CSD -pe 's/[^\p{L}\p{N}._ -]+//g' | sed "s/__/_/g" | iconv | transcribe_replace);

        # counting characters for max length in filename
        upload_date_nm=$(echo $upload_dt_ok | wc -c);
        uploaderid_nm=$(echo $uploaderid_grp | wc -c);
        track_nm=$(echo $track_grp | wc -c);
        artist_nm=$(echo $artist_grp | wc -c);
        description_nm=$(echo $descr_grp_ok | wc -c);

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

       #shorting / limiting length of description with remaining available number of chars
       descr_short_ok=$(echo $descr_grp_ok | awk -v n="$nm_no_descr" '{print substr($0, 1, n)}'   );

        # planning the filename
        fl_nm=$(echo $upload_dt_ok"-""@"$uploaderid_grp"_tr_"$track_grp"-art_"$artist_grp"_dscr_"$descr_short_ok | sed "s/ /_/g" | sed "s/__/_/g" | awk -v n="$max_chars" '{print substr($0, 1, n)}' | transcribe_replace   );
        mv  "$fl" "$fl_nm""-ok-.json";
        echo $fl;
        echo $fl_nm;

        #downloading the tiktok mp4 file
        yt-dlp  --limit-rate 100K  --cookies-from-browser firefox  -o "$fl_nm.""%(ext)s"   "$LN"

else
        echo "json not exists"
        echo "$LN" >>l_notexists.txt
        stop;
        break;
        exit;

fi;


trash-put $jsonfile;
trash-put writes.txt;

cd "${pth1}";
let "num=num+1";
echo $num;

done < l.txt ;


