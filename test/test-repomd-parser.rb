require "rpm/repodata/repomd"
require "rpm/repodata/parser"

class RepomdParserTest < Test::Unit::TestCase
  def test_uri

    RPM::Repodata::Repomd.new("http://packages.groonga.org/centos/7/x86_64/repodata/repomd.xml")
  end

  def test_path
    RPM::Repodata::Repomd.new("repomd.xml")
  end
end
