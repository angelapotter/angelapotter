module ApplicationHelper
  def source_code_url
    'https://github.com/angelapotter/angelapotter'
  end

  def next_item_with_case_study item
    i = portfolio_items_with_case_studies.index item
    portfolio_items_with_case_studies[ i + 1 ]
  end

  def prev_item_with_case_study item
    i = portfolio_items_with_case_studies.index item
    if i > 0
      portfolio_items_with_case_studies[ i - 1 ]
    end
  end
end
