
func cast(_ param: UInt)   -> Int    {    Int(bitPattern: param) }
func cast(_ param: Int)    -> UInt   {   UInt(bitPattern: param) }
func cast(_ param: UInt16) -> Int16  {  Int16(bitPattern: param) }
func cast(_ param: Int16)  -> UInt16 { UInt16(bitPattern: param) }
func cast(_ param: UInt32) -> Int32  {  Int32(bitPattern: param) }
func cast(_ param: Int32)  -> UInt32 { UInt32(bitPattern: param) }
func cast(_ param: UInt64) -> Int64  {  Int64(bitPattern: param) }
func cast(_ param: Int64)  -> UInt64 { UInt64(bitPattern: param) }
func cast(_ param: Float)  -> Double { Double(param) }
func cast(_ param: Float80) -> Double { Double(param) }
func cast(_ param: Double) -> Float { Float(param) }
func cast(_ param: Double) -> Float80 { Float80(param) }
func cast<U: UnsignedInteger>(_ param: U) -> Int { Int(param) }
func cast<S: SignedInteger>(_ param: S) -> Int { Int(param) }
func cast<U: UnsignedInteger>(_ param: Int) -> U { U(param) }
func cast<S: SignedInteger>(_ param: Int) -> S  { S(param) }
func cast<I: BinaryInteger>(_ param: I) -> Int32 { Int32(param) }
func cast<I: BinaryInteger>(_ param: I) -> UInt32 { UInt32(param) }
func cast<I: BinaryInteger>(_ param: I) -> Bool { param != 0 }
func cast<I: BinaryInteger>(_ param: Bool) -> I { param ? 1 : 0 }

func cast(_ param: UnsafeRawPointer?) -> String! {
    return param.map { String(cString: $0.assumingMemoryBound(to: CChar.self)) }
}

func cast(_ param: OpaquePointer?) -> String! {
    return param.map { String(cString: UnsafePointer<CChar>($0)) }
}

func cast(_ param: UnsafeRawPointer) -> OpaquePointer! {
    return OpaquePointer(param)
}

func cast<S, T>(_ param: UnsafeMutablePointer<S>?) -> UnsafeMutablePointer<T>! {
    return param?.withMemoryRebound(to: T.self, capacity: 1) { $0 }
}

func cast<S, T>(_ param: UnsafeMutablePointer<S>?) -> UnsafePointer<T>! {
    return param?.withMemoryRebound(to: T.self, capacity: 1) { UnsafePointer<T>($0) }
}

func cast<S, T>(_ param: UnsafePointer<S>?) -> UnsafePointer<T>! {
    return param?.withMemoryRebound(to: T.self, capacity: 1) { UnsafePointer<T>($0) }
}

func cast<T>(_ param: OpaquePointer?) -> UnsafeMutablePointer<T>! {
    return UnsafeMutablePointer<T>(param)
}

func cast<T>(_ param: OpaquePointer?) -> UnsafePointer<T>! {
    return UnsafePointer<T>(param)
}

func cast(_ param: OpaquePointer?) -> UnsafeMutableRawPointer! {
    return UnsafeMutableRawPointer(param)
}

func cast(_ param: UnsafeRawPointer?) -> UnsafeMutableRawPointer! {
    return UnsafeMutableRawPointer(mutating: param)
}

func cast<T>(_ param: UnsafePointer<T>?) -> OpaquePointer! {
    return OpaquePointer(param)
}

func cast<T>(_ param: UnsafeMutablePointer<T>?) -> OpaquePointer! {
    return OpaquePointer(param)
}

func cast<T>(_ param: UnsafeRawPointer?) -> UnsafeMutablePointer<T>! {
    return UnsafeMutableRawPointer(mutating: param)?.assumingMemoryBound(to: T.self)
}

func cast<T>(_ param: UnsafeMutableRawPointer?) -> UnsafeMutablePointer<T>! {
    return param?.assumingMemoryBound(to: T.self)
}

func cast<T>(_ param: T) -> T { return param }

extension gboolean {
    private init(_ b: Bool) { self = b ? gboolean(1) : gboolean(0) }
}

func asStringArray(_ param: UnsafePointer<UnsafePointer<CChar>?>) -> [String] {
    var ptr = param
    var rv = [String]()
    while ptr.pointee != nil {
        rv.append(String(cString: ptr.pointee!))
        ptr = ptr.successor()
    }
    return rv
}

