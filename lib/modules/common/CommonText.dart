import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui show Shadow, FontFeature;


/// 基本文本封装
class CommonText extends StatelessWidget {
	/// The text to display.
	///
	/// This will be null if a [textSpan] is provided instead.
	final String data;

	/// The text to display as a [InlineSpan].
	///
	/// This will be null if [data] is provided instead.
	final InlineSpan textSpan;

	/// {@macro flutter.painting.textPainter.strutStyle}
	final StrutStyle strutStyle;

	/// How the text should be aligned horizontally.
	final TextAlign textAlign;

	/// The directionality of the text.
	///
	/// This decides how [textAlign] values like [TextAlign.start] and
	/// [TextAlign.end] are interpreted.
	///
	/// This is also used to disambiguate how to render bidirectional text. For
	/// example, if the [data] is an English phrase followed by a Hebrew phrase,
	/// in a [TextDirection.ltr] context the English phrase will be on the left
	/// and the Hebrew phrase to its right, while in a [TextDirection.rtl]
	/// context, the English phrase will be on the right and the Hebrew phrase on
	/// its left.
	///
	/// Defaults to the ambient [Directionality], if any.
	final TextDirection textDirection;

	/// Used to select a font when the same Unicode character can
	/// be rendered differently, depending on the locale.
	///
	/// It's rarely necessary to set this property. By default its value
	/// is inherited from the enclosing app with `Localizations.localeOf(context)`.
	///
	/// See [RenderParagraph.locale] for more information.
	final Locale locale;

	/// Whether the text should break at soft line breaks.
	///
	/// If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
	final bool softWrap;

	/// How visual overflow should be handled.
	final TextOverflow overflow;

	/// The number of font pixels for each logical pixel.
	///
	/// For example, if the text scale factor is 1.5, text will be 50% larger than
	/// the specified font size.
	///
	/// The value given to the constructor as textScaleFactor. If null, will
	/// use the [MediaQueryData.textScaleFactor] obtained from the ambient
	/// [MediaQuery], or 1.0 if there is no [MediaQuery] in scope.
	final double textScaleFactor;

	/// An optional maximum number of lines for the text to span, wrapping if necessary.
	/// If the text exceeds the given number of lines, it will be truncated according
	/// to [overflow].
	///
	/// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
	/// edge of the box.
	///
	/// If this is null, but there is an ambient [DefaultTextStyle] that specifies
	/// an explicit number for its [DefaultTextStyle.maxLines], then the
	/// [DefaultTextStyle] value will take precedence. You can use a [RichText]
	/// widget directly to entirely override the [DefaultTextStyle].
	final int maxLines;

	/// An alternative semantics label for this text.
	///
	/// If present, the semantics of this widget will contain this value instead
	/// of the actual text. This will overwrite any of the semantics labels applied
	/// directly to the [TextSpan]s.
	///
	/// This is useful for replacing abbreviations or shorthands with the full
	/// text value:
	///
	/// ```dart
	/// CommonText(r'$$', semanticsLabel: 'Double dollars')
	/// ```
	final String semanticsLabel;

	/// {@macro flutter.painting.textPainter.textWidthBasis}
	final TextWidthBasis textWidthBasis;

	/// Whether null values are replaced with their value in an ancestor text
	/// style (e.g., in a [TextSpan] tree).
	///
	/// If this is false, properties that don't have explicit values will revert
	/// to the defaults: white in color, a font size of 10 pixels, in a sans-serif
	/// font face.
	final bool inherit;

	/// The color to use when painting the text.
	///
	/// If [foreground] is specified, this value must be null. The [color] property
	/// is shorthand for `Paint()..color = color`.
	///
	/// In [merge], [apply], and [lerp], conflicts between [color] and [foreground]
	/// specification are resolved in [foreground]'s favor - i.e. if [foreground] is
	/// specified in one place, it will dominate [color] in another.
	final Color color;

	/// The color to use as the background for the text.
	///
	/// If [background] is specified, this value must be null. The
	/// [backgroundColor] property is shorthand for
	/// `background: Paint()..color = backgroundColor`.
	///
	/// In [merge], [apply], and [lerp], conflicts between [backgroundColor] and [background]
	/// specification are resolved in [background]'s favor - i.e. if [background] is
	/// specified in one place, it will dominate [color] in another.
	final Color backgroundColor;

