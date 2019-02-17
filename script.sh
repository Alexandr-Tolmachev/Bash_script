#!/bin/bash
mkdir back_up > /dev/null
curr_dir=$1
catalog_name=$2
ind=3
while [ $ind -le $# ]
do
find $curr_dir -not -path "*/back_up/*" -name "*.${!ind}" -exec cp --parents {} back_up 2> /dev/null \;
2> /dev/null  
ind=$[ $ind + 1 ]
done
mv back_up $catalog_name > /dev/null
tar -cvzf $catalog_name.tar $catalog_name > /dev/null
rm -r $catalog_name > /dev/null
echo "done"
