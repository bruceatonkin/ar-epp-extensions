#!/usr/bin/tclsh

source xml2rfc.tcl
set documents { exAvail-1.0 price-1.0 price-1.1 price-1.2 application-1.0 idn-1.0 kv-1.0 tmch-1.0 variant-1.1 block-1.0 au-extensions-1.2 registrant-1.0}
foreach {document} $documents {
   cd $document
   puts "processing $document to txt"
   xml2txt $document.xml
   file rename -force $document.txt ../../ari-toolkit-gitpages/doc/$document/$document.txt
   puts "processing $document to html"
   xml2html $document.xml
   file rename -force $document.html ../../ari-toolkit-gitpages/doc/$document/$document.html
   cd ..
}
exit
