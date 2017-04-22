Example app to run Sinatra and Neo4j with Docker

### Build Sinatra only

	docker build -t name/sinatra-passenger:0.1 .
	docker run -p 4567:80 name/sinatra-passenger

### Docker compose activating a neo4j db with:

	docker-compose build
	docker-compose up

### Run tests with Rspec

	cd app && rspec spec
