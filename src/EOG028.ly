\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "O! What a Saviour Is Jesus the Lord!"
  subsubtitle = "(Joyfully. 4-10s. Dactylic.)"
  %meter = "4-10s."
  poet = "A. Midlane"
  %composer = ""
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=72 }
tb = { \tempo 4=36 }

patternA = { c4 c8 c8 c4 c8 c8 | c4 c8 c8 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { aes g aes bes aes bes | c bes aes bes }
  \changePitch \patternA { aes bes c des c bes   | aes c bes aes }
  \changePitch \patternA { ees' des c des c bes  | c bes aes bes }
  \changePitch \patternA { ees des c des c bes   | c bes aes bes }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternA { aes g aes bes aes bes | c bes aes bes } >>
  \changePitch \patternA { aes bes c des c bes   | aes c bes aes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { c des ees ees ees g   | aes g ees g     }
  \changePitch \patternA { ees g aes bes aes f   | ees g g ees     }
  \changePitch \patternA { aes g aes g aes g     | aes g f g       }
  \changePitch \patternA { ees ees ees g g g     | ees ees ees ees }

  \changePitch \patternA { ees ees ees g aes ees | ees ees ees ees }
  \changePitch \patternA { ees g ges f f f       | ees g g ees     }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { aes bes c des c ees     | ees ees c ees }
  \changePitch \patternA { c ees ees ees ees des   | c ees des c   }
  \changePitch \patternA { ees ees ees ees ees ees | ees ees c ees }
  \changePitch \patternA { aes, g aes bes ees des  | c aes aes g   }

  \changePitch \patternA { c des c des c g         | aes aes aes g }
  \changePitch \patternA { c ees aes, aes a bes    | c ees des c   }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { aes ees' ees ees ees ees | aes ees aes ees }
  \changePitch \patternA { aes ees aes g aes des,   | ees ees ees aes }
  \changePitch \patternA { c bes aes bes aes ees    | aes ees f ees   }
  \changePitch \patternA { c bes aes ees' ees ees   | aes c, c ees    }

  \changePitch \patternA { aes bes aes ees ees ees  | aes, c c ees    }
  \changePitch \patternA { aes ees aes des, des des | ees ees ees aes }

}
}

Refrain = \lyricmode {

Je -- sus the Sav -- iour is might -- y to save, \bar "."
Je -- sus hath tri -- umphed o’er death and the grave. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

O! what a Sav -- iour is Je -- sus the Lord! \bar "."
Well may His name by His saints be a -- dored! \bar "."
He has re -- deemed them from hell by His blood, \bar "."
Saved them for -- ev -- er and brought them to God. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Now in the glo -- ry He waits to im -- part
Peace to the con -- science, and joy to the heart;
Waits to be gra -- cious, to par -- don and heal
All who their sin and their wretch -- ed -- ness feel.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Thou -- sands have fled to His spear -- pierc -- ed side:
Wel -- come they all have been, none are de -- nied,
Wear -- y and la -- den, they all have been blest:
Joy -- ful -- ly now in the Sav -- iour they rest.

}

wordsD = \lyricmode {
\set stanza = "4."

Come, then, poor sin -- ner, no lon -- ger de -- lay,
Come to the Sav -- iour, come { \italicsOn } now { \italicsOff } while you may;
So shall your peace be e -- ter -- nal -- ly sure,
So shall your hap -- pi -- ness ev -- er en -- dure!

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
      %\context Lyrics = five  \lyricsto sopranos \wordsE
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
