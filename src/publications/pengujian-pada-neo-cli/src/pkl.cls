\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{pkl}

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
\RequirePackage{array}

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

\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}
%% section in each chapter
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
    % chapter size
    \large \bfseries #1\par\nobreak
    % space before first paragraph
    \vskip 20\p@
  }}
%% Redefine chapter in TOCs (all pages before chapter 1)
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
  {-3.5ex % distance from first paragraph to section
    \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus.2ex}%
  {\normalfont\normalsize\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
  % {3.25ex \@plus1ex \@minus.2ex}%
  % {-1em}%
  % {\normalfont\normalsize\bfseries}}
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
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
% Define pkl inputs
% ------------------------------------------------------------
% title
\newcommand{\titlepkl}[1]{\gdef\@titlepkl{#1}}
\newcommand{\@titlepkl}{}
% full name
\newcommand{\fullname}[1]{\gdef\@fullname{#1}}
\newcommand{\@fullname}{}
% id number (nim)
\newcommand{\idnum}[1]{\gdef\@idnum{#1}}
\newcommand{\@idnum}{}
% laboratory (keminatan)
\newcommand{\laboratory}[1]{\gdef\@laboratory{#1}}
\newcommand{\@laboratory}{}
% PKL Type (PT/CV)
\newcommand{\pklplacetype}[1]{\gdef\@pklplacetype{#1}}
\newcommand{\@pklplacetype}{}
% PKL Place
\newcommand{\pklplace}[1]{\gdef\@pklplace{#1}}
\newcommand{\@pklplace}{}
% PKL Start (date and moth only)
\newcommand{\pklstartdate}[1]{\gdef\@pklstartdate{#1}}
% PKL Start (date, month, year)
\newcommand{\pklenddate}[1]{\gdef\@pklenddate{#1}}
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
% supervisors
\newcommand{\firstsupervisor}[1]{\gdef\@firstsupervisor{#1}}
\newcommand{\@firstsupervisor}{}
\newcommand{\secondsupervisor}[1]{\gdef\@secondsupervisor{#1}}
\newcommand{\@secondsupervisor}{}
\newcommand{\thirdsupervisor}[1]{\gdef\@thirdsupervisor{#1}}
\newcommand{\@thirdsupervisor}{}
% supervisors nip
\newcommand{\firstsupervisornip}[1]{\gdef\@firstsupervisornip{#1}}
\newcommand{\@firstsupervisornip}{}
\newcommand{\secondsupervisornip}[1]{\gdef\@secondsupervisornip{#1}}
\newcommand{\@secondsupervisornip}{}
\newcommand{\thirdsupervisornip}[1]{\gdef\@thirdsupervisornip{#1}}
\newcommand{\@thirdsupervisornip}{}


% ------------------------------------------------------------
% Define cover in Indonesian
% ------------------------------------------------------------
\def\cover{%
  \thispagestyle{empty}%
  \pagenumbering{roman}
  \setcounter{page}{1}
  \begin{center}
    \begin{singlespace}
      \fontsize{14pt}{16pt}\selectfont \MakeUppercase{\normalfont\bfseries LAPORAN PRAKTIK KERJA LAPANGAN (PKL)}\par\nobreak
      \vspace{0.5cm}
      \fontsize{14pt}{16pt}\selectfont \MakeUppercase{\normalfont\bfseries PERUSAHAAN}\par\nobreak
      \vspace{0.5cm}
      \fontsize{14pt}{16pt}\selectfont \MakeUppercase{\normalfont\bfseries PT. Biznet Gio Nusantara}
      \par\nobreak
      \vspace{1.5cm}
      \MakeUppercase{\normalfont\bfseries \@titlepkl}\\
      \vspace{0.5cm}
      {\small Diajukan untuk memenuhi sebagian persyaratan Kurikulum Sarjana}
      \vskip1.3cm
      \includegraphics[width=0.36\textwidth]{img/logo-ub-new}
      \vskip1.4cm
      {\normalfont
        Disusun oleh:\\
        \vskip1.2cm
        \normalfont \@fullname \hspace{0.7cm} \MakeUppercase{NIM : \@idnum}}\\
      \vfill
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
% Approval Page Dosen
% ------------------------------------------------------------

\def\approvalpage{%
  % \newpage\thispagestyle{empty}%
  \begin{center}
    \MakeUppercase{\normalfont\large\bfseries\expandafter{PENGESAHAN}}\\
    \vspace{0.4cm}
    \begin{doublespace}
      \MakeUppercase{\normalfont LAPORAN PRAKTIK KERJA LAPANGAN (PKL)}\\
      \MakeUppercase{\normalfont PERUSAHAAAN}\\
      \MakeUppercase{\@pklplacetype.\ \@pklplace} \\

      \vspace{0.7cm}
      \MakeUppercase{\normalfont\@titlepkl}\par\nobreak
      \vspace{0.7cm}
      {\normalfont Diajukan untuk memenuhi sebagian persyaratan Kurikulum Sarjana}\\
      {\normalfont Program Studi Teknik Informatika}\\
      {\normalfont Bidang \@laboratory}\\
      \vspace{0.7cm}
      Disusun oleh:\\
      \@fullname\ \hspace{1cm} NIM : \@idnum\\
    \end{doublespace}

    \vspace{0.7cm}

    \begin{singlespace}
      Praktik Kerja Lapangan ini dilaksanakan pada \\
      \@pklstartdate\ sampai dengan \@pklenddate \\
      \vspace{0.19cm}
      Telah diperiksa dan disetujui oleh: \\
      \vspace{0.6cm}

      Dosen Pembimbing PKL \\
      \vspace{2cm}
      \underline{\@firstsupervisor} \\
      NIP: \@firstsupervisornip \\


      \vspace{1cm}
      Mengetahui, \\
      Ketua Jurusan Teknik Informatika \\
      \vspace{2cm}
      \underline{\@secondsupervisor} \\
      NIP: \@secondsupervisornip
    \end{singlespace}

  \end{center}
  % \addcontentsline{toc}{chapter}{Halaman Pengesahan}
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
  \chapter*{ABSTRAK}%
  \addcontentsline{toc}{chapter}{ABSTRAK}
}


%------------------------------------------------------------
% ABSTRAK ENGLSIH
%------------------------------------------------------------
\def\abstracteng{%
  \chapter*{ABSTRACT}%
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
