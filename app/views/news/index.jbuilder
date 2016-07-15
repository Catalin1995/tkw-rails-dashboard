json.code 200
json.body do |json|
  json.partial! 'news', collection: @news, as: :n
end
