%%%%%%%%%%%%%%%%%%%%%%%%%% INFORMATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project document template for Mälardalen University                          %
% Layout design: Bo Tonnquist, Baseline Management AB, 2018                    %
% Class creator: Emil Persson (epn17006@student.mdh.se)                        %
% Version:       1.1 (2021/08/25)                                              %
% Licence: CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/)            %  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\newcommand{\classname}{projectdoc}
\ProvidesClass{\classname}[2020/03/15 projectdoc]
\LoadClass[a4paper, notitlepage]{article}

\RequirePackage{graphicx}
\graphicspath{{./images/}}
\RequirePackage{mathtools}
\RequirePackage{fancyhdr}
\RequirePackage{enumerate}
\RequirePackage[margin=15mm]{geometry}
\RequirePackage[titletoc, title]{appendix}
\RequirePackage{url}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{xcolor}
\RequirePackage{tabularx}
\RequirePackage{ifthen}
\RequirePackage{epstopdf}
% Swedish language package 
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[swedish,british]{babel}

\RequirePackage{mdframed}

\RequirePackage[pdfusetitle, allcolors=black, hidelinks, pdftex]{hyperref}
\usepackage[compress, numbers]{natbib}
\RequirePackage{csquotes}
\RequirePackage{scrhack} % Loads packages fixes
\RequirePackage{etoolbox}
\RequirePackage{lipsum}
\RequirePackage{titlesec}
\RequirePackage{authoraftertitle}


\titleformat*{\section}{\large\bfseries}

\titleformat{\subsection}{\vspace{-3mm}\large\bfseries}{}{0em}%
{\normalsize\bfseries\thesection.\arabic{subsection}\quad}[{\titlerule[0.4pt]}]

\titleformat{\subsubsection}{\vspace{-3mm}\large\bfseries}{}{0em}%
{\normalsize\bfseries\thesection.\arabic{subsection}.\arabic{subsubsection}\quad}[{\titlerule[0.4pt]}]

\makeatletter

\renewcommand{\@maketitle}[1][]{%
\IfFileExists{images/logo.eps}{
    \begin{flushleft}
            \begin{figure}[H]\includegraphics[width=40mm]{images/logo.eps}
    		\end{figure}
            \vspace{-12mm}
     \end{flushleft}
            }{}
\begin{center}%
    {\Huge \textbf \@title \par}%
\end{center}%

}
\makeatother

\NewDocumentCommand{\projectname}{m}{\newcommand{\theprojectname}{#1}}
\NewDocumentCommand{\clientname}{m}{\newcommand{\theclientname}{#1}}
\NewDocumentCommand{\managername}{m}{\newcommand{\themanagername}{#1}}
\NewDocumentCommand{\typeofdocument}{m}{\newcommand{\thetypeofdocument}{#1}}
\NewDocumentCommand{\helper}{m}{\textit{{\color{blue}\small#1}}}

{\renewcommand{\arraystretch}{1.5}%
\NewDocumentCommand{\infotable} {  }{%
\begin{table}[H]
    \large
    % \caption*{\textbf{\Large{#1}\vspace{-3mm}}}
    \begin{tabularx}{\columnwidth}{|X|X|X|}
        \hline
        Project name    &   Client / Sponsor   &  Project manager \\ \hline
        \ifdef{\theprojectname}{\theprojectname}{} & \ifdef{\theclientname}{\theclientname}{}  & \ifdef{\themanagername}{\themanagername}{} \\ \hline
    \end{tabularx}
\end{table}
}

% Page style
\pagestyle{fancy}
\marginparsep = 0pt
\newcommand{\fancyFoot}[2]{
\thispagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[L,RO]{\slshape \rightmark}
\fancyfoot[L]{#1}
\fancyfoot[R]{#2}
\renewcommand{\footrulewidth}{0.4pt}

}
\NewDocumentCommand{\secauthor}{m}{%
  {\parindent0pt\vspace{-12pt}%
  \color{gray}\itshape\scriptsize{Author: #1}%
  \par\nobreak\vspace*{0pt}\noindent}
}
\NewDocumentCommand{\subauthor}{m}{%
  {\parindent0pt\vspace{-4pt}%
  \color{gray}\itshape\scriptsize{Author: #1}%
  \par\nobreak\vspace*{0pt}\noindent}
}
\NewDocumentCommand{\subsubauthor}{m}{%
  {\parindent0pt\vspace{-8pt}%
  \color{gray}\itshape\scriptsize{Author: #1}%
  \par\nobreak\vspace*{0pt}\noindent}
}
\RequirePackage[british,style=iso]{datetime2}
