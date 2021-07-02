class DashboardController < ApplicationController
  def index
    @last12_sales = Sale.group_by_month(:sale_date, last: 12, format: "%b-%Y").order(sale_date: :asc).sum(:price)
    @last12_sales_count = Sale.group_by_month(:sale_date, last: 12, format: "%b-%Y").order(sale_date: :asc).count
    @last12_sales_avg = Sale.group_by_month(:sale_date, last: 12, format: "%b-%Y").order(sale_date: :asc).average(:price)
    @last12_sales_origin = Sale.where('sale_date >= ?', 1.year.ago).group(:origin).order(sale_date: :asc).count
    @last6_sales_origin = Sale.where('sale_date >= ?', 6.month.ago).group(:origin).order(sale_date: :asc).count
    @last3_sales_origin = Sale.where('sale_date >= ?', 3.month.ago).group(:origin).order(sale_date: :asc).count
    @last1_sales_origin = Sale.where('sale_date >= ?', 1.month.ago).group(:origin).order(sale_date: :asc).count

    @last12_sales_blend = Sale.where("sale_date >= ?", 1.year.ago).group(:blend).order(sale_date: :asc).count
    @last6_sales_blend = Sale.where("sale_date >= ?", 6.month.ago).group(:blend).order(sale_date: :asc).count
    @last3_sales_blend = Sale.where("sale_date >= ?", 3.month.ago).group(:blend).order(sale_date: :asc).count
    @last1_sales_blend = Sale.where("sale_date >= ?", 1.month.ago).group(:blend).order(sale_date: :asc).count


    #--------------------------------------------------------Por Active Record
    @sales_last12 = Sale.where("sale_date >= ?", 12.month.ago).group("strftime('%m-%Y', sale_date)").order(sale_date: :asc).sum(:price)
  end
end
