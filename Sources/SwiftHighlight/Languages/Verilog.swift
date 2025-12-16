// Auto-generated from highlight.js
// Language: verilog

import Foundation

/// verilog language definition
public func verilogLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Verilog"

    lang.aliases = ["v", "sv", "svh"]
    lang.keywords = .grouped([
        "keyword": ["accept_on", "alias", "always", "always_comb", "always_ff", "always_latch", "and", "assert", "assign", "assume", "automatic", "before", "begin", "bind", "bins", "binsof", "bit", "break", "buf|0", "bufif0", "bufif1", "byte", "case", "casex", "casez", "cell", "chandle", "checker", "class", "clocking", "cmos", "config", "const", "constraint", "context", "continue", "cover", "covergroup", "coverpoint", "cross", "deassign", "default", "defparam", "design", "disable", "dist", "do", "edge", "else", "end", "endcase", "endchecker", "endclass", "endclocking", "endconfig", "endfunction", "endgenerate", "endgroup", "endinterface", "endmodule", "endpackage", "endprimitive", "endprogram", "endproperty", "endspecify", "endsequence", "endtable", "endtask", "enum", "event", "eventually", "expect", "export", "extends", "extern", "final", "first_match", "for", "force", "foreach", "forever", "fork", "forkjoin", "function", "generate|5", "genvar", "global", "highz0", "highz1", "if", "iff", "ifnone", "ignore_bins", "illegal_bins", "implements", "implies", "import", "incdir", "include", "initial", "inout", "input", "inside", "instance", "int", "integer", "interconnect", "interface", "intersect", "join", "join_any", "join_none", "large", "let", "liblist", "library", "local", "localparam", "logic", "longint", "macromodule", "matches", "medium", "modport", "module", "nand", "negedge", "nettype", "new", "nexttime", "nmos", "nor", "noshowcancelled", "not", "notif0", "notif1", "or", "output", "package", "packed", "parameter", "pmos", "posedge", "primitive", "priority", "program", "property", "protected", "pull0", "pull1", "pulldown", "pullup", "pulsestyle_ondetect", "pulsestyle_onevent", "pure", "rand", "randc", "randcase", "randsequence", "rcmos", "real", "realtime", "ref", "reg", "reject_on", "release", "repeat", "restrict", "return", "rnmos", "rpmos", "rtran", "rtranif0", "rtranif1", "s_always", "s_eventually", "s_nexttime", "s_until", "s_until_with", "scalared", "sequence", "shortint", "shortreal", "showcancelled", "signed", "small", "soft", "solve", "specify", "specparam", "static", "string", "strong", "strong0", "strong1", "struct", "super", "supply0", "supply1", "sync_accept_on", "sync_reject_on", "table", "tagged", "task", "this", "throughout", "time", "timeprecision", "timeunit", "tran", "tranif0", "tranif1", "tri", "tri0", "tri1", "triand", "trior", "trireg", "type", "typedef", "union", "unique", "unique0", "unsigned", "until", "until_with", "untyped", "use", "uwire", "var", "vectored", "virtual", "void", "wait", "wait_order", "wand", "weak", "weak0", "weak1", "while", "wildcard", "wire", "with", "within", "wor", "xnor", "xor"] as Any,
        "literal": ["null"] as Any,
        "built_in": ["$finish", "$stop", "$exit", "$fatal", "$error", "$warning", "$info", "$realtime", "$time", "$printtimescale", "$bitstoreal", "$bitstoshortreal", "$itor", "$signed", "$cast", "$bits", "$stime", "$timeformat", "$realtobits", "$shortrealtobits", "$rtoi", "$unsigned", "$asserton", "$assertkill", "$assertpasson", "$assertfailon", "$assertnonvacuouson", "$assertoff", "$assertcontrol", "$assertpassoff", "$assertfailoff", "$assertvacuousoff", "$isunbounded", "$sampled", "$fell", "$changed", "$past_gclk", "$fell_gclk", "$changed_gclk", "$rising_gclk", "$steady_gclk", "$coverage_control", "$coverage_get", "$coverage_save", "$set_coverage_db_name", "$rose", "$stable", "$past", "$rose_gclk", "$stable_gclk", "$future_gclk", "$falling_gclk", "$changing_gclk", "$display", "$coverage_get_max", "$coverage_merge", "$get_coverage", "$load_coverage_db", "$typename", "$unpacked_dimensions", "$left", "$low", "$increment", "$clog2", "$ln", "$log10", "$exp", "$sqrt", "$pow", "$floor", "$ceil", "$sin", "$cos", "$tan", "$countbits", "$onehot", "$isunknown", "$fatal", "$warning", "$dimensions", "$right", "$high", "$size", "$asin", "$acos", "$atan", "$atan2", "$hypot", "$sinh", "$cosh", "$tanh", "$asinh", "$acosh", "$atanh", "$countones", "$onehot0", "$error", "$info", "$random", "$dist_chi_square", "$dist_erlang", "$dist_exponential", "$dist_normal", "$dist_poisson", "$dist_t", "$dist_uniform", "$q_initialize", "$q_remove", "$q_exam", "$async$and$array", "$async$nand$array", "$async$or$array", "$async$nor$array", "$sync$and$array", "$sync$nand$array", "$sync$or$array", "$sync$nor$array", "$q_add", "$q_full", "$psprintf", "$async$and$plane", "$async$nand$plane", "$async$or$plane", "$async$nor$plane", "$sync$and$plane", "$sync$nand$plane", "$sync$or$plane", "$sync$nor$plane", "$system", "$display", "$displayb", "$displayh", "$displayo", "$strobe", "$strobeb", "$strobeh", "$strobeo", "$write", "$readmemb", "$readmemh", "$writememh", "$value$plusargs", "$dumpvars", "$dumpon", "$dumplimit", "$dumpports", "$dumpportson", "$dumpportslimit", "$writeb", "$writeh", "$writeo", "$monitor", "$monitorb", "$monitorh", "$monitoro", "$writememb", "$dumpfile", "$dumpoff", "$dumpall", "$dumpflush", "$dumpportsoff", "$dumpportsall", "$dumpportsflush", "$fclose", "$fdisplay", "$fdisplayb", "$fdisplayh", "$fdisplayo", "$fstrobe", "$fstrobeb", "$fstrobeh", "$fstrobeo", "$swrite", "$swriteb", "$swriteh", "$swriteo", "$fscanf", "$fread", "$fseek", "$fflush", "$feof", "$fopen", "$fwrite", "$fwriteb", "$fwriteh", "$fwriteo", "$fmonitor", "$fmonitorb", "$fmonitorh", "$fmonitoro", "$sformat", "$sformatf", "$fgetc", "$ungetc", "$fgets", "$sscanf", "$rewind", "$ftell", "$ferror"] as Any,
    ])
    lang.contains = [
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.scope = .single("number")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b((\\d+'([bhodBHOD]))[0-9xzXZa-fA-F_]+)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\B(('([bhodBHOD]))[0-9xzXZa-fA-F_]+)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b[0-9][0-9_]*")
                    mode.relevance = 0
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("variable")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("#\\((?!parameter).+\\)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\.\\w+")
                    mode.relevance = 0
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/`/(?:__FILE__|__LINE__)")
            mode.scope = .single("variable.constant")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/`/(?:begin_keywords|celldefine|default_nettype|default_decay_time|default_trireg_strength|define|delay_mode_distributed|delay_mode_path|delay_mode_unit|delay_mode_zero|else|elsif|end_keywords|endcelldefine|endif|ifdef|ifndef|include|line|nounconnected_drive|pragma|resetall|timescale|unconnected_drive|undef|undefineall)")
            mode.end = .regex("$|\\/\\/|\\/\\*")
            mode.scope = .single("meta")
            mode.keywords = .array(["begin_keywords", "celldefine", "default_nettype", "default_decay_time", "default_trireg_strength", "define", "delay_mode_distributed", "delay_mode_path", "delay_mode_unit", "delay_mode_zero", "else", "elsif", "end_keywords", "endcelldefine", "endif", "ifdef", "ifndef", "include", "line", "nounconnected_drive", "pragma", "resetall", "timescale", "unconnected_drive", "undef", "undefineall"])

            mode.returnEnd = true
            return mode
        }()),
    ]

    return lang
}

/// Register verilog language
public extension HighlightJS {
    func registerVerilog() {
        registerLanguage("verilog", definition: verilogLanguage)
    }
}
