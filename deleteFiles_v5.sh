PURGE_FILES=/e/shellFilesDelete/Microservices*.txt
Del_Days=5;
#find $PURGE_FILES -mtime +$Del_Days -exec rm -f '{}' -f \;


#find $PURGE_FILES -type f -mtime +$Del_Days -name '*.txt' -execdir rm -- '{}' \;

count=$((find $PURGE_FILES -type f -mtime +$Del_Days -name '*.txt' | wc -l) 2> /dev/null)
if [ $count -gt 0 ]
then 
	#find $PURGE_FILES -type f -mtime +7 -name '*.txt' -exec rm -f {} \;
	find $PURGE_FILES -type f -mtime +7 -name '*.txt' -delete
	echo "`date` : $count Files older than $Del_Days days are deleted from the folder..."
else
	echo "`date` : No files are older than $Del_Days days from the folder..."
fi


