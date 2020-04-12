class PresentationsController < ApplicationController
  def coffee
    set_theme_or_render_not_found
    @title = "DTL: Coffee"
    render :coffee, :layout => "presentation"
  end

  def vr
    set_theme_or_render_not_found
    @title = "Virtual Reality"
    render :vr, :layout => "presentation"
  end

  private
  def set_theme_or_render_not_found
    @dark_themes = %w(black blood league moon)
    @light_themes = %w(beige hull-blue serif simple sky solarized white)
    @themes = @dark_themes + @light_themes

    @theme = params['theme'] || 'black'

    if !@themes.include? @theme
      return render :theme_not_found, :layout => false
    end

    if @dark_themes.include? @theme
      @blue  = "#80FFFF"
      @green = "#99FFCC"
      @pink  = "#FFB3D9"
    else
      @blue  = "#00CCCC"
      @green = "#00E673"
      @pink  = "#E60073"
    end
  end
end
