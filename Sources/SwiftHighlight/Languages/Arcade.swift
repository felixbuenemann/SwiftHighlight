// Auto-generated from highlight.js
// Language: arcade

import Foundation

/// arcade language definition
public func arcadeLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "ArcGIS Arcade"

    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": ["break", "case", "catch", "continue", "debugger", "do", "else", "export", "for", "function", "if", "import", "in", "new", "of", "return", "switch", "try", "var", "void", "while"] as Any,
        "literal": ["BackSlash", "DoubleQuote", "ForwardSlash", "Infinity", "NaN", "NewLine", "PI", "SingleQuote", "Tab", "TextFormatting", "false", "null", "true", "undefined"] as Any,
        "built_in": ["Abs", "Acos", "All", "Angle", "Any", "Area", "AreaGeodetic", "Array", "Asin", "Atan", "Atan2", "Attachments", "Average", "Back", "Bearing", "Boolean", "Buffer", "BufferGeodetic", "Ceil", "Centroid", "ChangeTimeZone", "Clip", "Concatenate", "Console", "Constrain", "Contains", "ConvertDirection", "ConvexHull", "Cos", "Count", "Crosses", "Cut", "Date|0", "DateAdd", "DateDiff", "DateOnly", "Day", "Decode", "DefaultValue", "Densify", "DensifyGeodetic", "Dictionary", "Difference", "Disjoint", "Distance", "DistanceGeodetic", "DistanceToCoordinate", "Distinct", "Domain", "DomainCode", "DomainName", "EnvelopeIntersects", "Equals", "Erase", "Exp", "Expects", "Extent", "Feature", "FeatureInFilter", "FeatureSet", "FeatureSetByAssociation", "FeatureSetById", "FeatureSetByName", "FeatureSetByPortalItem", "FeatureSetByRelationshipClass", "FeatureSetByRelationshipName", "Filter", "FilterBySubtypeCode", "Find", "First|0", "Floor", "FromCharCode", "FromCodePoint", "FromJSON", "Front", "GdbVersion", "Generalize", "Geometry", "GetEnvironment", "GetFeatureSet", "GetFeatureSetInfo", "GetUser", "GroupBy", "Guid", "HasKey", "HasValue", "Hash", "Hour", "IIf", "ISOMonth", "ISOWeek", "ISOWeekday", "ISOYear", "Includes", "IndexOf", "Insert", "Intersection", "Intersects", "IsEmpty", "IsNan", "IsSelfIntersecting", "IsSimple", "KnowledgeGraphByPortalItem", "Left|0", "Length", "Length3D", "LengthGeodetic", "Log", "Lower", "Map", "Max", "Mean", "MeasureToCoordinate", "Mid", "Millisecond", "Min", "Minute", "Month", "MultiPartToSinglePart", "Multipoint", "NearestCoordinate", "NearestVertex", "NextSequenceValue", "None", "Now", "Number", "Offset", "OrderBy", "Overlaps", "Point", "PointToCoordinate", "Polygon", "Polyline", "Pop", "Portal", "Pow", "Proper", "Push", "QueryGraph", "Random", "Reduce", "Relate", "Replace", "Resize", "Reverse", "Right|0", "RingIsClockwise", "Rotate", "Round", "Schema", "Second", "SetGeometry", "Simplify", "Sin", "Slice", "Sort", "Splice", "Split", "Sqrt", "StandardizeFilename", "StandardizeGuid", "Stdev", "SubtypeCode", "SubtypeName", "Subtypes", "Sum", "SymmetricDifference", "Tan", "Text", "Time", "TimeZone", "TimeZoneOffset", "Timestamp", "ToCharCode", "ToCodePoint", "ToHex", "ToLocal", "ToUTC", "Today", "Top|0", "Touches", "TrackAccelerationAt", "TrackAccelerationWindow", "TrackCurrentAcceleration", "TrackCurrentDistance", "TrackCurrentSpeed", "TrackCurrentTime", "TrackDistanceAt", "TrackDistanceWindow", "TrackDuration", "TrackFieldWindow", "TrackGeometryWindow", "TrackIndex", "TrackSpeedAt", "TrackSpeedWindow", "TrackStartTime", "TrackWindow", "Trim", "TypeOf", "Union", "Upper", "UrlEncode", "Variance", "Week", "Weekday", "When|0", "Within", "Year|0"] as Any,
    ])
    lang.illegal = .regex("#(?!!)")
    lang.contains = [
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("`")
            mode.end = .regex("`")
            mode.scope = .single("string")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\$\\{")
                    mode.end = .regex("\\}")
                    mode.scope = .single("subst")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_0" as Any,
                    ])

                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("number")
                            mode.relevance = 0
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\b(0[bB][01]+)")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\b(0[oO][0-7]+)")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode(CommonModes.REGEXP_MODE()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$(?:aggregatedFeatures|analytic|config|datapoint|datastore|editcontext|feature|featureSet|feedfeature|fencefeature|fencenotificationtype|graph|join|layer|locationupdate|map|measure|measure|originalFeature|record|reference|rowindex|sourcedatastore|sourcefeature|sourcelayer|target|targetdatastore|targetfeature|targetlayer|userInput|value|variables|view)")
            mode.scope = .single("symbol")
            return mode
        }()),
        /* circular ref: __ref_4 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[{,]\\s*")
            mode.relevance = 0
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[A-Za-z_][0-9A-Za-z_]*\\s*:")
                    mode.relevance = 0
                    mode.returnBegin = true
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[A-Za-z_][0-9A-Za-z_]*")
                            mode.scope = .single("attr")
                            mode.relevance = 0
                            return mode
                        }()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|-|-=|/=|/|:|;|<<|<<=|<=|<|===|==|=|>>>=|>>=|>=|>>>|>>|>|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~|\\b(return)\\b)\\s*")
            mode.keywords = .simple("return")

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_5 */ .mode(Mode()),
                /* circular ref: __ref_6 */ .mode(Mode()),
                /* circular ref: __ref_7 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("(\\(.*?\\)|[A-Za-z_][0-9A-Za-z_]*)\\s*=>")
                    mode.end = .regex("\\s*=>")
                    mode.scope = .single("function")
                    mode.returnBegin = true
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("params")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("[A-Za-z_][0-9A-Za-z_]*")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\(\\s*\\)")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\(")
                                    mode.end = .regex("\\)")
                                    mode.keywords = .grouped([
                                        "__circularRef": "__ref_0" as Any,
                                    ])

                                    mode.contains = [
                                        /* circular ref: __ref_1 */ .mode(Mode()),
                                        /* circular ref: __ref_2 */ .mode(Mode()),
                                        /* circular ref: __ref_3 */ .mode(Mode()),
                                        /* circular ref: __ref_4 */ .mode(Mode()),
                                        /* circular ref: __ref_7 */ .mode(Mode()),
                                        /* circular ref: __ref_6 */ .mode(Mode()),
                                        /* circular ref: __ref_5 */ .mode(Mode()),
                                    ]
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\{")
            mode.beginKeywords = "function"
            mode.illegal = .regex("\\[|%")
            mode.excludeEnd = true
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                        /* circular ref: __ref_4 */ .mode(Mode()),
                        /* circular ref: __ref_7 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
                        /* circular ref: __ref_5 */ .mode(Mode()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$[(.]")
            return mode
        }()),
    ]

    return lang
}

/// Register arcade language
public extension HighlightJS {
    func registerArcade() {
        registerLanguage("arcade", definition: arcadeLanguage)
    }
}