func asStringArray<T>(_ param: UnsafePointer<UnsafePointer<CChar>?>, release: ((UnsafePointer<T>?) -> Void)) -> [String] {
    let rv = asStringArray(param)
    param.withMemoryRebound(to: T.self, capacity: rv.count) { release(UnsafePointer<T>($0)) }
    return rv
}
import CGLib
import CCairo
import CPango
import GLib
import GLibObject
import Pango
import Cairo

// Definitions missing from newer versions of PangoCairo, but still in the .gir
public typealias PangoCairoFcFontMap = _PangoCairoFcFontMap
public typealias PangoCairoCoreTextFont = _PangoCairoCoreTextFont
public typealias PangoCairoCoreTextFontClass = _PangoCairoCoreTextFontClass
public typealias PangoCairoCoreTextFontMap = _PangoCairoCoreTextFontMap








/// Function type for rendering attributes of type `PANGO_ATTR_SHAPE`
/// with Pango's Cairo renderer.
public typealias ShapeRendererFunc = PangoCairoShapeRendererFunc
/// Retrieves any font rendering options previously set with
/// `pango_cairo_context_set_font_options()`. This function does not report options
/// that are derived from the target surface by `pango_cairo_update_context()`
public func contextGetFontOptions(context: Pango.ContextProtocol) -> UnsafePointer<cairo_font_options_t>! {
    let rv: UnsafePointer<cairo_font_options_t>! = cast(pango_cairo_context_get_font_options(cast(context.ptr)))
    return cast(rv)
}




/// Gets the resolution for the context. See `pango_cairo_context_set_resolution()`
public func contextGetResolution(context: Pango.ContextProtocol) -> Double {
    let rv: Double = cast(pango_cairo_context_get_resolution(cast(context.ptr)))
    return cast(rv)
}




/// Sets callback function for context to use for rendering attributes
/// of type `PANGO_ATTR_SHAPE`.  See `PangoCairoShapeRendererFunc` for
/// details.
/// 
/// Retrieves callback function and associated user data for rendering
/// attributes of type `PANGO_ATTR_SHAPE` as set by
/// `pango_cairo_context_set_shape_renderer()`, if any.
public func contextGetShapeRenderer(context: Pango.ContextProtocol, data: UnsafeMutablePointer<UnsafeMutableRawPointer>) -> PangoCairoShapeRendererFunc! {
    let rv: PangoCairoShapeRendererFunc! = cast(pango_cairo_context_get_shape_renderer(cast(context.ptr), cast(data)))
    return cast(rv)
}




/// Sets the font options used when rendering text with this context.
/// These options override any options that `pango_cairo_update_context()`
/// derives from the target surface.
public func contextSetFontOptions(context: Pango.ContextProtocol, options: FontOptionsProtocol) {
    pango_cairo_context_set_font_options(cast(context.ptr), cast(options.ptr))

}




/// Sets the resolution for the context. This is a scale factor between
/// points specified in a `PangoFontDescription` and Cairo units. The
/// default value is 96, meaning that a 10 point font will be 13
/// units high. (10 * 96. / 72. = 13.3).
public func contextSetResolution(context: Pango.ContextProtocol, dpi: gdouble) {
    pango_cairo_context_set_resolution(cast(context.ptr), dpi)

}




/// Sets callback function for context to use for rendering attributes
/// of type `PANGO_ATTR_SHAPE`.  See `PangoCairoShapeRendererFunc` for
/// details.
public func contextSetShapeRenderer(context: Pango.ContextProtocol, func_: @escaping ShapeRendererFunc, data: UnsafeMutableRawPointer, dnotify: @escaping GLib.DestroyNotify) {
    pango_cairo_context_set_shape_renderer(cast(context.ptr), func_, cast(data), dnotify)

}




/// Creates a context object set up to match the current transformation
/// and target surface of the Cairo context.  This context can then be
/// used to create a layout using `pango_layout_new()`.
/// 
/// This function is a convenience function that creates a context using
/// the default font map, then updates it to `cr`.  If you just need to
/// create a layout for use with `cr` and do not need to access `PangoContext`
/// directly, you can use `pango_cairo_create_layout()` instead.
public func createContext(cr: cairo.ContextProtocol) -> UnsafeMutablePointer<PangoContext>! {
    let rv: UnsafeMutablePointer<PangoContext>! = cast(pango_cairo_create_context(cast(cr.ptr)))
    return cast(rv)
}




