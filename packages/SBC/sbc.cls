% LaTeX definitions for SBC 2001 style
%
% Created by Jomi Hubner & Rafael Bordini, june 2001
% updated march 2005
%
% Changed by Marco Aurélio Graciotto Silva (Oct/2006).
% Now it is a class, not a package

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sbc}[2006/10/26 Customized SBC article]

\DeclareOption{onecolumn}{
	\PassOptionsToClass{11pt,onecolumn}{article}
}

\DeclareOption{twocolumn}{
	\PassOptionsToClass{10pt,twocolumn}{article}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{oneside,a4paper}
\ProcessOptions

\LoadClass{article}

\RequirePackage{latexscholar-i18n}
\RequirePackage{latexscholar-pdf}
\RequirePackage{latexscholar-graphic}
\RequirePackage{latexscholar-verbatim}
\def\UrlFont{\tt\fontseries{uc}\fontsize{10}{1}\selectfont}

\RequirePackage{latexscholar-margin}
\geometry{a4paper,top=3.5cm,left=3cm,right=3cm,bottom=2.5cm}

\RequirePackage[num,abnt-url-package=url]{abntcite}


%%% End of generic LaTeX code %%%

\setlength{\parindent}{1.27cm}
\setlength{\parskip}{6pt}

\flushbottom

% Font
% \RequirePackage{times} % Obsoleted
% \RequirePackage{mathptmx}
\RequirePackage[scaled=.9]{helvet}
\RequirePackage{courier}

\renewcommand{\normalsize}{\@setfontsize\normalsize\@xiipt\@xivpt}
\newcommand{\XIIIPT}{\@setfontsize\xiiipt{13}{17}}
\newcommand{\XVIPT}{\@setfontsize\xvipt{16}{20}}

% new commands
\newcounter{instn}
\setcounter{instn}{1}
\newcommand{\instnum}{\arabic{instn}}
\newcommand{\inst}[1]{\ensuremath{^{#1}}}
\newcommand{\nextinstitute}{\\\mbox{}\\[-6pt] \addtocounter{instn}{1}\inst{\instnum}}
\newcommand{\email}[1]{\\\mbox{}\\[-6pt]\footnotesize\texttt{#1}}
\renewcommand{\and}{, }

% to avoid [...] in the bibliography
% \item[] instead of \item[\@biblabel{#1}\hfill]
%\def\@lbibitem[#1]#2{\item[]\if@filesw
%      {\let\protect\noexpand
%       \immediate
%       \write\@auxout{\string\bibcite{#2}{#1}}}\fi\ignorespaces}
\renewenvironment{thebibliography}[1]
     {\section*{\refname
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            %% changed!
               \itemindent -\leftmargin
               \itemsep 6pt
            %%%%%%%%%%%
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty thebibliography environment}}%
      \endlist}


% itens
\setlength\leftmargini   {1.27cm}
\setlength\leftmargin    {\leftmargini}
\setlength\leftmarginii  {\leftmargini}
\setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini}
\setlength  \labelsep    {.5em}
\setlength  \labelwidth  {\leftmargini}
\addtolength\labelwidth  {-\labelsep}
\def\@listI{\leftmargin\leftmargini
            \parsep 0\p@ \@plus1\p@ \@minus\p@
            \topsep 0\p@ \@plus2\p@ \@minus4\p@
            \itemsep0\p@}
\let\@listi\@listI
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    0\p@ \@plus2\p@ \@minus\p@}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    0\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@}


% sections
\renewcommand\section{\@startsection{section}{1}{\z@}%
                       {-6\p@ \@plus -4\p@ \@minus -4\p@}%
                       {0\p@ \@plus 4\p@ \@minus 4\p@}%
                       {\normalfont\XIIIPT\bfseries\boldmath
                        \rightskip=\z@ \@plus 8em\pretolerance=10000 }}

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                       {-6\p@ \@plus -4\p@ \@minus -4\p@}%
                       {0\p@ \@plus 4\p@ \@minus 4\p@}%
                       {\normalfont\normalsize\bfseries\boldmath
                        \rightskip=\z@ \@plus 8em\pretolerance=10000 }}


\RequirePackage{titlesec}
\titlelabel{\thetitle.\hspace{1ex}}

% first page

\pagestyle{empty}

\newcommand{\authortag}[1]{$^{#1}$}

\def\address#1{\gdef\@address{#1}}

\def\@maketitle{\newpage
 %\null % isso dava um espaco extra antes do title
 \begin{center}
   %\vglue -6pt
%   \vspace*{12pt}
\vspace*{-.7cm}
  {\XVIPT\bf\@title\par}
   \vglue 6pt plus 3pt minus 3pt
  {\normalsize
   \textbf{\begin{tabular}[t]{c}\@author\end{tabular}}\par}
   \vglue 6pt plus 3pt minus 3pt
  {\normalsize
   \begin{tabular}[t]{c}\inst{\instnum}\@address\end{tabular}\par}
   \vglue 6pt plus 3pt minus 3pt
   \end{center}\par
}
\let\maketitleOLD\maketitle
\renewcommand{\maketitle}{\maketitleOLD\thispagestyle{empty}}

\renewenvironment{abstract}{%
      \list{}{\advance\topsep by6pt\relax%\small
      \leftmargin=0.8cm
      \labelwidth=\z@
      \listparindent=\z@
      \itemindent\listparindent
      \rightmargin\leftmargin}\item[\hskip\labelsep
                                    \bfseries\itshape Abstract.]\itshape}%
      {\endlist}

\newenvironment{resumo}{%
      \list{}{\advance\topsep by6pt\relax%\small
      \leftmargin=0.8cm
      \labelwidth=\z@
      \listparindent=\z@
      \itemindent\listparindent
      \rightmargin\leftmargin}\item[\hskip\labelsep
                                    \bfseries\itshape Resumo.]\itshape}%
      {\endlist}
