module ApplicationHelper
  def title(*title)
    unless title.empty?
      content_for :title do
        (title << "Ticketee").join " | "
      end
    end
  end
end
