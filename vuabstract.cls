\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vuabstract}[2018/03/31]

\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{setspace}
\doublespacing
\pagestyle{empty}

\def\advisor@title{}
\def\advisor@signature{}
\newcommand{\advisor}[2][]{
	\def\advisor@signature{#1}
	\def\advisor@title{#2}
	\ifx\sigadvisor\empty
		\let\sigadvisor\titleadvisor
	\fi}

\def\@major{}
\newcommand{\major}[1]{\def\@major{#1}}

\newcommand{\makeheader}{{
	\doublespacing
	\raggedleft
	\underline{\MakeUppercase\@major}\\[.5\baselineskip]
	\centering
	\singlespacing
	{\@title}\\[.5\baselineskip]
	%{\large\@title}\\[.5\baselineskip]
	\doublespacing
	\@author\\[.5\baselineskip]
	\underline{Dissertation under the direction of \advisor@title}\par
}}

\newcommand{\signatureline}{
	\vfill
	\singlespacing
	\noindent
	\raisebox{1.5pt}{Approved}~\hrulefill\hrulefill\hrulefill
	~~\raisebox{1.5pt}{Date}~\hrulefill
	\\
	\phantom{Approved~~}\advisor@signature
}