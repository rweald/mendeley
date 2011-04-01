#Overview
This is a simple ruby wrapper for the mendeley api
You can find details about the mendeley API here:
(http://apidocs.mendeley.com/home/public-resources)

#Installation
    gem install mendeley
#Usage
Before you can use the gem you will need to get a consumer key from the
mendeley website

The first step is to define your consumer key:
    Mendeley.consumer_key = "<Your key here>"

Now you can make requests to the mendeley api. 

To do a search simply the use document search class method
    Mendeley::API::Documents.search(term)

To get detailed information on a document:
    Mendeley::API.Documents.document_details(< doc_id>)
