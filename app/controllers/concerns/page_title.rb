module PageTitle
  extend ActiveSupport::Concern

  included do 
    before_action :page_title
  end

  def page_title 
    @page_title = "Zakwan Portfolio | Rails"
    @seo_keyword = "Zakwan Bhaiyat"
  end
end