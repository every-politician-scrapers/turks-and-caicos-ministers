#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      Name.new(
        full: noko.css('.sppb-person-name').text.tidy,
        prefixes: %w[His Her Excellency Hon.],
      ).short
    end

    def position
      noko.css('.sppb-person-designation').text.tidy
    end
  end

  class Members
    def member_container
      noko.css('.sppb-person-information')
    end
  end
end

file = Pathname.new 'html/official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
