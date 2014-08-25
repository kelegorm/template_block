// This code was generated by a tool.
// Processing tool available at https://github.com/mezoni/peg

part of template_block;
class TemplateBlockParser {
  static const int EOF = -1;
  static final List<bool> _lookahead = _unmap([0x7fffffff, 0x7fffffff, 0x7fffffff, 0x7fffc0ff, 0x1ff]);
  // 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
  static final List<bool> _mapping0 = _unmap([0x3ffffff, 0x7fffffe]);
  bool success;
  List _cache;
  int _cachePos;
  List<int> _cacheRule;
  List<int> _cacheState;
  int _ch;
  int _column;
  List<String> _expected;
  int _failurePos;
  int _flag;
  int _inputLen;
  int _inputPos;
  int _line;
  int _testing;
  String _text;

  TemplateBlockParser(String text) {
    if (text == null) {
      throw new ArgumentError('text: $text');
    }
    _text = text;
    _inputLen = _text.length;
    if (_inputLen >= 0x3fffffe8 / 32) {
      throw new StateError('File size to big: $_inputLen');
    }
    reset(0);
  }
  int get column {
    if (_column == -1) {
      _calculatePos(_failurePos);
    }
    return _column;
  }
  int get line {
    if (_line == -1) {
      _calculatePos(_failurePos);
    }
    return _line;
  }
  void _addToCache(dynamic result, int start, int id) {
    var cached = _cache[start];
    if (cached == null) {
      _cacheRule[start] = id;
      _cache[start] = [result, _inputPos, success];
    } else {
      var slot = start >> 5;
      var r1 = (slot << 5) & 0x3fffffff;
      var mask = 1 << (start - r1);
      if ((_cacheState[slot] & mask) == 0) {
        _cacheState[slot] |= mask;
        cached = [new List.filled(2, 0), new Map<int, List>()];
        _cache[start] = cached;
      }
      slot = id >> 5;
      r1 = (slot << 5) & 0x3fffffff;
      mask = 1 << (id - r1);
      cached[0][slot] |= mask;
      cached[1][id] = [result, _inputPos, success];
    }
    if (_cachePos < start) {
      _cachePos = start;
    }
  }
  void _calculatePos(int pos) {
    if (pos == null || pos < 0 || pos > _inputLen) {
      return;
    }
    _line = 1;
    _column = 1;
    for (var i = 0; i < _inputLen && i < pos; i++) {
      var c = _text.codeUnitAt(i);
      if (c == 13) {
        _line++;
        _column = 1;
        if (i + 1 < _inputLen && _text.codeUnitAt(i + 1) == 10) {
          i++;
        }
      } else if (c == 10) {
        _line++;
        _column = 1;
      } else {
        _column++;
      }
    }
  }
  List<String> get expected {
    var set = new Set<String>();
    set.addAll(_expected);
    if (set.contains(null)) {
      set.clear();
    }
    var result = set.toList();
    result.sort();
    return result;
  }
  void _failure([List<String> expected]) {
    if (_failurePos > _inputPos) {
      return;
    }
    if (_inputPos > _failurePos) {
      _expected = [];
     _failurePos = _inputPos;
    }
    if (expected != null) {
      _expected.addAll(expected);
    }
  }
  List _flatten(dynamic value) {
    if (value is List) {
      var result = [];
      var length = value.length;
      for (var i = 0; i < length; i++) {
        var element = value[i];
        if (element is Iterable) {
          result.addAll(_flatten(element));
        } else {
          result.add(element);
        }
      }
      return result;
    } else if (value is Iterable) {
      var result = [];
      for (var element in value) {
        if (element is! List) {
          result.add(element);
        } else {
          result.addAll(_flatten(element));
        }
      }
    }
    return [value];
  }
  dynamic _getFromCache(int id) {
    var result = _cache[_inputPos];
    if (result == null) {
      return null;
    }
    var slot = _inputPos >> 5;
    var r1 = (slot << 5) & 0x3fffffff;
    var mask = 1 << (_inputPos - r1);
    if ((_cacheState[slot] & mask) == 0) {
      if (_cacheRule[_inputPos] == id) {
        _inputPos = result[1];
        success = result[2];
        if (_inputPos < _inputLen) {
          _ch = _text.codeUnitAt(_inputPos);
        } else {
          _ch = EOF;
        }
        return result;
      } else {
        return null;
      }
    }
    slot = id >> 5;
    r1 = (slot << 5) & 0x3fffffff;
    mask = 1 << (id - r1);
    if ((result[0][slot] & mask) == 0) {
      return null;
    }
    var data = result[1][id];
    _inputPos = data[1];
    success = data[2];
    if (_inputPos < _inputLen) {
      _ch = _text.codeUnitAt(_inputPos);
    } else {
      _ch = EOF;
    }
    return data;
  }
  String _matchAny() {
    success = _inputPos < _inputLen;
    if (success) {
      var result = _text[_inputPos++];
      if (_inputPos < _inputLen) {
        _ch = _text.codeUnitAt(_inputPos);
      } else {
        _ch = EOF;
      }
      return result;
    }
    if (_inputPos > _testing) {
      _failure();
    }
    return null;
  }
  String _matchChar(int ch, List<String> expected) {
    success = _ch == ch;
    if (success) {
      var result = _text[_inputPos++];
      if (_inputPos < _inputLen) {
        _ch = _text.codeUnitAt(_inputPos);
      } else {
        _ch = EOF;
      }
      return result;
    }
    if (_inputPos > _testing) {
      _failure(expected);
    }
    return null;
  }
  String _matchMapping(int start, int end, List<bool> mapping) {
    success = _ch >= start && _ch <= end;
    if (success) {
      if(mapping[_ch - start]) {
        var result = _text[_inputPos++];
        if (_inputPos < _inputLen) {
          _ch = _text.codeUnitAt(_inputPos);
        } else {
          _ch = EOF;
        }
        return result;
      }
      success = false;
    }
    if (_inputPos > _testing) {
       _failure();
    }
    return null;
  }
  String _matchRange(int start, int end) {
    success = _ch >= start && _ch <= end;
    if (success) {
      var result = _text[_inputPos++];
      if (_inputPos < _inputLen) {
        _ch = _text.codeUnitAt(_inputPos);
      } else {
        _ch = EOF;
      }
      return result;
    }
    if (_inputPos > _testing) {
      _failure();
    }
    return null;
  }
  String _matchRanges(List<int> ranges) {
    var length = ranges.length;
    for (var i = 0; i < length; i += 2) {
      if (_ch <= ranges[i + 1]) {
        if (_ch >= ranges[i]) {
          var result = _text[_inputPos++];
          if (_inputPos < _inputLen) {
            _ch = _text.codeUnitAt(_inputPos);
          } else {
             _ch = EOF;
          }
          success = true;
          return result;
        }
      } else break;
    }
    if (_inputPos > _testing) {
      _failure();
    }
    success = false;
    return null;
  }
  String _matchString(String string, List<String> expected) {
    success = _text.startsWith(string, _inputPos);
    if (success) {
      _inputPos += string.length;
      if (_inputPos < _inputLen) {
        _ch = _text.codeUnitAt(_inputPos);
      } else {
        _ch = EOF;
      }
      return string;
    }
    if (_inputPos > _testing) {
      _failure(expected);
    }
    return null;
  }
  void _nextChar([int count = 1]) {
    success = true;
    _inputPos += count;
    if (_inputPos < _inputLen) {
      _ch = _text.codeUnitAt(_inputPos);
    } else {
      _ch = EOF;
    }
  }
  void reset(int pos) {
    if (pos == null) {
      throw new ArgumentError('pos: $pos');
    }
    if (pos < 0 || pos > _inputLen) {
      throw new RangeError('pos');
    }
    success = true;
    _cache = new List(_inputLen + 1);
    _cachePos = -1;
    _cacheRule = new List(_inputLen + 1);
    _cacheState = new List.filled(((_inputLen + 1) >> 5) + 1, 0);
    _ch = EOF;
    _column = -1;
    _expected = [];
    _failurePos = -1;
    _flag = 0;
    _inputPos = pos;
    _line = -1;
    _testing = -1;
    if (pos < _inputLen) {
      _ch = _text.codeUnitAt(pos);
    }
  }
  bool _testChar(int c, int flag) {
    if (c < 0 || c > 127) {
      return false;
    }
    int slot = (c & 0xff) >> 6;
    int mask = 1 << c - ((slot << 6) & 0x3fffffff);
    if ((flag & mask) != 0) {
      return true;
    }
    return false;
  }
  bool _testInput(int flag) {
    if (_inputPos >= _inputLen) {
      return false;
    }
    var c = _text.codeUnitAt(_inputPos);
    if (c < 0 || c > 127) {
      return false;
    }
    int slot = (c & 0xff) >> 6;
    int mask = 1 << c - ((slot << 6) & 0x3fffffff);
    if ((flag & mask) != 0) {
      return true;
    }
    return false;
  }
  String get unexpected {
    if (_failurePos < 0 || _failurePos >= _inputLen) {
      return '';
    }
    return _text[_failurePos];
  }
  static List<bool> _unmap(List<int> mapping) {
    var length = mapping.length;
    var result = new List<bool>(length * 31);
    var offset = 0;
    for (var i = 0; i < length; i++) {
      var v = mapping[i];
      for (var j = 0; j < 31; j++) {
        result[offset++] = v & (1 << j) == 0 ? false : true;
      }
    }
    return result;
  }
  dynamic parse_template() {
    // NONTERMINAL
    // template <- ((lastLine / multiLine / singleLine / emptyLine) (NEW_LINE !EOF)?)* EOF ;
    var $$;
    var ch0 = _ch;
    var pos0 = _inputPos;
    while (true) {
      // ((lastLine / multiLine / singleLine / emptyLine) (NEW_LINE !EOF)?)*
      var testing0 = _testing;
      for (var reps = []; ; ) {
        _testing = _inputPos;
        var ch1 = _ch;
        var pos1 = _inputPos;
        while (true) {
          while (true) {
            // lastLine
            $$ = parse_lastLine();
            if (success) break;
            // multiLine
            $$ = parse_multiLine();
            if (success) break;
            // singleLine
            $$ = parse_singleLine();
            if (success) break;
            // emptyLine
            $$ = parse_emptyLine();
            break;
          }
          if (!success) break;
          var seq = new List(2);
          seq[0] = $$;
          // (NEW_LINE !EOF)?
          var testing1 = _testing;
          _testing = _inputPos;
          var ch2 = _ch;
          var pos2 = _inputPos;
          while (true) {
            // NEW_LINE
            $$ = parse_NEW_LINE();
            if (!success) break;
            var seq = new List(2);
            seq[0] = $$;
            // !EOF
            var ch3 = _ch;
            var pos3 = _inputPos;
            var testing2 = _testing;
            _testing = _inputLen + 1;
            // EOF
            $$ = parse_EOF();
            _ch = ch3;
            _inputPos = pos3;
            _testing = testing2;
            $$ = null;
            success = !success;
            if (!success && _inputPos > _testing) _failure();
            if (!success) break;
            seq[1] = $$;
            $$ = seq;
            break;
          }
          if (!success) {
            _ch = ch2;
            _inputPos = pos2;
          }
          success = true;
          _testing = testing1;
          if (!success) break;
          seq[1] = $$;
          $$ = seq;
          if (success) {
            // lastLine / multiLine / singleLine / emptyLine
            final $1 = seq[0];
            // (NEW_LINE !EOF)?
            final $2 = seq[1];
            $$ = $1;
          }
          break;
        }
        if (!success) {
          _ch = ch1;
          _inputPos = pos1;
        }
        if (success) {
          reps.add($$);
        } else {
          success = true;
          _testing = testing0;
          $$ = reps;
          break;
        }
      }
      if (!success) break;
      var seq = new List(2);
      seq[0] = $$;
      // EOF
      $$ = parse_EOF();
      if (!success) break;
      seq[1] = $$;
      $$ = seq;
      if (success) {
        // ((lastLine / multiLine / singleLine / emptyLine) (NEW_LINE !EOF)?)*
        final $1 = seq[0];
        // EOF
        final $2 = seq[1];
        $$ = $1;
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _inputPos = pos0;
    }
    return $$;
  }
  dynamic parse_lastLine() {
    // TERMINAL
    // lastLine <- NEW_LINE &EOF ;
    var $$;
    var ch0 = _ch;
    var pos0 = _inputPos;
    while (true) {
      // NEW_LINE
      $$ = parse_NEW_LINE();
      if (!success) break;
      var seq = new List(2);
      seq[0] = $$;
      // &EOF
      var ch1 = _ch;
      var pos1 = _inputPos;
      var testing0 = _testing;
      _testing = _inputLen + 1;
      // EOF
      $$ = parse_EOF();
      _ch = ch1;
      _inputPos = pos1;
      _testing = testing0;
      $$ = null;
      if (!success && _inputPos > _testing) _failure();
      if (!success) break;
      seq[1] = $$;
      $$ = seq;
      if (success) {
        // NEW_LINE
        final $1 = seq[0];
        // &EOF
        final $2 = seq[1];
        $$ = _addSingleLine(const [""]);
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _inputPos = pos0;
    }
    return $$;
  }
  dynamic parse_multiLine() {
    // TERMINAL
    // multiLine <- multiLinePrefix* multiLineKey multiLineSuffix* ;
    var $$;
    var ch0 = _ch;
    var pos0 = _inputPos;
    while (true) {
      // multiLinePrefix*
      var testing0 = _testing;
      for (var reps = []; ; ) {
        _testing = _inputPos;
        // multiLinePrefix
        $$ = parse_multiLinePrefix();
        if (success) {
          reps.add($$);
        } else {
          success = true;
          _testing = testing0;
          $$ = reps;
          break;
        }
      }
      if (!success) break;
      var seq = new List(3);
      seq[0] = $$;
      // multiLineKey
      $$ = parse_multiLineKey();
      if (!success) break;
      seq[1] = $$;
      // multiLineSuffix*
      var testing1 = _testing;
      for (var reps = []; ; ) {
        _testing = _inputPos;
        // multiLineSuffix
        $$ = parse_multiLineSuffix();
        if (success) {
          reps.add($$);
        } else {
          success = true;
          _testing = testing1;
          $$ = reps;
          break;
        }
      }
      if (!success) break;
      seq[2] = $$;
      $$ = seq;
      if (success) {
        // multiLinePrefix*
        final $1 = seq[0];
        // multiLineKey
        final $2 = seq[1];
        // multiLineSuffix*
        final $3 = seq[2];
        $$ = _addMultiLine($1, $2, $3);
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _inputPos = pos0;
    }
    return $$;
  }
  dynamic parse_multiLinePrefix() {
    // TERMINAL
    // multiLinePrefix <- !multiLineKey !NEW_LINE . ;
    var $$;
    var ch0 = _ch;
    var pos0 = _inputPos;
    while (true) {
      // !multiLineKey
      var ch1 = _ch;
      var pos1 = _inputPos;
      var testing0 = _testing;
      _testing = _inputLen + 1;
      // multiLineKey
      $$ = parse_multiLineKey();
      _ch = ch1;
      _inputPos = pos1;
      _testing = testing0;
      $$ = null;
      success = !success;
      if (!success && _inputPos > _testing) _failure();
      if (!success) break;
      var seq = new List(3);
      seq[0] = $$;
      // !NEW_LINE
      var ch2 = _ch;
      var pos2 = _inputPos;
      var testing1 = _testing;
      _testing = _inputLen + 1;
      // NEW_LINE
      $$ = parse_NEW_LINE();
      _ch = ch2;
      _inputPos = pos2;
      _testing = testing1;
      $$ = null;
      success = !success;
      if (!success && _inputPos > _testing) _failure();
      if (!success) break;
      seq[1] = $$;
      // .
      $$ = _matchAny();
      if (!success) break;
      seq[2] = $$;
      $$ = seq;
      if (success) {
        // !multiLineKey
        final $1 = seq[0];
        // !NEW_LINE
        final $2 = seq[1];
        // .
        final $3 = seq[2];
        $$ = $3;
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _inputPos = pos0;
    }
    return $$;
  }
  dynamic parse_multiLineKey() {
    // TERMINAL
    // multiLineKey <- "{{#" IDENT "}}" ;
    var $$;
    var ch0 = _ch;
    var pos0 = _inputPos;
    while (true) {
      // "{{#"
      $$ = _matchString('{{#', const ["{{#"]);
      if (!success) break;
      var seq = new List(3);
      seq[0] = $$;
      // IDENT
      $$ = parse_IDENT();
      if (!success) break;
      seq[1] = $$;
      // "}}"
      $$ = _matchString('}}', const ["}}"]);
      if (!success) break;
      seq[2] = $$;
      $$ = seq;
      if (success) {
        // "{{#"
        final $1 = seq[0];
        // IDENT
        final $2 = seq[1];
        // "}}"
        final $3 = seq[2];
        $$ = $2;
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _inputPos = pos0;
    }
    return $$;
  }
  dynamic parse_multiLineSuffix() {
    // TERMINAL
    // multiLineSuffix <- !NEW_LINE . ;
    var $$;
    var ch0 = _ch;
    var pos0 = _inputPos;
    while (true) {
      // !NEW_LINE
      var ch1 = _ch;
      var pos1 = _inputPos;
      var testing0 = _testing;
      _testing = _inputLen + 1;
      // NEW_LINE
      $$ = parse_NEW_LINE();
      _ch = ch1;
      _inputPos = pos1;
      _testing = testing0;
      $$ = null;
      success = !success;
      if (!success && _inputPos > _testing) _failure();
      if (!success) break;
      var seq = new List(2);
      seq[0] = $$;
      // .
      $$ = _matchAny();
      if (!success) break;
      seq[1] = $$;
      $$ = seq;
      if (success) {
        // !NEW_LINE
        final $1 = seq[0];
        // .
        final $2 = seq[1];
        $$ = $2;
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _inputPos = pos0;
    }
    return $$;
  }
  dynamic parse_singleLine() {
    // TERMINAL
    // singleLine <- singleLineParts ;
    var $$;
    // singleLineParts
    $$ = parse_singleLineParts();
    if (success) {
      // singleLineParts
      final $1 = $$;
      $$ = _addSingleLine($1);
    }
    return $$;
  }
  dynamic parse_singleLineParts() {
    // TERMINAL
    // singleLineParts <- (singleLineKey / singleLinePart)+ ;
    var $$;
    // (singleLineKey / singleLinePart)+
    var testing0;
    for (var first = true, reps; ;) {
      while (true) {
        // singleLineKey
        $$ = parse_singleLineKey();
        if (success) break;
        // singleLinePart
        $$ = parse_singleLinePart();
        break;
      }
      if (success) {
       if (first) {
          first = false;
          reps = [$$];
          testing0 = _testing;
        } else {
          reps.add($$);
        }
        _testing = _inputPos;
      } else {
        success = !first;
        if (success) {
          _testing = testing0;
          $$ = reps;
        } else $$ = null;
        break;
      }
    }
    return $$;
  }
  dynamic parse_singleLineKey() {
    // TERMINAL
    // singleLineKey <- "{{" IDENT "}}" ;
    var $$;
    var ch0 = _ch;
    var pos0 = _inputPos;
    while (true) {
      // "{{"
      $$ = _matchString('{{', const ["{{"]);
      if (!success) break;
      var seq = new List(3);
      seq[0] = $$;
      // IDENT
      $$ = parse_IDENT();
      if (!success) break;
      seq[1] = $$;
      // "}}"
      $$ = _matchString('}}', const ["}}"]);
      if (!success) break;
      seq[2] = $$;
      $$ = seq;
      if (success) {
        // "{{"
        final $1 = seq[0];
        // IDENT
        final $2 = seq[1];
        // "}}"
        final $3 = seq[2];
        $$ = _template._addKey($2);
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _inputPos = pos0;
    }
    return $$;
  }
  dynamic parse_singleLinePart() {
    // TERMINAL
    // singleLinePart <- !singleLineKey !NEW_LINE . ;
    var $$;
    var ch0 = _ch;
    var pos0 = _inputPos;
    while (true) {
      // !singleLineKey
      var ch1 = _ch;
      var pos1 = _inputPos;
      var testing0 = _testing;
      _testing = _inputLen + 1;
      // singleLineKey
      $$ = parse_singleLineKey();
      _ch = ch1;
      _inputPos = pos1;
      _testing = testing0;
      $$ = null;
      success = !success;
      if (!success && _inputPos > _testing) _failure();
      if (!success) break;
      var seq = new List(3);
      seq[0] = $$;
      // !NEW_LINE
      var ch2 = _ch;
      var pos2 = _inputPos;
      var testing1 = _testing;
      _testing = _inputLen + 1;
      // NEW_LINE
      $$ = parse_NEW_LINE();
      _ch = ch2;
      _inputPos = pos2;
      _testing = testing1;
      $$ = null;
      success = !success;
      if (!success && _inputPos > _testing) _failure();
      if (!success) break;
      seq[1] = $$;
      // .
      $$ = _matchAny();
      if (!success) break;
      seq[2] = $$;
      $$ = seq;
      if (success) {
        // !singleLineKey
        final $1 = seq[0];
        // !NEW_LINE
        final $2 = seq[1];
        // .
        final $3 = seq[2];
        $$ = $3;
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _inputPos = pos0;
    }
    return $$;
  }
  dynamic parse_emptyLine() {
    // TERMINAL
    // emptyLine <- &NEW_LINE ;
    var $$;
    // &NEW_LINE
    var ch0 = _ch;
    var pos0 = _inputPos;
    var testing0 = _testing;
    _testing = _inputLen + 1;
    // NEW_LINE
    $$ = parse_NEW_LINE();
    _ch = ch0;
    _inputPos = pos0;
    _testing = testing0;
    $$ = null;
    if (!success && _inputPos > _testing) _failure();
    if (success) {
      // &NEW_LINE
      final $1 = $$;
      $$ = _addSingleLine(const [""]);
    }
    return $$;
  }
  dynamic parse_EOF() {
    // TERMINAL
    // EOF <- !. ;
    var $$;
    // !.
    var ch0 = _ch;
    var pos0 = _inputPos;
    var testing0 = _testing;
    _testing = _inputLen + 1;
    // .
    $$ = _matchAny();
    _ch = ch0;
    _inputPos = pos0;
    _testing = testing0;
    $$ = null;
    success = !success;
    if (!success && _inputPos > _testing) _failure();
    return $$;
  }
  dynamic parse_IDENT() {
    // TERMINAL
    // IDENT <- IDENT_START IDENT_CONT* ;
    var $$;
    var ch0 = _ch;
    var pos0 = _inputPos;
    while (true) {
      // IDENT_START
      $$ = parse_IDENT_START();
      if (!success) break;
      var seq = new List(2);
      seq[0] = $$;
      // IDENT_CONT*
      var testing0 = _testing;
      for (var reps = []; ; ) {
        _testing = _inputPos;
        // IDENT_CONT
        $$ = parse_IDENT_CONT();
        if (success) {
          reps.add($$);
        } else {
          success = true;
          _testing = testing0;
          $$ = reps;
          break;
        }
      }
      if (!success) break;
      seq[1] = $$;
      $$ = seq;
      if (success) {
        // IDENT_START
        final $1 = seq[0];
        // IDENT_CONT*
        final $2 = seq[1];
        $$ = _flatten([$1, $2]).join();
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _inputPos = pos0;
    }
    return $$;
  }
  dynamic parse_IDENT_START() {
    // TERMINAL
    // IDENT_START <- [A-Za-z] ;
    var $$;
    // [A-Za-z]
    $$ = _matchMapping(65, 122, _mapping0);
    return $$;
  }
  dynamic parse_IDENT_CONT() {
    // TERMINAL
    // IDENT_CONT <- [0-z] ;
    var $$;
    // [0-z]
    $$ = _matchRange(48, 122);
    return $$;
  }
  dynamic parse_NEW_LINE() {
    // TERMINAL
    // NEW_LINE <- "\n" / "\r\n" / "\r" ;
    var $$;
    while (true) {
      // "\n"
      $$ = _matchString('\n', const ["\\n"]);
      if (success) break;
      // "\r\n"
      $$ = _matchString('\r\n', const ["\\r\\n"]);
      if (success) break;
      // "\r"
      $$ = _matchString('\r', const ["\\r"]);
      break;
    }
    return $$;
  }
  TemplateBlock _template;

  List<_TemplateLine> parse(TemplateBlock template) {
    _template = template;
    var result = parse_template();
    if (!success) {
      if(!expected.isEmpty) {
        var str = expected.map((s) => Strings.printable(s)).join('\', \'');
        throw 'Parser error at ($line, $column): expected \'$str\' but found \'$unexpected\'';
      } else {
        if(!unexpected.isEmpty) {
          throw 'Parser error at ($line, $column): unexpected "${Strings.printable(unexpected)}"';
        } else {
          throw 'Parser error at ($line, $column): unexpected end of file';
        }
      }
    }
    return result;
  }

  _TemplateMultiLine _addMultiLine(List prefix, String key, List suffix) {
    var line = new _TemplateMultiLine(_template);
    line._prefix = prefix.join();
    line._suffix = suffix.join();
    line._value = _template._addKey('#$key');
    return line;
  }

  _TemplateSingleLine _addSingleLine(List parts) {
    var line = new _TemplateSingleLine(_template);
    line._parts = parts;
    return line;
  }
}