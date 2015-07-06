
// http://pegjs.org/online

start    = basic*

basic    = (w:sentence ws q:quote ws e:expl ws nl)  { return { word: w, quote: q, expl: e }; }

quote    = qt (s:sentence) qt                       { return s; }
expl     = phrase

phrase   = sentence*
sentence = (s:(w:word sep? ws)*) "." ws             { return s.map(function(X) { return X[0] + X[1]; }).join(' ') + '.'; }
words    = (w:word+ ws)                             { return w.join(''); }
word     = (w:char+)                                { return w.join(''); }
char     = [a-z]i
sep      = (s:[,:]*)                                { return s.join(''); }

qt       = "\""
ws       = (w:[ \t]*)                               { return w.join(''); }
nl       = [\r\n]*