	/// The name of the font to use when painting the text (e.g., Roboto). If the
	/// font is defined in a package, this will be prefixed with
	/// 'packages/package_name/' (e.g. 'packages/cool_fonts/Roboto'). The
	/// prefixing is done by the constructor when the `package` argument is
	/// provided.
	///
	/// The value provided in [fontFamily] will act as the preferred/first font
	/// family that glyphs are looked for in, followed in order by the font families
	/// in [fontFamilyFallback]. When [fontFamily] is null or not provided, the
	/// first value in [fontFamilyFallback] acts as the preferred/first font
	/// family. When neither is provided, then the default platform font will
	/// be used.
	final String fontFamily;

	/// The size of glyphs (in logical pixels) to use when painting the text.
	///
	/// During painting, the [fontSize] is multiplied by the current
	/// `textScaleFactor` to let users make it easier to read text by increasing
	/// its size.
	///
	/// [getParagraphStyle] will default to 14 logical pixels if the font size
	/// isn't specified here.
	final double fontSize;

	/// The typeface thickness to use when painting the text (e.g., bold).
	final FontWeight fontWeight;

	/// The typeface variant to use when drawing the letters (e.g., italics).
	final FontStyle fontStyle;

	/// The amount of space (in logical pixels) to add between each letter.
	/// A negative value can be used to bring the letters closer.
	final double letterSpacing;

	/// The amount of space (in logical pixels) to add at each sequence of
	/// white-space (i.e. between each word). A negative value can be used to
	/// bring the words closer.
	final double wordSpacing;

	/// The common baseline that should be aligned between this text span and its
	/// parent text span, or, for the root text spans, with the line box.
	final TextBaseline textBaseline;

	/// The height of this text span, as a multiple of the font size.
	///
	/// When [height] is null or omitted, the line height will be determined
	/// by the font's metrics directly, which may differ from the fontSize.
	/// When [height] is non-null, the line height of the span of text will be a
	/// multiple of [fontSize] and be exactly `fontSize * height` logical pixels
	/// tall.
	///
	/// For most fonts, setting [height] to 1.0 is not the same as omitting or
	/// setting height to null because the [fontSize] sets the height of the EM-square,
	/// which is different than the font provided metrics for line height. The
	/// following diagram illustrates the difference between the font-metrics
	/// defined line height and the line height produced with `height: 1.0`
	/// (which forms the upper and lower edges of the EM-square):
	///
	/// ![Text height diagram](https://flutter.github.io/assets-for-api-docs/assets/painting/text_height_diagram.png)
	///
	/// Examples of the resulting line heights from different values of `TextStyle.height`:
	///
	/// ![Text height comparison diagram](https://flutter.github.io/assets-for-api-docs/assets/painting/text_height_comparison_diagram.png)
	///
	/// See [StrutStyle] for further control of line height at the paragraph level.
	final double height;

	/// The paint drawn as a foreground for the text.
	///
	/// The value should ideally be cached and reused each time if multiple text
	/// styles are created with the same paint settings. Otherwise, each time it
	/// will appear like the style changed, which will result in unnecessary
	/// updates all the way through the framework.
	///
	/// If [color] is specified, this value must be null. The [color] property
	/// is shorthand for `Paint()..color = color`.
	///
	/// In [merge], [apply], and [lerp], conflicts between [color] and [foreground]
	/// specification are resolved in [foreground]'s favor - i.e. if [foreground] is
	/// specified in one place, it will dominate [color] in another.
	final Paint foreground;

	/// The paint drawn as a background for the text.
	///
	/// The value should ideally be cached and reused each time if multiple text
	/// styles are created with the same paint settings. Otherwise, each time it
	/// will appear like the style changed, which will result in unnecessary
	/// updates all the way through the framework.
	///
	/// If [backgroundColor] is specified, this value must be null. The
	/// [backgroundColor] property is shorthand for
	/// `background: Paint()..color = backgroundColor`.
	///
	/// In [merge], [apply], and [lerp], conflicts between [backgroundColor] and
	/// [background] specification are resolved in [background]'s favor - i.e. if
	/// [background] is specified in one place, it will dominate [backgroundColor]
	/// in another.
	final Paint background;

	/// The decorations to paint near the text (e.g., an underline).
	///
	/// Multiple decorations can be applied using [TextDecoration.combine].
	final TextDecoration decoration;

	/// The color in which to paint the text decorations.
	final Color decorationColor;

	/// The style in which to paint the text decorations (e.g., dashed).
	final TextDecorationStyle decorationStyle;

