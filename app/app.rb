require 'sinatra'
require 'neography'

#  we have setup the password to "password"
class Neo4j
	def initialize
		@neo = Neography::Rest.new("http://neo4j:password@neo4j:7474")
	end
	def create_node(name)
		cypher = "CREATE (n:Person {name: '#{name}'})"
		@neo.execute_query(cypher)
	end
	def count_nodes
		cypher = "MATCH (n) RETURN count(n) as count"
		result = @neo.execute_query(cypher)
		result["data"][0][0]
	end
end

db = Neo4j.new

get '/' do
	@num_nodes = db.count_nodes
	erb :index
end

post '/create' do
	db.create_node(params["input_name"])
	redirect '/'
end
