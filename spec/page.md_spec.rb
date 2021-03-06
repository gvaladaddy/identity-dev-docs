require 'spec_helper'

Dir.glob('_site/**/*.html') do |page|
  RSpec.describe page do
    let(:doc) { Nokogiri::HTML(File.new(page.to_s)) }

    it 'does not have broken Markdown links' do
      expect(doc.to_s).to_not include(')]')
    end

    it 'links to valid headings' do
      expect(doc).to link_to_valid_headers
    end

    it 'links to valid internal pages' do
      expect(doc).to link_to_valid_internal_pages
    end
  end
end
