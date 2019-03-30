namespace :excel do
  desc "excelファイルを出力するタスク"
  task :items do
    require "net/http"
    uri = URI.parse("http://localhost:3000/item_list/export.xlsx")
    response = Net::HTTP.get_response(uri)
  end
end
