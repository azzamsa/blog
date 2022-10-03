\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{skripsi}

% ------------------------------------------------------------
% Load some sensible package
% ------------------------------------------------------------

% \RequirePackage can used before \documentclass. \usepackage is not.
\RequirePackage[english,bahasa]{babel}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx,latexsym}

\setlength{\paperwidth}{210mm}
\setlength{\paperheight}{297mm}

% ------------------------------------------------------------
% User options
% ------------------------------------------------------------
\newif\if@singlesp
\newif\if@doublesp
\DeclareOption{satuspasi}{\@singlesptrue\@doublespfalse}
\DeclareOption{duaspasi}{\@singlespfalse\@doublesptrue}
\newif\if@onehalfsp
\@onehalfspfalse
\DeclareOption{satusetengahspasi}{\@onehalfsptrue}

%% ------------------------------------------------------------
%% language options
%% ------------------------------------------------------------
\newif\if@langindo
\newif\if@langeng
\DeclareOption{indonesia}{\@langindotrue\@langengfalse}
\DeclareOption{inggris}{\@langindofalse\@langengtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

%% ------------------------------------------------------------
%% Fill your document value here
%% ------------------------------------------------------------
\ExecuteOptions{satusetengahspasi,indonesia}
\ProcessOptions
\LoadClass[a4paper,12pt]{report} % paper size

% ------------------------------------------------------------
% Page layout
% ------------------------------------------------------------
\RequirePackage[top=3cm,bottom=3cm,left=4cm,right=3cm]{geometry}

%% indent paragraph
\setlength{\parindent}{3em} %Indent approx 6 character


% ------------------------------------------------------------
% Redefine chapter and sections
% ------------------------------------------------------------

%% Redefine TOC
%% Hide number from chaper
\newcommand{\mychapter}[2]{
    \setcounter{chapter}{#1}
    \setcounter{section}{0}
    \chapter*{#2}
    \addcontentsline{toc}{chapter}{#2}
  }

\setcounter{tocdepth}{5}
\setcounter{secnumdepth}{5}
%% section depth in each chapter
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
%% subsection in each chapter
\renewcommand\thesubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}

%% Redefine chapter e.g chapter 1
\renewcommand{\@makechapterhead}[1]{%
  { % put chapter at center
    \parindent \z@ \centering \normalfont
    \interlinepenalty\@M
    % chapter size
    \large \bfseries #1\par\nobreak
    % space before first paragraph
    \vskip 20\p@
  }}

%% Redefine chapter in TOCs (all pages before chapter 1)
\renewcommand{\@makeschapterhead}[1]{%
  {
    \parindent \z@ \centering \normalfont
    \interlinepenalty\@M
    % chapter size (judul bab)
    \Large \bfseries #1\par\nobreak
    % space before first paragraph
    \vskip 20\p@
  }}
%% Redefine chapter in TOCs (all pages before chapter 1)
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
  {-3.5ex % distance from first paragraph to section
    \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus.2ex}%
  % subbab 1
  {\normalfont\large\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  % subbab 2
  {\normalfont\large\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
  % {3.25ex \@plus1ex \@minus.2ex}%
  % {-1em}%
  % {\normalfont\normalsize\bfseries}}
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  % subbab 3
  {\normalfont\normalsize\bfseries}}
\renewcommand{\paragraph}{\subparagraph}

\@addtoreset {equation}{chapter}
\renewcommand\theequation
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@equation}
\renewcommand \thefigure
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@figure}
\renewcommand \thetable
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@table}

% ------------------------------------------------------------
% Redefine caption names
% ------------------------------------------------------------
\def\captionsbahasa{%
  \def\prefacename{KATA PENGANTAR}%
  \def\contentsname{DAFTAR ISI}%
  \def\listtablename{DAFTAR TABEL}%
  \def\listfigurename{DAFTAR GAMBAR}%
  \def\listappendixname{DAFTAR LAMPIRAN}%
  \def\partname{BAGIAN}%
  \def\chaptername{BAB}%
  \def\appendixname{LAMPIRAN}%
  \def\refname{DAFTAR PUSTAKA}%
  \def\bibname{DAFTAR PUSTAKA}%
  \def\indexname{Indek}%
  \def\figurename{Gambar}%
  \def\tablename{Tabel}%
  \def\pagename{Halaman}%
}

% English
\def\captionsenglish{%
  \def\prefacename{PREFACE}%
  \def\contentsname{CONTENTS}%
  \def\listfigurename{LIST OF FIGURES}%
  \def\listtablename{LIST OF TABLES}%
  \def\listappendixname{LIST OF APPENDICES}%
  \def\partname{PART}%
  \def\chaptername{CHAPTER}%
  \def\appendixname{APPENDIX}%
  \def\refname{REFERENCES}%
  \def\bibname{REFERENCES}%
  \def\indexname{Index}%
  \def\figurename{Figure}%
  \def\tablename{Table}%
  \def\pagename{Page}%
}

