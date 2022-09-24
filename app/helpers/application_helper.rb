module ApplicationHelper

  def calc_age(obj)
    Date.today.strftime("%Y%m%d").to_i/10000 - obj.year_of_birth.to_i
  end

end