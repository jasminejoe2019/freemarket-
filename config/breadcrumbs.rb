crumb :root do
  link "メルカリ", root_path
end

crumb :mypages do
  link "マイページ", mypages_path
  parent :root
end

crumb :logouts do
  link "ログアウト", logouts_path
  parent :mypages
end

crumb :shipping_addresses do
  link "本人情報の登録", new_shipping_address_path
  parent :mypages
end

crumb :profile do
  link "プロフィール", edit_mypage_path
  parent :mypages
end

crumb :cards do
  link "支払い方法",cards_path
  parent :mypages
end
crumb :newcards do
  link "クレジットカード情報登録",new_card_path
  parent :cards
end

crumb :itemdeatail do
  link "#{Item.find(id = params[:id]).name}", item_path
  parent :root
end

# crumb :exhibit_exhibiting do
#   link "出品した商品 - 出品中",_path
#   parent :mypages
# end

# crumb :exhibit_during_trading do
#   link "出品した商品 - 取引中",_path
#   parent :mypages
# end

# crumb :exhibit_sold do
#   link "出品した商品 - 売却済み",_path
#   parent :mypages
# end

# crumb :buy_during_trading do
#   link "購入した商品 - 取引中",_path
#   parent :mypages
# end

# crumb :buy_past_trade do
#   link "購入した商品 - 過去の取引",_path
#   parent :mypages
# end

# crumb :profile do
#   link "プロフィール", edit_mypage_path (current_user.id)
#   parent :mypages
# end