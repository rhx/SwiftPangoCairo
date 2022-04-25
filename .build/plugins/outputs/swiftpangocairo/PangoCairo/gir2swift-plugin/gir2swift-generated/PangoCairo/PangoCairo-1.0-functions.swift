import CGLib
import CCairo
import CPango
import GLib
import GLibObject
import Pango
import Cairo
/// Retrieves any font rendering options previously set with
/// [func`PangoCairo.context_set_font_options`].
/// 
/// This function does not report options that are derived from
/// the target surface by [func`update_context`].
@inlinable public func contextGetFontOptions<PangoContextT: Pango.ContextProtocol>(context: PangoContextT) -> Cairo.FontOptionsRef! {
    let result = pango_cairo_context_get_font_options(context.context_ptr)
    guard let rv = Cairo.FontOptionsRef(gconstpointer: gconstpointer(result)) else { return nil }
    return rv
}




/// Gets the resolution for the context.
/// 
/// See [func`PangoCairo.context_set_resolution`]
@inlinable public func contextGetResolution<PangoContextT: Pango.ContextProtocol>(context: PangoContextT) -> CDouble {
    let result = pango_cairo_context_get_resolution(context.context_ptr)
    let rv = result
    return rv
}




/// Sets callback function for context to use for rendering attributes
/// of type `PANGO_ATTR_SHAPE`.
/// 
/// See `PangoCairoShapeRendererFunc` for details.
/// 
/// Retrieves callback function and associated user data for rendering
/// attributes of type `PANGO_ATTR_SHAPE` as set by
/// [func`PangoCairo.context_set_shape_renderer`], if any.
@inlinable public func contextGetShapeRenderer<PangoContextT: Pango.ContextProtocol>(context: PangoContextT, data: UnsafeMutablePointer<gpointer?>? = nil) -> PangoCairoShapeRendererFunc! {
    let result = pango_cairo_context_get_shape_renderer(context.context_ptr, data)
    guard let rv = result else { return nil }
    return rv
}




/// Sets the font options used when rendering text with this context.
/// 
/// These options override any options that [func`update_context`]
/// derives from the target surface.
@inlinable public func contextSetFontOptions<PangoContextT: Pango.ContextProtocol>(context: PangoContextT, options: Cairo.FontOptionsRef? = nil) {
    
    pango_cairo_context_set_font_options(context.context_ptr, options?._ptr)
    
}
/// Sets the font options used when rendering text with this context.
/// 
/// These options override any options that [func`update_context`]
/// derives from the target surface.
@inlinable public func contextSetFontOptions<PangoContextT: Pango.ContextProtocol, cairoFontOptionsT: Cairo.FontOptionsProtocol>(context: PangoContextT, options: cairoFontOptionsT?) {
    
    pango_cairo_context_set_font_options(context.context_ptr, options?._ptr)
    
}




/// Sets the resolution for the context.
/// 
/// This is a scale factor between points specified in a `PangoFontDescription`
/// and Cairo units. The default value is 96, meaning that a 10 point font will
/// be 13 units high. (10 * 96. / 72. = 13.3).
@inlinable public func contextSetResolution<PangoContextT: Pango.ContextProtocol>(context: PangoContextT, dpi: CDouble) {
    
    pango_cairo_context_set_resolution(context.context_ptr, dpi)
    
}




/// Sets callback function for context to use for rendering attributes
/// of type `PANGO_ATTR_SHAPE`.
/// 
/// See `PangoCairoShapeRendererFunc` for details.
@inlinable public func contextSetShapeRenderer<PangoContextT: Pango.ContextProtocol>(context: PangoContextT, `func`: PangoCairoShapeRendererFunc? = nil, data: gpointer? = nil, dnotify: GDestroyNotify? = nil) {
    
    pango_cairo_context_set_shape_renderer(context.context_ptr, `func`, data, dnotify)
    
}




/// Creates a context object set up to match the current transformation
/// and target surface of the Cairo context.
/// 
/// This context can then be
/// used to create a layout using [ctor`Pango.Layout.new`].
/// 
/// This function is a convenience function that creates a context using
/// the default font map, then updates it to `cr`. If you just need to
/// create a layout for use with `cr` and do not need to access `PangoContext`
/// directly, you can use [func`create_layout`] instead.
@inlinable public func createContext<cairoContextT: Cairo.ContextProtocol>(cr: cairoContextT) -> Pango.ContextRef! {
    let result = pango_cairo_create_context(cr._ptr)
    guard let rv = Pango.ContextRef(gconstpointer: gconstpointer(result)) else { return nil }
    return rv
}




