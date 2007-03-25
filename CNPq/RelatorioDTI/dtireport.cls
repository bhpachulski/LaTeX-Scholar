\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dtireport}[2006/09/14 CNPQ-ITI Report]
\LoadClass[12pt,twoside,a4paper]{article}

\RequirePackage[english,brazil]{babel}
\RequirePackage[latin1]{inputenc}

\RequirePackage{url}

% Defini��o do posicionamento padr�o das tabelas e figuras
\RequirePackage{float}
\restylefloat{table}
\restylefloat{figure}
\floatplacement{table}{!htb}
\floatplacement{figure}{!htb}

% Otimiza��o no espa�o ocupado por floats
\renewcommand{\floatsep}{8pt}
\renewcommand{\intextsep}{12pt}
\renewcommand{\textfloatsep}{12pt}

% Diminui o espa�o entre um float e seu caption.
\setlength{\abovecaptionskip}{4pt}

% Pacote para coordenar o posionamento de floats.
% Utilize \afterpage{\clearpage} para for�ar que todos os floats definidos at�
% aquele momento sejam inseridos.
\RequirePackage{afterpage}

% Habilitar a utiliza��o de figuras
\RequirePackage[pdftex]{graphicx}
\RequirePackage{epstopdf}

% Altera��o das margens das p�ginas
\RequirePackage[pdftex]{geometry}
\geometry{a4paper,left=2.5cm,right=2cm,top=2cm,bottom=3.5cm}

% Configura��o do espa�amento entre linhas (1,5)
\RequirePackage{setspace}
\onehalfspace

% Configura��o da indenta��o do par�grafo
\setlength{\parindent}{1.3cm}

% Lista de acr�nimos
\RequirePackage[printonlyused]{acronym}

% Macro utilizada para termos em ingl�s.
\newcommand\foreign[1]{\foreignlanguage{english}{\textit{#1}}}

% Macro utilizada para trechos de c�digo-fonte inseridos no meio do texto.
\newcommand\srccode[1]{\foreignlanguage{english}{\texttt{\small{#1}}}}

% Utilizado para listagens de c�digo-fonte
\RequirePackage{listings}
\lstset{basicstyle=\tiny}
\lstset{tabsize=4}
\lstset{frame=single}
\lstset{aboveskip=.5cm}
\lstset{belowskip=.5cm}
\lstset{xleftmargin=1cm}
\lstset{xrightmargin=1cm}
\lstset{resetmargins=true}
\lstset{frame=single}

% Macro para zerar os par�metros relacionados a espa�amento vertical.
% Originalmente este c�digo pertencia ao FAQ franc�s sobre LaTeX.
\def\Nospacing{
	\itemsep=0pt
	\partopsep=0pt
	\parskip=0pt
	\parsep=0pt
}

% Redifini��o do ambiente description para diminuir o espa�amento entre os itens. Uma solu��o mais
% elegante seria aquela adotada para itemize e enumerate nesta mesmo classe, mas ela n�o funciona
% (talvez esteja relacionado ao fato do description ser redefinido na classe book).
\renewenvironment{description}
	{\list{}{
		\Nospacing
		\let\makelabel\descriptionlabel}
	}
	{\endlist}

% Redefini��o do r�tulo de item em description, igual ao do book
\renewcommand*\descriptionlabel[1]{
	\hspace
	\labelsep
	\normalfont
	\bfseries #1
}

% Redefini��o dos ambientes itemize e enumerate, corrigindo o espa�amento entre
% os itens. C�digo retirado do FAQ franc�s sobre LaTeX.
\let\orig@Itemize =\itemize
\let\orig@Enumerate =\enumerate
\renewenvironment{itemize}{\orig@Itemize\Nospacing}{\endlist}
\renewenvironment{enumerate}{\orig@Enumerate\Nospacing}{\endlist}



% Traduz os nomes de listagens e fragmentos de c�digo para portugu�s
\renewcommand{\lstlistingname}{Fragmento de c�digo}
\renewcommand{\lstlistlistingname}{Lista de fragmentos de c�digo}

% Adequa��o das cita��es e refer�ncias a norma ABNT
\RequirePackage[alf,abnt-url-package=url]{abntcite}

\RequirePackage[nottoc,notindex,notlot,notlof,numbib]{tocbibind}

\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university{} given}\@ehc}%

\def\departament#1{\gdef\@departament{#1}}%
\def\@departament{\@latex@error{No \noexpand\departament{} given}\@ehc}%

\def\masterproject#1{\gdef\@masterproject{#1}}%
\def\@masterproject{\@latex@error{No \noexpand\masterproject{} given}\@ehc}%

\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor{} given}\@ehc}%

\def\processid#1{\gdef\@processid{#1}}%
\def\@processid{\@latex@error{No \noexpand\processid{} given}\@ehc}%

\def\address#1{\gdef\@address{#1}}%
\def\@address{\@latex@error{No \noexpand\address{} given}\@ehc}%


\renewcommand{\maketitle}{%
	\pagestyle{empty}
	\begin{titlepage}
		\newpage
		\null
		\vfill
		\begin{minipage}{.9\linewidth}
			\begin{center}
				{\Large \textbf{Projeto} \par}
				\vskip 1em
				{\Large \textsf{\@masterproject} \par}
				\vskip 1em
				{\large Processo n� \@processid}
			\end{center}
			\vskip 7em
			\begin{center}
				{\Large \textbf{Relat�rio Parcial} \par}
				\vskip 1em
				{\LARGE \textsf{\@title} \par}
			\end{center}
		\end{minipage}
		\vfill
		\begin{flushleft}
			{\large \textbf{Bolsista:}\textit{\@author} \normalsize \par}
			\vskip 1em
			{\large \textbf{Coordenador:} \textit{\@advisor} \normalsize \par}
			\vskip 1.5em
		\end{flushleft}
		\vfill
		\begin{center}
			{\large \@address \par}
			{\large \@date \par}
		\end{center}
	\end{titlepage}
	\cleardoublepage
}