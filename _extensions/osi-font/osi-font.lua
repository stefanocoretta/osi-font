-- Adapted from fontawesome Quarto extension: https://github.com/quarto-ext/fontawesome/blob/main/_extensions/fontawesome/fontawesome.lua

local function ensureHtmlDeps()
  quarto.doc.add_html_dependency({
    name = 'Open-Science-icons',
    version = '0.1.1',
    stylesheets = {'assets/css/osi.css'}
  })
end

return {
  ["osi"] = function(args)

    local icon = pandoc.utils.stringify(args[1])
    
    -- detect html (excluding epub which won't handle fa)
    if quarto.doc.is_format("html:js") then
      ensureHtmlDeps()
      return pandoc.RawInline(
        'html',
        "<i class=\"osi osi-" .. icon .. "\"></i>"
      )
    else
      return pandoc.Null()
    end
  end
}