module RPM
  module Repodata
    class Repomd
      attr_reader :filelists
      attr_reader :primary
      attr_reader :primary_db
      attr_reader :other_db
      attr_reader :other
      attr_reader :filelists_db
      def initialize(url_or_path, options={})
        options[:path] = url_or_path
        p options
        @parser = RPM::Repodata::Parser::RepomdParser.new
        objects = @parser.parse(options[:path])
        objects.each do |object|
        end
      end
    end
  end
end
