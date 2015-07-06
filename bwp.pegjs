
// http://pegjs.org/online

start    = basic

basic    = (w:word . ws q:quote ws e:expl ws?)  { return { word: w, quote: q, expl: e }; }

quote    = "\"" (s:sentence) "\""               { return s; }
expl     = sentence

sentence = (s:(w:word sep? ws)*) .              { return s.map(function(X) { return X[0] + X[1]; }).join(' ') + '.'; }
words    = (w:word+ ws)                         { return w.join(''); }
word     = (w:char+)                            { return w.join(''); }
char     = [a-z]i
sep      = (s:[,]*)                             { return s.join(''); }
ws       = (w:[ \t\r\n]*)                       { return w.join(''); }
