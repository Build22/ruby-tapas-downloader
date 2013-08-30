class RubyTapasDownloader::File
  include RubyTapasDownloader::Downloadable

  attr_reader :name
  attr_reader :link

  def initialize name, link
    @name = name
    @link = link
  end

  def download basepath, agent
    FileUtils.mkdir_p basepath

    file_path = File.join(basepath, name)
    agent.download link, file_path unless File.exists? file_path
  end

  def == other
    name == other.name && link == other.link
  end

  def eql? other
    name.eql?(other.name) && link.eql?(other.link)
  end

  def hash
    name.hash + link.hash
  end
end
