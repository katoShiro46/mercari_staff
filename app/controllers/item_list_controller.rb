class ItemListController < ApplicationController
  before_action :staff?
  before_action :header_menu

  def index
    @items = Item.all
  end

  def search
  end


  def export
    # モデルに記載すべき箇所はモデルへ記載
    require 'rubyXL'
    @items = Item.all
    workbook = RubyXL::Parser.parse('app/assets/item.xlsx')
    workbook.calc_pr.full_calc_on_load = true
    workbook.calc_pr.calc_completed = true
    workbook.calc_pr.calc_on_save = true
    workbook.calc_pr.force_full_calc = true
    worksheet = workbook[0]
    num = 1
    @items.each do |item|
      worksheet.add_cell(num,0,item.id)
      worksheet.add_cell(num,1,item.name)
      worksheet.add_cell(num,2,item.description)
      worksheet.add_cell(num,3,item.price)
      worksheet.add_cell(num,4,item.condition)
      worksheet.add_cell(num,5,item.shipping_method)
      worksheet.add_cell(num,6,item.shipping_date)
      worksheet.add_cell(num,7,item.shipping_fee)
      worksheet.add_cell(num,8,item.prefecture.name)
      worksheet.add_cell(num,9,item.brand) unless item.brand.nil?
      worksheet.add_cell(num,10,item.size.name) unless item.size.nil?
      worksheet.add_cell(num,11,item.category.root.name)
      worksheet.add_cell(num,12,item.category.parent.name)
      worksheet.add_cell(num,13,item.category.name)
      worksheet.add_cell(num,14,item.vendor.user.nickname)
      # 出力できていない。
      # worksheet.add_cell(num,15,item.created_at)
      # worksheet.add_cell(num,16,item.updated_at)
      num += 1
    end
    respond_to do |format|
      format.html
      # 任意の場所に保存できるように改良する
      format.xlsx {send_data workbook.stream.string,filename:"item_lists#{Time.now}.xlsx"}
    end
  end
end