/// Creates a layout object set up to match the current transformation
/// and target surface of the Cairo context.  This layout can then be
/// used for text measurement with functions like
/// `pango_layout_get_size()` or drawing with functions like
/// `pango_cairo_show_layout()`. If you change the transformation
/// or target surface for `cr`, you need to call `pango_cairo_update_layout()`
/// 
/// This function is the most convenient way to use Cairo with Pango,
/// however it is slightly inefficient since it creates a separate
/// `PangoContext` object for each layout. This might matter in an
/// application that was laying out large amounts of text.
public func createLayout(cr: cairo.ContextProtocol) -> UnsafeMutablePointer<PangoLayout>! {
    let rv: UnsafeMutablePointer<PangoLayout>! = cast(pango_cairo_create_layout(cast(cr.ptr)))
    return cast(rv)
}




/// Add a squiggly line to the current path in the specified cairo context that
/// approximately covers the given rectangle in the style of an underline used
/// to indicate a spelling error.  (The width of the underline is rounded to an
/// integer number of up/down segments and the resulting rectangle is centered
/// in the original rectangle)
public func errorUnderlinePath(cr: cairo.ContextProtocol, x: gdouble, y: gdouble, width: gdouble, height: gdouble) {
    pango_cairo_error_underline_path(cast(cr.ptr), x, y, width, height)

}




/// Gets a default `PangoCairoFontMap` to use with Cairo.
/// 
/// Note that the type of the returned object will depend
/// on the particular font backend Cairo was compiled to use;
/// You generally should only use the `PangoFontMap` and
/// `PangoCairoFontMap` interfaces on the returned object.
/// 
/// The default Cairo fontmap can be changed by using
/// `pango_cairo_font_map_set_default()`.  This can be used to
/// change the Cairo font backend that the default fontmap
/// uses for example.
/// 
/// Note that since Pango 1.32.6, the default fontmap is per-thread.
/// Each thread gets its own default fontmap.  In this way,
/// PangoCairo can be used safely from multiple threads.
public func fontMapGetDefault() -> UnsafeMutablePointer<PangoFontMap>! {
    let rv: UnsafeMutablePointer<PangoFontMap>! = cast(pango_cairo_font_map_get_default())
    return cast(rv)
}




/// Creates a new `PangoCairoFontMap` object; a fontmap is used
/// to cache information about available fonts, and holds
/// certain global parameters such as the resolution.
/// In most cases, you can use `pango_cairo_font_map_get_default()`
/// instead.
/// 
/// Note that the type of the returned object will depend
/// on the particular font backend Cairo was compiled to use;
/// You generally should only use the `PangoFontMap` and
/// `PangoCairoFontMap` interfaces on the returned object.
/// 
/// You can override the type of backend returned by using an
/// environment variable `PANGOCAIRO_BACKEND`.  Supported types,
/// based on your build, are fc (fontconfig), win32, and coretext.
/// If requested type is not available, NULL is returned. Ie.
/// this is only useful for testing, when at least two backends
/// are compiled in.
public func fontMapNew() -> UnsafeMutablePointer<PangoFontMap>! {
    let rv: UnsafeMutablePointer<PangoFontMap>! = cast(pango_cairo_font_map_new())
    return cast(rv)
}




/// Creates a new `PangoCairoFontMap` object of the type suitable
/// to be used with cairo font backend of type `fonttype`.
/// 
/// In most cases one should simply use `pango_cairo_font_map_new``()`,
/// or in fact in most of those cases, just use
/// `pango_cairo_font_map_get_default``()`.
public func fontMapNewForFontType(fonttype: cairo.FontType) -> UnsafeMutablePointer<PangoFontMap>! {
    let rv: UnsafeMutablePointer<PangoFontMap>! = cast(pango_cairo_font_map_new_for_font_type(fonttype))
    return cast(rv)
}




/// Adds the glyphs in `glyphs` to the current path in the specified
/// cairo context. The origin of the glyphs (the left edge of the baseline)
/// will be at the current point of the cairo context.
public func glyphStringPath(cr: cairo.ContextProtocol, font: FontProtocol, glyphs: GlyphStringProtocol) {
    pango_cairo_glyph_string_path(cast(cr.ptr), cast(font.ptr), cast(glyphs.ptr))

}




/// Adds the text in `PangoLayoutLine` to the current path in the
/// specified cairo context.  The origin of the glyphs (the left edge
/// of the line) will be at the current point of the cairo context.
public func layoutLinePath(cr: cairo.ContextProtocol, line: LayoutLineProtocol) {
    pango_cairo_layout_line_path(cast(cr.ptr), cast(line.ptr))

}




