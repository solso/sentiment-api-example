## Sentiment API Example

This is a very basic API that returns the sentiment value of a word or a sentence. You can define the sentiment value of any additional word that is not in the dictionary.

The API is meant to serve an example of how you can easily create an API, and how you can use the free 3scale platform to control, manage and monitor the operations of the API so that you only have to do the fun part.

The original sentiment values are taken from the dataset AFINN-111.txt from [Denmark Technical University](http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010) 


## Usage

Start the API...

	ruby ./sentiment-api.rb 8080

Call one method of the API with curl (or with your browser if you want)

	curl -X GET -g "http://localhost:8080/v1/word/fantastic.json

The above call returns 

	{"word":"fantastic","sentiment":4}






