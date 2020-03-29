s/context: ContextProtocol/context: Pango.ContextProtocol/g
s/cr: ContextProtocol/cr: cairo.ContextProtocol/g
s/FontProtocol: FontProtocol/FontProtocol: Pango.FontProtocol/
s/Font: Font/Font: Pango.Font/
s/FontMap: FontMap/FontMap: Pango.FontMap/
s/FontMapProtocol: FontMapProtocol/FontMapProtocol: Pango.FontMapProtocol/
s/pango_cairo_font_map_new_for_font_type(cast(fonttype.ptr))/pango_cairo_font_map_new_for_font_type(fonttype.ptr.pointee)/
s/\(public init.*\)(font other: T)/\1(pangoCairoFont other: T)/
s/\(public init.*\)(fontMap other: T)/\1(pangoCairoFontMap other: T)/
s/: \([A-Za-z.]*Notify[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Func[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Marshal[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Marshaller[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Callback[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Accumulator[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*SignalHandler[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Transformer[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Transform[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Transformer =\)/: @escaping \1/g
s/: \([A-Za-z.]*Hook[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Function[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Mapping[,)]\)/: @escaping \1/g
