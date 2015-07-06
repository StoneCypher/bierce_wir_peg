
// http://pegjs.org/online

start    = basic*

basic    = (w:sentence q:quote* e:expl nl)  { return { word: w, quote: q, expl: e }; }

quote    = qt (s:sentence) qt               { return s; }
expl     = e:[^\n]* "\n\n"?                 { return e.join(''); }

phrase   = sentence*
sentence = (s:(w:word sep? ws)*) "." ws     { return s.map(function(X) { return X[0] + X[1]; }).join(' ') + '.'; }
words    = (w:word+)                        { return w.join(''); }
word     = (w:char+) ws                     { return w.join(''); }
char     = [a-z'éô]i
sep      = (s:[(),:;‐]*)                    { return s.join(''); }

qt       = "\"" ws
ws       = (w:[ \t]*)                       { return w.join(''); }
nl       = nlc*
nlc      = [\r\n]
