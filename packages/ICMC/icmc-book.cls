\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{latexscholar-book}[2011/07/14 Common settings for books]

\RequirePackage{latexscholar-i18n}
\RequirePackage{latexscholar-pdf}
\RequirePackage{latexscholar-margin}
\RequirePackage{latexscholar-float}
\RequirePackage{latexscholar-list-environment}
\RequirePackage{latexscholar-footnote}
\RequirePackage{latexscholar-verbatim}
\RequirePackage{latexscholar-todo}
\RequirePackage{latexscholar-title}
\RequirePackage{latexscholar-bibtex}
\RequirePackage{latexscholar-graphic}
\RequirePackage{latexscholar-text-spacing}
\RequirePackage{latexscholar-font-style}
\RequirePackage{latexscholar-quote}
\RequirePackage{latexscholar-drm}
\RequirePackage{latexscholar-latim}

\RequirePackage[nottoc,notindex,notlot,notlof,numbib]{tocbibind}

\RequirePackage{latexscholar-hacks}

% Package required to create the titlepage (margin configuration and text
% centering).
%
\RequirePackage{chngpage}

% Avoids widow lines (do not set a value higher than 10000 as this may disable
% the intended behaviour, do not ask me why!).
\widowpenalty = 9999
\clubpenalty = 9999

% Gives some extra spacing between paragraphs.
\setlength{\parskip}{3pt}

% Do no use uppercase for \bibname.
\renewenvironment{thebibliography}[1]{
	\addcontentsline{toc}{chapter}{\numberline{}\bibname}
	\chapter*{\bibname}%

	\list{
		\@biblabel{\@arabic\c@enumiv}
	}{
		\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}
	}
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m
}{
	\def\@noitemerr
	{\@latex@warning{Empty thebibliography environment}}
	\endlist
}



% Do not use the chapter title on the page head (bug 94)
%
\if@twoside
	\def\ps@headings{
		\let\@oddfoot\@empty
		\let\@evenfoot\@empty
		\def\@evenhead{\thepage\hfil}
		\def\@oddhead{\hfil\thepage}
		\let\@mkboth\markboth
	}
\else
	\def\ps@headings{
		\let\@oddfoot\@empty
		\def\@oddhead{\hfil\thepage}
		\let\@mkboth\markboth
	}
\fi

% Bug 94
\renewcommand\tableofcontents{
	\cleardoublepage
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\contentsname}
	\@starttoc{toc}
	\if@restonecol
		\twocolumn
	\fi
}

% Bug 94
\renewcommand\listoffigures{
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\listfigurename}
	\@starttoc{lof}
	\if@restonecol
		\twocolumn
	\fi
}

% Bug 94
\renewcommand\listoftables{
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\listtablename}
	\@starttoc{lot}
	\if@restonecol
		\twocolumn
	\fi
}

% Bug 94
\renewenvironment{theindex}{
	\if@twocolumn
		\@restonecolfalse
	\else
		\@restonecoltrue
\fi
	\columnseprule \z@
	\columnsep 35\p@
	\twocolumn[\@makeschapterhead{\indexname}]
	\thispagestyle{plain}\parindent\z@
	\parskip\z@ \@plus .3\p@\relax
	\let\item\@idxitem
}{
	\if@restonecol
		\onecolumn
	\else
		\clearpage
	\fi
}

% Command to create a dedicate page.
\newcommand{\dedicate}{
	\cleardoublepage
	\vfill
	\hfill
	\parbox{.4\linewidth}{\textsl{\@dedication}}
	\vspace{3cm}
}

% Environment to write abstract (in English and native language). This
% environment has narrower margins.
\newenvironment{abstract}{
	\chapter*{Abstract}
	\addcontentsline{toc}{chapter}{Abstract}
	\narrower
	\vfill
}{
	\vfill
}
\newenvironment{resumo}{
	\chapter*{Resumo}
	\addcontentsline{toc}{chapter}{Resumo}
	\narrower
	\vfill
}{
	\vfill
}

\newenvironment{agradecimentos}{
	\cleardoublepage
	\chapter*{Agradecimentos}
	\thispagestyle{empty}
}{
	\thispagestyle{empty}
}

% Glossary
\RequirePackage{makeglo}
\makeglossary

% Index creation
\RequirePackage{makeidx}
\makeindex

% Pretty chapter start at frontmatter
\newpagestyle{frontmatter}{
	\sethead{}
		{}
		{}
	\setfoot{}
		{\thepage}
		{}
}

