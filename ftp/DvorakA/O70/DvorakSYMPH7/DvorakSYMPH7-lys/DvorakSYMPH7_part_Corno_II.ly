%{
  ***********************************************************************
  * Dvořák - Symphony nr 7                                              *
  *                                                                     *
  * encodage par J.F. Lucarelli                                         *
  * 18/11/12 - 01/11/2013                                               *
  * Ver 0.0 : 04/09/2013                                                *
  * Ver 1.0 : 01/11/2013                                                *
  *                                                                     *
  * Symphonie n°7 : parties séparées : Cor 2                            *
  *                                                                     *
  * ******************************                                      *
  * *   Fichier principal        *                                      *
  * ******************************                                      *
  *                                                                     *
  ***********************************************************************
%}

\include "Common/Version.ly"
\include "Common/Fonctions.ly"
\include "Common/Variables.ly"

\include "Common/Declarations.ly"
\include "Common/Dimension-parts.ly"

Part = "Corno II"
PartShort = "Co2"

\include "Common/Paper-parts.ly"
\include "Common/Header_parts.ly"	% titres

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\include "DvorakSYMPH7M1/DvorakSYMPH7M1_Tempi_parts.ly"	% tempi
\include "DvorakSYMPH7M1/DvorakSYMPH7M1_musique-Corno_I_II.ly"

