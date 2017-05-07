Example app to run Sinatra and Neo4j with Docker

### Build Sinatra only

	docker build -t name/sinatra-passenger:0.1 .
	docker run -p 4567:80 name/sinatra-passenger

### Create and start TEST and DEV neo4j db containers:

	docker-compose build
	docker-compose --verbose up

### Run tests with Rspec from the localhost

	cd app && rspec spec

### Start/stop app in production:

	docker-compose -f docker-compose-prod.yml up -d 
	docker-compose -f docker-compose-prod.yml stop

