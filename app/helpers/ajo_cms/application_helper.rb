module AjoCms
  module ApplicationHelper
  	def detail_helper(label_name, field)
  		content_tag :div, :class => 'field' do
	  		content_tag(:div, label_name, :class => 'label-head') +
	  		content_tag(:div, field.empty? ? '--' : field, :class => 'detail')
	  	end
  	end
  end
end
