#!/bin/bash

if [ ! "$#" -eq "5" ]
  then
    echo 'WebPipe2Lucene shell takes a list of documents (defined by an schema'
    echo 'file) from a piped file and insert then into a remote DeDup index.'
    echo
    echo 'usage: WebPipe2Lucene'
    echo '   <pipeFile> - pipe file generated by MySQL2Pipe.sh shell'
    echo '   <pipeEncoding> - pipe file encoding'
    echo '   <DeDupServiceBase> - url of DeDup service'
    echo '   <indexName> - DeDup index where the new documents will be inserted'
    echo '   <schemaName> - DeDup schema file (describing document structure)'
    exit 1
fi

cd /home/javaapps/sbt-projects/DCDup
sbt "run-main org.bireme.dcdup.WebPipe2Lucene $1 $2 $3 $4 $5"
cd -
