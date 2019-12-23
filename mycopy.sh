if [ $# -ne 2 ]
then			
	echo "syntax error,usage:$0 <source_path><destination_path>"
	exit 0
fi
if [ ! -e $1 ]
then 
	echo "source $1 doesnot exist"
 	exit 0
fi
if [ ! -e $2 ]
then 
	echo "source $2 doesnot exist"
 	exit 0
fi
if [ ! -d $1 ]
then 
	echo "source $1 not a directory"
 	exit 0
fi
if [ ! -d $2 ]
then 
	echo "source $2 not a directory"
 	exit 0
fi
if [ ! -r $1 ]
then 
	echo "source $1 read permission denied,can not copy "
 	exit 0
fi
if [ ! -e $1 ]
then 
	echo "source $1 execute permission denied,can not copy"
 	exit 0
fi
if [ ! -r $2 ]
then 
	echo "source $2 read permission denied,can not copy "
 	exit 0
fi
if [ ! -e $2 ]
then 
	echo "source $2 execute permission denied,can not copy"
 	exit 0
fi
cd $1
echo "starting zip file creation...."
tar -cvf temp.tar *.* >>temp.txt
rm temp.txt
gzip temp.tar
echo "complete zip file ready to send...."
echo "moving data...."
mv temp.tar.gz ~/$2
echo "data moved sucessfully"
rm *.*
cd ~/$2
tar -xzvf temp.tar.gz >>temp.txt
rm temp.txt
rm ./temp.tar.gz
echo "operation completed"
exit 0