/// Creates a layout object set up to match the current transformation
/// and target surface of the Cairo context.
/// 
/// This layout can then be used for text measurement with functions
/// like [method`Pango.Layout.get_size`] or drawing with functions like
/// [func`show_layout`]. If you change the transformation or target
/// surface for `cr`, you need to call [func`update_layout`].
/// 
/// This function is the most convenient way to use Cairo with Pango,
/// however it is slightly inefficient since it creates a separate
/// `PangoContext` object for each layout. This might matter in an
/// application that was laying out large amounts of text.
@inlinable public func createLayout<cairoContextT: Cairo.ContextProtocol>(cr: cairoContextT) -> Pango.LayoutRef! {
    let result = pango_cairo_create_layout(cr._ptr)
    guard let rv = Pango.LayoutRef(gconstpointer: gconstpointer(result)) else { return nil }
    return rv
}




/// Add a squiggly line to the current path in the specified cairo context that
/// approximately covers the given rectangle in the style of an underline used
/// to indicate a spelling error.
/// 
/// The width of the underline is rounded to an integer number of up/down
/// segments and the resulting rectangle is centered in the original rectangle.
@inlinable public func errorUnderlinePath<cairoContextT: Cairo.ContextProtocol>(cr: cairoContextT, x: CDouble, y: CDouble, width: CDouble, height: CDouble) {
    
    pango_cairo_error_underline_path(cr._ptr, x, y, width, height)
    
}




/// Gets a default `PangoCairoFontMap` to use with Cairo.
/// 
/// Note that the type of the returned object will depend on the
/// particular font backend Cairo was compiled to use; you generally
/// should only use the `PangoFontMap` and `PangoCairoFontMap`
/// interfaces on the returned object.
/// 
/// The default Cairo fontmap can be changed by using
/// [method`PangoCairo.FontMap.set_default`]. This can be used to
/// change the Cairo font backend that the default fontmap uses
/// for example.
/// 
/// Note that since Pango 1.32.6, the default fontmap is per-thread.
/// Each thread gets its own default fontmap. In this way, PangoCairo
/// can be used safely from multiple threads.
@inlinable public func fontMapGetDefault() -> Pango.FontMapRef! {
    let result = pango_cairo_font_map_get_default()
    guard let rv = Pango.FontMapRef(gconstpointer: gconstpointer(result)) else { return nil }
    return rv
}




/// Creates a new `PangoCairoFontMap` object.
/// 
/// A fontmap is used to cache information about available fonts,
/// and holds certain global parameters such as the resolution.
/// In most cases, you can use `func`PangoCairo.font_map_get_default`]
/// instead.
/// 
/// Note that the type of the returned object will depend
/// on the particular font backend Cairo was compiled to use;
/// You generally should only use the `PangoFontMap` and
/// `PangoCairoFontMap` interfaces on the returned object.
/// 
/// You can override the type of backend returned by using an
/// environment variable `PANGOCAIRO_BACKEND`. Supported types,
/// based on your build, are fc (fontconfig), win32, and coretext.
/// If requested type is not available, NULL is returned. Ie.
/// this is only useful for testing, when at least two backends
/// are compiled in.
@inlinable public func fontMapNew() -> Pango.FontMapRef! {
    let result = pango_cairo_font_map_new()
    guard let rv = Pango.FontMapRef(gconstpointer: gconstpointer(result)) else { return nil }
    return rv
}




/// Creates a new `PangoCairoFontMap` object of the type suitable
/// to be used with cairo font backend of type `fonttype`.
/// 
/// In most cases one should simply use [func`PangoCairo.FontMap.new`], or
/// in fact in most of those cases, just use [func`PangoCairo.FontMap.get_default`].
@inlinable public func fontMapNewForFontType(fonttype: cairo_font_type_t) -> Pango.FontMapRef! {
    let result = pango_cairo_font_map_new_for_font_type(fonttype)
    guard let rv = Pango.FontMapRef(gconstpointer: gconstpointer(result)) else { return nil }
    return rv
}




/// Adds the glyphs in `glyphs` to the current path in the specified
/// cairo context.
/// 
/// The origin of the glyphs (the left edge of the baseline)
/// will be at the current point of the cairo context.
@inlinable public func glyphStringPath<PangoFontT: Pango.FontProtocol, PangoGlyphStringT: Pango.GlyphStringProtocol, cairoContextT: Cairo.ContextProtocol>(cr: cairoContextT, font: PangoFontT, glyphs: PangoGlyphStringT) {
    
    pango_cairo_glyph_string_path(cr._ptr, font.font_ptr, glyphs.glyph_string_ptr)
    
}