	/// The thickness of the decoration stroke as a multiplier of the thickness
	/// defined by the font.
	///
	/// The font provides a base stroke width for [decoration]s which scales off
	/// of the [fontSize]. This property may be used to achieve a thinner or
	/// thicker decoration stroke, without changing the [fontSize]. For example,
	/// a [decorationThickness] of 2.0 will draw a decoration twice as thick as
	/// the font defined decoration thickness.
	///
	/// {@tool sample}
	/// To achieve a bolded strike-through, we can apply a thicker stroke for the
	/// decoration.
	///
	/// ```dart
	/// CommonText(
	///   'This has a very BOLD strike through!',
	///   
	///     decoration: TextDecoration.lineThrough,
	///     decorationThickness: 2.85,
	///   ),
	/// )
	/// ```
	/// {@end-tool}
	///
	/// {@tool sample}
	/// We can apply a very thin and subtle wavy underline (perhaps, when words
	/// are misspelled) by using a [decorationThickness] < 1.0.
	///
	/// ```dart
	/// CommonText(
	///   'oopsIforgottousespaces!',
	///   
	///     decoration: TextDecoration.underline,
	///     decorationStyle: TextDecorationStyle.wavy,
	///     decorationColor: Colors.red,
	///     decorationThickness: 0.5,
	///   ),
	/// )
	/// ```
	/// {@end-tool}
	///
	/// The default [decorationThickness] is 1.0, which will use the font's base
	/// stroke thickness/width.
	final double decorationThickness;

	/// A human-readable description of this text style.
	///
	/// This property is maintained only in debug builds.
	///
	/// When merging ([merge]), copying ([copyWith]), modifying using [apply], or
	/// interpolating ([lerp]), the label of the resulting style is marked with
	/// the debug labels of the original styles. This helps figuring out where a
	/// particular text style came from.
	///
	/// This property is not considered when comparing text styles using `==` or
	/// [compareTo], and it does not affect [hashCode].
	final String debugLabel;

	/// A list of [Shadow]s that will be painted underneath the text.
	///
	/// Multiple shadows are supported to replicate lighting from multiple light
	/// sources.
	///
	/// Shadows must be in the same order for [TextStyle] to be considered as
	/// equivalent as order produces differing transparency.
	final List<ui.Shadow> shadows;

	/// A list of [FontFeature]s that affect how the font selects glyphs.
	///
	/// Some fonts support multiple variants of how a given character can be
	/// rendered.  For example, a font might provide both proportional and
	/// tabular numbers, or it might offer versions of the zero digit with
	/// and without slashes.  [FontFeature]s can be used to select which of
	/// these variants will be used for rendering.
	final List<ui.FontFeature> fontFeatures;

	final TextStyle style;

	/// 根据业务使用率默认封装常用属性，减少模板代码	
	CommonText(this.data, {
		Key key,
		this.color = Colors.black,
		this.fontSize = 12.0,
		this.inherit = true,
		this.softWrap = true,
		this.overflow = TextOverflow.ellipsis,
		this.maxLines = 1,
		this.fontFamily,
		this.fontWeight,
		this.strutStyle,
		this.textAlign,
		this.textDirection,
		this.locale,
		this.textScaleFactor,
		this.semanticsLabel,
		this.textWidthBasis, 
		this.textSpan,
		this.backgroundColor,
		this.fontStyle,
		this.letterSpacing,
		this.wordSpacing,
		this.textBaseline,
		this.height,
		this.foreground,
		this.background,
		this.shadows,
		this.fontFeatures,
		this.decoration,
		this.decorationColor,
		this.decorationStyle,
		this.decorationThickness,
		this.debugLabel,
		this.style
	});

	@override
	Widget build(BuildContext context) {
		var tempData = this.data ?? '';
		TextStyle style;
		if (this.style == null) {
			style = TextStyle(
				inherit: this.inherit,
				color: this.color,
				backgroundColor: this.backgroundColor,
				fontSize: this.fontSize,
				fontWeight: this.fontWeight,
				fontStyle: this.fontStyle,
				letterSpacing: this.letterSpacing,
				wordSpacing: this.wordSpacing,
				textBaseline: this.textBaseline,
				height: this.height,
				locale: this.locale,
				foreground: this.foreground,
				background: this.background,
				shadows: this.shadows,
				fontFeatures: this.fontFeatures,
				decoration: this.decoration,
				decorationColor: this.decorationColor,
				decorationStyle: this.decorationStyle,
				decorationThickness: this.decorationThickness,
				debugLabel: this.debugLabel,
				fontFamily: this.fontFamily
			);
		} else {
			style = this.style;
		}
		return Text(
			tempData, 
			key: this.key,
			strutStyle: this.strutStyle,
			textAlign: this.textAlign,
			textDirection: this.textDirection,
			locale: this.locale,
			softWrap: this.softWrap,
			overflow: this.overflow,
			textScaleFactor: this.textScaleFactor,
			maxLines: this.maxLines,
			semanticsLabel: this.semanticsLabel,
			textWidthBasis: this.textWidthBasis,
			style: style,
		);
	}
}