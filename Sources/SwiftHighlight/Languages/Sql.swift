// Auto-generated from highlight.js
// Language: sql

import Foundation

/// sql language definition
public func sqlLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "SQL"

    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": ["all", "allocate", "alter", "and", "any", "are", "array", "array_max_cardinality", "as|0", "asensitive", "asymmetric", "at|0", "atomic", "authorization", "begin", "begin_frame", "begin_partition", "between", "bigint", "binary", "blob", "boolean", "both", "by|0", "call", "called", "cardinality", "cascaded", "case", "char", "char_length", "character", "character_length", "check", "classifier", "clob", "close", "collate", "collect", "column", "commit", "condition", "connect", "constraint", "contains", "convert", "copy", "corresponding", "create", "cross", "cube", "current", "current_catalog", "current_date", "current_default_transform_group", "current_path", "current_role", "current_row", "current_schema", "current_time", "current_timestamp", "current_path", "current_role", "current_transform_group_for_type", "current_user", "cursor", "cycle", "date", "day", "deallocate", "dec", "decimal", "decfloat", "declare", "default", "define", "delete", "describe", "deterministic", "disconnect", "distinct", "double", "drop", "dynamic", "each", "else", "empty", "end", "end_frame", "end_partition", "end-exec", "equals", "escape", "every", "except", "exec", "execute", "exists", "external", "false", "fetch", "filter", "float", "for", "foreign", "frame_row", "free", "from", "full", "function", "fusion", "get", "global", "grant", "group", "grouping", "groups", "having", "hold", "hour", "identity", "in|0", "indicator", "initial", "inner", "inout", "insensitive", "insert", "int", "integer", "intersect", "intersection", "interval", "into", "is|0", "join", "language", "large", "lateral", "leading", "left", "like", "like_regex", "local", "localtime", "localtimestamp", "match", "match_number", "match_recognize", "matches", "member", "merge", "method", "minute", "modifies", "module", "month", "multiset", "national", "natural", "nchar", "nclob", "new", "no|0", "none", "normalize", "not", "null", "numeric", "octet_length", "occurrences_regex", "of|0", "offset", "old", "omit", "on|0", "one", "only", "open", "or|0", "order", "out", "outer", "over", "overlaps", "overlay", "parameter", "partition", "pattern", "per", "percent", "period", "portion", "precedes", "precision", "prepare", "primary", "procedure", "ptf", "range", "reads", "real", "recursive", "ref", "references", "referencing", "release", "result", "return", "returns", "revoke", "right", "rollback", "rollup", "row", "rows", "running", "savepoint", "scope", "scroll", "search", "second", "seek", "select", "sensitive", "session_user", "set", "show", "similar", "skip", "smallint", "some", "specific", "specifictype", "sql", "sqlexception", "sqlstate", "sqlwarning", "start", "static", "submultiset", "subset", "succeeds", "symmetric", "system", "system_time", "system_user", "table", "tablesample", "then", "time", "timestamp", "timezone_hour", "timezone_minute", "to|0", "trailing", "translation", "trigger", "true", "truncate", "uescape", "union", "unique", "unknown", "update", "user", "using", "value", "values", "varbinary", "varchar", "varying", "versioning", "when", "whenever", "where", "window", "with", "within", "without", "year", "add", "asc", "collation", "desc", "final", "first", "last", "view"] as Any,
        "literal": ["true", "false", "unknown"] as Any,
        "type": ["bigint", "binary", "blob", "boolean", "char", "character", "clob", "date", "dec", "decfloat", "decimal", "float", "int", "integer", "interval", "nchar", "nclob", "national", "numeric", "real", "row", "smallint", "time", "timestamp", "varchar", "varying", "varbinary"] as Any,
        "built_in": ["current_catalog", "current_date", "current_default_transform_group", "current_path", "current_role", "current_schema", "current_transform_group_for_type", "current_user", "session_user", "system_time", "system_user", "current_time", "localtime", "current_timestamp", "localtimestamp"] as Any,
    ])
    lang.illegal = .regex("[{}]|<\\/")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("/\\b/(?:double\\s+precision|large\\s+object|with\\s+timezone|without\\s+timezone)/\\b/")
            mode.scope = .single("type")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/\\b/(?:create\\s+table|insert\\s+into|primary\\s+key|foreign\\s+key|not\\s+null|alter\\s+table|add\\s+constraint|grouping\\s+sets|on\\s+overflow|character\\s+set|respect\\s+nulls|ignore\\s+nulls|nulls\\s+first|nulls\\s+last|depth\\s+first|breadth\\s+first)/\\b/")
            mode.scope = .single("keyword")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/\\b/(?:abs|acos|array_agg|asin|atan|avg|cast|ceil|ceiling|coalesce|corr|cos|cosh|count|covar_pop|covar_samp|cume_dist|dense_rank|deref|element|exp|extract|first_value|floor|json_array|json_arrayagg|json_exists|json_object|json_objectagg|json_query|json_table|json_table_primitive|json_value|lag|last_value|lead|listagg|ln|log|log10|lower|max|min|mod|nth_value|ntile|nullif|percent_rank|percentile_cont|percentile_disc|position|position_regex|power|rank|regr_avgx|regr_avgy|regr_count|regr_intercept|regr_r2|regr_slope|regr_sxx|regr_sxy|regr_syy|row_number|sin|sinh|sqrt|stddev_pop|stddev_samp|substring|substring_regex|sum|tan|tanh|translate|translate_regex|treat|trim|trim_array|unnest|upper|value_of|var_pop|var_samp|width_bucket)/\\s*\\(/")
            mode.keywords = .grouped([
                "built_in": ["abs", "acos", "array_agg", "asin", "atan", "avg", "cast", "ceil", "ceiling", "coalesce", "corr", "cos", "cosh", "count", "covar_pop", "covar_samp", "cume_dist", "dense_rank", "deref", "element", "exp", "extract", "first_value", "floor", "json_array", "json_arrayagg", "json_exists", "json_object", "json_objectagg", "json_query", "json_table", "json_table_primitive", "json_value", "lag", "last_value", "lead", "listagg", "ln", "log", "log10", "lower", "max", "min", "mod", "nth_value", "ntile", "nullif", "percent_rank", "percentile_cont", "percentile_disc", "position", "position_regex", "power", "rank", "regr_avgx", "regr_avgy", "regr_count", "regr_intercept", "regr_r2", "regr_slope", "regr_sxx", "regr_sxy", "regr_syy", "row_number", "sin", "sinh", "sqrt", "stddev_pop", "stddev_samp", "substring", "substring_regex", "sum", "tan", "tanh", "translate", "translate_regex", "treat", "trim", "trim_array", "unnest", "upper", "value_of", "var_pop", "var_samp", "width_bucket"] as Any,
            ])

            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@[a-z0-9][a-z0-9_]*")
            mode.scope = .single("variable")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    mode.end = .regex("'")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("''")
                            return mode
                        }()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\"\"")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.COMMENT("--", "$")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[-+*/=%^~]|&&?|\\|\\|?|!=?|<(?:=>?|<|>)?|>[>=]?")
            mode.scope = .single("operator")
            mode.relevance = 0
            return mode
        }()),
    ]

    return lang
}

/// Register sql language
public extension HighlightJS {
    func registerSql() {
        registerLanguage("sql", definition: sqlLanguage)
    }
}