/// Adds the text in `PangoLayoutLine` to the current path in the
/// specified cairo context.
/// 
/// The origin of the glyphs (the left edge of the line) will be
/// at the current point of the cairo context.
@inlinable public func layoutLinePath<PangoLayoutLineT: Pango.LayoutLineProtocol, cairoContextT: Cairo.ContextProtocol>(cr: cairoContextT, line: PangoLayoutLineT) {
    
    pango_cairo_layout_line_path(cr._ptr, line.layout_line_ptr)
    
}




/// Adds the text in a `PangoLayout` to the current path in the
/// specified cairo context.
/// 
/// The top-left corner of the `PangoLayout` will be at the
/// current point of the cairo context.
@inlinable public func layoutPath<PangoLayoutT: Pango.LayoutProtocol, cairoContextT: Cairo.ContextProtocol>(cr: cairoContextT, layout: PangoLayoutT) {
    
    pango_cairo_layout_path(cr._ptr, layout.layout_ptr)
    
}




/// Draw a squiggly line in the specified cairo context that approximately
/// covers the given rectangle in the style of an underline used to indicate a
/// spelling error.
/// 
/// The width of the underline is rounded to an integer
/// number of up/down segments and the resulting rectangle is centered in the
/// original rectangle.
@inlinable public func showErrorUnderline<cairoContextT: Cairo.ContextProtocol>(cr: cairoContextT, x: CDouble, y: CDouble, width: CDouble, height: CDouble) {
    
    pango_cairo_show_error_underline(cr._ptr, x, y, width, height)
    
}




/// Draws the glyphs in `glyph_item` in the specified cairo context,
/// 
/// embedding the text associated with the glyphs in the output if the
/// output format supports it (PDF for example), otherwise it acts
/// similar to [func`show_glyph_string`].
/// 
/// The origin of the glyphs (the left edge of the baseline) will
/// be drawn at the current point of the cairo context.
/// 
/// Note that `text` is the start of the text for layout, which is then
/// indexed by `glyph_item-&gt;item-&gt;offset`.
@inlinable public func showGlyphItem<PangoGlyphItemT: Pango.GlyphItemProtocol, cairoContextT: Cairo.ContextProtocol>(cr: cairoContextT, text: UnsafePointer<CChar>!, glyphItem: PangoGlyphItemT) {
    
    pango_cairo_show_glyph_item(cr._ptr, text, glyphItem.glyph_item_ptr)
    
}




/// Draws the glyphs in `glyphs` in the specified cairo context.
/// 
/// The origin of the glyphs (the left edge of the baseline) will
/// be drawn at the current point of the cairo context.
@inlinable public func showGlyphString<PangoFontT: Pango.FontProtocol, PangoGlyphStringT: Pango.GlyphStringProtocol, cairoContextT: Cairo.ContextProtocol>(cr: cairoContextT, font: PangoFontT, glyphs: PangoGlyphStringT) {
    
    pango_cairo_show_glyph_string(cr._ptr, font.font_ptr, glyphs.glyph_string_ptr)
    
}




/// Draws a `PangoLayout` in the specified cairo context.
/// 
/// The top-left corner of the `PangoLayout` will be drawn
/// at the current point of the cairo context.
@inlinable public func showLayout<PangoLayoutT: Pango.LayoutProtocol, cairoContextT: Cairo.ContextProtocol>(cr: cairoContextT, layout: PangoLayoutT) {
    
    pango_cairo_show_layout(cr._ptr, layout.layout_ptr)
    
}




/// Draws a `PangoLayoutLine` in the specified cairo context.
/// 
/// The origin of the glyphs (the left edge of the line) will
/// be drawn at the current point of the cairo context.
@inlinable public func showLayoutLine<PangoLayoutLineT: Pango.LayoutLineProtocol, cairoContextT: Cairo.ContextProtocol>(cr: cairoContextT, line: PangoLayoutLineT) {
    
    pango_cairo_show_layout_line(cr._ptr, line.layout_line_ptr)
    
}




/// Updates a `PangoContext` previously created for use with Cairo to
/// match the current transformation and target surface of a Cairo
/// context.
/// 
/// If any layouts have been created for the context, it's necessary
/// to call [method`Pango.Layout.context_changed`] on those layouts.
@inlinable public func updateContext<PangoContextT: Pango.ContextProtocol, cairoContextT: Cairo.ContextProtocol>(cr: cairoContextT, context: PangoContextT) {
    
    pango_cairo_update_context(cr._ptr, context.context_ptr)
    
}




/// Updates the private `PangoContext` of a `PangoLayout` created with
/// [func`create_layout`] to match the current transformation and target
/// surface of a Cairo context.
@inlinable public func updateLayout<PangoLayoutT: Pango.LayoutProtocol, cairoContextT: Cairo.ContextProtocol>(cr: cairoContextT, layout: PangoLayoutT) {
    
    pango_cairo_update_layout(cr._ptr, layout.layout_ptr)
    
}


