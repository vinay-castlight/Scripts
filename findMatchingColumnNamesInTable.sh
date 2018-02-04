#!/bin/bash
  
tableNames=table1,table2,table3

for i in $(echo $tableNames | sed "s/,/ /g")
        do
                echo "##################################################################################"
                echo "Checking in Table name : $i"

        output=($(mysql SCHEMA_NAME_TO_USE -N -uroot  -se "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='SCHEMA_NAME_TO_USE' AND TABLE_NAME='$i'"))


        cnt=${#output[@]}

        for (( j=0 ; j<cnt ; j++ ))
                do
                  #echo "Record No. $j: ${output[$j]}"
                	 coulmnName=${output[$j]};
                        if [[ $coulmnName = *"expires"* ]]; then
                                echo "Table : $i  Column : $coulmnName"
                        fi

                done

        done
