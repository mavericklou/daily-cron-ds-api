require 'rubygems'
require 'net/http'
require 'uri'
require 'json'

url='http://ds-api.internal.factual.com/zookeeper/ds-api-processes'
rsp = JSON.parse(Net::HTTP.get_response(URI.parse(url)).body)

puts rsp.delete_if { |k,v| !v || (!v.include? "prod_") }
       .keys
       .map { |s| s.gsub(/.*@(.*):.*/, '\1').gsub(/ip[0-9\-]+/) { |s| s.slice(3, s.size).gsub(/-/,'.') } }
       .join(",")
