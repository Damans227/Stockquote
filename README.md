# Stockquote

 Stockquote is a java based web application which leverages [Yahoo-Finance API][Yahoo-Finance] to request detailed information, some statistics and historical quotes on stocks. Stockquote has a simple and easy to follow user interface built using bootstrap 4. 

## How to run the application

1. In order to get this application up and running quickly, you will need to have docker run time installed on your computer. 
2. Once you have a docker runtime installed, clone the repository to local computer and go to `Deployment` folder. 
3. Now, run the following docker commands one by one:<br />
   a) `docker build -t stockquote-webapp .`<br />
   b) `docker container run --name stockquote -dt -p 8091:8080 stockquote-webapp`<br />
4. The application should be up and running now on the following `URL: http://localhost:8091/stockquote/`

 [Yahoo-Finance]: https://financequotes-api.com/