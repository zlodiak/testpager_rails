module ApplicationHelper
	def news_widjet
    News.all.limit(6)
  end
end
