class Import
  require 'open-uri'

  def self.import_osu_xml
    doc = Nokogiri::XML(open("https://www.jobsatosu.com/all_jobs.atom")) do |config|
      config.strict.nonet
      config.strict.noblanks
    end    
  end
end
