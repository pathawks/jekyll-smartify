require 'redcarpet'

module SmartyPants
  def smartify(input)
    Redcarpet::Render::SmartyPants.render(input)
  end
end

Liquid::Template.register_filter(SmartyPants)
