module ApplicationHelper
  
  def calc_age(member)
  
    Date.today.strftime("%Y%m%d").to_i/10000 - member.year_of_birth.to_i 
  end
end