/// Adds the text in a `PangoLayout` to the current path in the
/// specified cairo context.  The top-left corner of the `PangoLayout`
/// will be at the current point of the cairo context.
public func layoutPath(cr: cairo.ContextProtocol, layout: LayoutProtocol) {
    pango_cairo_layout_path(cast(cr.ptr), cast(layout.ptr))

}




/// Draw a squiggly line in the specified cairo context that approximately
/// covers the given rectangle in the style of an underline used to indicate a
/// spelling error.  (The width of the underline is rounded to an integer
/// number of up/down segments and the resulting rectangle is centered in the
/// original rectangle)
public func showErrorUnderline(cr: cairo.ContextProtocol, x: gdouble, y: gdouble, width: gdouble, height: gdouble) {
    pango_cairo_show_error_underline(cast(cr.ptr), x, y, width, height)

}




/// Draws the glyphs in `glyph_item` in the specified cairo context,
/// embedding the text associated with the glyphs in the output if the
/// output format supports it (PDF for example), otherwise it acts
/// similar to `pango_cairo_show_glyph_string()`.
/// 
/// The origin of the glyphs (the left edge of the baseline) will
/// be drawn at the current point of the cairo context.
/// 
/// Note that `text` is the start of the text for layout, which is then
/// indexed by <literal>`glyph_item`->item->offset</literal>.
public func showGlyphItem(cr: cairo.ContextProtocol, text: UnsafePointer<CChar>, glyphItem glyph_item: GlyphItemProtocol) {
    pango_cairo_show_glyph_item(cast(cr.ptr), text, cast(glyph_item.ptr))

}




/// Draws the glyphs in `glyphs` in the specified cairo context.
/// The origin of the glyphs (the left edge of the baseline) will
/// be drawn at the current point of the cairo context.
public func showGlyphString(cr: cairo.ContextProtocol, font: FontProtocol, glyphs: GlyphStringProtocol) {
    pango_cairo_show_glyph_string(cast(cr.ptr), cast(font.ptr), cast(glyphs.ptr))

}




/// Draws a `PangoLayout` in the specified cairo context.
/// The top-left corner of the `PangoLayout` will be drawn
/// at the current point of the cairo context.
public func showLayout(cr: cairo.ContextProtocol, layout: LayoutProtocol) {
    pango_cairo_show_layout(cast(cr.ptr), cast(layout.ptr))

}




/// Draws a `PangoLayoutLine` in the specified cairo context.
/// The origin of the glyphs (the left edge of the line) will
/// be drawn at the current point of the cairo context.
public func showLayoutLine(cr: cairo.ContextProtocol, line: LayoutLineProtocol) {
    pango_cairo_show_layout_line(cast(cr.ptr), cast(line.ptr))

}




/// Updates a `PangoContext` previously created for use with Cairo to
/// match the current transformation and target surface of a Cairo
/// context. If any layouts have been created for the context,
/// it's necessary to call `pango_layout_context_changed()` on those
/// layouts.
public func updateContext(cr: cairo.ContextProtocol, context: Pango.ContextProtocol) {
    pango_cairo_update_context(cast(cr.ptr), cast(context.ptr))

}




/// Updates the private `PangoContext` of a `PangoLayout` created with
/// `pango_cairo_create_layout()` to match the current transformation
/// and target surface of a Cairo context.
public func updateLayout(cr: cairo.ContextProtocol, layout: LayoutProtocol) {
    pango_cairo_update_layout(cast(cr.ptr), cast(layout.ptr))

}



// MARK: - Font Interface

/// The `FontProtocol` protocol exposes the methods and properties of an underlying `PangoCairoFont` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `Font`.
/// Alternatively, use `FontRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///
/// `PangoCairoFont` is an interface exported by fonts for
/// use with Cairo. The actual type of the font will depend
/// on the particular font technology Cairo was compiled to use.
public protocol FontProtocol: Pango.FontProtocol {
        /// Untyped pointer to the underlying `PangoCairoFont` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `PangoCairoFont` instance.
    var font_ptr: UnsafeMutablePointer<PangoCairoFont> { get }
}