% Pretty chapter start at mainmatter
\newpagestyle{mainmatter}[\small\sffamily]{
	\headrule
	\sethead{}
		{}
		{}
	\setfoot{}
		{\thepage}
		{}
}

% Pretty chapter start at backmatter
\newpagestyle{backmatter}{
	\headrule
	\sethead{}
		{}
		{}
	\setfoot{}
		{\thepage}
		{}
}


\renewcommand\frontmatter{%
	\cleardoublepage
	\@mainmatterfalse
	\pagestyle{frontmatter}
	\pagenumbering{roman}
	\titlespacing{\chapter}{0pt}{0em}{2em}[0pt]
}

\renewcommand\mainmatter{
	% Hack to fix page numbering
	\cleardoublepage
	\setcounter{page}{1}
	\@mainmattertrue
	% \pagestyle{mainmatter}
	\pagenumbering{arabic}
	\titlespacing{\chapter}{0pt}{0em}{2em}[0pt]
}

\renewcommand\backmatter{%
	\cleardoublepage
	\@mainmatterfalse
%	\pagestyle{backmatter}
%	\pagenumbering{arabic}
	\titlespacing{\chapter}{0pt}{0em}{2em}[0pt]
}

% Macro to highlight the first letter of the text.
%
%  \begin{document}
%    \versal{IN} THE beginning God created the heaven and the earth.  Now the
%    earth was unformed and void, and darkness was upon the face of the
%    deep; and the spirit of God hovered over the face of the waters.
%  \end{document}
%
%  will produce something like this:
%
%  I I\  I THE beginning God  created the heaven and  the earth.
%  I I \ I Now the earth was unformed and void, and darkness was
%  I I  \I upon the face of the deep; and the spirit of God hov-
%  ered over the face of the waters.
\font\versalfont= pzcmi scaled 6500
\newcommand{\versal}[1]{{\noindent
    \setbox0\hbox{\versalfont #1 }%
    \count0=\ht0                   % height of versal
    \count1=\baselineskip          % baselineskip
    \divide\count0 by \count1      % versal height/baselineskip
    \dimen1 = \count0\baselineskip % distance to drop versal
    \advance\count0 by 1\relax     % no of indented lines
    \dimen0=\wd0                   % width of versal
    \global\hangindent\dimen0      % set indentation distance
    \global\hangafter-\count0      % set no of indented lines
    \hskip-\dimen0\setbox0\hbox to\dimen0{\raise-\dimen1\box0\hss}%
    \dp0=0in\ht0=0in\box0}}

% Pretty chapter start
% \chapternumberfont{\helveticabold at 64pt}

\newlength{\chaptertitleheight}
\titleformat{\chapter}[display]
	{\normalfont\Large\sffamily} % Text format
	{ % Label
		\rule[32pt]{.7\linewidth}{4pt}
		\hspace{-10pt}
		\shadowbox{
			\begin{minipage}{.18\linewidth}
				\centering
				\textsc{\Large\chaptertitlename}\\
				\vspace{1ex}
				{\fontsize{80}{100}\selectfont\thechapter}\\
				\vspace{1ex}
			\end{minipage}
		}
		\hspace{-14pt}
		\leaders\hbox{\rule[32pt]{.1pt}{4pt}}\hfill
	}
	{0pt}
	{\Huge\raggedright}
	[\rule{\linewidth}{4pt}]

\newsavebox{\scholar@chaptertitle}%
\let\scholar@oldchapter\chapter%
\renewcommand*\chapter{%
	\@ifstar{\scholar@oldchapter@starred}{\@dblarg\scholar@oldchapter@notstarred}}

\newcommand*\scholar@oldchapter@starred[1]{
	\savebox{\scholar@chaptertitle}{\Huge\parbox[t]{\textwidth}{#1}}%
	\settototalheight{\chaptertitleheight}{\usebox{\scholar@chaptertitle}}%
	\addtolength{\chaptertitleheight}{3cm}%
	\titlespacing{\chapter}{0pt}{0em}{\chaptertitleheight}[0pt]
	\scholar@oldchapter*{#1}}

\def\scholar@oldchapter@notstarred[#1]#2{
	\savebox{\scholar@chaptertitle}{\Huge\parbox[t]{\textwidth}{#2}}%
	\settototalheight{\chaptertitleheight}{\usebox{\scholar@chaptertitle}}%
	\addtolength{\chaptertitleheight}{7cm}%
	\titlespacing{\chapter}{0pt}{0em}{\chaptertitleheight}[0pt]%
	\scholar@oldchapter[{#1}]{#2}}%