% ------------------------------------------------------------
% Define skripsi inputs
% ------------------------------------------------------------
\newcommand{\titleskripsi}[1]{\gdef\@titleskripsi{#1}}
\newcommand{\@titleskripsi}{}
\newcommand{\fullname}[1]{\gdef\@fullname{#1}}
\newcommand{\@fullname}{}
\newcommand{\idnum}[1]{\gdef\@idnum{#1}}
\newcommand{\@idnum}{}
\newcommand{\examdate}[1]{\gdef\@examdate{#1}}
\newcommand{\approvaldate}[1]{\gdef\@approvaldate{#1}}
\newcommand{\@examdate}{\number\day~\ifcase\month\or
  Januari\or Pebruari\or Maret\or April\or Mei\or Juni\or
  Juli\or Agustus\or September\or Oktober\or Nopember\or Desember\fi
  \space \number\year}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\@degree}{}
\newcommand{\yearsubmit}[1]{\gdef\@yearsubmit{#1}}
\newcommand{\@yearsubmit}{}
\newcommand{\program}[1]{\gdef\@program{#1}}
\newcommand{\@program}{}
\newcommand{\headprogram}[1]{\gdef\@headprogram{#1}}
\newcommand{\@headprogram}{}
\newcommand{\dept}[1]{\gdef\@dept{#1}}
\newcommand{\@dept}{}
\newcommand{\faculty}[1]{\gdef\@faculty{#1}}
\newcommand{\@faculty}{}
\newcommand{\university}[1]{\gdef\@university{#1}}
\newcommand{\@university}{}
\newcommand{\city}[1]{\gdef\@city{#1}}
\newcommand{\@city}{}
\newcommand{\firstsupervisor}[1]{\gdef\@firstsupervisor{#1}}
\newcommand{\@firstsupervisor}{}
\newcommand{\secondsupervisor}[1]{\gdef\@secondsupervisor{#1}}
\newcommand{\@secondsupervisor}{}
\newcommand{\firstsupervisornip}[1]{\gdef\@firstsupervisornip{#1}}
\newcommand{\@firstsupervisornip}{}
\newcommand{\secondsupervisornip}[1]{\gdef\@secondsupervisornip{#1}}
\newcommand{\@secondsupervisornip}{}


% ------------------------------------------------------------
% Define cover in Indonesian
% ------------------------------------------------------------
\def\cover{%
  \thispagestyle{empty}%
  \pagenumbering{roman}
  \setcounter{page}{1}
  \begin{center}
    \begin{singlespace}
     %\vspace*{0cm}
      \fontsize{14pt}{16pt}\selectfont \MakeUppercase{
        \normalfont\bfseries\@titleskripsi}\par\nobreak
      \vspace{1.7cm}
      \MakeUppercase{\normalfont\bfseries SKRIPSI}\\
      \vspace{0.9cm}
      {\normalfont Untuk memenuhi sebagian persyaratan}\\
      {\normalfont memperoleh gelar Sarjana Komputer}\\
      \vspace{1.5cm}
      {\normalfont
        Disusun oleh:\\
        \MakeUppercase{\normalfont \@fullname}\\
        \MakeUppercase{\normalfont  NIM: \@idnum}}\\
      \vfill
      \vspace{-3.7cm}
      \includegraphics[width=0.36\textwidth]{img/logo-ub}
      \vfill
      \vspace{-3.9cm}
      {\normalfont
        \MakeUppercase{\normalfont PROGRAM STUDI \@dept}\\
        \MakeUppercase{\normalfont JURUSAN \@dept}\\
        \MakeUppercase{\normalfont\@faculty} \\
        \MakeUppercase{\normalfont\@university}\\
        \MakeUppercase{\normalfont\@city}\\
        {\normalfont\@yearsubmit}}\\
    \end{singlespace}
  \end{center}
}

% ------------------------------------------------------------
% Supervisors Signature
% ------------------------------------------------------------

\def\ssignature#1#2#3{\vbox{\hsize=7.5cm
    \hbox to \hsize{
      \strut\hfil #1 \hfil}
    \vspace{2.5cm}
    \hbox to \hsize{
      \strut\hfil \underline{#2} \hfil}
    \hbox to \hsize{
      \strut\hfil #3 \hfil}}}

% ------------------------------------------------------------
% Approval Page
% ------------------------------------------------------------

\def\approvalpage{%
  % \newpage\thispagestyle{empty}%
  \begin{center}
    \MakeUppercase{\normalfont\large\bfseries\expandafter{PENGESAHAN}}\\
    \vspace{0.4cm}
    \begin{singlespace}
      \vspace{0.1cm}
      \MakeUppercase{\normalfont\@titleskripsi}\par\nobreak
      \vspace{0.7cm}
      {\normalfont SKRIPSI}\\
      \vspace{0.7cm}
      {\normalfont Diajukan untuk memenuhi sebagian persyaratan}\\
      {\normalfont memperoleh gelar Sarjana Komputer}\\
      \vspace{0.7cm}
      Disusun Oleh:\\
      \@fullname\ \\
      NIM : \@idnum\\
    \end{singlespace}

    \vspace{0.7cm}

    \begin{singlespace}
      Skripsi ini telah diuji dan dinyatakan lulus pada: \\
      2 Juli 2019 \\
      Telah diperiksa dan disetujui oleh: \\
      \vspace{1cm}
      \hbox to \hsize{
        \ssignature{Dosen Pembimbing I}{\@firstsupervisor}{\@firstsupervisornip}\hfil
        \ssignature{Dosen Pembimbing II}{\@secondsupervisor}{\@secondsupervisornip}}

      \vspace{2cm}
      Mengetahui \\
      Ketua Jurusan Teknik Informatika \\
      \vspace{2.5cm}
      \underline{Tri Astoto Kurniawan, S.T, M.T, Ph.D} \\
      NIP: 19710518 200312 1 001
    \end{singlespace}

  \end{center}
  \addcontentsline{toc}{chapter}{PENGESAHAN}
}

% ------------------------------------------------------------
% Pre-Approval Page
% ------------------------------------------------------------

\def\preapprovalpage{%
  % \newpage\thispagestyle{empty}%
  \begin{center}
    \MakeUppercase{\normalfont\large\bfseries\expandafter{PERSETUJUAN}}\\
    \vspace{0.4cm}
    \begin{singlespace}
      \vspace{0.1cm}
      \MakeUppercase{\normalfont\@titleskripsi}\par\nobreak
      \vspace{0.7cm}
      {\normalfont SKRIPSI}\\
      \vspace{0.7cm}
      {\normalfont Diajukan untuk memenuhi sebagian persyaratan}\\
      {\normalfont memperoleh gelar Sarjana Komputer}\\
      \vspace{0.7cm}
      Disusun oleh:\\
      \@fullname\ \\
      NIM : \@idnum\\
    \end{singlespace}

    \vspace{0.7cm}

    \begin{singlespace}
      Telah diperiksa dan disetujui oleh: \\
      \vspace{2cm}
      \hbox to \hsize{
        \ssignature{Dosen Pembimbing I}{\@firstsupervisor}{\@firstsupervisornip}\hfil
        \ssignature{Dosen Pembimbing II}{\@secondsupervisor}{\@secondsupervisornip}}

    \end{singlespace}

  \end{center}
  \addcontentsline{toc}{chapter}{PERSETUJUAN}
}


%------------------------------------------------------------
%Orisinalitas
%------------------------------------------------------------
\def\orisinalitas{%
  \chapter*{PERNYATAAN ORISINALITAS}%
\addcontentsline{toc}{chapter}{PERNYATAAN ORISINALITAS}
}

%------------------------------------------------------------
%Preface
%------------------------------------------------------------
\def\preface{%
  \chapter*{\prefacename}%
\addcontentsline{toc}{chapter}{\prefacename}
}

%------------------------------------------------------------
% ABSTRAK INDONESIA
%------------------------------------------------------------
\def\abstractind{%
  \begin{singlespace}
    \chapter*{ABSTRAK}%
    \noindent
    \textbf{\@fullname, \@titleskripsi}\\

    \noindent
    \textbf{Pembimbing: \@firstsupervisor\ dan \@secondsupervisor}\\
  \end{singlespace}
  \addcontentsline{toc}{chapter}{ABSTRAK}
}


%------------------------------------------------------------
% ABSTRAK ENGLSIH
%------------------------------------------------------------
\def\abstracteng{%
  \begin{singlespace}
    \chapter*{ABSTRACT}%
    \noindent
    \textbf{\@fullname, \@titleskripsi}\\

    \noindent
    \textbf{Supervisors: \@firstsupervisor\ and \@secondsupervisor}\\
  \end{singlespace}
  \addcontentsline{toc}{chapter}{ABSTRACT}
}


% ------------------------------------------------------------
% Detect spacing choice
% ------------------------------------------------------------
\AtBeginDocument{%
  \if@doublesp%
  \doublespacing%
  \else\if@singlesp%
  \singlespacing%
  \else
  \onehalfspacing%
  \fi%
  \fi
}

% ------------------------------------------------------------
% Detect language choice
% ------------------------------------------------------------
\AtBeginDocument{%
  \if@langindo%
  \selectlanguage{bahasa}%
  \else
  \selectlanguage{english}%
  \fi
}

\endinput
