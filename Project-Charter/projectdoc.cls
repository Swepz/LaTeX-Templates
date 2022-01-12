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

% Swedish language package 
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[swedish,british]{babel}

\RequirePackage{mdframed}

\RequirePackage[pdfusetitle, allcolors=black, hidelinks, pdftex]{hyperref}
\RequirePackage{csquotes}
\RequirePackage{scrhack} % Loads packages fixes
\RequirePackage{etoolbox}
\RequirePackage{lipsum}
\RequirePackage{titlesec}
\RequirePackage{authoraftertitle}


\titleformat*{\section}{\normalsize\bfseries}

\titleformat{\subsection}{\vspace{-3mm}\large\bfseries}{}{0em}%
{\small\bfseries\thesection.\arabic{subsection}\quad}[{\titlerule[0.4pt]}]
\titleformat{\subsubsection}{\vspace{-3mm}\large\bfseries}{}{0em}%
{\small\bfseries\thesection.\arabic{subsection}.\arabic{subsubsection}\quad}[{\titlerule[0.4pt]}]

\newtoggle{WithinFramedSection}%
\togglefalse{WithinFramedSection}%

\let\OldSection\section%
\def\section{\EndFramedIfNeeded\OldSection}%
\newcommand*{\EndFramedIfNeeded}{%
    \iftoggle{WithinFramedSection}{%
        \global\togglefalse{WithinFramedSection}%
        \end{mdframed}\vspace{-6mm}% End previous framed section
    }{}%
}%

\renewcommand*{\section}[1]{%
    \EndFramedIfNeeded%
    \global\toggletrue{WithinFramedSection}%
    \begin{mdframed}\vspace{-6mm}\OldSection{#1}%
}%
\AtEndDocument{\EndFramedIfNeeded}%

\makeatletter

\renewcommand{\@maketitle}[1][]{%
\IfFileExists{logo.eps}{
    \begin{flushleft}
            \begin{figure}[H]\includegraphics[width=30mm]{logo.eps}
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
\NewDocumentCommand{\timeframe}{m m}{\newcommand{\thetimeframe}{%
\begin{table}[H]
    \begin{tabularx}{\columnwidth}{|X | X | X|}
        \hline
        Project timeframe & Start: #1 & Finish: #2 \\ 
        \hline 
    \end{tabularx}
\end{table}
}}
\NewDocumentCommand{\priority}{m m m}{\newcommand{\thepriority}{%
\begin{table}[H]
    \begin{tabularx}{\columnwidth}{|X|X|X|X|}
        \hline
        Execution priority & 
        \% Time: #1 & %
        \% Resources/Cost: #2 & %
        \% Quality: #3 \\ 
        \hline 
    \end{tabularx}
\end{table}
}}


\NewDocumentCommand{\budget}{m}{\newcommand{\thebudget}{%
\begin{table}[H]
    \begin{tabularx}{\columnwidth}{|X|X|}
        \hline
         Budget: #1 \\ 
        \hline 
    \end{tabularx}
\end{table}}}
\NewDocumentCommand{\signature}{m m}{\newcommand{\thesignature}{%
\begin{table}[H]
    \begin{tabularx}{\columnwidth}{|X|X|}
        \hline
         Signature: #1 \\ Date: #2 \\ 
        \hline 
    \end{tabularx}
\end{table}}}
\NewDocumentCommand{\helper}{m}{\textit{{\color{blue}\small#1}}}

{\renewcommand{\arraystretch}{1.5}%
\NewDocumentCommand{\infotable} {  }{%
    \ifdef{\thetimeframe}{\thetimeframe\vspace{-9mm}}{}
    \ifdef{\thepriority}{\thepriority\vspace{-9mm}}{}
    \ifdef{\thebudget}{\thebudget\vspace{-9mm}}{} 
    \ifdef{\thesignature}{\thesignature}{} 
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
\RequirePackage[british,style=iso]{datetime2}
