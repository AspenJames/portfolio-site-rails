require 'rspec/expectations'

module NavMatcher
  extend RSpec::Matchers::DSL

  matcher :be_active do |expected|
    @failure_reason = nil
    match do |actual|
      active_links = get_active_links(actual)
      if active_links.length == 0
        @failure_reason = :none_active
        return false
      elsif active_links.length > 1
        @failure_reason = :multiple_active
        return false
      end
      active_links.first == actual
    end

    def get_active_links(link)
      nav = link.ancestor('nav')
      nav.find_all('a.active')
    end

    def get_active_link_hrefs(link)
      get_active_links(link).to_a.map{|l| l[:href]}
    end

    failure_message do |actual|
      case @failure_reason
      when :none_active
        "No active links found"
      when :multiple_active
        "Expected one active link, multiple returned:\n "\
          "#{get_active_link_hrefs(actual)}"
      else
        "Expected '#{actual[:href]}' to be active, "\
          "instead found '#{get_active_link_hrefs(actual).first}''"
      end
    end

  end

  matcher :match_href do |expected|
    match do |actual|
      actual[:href] == expected
    end
  end

  matcher :have_navlinks do |expected|
    match do |actual|
      navLinks = get_links(actual)
      matches_hrefs(navLinks, expected)
    end

    def get_links(session)
      session.find('nav').find_all('a').to_a.slice(0..expected.length - 1)
    end

    def matches_hrefs(nodes, expected_hrefs)
      actual_hrefs = get_hrefs(nodes)
      actual_hrefs.sort == expected_hrefs.sort
    end

    def get_hrefs(nodes)
      nodes.map{|a| a[:href] }
    end

    failure_message do |actual|
      "expected: #{expected}\n     got: #{get_hrefs(get_links(actual))}"
    end
  end
end