/// The `FontRef` type acts as a lightweight Swift reference to an underlying `PangoCairoFont` instance.
/// It exposes methods that can operate on this data type through `FontProtocol` conformance.
/// Use `FontRef` only as an `unowned` reference to an existing `PangoCairoFont` instance.
///
/// `PangoCairoFont` is an interface exported by fonts for
/// use with Cairo. The actual type of the font will depend
/// on the particular font technology Cairo was compiled to use.
public struct FontRef: FontProtocol {
        /// Untyped pointer to the underlying `PangoCairoFont` instance.
    /// For type-safe access, use the generated, typed pointer `font_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension FontRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<PangoCairoFont>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `FontProtocol`
    init<T: FontProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `Font` type acts as a reference-counted owner of an underlying `PangoCairoFont` instance.
/// It provides the methods that can operate on this data type through `FontProtocol` conformance.
/// Use `Font` as a strong reference or owner of a `PangoCairoFont` instance.
///
/// `PangoCairoFont` is an interface exported by fonts for
/// use with Cairo. The actual type of the font will depend
/// on the particular font technology Cairo was compiled to use.
open class Font: Pango.Font, FontProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Font` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<PangoCairoFont>) {
        super.init(cast(op))
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `PangoCairoFont`.
    /// i.e., ownership is transferred to the `Font` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<PangoCairoFont>) {
        super.init(retaining: cast(op))
    }

    /// Reference intialiser for a related type that implements `FontProtocol`
    /// Will retain `PangoCairoFont`.
    /// - Parameter other: an instance of a related type that implements `FontProtocol`
    public init<T: FontProtocol>(pangoCairoFont other: T) {
        super.init(retaining: cast(other.font_ptr))
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }



}

// MARK: no Font properties

public enum FontSignalName: String, SignalNameProtocol {
    /// The notify signal is emitted on an object when one of its properties has
    /// its value set through `g_object_set_property()`, `g_object_set()`, et al.
    /// 
    /// Note that getting this signal doesn’t itself guarantee that the value of
    /// the property has actually changed. When it is emitted is determined by the
    /// derived GObject class. If the implementor did not create the property with
    /// `G_PARAM_EXPLICIT_NOTIFY`, then any call to `g_object_set_property()` results
    /// in `notify` being emitted, even if the new value is the same as the old.
    /// If they did pass `G_PARAM_EXPLICIT_NOTIFY`, then this signal is emitted only
    /// when they explicitly call `g_object_notify()` or `g_object_notify_by_pspec()`,
    /// and common practice is to do that only when the value has actually changed.
    /// 
    /// This signal is typically used to obtain change notification for a
    /// single property, by specifying the property name as a detail in the
    /// `g_signal_connect()` call, like this:
    /// (C Language Example):
    /// ```C
    /// g_signal_connect (text_view->buffer, "notify::paste-target-list",
    ///                   G_CALLBACK (gtk_text_view_target_list_notify),
    ///                   text_view)
    /// ```
    /// It is important to note that you must use
    /// [canonical parameter names](#canonical-parameter-names) as
    /// detail strings for the notify signal.
    case notify = "notify"

}

public extension FontProtocol {
    /// Connect a `FontSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @discardableResult func connect(signal kind: FontSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
        func _connect(signal name: UnsafePointer<gchar>, flags: ConnectFlags, data: GLibObject.SignalHandlerClosureHolder, handler: @convention(c) @escaping (gpointer, gpointer) -> Void) -> Int {
            let holder = UnsafeMutableRawPointer(Unmanaged.passRetained(data).toOpaque())
            let callback = unsafeBitCast(handler, to: GLibObject.Callback.self)
            let rv = GLibObject.ObjectRef(cast(font_ptr)).signalConnectData(detailedSignal: name, cHandler: callback, data: holder, destroyData: {
                if let swift = UnsafeRawPointer($0) {
                    let holder = Unmanaged<GLibObject.SignalHandlerClosureHolder>.fromOpaque(swift)
                    holder.release()
                }
                let _ = $1
            }, connectFlags: flags)
            return rv
        }
        let rv = _connect(signal: kind.name, flags: f, data: ClosureHolder(handler)) {
            let ptr = UnsafeRawPointer($1)
            let holder = Unmanaged<GLibObject.SignalHandlerClosureHolder>.fromOpaque(ptr).takeUnretainedValue()
            holder.call(())
        }
        return rv
    }
}

