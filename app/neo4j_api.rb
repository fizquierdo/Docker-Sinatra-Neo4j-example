require 'neography'

# Example API used by the sinatra app to interact with Neo4j
# All Cypher queries should be here
# See spec/neo4j_spec

class Neo4j
	def initialize(config)
		# password defaults to neo4j, usage:
		# neo = Neography::Rest.new("http://neo4j:password@localhost:7474")
		# When connect to dev/test, AUTH set to 'none'
		@neo = Neography::Rest.new({port: config[:port], server: config[:server]})
	end
	def create_node(name)
		@neo.execute_query("CREATE (n:Person {name: '#{name}'})")
	end
	def count_nodes
		result = @neo.execute_query("MATCH (n) RETURN count(n) as count")
		result["data"][0][0]
	end
	def clean
		# Delete all nodes and relationships in the DB
		@neo.execute_query("MATCH (n) DETACH DELETE n")
	end
end
