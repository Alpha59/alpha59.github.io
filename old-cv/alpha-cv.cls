%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%        STANDARD     %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{alpha-cv}[2015/4/26 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


\usepackage{fancyhdr}
\usepackage{graphicx}
\graphicspath{ {images/} }




%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{4D4D4D}%{C2E15F}
\definecolor{orange}{HTML}{4D4D4D}%{FDA333}
\definecolor{purple}{HTML}{4D4D4D}%{D3A4F9}
\definecolor{red}{HTML}{4D4D4D}%{FB4485}
\definecolor{blue}{HTML}{4D4D4D}%{6CE0F1}
\definecolor{company}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
%\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
%\RequirePackage[math-style=TeX]{unicode-math}
\RequirePackage{unicode-math}

\newfontfamily\bodyfont
[BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf]
{texgyreheros-regular.otf}
\newfontfamily\thinfont[]{Lato-Light.ttf}
\newfontfamily\headingfont[]{texgyreheros-bold.otf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf
]
{texgyreheros-regular.otf}

\setmathfont{texgyreheros-regular.otf}
%%%

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
% The Color Thingy
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \vspace{.25cm}
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \hspace{5cm}{\@sectioncolor #1}%
  }
  \par\vspace{\parskip}
}

% Usage: \cvsection{<section-title>}
\newcommand{\sectionpost}[1]{
  \par\addvspace{1.5ex}
  \phantomsection{}
  \sectionstyle{#1}
  \color{gray}\vhrulefill{0.9pt}
  \par\nobreak\addvspace{1ex}
}

\renewcommand{\sectionpost}[1]{
  \vspace{.25cm}
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \hspace{.75cm}{\@sectioncolor #1}%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\headingfont\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

\RequirePackage[left=.75cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}

\renewcommand{\headrulewidth}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%        STANDARD     %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%        Begin Resume    %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%
%
% Header Section.
% done
%
\newcommand{\header}[4]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2.5cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{35pt}{0pt}\color{header}%
      {\thinfont #1 #2. }{\bodyfont  #3}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{12pt}{0pt}\color{header}%
      \thinfont #4%
    };
  \end{tikzpicture}
  \vspace{.6cm}
  \vspace{-2\parskip}
}


%
%
% Location & Contact
% done
%
\newcommand{\location}[2]{
      \hspace{1cm}{\textbf{#1} #2
       }
}

\usepackage[mmddyyyy]{datetime}

\newcommand{\contact}[4]{
      \noindent
         \hfill{\textbullet}\hfill{#1}
         \hfill{\textbullet}\hfill{#3}
         \hfill{\textbullet}\hfill{#4}
        \vspace{.75cm}
}

%
%
% Skills
% done
%
\newcommand{\aside}[2]{
     \noindent\hspace{.25cm}{\textbf{ #1:}

        \hspace{.5cm}{
        \parbox{3.5cm}{\raggedleft #2}
        }
        \vspace{.25cm}
        }
     }

\newcommand{\skills}[1]{
      \noindent\hspace{0cm}{\textbf{\\Key Competencies:}
      \vspace{.25cm}
      #1}
    }

%
%
% Education
% done
%
\newcommand{\education}[7]{
    \hfill\parbox[t]{13.5cm}{
        \textbf{#1}, #2 \hfill{#3, #4}

        \hspace{.25cm}{#5}\vspace{0cm}

        \hspace{.25cm}{#6}\vspace{0cm}

        \hspace{.25cm}{#7}\vspace{0cm}
    }
}



%%%%%%%%%%%%%%%%%%%%
%       Jobs       %
%%%%%%%%%%%%%%%%%%%%

\newcommand{\itemlist}[1]{
           {#1} % This needs to have a .25cm buffer
           %{#1}
            }

\newcommand{\itemAlpha}[1]{
                \\\textbullet\hspace{.12cm}#1
                }

\newcommand{\job}[4]{
    \vspace{.12cm}
    \hfill\parbox[t]{14cm}{
      {\fontsize{13pt}{0pt}\\\textbf{#1}}\hfill{#2}\\
        {\fontsize{11pt}{0pt}{\addfontfeature{Color=lightgray} #3}}
        #4
      }
    }

\newcommand{\jobpost}[4]{
    \vspace{.12cm}
    \hfill\parbox[t]{18.25cm}{
      {\fontsize{13pt}{0pt}\\\textbf{#1}}\hfill{#2}\\
        {\fontsize{11pt}{0pt}{\addfontfeature{Color=lightgray} #3}}
        #4
      }
    }

%%%%%%%%%%%%%%%%%%%%
%    Project       %
%%%%%%%%%%%%%%%%%%%%

\newcommand{\project}[4]{\jobpost{#1}{#2}{#3}{#4}}


%%%%%%%%%%%%%%%%%%%%
%    Activity      %
%%%%%%%%%%%%%%%%%%%%

\newcommand{\activity}[3]{
    \vspace{.18cm}
    \hfill\parbox[t]{18.25cm}{
      {\fontsize{11pt}{0pt}\textbf{#1}}\hfill{#3}\\
        \hspace*{.5cm}{#2}
    }
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%


\newcommand{\present}{Present}
\newcommand{\rangeAlpha}[2]{\textbf{#1 - #2}}
\newcommand{\dateAlpha}[2]{\textbf{#1/#2}}
\newcommand{\tab}[1]{\hspace{.05\textwidth}\rlap{#1}}


\renewcommand{\labelitemiii}{\textbullet}
\renewcommand{\labelitemii}{\textbullet}
\renewcommand{\labelitemi}{\textbullet}

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% FOOTER %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\footerW}[1]{
    \fancyfoot{
        \vspace{-5.5cm}{ \includegraphics[scale=.2]{logo}\hfill\hbox{}\\
            \vspace{.5cm}{
            #1
            }
        }
    }
}
\newcommand{\footerWO}[1]{
    \fancyfoot{
        \vspace{-.25cm}{
            #1
        }
    }
}


\newcommand{\coverletter}[5]{
    \hbox{}\vfill


    \hbox{}\hfill\parbox[c]{15cm}{%\raggedright

    To Whom it May Concern,\\

    \tab{ }#1

    \tab{ }#2

    \tab{ }#3

    \tab{ }#4

    \tab{ }#5

    %%\vspace{.5cm}
    Sincerely,\\\\

    John Ailor

    }\hfill\hbox{}
    \vspace{5cm}{}

    \vfill\hbox{}

    \clearpage
}

