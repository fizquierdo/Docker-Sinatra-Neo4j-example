require 'sinatra'
require_relative 'neo4j_api'

db = Neo4j.new({port: 7474, server: "neo4j-dev"})

get '/' do
	@num_nodes = db.count_nodes
	erb :index
end

post '/create' do
	db.create_node(params["input_name"])
	redirect '/'
end
