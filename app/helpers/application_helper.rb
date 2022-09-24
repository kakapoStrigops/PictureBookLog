module ApplicationHelper

  # 会員の大まかな年齢の表示用（将来的に実装予定のプレゼント相手の年齢表示にも使用予定）
  def calc_age(obj)
    Date.today.strftime("%Y%m%d").to_i/10000 - obj.year_of_birth.to_i
  end

end