// MARK: Font Interface: FontProtocol extension (methods and fields)
public extension FontProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `PangoCairoFont` instance.
    var font_ptr: UnsafeMutablePointer<PangoCairoFont> { return ptr.assumingMemoryBound(to: PangoCairoFont.self) }

    /// Gets the `cairo_scaled_font_t` used by `font`.
    /// The scaled font can be referenced and kept using
    /// `cairo_scaled_font_reference()`.
    func getScaledFont() -> UnsafeMutablePointer<cairo_scaled_font_t>! {
        let rv: UnsafeMutablePointer<cairo_scaled_font_t>! = cast(pango_cairo_font_get_scaled_font(cast(font_ptr)))
        return cast(rv)
    }

    /// Adds the glyphs in `glyphs` to the current path in the specified
    /// cairo context. The origin of the glyphs (the left edge of the baseline)
    /// will be at the current point of the cairo context.
    func glyphStringPath(cr: cairo.ContextProtocol, glyphs: GlyphStringProtocol) {
        pango_cairo_glyph_string_path(cast(cr.ptr), cast(font_ptr), cast(glyphs.ptr))
    
    }

    /// Draws the glyphs in `glyphs` in the specified cairo context.
    /// The origin of the glyphs (the left edge of the baseline) will
    /// be drawn at the current point of the cairo context.
    func showGlyphString(cr: cairo.ContextProtocol, glyphs: GlyphStringProtocol) {
        pango_cairo_show_glyph_string(cast(cr.ptr), cast(font_ptr), cast(glyphs.ptr))
    
    }
    /// Gets the `cairo_scaled_font_t` used by `font`.
    /// The scaled font can be referenced and kept using
    /// `cairo_scaled_font_reference()`.
    var scaledFont: UnsafeMutablePointer<cairo_scaled_font_t>! {
        /// Gets the `cairo_scaled_font_t` used by `font`.
        /// The scaled font can be referenced and kept using
        /// `cairo_scaled_font_reference()`.
        get {
            let rv: UnsafeMutablePointer<cairo_scaled_font_t>! = cast(pango_cairo_font_get_scaled_font(cast(font_ptr)))
            return cast(rv)
        }
    }


}



// MARK: - FontMap Interface

/// The `FontMapProtocol` protocol exposes the methods and properties of an underlying `PangoCairoFontMap` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `FontMap`.
/// Alternatively, use `FontMapRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///
/// `PangoCairoFontMap` is an interface exported by font maps for
/// use with Cairo. The actual type of the font map will depend
/// on the particular font technology Cairo was compiled to use.
public protocol FontMapProtocol: Pango.FontMapProtocol {
        /// Untyped pointer to the underlying `PangoCairoFontMap` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `PangoCairoFontMap` instance.
    var font_map_ptr: UnsafeMutablePointer<PangoCairoFontMap> { get }
}

/// The `FontMapRef` type acts as a lightweight Swift reference to an underlying `PangoCairoFontMap` instance.
/// It exposes methods that can operate on this data type through `FontMapProtocol` conformance.
/// Use `FontMapRef` only as an `unowned` reference to an existing `PangoCairoFontMap` instance.
///
/// `PangoCairoFontMap` is an interface exported by font maps for
/// use with Cairo. The actual type of the font map will depend
/// on the particular font technology Cairo was compiled to use.
public struct FontMapRef: FontMapProtocol {
        /// Untyped pointer to the underlying `PangoCairoFontMap` instance.
    /// For type-safe access, use the generated, typed pointer `font_map_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension FontMapRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<PangoCairoFontMap>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `FontMapProtocol`
    init<T: FontMapProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        /// Gets a default `PangoCairoFontMap` to use with Cairo.
    /// 
    /// Note that the type of the returned object will depend
    /// on the particular font backend Cairo was compiled to use;
    /// You generally should only use the `PangoFontMap` and
    /// `PangoCairoFontMap` interfaces on the returned object.
    /// 
    /// The default Cairo fontmap can be changed by using
    /// `pango_cairo_font_map_set_default()`.  This can be used to
    /// change the Cairo font backend that the default fontmap
    /// uses for example.
    /// 
    /// Note that since Pango 1.32.6, the default fontmap is per-thread.
    /// Each thread gets its own default fontmap.  In this way,
    /// PangoCairo can be used safely from multiple threads.
    static func getDefault() -> FontMapRef! {
        let rv: UnsafeMutablePointer<PangoFontMap>! = cast(pango_cairo_font_map_get_default())
        return rv.map { FontMapRef(cast($0)) }
    }

    /// Creates a new `PangoCairoFontMap` object of the type suitable
    /// to be used with cairo font backend of type `fonttype`.
    /// 
    /// In most cases one should simply use `pango_cairo_font_map_new``()`,
    /// or in fact in most of those cases, just use
    /// `pango_cairo_font_map_get_default``()`.
    static func newFor(fontType fonttype: cairo.FontType) -> FontMapRef! {
        let rv: UnsafeMutablePointer<PangoFontMap>! = cast(pango_cairo_font_map_new_for_font_type(fonttype))
        return rv.map { FontMapRef(cast($0)) }
    }
}

