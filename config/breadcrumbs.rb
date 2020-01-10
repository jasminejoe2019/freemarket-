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

# crumb :profile do
#   link "プロフィール", edit_mypage_path (current_user.id)
#   parent :mypages
# end

# crumb : do
#   link "商品名", show_item_path
#   parent :root
# end