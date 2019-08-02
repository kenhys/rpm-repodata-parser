require "uri"
require "open-uri"
require "rexml/document"
require "rpm/repodata/parser/base"

module RPM
  module Repodata
    module Parser
      class RepomdParser < BaseParser
        def initialize(options={})
          @output = options[:output] || @stdout
        end

        def parse(url_or_path)
          @objects = []
          uri = URI.parse(url_or_path)
          case uri.scheme
          when "http"
            open(url_or_path) do |request|
              @doc = REXML::Document.new(request.read)
            end
          else
            file = File.new(url_or_path)
            @doc = REXML::Document.new(file)
            REXML::XPath.match(@doc, "repomd/data").map do |element|
              data = {
                data_type: element.attributes["type"],
                checksum: element.elements["checksum"].text,
                open_checksum: element.elements["open-checksum"].text,
                timestamp: Time.at(element.elements["timestamp"].text.to_i),
                size: element.elements["size"].text.to_i,
                open_size: element.elements["open-size"].text.to_i,
                href: element.elements["location"].attributes["href"]
              }
              if element.elements["database_version"]
                data[:database_version] = element.elements["database_version"].text
              end
              pp data
              @objects << data
            end
          end
          @objects
        end
      end
    end
  end
end
