Ticker#---
# Excerpted from "Rails, Angular, Postgres, and Bootstrap, Second Edition",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/dcbang2 for more book information.
#---
class TickerSearchTerm
  attr_reader :where_clause, :where_args, :order
  def initialize(search_term)
    search_term = search_term.upcase
    @where_clause = ""
    @where_args = {}
    if search_term =~ /\d{4}/
      build_for_year_search(search_term)
    else
      build_for_name_search(search_term)
    end
  end

private

  def build_for_name_search(search_term)
    @where_clause << case_insensitive_search(:name)
    @where_args[:name] = starts_with(search_term)
    @order = "name asc"
  end

  def case_insensitive_search(field_name)
    "upper(#{field_name}) like :#{field_name}"
  end

  def starts_with(search_term)
    search_term + "%"
  end


  def case_numeric_search(field_name)
    "(#{field_name}) = :#{field_name}"
  end

  def extract_name(year)
    year.gsub(/@.*$/,'').gsub(/[0-9]+/,'')
  end

  def build_for_year_search(search_term)
    @where_clause << case_numeric_search(:title)
    @where_args[:title] = starts_with(search_term)

    @where_clause << " OR #{case_numeric_search(:name)}"
    @where_args[:name] = starts_with(search_term)

    @where_clause << " OR #{case_numeric_search(:year)}"
    @where_args[:year] = search_term

    @order = "year asc, rank asc"
  end
  
end