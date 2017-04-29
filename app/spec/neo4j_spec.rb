require 'spec_helper'
require_relative '../neo4j_api'

describe "neo4j-API integration" do

	before(:each) do
		# Use the neo4j-test docker container
		@neo = Neo4j.new({port: 7475, server: "localhost"})
		@neo.clean
	end

	it 'Neo4j Test DB has zero nodes' do
		expect(@neo.count_nodes).to equal(0)
	end

	it 'A node can be created' do
		@neo.create_node("Peter")
		expect(@neo.count_nodes).to equal(1)
	end

end
