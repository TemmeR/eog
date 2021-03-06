\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "All Ye That Pass By"
  subsubtitle = "(Harwich. 11. 12. 11. 12.)"
  %meter = "11.12.11.12"
  poet = "C. Wesley"
  composer = "B. Milgrove"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=140 }
tb = { \tempo 4=70  }

patternAA = { c4 c4 | c2 c2 c2 | c1 }
patternAB = { c2    | c2 c2 c2 | c1 \patternAA }

patternBA = { c4 c4 | c2 c2 c2 | c2 c2 c2 c4( c4) c4( c4) c2 | c1 }
patternBB = { c2    | c2 c2 c2 | c2 c2 c2 c4( c4) c4( c4) c2 | c1 }
patternBC = { c4 c4 | c2 c2 c2 | c2 c2 c2 c4( c4) c2      c2 | c1 }
patternBD = { c4 c4 | c2 c2 c2 | c2 c2 c2 c2      c2      c2 | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 3/2
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { b( a) | g g e | d | b'( a) | g g e | d }
  \changePitch \patternBA { a'( b) | c a d | b g b | b( a) g( fis) e | d }
  \changePitch \patternAA { d'( c) | b c d | e | c( b) | a b c | d }
  \changePitch \patternBC { b( c) | d b e | d b g | g( a) b a | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d( c) | b d c | b | d ~ d | d c c | b }
  \changePitch \patternBB { e | e d d | d d d | cis( d) e( d) cis | d }
  \changePitch \patternAA { d ~ d | d | g g | g | c,( d) | e d d | d }
  \changePitch \patternBD { g ~ g | g g g | fis g g | g ~ g fis | g }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { g | g g g | g | g ~ g | g g g | g }
  \changePitch \patternBC { e( gis) | a fis fis | g b g | g( a) a g | fis }
  \changePitch \patternAA { a ~ a | g g b | c | g ~ g | g g a | b }
  \changePitch \patternBD { d( c) | b d c | a g b | e( d) c | b }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAB { g | g b c | g | g( a) | b e c | g' }
  \changePitch \patternBA { c,( b) | a d d | g g g | g( fis) cis( d) a | d }
  \changePitch \patternAA { fis ~ fis | g e d | c | e( d) c b a | g }
  \changePitch \patternBD { g'( a) | b g c, | d e e | c( d) d | g, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

All ye that pass by, \bar "." to Je -- sus draw nigh; \bar "." \break
To you is it noth -- ing that Je -- sus should die? \bar "." \break
Our ran -- som, our peace, \bar "." our sure -- ty He is; \bar "." \break
Come, see if there ev -- er was sor -- row like His. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

The Lord in the day { \mon } of a -- { \moff } tone -- ment did lay
Our sins on the Lamb, and He bore them a -- way;
He died to a -- tone for sins not His own;
The just God has pun -- ished for us His dear Son.

}

wordsC = \lyricmode {
\set stanza = "3."

Love moved Him to die; on this I re -- ly:
My Sav -- iour hath loved me, I can -- not tell why;
But this I can tell, He loved me so well
{ \mon } As to { \moff } lay down His life to re -- deem me from hell.

}

wordsD = \lyricmode {
\set stanza = "4."

With joy I now prove, di -- vine was the love!
A won -- der to all both be -- low and a -- bove!
When time is no more, I still shall a -- dore
The One who once died, and lives ev -- _ er -- more!

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
