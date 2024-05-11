%%%%%%%%%%%%%%%%%%%%%%%%%% INFORMATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Master thesis template for Mälardalen University                             %
% Layout design: Mälardalen University                                         %
% Class and structure designer: Emil Persson (emil.persson@mdu.se)             %
% Version:       1.1 (2023/05/03)                                              %
% Licence: CC BY-NC-SA 4.0 (https://creativecommons.org/licenses/by-nc-sa/4.0/)%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\newcommand{\classname}{thesisMDU}
\ProvidesClass{\classname}[2023/05/03 thesisMDU]
\LoadClass[a4paper, titlepage]{article}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{graphicx}
\graphicspath{{images/}}
\RequirePackage{mathtools}
\RequirePackage{fancyhdr}
\RequirePackage{enumerate}
\RequirePackage{listings}
\RequirePackage[titletoc]{appendix}
\RequirePackage[a4paper,margin=3cm, bottom=1.5cm, includefoot]{geometry}
\RequirePackage[absolute]{textpos}
\RequirePackage[section]{placeins}
\RequirePackage{url}
\RequirePackage{tabularx}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{xcolor}
\RequirePackage[printonlyused]{acronym}
\RequirePackage{times}
\RequirePackage{booktabs}
\RequirePackage{amssymb}
\RequirePackage[pdfusetitle, allcolors=black, hidelinks, pdftex]{hyperref}
\RequirePackage[capitalise]{cleveref}
% Swedish language package 
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[swedish,british]{babel}

% Bibliography
\RequirePackage[numbers]{natbib} 
\RequirePackage{csquotes}

% Define new commands for font sizes
\newcommand{\authorsize}{\Large}
\newcommand{\emailsize}{\small}
\newcommand{\supervisorsize}{\large}
\newcommand{\titlesize}{\Huge}

% Define new command for title page author horizontal spacing
\newlength{\authorwidth}
\setlength{\authorwidth}{0.30\linewidth}

\NewDocumentCommand{\thesisTitle} { o m }{%
 \IfValueTF{#1}{\def\shorttitle{#1}}{\def\shorttitle{#2}}%
 \def\@title{#2}%
 \def\theTitleName{\titlesize{\textbf{\uppercase{#2}}}}%
}

\ExplSyntaxOn
\seq_new:N \l_authors_seq
\keys_define:nn { authors } {
  name .tl_set:N = \l_author_name_tl,
  email .tl_set:N = \l_author_email_tl,
}
\NewDocumentCommand{\addAuthor}{mm}{
  \keys_set:nn { authors } { name = {#1}, email = {#2} }
  \seq_put_right:Nx \l_authors_seq { 
    { \exp_not:V \l_author_name_tl } { \exp_not:V \l_author_email_tl } 
  }
}

\NewDocumentCommand{\printAuthors}{}{
  \begin{center}
  \seq_map_inline:Nn \l_authors_seq { 
    \begin{minipage}[t]{\authorwidth}
        \centering
        \authorsize {\tl_item:nn {##1}{1}} \\
        \emailsize \tl_item:nn {##1}{2}
        \vspace{2em}
    \end{minipage}\hspace{1em}
  }
  \end{center}
}

\ExplSyntaxOff
\ExplSyntaxOn
\seq_new:N \l_supervisors_seq
\keys_define:nn { supervisors } {
  type .tl_set:N = \l_supervisor_type_tl,
  name .tl_set:N = \l_supervisor_name_tl,
  affiliation .tl_set:N = \l_supervisor_affiliation_tl,
}
\NewDocumentCommand{\addSupervisor}{mmm}{
  \keys_set:nn { supervisors } { type = {#1}, name = {#2}, affiliation = {#3} }
  \seq_put_right:Nx \l_supervisors_seq { 
    { \exp_not:V \l_supervisor_type_tl } { \exp_not:V \l_supervisor_name_tl } { \exp_not:V \l_supervisor_affiliation_tl } 
  }
}
\NewDocumentCommand{\printSupervisors}{}{
  \seq_map_inline:Nn \l_supervisors_seq { 
    \supervisorsize { \tl_item:nn {##1}{1}:~\tl_item:nn {##1}{2} } \\ 
    \footnotesize { \tl_item:nn {##1}{3} } \\
    \vspace{0.5em} 
  }
}
\ExplSyntaxOff

\NewDocumentCommand{\subject}{m}{\newcommand{\subjectName}{\Large{#1}}}
\NewDocumentCommand{\university}{m}{\newcommand{\uniName}{\Large{#1}}}
\NewDocumentCommand{\department}{m}{\newcommand{\depName}{\Large{#1}}}
\NewDocumentCommand{\degree}{m}{\newcommand{\degreeName}{\Large{#1}}}

\NewDocumentCommand{\theDate}{m}{\newcommand{\datum}{\vspace*{\fill}\large #1}}
\newcommand{\warning}[1]{\centering{\textcolor{red}{\large{\textbf{\uppercase{#1\\}}}}}}
\newcommand{\alert}[1]{\textcolor{red}{\textit{\scriptsize\textbf{\uppercase{#1}}}}}

\newcommand{\titlePage}{
    \begin{titlepage}
        \begin{center}
            \IfFileExists{images/MDUlogo.eps}{
            \begin{flushleft}
              \vspace*{-4em}
            \begin{figure}[H]\includegraphics[width=40mm]{images/MDUlogo.eps}
    		\end{figure}
            \end{flushleft}
            }{
    		\begin{flushleft}
    		\warning{MDHlogo \\ missing}
    		\end{flushleft}
    		}
            \vspace*{-3em}
            \ifdef{\uniName}{\uniName\\}{\warning{Missing university name}}
            \ifdef{\depName}{\depName\\}{\warning{Missing department name}} 
            
            \noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}} \\
            \vspace*{1em}
            \ifdef{\subjectName}{\subjectName}{\warning{Missing course name}} \\
            \vspace{3em}
    		\ifdef{\theTitleName}{\theTitleName}{\warning{Missing title}} \\
    		\vspace{3em}
        \printAuthors
            \begin{flushleft}
              \vfill
              \printSupervisors
            \end{flushleft}
            \vspace*{\fill}\large \today
        \end{center}
    \end{titlepage}
}

% Set font
\renewcommand\contentsname{Table of Contents}

\newcommand{\circR}{\textsuperscript{\textregistered}}
% set the style for the section and subsection headers
\renewcommand{\thesection}{\thepart \arabic{section}}
\renewcommand{\thesubsection}{\thepart \arabic{section}.\arabic{subsection}}

\makeatletter

\newcommand\frontmatter{%
    \cleardoublepage
  %\@mainmatterfalse
  \pagenumbering{roman}}

\newcommand\mainmatter{%
    \cleardoublepage
 % \@mainmattertrue
  \pagenumbering{arabic}}

\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
 % \@mainmatterfalse
  }

\makeatother

\renewenvironment{abstract}{
  \begin{center}%
    \bfseries\itshape\abstractname\vspace{-.5em}\vspace{0pt}
  \end{center}
  \itshape\bfseries
}{
}

% \RequirePackage{lastpage}
% Page style
\pagestyle{fancy}
\fancyhf{}

\newcommand{\fancyHeader}[2]{
\thispagestyle{fancy}
\fancyhead[R]{#1}
\fancyhead[L]{#2}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\setlength{\headheight}{13pt}
\renewcommand{\footruleskip}{10pt} % Space between hline and page number
\renewcommand{\footrulewidth}{0.4pt} % Adjust this for thicker or thinner line, as desired
}


\captionsetup[figure]{
  format=plain, 
  % labelsep=period,
  font={footnotesize},
  labelfont={bf}, % Bold label
  textfont={it}   % Italic caption
}

\addtolength{\topmargin}{-11pt}

% Make acronym list dotted
\makeatletter
\expandafter\patchcmd\csname AC@\AC@prefix{}@acro\endcsname
 {#1]{#3}}
 {#1]\dotfill\ {#3}}
 {}{}
\expandafter\patchcmd\csname AC@\AC@prefix{}@acro\endcsname
 {#1]{#3}}
 {#1]\dotfill\ {#3}}
 {}{}
\makeatother

\endinput
