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
  link "プロフィール", profile_mypage_path(current_user.id)
  parent :mypages
end

crumb :shipping_addresses do
  link "発送元・お届け先住所変更", shipping_addresses_path
  parent :mypages
end

crumb :payments do
  link "支払い方法", payments_path
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

# crumb :profile do
#   link "プロフィール", edit_mypage_path (current_user.id)
#   parent :mypages
# end

# crumb : do
#   link "商品名", show_item_path
#   parent :root
# end