/// The `FontMap` type acts as a reference-counted owner of an underlying `PangoCairoFontMap` instance.
/// It provides the methods that can operate on this data type through `FontMapProtocol` conformance.
/// Use `FontMap` as a strong reference or owner of a `PangoCairoFontMap` instance.
///
/// `PangoCairoFontMap` is an interface exported by font maps for
/// use with Cairo. The actual type of the font map will depend
/// on the particular font technology Cairo was compiled to use.
open class FontMap: Pango.FontMap, FontMapProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `FontMap` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<PangoCairoFontMap>) {
        super.init(cast(op))
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `PangoCairoFontMap`.
    /// i.e., ownership is transferred to the `FontMap` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<PangoCairoFontMap>) {
        super.init(retaining: cast(op))
    }

    /// Reference intialiser for a related type that implements `FontMapProtocol`
    /// Will retain `PangoCairoFontMap`.
    /// - Parameter other: an instance of a related type that implements `FontMapProtocol`
    public init<T: FontMapProtocol>(pangoCairoFontMap other: T) {
        super.init(retaining: cast(other.font_map_ptr))
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }


    /// Gets a default `PangoCairoFontMap` to use with Cairo.
    /// 
    /// Note that the type of the returned object will depend
    /// on the particular font backend Cairo was compiled to use;
    /// You generally should only use the `PangoFontMap` and
    /// `PangoCairoFontMap` interfaces on the returned object.
    /// 
    /// The default Cairo fontmap can be changed by using
    /// `pango_cairo_font_map_set_default()`.  This can be used to
    /// change the Cairo font backend that the default fontmap
    /// uses for example.
    /// 
    /// Note that since Pango 1.32.6, the default fontmap is per-thread.
    /// Each thread gets its own default fontmap.  In this way,
    /// PangoCairo can be used safely from multiple threads.
    public static func getDefault() -> FontMap! {
        let rv: UnsafeMutablePointer<PangoFontMap>! = cast(pango_cairo_font_map_get_default())
        return rv.map { FontMap(cast($0)) }
    }

    /// Creates a new `PangoCairoFontMap` object of the type suitable
    /// to be used with cairo font backend of type `fonttype`.
    /// 
    /// In most cases one should simply use `pango_cairo_font_map_new``()`,
    /// or in fact in most of those cases, just use
    /// `pango_cairo_font_map_get_default``()`.
    public static func newFor(fontType fonttype: cairo.FontType) -> FontMap! {
        let rv: UnsafeMutablePointer<PangoFontMap>! = cast(pango_cairo_font_map_new_for_font_type(fonttype))
        return rv.map { FontMap(cast($0)) }
    }

}

// MARK: no FontMap properties

public enum FontMapSignalName: String, SignalNameProtocol {
    /// The notify signal is emitted on an object when one of its properties has
    /// its value set through `g_object_set_property()`, `g_object_set()`, et al.
    /// 
    /// Note that getting this signal doesn’t itself guarantee that the value of
    /// the property has actually changed. When it is emitted is determined by the
    /// derived GObject class. If the implementor did not create the property with
    /// `G_PARAM_EXPLICIT_NOTIFY`, then any call to `g_object_set_property()` results
    /// in `notify` being emitted, even if the new value is the same as the old.
    /// If they did pass `G_PARAM_EXPLICIT_NOTIFY`, then this signal is emitted only
    /// when they explicitly call `g_object_notify()` or `g_object_notify_by_pspec()`,
    /// and common practice is to do that only when the value has actually changed.
    /// 
    /// This signal is typically used to obtain change notification for a
    /// single property, by specifying the property name as a detail in the
    /// `g_signal_connect()` call, like this:
    /// (C Language Example):
    /// ```C
    /// g_signal_connect (text_view->buffer, "notify::paste-target-list",
    ///                   G_CALLBACK (gtk_text_view_target_list_notify),
    ///                   text_view)
    /// ```
    /// It is important to note that you must use
    /// [canonical parameter names](#canonical-parameter-names) as
    /// detail strings for the notify signal.
    case notify = "notify"

}

