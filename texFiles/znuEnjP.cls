% !TeX root = ../proposal.tex
% E-mail: bmirzakhani.en@gmail.com
% v1.4a
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{znuEnjP}[2022/09/19 v1.4a ZNU Engineering Proposal]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifznu@mscThesis
\DeclareOption{msc}{\znu@mscThesistrue}
\newif\ifznu@thirdReferee
\newif\ifznu@print
\DeclareOption{print}{\znu@printtrue}
\newif\ifznu@digitFa
\DeclareOption{digitFa}{\znu@digitFatrue}
\newif\ifznu@useRefNum
\DeclareOption{refNumber}{\znu@useRefNumtrue}
\ProcessOptions\relax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% تنظیم حاشیه:
\RequirePackage{geometry}
\geometry{left=2cm, right=2cm, bottom=3cm, top=2cm}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% اصلاح سایز فونت cm و lm:
\RequirePackage{fix-cm}
\RequirePackage{lmodern}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% کاهش ارتفاع سطر و فاصلۀ ستونی‌های جدول‌ها:
\renewcommand{\arraystretch}{0.9}
\addtolength{\tabcolsep}{-2pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% کادر:
\RequirePackage{xcolor}
\RequirePackage{mdframed}
\newmdenv[linewidth=1pt,%
	innertopmargin=0pt,%
	innerbottommargin=0pt,%
	startinnercode={\setstretch{.9}},%
]{RefBox}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% تنظیم اندازهٔ عنوان بخش‌ها:
\RequirePackage{titlesec}
\AfterPreamble{%
	\titleformat{\section}
		{\normalfont\fontsize{13}{15.6}\selectfont\bfseries}{\thesection}{1em}{}
%	\titlespacing*{\section}{0pt}{0.5\baselineskip}{0\baselineskip}
	\titleformat{\subsection}
		{\normalfont\normalsize\bfseries}{\thesubsection}{1em}{}
%		\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0\baselineskip}
	\titleformat{\subsubsection}
		{\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{}
%	\titlespacing*{\subsubsection}{0pt}{0.5\baselineskip}{0\baselineskip}
	% تبدیل نقطه به خط‌تیره:
	\SepMark{-}
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% تبدیل «آ» به «الف» و «ه» به «ﻫ» در شماره‌گذاری:
	\bidi@patchcmd{\@harfi}{ه}{ﻫ}
		{\typeout{Succeeded in changing `ه` into `ﻫ`}}
		{\typeout{Failed in changing `ه` into `ﻫ`}}
	\bidi@patchcmd{\@harfi}{آ}{الف}
		{\typeout{Succeeded in changing `آ` into `الف`}}
		{\typeout{Failed in changing `آ` into `الف`}}
	\bidi@patchcmd{\@abjad}{ه}{ﻫ}
		{\typeout{Succeeded in changing `ه` into `ﻫ`}}
		{\typeout{Failed in changing `ه` into `ﻫ`}}
	\bidi@patchcmd{\@abjad}{آ}{الف}
		{\typeout{Succeeded in changing `آ` into `الف`}}
		{\typeout{Failed in changing `آ` into `الف`}}
	\bidi@patchcmd{\@Abjad}{ه}{ﻫ}
		{\typeout{Succeeded in changing `ه` into `ﻫ`}}
		{\typeout{Failed in changing `ه` into `ﻫ`}}
	\bidi@patchcmd{\@Abjad}{آ}{الف}
		{\typeout{Succeeded in changing `آ` into `الف`}}
		{\typeout{Failed in changing `آ` into `الف`}}
	\bidi@patchcmd{\@alph}{ه}{ﻫ}
		{\typeout{Succeeded in changing `ه` into `ﻫ`}}
		{\typeout{Failed in changing `ه` into `ﻫ`}}
	\bidi@patchcmd{\@alph}{آ}{الف}
		{\typeout{Succeeded in changing `آ` into `الف`}}
		{\typeout{Failed in changing `آ` into `الف`}}
	\bidi@patchcmd{\abjadSingle}{ه}{ﻫ}
		{\typeout{Succeeded in changing `ه` into `ﻫ`}}
		{\typeout{Failed in changing `ه` into `ﻫ`}}
	\PersianAlphs
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% تغییر شمارندۀ دستور section و subsection:
	\renewcommand{\thesection}{\Abjad{section}\@SepMark}
	\renewcommand{\thesubsection}{\Abjad{section}\@SepMark
		\arabic{subsection}}
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% حذف عنوان مراجع و کم‌کردن فاصلۀ بعد از عنوان:
	\renewcommand{\refname}{\vspace*{-2\baselineskip}}
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% تیک در مربع:
	\newcommand{\checked}{\makebox[0pt][r]{$ \square $}%
		\raisebox{.15ex}{\hspace{0.1em}$ \checkmark $}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% قراردادن پاورقی‌ها در انتهای صفحه:
\AfterPreamble{%
	\pretocmd{\footnoterule}{\vfill}{}{}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% مشخصات جدول کارشناس تحصیلات تکمیلی:
\newcommand*{\sabt}[1]{\newcommand*{\@sabt}{$ #1 $}}
\newcommand*{\rahgiri}[1]{\newcommand*{\@rahgiri}{$ #1 $}}
\newcommand*{\tasvib}[1]{\newcommand*{\@tasvib}{$ #1 $}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% مشخصات عنوان پایان‌نامه:
\newcommand*{\titleFa}[1]{\newcommand*{\@titleFa}{#1}}
\newcommand*{\titleEn}[1]{\newcommand*{\@titleEn}{#1}}
\newcommand*{\keywordsFa}[1]{\newcommand*{\@keywordsFa}{#1}}
\newcommand*{\keywordsEn}[1]{\newcommand*{\@keywordsEn}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% مشخصات دانشجو:
\newcommand*{\fullName}[1]{\newcommand*{\@fullName}{#1}}
\newcommand*{\yearIn}[1]{\newcommand*{\@yearIn}{\LR{#1}}}
\newcommand*{\studentNumber}[1]{\newcommand*{\@studentNumber}{\LR{#1}}}
\newcommand*{\department}[1]{\newcommand*{\@department}{#1}}
\newcommand*{\major}[1]{\newcommand*{\@major}{#1}}
\newcommand*{\field}[1]{\newcommand*{\@field}{#1}}
\newcommand*{\studentAddress}[1]{\newcommand*{\@studentAddress}{#1}}
\newcommand*{\lpNumber}[1]{\newcommand*{\@lpNumber}{\LR{#1}}}
\newcommand*{\cpNumber}[1]{\newcommand*{\@cpNumber}{\LR{#1}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% مشخصات استاد راهنمای اول:
\newcommand*{\firstSupervisorFullName}[1]{\newcommand*{\@firstSupervisorFullName}{#1}}
\newcommand*{\firstSupervisorOffice}[1]{\newcommand*{\@firstSupervisorOffice}{#1}}
\newcommand*{\firstSupervisorSpecialty}[1]{\newcommand*{\@firstSupervisorSpecialty}{#1}}
\newcommand*{\firstSupervisorDegree}[1]{\newcommand*{\@firstSupervisorDegree}{#1}}
\newcommand*{\firstSupervisorGrade}[1]{\newcommand*{\@firstSupervisorGrade}{#1}}
\newcommand*{\firstSupervisorParticipation}[1]{%
	\newcommand*{\@firstSupervisorParticipation}{٪\LR{#1}}}
\newcommand*{\firstSupervisorAddress}[1]{\newcommand*{\@firstSupervisorAddress}{#1}}
\newcommand*{\firstSupervisorPhone}[1]{\newcommand*{\@firstSupervisorPhone}{\LR{#1}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% مشخصات استاد راهنمای دوم:
\newcommand*{\secSupervisorFullName}[1]{\newcommand*{\@secSupervisorFullName}{#1}}
\newcommand*{\secSupervisorOffice}[1]{\newcommand*{\@secSupervisorOffice}{#1}}
\newcommand*{\secSupervisorSpecialty}[1]{\newcommand*{\@secSupervisorSpecialty}{#1}}
\newcommand*{\secSupervisorDegree}[1]{\newcommand*{\@secSupervisorDegree}{#1}}
\newcommand*{\secSupervisorGrade}[1]{\newcommand*{\@secSupervisorGrade}{#1}}
\newcommand*{\secSupervisorParticipation}[1]{%
	\newcommand*{\@secSupervisorParticipation}{٪\LR{#1}}}
\newcommand*{\secSupervisorAddress}[1]{\newcommand*{\@secSupervisorAddress}{#1}}
\newcommand*{\secSupervisorPhone}[1]{\newcommand*{\@secSupervisorPhone}{\LR{#1}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% مشخصات استاد مشاور اول:
\newcommand*{\firstAdvisorFullName}[1]{\newcommand*{\@firstAdvisorFullName}{#1}}
\newcommand*{\firstAdvisorOffice}[1]{\newcommand*{\@firstAdvisorOffice}{#1}}
\newcommand*{\firstAdvisorSpecialty}[1]{\newcommand*{\@firstAdvisorSpecialty}{#1}}
\newcommand*{\firstaAdvisorDegree}[1]{\newcommand*{\@firstaAdvisorDegree}{#1}}
\newcommand*{\firstAdvisorGrade}[1]{\newcommand*{\@firstAdvisorGrade}{#1}}
\newcommand*{\firstAdvisorParticipation}[1]{%
	\newcommand*{\@firstAdvisorParticipation}{٪\LR{#1}}}
\newcommand*{\firstAdvisorAddress}[1]{\newcommand*{\@firstAdvisorAddress}{#1}}
\newcommand*{\firstAdvisorPhone}[1]{\newcommand*{\@firstAdvisorPhone}{\LR{#1}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% مشخصات استاد مشاور دوم:
\newcommand*{\secAdvisorFullName}[1]{\newcommand*{\@secAdvisorFullName}{#1}}
\newcommand*{\secAdvisorOffice}[1]{\newcommand*{\@secAdvisorOffice}{#1}}
\newcommand*{\secAdvisorSpecialty}[1]{\newcommand*{\@secAdvisorSpecialty}{#1}}
\newcommand*{\secAdvisorDegree}[1]{\newcommand*{\@secAdvisorDegree}{#1}}
\newcommand*{\secAdvisorGrade}[1]{\newcommand*{\@secAdvisorGrade}{#1}}
\newcommand*{\secAdvisorParticipation}[1]{%
	\newcommand*{\@secAdvisorParticipation}{٪\LR{#1}}}
\newcommand*{\secAdvisorAddress}[1]{\newcommand*{\@secAdvisorAddress}{#1}}
\newcommand*{\secAdvisorPhone}[1]{\newcommand*{\@secAdvisorPhone}{\LR{#1}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% اطلاعات  نوع پژوهش و اجرا:
\newcommand*{\researchType}[1]{\newcommand*{\@researchType}{#1}}
\newcommand*{\executionType}[1]{\newcommand*{\@executionType}{#1}}
\newcommand*{\courseUnits}[1]{\newcommand*{\@courseUnits}{\LR{#1}}}
\newcommand*{\unitDate}[1]{\newcommand*{\@unitDate}{\LR{#1}}}
\newcommand*{\executionTime}[1]{\newcommand*{\@executionTime}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% اطلاعات هزینه:
\newcommand*{\materials}[1]{\newcommand*{\@materials}{#1}}
\newcommand*{\materialCost}[1]{\newcommand*{\@materialCost}{#1}}
\newcommand*{\personal}[1]{\newcommand*{\@personal}{#1}}
\newcommand*{\personalCost}[1]{\newcommand*{\@personalCost}{#1}}
\newcommand*{\travel}[1]{\newcommand*{\@travel}{#1}}
\newcommand*{\travelCost}[1]{\newcommand*{\@travelCost}{#1}}
\newcommand*{\other}[1]{\newcommand*{\@other}{#1}}
\newcommand*{\otherCost}[1]{\newcommand*{\@otherCost}{#1}}
\newcommand*{\totalCost}[1]{\newcommand*{\@totalCost}{#1}}
\newcommand*{\inOut}[1]{\newcommand*{\@inOut}{#1}}
\newcommand*{\mainTitle}[1]{\newcommand*{\@mainTitle}{#1}}
\newcommand*{\executive}[1]{\newcommand*{\@executive}{#1}}
\newcommand*{\faculty}[1]{\newcommand*{\@faculty}{#1}}
\newcommand*{\approved}[1]{\newcommand*{\@approved}{#1}}
\newcommand*{\finalDate}[1]{\newcommand*{\@finalDate}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% اطلاعات داورها:
\newcommand*{\masterRefereeA}[1]{\newcommand*{\@masterRefereeA}{#1}}
\newcommand*{\masterRefereeB}[1]{\newcommand*{\@masterRefereeB}{#1}}
\newcommand*{\phdRefereeC}[1]{\newcommand*{\@phdRefereeC}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% لوگو و جدول کارشناس تحصیلات تکمیلی:
\newcommand{\logo}{{\small
	\centerline{\includegraphics[width=2.5cm]{znu-logo-fa.pdf}}%
	\par
	\centerline{\large\underline{\textbf{%
				پیشنهادۀ پژوهشی پایان‌نامۀ
			\ifznu@mscThesis کارشناسی‌ارشد\else دکتری\fi
		}}}%
	\par
	\vskip2em%
	\leftline{%
		\begin{minipage}{.56\textwidth}
			 این قسمت توسط کارشناس تحصیلات تکمیلی دانشكده تكمیل
			  می‌­شود. \\
			 \begin{tabular}{|M{.5}|M{.5}|}
			 	\hline
			 	شمارهٔ ثبت:
			 	\@sabt%
			 	 &  کد رهگیری:
			 	 \@rahgiri%
			 	\\\hline
			 	\multicolumn{2}{|r|}{%
			 	تاریخ تصویب:
			 	\@tasvib%
		 		}\\\hline
		 		\multicolumn{2}{|r|}{%
	 			امضا:
		 		}\\\hline
	 			\multicolumn{2}{|M{1}|}{\noindent
	کد رهگیری باید پس از تصویب پیشنهاده در شورای دانشکده از پایگاه
	ثبت اطلاعات پایان‌نامه‌ها و رساله‌های تحصیلات تكمیلی كشور توسط
	دانشجو اخذ و به کارشناس تحصیلات تکمیلی ارائه گردد.
	 				\hfill
	 				\href{https://irandoc.ac.ir/}{\lr{https://www.irandoc.ac.ir}}%
	 			}\\\hline
			 \end{tabular}%
		\end{minipage}%
	}}\vskip15pt%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% جدول عنوان پایان‌نامه:
\newcommand{\thesisInfo}{\begin{center}%
		\begin{tabular}{|M{.4}M{.6}|}
			\cline{1-1}
			\textbf{عنوان پایان‌نامه} & \multicolumn{1}{|c}{} \\\hline
		فارسی:& \\
			\multicolumn{2}{|M{1}|}{\@titleFa}
			 \\\hline
		انگلیسی: & \\
			\multicolumn{2}{|M{1}|}{\latin\@titleEn}
			\\\hline
		واژگان کلیدی فارسی: & \\
			\multicolumn{2}{|M{1}|}{\@keywordsFa}
			\\\hline
		واژگان کلیدی انگلیسی: & \\
			\multicolumn{2}{|M{1}|}{\latin\@keywordsEn}
			\\\hline
		\end{tabular}%
	\end{center}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% جدول مشخصات دانشجو:
\newcommand{\studentInfo}{\begin{center}%
		\begin{tabular}{|M{.4}|M{.28}|M{.32}|}
			\cline{1-1}
			\textbf{مشخصات دانشجو} & \multicolumn{2}{M{.6}}{} \\\hline
			نام و نام‌خانوادگی:
			\@fullName& 
			سال ورود:
			\@yearIn&
			شماره دانشجویی:
			 \@studentNumber%
			\\\hline
			دانشکده:
			\@department& 
			رشته:
			\@major&
			گرایش:
			\@field%
			\\\hline
			آدرس:
			\@studentAddress& 
			تلفن ثابت:
			\@lpNumber&
			همراه:
			\@cpNumber\\\hline
		\end{tabular}%
	\end{center}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% جدول مشخصات استاد راهنما:
\newcommand{\supervisorInfo}{\begin{center}%
		\begin{tabular}{|M{.4}M{.28}|M{.32}|}
			\cline{1-1}
			\ifx\@secSupervisorFullName\undefined
				\textbf{مشخصات استاد راهنما}
			\else
				\textbf{مشخصات استاد راهنمای اول}
			\fi
			& \multicolumn{2}{|M{.6}}{}\\\hline
			نام و نام‌خانوادگی:
			\@firstSupervisorFullName
			& \multicolumn{1}{|M{.28}|}{%
				محل خدمت:
				\@firstSupervisorOffice}&
			تخصص اصلی:
			\@firstSupervisorSpecialty%
			\\\hline
			آخرین مدرک تحصیلی:
			\@firstSupervisorDegree& \multicolumn{1}{|M{.28}|}{%
				رتبۀ دانشگاهی:
				\@firstSupervisorGrade}&
			میزان مشارکت:
			\@firstSupervisorParticipation%
			\\\hline
			\multicolumn{2}{|M{.68}|}{%
				آدرس:
				\@firstSupervisorAddress%
			}&
			تلفن محل کار:
			\@firstSupervisorPhone%
			\\\hline
		\end{tabular}%
	\end{center}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% جدول مشخصات استاد راهنمای دوم:
\newcommand{\secSupervisorInfo}{%
	\ifx\@secSupervisorFullName\undefined\else
	\begin{center}%
		\begin{tabular}{|M{.4}M{.28}|M{.32}|}
			\cline{1-1}
			\textbf{مشخصات استاد راهنمای دوم} & \multicolumn{2}{|M{.6}}{} \\\hline
			نام و نام‌خانوادگی:
			\@secSupervisorFullName& \multicolumn{1}{|M{.28}|}{%
				محل خدمت:
				\@secSupervisorOffice}&
			تخصص اصلی:
			\@secSupervisorSpecialty%
			\\\hline
			آخرین مدرک تحصیلی:
			\@secSupervisorDegree& \multicolumn{1}{|M{.28}|}{%
				رتبۀ دانشگاهی:
				\@secSupervisorGrade}&
			میزان مشارکت:
			\@secSupervisorParticipation%
			\\\hline
			\multicolumn{2}{|M{.68}|}{%
				آدرس:
				\@secSupervisorAddress%
			}&
			تلفن محل کار:
			\@secSupervisorPhone%
			\\\hline
		\end{tabular}%
	\end{center}%
\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% جدول مشخصات استاد مشاور:
\newcommand{\advisorInfo}{\ifx\@firstAdvisorFullName\undefined\else
	\begin{center}%
		\begin{tabular}{|M{.4}M{.28}|M{.32}|}
			\cline{1-1}
			\ifx\@secAdvisorFullName\undefined
				\textbf{مشخصات استاد مشاور}
			\else
				\textbf{مشخصات استاد مشاور اول}
			\fi
			& \multicolumn{2}{|M{.6}}{} \\\hline
			نام و نام‌خانوادگی:
			\@firstAdvisorFullName& \multicolumn{1}{|M{.28}|}{%
				محل خدمت:
				\@firstAdvisorOffice}&
			تخصص اصلی:
			\@firstAdvisorSpecialty%
			\\\hline
			آخرین مدرک تحصیلی:
			\@firstaAdvisorDegree& \multicolumn{1}{|M{.28}|}{%
				رتبۀ دانشگاهی:
				\@firstAdvisorGrade}&
			میزان مشارکت:
			\@firstAdvisorParticipation%
			\\\hline
			\multicolumn{2}{|M{.68}|}{%
				آدرس:
				\@firstAdvisorAddress%
			}&
			تلفن محل کار:
			\@firstAdvisorPhone%
			\\\hline
		\end{tabular}%
	\end{center}\fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% جدول مشخصات استاد مشاور دوم:
\newcommand{\secAdvisorInfo}{\ifx\@secAdvisorFullName\undefined\else
	\begin{center}%
		\begin{tabular}{|M{.4}M{.28}|M{.32}|}
			\cline{1-1}
			\textbf{مشخصات استاد مشاور دوم} & \multicolumn{2}{|M{.6}}{} \\\hline
			نام و نام‌خانوادگی:
			\@secAdvisorFullName& \multicolumn{1}{|M{.28}|}{%
				محل خدمت:
				\@secAdvisorOffice}&
			تخصص اصلی:
			\@secAdvisorSpecialty%
			\\\hline
			آخرین مدرک تحصیلی:
			\@secAdvisorDegree& \multicolumn{1}{|M{.28}|}{%
				رتبۀ دانشگاهی:
				\@secAdvisorGrade}&
			میزان مشارکت:
			\@secAdvisorParticipation%
			\\\hline
			\multicolumn{2}{|M{.68}|}{%
				آدرس:
				\@secAdvisorAddress%
			}&
			تلفن محل کار:
			\@secAdvisorPhone%
			\\\hline
		\end{tabular}%
	\end{center}\fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% جدول نوع پژوهش و اجرا، زمان اخذ و مدت اجرا:
\newcommand{\timeTable}{\begin{center}%
		\begin{tabular}{|*{6}{M{.166667}}|}
			\hline
			\multicolumn{3}{|M{.500001}}{%
				\textbf{نوع پژوهش:}
				\@researchType%
			}&
			\multicolumn{3}{|M{.500001}|}{%
				\textbf{نوع اجرا:}
				\@executionType%
			}%
			\\\hline
			\multicolumn{2}{|M{.333334}|}{%
				\textbf{تعداد واحدهای پایان‌نامه:}
				\@courseUnits%
			}&
			\multicolumn{2}{M{.333334}|}{%
				\textbf{زمان اخذ واحد:}
				\@unitDate%
			}&
			\multicolumn{2}{M{.333334}|}{%
				\textbf{مدت اجرا:}
				\@executionTime%
			}\\\hline
		\end{tabular}%
	\end{center}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% جدول هزینه‌ها:
\newcommand{\costs}{\begin{center}%
		\begin{tabular}{|M{.65}|>{\centering\arraybackslash}M{.15}|}
			\hline
			\multicolumn{1}{|>{\centering}M{.65}|}{\textbf{نوع هزینه}} &
			\textbf{مبلغ (ریال)} \\\hline
			مواد و وسایل
			\@materials& \@materialCost%
			\\\hline
			پرسنلی
			\@personal& \@personalCost%
			\\\hline
			مسافرت
			\@travel& \@travelCost%
			\\\hline
			متفرقه
			\@other& \@otherCost%
			\\\hline
			جمع کل & 
			\@totalCost%
			\\\hline
			\multicolumn{2}{|>{\raggedleft}M{.8}|}{%
				این پیشنهاده بخشی از طرح 
				\@inOut
				است.
				\\
				عنوان اصلی طرح تحقیقاتی مرتبط:
				\@mainTitle%
				\\
				\begin{tabular}{@{}P{.4}|P{.4}@{}}\hline
						نام مجری:
					\@executive%
					&
						دانشکده:
					\@faculty%
					\\
						تاریخ تصویب نهایی:
					\@finalDate%
					&
						بودجه مصوب:
					\@approved%
				\end{tabular}
			}%
			\\\hline
		\end{tabular}%
	\end{center}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% جدول امضای دانشجو، اساتید راهنما و مشاور:
\newcommand{\signature}{\begin{center}%
		\begin{tabular}{|M{.3}|M{.2}|M{.3}|M{.2}|}
			\cline{1-2}
			\multicolumn{2}{|M{.5}|}{%
				\textbf{محل امضای دانشجو، اساتید راهنما
				\ifx\@firstAdvisorFullName\undefined\else\ و مشاور\fi}
			} & \multicolumn{2}{c}{} \\\hline
		نام و نام‌خانوادگی دانشجو: & امضا: &
		\multicolumn{2}{M{.5}|}{%
			\multirow{3}{=}{\centering\textbf{%
				در صورت دارابودن بيش از دو استاد راهنما%
				\ifx\@firstAdvisorFullName\undefined\else\ و مشاور\fi
				، ستون ذيل بايد تكميل  و امضا گردد.}}%
		}\\
		\multirow{2}{*}[.6ex]{\textbf{\@fullName}} && \multicolumn{2}{M{.5}|}{}\\
		&& \multicolumn{2}{M{.5}|}{}
		\\\hline
		نام و نام‌خانوادگی استاد راهنمای اول: & امضا: &
		نام و نام‌خانوادگی استاد راهنمای دوم: & امضا:
		\\
		\multirow{2}{*}[.6ex]{\textbf{\@firstSupervisorFullName}} &&
		\multirow{2}{*}[.6ex]{\textbf{%
			\ifx\@secSupervisorFullName\undefined
				\hspace*{.44\linewidth} ---
			\else
				\@secSupervisorFullName
			\fi}} & \\
		&&&\\\hline
		\ifx\@firstAdvisorFullName\undefined\else
		نام و نام‌خانوادگی استاد مشاور اول: & امضا: &
		نام و نام‌خانوادگی استاد مشاور دوم: & امضا:
		\\
		\multirow{2}{*}[.6ex]{\textbf{\@firstAdvisorFullName}} &&
		\multirow{2}{*}[.6ex]{\textbf{%
			\ifx\@secAdvisorFullName\undefined
				\hspace*{.44\linewidth} ---
			\else
				\@secAdvisorFullName
			\fi}} & \\
		&&&\\\hline\fi
		\end{tabular}%
	\end{center}%

	\begin{center}%
		\begin{tabular}{|M{.3}|M{.2}|M{.3}|M{.2}|}
			\cline{1-2}
			\multicolumn{2}{|M{.5}|}{%
				\textbf{محل اعلام نظر و امضای داوران}
			} & \multicolumn{2}{M{.5}}{} \\\hline
			نام و نام‌خانوادگی داور اول: & امضا: &
			نام و نام‌خانوادگی داور دوم: & امضا:
			\\
			\multirow{2}{*}[.6ex]{\textbf{\@masterRefereeA}} &&
			\multirow{2}{*}[.6ex]{\textbf{\@masterRefereeB}} & \\
			&&&\\\hline
			\ifznu@mscThesis\else\znu@thirdRefereefalse\fi
			\ifznu@thirdReferee\else
			نام و نام‌خانوادگی داور سوم: & امضا: & 
			\multicolumn{2}{>{\centering\arraybackslash}M{.5}|}{\multirow{3}{*}{%
					\textbf{داور سوم فقط برای دانشجویان دکتری}}}%
			\\
			\multirow{2}{*}[.6ex]{\textbf{%
				\ifx\@phdRefereeC\undefined
					\hspace*{.44\linewidth} ---
				\else
					\@phdRefereeC
				\fi}}
			&&\multicolumn{2}{M{.5}|}{} \\
			&&\multicolumn{2}{M{.5}|}{}\\\hline\fi
		\end{tabular}%
	\end{center}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% صورت‌جلسه:
\newcommand{\proceedings}{%
	\begin{mdframed}
		\textbf{%
			صورت‌جلسهٔ شورای گروه/دانشکده:}
		\\[1ex]
		\textbf{%
			پیشنهادۀ پژوهشی خانم/آقای:}
		\@fullName\\[1ex]
		در جلسهٔ مورخ
		$ \ldots\ldots\ldots\ldots $
		شورای تخصصی گروه مطرح شد و مورد تصویب قرار گرفت
		$ \square $،
		قرار نگرفت
		$ \square $.
		\\[1em]
		نام و نام‌خانوادگی مدیرگروه:
		$ \ldots\ldots\ldots\ldots\ldots\ldots $ \hskip3em
		 امضا
		\vskip3em \noindent
		در جلسهٔ مورخ
		$ \ldots\ldots\ldots\ldots $
		شورای تحصیلات تکمیلی دانشکده مطرح شد و مورد تصویب قرار
		گرفت
		$ \square $،
		قرار نگرفت
		$ \square $.
		\\[2ex]
		\hspace*{\fill}
		معاون آموزشی دانشکده
		\hfill{}
		معاون پژوهشی دانشکده
		\hfill{}
		ریاست دانشکده
		\hspace*{\fill}\\[2ex]\vskip0pt%
	\end{mdframed}%
}
\AtBeginDocument{\RenewCommandCopy{\itshape}{\slshape}}
\AfterPreamble{%
	\setlatintextfont[%
		Path,%
		Scale=0.9,%
		BoldFont={lmroman10-bold},%
		BoldItalicFont={lmroman10-bolditalic},%
		ItalicFont={lmroman10-italic},%
		SmallCapsFont={lmromancaps10-regular},%
		SlantedFont={lmromanslant10-regular},%
		BoldSlantedFont={lmromanslant10-bold}%
	]{lmroman10-regular}
% تغییر فاصله خطوط محیط latin:
	\AtBeginEnvironment{latin}{\vskip0pt\setstretch{1.1}}
	\AtBeginEnvironment{latin*}{\vskip0pt\setstretch{1.1}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% تغییر فاصلهٔ خطوط محیط cases:
\AfterPreamble{%
	\bidi@patchcmd{\env@cases}{1.2}{1}{}{}
}