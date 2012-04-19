class LabelledFormBuilder < ActionView::Helpers::FormBuilder
	def text_field(name, field, *args)
		@template.content_tag :div, class: "field" do
			label(name) + super(field, *args)
		end
	end

	def text_area(name, field, *args)
		@template.content_tag :div, class: "field" do
			label(name) + super(field, *args)
		end
	end

	# def submit(name, *args)
		# @template.content_tag :div, class: "field" do
			# super(name, *args)
		# end
	# end
end