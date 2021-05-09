
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






// MARK: - Font Interface

/// The `FontProtocol` protocol exposes the methods and properties of an underlying `PangoCairoFont` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `Font`.
/// Alternatively, use `FontRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///
/// `PangoCairoFont` is an interface exported by fonts for
/// use with Cairo.
/// 
/// The actual type of the font will depend on the particular
/// font technology Cairo was compiled to use.
public protocol FontProtocol: Pango.FontProtocol {
        /// Untyped pointer to the underlying `PangoCairoFont` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `PangoCairoFont` instance.
    var font_ptr: UnsafeMutablePointer<PangoCairoFont>! { get }

    /// Required Initialiser for types conforming to `FontProtocol`
    init(raw: UnsafeMutableRawPointer)
}

/// The `FontRef` type acts as a lightweight Swift reference to an underlying `PangoCairoFont` instance.
/// It exposes methods that can operate on this data type through `FontProtocol` conformance.
/// Use `FontRef` only as an `unowned` reference to an existing `PangoCairoFont` instance.
///
/// `PangoCairoFont` is an interface exported by fonts for
/// use with Cairo.
/// 
/// The actual type of the font will depend on the particular
/// font technology Cairo was compiled to use.
public struct FontRef: FontProtocol, GWeakCapturing {
        /// Untyped pointer to the underlying `PangoCairoFont` instance.
    /// For type-safe access, use the generated, typed pointer `font_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension FontRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<PangoCairoFont>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<PangoCairoFont>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<PangoCairoFont>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<PangoCairoFont>?) {
        guard let p = UnsafeMutablePointer(mutating: maybePointer) else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional `gpointer`
    @inlinable init!(gpointer g: gpointer?) {
        guard let p = g else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable `gconstpointer`
    @inlinable init!(gconstpointer g: gconstpointer?) {
        guard let p = UnsafeMutableRawPointer(mutating: g) else { return nil }
        ptr = p
    }

    /// Reference intialiser for a related type that implements `FontProtocol`
    @inlinable init<T: FontProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// This factory is syntactic sugar for setting weak pointers wrapped in `GWeak<T>`
    @inlinable static func unowned<T: FontProtocol>(_ other: T) -> FontRef { FontRef(other) }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `Font` type acts as a reference-counted owner of an underlying `PangoCairoFont` instance.
/// It provides the methods that can operate on this data type through `FontProtocol` conformance.
/// Use `Font` as a strong reference or owner of a `PangoCairoFont` instance.
///
/// `PangoCairoFont` is an interface exported by fonts for
/// use with Cairo.
/// 
/// The actual type of the font will depend on the particular
/// font technology Cairo was compiled to use.
open class Font: Pango.Font, FontProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Font` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<PangoCairoFont>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Font` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<PangoCairoFont>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Font` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Font` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Font` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<PangoCairoFont>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Font` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<PangoCairoFont>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `PangoCairoFont`.
    /// i.e., ownership is transferred to the `Font` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<PangoCairoFont>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `FontProtocol`
    /// Will retain `PangoCairoFont`.
    /// - Parameter other: an instance of a related type that implements `FontProtocol`
    @inlinable public init<T: FontProtocol>(pangoCairoFont other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable public required init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable required public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
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

// MARK: Font has no signals
// MARK: Font Interface: FontProtocol extension (methods and fields)
public extension FontProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `PangoCairoFont` instance.
    @inlinable var font_ptr: UnsafeMutablePointer<PangoCairoFont>! { return ptr?.assumingMemoryBound(to: PangoCairoFont.self) }

    /// Gets the `cairo_scaled_font_t` used by `font`.
    /// The scaled font can be referenced and kept using
    /// `cairo_scaled_font_reference()`.
    @inlinable func getScaledFont() -> Cairo.ScaledFontRef! {
        let rv = Cairo.ScaledFontRef(pango_cairo_font_get_scaled_font(font_ptr))
        return rv
    }
    /// Gets the `cairo_scaled_font_t` used by `font`.
    /// The scaled font can be referenced and kept using
    /// `cairo_scaled_font_reference()`.
    @inlinable var scaledFont: Cairo.ScaledFontRef! {
        /// Gets the `cairo_scaled_font_t` used by `font`.
        /// The scaled font can be referenced and kept using
        /// `cairo_scaled_font_reference()`.
        get {
            let rv = Cairo.ScaledFontRef(pango_cairo_font_get_scaled_font(font_ptr))
            return rv
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
/// use with Cairo.
/// 
/// The actual type of the font map will depend on the particular
/// font technology Cairo was compiled to use.
public protocol FontMapProtocol: Pango.FontMapProtocol {
        /// Untyped pointer to the underlying `PangoCairoFontMap` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `PangoCairoFontMap` instance.
    var font_map_ptr: UnsafeMutablePointer<PangoCairoFontMap>! { get }

    /// Required Initialiser for types conforming to `FontMapProtocol`
    init(raw: UnsafeMutableRawPointer)
}

/// The `FontMapRef` type acts as a lightweight Swift reference to an underlying `PangoCairoFontMap` instance.
/// It exposes methods that can operate on this data type through `FontMapProtocol` conformance.
/// Use `FontMapRef` only as an `unowned` reference to an existing `PangoCairoFontMap` instance.
///
/// `PangoCairoFontMap` is an interface exported by font maps for
/// use with Cairo.
/// 
/// The actual type of the font map will depend on the particular
/// font technology Cairo was compiled to use.
public struct FontMapRef: FontMapProtocol, GWeakCapturing {
        /// Untyped pointer to the underlying `PangoCairoFontMap` instance.
    /// For type-safe access, use the generated, typed pointer `font_map_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension FontMapRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<PangoCairoFontMap>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<PangoCairoFontMap>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<PangoCairoFontMap>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<PangoCairoFontMap>?) {
        guard let p = UnsafeMutablePointer(mutating: maybePointer) else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional `gpointer`
    @inlinable init!(gpointer g: gpointer?) {
        guard let p = g else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable `gconstpointer`
    @inlinable init!(gconstpointer g: gconstpointer?) {
        guard let p = UnsafeMutableRawPointer(mutating: g) else { return nil }
        ptr = p
    }

    /// Reference intialiser for a related type that implements `FontMapProtocol`
    @inlinable init<T: FontMapProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// This factory is syntactic sugar for setting weak pointers wrapped in `GWeak<T>`
    @inlinable static func unowned<T: FontMapProtocol>(_ other: T) -> FontMapRef { FontMapRef(other) }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `FontMap` type acts as a reference-counted owner of an underlying `PangoCairoFontMap` instance.
/// It provides the methods that can operate on this data type through `FontMapProtocol` conformance.
/// Use `FontMap` as a strong reference or owner of a `PangoCairoFontMap` instance.
///
/// `PangoCairoFontMap` is an interface exported by font maps for
/// use with Cairo.
/// 
/// The actual type of the font map will depend on the particular
/// font technology Cairo was compiled to use.
open class FontMap: Pango.FontMap, FontMapProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `FontMap` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<PangoCairoFontMap>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `FontMap` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<PangoCairoFontMap>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `FontMap` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `FontMap` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `FontMap` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<PangoCairoFontMap>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `FontMap` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<PangoCairoFontMap>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `PangoCairoFontMap`.
    /// i.e., ownership is transferred to the `FontMap` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<PangoCairoFontMap>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `FontMapProtocol`
    /// Will retain `PangoCairoFontMap`.
    /// - Parameter other: an instance of a related type that implements `FontMapProtocol`
    @inlinable public init<T: FontMapProtocol>(pangoCairoFontMap other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable public required init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable required public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontMapProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
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

// MARK: FontMap has no signals
// MARK: FontMap Interface: FontMapProtocol extension (methods and fields)
public extension FontMapProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `PangoCairoFontMap` instance.
    @inlinable var font_map_ptr: UnsafeMutablePointer<PangoCairoFontMap>! { return ptr?.assumingMemoryBound(to: PangoCairoFontMap.self) }

    /// Create a `PangoContext` for the given fontmap.
    ///
    /// **create_context is deprecated:**
    /// Use pango_font_map_create_context() instead.
    @available(*, deprecated) @inlinable func createContext() -> Pango.ContextRef! {
        let rv = Pango.ContextRef(pango_cairo_font_map_create_context(font_map_ptr))
        return rv
    }

    /// Gets the type of Cairo font backend that `fontmap` uses.
    @inlinable func getFontType() -> cairo_font_type_t {
        let rv = pango_cairo_font_map_get_font_type(font_map_ptr)
        return rv
    }

    /// Gets the resolution for the fontmap.
    /// 
    /// See [method`PangoCairo.FontMap.set_resolution`].
    @inlinable func getResolution() -> CDouble {
        let rv = pango_cairo_font_map_get_resolution(font_map_ptr)
        return rv
    }

    /// Sets a default `PangoCairoFontMap` to use with Cairo.
    /// 
    /// This can be used to change the Cairo font backend that the
    /// default fontmap uses for example. The old default font map
    /// is unreffed and the new font map referenced.
    /// 
    /// Note that since Pango 1.32.6, the default fontmap is per-thread.
    /// This function only changes the default fontmap for
    /// the current thread. Default fontmaps of existing threads
    /// are not changed. Default fontmaps of any new threads will
    /// still be created using [type_func`PangoCairo.FontMap.new`].
    /// 
    /// A value of `nil` for `fontmap` will cause the current default
    /// font map to be released and a new default font map to be created
    /// on demand, using [type_func`PangoCairo.FontMap.new`].
    @inlinable func setDefault() {
        pango_cairo_font_map_set_default(font_map_ptr)
    
    }

    /// Sets the resolution for the fontmap.
    /// 
    /// This is a scale factor between
    /// points specified in a `PangoFontDescription` and Cairo units. The
    /// default value is 96, meaning that a 10 point font will be 13
    /// units high. (10 * 96. / 72. = 13.3).
    @inlinable func setResolution(dpi: CDouble) {
        pango_cairo_font_map_set_resolution(font_map_ptr, dpi)
    
    }
    /// Gets the type of Cairo font backend that `fontmap` uses.
    @inlinable var fontType: cairo_font_type_t {
        /// Gets the type of Cairo font backend that `fontmap` uses.
        get {
            let rv = pango_cairo_font_map_get_font_type(font_map_ptr)
            return rv
        }
    }

    /// Gets the resolution for the fontmap.
    /// 
    /// See [method`PangoCairo.FontMap.set_resolution`].
    @inlinable var resolution: CDouble {
        /// Gets the resolution for the fontmap.
        /// 
        /// See [method`PangoCairo.FontMap.set_resolution`].
        get {
            let rv = pango_cairo_font_map_get_resolution(font_map_ptr)
            return rv
        }
        /// Sets the resolution for the fontmap.
        /// 
        /// This is a scale factor between
        /// points specified in a `PangoFontDescription` and Cairo units. The
        /// default value is 96, meaning that a 10 point font will be 13
        /// units high. (10 * 96. / 72. = 13.3).
        nonmutating set {
            pango_cairo_font_map_set_resolution(font_map_ptr, newValue)
        }
    }


}


/// Retrieves any font rendering options previously set with
/// [func`PangoCairo.context_set_font_options`].
/// 
/// This function
/// does not report options that are derived from the target
/// surface by [func`update_context`].
@inlinable public func contextGetFontOptions<ContextT: Pango.ContextProtocol>(context: ContextT) -> Cairo.FontOptionsRef! {
    guard let rv = Cairo.FontOptionsRef(pango_cairo_context_get_font_options(context.context_ptr)) else { return nil }
    return rv
}




/// Gets the resolution for the context.
/// See [func`PangoCairo.context_set_resolution`]
@inlinable public func contextGetResolution<ContextT: Pango.ContextProtocol>(context: ContextT) -> CDouble {
    let rv = pango_cairo_context_get_resolution(context.context_ptr)
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
@inlinable public func contextGetShapeRenderer<ContextT: Pango.ContextProtocol>(context: ContextT, data: UnsafeMutablePointer<gpointer?>? = nil) -> PangoCairoShapeRendererFunc! {
    guard let rv = pango_cairo_context_get_shape_renderer(context.context_ptr, data) else { return nil }
    return rv
}




/// Sets the font options used when rendering text with this context.
/// 
/// These options override any options that [func`update_context`]
/// derives from the target surface.
@inlinable public func contextSetFontOptions<ContextT: Pango.ContextProtocol>(context: ContextT, options: Cairo.FontOptionsRef? = nil) {
    pango_cairo_context_set_font_options(context.context_ptr, options?._ptr)

}
/// Sets the font options used when rendering text with this context.
/// 
/// These options override any options that [func`update_context`]
/// derives from the target surface.
@inlinable public func contextSetFontOptions<ContextT: Pango.ContextProtocol, FontOptionsT: Cairo.FontOptionsProtocol>(context: ContextT, options: FontOptionsT?) {
    pango_cairo_context_set_font_options(context.context_ptr, options?._ptr)

}




/// Sets the resolution for the context.
/// 
/// This is a scale factor between
/// points specified in a `PangoFontDescription` and Cairo units. The
/// default value is 96, meaning that a 10 point font will be 13
/// units high. (10 * 96. / 72. = 13.3).
@inlinable public func contextSetResolution<ContextT: Pango.ContextProtocol>(context: ContextT, dpi: CDouble) {
    pango_cairo_context_set_resolution(context.context_ptr, dpi)

}




/// Sets callback function for context to use for rendering attributes
/// of type `PANGO_ATTR_SHAPE`.
/// 
/// See `PangoCairoShapeRendererFunc` for details.
@inlinable public func contextSetShapeRenderer<ContextT: Pango.ContextProtocol>(context: ContextT, `func`: PangoCairoShapeRendererFunc? = nil, data: gpointer! = nil, dnotify: GDestroyNotify?) {
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
@inlinable public func createContext<ContextT: Cairo.ContextProtocol>(cr: ContextT) -> Pango.ContextRef! {
    guard let rv = Pango.ContextRef(pango_cairo_create_context(cr._ptr)) else { return nil }
    return rv
}




/// Creates a layout object set up to match the current transformation
/// and target surface of the Cairo context.
/// 
/// This layout can then be
/// used for text measurement with functions like
/// [method`Pango.Layout.get_size`] or drawing with functions like
/// [func`show_layout`]. If you change the transformation or target
/// surface for `cr`, you need to call [func`update_layout`].
/// 
/// This function is the most convenient way to use Cairo with Pango,
/// however it is slightly inefficient since it creates a separate
/// `PangoContext` object for each layout. This might matter in an
/// application that was laying out large amounts of text.
@inlinable public func createLayout<ContextT: Cairo.ContextProtocol>(cr: ContextT) -> Pango.LayoutRef! {
    guard let rv = Pango.LayoutRef(pango_cairo_create_layout(cr._ptr)) else { return nil }
    return rv
}




/// Add a squiggly line to the current path in the specified cairo context that
/// approximately covers the given rectangle in the style of an underline used
/// to indicate a spelling error.
/// 
/// The width of the underline is rounded to an
/// integer number of up/down segments and the resulting rectangle is centered
/// in the original rectangle.
@inlinable public func errorUnderlinePath<ContextT: Cairo.ContextProtocol>(cr: ContextT, x: CDouble, y: CDouble, width: CDouble, height: CDouble) {
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
    guard let rv = Pango.FontMapRef(pango_cairo_font_map_get_default()) else { return nil }
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
    guard let rv = Pango.FontMapRef(pango_cairo_font_map_new()) else { return nil }
    return rv
}




/// Creates a new `PangoCairoFontMap` object of the type suitable
/// to be used with cairo font backend of type `fonttype`.
/// 
/// In most cases one should simply use [type_func`PangoCairo.FontMap.new`], or
/// in fact in most of those cases, just use [func`PangoCairo.FontMap.get_default`].
@inlinable public func fontMapNewForFontType(fonttype: cairo_font_type_t) -> Pango.FontMapRef! {
    guard let rv = Pango.FontMapRef(pango_cairo_font_map_new_for_font_type(fonttype)) else { return nil }
    return rv
}




/// Adds the glyphs in `glyphs` to the current path in the specified
/// cairo context.
/// 
/// The origin of the glyphs (the left edge of the baseline)
/// will be at the current point of the cairo context.
@inlinable public func glyphStringPath<ContextT: Cairo.ContextProtocol, FontT: Pango.FontProtocol, GlyphStringT: Pango.GlyphStringProtocol>(cr: ContextT, font: FontT, glyphs: GlyphStringT) {
    pango_cairo_glyph_string_path(cr._ptr, font.font_ptr, glyphs.glyph_string_ptr)

}




/// Adds the text in `PangoLayoutLine` to the current path in the
/// specified cairo context.
/// 
/// The origin of the glyphs (the left edge
/// of the line) will be at the current point of the cairo context.
@inlinable public func layoutLinePath<ContextT: Cairo.ContextProtocol, LayoutLineT: Pango.LayoutLineProtocol>(cr: ContextT, line: LayoutLineT) {
    pango_cairo_layout_line_path(cr._ptr, line.layout_line_ptr)

}




/// Adds the text in a `PangoLayout` to the current path in the
/// specified cairo context.
/// 
/// The top-left corner of the `PangoLayout`
/// will be at the current point of the cairo context.
@inlinable public func layoutPath<ContextT: Cairo.ContextProtocol, LayoutT: Pango.LayoutProtocol>(cr: ContextT, layout: LayoutT) {
    pango_cairo_layout_path(cr._ptr, layout.layout_ptr)

}




/// Draw a squiggly line in the specified cairo context that approximately
/// covers the given rectangle in the style of an underline used to indicate a
/// spelling error.
/// 
/// The width of the underline is rounded to an integer
/// number of up/down segments and the resulting rectangle is centered in the
/// original rectangle.
@inlinable public func showErrorUnderline<ContextT: Cairo.ContextProtocol>(cr: ContextT, x: CDouble, y: CDouble, width: CDouble, height: CDouble) {
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
@inlinable public func showGlyphItem<ContextT: Cairo.ContextProtocol, GlyphItemT: Pango.GlyphItemProtocol>(cr: ContextT, text: UnsafePointer<CChar>!, glyphItem: GlyphItemT) {
    pango_cairo_show_glyph_item(cr._ptr, text, glyphItem.glyph_item_ptr)

}




/// Draws the glyphs in `glyphs` in the specified cairo context.
/// 
/// The origin of the glyphs (the left edge of the baseline) will
/// be drawn at the current point of the cairo context.
@inlinable public func showGlyphString<ContextT: Cairo.ContextProtocol, FontT: Pango.FontProtocol, GlyphStringT: Pango.GlyphStringProtocol>(cr: ContextT, font: FontT, glyphs: GlyphStringT) {
    pango_cairo_show_glyph_string(cr._ptr, font.font_ptr, glyphs.glyph_string_ptr)

}




/// Draws a `PangoLayout` in the specified cairo context.
/// 
/// The top-left corner of the `PangoLayout` will be drawn
/// at the current point of the cairo context.
@inlinable public func showLayout<ContextT: Cairo.ContextProtocol, LayoutT: Pango.LayoutProtocol>(cr: ContextT, layout: LayoutT) {
    pango_cairo_show_layout(cr._ptr, layout.layout_ptr)

}




/// Draws a `PangoLayoutLine` in the specified cairo context.
/// 
/// The origin of the glyphs (the left edge of the line) will
/// be drawn at the current point of the cairo context.
@inlinable public func showLayoutLine<ContextT: Cairo.ContextProtocol, LayoutLineT: Pango.LayoutLineProtocol>(cr: ContextT, line: LayoutLineT) {
    pango_cairo_show_layout_line(cr._ptr, line.layout_line_ptr)

}




/// Updates a `PangoContext` previously created for use with Cairo to
/// match the current transformation and target surface of a Cairo
/// context.
/// 
/// If any layouts have been created for the context,
/// it's necessary to call [method`Pango.Layout.context_changed`] on those
/// layouts.
@inlinable public func updateContext<C: Cairo.ContextProtocol, P: Pango.ContextProtocol>(cr: C, context: P) {
    pango_cairo_update_context(cr._ptr, context.context_ptr)

}




/// Updates the private `PangoContext` of a `PangoLayout` created with
/// [func`create_layout`] to match the current transformation and target
/// surface of a Cairo context.
@inlinable public func updateLayout<ContextT: Cairo.ContextProtocol, LayoutT: Pango.LayoutProtocol>(cr: ContextT, layout: LayoutT) {
    pango_cairo_update_layout(cr._ptr, layout.layout_ptr)

}