% Citations
% Cor I déjà inclu
\include "DvorakSYMPH7M1/DvorakSYMPH7M1_musique-Corno_III_IV.ly"
\include "DvorakSYMPH7M1/DvorakSYMPH7M1_musique-Violoncello.ly"
\addQuote scoreSgMaCornoI { \keepWithTag #'quoteCornoII \quoteScoreSgMaCornoI }
\addQuote scoreSgMaCornoIV { \keepWithTag #'quoteCornoII \quoteScoreSgMaCornoIV }
\addQuote scoreSgMaVioloncello { \keepWithTag #'quoteCornoII \quoteScoreSgMaVioloncello }

staffSgMaCornoII = \new Staff \with {\consists "Page_turn_engraver"}{\voiceSgMaCornoII}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\include "DvorakSYMPH7M2/DvorakSYMPH7M2_Tempi_parts.ly"	% tempi
\include "DvorakSYMPH7M2/DvorakSYMPH7M2_musique-Corno_I_II.ly"

% Citations

\include "DvorakSYMPH7M2/DvorakSYMPH7M2_musique-Flauto_I_II.ly"
\include "DvorakSYMPH7M2/DvorakSYMPH7M2_musique-Fagotto_I_II.ly"
\include "DvorakSYMPH7M2/DvorakSYMPH7M2_musique-Violino_I.ly"
\addQuote scoreSgMbFlautoI { \keepWithTag #'quoteCornoII \quoteScoreSgMbFlautoI }
\addQuote scoreSgMbCornoI { \keepWithTag #'quoteCornoII \quoteScoreSgMbCornoI }
\addQuote scoreSgMbFagottoI { \keepWithTag #'quoteCornoII \quoteScoreSgMbFagottoI }
\addQuote scoreSgMbViolinoI { \keepWithTag #'quoteCornoII \quoteScoreSgMbViolinoI }

staffSgMbCornoII = \new Staff \with {\consists "Page_turn_engraver"}{\voiceSgMbCornoII}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\include "DvorakSYMPH7M3/DvorakSYMPH7M3_Tempi_parts.ly"	% tempi
\include "DvorakSYMPH7M3/DvorakSYMPH7M3_musique-Corno_I_II.ly"

% Citations
\include "DvorakSYMPH7M3/DvorakSYMPH7M3_musique-Clarinetto_I_II.ly"
% Cor II déjà inclu
\addQuote scoreSgMcClarinettoI { \keepWithTag #'quoteCornoII \quoteScoreSgMcClarinettoI }
\addQuote scoreSgMcCornoI { \keepWithTag #'quoteCornoII \quoteScoreSgMcCornoI }

staffSgMcCornoII = \new Staff \with {\consists "Page_turn_engraver"}{\voiceSgMcCornoII}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\include "DvorakSYMPH7M4/DvorakSYMPH7M4_Tempi_parts.ly"	% tempi
\include "DvorakSYMPH7M4/DvorakSYMPH7M4_musique-Corno_I_II.ly"

% Citations
\include "DvorakSYMPH7M4/DvorakSYMPH7M4_musique-Flauto_I_II.ly"
\include "DvorakSYMPH7M4/DvorakSYMPH7M4_musique-Corno_I_II.ly"
\include "DvorakSYMPH7M4/DvorakSYMPH7M4_musique-Corno_III_IV.ly"
\addQuote scoreSgMdFlautoI { \keepWithTag #'quoteCornoII \quoteScoreSgMdFlautoI }
\addQuote scoreSgMdCornoI { \keepWithTag #'quoteCornoII \quoteScoreSgMdCornoI }
\addQuote scoreSgMdCornoIII { \keepWithTag #'quoteCornoII \quoteScoreSgMdCornoIII }

staffSgMdCornoII = \new Staff \with {\consists "Page_turn_engraver"}{\voiceSgMdCornoII}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
  On peut forcer manuellement l'espacement horizontal en insérant dans les layouts le texte suivant :
  \context {
        \Score
        \override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 16)
      }
  La valeur de 16 est correcte pour les mouvements 1 et 4, 32 pour le second mouvement, et 8 pour le 3ième mouvement
%}

% Partition proprement dite

\book {
  \label #'MvmtI
  \markup {\fill-line {\fontsize #3 \lower#7 \bold "I"}}
  \noPageBreak
  \score {
    \keepWithTag #'partScore
    \staffSgMaCornoII
    \layout {
      \context {
        \Score
        \override RehearsalMark #'after-line-breaking =
        #(lambda (grob)
           (let* ((parent (ly:grob-parent grob X))
                  (elts (ly:grob-array->list (ly:grob-object parent 'elements)))
                  (symbols (filter identity (map (lambda (elt)
                    (ly:grob-property elt 'break-align-symbol #f))
                     elts))))
             (and (= (ly:item-break-dir grob) RIGHT)
                  (not (memq 'staff-bar symbols))
                  (ly:grob-translate-axis! grob (interval-length
              (ly:grob-extent parent parent X)) X))
               (ly:side-position-interface::move-to-extremal-staff grob)))
      }
      \context {
        \CueVoice
        \override TupletBracket #'bracket-visibility = ##f
      }
    }
    \midi {
    }
  }

  \label #'MvmtII
  \markup {\fill-line {\fontsize #3 \lower#7 \bold "II"}}
  \noPageBreak
  \score {
    \keepWithTag #'partScore
    \staffSgMbCornoII
    \layout {
      \context {
        \Score
        \override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 16)
        \override RehearsalMark #'after-line-breaking =
        #(lambda (grob)
           (let* ((parent (ly:grob-parent grob X))
                  (elts (ly:grob-array->list (ly:grob-object parent 'elements)))
                  (symbols (filter identity (map (lambda (elt)
                    (ly:grob-property elt 'break-align-symbol #f))
                     elts))))
             (and (= (ly:item-break-dir grob) RIGHT)
                  (not (memq 'staff-bar symbols))
                  (ly:grob-translate-axis! grob (interval-length
              (ly:grob-extent parent parent X)) X))
               (ly:side-position-interface::move-to-extremal-staff grob)))
      }
      \context {
        \CueVoice
        \override TupletBracket #'bracket-visibility = ##f
      }
    }
    \midi {
    }
  }

  \label #'MvmtIII
  \markup {\fill-line {\fontsize #3 \lower#7 \bold "III"}}
  \noPageBreak
  \score {
    \keepWithTag #'partScore
    \staffSgMcCornoII
    \layout {
      \context {
        \Score
        \override RehearsalMark #'after-line-breaking =
        #(lambda (grob)
           (let* ((parent (ly:grob-parent grob X))
                  (elts (ly:grob-array->list (ly:grob-object parent 'elements)))
                  (symbols (filter identity (map (lambda (elt)
                    (ly:grob-property elt 'break-align-symbol #f))
                     elts))))
             (and (= (ly:item-break-dir grob) RIGHT)
                  (not (memq 'staff-bar symbols))
                  (ly:grob-translate-axis! grob (interval-length
              (ly:grob-extent parent parent X)) X))
               (ly:side-position-interface::move-to-extremal-staff grob)))
      }
      \context {
        \CueVoice
        \override TupletBracket #'bracket-visibility = ##f
      }
    }
    \midi {
    }
  }

  \label #'MvmtIV
  \markup {\fill-line {\fontsize #3 \lower#7 \bold "IV "}}
  \noPageBreak
  \score {
    \keepWithTag #'partScore
    \staffSgMdCornoII
    \layout {
      \context {
        \Score
        \override RehearsalMark #'after-line-breaking =
        #(lambda (grob)
           (let* ((parent (ly:grob-parent grob X))
                  (elts (ly:grob-array->list (ly:grob-object parent 'elements)))
                  (symbols (filter identity (map (lambda (elt)
                    (ly:grob-property elt 'break-align-symbol #f))
                     elts))))
             (and (= (ly:item-break-dir grob) RIGHT)
                  (not (memq 'staff-bar symbols))
                  (ly:grob-translate-axis! grob (interval-length
              (ly:grob-extent parent parent X)) X))
               (ly:side-position-interface::move-to-extremal-staff grob)))
      }
      \context {
        \CueVoice
        \override TupletBracket #'bracket-visibility = ##f
      }
    }
    \midi {
    }
  }
}
