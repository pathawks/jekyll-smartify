require 'redcarpet'

module SmartyPants
  def smartypants(input)
    Redcarpet::Render::SmartyPants.render(input)
  end
end

Liquid::Template.register_filter(SmartyPants)
