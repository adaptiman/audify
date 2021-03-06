# audify

This app is based upon Priya Aananthasankar's cloudpaper project which creates a web-enabled endpoint to the newspaper3k library.

## Deploy using Azure CLI

az login

az account set --subscription SUBSCRIPTION_ID

az container create --resource-group CloudPaperTest --name cloudjournocontainer --image prananth/newspaper3k-docker --dns-name-label cloudjourno --ports 5000

#### Finding DNS Name of the service deployed

az container show --resource-group CloudPaperTest --name cloudjournocontainer --query "{FQDN:ipAddress.fqdn}" --out table

## Access using FQDN

Substitute your deployment DNS Name in below URL: 

http://**{dnsname}**:westus2.azurecontainer.io:5000

Eg: cloudjourno.westus2.azurecontainer.io 

## API's and Sample Usage

For more details on how newspaper3k works: https://github.com/codelucas/newspaper

### article/html -  Get html page from link

curl -X POST http://{dnsname}:westus2.azurecontainer.io:5000/article/html -H "Content-Type: application/json" 
-d '{"article" : "https://www.newyorker.com/magazine/2018/09/10/is-education-a-fundamental-right"}'

### article/text - Get all the text information from the link

curl -X POST http://{dnsname}:westus2.azurecontainer.io:5000/article/text -H "Content-Type: application/json" 
-d '{"article" : "https://www.newyorker.com/magazine/2018/09/10/is-education-a-fundamental-right"}'

### article/authors - Get Authors

curl -X POST http://{dnsname}:westus2.azurecontainer.io:5000/article/authors -H "Content-Type: application/json" 
-d '{"article" : "https://www.newyorker.com/magazine/2018/09/10/is-education-a-fundamental-right"}'

### article/imglink - Get link of the first image

curl -X POST http://{dnsname}:westus2.azurecontainer.io:5000/article/imglink -H "Content-Type: application/json" 
-d '{"article" : "https://www.newyorker.com/magazine/2018/09/10/is-education-a-fundamental-right"}'

### article/publish_date - Get published date of the article

curl -X POST http://{dnsname}:westus2.azurecontainer.io:5000/article/publish_date -H "Content-Type: application/json" 
-d '{"article" : "https://www.newyorker.com/magazine/2018/09/10/is-education-a-fundamental-right"}'

### article/keywords - Get keywords

curl -X POST http://{dnsname}:westus2.azurecontainer.io:5000/article/keywords -H "Content-Type: application/json" 
-d '{"article" : "https://www.newyorker.com/magazine/2018/09/10/is-education-a-fundamental-right"}'## article/keywords

### article/summary

curl -X POST http://{dnsname}:westus2.azurecontainer.io:5000/article/summary -H "Content-Type: application/json" 
-d '{"article" : "https://www.newyorker.com/magazine/2018/09/10/is-education-a-fundamental-right"}'

### newspaper/article_urls

curl -X POST http://{dnsname}:westus2.azurecontainer.io:5000/newspaper/article_urls -H "Content-Type: application/json" 
-d '{"newspaper" : "https://www.cnn.com" , "language" : "en"}'
