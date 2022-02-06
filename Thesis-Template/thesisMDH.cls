%%%%%%%%%%%%%%%%%%%%%%%%%% INFORMATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Master thesis template for Mälardalen University                             %
% Layout design: Mälardalen University                                         %
% Class creator: Emil Persson (epn17006@student.mdh.se)                        %
% Version:       1.1 (2022-02-06)                                              %
% Licence: CC BY-NC-SA 4.0 (https://creativecommons.org/licenses/by-nc-sa/4.0/)%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\newcommand{\classname}{thesisMDH}
\ProvidesClass{\classname}[2022-02-06 thesisMDH]
\LoadClass[a4paper,titlepage,conference ,onecolumn]{IEEEtran}

\RequirePackage{graphicx}
\graphicspath{{images/}}
\RequirePackage{mathtools}
\RequirePackage{fancyhdr}
\RequirePackage{enumerate}
\RequirePackage{listings}
\RequirePackage[margin=3cm]{geometry}
\RequirePackage[absolute]{textpos}
\RequirePackage[section]{placeins}
\RequirePackage{url}
\RequirePackage{tabularx}
\RequirePackage{float}
\RequirePackage{xcolor}

% Swedish language package 
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[swedish,british]{babel}
\RequirePackage{titlesec}
\RequirePackage{silence}
\RequirePackage{scrhack} % Loads packages fixes
\WarningFilter{latex}{Unused global option}

\input{titlepage.tex}

\renewcommand\contentsname{Table of Contents}
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}
\newcommand{\circR}{\textsuperscript{\textregistered}}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.1ex}%
                                   {\normalfont\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                      {3.25ex \@plus1ex \@minus .2ex}%
                                      {-1em}%
                                      {\normalfont\normalsize\bfseries}}

\renewcommand\thesection{\arabic{section}.}
\renewcommand\thesubsection{\thesection\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\renewcommand\thesectiondis{\arabic{section}}
\renewcommand\thesubsectiondis{\thesectiondis.\arabic{subsection}}
\renewcommand\thesubsubsectiondis{\thesubsectiondis.\arabic{subsubsection}}

\renewenvironment{abstract}{
  \begin{center}%
  \normalfont\Large\bfseries\abstractname\vspace{0pt}
  \end{center}
  \itshape
}

% Page style
\pagestyle{fancy}
\marginparsep = 0pt
\newcommand{\fancyHeader}[2]{
\thispagestyle{fancy}
\fancyhead[R]{#1}
\fancyhead[L]{#2}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
}

\endinput