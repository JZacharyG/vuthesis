\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vuthesis}[2018/03/31]

\newcommand{\committee@cmd}{}
\DeclareOption{signatures}%
	{\renewcommand{\committee@cmd}{\committee@signatures}}
\DeclareOption{approved}%
	{\renewcommand{\committee@cmd}{\committee@approved}}

\newcommand{\committee@size}{}
\DeclareOption{smallnames}%
	{\renewcommand{\committee@size}{\scriptsize}}
\DeclareOption{largenames}%
	{\renewcommand{\committee@size}{\normalsize}}

\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{report}}


\ExecuteOptions{smallnames,approved}
\ProcessOptions\relax
\LoadClass[titlepage]{report}


\RequirePackage{setspace}
\RequirePackage{forarray}

\RequirePackage[nottoc]{tocbibind} % include lof, lot, and bib, in toc
\RequirePackage[titles]{tocloft}


%>>> Customizing the title page <<<%
\newcommand{\title@size}{\normalsize}
\newcommand{\titlesize}[1]{\renewcommand{\title@size}{#1}}

\def\@committee{}
\def\oncommittee{\@ifstar\oncommittee@star\oncommittee@nostar}
\newcommand{\oncommittee@nostar}[1]%
{%
	\ifx\@committee\empty%
		\def\@committee{{#1}}%
	\else%
		\g@addto@macro\@committee{,{#1}}%
	\fi%
}
\newcommand{\oncommittee@star}[1]{\oncommittee@nostar{#1 (Chair)}}
\newlength{\signature@total@length}
\setlength{\signature@total@length}{4.5in}
\newlength{\date@line@length}
\setlength{\date@line@length}{1in}
\newlength{\signature@line@sep}
\setlength{\signature@line@sep}{.1in}
\newlength{\signature@line@height}
\setlength{\signature@line@height}{.3in minus .1in}

\newcommand{\committee@signatures}{%
	{\centering\singlespacing
	\makebox[\signature@total@length]{\small Approved:\hfill\makebox[0pt][l]{Date:}\hspace{\date@line@length}}%
	\ForEachX{,}%
	{%
		\vskip \signature@line@height
		\parbox{\signature@total@length}{\hrulefill\hspace{\signature@line@sep}\rule{\date@line@length}{.4pt}\\
		\committee@size\thislevelitem}
	}%
	{\@committee}%
	\par}%
}
\newcommand{\committee@approved}{%
	\vskip .5in%
	{%
		\centering\onehalfspacing%
		Approved:\\%
		\ForEachX{,}%
			{\thislevelitem\par}%
			{\@committee}%
	}%
}

\def\@title{[Title]}
\def\@author{[Your Name]}
\def\@major{[Major]}
\def\@degree{[Degree]}
\def\@date{[Month Day, Year]}
\newcommand{\major}[1]{\def\@major{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\let\graduationdate\date
\let\date\undefined

\renewcommand\maketitle{%
	\begin{titlepage}%
		\let\footnotesize\small
		\let\footnoterule\relax
		\let \footnote \thanks
		\thispagestyle{empty}%
		{
			\centering%
			\singlespacing%
			{\title@size\@title}\\%
			\doublespacing%
			\vskip .5\baselineskip%
			By\\%
			\@author\\%
			\vskip .5\baselineskip%
			Dissertation\\%
			Submitted to the Faculty of the\\%
			Graduate School of Vanderbilt University\\%
			in partial fulfillment of the requirements\\%
			for the degree of\\%
			\MakeUppercase{\@degree}\\%
			in\\%
			\@major\\%
			\@date\\%
			Nashville, Tennessee\\%
			\vskip .5\baselineskip%
%			\vskip .5in minus .25in%
		}%
		\vfil%
		\committee@cmd%
		\vfil%
	\end{titlepage}%
	\setcounter{footnote}{0}%
	\global\let\thanks\relax
	\global\let\maketitle\relax
	\global\let\title\relax
	\global\let\author\relax
	\global\let\graduationdate\relax
	\global\let\and\relax
}


%>>> Customizing the prelimiary sections and bibliography <<<%
\renewcommand{\contentsname}{TABLE OF CONTENTS}
\renewcommand{\listfigurename}{LIST OF FIGURES}
\renewcommand{\listtablename}{LIST OF TABLES}
\renewcommand{\bibname}{BIBLIOGRAPHY}

\newcommand{\copyrightpage}[1]{%
	\clearpage
	{
		\topskip 0pt
		\centering
		\singlespacing
		\vspace*{\stretch{3.5}}
		Copyright \raisebox{.3ex}{{\scriptsize\textcopyright}} #1 by \@author \\
		All rights reserved.\\
		\vspace*{\stretch{6.5}}
	}
	\clearpage
}

\newenvironment{dedication}%
{%
	\clearpage%
	\topskip 0pt%
	\phantomsection\addcontentsline{toc}{chapter}{DEDICATION}%
	\vspace*{\stretch{3.5}}%
	\centering%
}%
{%
	\par%
	\vspace*{\stretch{6.5}}%
}

\newcommand{\acknowledgements}{\chapter*{ACKNOWLEDGMENTS}\addcontentsline{toc}{chapter}{ACKNOWLEDGMENTS}}

\newcommand{\preface}{\chapter*{PREFACE}\addcontentsline{toc}{chapter}{PREFACE}}

%\RequirePackage{afterpage}
%
%\newif\ifintoc
%\newif\ifinlof
%\newif\ifinlot
%
%\newcommand*{\print@tocheader}
%	{\hbox to \linewidth{\hfill Page}\afterpage{\ifintoc\print@tocheader\fi}}
%\newcommand*{\print@lofheader}
%	{\hbox to \linewidth{\hfill Page}\afterpage{\ifinlof\print@lofheader\fi}}
%\newcommand*{\print@lotheader}
%	{\hbox to \linewidth{\hfill Page}\afterpage{\ifinlot\print@lotheader\fi}}
%
%\AtBeginDocument{%
%	\addtocontents{toc}{\protect\print@tocheader}%
%	\addtocontents{lof}{\protect\print@lofheader}%
%	\addtocontents{lot}{\protect\print@lotheader}%
%	\let\@oldtoc\tableofcontents%
%	\def\tableofcontents{\clearpage\begingroup\singlespacing\intoctrue\@oldtoc\endgroup}% % \AtBeginEnvironment (from the etoolbox or xpatch packages)?
%	\let\@oldlof\listoffigures%
%	\def\listoffigures{\clearpage\begingroup\singlespacing\inloftrue\@oldlof\endgroup}%
%	\let\@oldlot\listoftables%
%	\def\listoftables{\clearpage\begingroup\singlespacing\inlottrue\@oldlot\endgroup}%
%}

\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

\newcommand{\preliminaries}{\clearpage\pagenumbering{roman}\setcounter{page}{2}}

\def\write@heading{\@ifstar\write@heading@star\write@heading@nostar}
\newcommand{\write@heading@star}[3]{\immediate\write\@auxout{\noexpand\@writefile{#1}{\noexpand\vspace{10pt}\noexpand\hbox to \linewidth{#2\hfill#3}}}}
\newcommand{\write@heading@nostar}[3]{\immediate\write\@auxout{\noexpand\@writefile{#1}{\noexpand\hbox to \linewidth{#2\hfill#3}}}}

\newcommand{\maincontent}{\clearpage\pagenumbering{arabic}\setcounter{page}{1}%
	\write@heading*{toc}{Chapter}{}
}


\AtBeginDocument{
	\write@heading{toc}{}{Page}
	\write@heading{lof}{Figure}{Page}
	\write@heading{lot}{Table}{Page}
	\let\@oldtoc\tableofcontents%
	\def\tableofcontents{\clearpage{\singlespacing\@oldtoc}\clearpage}%
	\let\@oldlof\listoffigures%
	\def\listoffigures{\clearpage{\singlespacing\@oldlof}\clearpage}%
	\let\@oldlot\listoftables%
	\def\listoftables{\clearpage{\singlespacing\@oldlot}\clearpage}%
	\@ifpackageloaded{nomencl}{%
		\let\@oldnlo\printnomenclature%
		\def\printnomenclature{\clearpage{\singlespacing\@oldnlo}\clearpage}%
	}{}
	\let\@oldapp\appendix%
	\def\appendix{\@oldapp\write@heading*{toc}{Appendix}{}}%
}
%\setcounter{secnumdepth}{7}
%\setcounter{tocdepth}{7}
\setcounter{lotdepth}{2}
\setcounter{lofdepth}{2}


%>>> Customize chapter/section headings <<<%
\RequirePackage{titlesec}
\RequirePackage{calc}

\def\paragraph@size{\normalsize}
\def\subsubsection@size{\paragraph@size}
\def\subsection@size{\subsubsection@size}
\def\section@size{\subsection@size}
\def\chapter@size{\section@size}
\def\chapter@size@top{\chapter@size}

\newcommand{\chaptersize}[2][]{
	\def\chapter@size{#2}
	\def\chapter@size@top{#1}
	\ifx\chapter@size@top\empty
		\def\chapter@size@top{#2}
	\fi
}
\newcommand{\sectionsize}[1]{\def\section@size{#1}}
\newcommand{\subsectionsize}[1]{\def\subsection@size{#1}}
\newcommand{\subsubsectionsize}[1]{\def\subsubsection@size{#1}}
\newcommand{\paragraphsize}[1]{\def\paragraph@size{#1}}

\newcommand{\chapter@font}{\normalfont}
\newcommand{\boldchapters}{\renewcommand{\chapter@font}{\bfseries\boldmath}}
\newcommand{\section@font}{\normalfont}
\newcommand{\boldsections}{\renewcommand{\section@font}{\bfseries\boldmath}}
\newcommand{\subsection@font}{\normalfont}
\newcommand{\boldsubsections}{\renewcommand{\subsection@font}{\bfseries\boldmath}}
\newcommand{\subsubsection@font}{\normalfont}
\newcommand{\boldsubsubsections}{\renewcommand{\subsubsection@font}{\bfseries\boldmath}}
\newcommand{\paragraph@font}{\normalfont}
\newcommand\boldparagraphs{\renewcommand{\paragraph@font}{\bfseries\boldmath}}

\titleformat{\chapter}[display]
	{\begin{spacing}{1}\vspace*{-\baselineskip}\vspace*{-\parskip}\chapter@font\chapter@size@top\filcenter}
	{\chaptertitlename\ \thechapter}
	{\baselineskip-\parskip}
	{\chapter@size}[\end{spacing}]
\titlespacing*{\chapter}{.5in}{0pt}{\baselineskip-\parskip}[.5in]

\titleformat{\section}[block]
	{\begin{spacing}{1}\section@font\section@size\filcenter}
	{\thesection}
	{1em}
	{}[\end{spacing}]
\titlespacing*{\section}{.5in}{\baselineskip-\parskip}{\baselineskip-\parskip}[.5in]

\titleformat{\subsection}[hang]
	{\subsection@font\subsection@size\singlespacing}
	{\thesubsection}
	{1em}
	{}

\titleformat{\subsubsection}[hang]
	{\subsubsection@font\subsubsection@size\singlespacing}
	{\thesubsubsection}
	{1em}
	{}

\titleformat{\paragraph}[hang] % runin?
	{\paragraph@font\paragraph@size\singlespacing}
	{\theparagraph}
	{1em}
	{}



% Just to make the template look nice...
\newcommand{\emptybox}[2]{\fbox{\parbox[c][#2]{#1}{~}}}


\endinput
