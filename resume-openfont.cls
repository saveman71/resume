% Intro Options
\ProvidesClass{resume-openfont}[2017/03/19 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

\usepackage{babel}

% Package Imports
\usepackage[hmargin=1.25cm, vmargin=0.75cm]{geometry}
\usepackage[a-3u]{pdfx}

\hypersetup{%
  hidelinks,
}

% Color definitions
\PassOptionsToPackage{usenames,dvipsnames}{xcolor}
% \usepackage[usenames,dvipsnames]{xcolor}
\definecolor{date}{HTML}{666666}
\definecolor{primary}{HTML}{2b2b2b}
\definecolor{headings}{HTML}{444444}
\definecolor{headingsrule}{HTML}{00b6ff}
\definecolor{subheadings}{HTML}{333333}
\definecolor{headingsrulegray}{HTML}{eeeeee}

% Set main fonts
\usepackage{fontspec}
% Disable ligatures to be machine readable
\defaultfontfeatures{Ligatures={NoRequired, NoCommon, NoContextual}}
\setmainfont[
  Color=primary,
  Path=fonts/lato/,
  BoldItalicFont=Lato-Italic,
  BoldFont=Lato-Regular,
  ItalicFont=Lato-LightItalic
]{Lato-Light}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight}


% Date command
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{isodate}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\newcommand{\lastupdated}{\begin{textblock}{60}(155,8)
\color{date}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont
Last Updated on \today
\end{textblock}}

% Name command
\newcommand{\namesection}[3]{
{
\noindent
\kern-0.35em
\fontsize{30pt}{30pt}
\fontspec[Path = fonts/roboto/]{Roboto-Thin}\selectfont #1
\fontspec[Path = fonts/roboto/]{Roboto-Light}\selectfont #2 \hfill \fontspec[Path = fonts/raleway/]{Raleway-Regular}
\fontsize{11pt}{14pt}\selectfont\noindent #3}\\
\color{headings}
%\noindent\makebox[\linewidth]{\color{headingsrule}\rule{\paperwidth}{0.4pt}}
%\vspace{-10pt}
}

% Section seperators
\usepackage[explicit]{titlesec}
\titlespacing{\section}{0pt}{0pt}{2pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionsep}{\vspace{6pt}}

% Headings command
\titleformat
  {\section}
  {\color{headings}\scshape\fontspec[Path = fonts/lato/]{Lato-Light}\fontsize{15pt}{22pt}\selectfont}
  {\kern-0.1ex}
  {0em}
  {\MakeUppercase{#1}}
  [{\vspace{-.30em}\color{headingsrule}\titlerule[0.4pt]\vspace{.30em}}]

% Subeadings command
\titleformat
  {\subsection}
  {\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bold}\fontsize{11pt}{11pt}\selectfont}
  {\kern-0.05ex}
  {0em}
  {\MakeUppercase{#1}}
  []

\newcommand{\runsubsection}[1]{%
{\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bold}\fontsize{11pt}{11pt}\selectfont\bfseries {#1} \normalfont}}

% Descriptors command
\newcommand{\descript}[1]{%
{\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {| #1 \\} \normalfont}}

% Descriptors command
\newcommand{\subtitle}[1]{%
{\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1 \\} \normalfont}}

% Location command
\newcommand{\location}[1]{%
{\color{headings}\raggedright\fontspec[Path = fonts/raleway/,ItalicFont=Raleway-Light]{Raleway-Medium}\fontsize{9pt}{11pt}\selectfont {#1\\} \normalfont}\vspace{4pt}}

% Small heading command
\newcommand{\smallheading}[1]{%
{\color{headings}\raggedright\fontspec[Path = fonts/raleway/,ItalicFont=Raleway-Light]{Raleway-Medium}\fontsize{9pt}{11pt}\selectfont {#1\\} \normalfont}}

% Bullet Lists with fewer gaps command
\usepackage{enumitem}
\newenvironment{tightemize}{%
\vspace{-\topsep}
\begin{itemize}[leftmargin=1.8em]
  \setlength
  \itemsep{0.2em}
  \parskip0pt
  \parsep0pt
}
{\end{itemize}}

% Icons
\usepackage{fontawesome}

% Breakable page
\usepackage[skins,breakable]{tcolorbox} % see https://chat.stackexchange.com/transcript/message/36133154#36133154
\newenvironment{sidebar}[1]
{\begin{tcolorbox}[
  width=0.66\textwidth,
  enlarge left by=0.34\textwidth,
  breakable, blanker,arc=0pt,outer arc=0pt,left=0pt,right=0pt,bottom=0pt,boxsep=0pt,top=0pt,
  underlay unbroken and first={%
    \node[inner sep=0pt, outer sep=0pt, text width=0.31\textwidth,
      align=none,
      below right]
      at ([xshift=-0.34\textwidth]frame.north west)
  {\begin{minipage}{\textwidth}#1\end{minipage}};}]}
{\end{tcolorbox}}

\usepackage{accsupp}
\newcommand{\altpdftext}[2]{%
 \BeginAccSupp{method=escape,ActualText=#2}%
  #1%
 \EndAccSupp{}}

\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=7000
\hbadness=7000

\def\MyLaTeX{{\rm L\kern-.04em\lower-.2ex\hbox{\footnotesize A}\kern-.07em%
T\kern-.12em\lower.2ex\hbox{\small E}\kern-.05emX}}

\usepackage{fancyhdr}
% \usepackage{showframe}

\pagestyle{fancy}
\fancyhf{}

\usepackage{letltxmacro,xparse}

% \usepackage{soul}
% \setul{0.35ex}{0.4pt}
% \setulcolor{headingsrule}
%
% I don't use the soul package because for some reason it doesn't work
% with my fonts and xcolor, the whole configuration is not very happy
% Also, I read somewhere that soul is "fragile".

\usepackage[normalem]{ulem}
\newcommand\linkuline{\bgroup\markoverwith
{\textcolor{headingsrule}{\rule[-0.35ex]{2pt}{0.4pt}}}\ULon}

\LetLtxMacro\oldhref\href
\RenewDocumentCommand{\href}{o m m}{%
  \IfValueTF{#1}
    {\oldhref[#1]{#2}{\linkuline{#3}}}
    {\oldhref{#2}{\linkuline{#3}}}%
}

\usepackage{ifthen}
\newcommand{\myage}[3]{
  \newcounter{myage}
  \setcounter{myage}{\the\year}
  \addtocounter{myage}{-#1}
  \ifthenelse{\the\month<#2}{\addtocounter{myage}{-1}}{}
  \ifthenelse{\the\month=#2}{
    \ifthenelse{\the\day < #3}{\addtocounter{myage}{-1}}{}
  }{}
  \themyage
}

\newenvironment{coursework}{%
\vspace{-0.6\topsep}\small\renewcommand\labelitemi{--}
\begin{itemize}[leftmargin=1.8em]
  \setlength
  \itemsep{0.08em}
  \parskip0pt
  \parsep0pt
}
{\normalsize\end{itemize}}