public extension FontMapProtocol {
    /// Connect a `FontMapSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @discardableResult func connect(signal kind: FontMapSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
        func _connect(signal name: UnsafePointer<gchar>, flags: ConnectFlags, data: GLibObject.SignalHandlerClosureHolder, handler: @convention(c) @escaping (gpointer, gpointer) -> Void) -> Int {
            let holder = UnsafeMutableRawPointer(Unmanaged.passRetained(data).toOpaque())
            let callback = unsafeBitCast(handler, to: GLibObject.Callback.self)
            let rv = GLibObject.ObjectRef(cast(font_map_ptr)).signalConnectData(detailedSignal: name, cHandler: callback, data: holder, destroyData: {
                if let swift = UnsafeRawPointer($0) {
                    let holder = Unmanaged<GLibObject.SignalHandlerClosureHolder>.fromOpaque(swift)
                    holder.release()
                }
                let _ = $1
            }, connectFlags: flags)
            return rv
        }
        let rv = _connect(signal: kind.name, flags: f, data: ClosureHolder(handler)) {
            let ptr = UnsafeRawPointer($1)
            let holder = Unmanaged<GLibObject.SignalHandlerClosureHolder>.fromOpaque(ptr).takeUnretainedValue()
            holder.call(())
        }
        return rv
    }
}

// MARK: FontMap Interface: FontMapProtocol extension (methods and fields)
public extension FontMapProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `PangoCairoFontMap` instance.
    var font_map_ptr: UnsafeMutablePointer<PangoCairoFontMap> { return ptr.assumingMemoryBound(to: PangoCairoFontMap.self) }

    /// Create a `PangoContext` for the given fontmap.
    ///
    /// **create_context is deprecated:**
    /// Use pango_font_map_create_context() instead.
    @available(*, deprecated) func createContext() -> UnsafeMutablePointer<PangoContext>! {
        let rv: UnsafeMutablePointer<PangoContext>! = cast(pango_cairo_font_map_create_context(cast(font_map_ptr)))
        return cast(rv)
    }

    /// Gets the type of Cairo font backend that `fontmap` uses.
    func getFontType() -> cairo_font_type_t {
        let rv = pango_cairo_font_map_get_font_type(cast(font_map_ptr))
        return cast(rv)
    }

    /// Gets the resolution for the fontmap. See `pango_cairo_font_map_set_resolution()`
    func getResolution() -> Double {
        let rv: Double = cast(pango_cairo_font_map_get_resolution(cast(font_map_ptr)))
        return cast(rv)
    }

    /// Sets a default `PangoCairoFontMap` to use with Cairo.
    /// 
    /// This can be used to change the Cairo font backend that the
    /// default fontmap uses for example.  The old default font map
    /// is unreffed and the new font map referenced.
    /// 
    /// Note that since Pango 1.32.6, the default fontmap is per-thread.
    /// This function only changes the default fontmap for
    /// the current thread.   Default fontmaps of exisiting threads
    /// are not changed.  Default fontmaps of any new threads will
    /// still be created using `pango_cairo_font_map_new()`.
    /// 
    /// A value of `nil` for `fontmap` will cause the current default
    /// font map to be released and a new default font
    /// map to be created on demand, using `pango_cairo_font_map_new()`.
    func setDefault() {
        pango_cairo_font_map_set_default(cast(font_map_ptr))
    
    }

    /// Sets the resolution for the fontmap. This is a scale factor between
    /// points specified in a `PangoFontDescription` and Cairo units. The
    /// default value is 96, meaning that a 10 point font will be 13
    /// units high. (10 * 96. / 72. = 13.3).
    func setResolution(dpi: gdouble) {
        pango_cairo_font_map_set_resolution(cast(font_map_ptr), dpi)
    
    }
    /// Gets the type of Cairo font backend that `fontmap` uses.
    var fontType: cairo_font_type_t {
        /// Gets the type of Cairo font backend that `fontmap` uses.
        get {
            let rv = pango_cairo_font_map_get_font_type(cast(font_map_ptr))
            return cast(rv)
        }
    }

    /// Gets the resolution for the fontmap. See `pango_cairo_font_map_set_resolution()`
    var resolution: Double {
        /// Gets the resolution for the fontmap. See `pango_cairo_font_map_set_resolution()`
        get {
            let rv: Double = cast(pango_cairo_font_map_get_resolution(cast(font_map_ptr)))
            return cast(rv)
        }
        /// Sets the resolution for the fontmap. This is a scale factor between
        /// points specified in a `PangoFontDescription` and Cairo units. The
        /// default value is 96, meaning that a 10 point font will be 13
        /// units high. (10 * 96. / 72. = 13.3).
        nonmutating set {
            pango_cairo_font_map_set_resolution(cast(font_map_ptr), cast(newValue))
        }
    }


}


