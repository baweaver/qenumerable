require "qenumerable/version"
require 'izzy'

module QEnumerable
  include Izzy

  def select_where(matchers = {})
    self.select { |s| s.matches_all? matchers }
  end

  def reject_where(matchers = {})
    self.reject { |s| s.matches_all? matchers }
  end

  def find_where(matchers = {})
    self.find { |s| s.matches_all? matchers }
  end
end
