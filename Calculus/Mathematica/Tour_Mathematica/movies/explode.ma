(*^

::[	Information =

	"This is a Mathematica Notebook file.  It contains ASCII text, and can be
	transferred by email, ftp, or other text-file transfer utility.  It should
	be read or edited using a copy of Mathematica or MathReader.  If you 
	received this as email, use your mail application or copy/paste to save 
	everything from the line containing (*^ down to the line containing ^*)
	into a plain text file.  On some systems you may have to give the file a 
	name ending with ".ma" to allow Mathematica to recognize it as a Notebook.
	The line below identifies what version of Mathematica created this file,
	but it can be opened using any other version as well.";

	FrontEndVersion = "NeXT Mathematica Notebook Front End Version 2.2";

	NeXTStandardFontEncoding; 
	
	fontset = title, inactive, noPageBreakBelow, noPageBreakInGroup, nohscroll, preserveAspect, groupLikeTitle, center, M7, bold, L3, e8,  24, "Times"; ;
	fontset = subtitle, inactive, noPageBreakBelow, noPageBreakInGroup, nohscroll, preserveAspect, groupLikeTitle, center, M7, bold, e6,  18, "Times"; ;
	fontset = subsubtitle, inactive, noPageBreakBelow, noPageBreakInGroup, nohscroll, preserveAspect, groupLikeTitle, center, M7, bold, e6,  14, "Times"; ;
	fontset = section, inactive, noPageBreakBelow, nohscroll, preserveAspect, groupLikeSection, grayBox, M22, bold, a20,  14, "Times"; ;
	fontset = subsection, inactive, noPageBreakBelow, nohscroll, preserveAspect, groupLikeSection, blackBox, M19, bold, a15,  12, "Times"; ;
	fontset = subsubsection, inactive, noPageBreakBelow, nohscroll, preserveAspect, groupLikeSection, whiteBox, M18, bold, a12,  10, "Times"; ;
	fontset = text, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12;
	fontset = smalltext, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  10, "Times"; ;
	fontset = input, noPageBreakInGroup, nowordwrap, preserveAspect, groupLikeInput, M42, N23, bold,  12, "Courier"; ;
	fontset = output, output, inactive, noPageBreakInGroup, nowordwrap, preserveAspect, groupLikeOutput, M42, N23,  12, "Courier"; ;
	fontset = message, inactive, noPageBreakInGroup, nowordwrap, preserveAspect, groupLikeOutput, M42, N23, R65535,  12, "Courier"; ;
	fontset = print, inactive, noPageBreakInGroup, nowordwrap, preserveAspect, groupLikeOutput, M42, N23,  12, "Courier"; ;
	fontset = info, inactive, noPageBreakInGroup, nowordwrap, preserveAspect, groupLikeOutput, M42, N23,  12, "Courier"; ;
	fontset = postscript, PostScript, formatAsPostScript, output, inactive, noPageBreakInGroup, nowordwrap, preserveAspect, groupLikeGraphics, M7, l34, w282, h287,  12, "Courier"; ;
	fontset = name, inactive, noPageBreakInGroup, nohscroll, preserveAspect, M7, italic, B65535,  10, "Times"; ;
	fontset = header, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  10, "Times"; ;
	fontset = leftheader, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, italic, L1,  12, "Times"; ;
	fontset = footer, inactive, nohscroll, noKeepOnOnePage, preserveAspect, center, M7,  12;
	fontset = leftfooter, inactive, nohscroll, noKeepOnOnePage, preserveAspect, center, M7, italic, L1,  12, "Times"; ;
	fontset = help, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  10, "Times"; ;
	fontset = clipboard, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12;
	fontset = completions, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12;
	fontset = special1, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12;
	fontset = special2, inactive, nohscroll, noKeepOnOnePage, preserveAspect, center, M7,  12;
	fontset = special3, inactive, nohscroll, noKeepOnOnePage, preserveAspect, right, M7,  12;
	fontset = special4, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12;
	fontset = special5, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12;
	paletteColors = 128; currentKernel; 
]
:[font = title; inactive; preserveAspect; startGroup]
Rotating Explosion
:[font = text; inactive; preserveAspect]
     This Notebook contains an animation of 200 points of random sizes exploding out in a spherical shell.  
:[font = section; inactive; Cclosed; preserveAspect; startGroup]
Implemenation
:[font = input; preserveAspect]
<<Rotations.m
:[font = input; preserveAspect]
PolarToRectangular[r_, theta_, phi_] :=
	{r Cos[phi] Sin[theta],
	 r Sin[phi] Sin[theta],
	 r Cos[theta]}
:[font = input; preserveAspect]
theList = N[Table[PolarToRectangular[
				1, Pi Random[], 2 Pi Random[]],
				{n,0,200}]];
:[font = input; preserveAspect]
theMatrix = 1.05 RotMatrix3[0,0,0.25];
:[font = input; preserveAspect; endGroup]
showPoints := Show[
 Graphics3D[Flatten[Join[
	 Map[{PointSize[0.005 + 0.015 Random[]], Point[#]}&, 
 									itterationList], 
 				{GrayLevel[1], 
				Point[{-10, -10, -10}], 
				Point[{10, 10, 10}]}]]], 
		BoxRatios->{1,1,1}, PlotRange->All];

:[font = input; preserveAspect; startGroup]
itterationList = theList;

Do[ showPoints;
	itterationList = 
				Map[(theMatrix . #)&, itterationList], 
	{t, 0, 47}
  ]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; Cclosed; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277; startGroup]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.01133 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00579 setlinewidth
0.52409 0.53993 Mdot
0 0 0 setrgbcolor
0.01161 setlinewidth
0.5213 0.53077 Mdot
0 0 0 setrgbcolor
0.01611 setlinewidth
0.52917 0.53512 Mdot
0 0 0 setrgbcolor
0.01805 setlinewidth
0.53145 0.53619 Mdot
0 0 0 setrgbcolor
0.00861 setlinewidth
0.52136 0.54746 Mdot
0 0 0 setrgbcolor
0.019 setlinewidth
0.51849 0.54736 Mdot
0 0 0 setrgbcolor
0.01434 setlinewidth
0.51817 0.52235 Mdot
0 0 0 setrgbcolor
0.01709 setlinewidth
0.51741 0.54824 Mdot
0 0 0 setrgbcolor
0.0132 setlinewidth
0.51561 0.52298 Mdot
0 0 0 setrgbcolor
0.00586 setlinewidth
0.51033 0.52617 Mdot
0 0 0 setrgbcolor
0.01296 setlinewidth
0.50907 0.52817 Mdot
0 0 0 setrgbcolor
0.00629 setlinewidth
0.50984 0.54425 Mdot
0 0 0 setrgbcolor
0.01622 setlinewidth
0.5382 0.52935 Mdot
0 0 0 setrgbcolor
0.00994 setlinewidth
0.50683 0.53383 Mdot
0 0 0 setrgbcolor
0.01904 setlinewidth
0.53862 0.5295 Mdot
0 0 0 setrgbcolor
0.01033 setlinewidth
0.52189 0.51879 Mdot
0 0 0 setrgbcolor
0.00543 setlinewidth
0.51033 0.52462 Mdot
0 0 0 setrgbcolor
0.00637 setlinewidth
0.51167 0.5231 Mdot
0 0 0 setrgbcolor
0.0051 setlinewidth
0.51738 0.51926 Mdot
0 0 0 setrgbcolor
0.0145 setlinewidth
0.52261 0.51826 Mdot
0 0 0 setrgbcolor
0.00913 setlinewidth
0.51599 0.55093 Mdot
0 0 0 setrgbcolor
0.01415 setlinewidth
0.51323 0.54967 Mdot
0 0 0 setrgbcolor
0.00619 setlinewidth
0.5172 0.55177 Mdot
0 0 0 setrgbcolor
0.01862 setlinewidth
0.53679 0.52437 Mdot
0 0 0 setrgbcolor
0.01352 setlinewidth
0.52515 0.51738 Mdot
0 0 0 setrgbcolor
0.00773 setlinewidth
0.51818 0.51778 Mdot
0 0 0 setrgbcolor
0.01777 setlinewidth
0.51348 0.5189 Mdot
0 0 0 setrgbcolor
0.01433 setlinewidth
0.50545 0.52717 Mdot
0 0 0 setrgbcolor
0.0179 setlinewidth
0.50348 0.53712 Mdot
0 0 0 setrgbcolor
0.01938 setlinewidth
0.50429 0.5417 Mdot
0 0 0 setrgbcolor
0.00588 setlinewidth
0.5326 0.51792 Mdot
0 0 0 setrgbcolor
0.01345 setlinewidth
0.50497 0.54379 Mdot
0 0 0 setrgbcolor
0.01587 setlinewidth
0.52408 0.51537 Mdot
0 0 0 setrgbcolor
0.01989 setlinewidth
0.51408 0.517 Mdot
0 0 0 setrgbcolor
0.01771 setlinewidth
0.52647 0.55588 Mdot
0 0 0 setrgbcolor
0.01362 setlinewidth
0.52072 0.51466 Mdot
0 0 0 setrgbcolor
0.0123 setlinewidth
0.5274 0.51474 Mdot
0 0 0 setrgbcolor
0.01251 setlinewidth
0.52825 0.51454 Mdot
0 0 0 setrgbcolor
0.01009 setlinewidth
0.51662 0.51484 Mdot
0 0 0 setrgbcolor
0.0071 setlinewidth
0.52584 0.51395 Mdot
0 0 0 setrgbcolor
0.00725 setlinewidth
0.522 0.51377 Mdot
0 0 0 setrgbcolor
0.01728 setlinewidth
0.52711 0.55662 Mdot
0 0 0 setrgbcolor
0.00699 setlinewidth
0.51203 0.55414 Mdot
0 0 0 setrgbcolor
0.00952 setlinewidth
0.54495 0.53236 Mdot
0 0 0 setrgbcolor
0.00514 setlinewidth
0.50385 0.54636 Mdot
0 0 0 setrgbcolor
0.00766 setlinewidth
0.5233 0.51314 Mdot
0 0 0 setrgbcolor
0.0159 setlinewidth
0.5038 0.52426 Mdot
0 0 0 setrgbcolor
0.01499 setlinewidth
0.52413 0.51312 Mdot
0 0 0 setrgbcolor
0.01896 setlinewidth
0.53893 0.55117 Mdot
0 0 0 setrgbcolor
0.01788 setlinewidth
0.52332 0.5129 Mdot
0 0 0 setrgbcolor
0.01338 setlinewidth
0.52072 0.51297 Mdot
0 0 0 setrgbcolor
0.01853 setlinewidth
0.52414 0.51276 Mdot
0 0 0 setrgbcolor
0.00573 setlinewidth
0.53487 0.55482 Mdot
0 0 0 setrgbcolor
0.01797 setlinewidth
0.52231 0.51258 Mdot
0 0 0 setrgbcolor
0.01914 setlinewidth
0.52542 0.51249 Mdot
0 0 0 setrgbcolor
0.01984 setlinewidth
0.52139 0.51244 Mdot
0 0 0 setrgbcolor
0.01761 setlinewidth
0.52269 0.51235 Mdot
0 0 0 setrgbcolor
0.0109 setlinewidth
0.52516 0.51221 Mdot
0 0 0 setrgbcolor
0.01755 setlinewidth
0.52416 0.51207 Mdot
0 0 0 setrgbcolor
0.0067 setlinewidth
0.51484 0.55721 Mdot
0 0 0 setrgbcolor
0.00987 setlinewidth
0.53991 0.55199 Mdot
0 0 0 setrgbcolor
0.00738 setlinewidth
0.52179 0.51163 Mdot
0 0 0 setrgbcolor
0.01686 setlinewidth
0.54518 0.52569 Mdot
0 0 0 setrgbcolor
0.01882 setlinewidth
0.52884 0.55881 Mdot
0 0 0 setrgbcolor
0.00624 setlinewidth
0.50751 0.55402 Mdot
0 0 0 setrgbcolor
0.01994 setlinewidth
0.52917 0.51124 Mdot
0 0 0 setrgbcolor
0.00826 setlinewidth
0.50263 0.52116 Mdot
0 0 0 setrgbcolor
0.00632 setlinewidth
0.50694 0.55437 Mdot
0 0 0 setrgbcolor
0.01129 setlinewidth
0.54264 0.5196 Mdot
0 0 0 setrgbcolor
0.00628 setlinewidth
0.50055 0.52381 Mdot
0 0 0 setrgbcolor
0.0063 setlinewidth
0.50284 0.51989 Mdot
0 0 0 setrgbcolor
0.00832 setlinewidth
0.53453 0.51233 Mdot
0 0 0 setrgbcolor
0.00947 setlinewidth
0.51419 0.51094 Mdot
0 0 0 setrgbcolor
0.01964 setlinewidth
0.53891 0.51465 Mdot
0 0 0 setrgbcolor
0.00665 setlinewidth
0.52128 0.5092 Mdot
0 0 0 setrgbcolor
0.01608 setlinewidth
0.53673 0.51286 Mdot
0 0 0 setrgbcolor
0.01729 setlinewidth
0.53033 0.56075 Mdot
0 0 0 setrgbcolor
0.01699 setlinewidth
0.51795 0.50929 Mdot
0 0 0 setrgbcolor
0.01341 setlinewidth
0.51222 0.55968 Mdot
0 0 0 setrgbcolor
0.01688 setlinewidth
0.5142 0.51021 Mdot
0 0 0 setrgbcolor
0.01002 setlinewidth
0.51427 0.51017 Mdot
0 0 0 setrgbcolor
0.0057 setlinewidth
0.54272 0.51688 Mdot
0 0 0 setrgbcolor
0.00529 setlinewidth
0.52156 0.5084 Mdot
0 0 0 setrgbcolor
0.0116 setlinewidth
0.53052 0.50937 Mdot
0 0 0 setrgbcolor
0.01231 setlinewidth
0.5135 0.51004 Mdot
0 0 0 setrgbcolor
0.0147 setlinewidth
0.53714 0.55849 Mdot
0 0 0 setrgbcolor
0.01717 setlinewidth
0.51515 0.50944 Mdot
0 0 0 setrgbcolor
0.01549 setlinewidth
0.54813 0.52479 Mdot
0 0 0 setrgbcolor
0.01628 setlinewidth
0.53968 0.55692 Mdot
0 0 0 setrgbcolor
0.01259 setlinewidth
0.52011 0.50829 Mdot
0 0 0 setrgbcolor
0.00757 setlinewidth
0.54107 0.51484 Mdot
0 0 0 setrgbcolor
0.01538 setlinewidth
0.51625 0.50885 Mdot
0 0 0 setrgbcolor
0.01721 setlinewidth
0.55007 0.54023 Mdot
0 0 0 setrgbcolor
0.01736 setlinewidth
0.51124 0.51043 Mdot
0 0 0 setrgbcolor
0.01573 setlinewidth
0.55004 0.52883 Mdot
0 0 0 setrgbcolor
0.01718 setlinewidth
0.54553 0.51902 Mdot
0 0 0 setrgbcolor
0.01006 setlinewidth
0.5254 0.50769 Mdot
0 0 0 setrgbcolor
0.01453 setlinewidth
0.54982 0.52755 Mdot
0 0 0 setrgbcolor
0.00887 setlinewidth
0.51737 0.50809 Mdot
0 0 0 setrgbcolor
0.01888 setlinewidth
0.50915 0.51118 Mdot
0 0 0 setrgbcolor
0.00557 setlinewidth
0.51962 0.50765 Mdot
0 0 0 setrgbcolor
0.01278 setlinewidth
0.54957 0.52643 Mdot
0 0 0 setrgbcolor
0.01876 setlinewidth
0.53077 0.50848 Mdot
0 0 0 setrgbcolor
0.00587 setlinewidth
0.51969 0.56311 Mdot
0 0 0 setrgbcolor
0.00742 setlinewidth
0.5326 0.56165 Mdot
0 0 0 setrgbcolor
0.01717 setlinewidth
0.51544 0.56227 Mdot
0 0 0 setrgbcolor
0.01267 setlinewidth
0.54266 0.55539 Mdot
0 0 0 setrgbcolor
0.00538 setlinewidth
0.52686 0.50759 Mdot
0 0 0 setrgbcolor
0.00582 setlinewidth
0.5161 0.56251 Mdot
0 0 0 setrgbcolor
0.01027 setlinewidth
0.50106 0.51799 Mdot
0 0 0 setrgbcolor
0.01964 setlinewidth
0.54937 0.52554 Mdot
0 0 0 setrgbcolor
0.00873 setlinewidth
0.54252 0.55558 Mdot
0 0 0 setrgbcolor
0.00571 setlinewidth
0.53426 0.56108 Mdot
0 0 0 setrgbcolor
0.00907 setlinewidth
0.53316 0.56152 Mdot
0 0 0 setrgbcolor
0.01404 setlinewidth
0.51419 0.56193 Mdot
0 0 0 setrgbcolor
0.01988 setlinewidth
0.5448 0.51762 Mdot
0 0 0 setrgbcolor
0.00785 setlinewidth
0.51846 0.56299 Mdot
0 0 0 setrgbcolor
0.01997 setlinewidth
0.49673 0.54482 Mdot
0 0 0 setrgbcolor
0.01805 setlinewidth
0.55094 0.53779 Mdot
0 0 0 setrgbcolor
0.0146 setlinewidth
0.55104 0.5355 Mdot
0 0 0 setrgbcolor
0.00522 setlinewidth
0.5402 0.51326 Mdot
0 0 0 setrgbcolor
0.0081 setlinewidth
0.51392 0.56172 Mdot
0 0 0 setrgbcolor
0.01776 setlinewidth
0.55097 0.5366 Mdot
0 0 0 setrgbcolor
0.01935 setlinewidth
0.55048 0.53004 Mdot
0 0 0 setrgbcolor
0.00595 setlinewidth
0.53452 0.56078 Mdot
0 0 0 setrgbcolor
0.00948 setlinewidth
0.54958 0.54397 Mdot
0 0 0 setrgbcolor
0.00584 setlinewidth
0.53307 0.50934 Mdot
0 0 0 setrgbcolor
0.01399 setlinewidth
0.54435 0.51751 Mdot
0 0 0 setrgbcolor
0.01257 setlinewidth
0.49548 0.5369 Mdot
0 0 0 setrgbcolor
0.00796 setlinewidth
0.5375 0.55852 Mdot
0 0 0 setrgbcolor
0.01283 setlinewidth
0.52168 0.56248 Mdot
0 0 0 setrgbcolor
0.01028 setlinewidth
0.53808 0.51277 Mdot
0 0 0 setrgbcolor
0.01599 setlinewidth
0.49638 0.53083 Mdot
0 0 0 setrgbcolor
0.01107 setlinewidth
0.49999 0.54917 Mdot
0 0 0 setrgbcolor
0.01151 setlinewidth
0.53695 0.55841 Mdot
0 0 0 setrgbcolor
0.00539 setlinewidth
0.51922 0.56183 Mdot
0 0 0 setrgbcolor
0.00681 setlinewidth
0.54376 0.55231 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.51055 0.55896 Mdot
0 0 0 setrgbcolor
0.00636 setlinewidth
0.49648 0.53492 Mdot
0 0 0 setrgbcolor
0.00825 setlinewidth
0.54833 0.52894 Mdot
0 0 0 setrgbcolor
0.00903 setlinewidth
0.49732 0.53724 Mdot
0 0 0 setrgbcolor
0.01996 setlinewidth
0.51442 0.55956 Mdot
0 0 0 setrgbcolor
0.01269 setlinewidth
0.52056 0.56094 Mdot
0 0 0 setrgbcolor
0.00689 setlinewidth
0.50825 0.55634 Mdot
0 0 0 setrgbcolor
0.01499 setlinewidth
0.51875 0.51016 Mdot
0 0 0 setrgbcolor
0.00899 setlinewidth
0.53684 0.51389 Mdot
0 0 0 setrgbcolor
0.00996 setlinewidth
0.49784 0.53224 Mdot
0 0 0 setrgbcolor
0.00588 setlinewidth
0.52335 0.56077 Mdot
0 0 0 setrgbcolor
0.00748 setlinewidth
0.51918 0.51028 Mdot
0 0 0 setrgbcolor
0.01813 setlinewidth
0.51676 0.55987 Mdot
0 0 0 setrgbcolor
0.00984 setlinewidth
0.53581 0.55712 Mdot
0 0 0 setrgbcolor
0.00996 setlinewidth
0.51337 0.51214 Mdot
0 0 0 setrgbcolor
0.01411 setlinewidth
0.50872 0.5558 Mdot
0 0 0 setrgbcolor
0.01002 setlinewidth
0.49937 0.54277 Mdot
0 0 0 setrgbcolor
0.01186 setlinewidth
0.52585 0.55992 Mdot
0 0 0 setrgbcolor
0.00511 setlinewidth
0.51462 0.55845 Mdot
0 0 0 setrgbcolor
0.00818 setlinewidth
0.53354 0.55746 Mdot
0 0 0 setrgbcolor
0.01654 setlinewidth
0.52677 0.55947 Mdot
0 0 0 setrgbcolor
0.01352 setlinewidth
0.51888 0.55935 Mdot
0 0 0 setrgbcolor
0.01197 setlinewidth
0.49897 0.53448 Mdot
0 0 0 setrgbcolor
0.01926 setlinewidth
0.50862 0.55378 Mdot
0 0 0 setrgbcolor
0.01268 setlinewidth
0.52723 0.55814 Mdot
0 0 0 setrgbcolor
0.01752 setlinewidth
0.52325 0.55822 Mdot
0 0 0 setrgbcolor
0.01944 setlinewidth
0.50685 0.55124 Mdot
0 0 0 setrgbcolor
0.01133 setlinewidth
0.52216 0.55803 Mdot
0 0 0 setrgbcolor
0.01305 setlinewidth
0.52338 0.55804 Mdot
0 0 0 setrgbcolor
0.00685 setlinewidth
0.54547 0.5349 Mdot
0 0 0 setrgbcolor
0.01514 setlinewidth
0.52119 0.55764 Mdot
0 0 0 setrgbcolor
0.01646 setlinewidth
0.52241 0.55677 Mdot
0 0 0 setrgbcolor
0.01622 setlinewidth
0.52178 0.51406 Mdot
0 0 0 setrgbcolor
0.00922 setlinewidth
0.51483 0.55493 Mdot
0 0 0 setrgbcolor
0.01616 setlinewidth
0.52372 0.55654 Mdot
0 0 0 setrgbcolor
0.01141 setlinewidth
0.50223 0.53853 Mdot
0 0 0 setrgbcolor
0.00589 setlinewidth
0.51551 0.51569 Mdot
0 0 0 setrgbcolor
0.01095 setlinewidth
0.50376 0.54205 Mdot
0 0 0 setrgbcolor
0.00828 setlinewidth
0.53013 0.51625 Mdot
0 0 0 setrgbcolor
0.01706 setlinewidth
0.54292 0.53098 Mdot
0 0 0 setrgbcolor
0.01454 setlinewidth
0.53413 0.55184 Mdot
0 0 0 setrgbcolor
0.00674 setlinewidth
0.52359 0.55497 Mdot
0 0 0 setrgbcolor
0.01905 setlinewidth
0.50475 0.54145 Mdot
0 0 0 setrgbcolor
0.01254 setlinewidth
0.50522 0.54115 Mdot
0 0 0 setrgbcolor
0.00787 setlinewidth
0.52191 0.55373 Mdot
0 0 0 setrgbcolor
0.01472 setlinewidth
0.51887 0.51744 Mdot
0 0 0 setrgbcolor
0.00726 setlinewidth
0.52008 0.55317 Mdot
0 0 0 setrgbcolor
0.00675 setlinewidth
0.50509 0.53554 Mdot
0 0 0 setrgbcolor
0.01209 setlinewidth
0.53072 0.51955 Mdot
0 0 0 setrgbcolor
0.01546 setlinewidth
0.52979 0.55073 Mdot
0 0 0 setrgbcolor
0.01841 setlinewidth
0.5374 0.53915 Mdot
0 0 0 setrgbcolor
0.01318 setlinewidth
0.51968 0.5212 Mdot
0 0 0 setrgbcolor
0.0052 setlinewidth
0.50996 0.54074 Mdot
0 0 0 setrgbcolor
0.00501 setlinewidth
0.53618 0.52992 Mdot
0 0 0 setrgbcolor
0.00741 setlinewidth
0.53669 0.53213 Mdot
0 0 0 setrgbcolor
0.01736 setlinewidth
0.51549 0.5459 Mdot
0 0 0 setrgbcolor
0.01855 setlinewidth
0.53109 0.54496 Mdot
0 0 0 setrgbcolor
0.01674 setlinewidth
0.51674 0.52465 Mdot
0 0 0 setrgbcolor
0.00986 setlinewidth
0.51209 0.53734 Mdot
0 0 0 setrgbcolor
0.00619 setlinewidth
0.52511 0.54622 Mdot
0 0 0 setrgbcolor
0.00879 setlinewidth
0.51835 0.54515 Mdot
0 0 0 setrgbcolor
0.01223 setlinewidth
0.52368 0.52473 Mdot
0 0 0 setrgbcolor
0.0066 setlinewidth
0.51889 0.54491 Mdot
0 0 0 setrgbcolor
0.01681 setlinewidth
0.51855 0.53738 Mdot
1 1 1 setrgbcolor
0.01133 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.01075 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01463 setlinewidth
0.52627 0.53044 Mdot
0 0 0 setrgbcolor
0.00569 setlinewidth
0.53052 0.53952 Mdot
0 0 0 setrgbcolor
0.01385 setlinewidth
0.5349 0.53375 Mdot
0 0 0 setrgbcolor
0.00846 setlinewidth
0.51252 0.5297 Mdot
0 0 0 setrgbcolor
0.01806 setlinewidth
0.51103 0.53592 Mdot
0 0 0 setrgbcolor
0.00628 setlinewidth
0.5135 0.52743 Mdot
0 0 0 setrgbcolor
0.01092 setlinewidth
0.51854 0.52329 Mdot
0 0 0 setrgbcolor
0.01179 setlinewidth
0.52539 0.54814 Mdot
0 0 0 setrgbcolor
0.00804 setlinewidth
0.51574 0.54626 Mdot
0 0 0 setrgbcolor
0.01832 setlinewidth
0.52111 0.52224 Mdot
0 0 0 setrgbcolor
0.00998 setlinewidth
0.5284 0.5478 Mdot
0 0 0 setrgbcolor
0.01841 setlinewidth
0.51312 0.52584 Mdot
0 0 0 setrgbcolor
0.01556 setlinewidth
0.5243 0.54923 Mdot
0 0 0 setrgbcolor
0.00604 setlinewidth
0.53726 0.53453 Mdot
0 0 0 setrgbcolor
0.01255 setlinewidth
0.51423 0.52406 Mdot
0 0 0 setrgbcolor
0.01266 setlinewidth
0.50755 0.53989 Mdot
0 0 0 setrgbcolor
0.01359 setlinewidth
0.50808 0.52927 Mdot
0 0 0 setrgbcolor
0.01236 setlinewidth
0.51979 0.55138 Mdot
0 0 0 setrgbcolor
0.01217 setlinewidth
0.5194 0.51919 Mdot
0 0 0 setrgbcolor
0.00579 setlinewidth
0.50905 0.54451 Mdot
0 0 0 setrgbcolor
0.01711 setlinewidth
0.52283 0.55227 Mdot
0 0 0 setrgbcolor
0.00961 setlinewidth
0.51002 0.54657 Mdot
0 0 0 setrgbcolor
0.01734 setlinewidth
0.52398 0.518 Mdot
0 0 0 setrgbcolor
0.00997 setlinewidth
0.52413 0.55296 Mdot
0 0 0 setrgbcolor
0.01531 setlinewidth
0.51503 0.51945 Mdot
0 0 0 setrgbcolor
0.0161 setlinewidth
0.52456 0.51734 Mdot
0 0 0 setrgbcolor
0.01828 setlinewidth
0.51978 0.51754 Mdot
0 0 0 setrgbcolor
0.01518 setlinewidth
0.51506 0.51741 Mdot
0 0 0 setrgbcolor
0.01166 setlinewidth
0.52683 0.51604 Mdot
0 0 0 setrgbcolor
0.00793 setlinewidth
0.50531 0.52656 Mdot
0 0 0 setrgbcolor
0.0095 setlinewidth
0.50875 0.54945 Mdot
0 0 0 setrgbcolor
0.0134 setlinewidth
0.54228 0.52644 Mdot
0 0 0 setrgbcolor
0.00942 setlinewidth
0.52507 0.51416 Mdot
0 0 0 setrgbcolor
0.00788 setlinewidth
0.51706 0.51479 Mdot
0 0 0 setrgbcolor
0.00727 setlinewidth
0.51834 0.55627 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.52136 0.51395 Mdot
0 0 0 setrgbcolor
0.01495 setlinewidth
0.54268 0.52654 Mdot
0 0 0 setrgbcolor
0.01809 setlinewidth
0.53987 0.5215 Mdot
0 0 0 setrgbcolor
0.01525 setlinewidth
0.52233 0.51284 Mdot
0 0 0 setrgbcolor
0.00822 setlinewidth
0.53416 0.51548 Mdot
0 0 0 setrgbcolor
0.01601 setlinewidth
0.52811 0.513 Mdot
0 0 0 setrgbcolor
0.00526 setlinewidth
0.53354 0.55587 Mdot
0 0 0 setrgbcolor
0.00563 setlinewidth
0.52628 0.51244 Mdot
0 0 0 setrgbcolor
0.01259 setlinewidth
0.52068 0.51223 Mdot
0 0 0 setrgbcolor
0.00924 setlinewidth
0.52341 0.512 Mdot
0 0 0 setrgbcolor
0.01426 setlinewidth
0.52885 0.51267 Mdot
0 0 0 setrgbcolor
0.0066 setlinewidth
0.50277 0.52359 Mdot
0 0 0 setrgbcolor
0.00864 setlinewidth
0.52423 0.51185 Mdot
0 0 0 setrgbcolor
0.01187 setlinewidth
0.52332 0.51175 Mdot
0 0 0 setrgbcolor
0.01687 setlinewidth
0.52215 0.51158 Mdot
0 0 0 setrgbcolor
0.00852 setlinewidth
0.52122 0.55907 Mdot
0 0 0 setrgbcolor
0.01435 setlinewidth
0.51297 0.55689 Mdot
0 0 0 setrgbcolor
0.00542 setlinewidth
0.5009 0.52667 Mdot
0 0 0 setrgbcolor
0.00639 setlinewidth
0.52114 0.51158 Mdot
0 0 0 setrgbcolor
0.01269 setlinewidth
0.52408 0.51148 Mdot
0 0 0 setrgbcolor
0.01858 setlinewidth
0.5341 0.55656 Mdot
0 0 0 setrgbcolor
0.0168 setlinewidth
0.52244 0.51128 Mdot
0 0 0 setrgbcolor
0.01153 setlinewidth
0.50254 0.52225 Mdot
0 0 0 setrgbcolor
0.01679 setlinewidth
0.52524 0.51101 Mdot
0 0 0 setrgbcolor
0.0075 setlinewidth
0.5122 0.55736 Mdot
0 0 0 setrgbcolor
0.00562 setlinewidth
0.52379 0.51077 Mdot
0 0 0 setrgbcolor
0.01977 setlinewidth
0.52486 0.51076 Mdot
0 0 0 setrgbcolor
0.00723 setlinewidth
0.52117 0.5107 Mdot
0 0 0 setrgbcolor
0.01089 setlinewidth
0.54144 0.55354 Mdot
0 0 0 setrgbcolor
0.00702 setlinewidth
0.54512 0.54911 Mdot
0 0 0 setrgbcolor
0.00588 setlinewidth
0.54847 0.52861 Mdot
0 0 0 setrgbcolor
0.01593 setlinewidth
0.53545 0.55863 Mdot
0 0 0 setrgbcolor
0.01647 setlinewidth
0.51243 0.51123 Mdot
0 0 0 setrgbcolor
0.00983 setlinewidth
0.52821 0.50917 Mdot
0 0 0 setrgbcolor
0.01076 setlinewidth
0.54587 0.54985 Mdot
0 0 0 setrgbcolor
0.01768 setlinewidth
0.51195 0.5105 Mdot
0 0 0 setrgbcolor
0.00679 setlinewidth
0.51199 0.51046 Mdot
0 0 0 setrgbcolor
0.00593 setlinewidth
0.51925 0.50834 Mdot
0 0 0 setrgbcolor
0.00507 setlinewidth
0.51753 0.56213 Mdot
0 0 0 setrgbcolor
0.01164 setlinewidth
0.51568 0.50896 Mdot
0 0 0 setrgbcolor
0.00523 setlinewidth
0.54705 0.52168 Mdot
0 0 0 setrgbcolor
0.01829 setlinewidth
0.51092 0.51046 Mdot
0 0 0 setrgbcolor
0.00755 setlinewidth
0.51248 0.50959 Mdot
0 0 0 setrgbcolor
0.0103 setlinewidth
0.53347 0.50949 Mdot
0 0 0 setrgbcolor
0.01877 setlinewidth
0.54314 0.51577 Mdot
0 0 0 setrgbcolor
0.01221 setlinewidth
0.51891 0.50749 Mdot
0 0 0 setrgbcolor
0.0147 setlinewidth
0.51328 0.50881 Mdot
0 0 0 setrgbcolor
0.00985 setlinewidth
0.50821 0.51125 Mdot
0 0 0 setrgbcolor
0.01247 setlinewidth
0.51725 0.50762 Mdot
0 0 0 setrgbcolor
0.01619 setlinewidth
0.53626 0.5605 Mdot
0 0 0 setrgbcolor
0.01969 setlinewidth
0.53812 0.51123 Mdot
0 0 0 setrgbcolor
0.00937 setlinewidth
0.53549 0.50973 Mdot
0 0 0 setrgbcolor
0.01126 setlinewidth
0.52817 0.5071 Mdot
0 0 0 setrgbcolor
0.01013 setlinewidth
0.50576 0.51238 Mdot
0 0 0 setrgbcolor
0.01117 setlinewidth
0.49811 0.52073 Mdot
0 0 0 setrgbcolor
0.00824 setlinewidth
0.51372 0.50789 Mdot
0 0 0 setrgbcolor
0.01396 setlinewidth
0.54242 0.55716 Mdot
0 0 0 setrgbcolor
0.01043 setlinewidth
0.54181 0.513 Mdot
0 0 0 setrgbcolor
0.01322 setlinewidth
0.52197 0.50621 Mdot
0 0 0 setrgbcolor
0.01981 setlinewidth
0.5158 0.50709 Mdot
0 0 0 setrgbcolor
0.01168 setlinewidth
0.49739 0.54923 Mdot
0 0 0 setrgbcolor
0.00872 setlinewidth
0.53955 0.51115 Mdot
0 0 0 setrgbcolor
0.01106 setlinewidth
0.54466 0.55514 Mdot
0 0 0 setrgbcolor
0.01083 setlinewidth
0.51977 0.56444 Mdot
0 0 0 setrgbcolor
0.01292 setlinewidth
0.52428 0.56467 Mdot
0 0 0 setrgbcolor
0.01489 setlinewidth
0.54838 0.5204 Mdot
0 0 0 setrgbcolor
0.00586 setlinewidth
0.5202 0.56462 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.52721 0.50621 Mdot
0 0 0 setrgbcolor
0.01121 setlinewidth
0.52289 0.50592 Mdot
0 0 0 setrgbcolor
0.00699 setlinewidth
0.49425 0.54127 Mdot
0 0 0 setrgbcolor
0.01686 setlinewidth
0.55253 0.53619 Mdot
0 0 0 setrgbcolor
0.01574 setlinewidth
0.5178 0.56433 Mdot
0 0 0 setrgbcolor
0.00865 setlinewidth
0.53719 0.56121 Mdot
0 0 0 setrgbcolor
0.01958 setlinewidth
0.54424 0.51485 Mdot
0 0 0 setrgbcolor
0.0117 setlinewidth
0.52229 0.56479 Mdot
0 0 0 setrgbcolor
0.01295 setlinewidth
0.55039 0.52435 Mdot
0 0 0 setrgbcolor
0.01572 setlinewidth
0.51714 0.56417 Mdot
0 0 0 setrgbcolor
0.01162 setlinewidth
0.49369 0.53488 Mdot
0 0 0 setrgbcolor
0.01103 setlinewidth
0.54979 0.52306 Mdot
0 0 0 setrgbcolor
0.01748 setlinewidth
0.54636 0.55318 Mdot
0 0 0 setrgbcolor
0.01131 setlinewidth
0.54916 0.52195 Mdot
0 0 0 setrgbcolor
0.00676 setlinewidth
0.53826 0.5604 Mdot
0 0 0 setrgbcolor
0.01672 setlinewidth
0.53712 0.56103 Mdot
0 0 0 setrgbcolor
0.00885 setlinewidth
0.50002 0.55333 Mdot
0 0 0 setrgbcolor
0.01513 setlinewidth
0.49409 0.53912 Mdot
0 0 0 setrgbcolor
0.01024 setlinewidth
0.54589 0.55343 Mdot
0 0 0 setrgbcolor
0.01644 setlinewidth
0.52848 0.50684 Mdot
0 0 0 setrgbcolor
0.00731 setlinewidth
0.54217 0.51358 Mdot
0 0 0 setrgbcolor
0.01031 setlinewidth
0.54827 0.5211 Mdot
0 0 0 setrgbcolor
0.01855 setlinewidth
0.53653 0.50978 Mdot
0 0 0 setrgbcolor
0.00656 setlinewidth
0.49486 0.54143 Mdot
0 0 0 setrgbcolor
0.00914 setlinewidth
0.53791 0.5601 Mdot
0 0 0 setrgbcolor
0.01756 setlinewidth
0.51211 0.56191 Mdot
0 0 0 setrgbcolor
0.01858 setlinewidth
0.49444 0.53619 Mdot
0 0 0 setrgbcolor
0.016 setlinewidth
0.52427 0.56387 Mdot
0 0 0 setrgbcolor
0.01541 setlinewidth
0.52137 0.56358 Mdot
0 0 0 setrgbcolor
0.01993 setlinewidth
0.55131 0.53365 Mdot
0 0 0 setrgbcolor
0.01789 setlinewidth
0.55104 0.53125 Mdot
0 0 0 setrgbcolor
0.01417 setlinewidth
0.54108 0.51358 Mdot
0 0 0 setrgbcolor
0.01731 setlinewidth
0.49734 0.54688 Mdot
0 0 0 setrgbcolor
0.01193 setlinewidth
0.54951 0.52566 Mdot
0 0 0 setrgbcolor
0.01139 setlinewidth
0.55107 0.53241 Mdot
0 0 0 setrgbcolor
0.01369 setlinewidth
0.5088 0.55958 Mdot
0 0 0 setrgbcolor
0.00615 setlinewidth
0.55068 0.54031 Mdot
0 0 0 setrgbcolor
0.01791 setlinewidth
0.49541 0.53837 Mdot
0 0 0 setrgbcolor
0.01283 setlinewidth
0.51556 0.56199 Mdot
0 0 0 setrgbcolor
0.00707 setlinewidth
0.53989 0.55735 Mdot
0 0 0 setrgbcolor
0.01524 setlinewidth
0.53329 0.50968 Mdot
0 0 0 setrgbcolor
0.00565 setlinewidth
0.50697 0.51296 Mdot
0 0 0 setrgbcolor
0.01124 setlinewidth
0.50887 0.55897 Mdot
0 0 0 setrgbcolor
0.01573 setlinewidth
0.51231 0.51005 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.51268 0.51011 Mdot
0 0 0 setrgbcolor
0.00704 setlinewidth
0.52201 0.5625 Mdot
0 0 0 setrgbcolor
0.01052 setlinewidth
0.53901 0.55734 Mdot
0 0 0 setrgbcolor
0.00724 setlinewidth
0.51781 0.56198 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.51512 0.56085 Mdot
0 0 0 setrgbcolor
0.01559 setlinewidth
0.52469 0.56192 Mdot
0 0 0 setrgbcolor
0.01113 setlinewidth
0.5079 0.55694 Mdot
0 0 0 setrgbcolor
0.00763 setlinewidth
0.54492 0.54996 Mdot
0 0 0 setrgbcolor
0.00581 setlinewidth
0.5055 0.55458 Mdot
0 0 0 setrgbcolor
0.00771 setlinewidth
0.51949 0.56114 Mdot
0 0 0 setrgbcolor
0.01441 setlinewidth
0.52681 0.56067 Mdot
0 0 0 setrgbcolor
0.01198 setlinewidth
0.53125 0.5111 Mdot
0 0 0 setrgbcolor
0.01838 setlinewidth
0.49845 0.54213 Mdot
0 0 0 setrgbcolor
0.01201 setlinewidth
0.52756 0.56008 Mdot
0 0 0 setrgbcolor
0.00637 setlinewidth
0.53674 0.55624 Mdot
0 0 0 setrgbcolor
0.01962 setlinewidth
0.50039 0.54557 Mdot
0 0 0 setrgbcolor
0.00954 setlinewidth
0.54558 0.52495 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.53417 0.55696 Mdot
0 0 0 setrgbcolor
0.01037 setlinewidth
0.52328 0.55935 Mdot
0 0 0 setrgbcolor
0.01075 setlinewidth
0.52209 0.55932 Mdot
0 0 0 setrgbcolor
0.00993 setlinewidth
0.50106 0.54481 Mdot
0 0 0 setrgbcolor
0.00813 setlinewidth
0.50841 0.5164 Mdot
0 0 0 setrgbcolor
0.01309 setlinewidth
0.52095 0.55906 Mdot
0 0 0 setrgbcolor
0.01912 setlinewidth
0.52333 0.55915 Mdot
0 0 0 setrgbcolor
0.00998 setlinewidth
0.51378 0.55724 Mdot
0 0 0 setrgbcolor
0.01864 setlinewidth
0.52741 0.55866 Mdot
0 0 0 setrgbcolor
0.01486 setlinewidth
0.50138 0.54444 Mdot
0 0 0 setrgbcolor
0.00606 setlinewidth
0.51458 0.51373 Mdot
0 0 0 setrgbcolor
0.01174 setlinewidth
0.50025 0.53865 Mdot
0 0 0 setrgbcolor
0.01283 setlinewidth
0.52181 0.558 Mdot
0 0 0 setrgbcolor
0.01182 setlinewidth
0.52305 0.55757 Mdot
0 0 0 setrgbcolor
0.01538 setlinewidth
0.51153 0.51773 Mdot
0 0 0 setrgbcolor
0.00962 setlinewidth
0.52233 0.55598 Mdot
0 0 0 setrgbcolor
0.01268 setlinewidth
0.52319 0.51472 Mdot
0 0 0 setrgbcolor
0.01602 setlinewidth
0.51819 0.55467 Mdot
0 0 0 setrgbcolor
0.01996 setlinewidth
0.52019 0.55496 Mdot
0 0 0 setrgbcolor
0.00564 setlinewidth
0.54221 0.53171 Mdot
0 0 0 setrgbcolor
0.01669 setlinewidth
0.50542 0.54334 Mdot
0 0 0 setrgbcolor
0.01723 setlinewidth
0.53263 0.55112 Mdot
0 0 0 setrgbcolor
0.01477 setlinewidth
0.51234 0.52156 Mdot
0 0 0 setrgbcolor
0.01272 setlinewidth
0.52376 0.5181 Mdot
0 0 0 setrgbcolor
0.00621 setlinewidth
0.53849 0.52806 Mdot
0 0 0 setrgbcolor
0.0146 setlinewidth
0.51169 0.54786 Mdot
0 0 0 setrgbcolor
0.00727 setlinewidth
0.50674 0.53951 Mdot
0 0 0 setrgbcolor
0.00995 setlinewidth
0.50964 0.52562 Mdot
0 0 0 setrgbcolor
0.0068 setlinewidth
0.52748 0.55067 Mdot
0 0 0 setrgbcolor
0.01065 setlinewidth
0.51427 0.54666 Mdot
0 0 0 setrgbcolor
0.01565 setlinewidth
0.51475 0.54633 Mdot
0 0 0 setrgbcolor
0.01778 setlinewidth
0.51653 0.52464 Mdot
0 0 0 setrgbcolor
0.01963 setlinewidth
0.52132 0.54675 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.51291 0.53859 Mdot
0 0 0 setrgbcolor
0.01327 setlinewidth
0.53043 0.52807 Mdot
0 0 0 setrgbcolor
0.01024 setlinewidth
0.53317 0.53749 Mdot
0 0 0 setrgbcolor
0.00687 setlinewidth
0.52737 0.54451 Mdot
0 0 0 setrgbcolor
0.00922 setlinewidth
0.53126 0.53029 Mdot
1 1 1 setrgbcolor
0.01075 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.01192 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.0182 setlinewidth
0.51646 0.53738 Mdot
0 0 0 setrgbcolor
0.01528 setlinewidth
0.51703 0.5307 Mdot
0 0 0 setrgbcolor
0.01436 setlinewidth
0.51764 0.5282 Mdot
0 0 0 setrgbcolor
0.01373 setlinewidth
0.53153 0.52932 Mdot
0 0 0 setrgbcolor
0.01187 setlinewidth
0.51686 0.52661 Mdot
0 0 0 setrgbcolor
0.00605 setlinewidth
0.51197 0.53097 Mdot
0 0 0 setrgbcolor
0.00518 setlinewidth
0.51765 0.5246 Mdot
0 0 0 setrgbcolor
0.01361 setlinewidth
0.52272 0.54739 Mdot
0 0 0 setrgbcolor
0.00556 setlinewidth
0.51306 0.54206 Mdot
0 0 0 setrgbcolor
0.01783 setlinewidth
0.52207 0.52313 Mdot
0 0 0 setrgbcolor
0.00747 setlinewidth
0.51521 0.54663 Mdot
0 0 0 setrgbcolor
0.00884 setlinewidth
0.52449 0.52165 Mdot
0 0 0 setrgbcolor
0.00742 setlinewidth
0.53711 0.53811 Mdot
0 0 0 setrgbcolor
0.01875 setlinewidth
0.51644 0.54863 Mdot
0 0 0 setrgbcolor
0.01045 setlinewidth
0.53284 0.54787 Mdot
0 0 0 setrgbcolor
0.01889 setlinewidth
0.53179 0.54918 Mdot
0 0 0 setrgbcolor
0.01857 setlinewidth
0.50815 0.52863 Mdot
0 0 0 setrgbcolor
0.00901 setlinewidth
0.52186 0.51877 Mdot
0 0 0 setrgbcolor
0.00714 setlinewidth
0.51728 0.51973 Mdot
0 0 0 setrgbcolor
0.01405 setlinewidth
0.52723 0.55212 Mdot
0 0 0 setrgbcolor
0.01787 setlinewidth
0.5358 0.54707 Mdot
0 0 0 setrgbcolor
0.01358 setlinewidth
0.54043 0.53146 Mdot
0 0 0 setrgbcolor
0.01954 setlinewidth
0.5151 0.55184 Mdot
0 0 0 setrgbcolor
0.01127 setlinewidth
0.52177 0.51702 Mdot
0 0 0 setrgbcolor
0.01917 setlinewidth
0.53039 0.55259 Mdot
0 0 0 setrgbcolor
0.00835 setlinewidth
0.52623 0.51683 Mdot
0 0 0 setrgbcolor
0.01322 setlinewidth
0.51668 0.51764 Mdot
0 0 0 setrgbcolor
0.00554 setlinewidth
0.5266 0.51607 Mdot
0 0 0 setrgbcolor
0.00755 setlinewidth
0.53171 0.55312 Mdot
0 0 0 setrgbcolor
0.01479 setlinewidth
0.54272 0.53192 Mdot
0 0 0 setrgbcolor
0.00792 setlinewidth
0.50429 0.52601 Mdot
0 0 0 setrgbcolor
0.01197 setlinewidth
0.50277 0.52949 Mdot
0 0 0 setrgbcolor
0.01638 setlinewidth
0.51795 0.51463 Mdot
0 0 0 setrgbcolor
0.01098 setlinewidth
0.52844 0.51439 Mdot
0 0 0 setrgbcolor
0.01098 setlinewidth
0.5036 0.52468 Mdot
0 0 0 setrgbcolor
0.01053 setlinewidth
0.52218 0.5131 Mdot
0 0 0 setrgbcolor
0.00703 setlinewidth
0.52561 0.55748 Mdot
0 0 0 setrgbcolor
0.01487 setlinewidth
0.52602 0.51273 Mdot
0 0 0 setrgbcolor
0.0144 setlinewidth
0.52275 0.51181 Mdot
0 0 0 setrgbcolor
0.01374 setlinewidth
0.51965 0.55898 Mdot
0 0 0 setrgbcolor
0.011 setlinewidth
0.52079 0.51145 Mdot
0 0 0 setrgbcolor
0.01585 setlinewidth
0.5235 0.51079 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.51872 0.5596 Mdot
0 0 0 setrgbcolor
0.00632 setlinewidth
0.52099 0.51072 Mdot
0 0 0 setrgbcolor
0.01459 setlinewidth
0.52654 0.51079 Mdot
0 0 0 setrgbcolor
0.01982 setlinewidth
0.5233 0.51055 Mdot
0 0 0 setrgbcolor
0.01252 setlinewidth
0.52203 0.51056 Mdot
0 0 0 setrgbcolor
0.01 setlinewidth
0.52426 0.5105 Mdot
0 0 0 setrgbcolor
0.01841 setlinewidth
0.52856 0.51108 Mdot
0 0 0 setrgbcolor
0.01062 setlinewidth
0.5222 0.51021 Mdot
0 0 0 setrgbcolor
0.0153 setlinewidth
0.52838 0.56 Mdot
0 0 0 setrgbcolor
0.01502 setlinewidth
0.52395 0.51015 Mdot
0 0 0 setrgbcolor
0.01865 setlinewidth
0.52913 0.51063 Mdot
0 0 0 setrgbcolor
0.00665 setlinewidth
0.53514 0.51271 Mdot
0 0 0 setrgbcolor
0.01591 setlinewidth
0.52061 0.50982 Mdot
0 0 0 setrgbcolor
0.0174 setlinewidth
0.54548 0.52282 Mdot
0 0 0 setrgbcolor
0.01922 setlinewidth
0.54213 0.51806 Mdot
0 0 0 setrgbcolor
0.0164 setlinewidth
0.52334 0.50948 Mdot
0 0 0 setrgbcolor
0.01932 setlinewidth
0.5249 0.5095 Mdot
0 0 0 setrgbcolor
0.00681 setlinewidth
0.54584 0.52286 Mdot
0 0 0 setrgbcolor
0.0054 setlinewidth
0.5244 0.5093 Mdot
0 0 0 setrgbcolor
0.01925 setlinewidth
0.54065 0.5548 Mdot
0 0 0 setrgbcolor
0.008 setlinewidth
0.51123 0.51178 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.54109 0.55545 Mdot
0 0 0 setrgbcolor
0.01406 setlinewidth
0.51022 0.51112 Mdot
0 0 0 setrgbcolor
0.01318 setlinewidth
0.51025 0.51107 Mdot
0 0 0 setrgbcolor
0.01551 setlinewidth
0.50892 0.51126 Mdot
0 0 0 setrgbcolor
0.01427 setlinewidth
0.51368 0.50895 Mdot
0 0 0 setrgbcolor
0.01756 setlinewidth
0.51728 0.50774 Mdot
0 0 0 setrgbcolor
0.01841 setlinewidth
0.51027 0.51011 Mdot
0 0 0 setrgbcolor
0.01016 setlinewidth
0.52681 0.50718 Mdot
0 0 0 setrgbcolor
0.01835 setlinewidth
0.52374 0.56384 Mdot
0 0 0 setrgbcolor
0.00589 setlinewidth
0.50588 0.51252 Mdot
0 0 0 setrgbcolor
0.00738 setlinewidth
0.49657 0.52396 Mdot
0 0 0 setrgbcolor
0.00597 setlinewidth
0.51068 0.50921 Mdot
0 0 0 setrgbcolor
0.00813 setlinewidth
0.54193 0.55746 Mdot
0 0 0 setrgbcolor
0.01016 setlinewidth
0.5032 0.51411 Mdot
0 0 0 setrgbcolor
0.01563 setlinewidth
0.54747 0.55124 Mdot
0 0 0 setrgbcolor
0.0126 setlinewidth
0.51628 0.50696 Mdot
0 0 0 setrgbcolor
0.01131 setlinewidth
0.51449 0.50736 Mdot
0 0 0 setrgbcolor
0.0096 setlinewidth
0.5505 0.54607 Mdot
0 0 0 setrgbcolor
0.00746 setlinewidth
0.49985 0.55361 Mdot
0 0 0 setrgbcolor
0.01859 setlinewidth
0.55065 0.52423 Mdot
0 0 0 setrgbcolor
0.01683 setlinewidth
0.5316 0.50674 Mdot
0 0 0 setrgbcolor
0.0166 setlinewidth
0.51033 0.50823 Mdot
0 0 0 setrgbcolor
0.01606 setlinewidth
0.55093 0.54676 Mdot
0 0 0 setrgbcolor
0.00821 setlinewidth
0.49485 0.54588 Mdot
0 0 0 setrgbcolor
0.00874 setlinewidth
0.52522 0.50513 Mdot
0 0 0 setrgbcolor
0.0096 setlinewidth
0.51209 0.5071 Mdot
0 0 0 setrgbcolor
0.01638 setlinewidth
0.5475 0.51728 Mdot
0 0 0 setrgbcolor
0.01243 setlinewidth
0.53328 0.50669 Mdot
0 0 0 setrgbcolor
0.0108 setlinewidth
0.54233 0.51176 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.53623 0.50785 Mdot
0 0 0 setrgbcolor
0.00803 setlinewidth
0.51826 0.50522 Mdot
0 0 0 setrgbcolor
0.00587 setlinewidth
0.54193 0.55937 Mdot
0 0 0 setrgbcolor
0.01599 setlinewidth
0.49273 0.5394 Mdot
0 0 0 setrgbcolor
0.00625 setlinewidth
0.52477 0.56602 Mdot
0 0 0 setrgbcolor
0.01927 setlinewidth
0.49342 0.54376 Mdot
0 0 0 setrgbcolor
0.00735 setlinewidth
0.52926 0.56559 Mdot
0 0 0 setrgbcolor
0.01815 setlinewidth
0.52491 0.56617 Mdot
0 0 0 setrgbcolor
0.01242 setlinewidth
0.51854 0.50481 Mdot
0 0 0 setrgbcolor
0.01167 setlinewidth
0.50161 0.55758 Mdot
0 0 0 setrgbcolor
0.00624 setlinewidth
0.52214 0.56625 Mdot
0 0 0 setrgbcolor
0.00698 setlinewidth
0.52299 0.50444 Mdot
0 0 0 setrgbcolor
0.01194 setlinewidth
0.53952 0.50916 Mdot
0 0 0 setrgbcolor
0.00598 setlinewidth
0.53675 0.5076 Mdot
0 0 0 setrgbcolor
0.00973 setlinewidth
0.54697 0.55501 Mdot
0 0 0 setrgbcolor
0.01939 setlinewidth
0.49407 0.54606 Mdot
0 0 0 setrgbcolor
0.0186 setlinewidth
0.5211 0.56621 Mdot
0 0 0 setrgbcolor
0.01212 setlinewidth
0.52658 0.56607 Mdot
0 0 0 setrgbcolor
0.01652 setlinewidth
0.49264 0.54072 Mdot
0 0 0 setrgbcolor
0.01437 setlinewidth
0.54873 0.55259 Mdot
0 0 0 setrgbcolor
0.0182 setlinewidth
0.54694 0.51586 Mdot
0 0 0 setrgbcolor
0.00537 setlinewidth
0.49686 0.55137 Mdot
0 0 0 setrgbcolor
0.01052 setlinewidth
0.54131 0.5601 Mdot
0 0 0 setrgbcolor
0.01838 setlinewidth
0.49337 0.54287 Mdot
0 0 0 setrgbcolor
0.01746 setlinewidth
0.54136 0.51077 Mdot
0 0 0 setrgbcolor
0.01997 setlinewidth
0.51456 0.56471 Mdot
0 0 0 setrgbcolor
0.01983 setlinewidth
0.55326 0.5317 Mdot
0 0 0 setrgbcolor
0.01757 setlinewidth
0.52304 0.50498 Mdot
0 0 0 setrgbcolor
0.01901 setlinewidth
0.51036 0.56282 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.54892 0.51971 Mdot
0 0 0 setrgbcolor
0.0076 setlinewidth
0.54055 0.55997 Mdot
0 0 0 setrgbcolor
0.00831 setlinewidth
0.54166 0.55914 Mdot
0 0 0 setrgbcolor
0.00701 setlinewidth
0.50104 0.51477 Mdot
0 0 0 setrgbcolor
0.00761 setlinewidth
0.54794 0.51848 Mdot
0 0 0 setrgbcolor
0.01948 setlinewidth
0.51 0.56221 Mdot
0 0 0 setrgbcolor
0.01658 setlinewidth
0.54889 0.55039 Mdot
0 0 0 setrgbcolor
0.01017 setlinewidth
0.52706 0.56492 Mdot
0 0 0 setrgbcolor
0.01909 setlinewidth
0.50596 0.51092 Mdot
0 0 0 setrgbcolor
0.01085 setlinewidth
0.54694 0.51743 Mdot
0 0 0 setrgbcolor
0.01525 setlinewidth
0.53154 0.50679 Mdot
0 0 0 setrgbcolor
0.008 setlinewidth
0.52386 0.56508 Mdot
0 0 0 setrgbcolor
0.01416 setlinewidth
0.50623 0.51094 Mdot
0 0 0 setrgbcolor
0.00589 setlinewidth
0.51732 0.56433 Mdot
0 0 0 setrgbcolor
0.01575 setlinewidth
0.53795 0.50985 Mdot
0 0 0 setrgbcolor
0.01191 setlinewidth
0.54066 0.55892 Mdot
0 0 0 setrgbcolor
0.01858 setlinewidth
0.54808 0.55075 Mdot
0 0 0 setrgbcolor
0.01536 setlinewidth
0.49596 0.54639 Mdot
0 0 0 setrgbcolor
0.01687 setlinewidth
0.50814 0.56028 Mdot
0 0 0 setrgbcolor
0.01127 setlinewidth
0.50521 0.55821 Mdot
0 0 0 setrgbcolor
0.01899 setlinewidth
0.54533 0.51672 Mdot
0 0 0 setrgbcolor
0.01522 setlinewidth
0.51932 0.564 Mdot
0 0 0 setrgbcolor
0.00932 setlinewidth
0.51621 0.56324 Mdot
0 0 0 setrgbcolor
0.01542 setlinewidth
0.49822 0.54967 Mdot
0 0 0 setrgbcolor
0.01394 setlinewidth
0.52368 0.5639 Mdot
0 0 0 setrgbcolor
0.01017 setlinewidth
0.53622 0.51007 Mdot
0 0 0 setrgbcolor
0.01194 setlinewidth
0.52729 0.50726 Mdot
0 0 0 setrgbcolor
0.00667 setlinewidth
0.4985 0.5488 Mdot
0 0 0 setrgbcolor
0.00672 setlinewidth
0.52607 0.56291 Mdot
0 0 0 setrgbcolor
0.00658 setlinewidth
0.49864 0.54838 Mdot
0 0 0 setrgbcolor
0.01908 setlinewidth
0.52041 0.56291 Mdot
0 0 0 setrgbcolor
0.0156 setlinewidth
0.49649 0.54256 Mdot
0 0 0 setrgbcolor
0.01945 setlinewidth
0.50159 0.51822 Mdot
0 0 0 setrgbcolor
0.0108 setlinewidth
0.54139 0.55583 Mdot
0 0 0 setrgbcolor
0.01036 setlinewidth
0.54664 0.52133 Mdot
0 0 0 setrgbcolor
0.00503 setlinewidth
0.54913 0.52691 Mdot
0 0 0 setrgbcolor
0.00559 setlinewidth
0.5498 0.52937 Mdot
0 0 0 setrgbcolor
0.01837 setlinewidth
0.54926 0.52812 Mdot
0 0 0 setrgbcolor
0.01582 setlinewidth
0.55001 0.53641 Mdot
0 0 0 setrgbcolor
0.01247 setlinewidth
0.54021 0.55597 Mdot
0 0 0 setrgbcolor
0.00501 setlinewidth
0.52762 0.56133 Mdot
0 0 0 setrgbcolor
0.00938 setlinewidth
0.51325 0.55978 Mdot
0 0 0 setrgbcolor
0.01601 setlinewidth
0.52453 0.50912 Mdot
0 0 0 setrgbcolor
0.00807 setlinewidth
0.50724 0.51451 Mdot
0 0 0 setrgbcolor
0.01634 setlinewidth
0.52813 0.56062 Mdot
0 0 0 setrgbcolor
0.01192 setlinewidth
0.52208 0.56068 Mdot
0 0 0 setrgbcolor
0.01901 setlinewidth
0.52082 0.56059 Mdot
0 0 0 setrgbcolor
0.01025 setlinewidth
0.5233 0.56053 Mdot
0 0 0 setrgbcolor
0.01882 setlinewidth
0.52326 0.56032 Mdot
0 0 0 setrgbcolor
0.01389 setlinewidth
0.50424 0.51917 Mdot
0 0 0 setrgbcolor
0.00949 setlinewidth
0.54471 0.54742 Mdot
0 0 0 setrgbcolor
0.01449 setlinewidth
0.50163 0.5467 Mdot
0 0 0 setrgbcolor
0.01931 setlinewidth
0.52731 0.55919 Mdot
0 0 0 setrgbcolor
0.00509 setlinewidth
0.53684 0.55523 Mdot
0 0 0 setrgbcolor
0.0085 setlinewidth
0.52123 0.55938 Mdot
0 0 0 setrgbcolor
0.01611 setlinewidth
0.53411 0.55639 Mdot
0 0 0 setrgbcolor
0.01087 setlinewidth
0.52232 0.55875 Mdot
0 0 0 setrgbcolor
0.01447 setlinewidth
0.54099 0.52132 Mdot
0 0 0 setrgbcolor
0.01417 setlinewidth
0.51553 0.51424 Mdot
0 0 0 setrgbcolor
0.01116 setlinewidth
0.50197 0.54256 Mdot
0 0 0 setrgbcolor
0.0107 setlinewidth
0.51643 0.55651 Mdot
0 0 0 setrgbcolor
0.0058 setlinewidth
0.52099 0.55724 Mdot
0 0 0 setrgbcolor
0.01604 setlinewidth
0.50499 0.52306 Mdot
0 0 0 setrgbcolor
0.01452 setlinewidth
0.50275 0.5277 Mdot
0 0 0 setrgbcolor
0.01889 setlinewidth
0.51849 0.55651 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.50828 0.55046 Mdot
0 0 0 setrgbcolor
0.01489 setlinewidth
0.51603 0.5177 Mdot
0 0 0 setrgbcolor
0.00513 setlinewidth
0.51038 0.54885 Mdot
0 0 0 setrgbcolor
0.01846 setlinewidth
0.51075 0.54844 Mdot
0 0 0 setrgbcolor
0.01485 setlinewidth
0.50911 0.52566 Mdot
0 0 0 setrgbcolor
0.01208 setlinewidth
0.53032 0.55065 Mdot
0 0 0 setrgbcolor
0.01962 setlinewidth
0.5074 0.54071 Mdot
0 0 0 setrgbcolor
0.01186 setlinewidth
0.52462 0.551 Mdot
0 0 0 setrgbcolor
0.00529 setlinewidth
0.53729 0.52897 Mdot
0 0 0 setrgbcolor
0.01041 setlinewidth
0.51727 0.54789 Mdot
0 0 0 setrgbcolor
0.01831 setlinewidth
0.53253 0.52577 Mdot
0 0 0 setrgbcolor
0.00663 setlinewidth
0.52296 0.54465 Mdot
0 0 0 setrgbcolor
0.00566 setlinewidth
0.52357 0.52709 Mdot
0 0 0 setrgbcolor
0.01738 setlinewidth
0.5247 0.52928 Mdot
0 0 0 setrgbcolor
0.01944 setlinewidth
0.52781 0.53646 Mdot
1 1 1 setrgbcolor
0.01192 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.00572 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00746 setlinewidth
0.52287 0.53801 Mdot
0 0 0 setrgbcolor
0.01045 setlinewidth
0.52239 0.53099 Mdot
0 0 0 setrgbcolor
0.00771 setlinewidth
0.51699 0.53208 Mdot
0 0 0 setrgbcolor
0.01474 setlinewidth
0.52255 0.52832 Mdot
0 0 0 setrgbcolor
0.00949 setlinewidth
0.51979 0.54341 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.52139 0.5268 Mdot
0 0 0 setrgbcolor
0.01457 setlinewidth
0.52178 0.5246 Mdot
0 0 0 setrgbcolor
0.01909 setlinewidth
0.51228 0.53027 Mdot
0 0 0 setrgbcolor
0.01948 setlinewidth
0.52251 0.54784 Mdot
0 0 0 setrgbcolor
0.0131 setlinewidth
0.52602 0.52239 Mdot
0 0 0 setrgbcolor
0.0115 setlinewidth
0.53043 0.54747 Mdot
0 0 0 setrgbcolor
0.00936 setlinewidth
0.52395 0.54973 Mdot
0 0 0 setrgbcolor
0.01226 setlinewidth
0.52811 0.52048 Mdot
0 0 0 setrgbcolor
0.01061 setlinewidth
0.53676 0.52735 Mdot
0 0 0 setrgbcolor
0.00918 setlinewidth
0.52014 0.51964 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.50619 0.53205 Mdot
0 0 0 setrgbcolor
0.00974 setlinewidth
0.50723 0.52821 Mdot
0 0 0 setrgbcolor
0.01518 setlinewidth
0.52466 0.51793 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.52262 0.5533 Mdot
0 0 0 setrgbcolor
0.00838 setlinewidth
0.51889 0.51758 Mdot
0 0 0 setrgbcolor
0.01 setlinewidth
0.50607 0.52695 Mdot
0 0 0 setrgbcolor
0.01895 setlinewidth
0.52405 0.51615 Mdot
0 0 0 setrgbcolor
0.01805 setlinewidth
0.53516 0.55174 Mdot
0 0 0 setrgbcolor
0.01146 setlinewidth
0.54345 0.53565 Mdot
0 0 0 setrgbcolor
0.01395 setlinewidth
0.54041 0.54646 Mdot
0 0 0 setrgbcolor
0.01155 setlinewidth
0.53948 0.54798 Mdot
0 0 0 setrgbcolor
0.01401 setlinewidth
0.52849 0.51527 Mdot
0 0 0 setrgbcolor
0.00753 setlinewidth
0.51927 0.5143 Mdot
0 0 0 setrgbcolor
0.01645 setlinewidth
0.52862 0.51443 Mdot
0 0 0 setrgbcolor
0.01188 setlinewidth
0.54311 0.54519 Mdot
0 0 0 setrgbcolor
0.00874 setlinewidth
0.53823 0.55177 Mdot
0 0 0 setrgbcolor
0.01982 setlinewidth
0.52315 0.51206 Mdot
0 0 0 setrgbcolor
0.01319 setlinewidth
0.54537 0.52825 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.53949 0.55213 Mdot
0 0 0 setrgbcolor
0.00942 setlinewidth
0.52985 0.51242 Mdot
0 0 0 setrgbcolor
0.01194 setlinewidth
0.52688 0.51109 Mdot
0 0 0 setrgbcolor
0.00617 setlinewidth
0.53345 0.55763 Mdot
0 0 0 setrgbcolor
0.01206 setlinewidth
0.52324 0.51066 Mdot
0 0 0 setrgbcolor
0.0174 setlinewidth
0.52106 0.5106 Mdot
0 0 0 setrgbcolor
0.00958 setlinewidth
0.52724 0.56011 Mdot
0 0 0 setrgbcolor
0.01826 setlinewidth
0.54743 0.5284 Mdot
0 0 0 setrgbcolor
0.01697 setlinewidth
0.52096 0.50982 Mdot
0 0 0 setrgbcolor
0.00699 setlinewidth
0.52618 0.56091 Mdot
0 0 0 setrgbcolor
0.01444 setlinewidth
0.52357 0.5095 Mdot
0 0 0 setrgbcolor
0.01409 setlinewidth
0.52198 0.5095 Mdot
0 0 0 setrgbcolor
0.01001 setlinewidth
0.5107 0.51248 Mdot
0 0 0 setrgbcolor
0.007 setlinewidth
0.52327 0.50929 Mdot
0 0 0 setrgbcolor
0.01291 setlinewidth
0.52199 0.50912 Mdot
0 0 0 setrgbcolor
0.0097 setlinewidth
0.52422 0.50909 Mdot
0 0 0 setrgbcolor
0.01968 setlinewidth
0.52017 0.50897 Mdot
0 0 0 setrgbcolor
0.01583 setlinewidth
0.5266 0.50903 Mdot
0 0 0 setrgbcolor
0.01192 setlinewidth
0.52376 0.50879 Mdot
0 0 0 setrgbcolor
0.01975 setlinewidth
0.52868 0.50902 Mdot
0 0 0 setrgbcolor
0.01129 setlinewidth
0.52282 0.5082 Mdot
0 0 0 setrgbcolor
0.01904 setlinewidth
0.5092 0.51199 Mdot
0 0 0 setrgbcolor
0.01973 setlinewidth
0.5092 0.51193 Mdot
0 0 0 setrgbcolor
0.01731 setlinewidth
0.5244 0.50797 Mdot
0 0 0 setrgbcolor
0.00573 setlinewidth
0.52381 0.50785 Mdot
0 0 0 setrgbcolor
0.01761 setlinewidth
0.52903 0.50848 Mdot
0 0 0 setrgbcolor
0.01049 setlinewidth
0.49666 0.52745 Mdot
0 0 0 setrgbcolor
0.00867 setlinewidth
0.53592 0.55988 Mdot
0 0 0 setrgbcolor
0.01466 setlinewidth
0.50768 0.51235 Mdot
0 0 0 setrgbcolor
0.01616 setlinewidth
0.5045 0.51415 Mdot
0 0 0 setrgbcolor
0.00736 setlinewidth
0.50871 0.51096 Mdot
0 0 0 setrgbcolor
0.01084 setlinewidth
0.51212 0.50922 Mdot
0 0 0 setrgbcolor
0.01797 setlinewidth
0.53541 0.5097 Mdot
0 0 0 setrgbcolor
0.00582 setlinewidth
0.50174 0.51624 Mdot
0 0 0 setrgbcolor
0.00576 setlinewidth
0.5155 0.5074 Mdot
0 0 0 setrgbcolor
0.00589 setlinewidth
0.50866 0.50998 Mdot
0 0 0 setrgbcolor
0.01561 setlinewidth
0.54333 0.51417 Mdot
0 0 0 setrgbcolor
0.01939 setlinewidth
0.50411 0.55769 Mdot
0 0 0 setrgbcolor
0.01582 setlinewidth
0.54752 0.5186 Mdot
0 0 0 setrgbcolor
0.00688 setlinewidth
0.54732 0.55264 Mdot
0 0 0 setrgbcolor
0.01884 setlinewidth
0.49741 0.55048 Mdot
0 0 0 setrgbcolor
0.00941 setlinewidth
0.54779 0.5186 Mdot
0 0 0 setrgbcolor
0.01692 setlinewidth
0.51204 0.50748 Mdot
0 0 0 setrgbcolor
0.00952 setlinewidth
0.51385 0.50678 Mdot
0 0 0 setrgbcolor
0.01122 setlinewidth
0.52501 0.50534 Mdot
0 0 0 setrgbcolor
0.01504 setlinewidth
0.53055 0.56466 Mdot
0 0 0 setrgbcolor
0.01262 setlinewidth
0.5476 0.55327 Mdot
0 0 0 setrgbcolor
0.01646 setlinewidth
0.50747 0.50908 Mdot
0 0 0 setrgbcolor
0.00601 setlinewidth
0.49373 0.54413 Mdot
0 0 0 setrgbcolor
0.01359 setlinewidth
0.50877 0.50765 Mdot
0 0 0 setrgbcolor
0.01617 setlinewidth
0.4947 0.54857 Mdot
0 0 0 setrgbcolor
0.01526 setlinewidth
0.52896 0.50419 Mdot
0 0 0 setrgbcolor
0.01229 setlinewidth
0.54783 0.5553 Mdot
0 0 0 setrgbcolor
0.0129 setlinewidth
0.51451 0.50475 Mdot
0 0 0 setrgbcolor
0.01012 setlinewidth
0.52182 0.50355 Mdot
0 0 0 setrgbcolor
0.01323 setlinewidth
0.49517 0.5509 Mdot
0 0 0 setrgbcolor
0.00554 setlinewidth
0.5525 0.54799 Mdot
0 0 0 setrgbcolor
0.01419 setlinewidth
0.49273 0.54559 Mdot
0 0 0 setrgbcolor
0.01356 setlinewidth
0.5048 0.56167 Mdot
0 0 0 setrgbcolor
0.01532 setlinewidth
0.53014 0.50392 Mdot
0 0 0 setrgbcolor
0.00948 setlinewidth
0.5546 0.54216 Mdot
0 0 0 setrgbcolor
0.00653 setlinewidth
0.51405 0.50433 Mdot
0 0 0 setrgbcolor
0.01088 setlinewidth
0.55119 0.5194 Mdot
0 0 0 setrgbcolor
0.00638 setlinewidth
0.53324 0.50466 Mdot
0 0 0 setrgbcolor
0.00583 setlinewidth
0.53016 0.56691 Mdot
0 0 0 setrgbcolor
0.01578 setlinewidth
0.54011 0.50777 Mdot
0 0 0 setrgbcolor
0.01464 setlinewidth
0.49314 0.54776 Mdot
0 0 0 setrgbcolor
0.01956 setlinewidth
0.4981 0.55603 Mdot
0 0 0 setrgbcolor
0.0066 setlinewidth
0.51836 0.50326 Mdot
0 0 0 setrgbcolor
0.0175 setlinewidth
0.55466 0.54284 Mdot
0 0 0 setrgbcolor
0.00873 setlinewidth
0.54633 0.5127 Mdot
0 0 0 setrgbcolor
0.01553 setlinewidth
0.52998 0.56707 Mdot
0 0 0 setrgbcolor
0.01652 setlinewidth
0.54694 0.55738 Mdot
0 0 0 setrgbcolor
0.00881 setlinewidth
0.52698 0.56758 Mdot
0 0 0 setrgbcolor
0.00678 setlinewidth
0.53434 0.56581 Mdot
0 0 0 setrgbcolor
0.01045 setlinewidth
0.52559 0.56773 Mdot
0 0 0 setrgbcolor
0.0191 setlinewidth
0.53272 0.5044 Mdot
0 0 0 setrgbcolor
0.01543 setlinewidth
0.49602 0.51752 Mdot
0 0 0 setrgbcolor
0.00556 setlinewidth
0.53106 0.56676 Mdot
0 0 0 setrgbcolor
0.01494 setlinewidth
0.53587 0.50558 Mdot
0 0 0 setrgbcolor
0.01806 setlinewidth
0.51783 0.56721 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.51294 0.56591 Mdot
0 0 0 setrgbcolor
0.00752 setlinewidth
0.50014 0.51279 Mdot
0 0 0 setrgbcolor
0.01051 setlinewidth
0.49507 0.5511 Mdot
0 0 0 setrgbcolor
0.01188 setlinewidth
0.5003 0.51277 Mdot
0 0 0 setrgbcolor
0.00982 setlinewidth
0.55038 0.55216 Mdot
0 0 0 setrgbcolor
0.00616 setlinewidth
0.51705 0.50392 Mdot
0 0 0 setrgbcolor
0.00731 setlinewidth
0.51213 0.56535 Mdot
0 0 0 setrgbcolor
0.01083 setlinewidth
0.49753 0.55418 Mdot
0 0 0 setrgbcolor
0.00959 setlinewidth
0.55149 0.54939 Mdot
0 0 0 setrgbcolor
0.00931 setlinewidth
0.50609 0.56197 Mdot
0 0 0 setrgbcolor
0.009 setlinewidth
0.54371 0.51144 Mdot
0 0 0 setrgbcolor
0.01222 setlinewidth
0.54464 0.55836 Mdot
0 0 0 setrgbcolor
0.01736 setlinewidth
0.53693 0.50704 Mdot
0 0 0 setrgbcolor
0.0077 setlinewidth
0.50941 0.56368 Mdot
0 0 0 setrgbcolor
0.01698 setlinewidth
0.49736 0.55327 Mdot
0 0 0 setrgbcolor
0.00867 setlinewidth
0.51966 0.56647 Mdot
0 0 0 setrgbcolor
0.0132 setlinewidth
0.49416 0.54712 Mdot
0 0 0 setrgbcolor
0.0064 setlinewidth
0.49729 0.55282 Mdot
0 0 0 setrgbcolor
0.00526 setlinewidth
0.52656 0.56626 Mdot
0 0 0 setrgbcolor
0.01879 setlinewidth
0.52986 0.56561 Mdot
0 0 0 setrgbcolor
0.01933 setlinewidth
0.49558 0.52112 Mdot
0 0 0 setrgbcolor
0.00542 setlinewidth
0.52546 0.5045 Mdot
0 0 0 setrgbcolor
0.01294 setlinewidth
0.51787 0.56555 Mdot
0 0 0 setrgbcolor
0.0103 setlinewidth
0.54316 0.5584 Mdot
0 0 0 setrgbcolor
0.01864 setlinewidth
0.52124 0.56586 Mdot
0 0 0 setrgbcolor
0.01292 setlinewidth
0.54417 0.55737 Mdot
0 0 0 setrgbcolor
0.01078 setlinewidth
0.54552 0.5152 Mdot
0 0 0 setrgbcolor
0.01408 setlinewidth
0.55202 0.52699 Mdot
0 0 0 setrgbcolor
0.01026 setlinewidth
0.53227 0.50669 Mdot
0 0 0 setrgbcolor
0.00938 setlinewidth
0.54419 0.51408 Mdot
0 0 0 setrgbcolor
0.01804 setlinewidth
0.52548 0.56512 Mdot
0 0 0 setrgbcolor
0.01743 setlinewidth
0.52039 0.50571 Mdot
0 0 0 setrgbcolor
0.01422 setlinewidth
0.54283 0.51315 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.50025 0.51643 Mdot
0 0 0 setrgbcolor
0.01591 setlinewidth
0.54994 0.54718 Mdot
0 0 0 setrgbcolor
0.01297 setlinewidth
0.54251 0.55734 Mdot
0 0 0 setrgbcolor
0.00772 setlinewidth
0.52161 0.56461 Mdot
0 0 0 setrgbcolor
0.01034 setlinewidth
0.49751 0.52176 Mdot
0 0 0 setrgbcolor
0.00587 setlinewidth
0.52995 0.50723 Mdot
0 0 0 setrgbcolor
0.01679 setlinewidth
0.51333 0.56247 Mdot
0 0 0 setrgbcolor
0.01246 setlinewidth
0.52738 0.56376 Mdot
0 0 0 setrgbcolor
0.01936 setlinewidth
0.49893 0.55071 Mdot
0 0 0 setrgbcolor
0.01351 setlinewidth
0.54055 0.51271 Mdot
0 0 0 setrgbcolor
0.01561 setlinewidth
0.5488 0.5477 Mdot
0 0 0 setrgbcolor
0.0071 setlinewidth
0.517 0.50815 Mdot
0 0 0 setrgbcolor
0.01691 setlinewidth
0.49817 0.5464 Mdot
0 0 0 setrgbcolor
0.01953 setlinewidth
0.5282 0.56192 Mdot
0 0 0 setrgbcolor
0.01429 setlinewidth
0.52084 0.5622 Mdot
0 0 0 setrgbcolor
0.01255 setlinewidth
0.49656 0.53088 Mdot
0 0 0 setrgbcolor
0.00572 setlinewidth
0.52214 0.56211 Mdot
0 0 0 setrgbcolor
0.01948 setlinewidth
0.49815 0.52573 Mdot
0 0 0 setrgbcolor
0.01841 setlinewidth
0.54181 0.55408 Mdot
0 0 0 setrgbcolor
0.01211 setlinewidth
0.52331 0.56177 Mdot
0 0 0 setrgbcolor
0.01787 setlinewidth
0.52841 0.56112 Mdot
0 0 0 setrgbcolor
0.01546 setlinewidth
0.52317 0.56156 Mdot
0 0 0 setrgbcolor
0.0191 setlinewidth
0.54184 0.51736 Mdot
0 0 0 setrgbcolor
0.01476 setlinewidth
0.54038 0.55442 Mdot
0 0 0 setrgbcolor
0.01008 setlinewidth
0.52072 0.5609 Mdot
0 0 0 setrgbcolor
0.00552 setlinewidth
0.5076 0.51494 Mdot
0 0 0 setrgbcolor
0.01875 setlinewidth
0.54524 0.52278 Mdot
0 0 0 setrgbcolor
0.01373 setlinewidth
0.50553 0.55366 Mdot
0 0 0 setrgbcolor
0.01732 setlinewidth
0.5463 0.52524 Mdot
0 0 0 setrgbcolor
0.00522 setlinewidth
0.54546 0.52403 Mdot
0 0 0 setrgbcolor
0.01778 setlinewidth
0.52156 0.5601 Mdot
0 0 0 setrgbcolor
0.0168 setlinewidth
0.52691 0.55979 Mdot
0 0 0 setrgbcolor
0.01206 setlinewidth
0.51495 0.55869 Mdot
0 0 0 setrgbcolor
0.01782 setlinewidth
0.54743 0.53256 Mdot
0 0 0 setrgbcolor
0.01954 setlinewidth
0.51693 0.55838 Mdot
0 0 0 setrgbcolor
0.01442 setlinewidth
0.51965 0.55876 Mdot
0 0 0 setrgbcolor
0.0092 setlinewidth
0.50696 0.5517 Mdot
0 0 0 setrgbcolor
0.01337 setlinewidth
0.53329 0.55586 Mdot
0 0 0 setrgbcolor
0.00936 setlinewidth
0.53601 0.55423 Mdot
0 0 0 setrgbcolor
0.01629 setlinewidth
0.50799 0.5185 Mdot
0 0 0 setrgbcolor
0.01434 setlinewidth
0.50189 0.52785 Mdot
0 0 0 setrgbcolor
0.01778 setlinewidth
0.50718 0.55123 Mdot
0 0 0 setrgbcolor
0.0153 setlinewidth
0.5024 0.54373 Mdot
0 0 0 setrgbcolor
0.01102 setlinewidth
0.54301 0.54488 Mdot
0 0 0 setrgbcolor
0.01613 setlinewidth
0.53468 0.51832 Mdot
0 0 0 setrgbcolor
0.00605 setlinewidth
0.5132 0.54971 Mdot
0 0 0 setrgbcolor
0.01907 setlinewidth
0.52137 0.5518 Mdot
0 0 0 setrgbcolor
0.00679 setlinewidth
0.52728 0.55056 Mdot
0 0 0 setrgbcolor
0.01399 setlinewidth
0.53087 0.52695 Mdot
0 0 0 setrgbcolor
0.01944 setlinewidth
0.5181 0.5455 Mdot
0 0 0 setrgbcolor
0.00879 setlinewidth
0.52528 0.52438 Mdot
0 0 0 setrgbcolor
0.01737 setlinewidth
0.51596 0.52716 Mdot
0 0 0 setrgbcolor
0.01254 setlinewidth
0.51735 0.52927 Mdot
0 0 0 setrgbcolor
0.01965 setlinewidth
0.52156 0.53626 Mdot
1 1 1 setrgbcolor
0.00572 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.01566 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01278 setlinewidth
0.52292 0.5324 Mdot
0 0 0 setrgbcolor
0.00583 setlinewidth
0.51754 0.53128 Mdot
0 0 0 setrgbcolor
0.01984 setlinewidth
0.52834 0.53044 Mdot
0 0 0 setrgbcolor
0.00882 setlinewidth
0.52995 0.53765 Mdot
0 0 0 setrgbcolor
0.0182 setlinewidth
0.52799 0.52765 Mdot
0 0 0 setrgbcolor
0.01198 setlinewidth
0.52741 0.54374 Mdot
0 0 0 setrgbcolor
0.01928 setlinewidth
0.52649 0.52626 Mdot
0 0 0 setrgbcolor
0.01925 setlinewidth
0.52641 0.52392 Mdot
0 0 0 setrgbcolor
0.0093 setlinewidth
0.51108 0.5341 Mdot
0 0 0 setrgbcolor
0.01761 setlinewidth
0.51152 0.52996 Mdot
0 0 0 setrgbcolor
0.01703 setlinewidth
0.53058 0.54795 Mdot
0 0 0 setrgbcolor
0.00886 setlinewidth
0.50993 0.52886 Mdot
0 0 0 setrgbcolor
0.00675 setlinewidth
0.53018 0.52099 Mdot
0 0 0 setrgbcolor
0.01676 setlinewidth
0.52349 0.51907 Mdot
0 0 0 setrgbcolor
0.00637 setlinewidth
0.53216 0.54971 Mdot
0 0 0 setrgbcolor
0.01434 setlinewidth
0.52161 0.51715 Mdot
0 0 0 setrgbcolor
0.01112 setlinewidth
0.53176 0.51871 Mdot
0 0 0 setrgbcolor
0.01315 setlinewidth
0.53844 0.54637 Mdot
0 0 0 setrgbcolor
0.00645 setlinewidth
0.52764 0.51661 Mdot
0 0 0 setrgbcolor
0.00989 setlinewidth
0.53092 0.55365 Mdot
0 0 0 setrgbcolor
0.01861 setlinewidth
0.52649 0.51487 Mdot
0 0 0 setrgbcolor
0.01149 setlinewidth
0.54162 0.52449 Mdot
0 0 0 setrgbcolor
0.00725 setlinewidth
0.52099 0.51373 Mdot
0 0 0 setrgbcolor
0.00572 setlinewidth
0.53062 0.51328 Mdot
0 0 0 setrgbcolor
0.00957 setlinewidth
0.53046 0.5124 Mdot
0 0 0 setrgbcolor
0.00993 setlinewidth
0.5242 0.51082 Mdot
0 0 0 setrgbcolor
0.0164 setlinewidth
0.5431 0.55015 Mdot
0 0 0 setrgbcolor
0.01109 setlinewidth
0.49855 0.53095 Mdot
0 0 0 setrgbcolor
0.01472 setlinewidth
0.51096 0.51325 Mdot
0 0 0 setrgbcolor
0.00686 setlinewidth
0.52151 0.50966 Mdot
0 0 0 setrgbcolor
0.01892 setlinewidth
0.54688 0.54558 Mdot
0 0 0 setrgbcolor
0.01396 setlinewidth
0.54761 0.54386 Mdot
0 0 0 setrgbcolor
0.00731 setlinewidth
0.52376 0.50938 Mdot
0 0 0 setrgbcolor
0.01378 setlinewidth
0.54909 0.53214 Mdot
0 0 0 setrgbcolor
0.00518 setlinewidth
0.53094 0.51016 Mdot
0 0 0 setrgbcolor
0.00735 setlinewidth
0.50901 0.513 Mdot
0 0 0 setrgbcolor
0.00966 setlinewidth
0.52756 0.50925 Mdot
0 0 0 setrgbcolor
0.01331 setlinewidth
0.50899 0.51293 Mdot
0 0 0 setrgbcolor
0.00968 setlinewidth
0.52108 0.50888 Mdot
0 0 0 setrgbcolor
0.01572 setlinewidth
0.50736 0.51361 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.54587 0.54974 Mdot
0 0 0 setrgbcolor
0.0137 setlinewidth
0.52199 0.50839 Mdot
0 0 0 setrgbcolor
0.00523 setlinewidth
0.50423 0.51599 Mdot
0 0 0 setrgbcolor
0.01461 setlinewidth
0.52362 0.50815 Mdot
0 0 0 setrgbcolor
0.01819 setlinewidth
0.50159 0.51859 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.52184 0.508 Mdot
0 0 0 setrgbcolor
0.01083 setlinewidth
0.52322 0.50797 Mdot
0 0 0 setrgbcolor
0.00761 setlinewidth
0.51988 0.50813 Mdot
0 0 0 setrgbcolor
0.01767 setlinewidth
0.54986 0.54215 Mdot
0 0 0 setrgbcolor
0.01007 setlinewidth
0.53532 0.56013 Mdot
0 0 0 setrgbcolor
0.01931 setlinewidth
0.5241 0.50763 Mdot
0 0 0 setrgbcolor
0.01256 setlinewidth
0.50797 0.51204 Mdot
0 0 0 setrgbcolor
0.00622 setlinewidth
0.52349 0.50739 Mdot
0 0 0 setrgbcolor
0.00679 setlinewidth
0.54698 0.54994 Mdot
0 0 0 setrgbcolor
0.00608 setlinewidth
0.54141 0.55659 Mdot
0 0 0 setrgbcolor
0.01348 setlinewidth
0.5342 0.56113 Mdot
0 0 0 setrgbcolor
0.01538 setlinewidth
0.51114 0.50969 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.52643 0.5072 Mdot
0 0 0 setrgbcolor
0.00716 setlinewidth
0.52227 0.50694 Mdot
0 0 0 setrgbcolor
0.00602 setlinewidth
0.54933 0.5242 Mdot
0 0 0 setrgbcolor
0.00672 setlinewidth
0.50193 0.55476 Mdot
0 0 0 setrgbcolor
0.00602 setlinewidth
0.52376 0.50646 Mdot
0 0 0 setrgbcolor
0.00624 setlinewidth
0.50743 0.51105 Mdot
0 0 0 setrgbcolor
0.00815 setlinewidth
0.52311 0.50643 Mdot
0 0 0 setrgbcolor
0.00561 setlinewidth
0.51006 0.56121 Mdot
0 0 0 setrgbcolor
0.00711 setlinewidth
0.52843 0.50687 Mdot
0 0 0 setrgbcolor
0.01562 setlinewidth
0.51405 0.5073 Mdot
0 0 0 setrgbcolor
0.01129 setlinewidth
0.49679 0.54877 Mdot
0 0 0 setrgbcolor
0.00722 setlinewidth
0.52851 0.50627 Mdot
0 0 0 setrgbcolor
0.012 setlinewidth
0.551 0.52406 Mdot
0 0 0 setrgbcolor
0.00906 setlinewidth
0.5101 0.50796 Mdot
0 0 0 setrgbcolor
0.0054 setlinewidth
0.51181 0.50695 Mdot
0 0 0 setrgbcolor
0.01621 setlinewidth
0.50539 0.51035 Mdot
0 0 0 setrgbcolor
0.01876 setlinewidth
0.498 0.55326 Mdot
0 0 0 setrgbcolor
0.01284 setlinewidth
0.54338 0.55863 Mdot
0 0 0 setrgbcolor
0.0163 setlinewidth
0.53486 0.50656 Mdot
0 0 0 setrgbcolor
0.0178 setlinewidth
0.50608 0.50869 Mdot
0 0 0 setrgbcolor
0.01263 setlinewidth
0.5229 0.50371 Mdot
0 0 0 setrgbcolor
0.00967 setlinewidth
0.49487 0.55052 Mdot
0 0 0 setrgbcolor
0.0067 setlinewidth
0.49825 0.55564 Mdot
0 0 0 setrgbcolor
0.01395 setlinewidth
0.5433 0.50999 Mdot
0 0 0 setrgbcolor
0.01293 setlinewidth
0.53756 0.5645 Mdot
0 0 0 setrgbcolor
0.01709 setlinewidth
0.51097 0.50483 Mdot
0 0 0 setrgbcolor
0.00672 setlinewidth
0.54811 0.51396 Mdot
0 0 0 setrgbcolor
0.00609 setlinewidth
0.50953 0.56537 Mdot
0 0 0 setrgbcolor
0.00944 setlinewidth
0.54828 0.51392 Mdot
0 0 0 setrgbcolor
0.01424 setlinewidth
0.49491 0.55276 Mdot
0 0 0 setrgbcolor
0.0061 setlinewidth
0.55308 0.54942 Mdot
0 0 0 setrgbcolor
0.01966 setlinewidth
0.51817 0.50244 Mdot
0 0 0 setrgbcolor
0.00627 setlinewidth
0.50114 0.56058 Mdot
0 0 0 setrgbcolor
0.00707 setlinewidth
0.52564 0.50198 Mdot
0 0 0 setrgbcolor
0.00883 setlinewidth
0.55316 0.55006 Mdot
0 0 0 setrgbcolor
0.01459 setlinewidth
0.50973 0.50452 Mdot
0 0 0 setrgbcolor
0.01918 setlinewidth
0.49236 0.52107 Mdot
0 0 0 setrgbcolor
0.00831 setlinewidth
0.52619 0.50155 Mdot
0 0 0 setrgbcolor
0.01381 setlinewidth
0.51357 0.50276 Mdot
0 0 0 setrgbcolor
0.00734 setlinewidth
0.52925 0.50185 Mdot
0 0 0 setrgbcolor
0.01769 setlinewidth
0.55269 0.55222 Mdot
0 0 0 setrgbcolor
0.00715 setlinewidth
0.53564 0.56704 Mdot
0 0 0 setrgbcolor
0.00616 setlinewidth
0.49599 0.55603 Mdot
0 0 0 setrgbcolor
0.01396 setlinewidth
0.49532 0.51557 Mdot
0 0 0 setrgbcolor
0.00734 setlinewidth
0.49533 0.51554 Mdot
0 0 0 setrgbcolor
0.01002 setlinewidth
0.53205 0.56825 Mdot
0 0 0 setrgbcolor
0.00908 setlinewidth
0.55609 0.54391 Mdot
0 0 0 setrgbcolor
0.00537 setlinewidth
0.53511 0.56725 Mdot
0 0 0 setrgbcolor
0.01224 setlinewidth
0.5365 0.50402 Mdot
0 0 0 setrgbcolor
0.01492 setlinewidth
0.53038 0.56863 Mdot
0 0 0 setrgbcolor
0.005 setlinewidth
0.49849 0.55889 Mdot
0 0 0 setrgbcolor
0.00689 setlinewidth
0.54987 0.51436 Mdot
0 0 0 setrgbcolor
0.00888 setlinewidth
0.53919 0.56531 Mdot
0 0 0 setrgbcolor
0.01017 setlinewidth
0.55702 0.53754 Mdot
0 0 0 setrgbcolor
0.00892 setlinewidth
0.51647 0.5687 Mdot
0 0 0 setrgbcolor
0.01985 setlinewidth
0.52179 0.5693 Mdot
0 0 0 setrgbcolor
0.01532 setlinewidth
0.54345 0.50818 Mdot
0 0 0 setrgbcolor
0.01833 setlinewidth
0.49357 0.55212 Mdot
0 0 0 setrgbcolor
0.00843 setlinewidth
0.49784 0.558 Mdot
0 0 0 setrgbcolor
0.0066 setlinewidth
0.52761 0.50174 Mdot
0 0 0 setrgbcolor
0.01398 setlinewidth
0.51086 0.50375 Mdot
0 0 0 setrgbcolor
0.0053 setlinewidth
0.49085 0.52498 Mdot
0 0 0 setrgbcolor
0.01319 setlinewidth
0.51521 0.56827 Mdot
0 0 0 setrgbcolor
0.0158 setlinewidth
0.49755 0.55755 Mdot
0 0 0 setrgbcolor
0.01507 setlinewidth
0.53548 0.56683 Mdot
0 0 0 setrgbcolor
0.00539 setlinewidth
0.53096 0.50247 Mdot
0 0 0 setrgbcolor
0.01187 setlinewidth
0.55087 0.55462 Mdot
0 0 0 setrgbcolor
0.01911 setlinewidth
0.50821 0.56569 Mdot
0 0 0 setrgbcolor
0.01727 setlinewidth
0.55665 0.53828 Mdot
0 0 0 setrgbcolor
0.01461 setlinewidth
0.51173 0.56697 Mdot
0 0 0 setrgbcolor
0.01963 setlinewidth
0.49413 0.51946 Mdot
0 0 0 setrgbcolor
0.01796 setlinewidth
0.52246 0.56835 Mdot
0 0 0 setrgbcolor
0.00521 setlinewidth
0.49187 0.52543 Mdot
0 0 0 setrgbcolor
0.00606 setlinewidth
0.51859 0.5031 Mdot
0 0 0 setrgbcolor
0.01252 setlinewidth
0.52006 0.56769 Mdot
0 0 0 setrgbcolor
0.0146 setlinewidth
0.53108 0.50391 Mdot
0 0 0 setrgbcolor
0.01214 setlinewidth
0.5293 0.5671 Mdot
0 0 0 setrgbcolor
0.00725 setlinewidth
0.4976 0.55521 Mdot
0 0 0 setrgbcolor
0.0157 setlinewidth
0.52348 0.56751 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.55232 0.54874 Mdot
0 0 0 setrgbcolor
0.01113 setlinewidth
0.53872 0.50742 Mdot
0 0 0 setrgbcolor
0.01166 setlinewidth
0.5325 0.56593 Mdot
0 0 0 setrgbcolor
0.01862 setlinewidth
0.51296 0.5052 Mdot
0 0 0 setrgbcolor
0.00871 setlinewidth
0.54686 0.55613 Mdot
0 0 0 setrgbcolor
0.00635 setlinewidth
0.49157 0.53508 Mdot
0 0 0 setrgbcolor
0.01506 setlinewidth
0.49568 0.5509 Mdot
0 0 0 setrgbcolor
0.0172 setlinewidth
0.55263 0.54572 Mdot
0 0 0 setrgbcolor
0.00587 setlinewidth
0.49234 0.5295 Mdot
0 0 0 setrgbcolor
0.00707 setlinewidth
0.51409 0.56524 Mdot
0 0 0 setrgbcolor
0.01225 setlinewidth
0.52536 0.50434 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.52731 0.56613 Mdot
0 0 0 setrgbcolor
0.01142 setlinewidth
0.52303 0.5662 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.50912 0.50831 Mdot
0 0 0 setrgbcolor
0.0179 setlinewidth
0.54469 0.55644 Mdot
0 0 0 setrgbcolor
0.01594 setlinewidth
0.52256 0.50531 Mdot
0 0 0 setrgbcolor
0.01776 setlinewidth
0.54552 0.55522 Mdot
0 0 0 setrgbcolor
0.00632 setlinewidth
0.54022 0.51111 Mdot
0 0 0 setrgbcolor
0.00829 setlinewidth
0.52854 0.56447 Mdot
0 0 0 setrgbcolor
0.01035 setlinewidth
0.49994 0.51687 Mdot
0 0 0 setrgbcolor
0.0107 setlinewidth
0.53858 0.51017 Mdot
0 0 0 setrgbcolor
0.0168 setlinewidth
0.53694 0.50942 Mdot
0 0 0 setrgbcolor
0.0138 setlinewidth
0.50371 0.55735 Mdot
0 0 0 setrgbcolor
0.01948 setlinewidth
0.54865 0.52238 Mdot
0 0 0 setrgbcolor
0.01495 setlinewidth
0.52102 0.56388 Mdot
0 0 0 setrgbcolor
0.01402 setlinewidth
0.54324 0.55548 Mdot
0 0 0 setrgbcolor
0.01566 setlinewidth
0.52227 0.56359 Mdot
0 0 0 setrgbcolor
0.00586 setlinewidth
0.53406 0.50935 Mdot
0 0 0 setrgbcolor
0.00898 setlinewidth
0.4954 0.53119 Mdot
0 0 0 setrgbcolor
0.01279 setlinewidth
0.5233 0.56307 Mdot
0 0 0 setrgbcolor
0.01733 setlinewidth
0.5285 0.56248 Mdot
0 0 0 setrgbcolor
0.01999 setlinewidth
0.49832 0.54758 Mdot
0 0 0 setrgbcolor
0.0168 setlinewidth
0.52307 0.56288 Mdot
0 0 0 setrgbcolor
0.0086 setlinewidth
0.54928 0.54376 Mdot
0 0 0 setrgbcolor
0.0197 setlinewidth
0.51387 0.56116 Mdot
0 0 0 setrgbcolor
0.01541 setlinewidth
0.52032 0.56258 Mdot
0 0 0 setrgbcolor
0.00951 setlinewidth
0.50429 0.55515 Mdot
0 0 0 setrgbcolor
0.00744 setlinewidth
0.50018 0.52056 Mdot
0 0 0 setrgbcolor
0.01213 setlinewidth
0.50434 0.55463 Mdot
0 0 0 setrgbcolor
0.00674 setlinewidth
0.52837 0.56163 Mdot
0 0 0 setrgbcolor
0.01178 setlinewidth
0.54785 0.54451 Mdot
0 0 0 setrgbcolor
0.01105 setlinewidth
0.52083 0.56164 Mdot
0 0 0 setrgbcolor
0.0145 setlinewidth
0.51563 0.56057 Mdot
0 0 0 setrgbcolor
0.0195 setlinewidth
0.51841 0.56055 Mdot
0 0 0 setrgbcolor
0.01654 setlinewidth
0.52622 0.56051 Mdot
0 0 0 setrgbcolor
0.01421 setlinewidth
0.54101 0.55227 Mdot
0 0 0 setrgbcolor
0.00663 setlinewidth
0.53523 0.51405 Mdot
0 0 0 setrgbcolor
0.00999 setlinewidth
0.53938 0.55286 Mdot
0 0 0 setrgbcolor
0.01007 setlinewidth
0.5394 0.51917 Mdot
0 0 0 setrgbcolor
0.0144 setlinewidth
0.54082 0.52157 Mdot
0 0 0 setrgbcolor
0.01378 setlinewidth
0.53972 0.52045 Mdot
0 0 0 setrgbcolor
0.00776 setlinewidth
0.5317 0.55548 Mdot
0 0 0 setrgbcolor
0.01404 setlinewidth
0.50938 0.5522 Mdot
0 0 0 setrgbcolor
0.01588 setlinewidth
0.53421 0.55338 Mdot
0 0 0 setrgbcolor
0.01762 setlinewidth
0.5429 0.52903 Mdot
0 0 0 setrgbcolor
0.01346 setlinewidth
0.5269 0.51626 Mdot
0 0 0 setrgbcolor
0.01613 setlinewidth
0.51789 0.55315 Mdot
0 0 0 setrgbcolor
0.01651 setlinewidth
0.53976 0.54259 Mdot
0 0 0 setrgbcolor
0.02 setlinewidth
0.50806 0.52843 Mdot
0 0 0 setrgbcolor
0.00937 setlinewidth
0.52362 0.55097 Mdot
0 0 0 setrgbcolor
0.01988 setlinewidth
0.51308 0.54714 Mdot
0 0 0 setrgbcolor
0.01566 setlinewidth
0.50963 0.53041 Mdot
0 0 0 setrgbcolor
0.01425 setlinewidth
0.51713 0.5241 Mdot
0 0 0 setrgbcolor
0.01826 setlinewidth
0.52323 0.5259 Mdot
0 0 0 setrgbcolor
0.01862 setlinewidth
0.51476 0.53704 Mdot
1 1 1 setrgbcolor
0.01566 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.01934 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00901 setlinewidth
0.5237 0.53147 Mdot
0 0 0 setrgbcolor
0.00663 setlinewidth
0.51725 0.53541 Mdot
0 0 0 setrgbcolor
0.01834 setlinewidth
0.52946 0.5318 Mdot
0 0 0 setrgbcolor
0.01368 setlinewidth
0.517 0.53105 Mdot
0 0 0 setrgbcolor
0.01715 setlinewidth
0.51505 0.53017 Mdot
0 0 0 setrgbcolor
0.01742 setlinewidth
0.53454 0.52894 Mdot
0 0 0 setrgbcolor
0.00746 setlinewidth
0.53188 0.52488 Mdot
0 0 0 setrgbcolor
0.00728 setlinewidth
0.53365 0.5261 Mdot
0 0 0 setrgbcolor
0.01026 setlinewidth
0.53728 0.53617 Mdot
0 0 0 setrgbcolor
0.00614 setlinewidth
0.53552 0.5429 Mdot
0 0 0 setrgbcolor
0.01356 setlinewidth
0.53129 0.52249 Mdot
0 0 0 setrgbcolor
0.01911 setlinewidth
0.52716 0.51793 Mdot
0 0 0 setrgbcolor
0.01261 setlinewidth
0.5247 0.51625 Mdot
0 0 0 setrgbcolor
0.01665 setlinewidth
0.53898 0.54682 Mdot
0 0 0 setrgbcolor
0.01571 setlinewidth
0.53429 0.51888 Mdot
0 0 0 setrgbcolor
0.01908 setlinewidth
0.50226 0.5342 Mdot
0 0 0 setrgbcolor
0.01447 setlinewidth
0.54061 0.54843 Mdot
0 0 0 setrgbcolor
0.00858 setlinewidth
0.53061 0.51476 Mdot
0 0 0 setrgbcolor
0.01035 setlinewidth
0.52302 0.51283 Mdot
0 0 0 setrgbcolor
0.01264 setlinewidth
0.53521 0.51629 Mdot
0 0 0 setrgbcolor
0.0135 setlinewidth
0.52895 0.51315 Mdot
0 0 0 setrgbcolor
0.00685 setlinewidth
0.53956 0.55274 Mdot
0 0 0 setrgbcolor
0.01311 setlinewidth
0.51207 0.51394 Mdot
0 0 0 setrgbcolor
0.01966 setlinewidth
0.54625 0.54402 Mdot
0 0 0 setrgbcolor
0.01313 setlinewidth
0.50286 0.52097 Mdot
0 0 0 setrgbcolor
0.01345 setlinewidth
0.50521 0.51787 Mdot
0 0 0 setrgbcolor
0.00639 setlinewidth
0.50976 0.51401 Mdot
0 0 0 setrgbcolor
0.00824 setlinewidth
0.50971 0.51395 Mdot
0 0 0 setrgbcolor
0.00548 setlinewidth
0.50807 0.51492 Mdot
0 0 0 setrgbcolor
0.01751 setlinewidth
0.52529 0.50936 Mdot
0 0 0 setrgbcolor
0.00695 setlinewidth
0.53245 0.51089 Mdot
0 0 0 setrgbcolor
0.01144 setlinewidth
0.50818 0.5132 Mdot
0 0 0 setrgbcolor
0.01488 setlinewidth
0.5221 0.50859 Mdot
0 0 0 setrgbcolor
0.01973 setlinewidth
0.532 0.51001 Mdot
0 0 0 setrgbcolor
0.01909 setlinewidth
0.54574 0.5208 Mdot
0 0 0 setrgbcolor
0.01294 setlinewidth
0.50831 0.55843 Mdot
0 0 0 setrgbcolor
0.01491 setlinewidth
0.52429 0.50795 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.52135 0.50786 Mdot
0 0 0 setrgbcolor
0.01506 setlinewidth
0.50191 0.55302 Mdot
0 0 0 setrgbcolor
0.00722 setlinewidth
0.51088 0.51029 Mdot
0 0 0 setrgbcolor
0.01128 setlinewidth
0.50712 0.51229 Mdot
0 0 0 setrgbcolor
0.0135 setlinewidth
0.52208 0.50722 Mdot
0 0 0 setrgbcolor
0.00878 setlinewidth
0.51978 0.50729 Mdot
0 0 0 setrgbcolor
0.00551 setlinewidth
0.52176 0.50685 Mdot
0 0 0 setrgbcolor
0.0104 setlinewidth
0.52801 0.50723 Mdot
0 0 0 setrgbcolor
0.00593 setlinewidth
0.52364 0.50672 Mdot
0 0 0 setrgbcolor
0.00631 setlinewidth
0.52316 0.5066 Mdot
0 0 0 setrgbcolor
0.01342 setlinewidth
0.53162 0.50765 Mdot
0 0 0 setrgbcolor
0.01831 setlinewidth
0.51746 0.56389 Mdot
0 0 0 setrgbcolor
0.00583 setlinewidth
0.52389 0.50612 Mdot
0 0 0 setrgbcolor
0.01238 setlinewidth
0.52317 0.50596 Mdot
0 0 0 setrgbcolor
0.00865 setlinewidth
0.52172 0.5057 Mdot
0 0 0 setrgbcolor
0.01181 setlinewidth
0.51308 0.50739 Mdot
0 0 0 setrgbcolor
0.01033 setlinewidth
0.5033 0.55752 Mdot
0 0 0 setrgbcolor
0.01301 setlinewidth
0.55053 0.54732 Mdot
0 0 0 setrgbcolor
0.00905 setlinewidth
0.50431 0.51193 Mdot
0 0 0 setrgbcolor
0.01698 setlinewidth
0.52601 0.50531 Mdot
0 0 0 setrgbcolor
0.01543 setlinewidth
0.50885 0.50871 Mdot
0 0 0 setrgbcolor
0.01868 setlinewidth
0.52233 0.50506 Mdot
0 0 0 setrgbcolor
0.01879 setlinewidth
0.523 0.50498 Mdot
0 0 0 setrgbcolor
0.01377 setlinewidth
0.51032 0.50741 Mdot
0 0 0 setrgbcolor
0.01812 setlinewidth
0.52779 0.50468 Mdot
0 0 0 setrgbcolor
0.01679 setlinewidth
0.55346 0.54201 Mdot
0 0 0 setrgbcolor
0.01748 setlinewidth
0.49911 0.55521 Mdot
0 0 0 setrgbcolor
0.01876 setlinewidth
0.54343 0.55893 Mdot
0 0 0 setrgbcolor
0.01376 setlinewidth
0.55393 0.5401 Mdot
0 0 0 setrgbcolor
0.01056 setlinewidth
0.54231 0.56015 Mdot
0 0 0 setrgbcolor
0.01997 setlinewidth
0.55357 0.52768 Mdot
0 0 0 setrgbcolor
0.00855 setlinewidth
0.50429 0.51014 Mdot
0 0 0 setrgbcolor
0.01972 setlinewidth
0.52757 0.50405 Mdot
0 0 0 setrgbcolor
0.00561 setlinewidth
0.50329 0.56 Mdot
0 0 0 setrgbcolor
0.01076 setlinewidth
0.5528 0.5465 Mdot
0 0 0 setrgbcolor
0.01014 setlinewidth
0.54898 0.55434 Mdot
0 0 0 setrgbcolor
0.01955 setlinewidth
0.55552 0.538 Mdot
0 0 0 setrgbcolor
0.00622 setlinewidth
0.55366 0.54657 Mdot
0 0 0 setrgbcolor
0.01039 setlinewidth
0.55194 0.51942 Mdot
0 0 0 setrgbcolor
0.01555 setlinewidth
0.49874 0.55758 Mdot
0 0 0 setrgbcolor
0.01335 setlinewidth
0.52058 0.50234 Mdot
0 0 0 setrgbcolor
0.00737 setlinewidth
0.5079 0.50542 Mdot
0 0 0 setrgbcolor
0.01908 setlinewidth
0.53346 0.5034 Mdot
0 0 0 setrgbcolor
0.01184 setlinewidth
0.51564 0.56844 Mdot
0 0 0 setrgbcolor
0.01809 setlinewidth
0.50596 0.56476 Mdot
0 0 0 setrgbcolor
0.00722 setlinewidth
0.55306 0.51906 Mdot
0 0 0 setrgbcolor
0.0073 setlinewidth
0.49043 0.52522 Mdot
0 0 0 setrgbcolor
0.01691 setlinewidth
0.55027 0.55624 Mdot
0 0 0 setrgbcolor
0.01381 setlinewidth
0.50588 0.50535 Mdot
0 0 0 setrgbcolor
0.01892 setlinewidth
0.51448 0.50185 Mdot
0 0 0 setrgbcolor
0.00657 setlinewidth
0.54188 0.5057 Mdot
0 0 0 setrgbcolor
0.01028 setlinewidth
0.54433 0.5633 Mdot
0 0 0 setrgbcolor
0.01153 setlinewidth
0.49192 0.51912 Mdot
0 0 0 setrgbcolor
0.01065 setlinewidth
0.5218 0.50021 Mdot
0 0 0 setrgbcolor
0.01496 setlinewidth
0.49882 0.56092 Mdot
0 0 0 setrgbcolor
0.01463 setlinewidth
0.49178 0.51909 Mdot
0 0 0 setrgbcolor
0.01446 setlinewidth
0.50896 0.50296 Mdot
0 0 0 setrgbcolor
0.01062 setlinewidth
0.54706 0.5091 Mdot
0 0 0 setrgbcolor
0.00827 setlinewidth
0.5471 0.50904 Mdot
0 0 0 setrgbcolor
0.01002 setlinewidth
0.52163 0.49973 Mdot
0 0 0 setrgbcolor
0.01758 setlinewidth
0.50121 0.56355 Mdot
0 0 0 setrgbcolor
0.0053 setlinewidth
0.48786 0.52963 Mdot
0 0 0 setrgbcolor
0.00871 setlinewidth
0.49491 0.55729 Mdot
0 0 0 setrgbcolor
0.01857 setlinewidth
0.55744 0.54528 Mdot
0 0 0 setrgbcolor
0.00534 setlinewidth
0.50007 0.56274 Mdot
0 0 0 setrgbcolor
0.01861 setlinewidth
0.52442 0.49958 Mdot
0 0 0 setrgbcolor
0.00637 setlinewidth
0.49956 0.56233 Mdot
0 0 0 setrgbcolor
0.01389 setlinewidth
0.55729 0.54595 Mdot
0 0 0 setrgbcolor
0.01612 setlinewidth
0.50489 0.50453 Mdot
0 0 0 setrgbcolor
0.01461 setlinewidth
0.52079 0.57104 Mdot
0 0 0 setrgbcolor
0.01938 setlinewidth
0.54085 0.56638 Mdot
0 0 0 setrgbcolor
0.00503 setlinewidth
0.51154 0.56918 Mdot
0 0 0 setrgbcolor
0.00832 setlinewidth
0.48939 0.52346 Mdot
0 0 0 setrgbcolor
0.01913 setlinewidth
0.53706 0.5682 Mdot
0 0 0 setrgbcolor
0.00915 setlinewidth
0.48781 0.53001 Mdot
0 0 0 setrgbcolor
0.01101 setlinewidth
0.51913 0.5708 Mdot
0 0 0 setrgbcolor
0.01756 setlinewidth
0.52625 0.57087 Mdot
0 0 0 setrgbcolor
0.01496 setlinewidth
0.5316 0.50073 Mdot
0 0 0 setrgbcolor
0.01205 setlinewidth
0.53518 0.56886 Mdot
0 0 0 setrgbcolor
0.00625 setlinewidth
0.53998 0.56671 Mdot
0 0 0 setrgbcolor
0.00572 setlinewidth
0.52166 0.4998 Mdot
0 0 0 setrgbcolor
0.0146 setlinewidth
0.51505 0.57001 Mdot
0 0 0 setrgbcolor
0.00886 setlinewidth
0.55608 0.54836 Mdot
0 0 0 setrgbcolor
0.00784 setlinewidth
0.525 0.50005 Mdot
0 0 0 setrgbcolor
0.01996 setlinewidth
0.49786 0.56001 Mdot
0 0 0 setrgbcolor
0.01924 setlinewidth
0.54348 0.5641 Mdot
0 0 0 setrgbcolor
0.00686 setlinewidth
0.48824 0.5401 Mdot
0 0 0 setrgbcolor
0.013 setlinewidth
0.53886 0.50401 Mdot
0 0 0 setrgbcolor
0.01402 setlinewidth
0.48806 0.53422 Mdot
0 0 0 setrgbcolor
0.00992 setlinewidth
0.53953 0.56626 Mdot
0 0 0 setrgbcolor
0.00998 setlinewidth
0.54658 0.50942 Mdot
0 0 0 setrgbcolor
0.01967 setlinewidth
0.55783 0.5392 Mdot
0 0 0 setrgbcolor
0.00749 setlinewidth
0.49481 0.55587 Mdot
0 0 0 setrgbcolor
0.00804 setlinewidth
0.51132 0.50273 Mdot
0 0 0 setrgbcolor
0.00638 setlinewidth
0.52559 0.56987 Mdot
0 0 0 setrgbcolor
0.01917 setlinewidth
0.55739 0.53245 Mdot
0 0 0 setrgbcolor
0.0063 setlinewidth
0.50547 0.50583 Mdot
0 0 0 setrgbcolor
0.00593 setlinewidth
0.52267 0.56958 Mdot
0 0 0 setrgbcolor
0.01885 setlinewidth
0.55334 0.55123 Mdot
0 0 0 setrgbcolor
0.01874 setlinewidth
0.52407 0.50161 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.49311 0.52002 Mdot
0 0 0 setrgbcolor
0.01334 setlinewidth
0.52592 0.56889 Mdot
0 0 0 setrgbcolor
0.0146 setlinewidth
0.50141 0.5097 Mdot
0 0 0 setrgbcolor
0.00798 setlinewidth
0.55658 0.53333 Mdot
0 0 0 setrgbcolor
0.00844 setlinewidth
0.51553 0.56798 Mdot
0 0 0 setrgbcolor
0.01817 setlinewidth
0.53191 0.56758 Mdot
0 0 0 setrgbcolor
0.01819 setlinewidth
0.49017 0.5356 Mdot
0 0 0 setrgbcolor
0.00605 setlinewidth
0.50301 0.56142 Mdot
0 0 0 setrgbcolor
0.01739 setlinewidth
0.51758 0.50302 Mdot
0 0 0 setrgbcolor
0.01461 setlinewidth
0.53478 0.5659 Mdot
0 0 0 setrgbcolor
0.00985 setlinewidth
0.53212 0.50409 Mdot
0 0 0 setrgbcolor
0.00538 setlinewidth
0.5246 0.56765 Mdot
0 0 0 setrgbcolor
0.0063 setlinewidth
0.49551 0.55214 Mdot
0 0 0 setrgbcolor
0.01385 setlinewidth
0.52905 0.56692 Mdot
0 0 0 setrgbcolor
0.01096 setlinewidth
0.49316 0.52386 Mdot
0 0 0 setrgbcolor
0.01119 setlinewidth
0.51443 0.5045 Mdot
0 0 0 setrgbcolor
0.01233 setlinewidth
0.50263 0.55909 Mdot
0 0 0 setrgbcolor
0.01712 setlinewidth
0.50249 0.55856 Mdot
0 0 0 setrgbcolor
0.00615 setlinewidth
0.55248 0.54499 Mdot
0 0 0 setrgbcolor
0.01821 setlinewidth
0.54771 0.55354 Mdot
0 0 0 setrgbcolor
0.01421 setlinewidth
0.52945 0.56506 Mdot
0 0 0 setrgbcolor
0.01652 setlinewidth
0.52135 0.56561 Mdot
0 0 0 setrgbcolor
0.0099 setlinewidth
0.5133 0.56389 Mdot
0 0 0 setrgbcolor
0.01934 setlinewidth
0.52246 0.56513 Mdot
0 0 0 setrgbcolor
0.01724 setlinewidth
0.52946 0.50653 Mdot
0 0 0 setrgbcolor
0.01608 setlinewidth
0.55187 0.54183 Mdot
0 0 0 setrgbcolor
0.00701 setlinewidth
0.53132 0.50704 Mdot
0 0 0 setrgbcolor
0.0096 setlinewidth
0.53318 0.50777 Mdot
0 0 0 setrgbcolor
0.01943 setlinewidth
0.52007 0.56439 Mdot
0 0 0 setrgbcolor
0.01496 setlinewidth
0.52328 0.56444 Mdot
0 0 0 setrgbcolor
0.00553 setlinewidth
0.52295 0.56428 Mdot
0 0 0 setrgbcolor
0.01987 setlinewidth
0.5147 0.56302 Mdot
0 0 0 setrgbcolor
0.01027 setlinewidth
0.54492 0.55425 Mdot
0 0 0 setrgbcolor
0.01032 setlinewidth
0.52613 0.50694 Mdot
0 0 0 setrgbcolor
0.01284 setlinewidth
0.54548 0.55285 Mdot
0 0 0 setrgbcolor
0.0077 setlinewidth
0.52847 0.56304 Mdot
0 0 0 setrgbcolor
0.00917 setlinewidth
0.52017 0.56335 Mdot
0 0 0 setrgbcolor
0.01687 setlinewidth
0.51736 0.5626 Mdot
0 0 0 setrgbcolor
0.00972 setlinewidth
0.52796 0.5622 Mdot
0 0 0 setrgbcolor
0.01924 setlinewidth
0.54268 0.55351 Mdot
0 0 0 setrgbcolor
0.01774 setlinewidth
0.54317 0.51821 Mdot
0 0 0 setrgbcolor
0.00962 setlinewidth
0.50612 0.55536 Mdot
0 0 0 setrgbcolor
0.01586 setlinewidth
0.52524 0.56139 Mdot
0 0 0 setrgbcolor
0.01099 setlinewidth
0.54675 0.5404 Mdot
0 0 0 setrgbcolor
0.01656 setlinewidth
0.52709 0.51171 Mdot
0 0 0 setrgbcolor
0.01884 setlinewidth
0.50039 0.53094 Mdot
0 0 0 setrgbcolor
0.01475 setlinewidth
0.54511 0.54142 Mdot
0 0 0 setrgbcolor
0.01089 setlinewidth
0.53889 0.55058 Mdot
0 0 0 setrgbcolor
0.01071 setlinewidth
0.51442 0.55509 Mdot
0 0 0 setrgbcolor
0.01688 setlinewidth
0.53717 0.55146 Mdot
0 0 0 setrgbcolor
0.01068 setlinewidth
0.50205 0.53278 Mdot
0 0 0 setrgbcolor
0.01669 setlinewidth
0.52935 0.55538 Mdot
0 0 0 setrgbcolor
0.00623 setlinewidth
0.53181 0.51641 Mdot
0 0 0 setrgbcolor
0.00899 setlinewidth
0.51804 0.51537 Mdot
0 0 0 setrgbcolor
0.01421 setlinewidth
0.50823 0.54961 Mdot
0 0 0 setrgbcolor
0.01692 setlinewidth
0.53221 0.51769 Mdot
0 0 0 setrgbcolor
0.01075 setlinewidth
0.53354 0.51869 Mdot
0 0 0 setrgbcolor
0.01876 setlinewidth
0.53146 0.55282 Mdot
0 0 0 setrgbcolor
0.01392 setlinewidth
0.50855 0.52508 Mdot
0 0 0 setrgbcolor
0.01098 setlinewidth
0.51955 0.55198 Mdot
0 0 0 setrgbcolor
0.01721 setlinewidth
0.53652 0.52615 Mdot
0 0 0 setrgbcolor
0.00537 setlinewidth
0.50784 0.53891 Mdot
0 0 0 setrgbcolor
0.01222 setlinewidth
0.53501 0.54078 Mdot
0 0 0 setrgbcolor
0.01186 setlinewidth
0.51479 0.52603 Mdot
1 1 1 setrgbcolor
0.01934 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.01268 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00617 setlinewidth
0.52443 0.53577 Mdot
0 0 0 setrgbcolor
0.01995 setlinewidth
0.52344 0.53129 Mdot
0 0 0 setrgbcolor
0.00808 setlinewidth
0.52121 0.53068 Mdot
0 0 0 setrgbcolor
0.01096 setlinewidth
0.53043 0.53069 Mdot
0 0 0 setrgbcolor
0.01453 setlinewidth
0.53624 0.53014 Mdot
0 0 0 setrgbcolor
0.01406 setlinewidth
0.50773 0.53691 Mdot
0 0 0 setrgbcolor
0.00545 setlinewidth
0.53724 0.52262 Mdot
0 0 0 setrgbcolor
0.0065 setlinewidth
0.54061 0.52642 Mdot
0 0 0 setrgbcolor
0.01923 setlinewidth
0.53919 0.52361 Mdot
0 0 0 setrgbcolor
0.0079 setlinewidth
0.53611 0.52023 Mdot
0 0 0 setrgbcolor
0.00684 setlinewidth
0.53092 0.51616 Mdot
0 0 0 setrgbcolor
0.00851 setlinewidth
0.528 0.51481 Mdot
0 0 0 setrgbcolor
0.00809 setlinewidth
0.54364 0.54079 Mdot
0 0 0 setrgbcolor
0.01703 setlinewidth
0.50563 0.52316 Mdot
0 0 0 setrgbcolor
0.01508 setlinewidth
0.54443 0.53352 Mdot
0 0 0 setrgbcolor
0.00689 setlinewidth
0.50749 0.51959 Mdot
0 0 0 setrgbcolor
0.01861 setlinewidth
0.51403 0.51444 Mdot
0 0 0 setrgbcolor
0.0084 setlinewidth
0.50986 0.51609 Mdot
0 0 0 setrgbcolor
0.01742 setlinewidth
0.51147 0.51489 Mdot
0 0 0 setrgbcolor
0.01441 setlinewidth
0.5114 0.51483 Mdot
0 0 0 setrgbcolor
0.01962 setlinewidth
0.52526 0.51156 Mdot
0 0 0 setrgbcolor
0.00899 setlinewidth
0.53807 0.51606 Mdot
0 0 0 setrgbcolor
0.0123 setlinewidth
0.50942 0.51432 Mdot
0 0 0 setrgbcolor
0.01233 setlinewidth
0.53338 0.51237 Mdot
0 0 0 setrgbcolor
0.00699 setlinewidth
0.50895 0.55656 Mdot
0 0 0 setrgbcolor
0.01952 setlinewidth
0.53127 0.51098 Mdot
0 0 0 setrgbcolor
0.00928 setlinewidth
0.5472 0.54437 Mdot
0 0 0 setrgbcolor
0.01593 setlinewidth
0.50787 0.51357 Mdot
0 0 0 setrgbcolor
0.00999 setlinewidth
0.51631 0.5612 Mdot
0 0 0 setrgbcolor
0.00532 setlinewidth
0.53819 0.51326 Mdot
0 0 0 setrgbcolor
0.00902 setlinewidth
0.51142 0.5109 Mdot
0 0 0 setrgbcolor
0.01031 setlinewidth
0.54877 0.54583 Mdot
0 0 0 setrgbcolor
0.01886 setlinewidth
0.52635 0.50765 Mdot
0 0 0 setrgbcolor
0.01512 setlinewidth
0.52282 0.50737 Mdot
0 0 0 setrgbcolor
0.01665 setlinewidth
0.50438 0.51367 Mdot
0 0 0 setrgbcolor
0.01786 setlinewidth
0.52176 0.50674 Mdot
0 0 0 setrgbcolor
0.01081 setlinewidth
0.51044 0.56106 Mdot
0 0 0 setrgbcolor
0.00516 setlinewidth
0.52479 0.50637 Mdot
0 0 0 setrgbcolor
0.01331 setlinewidth
0.5199 0.50641 Mdot
0 0 0 setrgbcolor
0.0113 setlinewidth
0.548 0.5505 Mdot
0 0 0 setrgbcolor
0.00801 setlinewidth
0.53385 0.50812 Mdot
0 0 0 setrgbcolor
0.00503 setlinewidth
0.52225 0.50597 Mdot
0 0 0 setrgbcolor
0.01504 setlinewidth
0.50843 0.50963 Mdot
0 0 0 setrgbcolor
0.01832 setlinewidth
0.51269 0.50759 Mdot
0 0 0 setrgbcolor
0.01753 setlinewidth
0.52176 0.50565 Mdot
0 0 0 setrgbcolor
0.01271 setlinewidth
0.5331 0.50729 Mdot
0 0 0 setrgbcolor
0.0185 setlinewidth
0.50537 0.55933 Mdot
0 0 0 setrgbcolor
0.01348 setlinewidth
0.52362 0.50522 Mdot
0 0 0 setrgbcolor
0.01709 setlinewidth
0.52308 0.50517 Mdot
0 0 0 setrgbcolor
0.01048 setlinewidth
0.52599 0.56552 Mdot
0 0 0 setrgbcolor
0.01478 setlinewidth
0.50956 0.50806 Mdot
0 0 0 setrgbcolor
0.01897 setlinewidth
0.50359 0.51185 Mdot
0 0 0 setrgbcolor
0.01126 setlinewidth
0.55334 0.54041 Mdot
0 0 0 setrgbcolor
0.01574 setlinewidth
0.52818 0.50507 Mdot
0 0 0 setrgbcolor
0.00506 setlinewidth
0.52361 0.50457 Mdot
0 0 0 setrgbcolor
0.01474 setlinewidth
0.52281 0.50453 Mdot
0 0 0 setrgbcolor
0.00918 setlinewidth
0.52121 0.50448 Mdot
0 0 0 setrgbcolor
0.00619 setlinewidth
0.51014 0.56368 Mdot
0 0 0 setrgbcolor
0.00744 setlinewidth
0.53179 0.50494 Mdot
0 0 0 setrgbcolor
0.0173 setlinewidth
0.52153 0.50373 Mdot
0 0 0 setrgbcolor
0.01077 setlinewidth
0.52218 0.50355 Mdot
0 0 0 setrgbcolor
0.00697 setlinewidth
0.54876 0.51637 Mdot
0 0 0 setrgbcolor
0.01252 setlinewidth
0.52536 0.50342 Mdot
0 0 0 setrgbcolor
0.0114 setlinewidth
0.50457 0.5619 Mdot
0 0 0 setrgbcolor
0.00791 setlinewidth
0.49052 0.52971 Mdot
0 0 0 setrgbcolor
0.01837 setlinewidth
0.52677 0.5025 Mdot
0 0 0 setrgbcolor
0.01677 setlinewidth
0.52623 0.50191 Mdot
0 0 0 setrgbcolor
0.01638 setlinewidth
0.50555 0.50648 Mdot
0 0 0 setrgbcolor
0.00754 setlinewidth
0.5182 0.50128 Mdot
0 0 0 setrgbcolor
0.01384 setlinewidth
0.51239 0.56831 Mdot
0 0 0 setrgbcolor
0.0153 setlinewidth
0.55692 0.5433 Mdot
0 0 0 setrgbcolor
0.01857 setlinewidth
0.4903 0.52322 Mdot
0 0 0 setrgbcolor
0.0185 setlinewidth
0.50283 0.50676 Mdot
0 0 0 setrgbcolor
0.01836 setlinewidth
0.55103 0.5565 Mdot
0 0 0 setrgbcolor
0.00753 setlinewidth
0.54998 0.55795 Mdot
0 0 0 setrgbcolor
0.00554 setlinewidth
0.49 0.52323 Mdot
0 0 0 setrgbcolor
0.00581 setlinewidth
0.52286 0.57067 Mdot
0 0 0 setrgbcolor
0.00643 setlinewidth
0.5587 0.53734 Mdot
0 0 0 setrgbcolor
0.01726 setlinewidth
0.511 0.50179 Mdot
0 0 0 setrgbcolor
0.00855 setlinewidth
0.55885 0.53528 Mdot
0 0 0 setrgbcolor
0.00649 setlinewidth
0.55648 0.52241 Mdot
0 0 0 setrgbcolor
0.01417 setlinewidth
0.50355 0.56547 Mdot
0 0 0 setrgbcolor
0.01643 setlinewidth
0.5312 0.50037 Mdot
0 0 0 setrgbcolor
0.01198 setlinewidth
0.55848 0.54214 Mdot
0 0 0 setrgbcolor
0.00586 setlinewidth
0.55562 0.55091 Mdot
0 0 0 setrgbcolor
0.00693 setlinewidth
0.48696 0.53478 Mdot
0 0 0 setrgbcolor
0.01998 setlinewidth
0.50485 0.50386 Mdot
0 0 0 setrgbcolor
0.00857 setlinewidth
0.55901 0.5421 Mdot
0 0 0 setrgbcolor
0.0092 setlinewidth
0.55287 0.51411 Mdot
0 0 0 setrgbcolor
0.0054 setlinewidth
0.5596 0.53289 Mdot
0 0 0 setrgbcolor
0.01752 setlinewidth
0.49828 0.56236 Mdot
0 0 0 setrgbcolor
0.0079 setlinewidth
0.51766 0.49897 Mdot
0 0 0 setrgbcolor
0.00733 setlinewidth
0.50566 0.5679 Mdot
0 0 0 setrgbcolor
0.0078 setlinewidth
0.50406 0.56725 Mdot
0 0 0 setrgbcolor
0.01786 setlinewidth
0.50334 0.56692 Mdot
0 0 0 setrgbcolor
0.01372 setlinewidth
0.55331 0.5136 Mdot
0 0 0 setrgbcolor
0.00635 setlinewidth
0.48649 0.52825 Mdot
0 0 0 setrgbcolor
0.01658 setlinewidth
0.55608 0.55277 Mdot
0 0 0 setrgbcolor
0.01646 setlinewidth
0.48575 0.53528 Mdot
0 0 0 setrgbcolor
0.01842 setlinewidth
0.5167 0.49855 Mdot
0 0 0 setrgbcolor
0.01924 setlinewidth
0.53903 0.50152 Mdot
0 0 0 setrgbcolor
0.01062 setlinewidth
0.49957 0.50622 Mdot
0 0 0 setrgbcolor
0.01718 setlinewidth
0.5504 0.56108 Mdot
0 0 0 setrgbcolor
0.00913 setlinewidth
0.51901 0.498 Mdot
0 0 0 setrgbcolor
0.01029 setlinewidth
0.48695 0.54572 Mdot
0 0 0 setrgbcolor
0.01301 setlinewidth
0.48574 0.53966 Mdot
0 0 0 setrgbcolor
0.00624 setlinewidth
0.54426 0.50428 Mdot
0 0 0 setrgbcolor
0.0181 setlinewidth
0.51598 0.57227 Mdot
0 0 0 setrgbcolor
0.01797 setlinewidth
0.54416 0.50422 Mdot
0 0 0 setrgbcolor
0.00801 setlinewidth
0.49985 0.56488 Mdot
0 0 0 setrgbcolor
0.00595 setlinewidth
0.52571 0.57281 Mdot
0 0 0 setrgbcolor
0.01108 setlinewidth
0.49576 0.56106 Mdot
0 0 0 setrgbcolor
0.01019 setlinewidth
0.52372 0.57283 Mdot
0 0 0 setrgbcolor
0.00951 setlinewidth
0.51925 0.57263 Mdot
0 0 0 setrgbcolor
0.0094 setlinewidth
0.5152 0.49873 Mdot
0 0 0 setrgbcolor
0.00903 setlinewidth
0.53095 0.57184 Mdot
0 0 0 setrgbcolor
0.00736 setlinewidth
0.52559 0.49813 Mdot
0 0 0 setrgbcolor
0.01656 setlinewidth
0.55995 0.54039 Mdot
0 0 0 setrgbcolor
0.0108 setlinewidth
0.51829 0.49849 Mdot
0 0 0 setrgbcolor
0.0125 setlinewidth
0.48766 0.52427 Mdot
0 0 0 setrgbcolor
0.01683 setlinewidth
0.49845 0.50761 Mdot
0 0 0 setrgbcolor
0.01399 setlinewidth
0.50413 0.50347 Mdot
0 0 0 setrgbcolor
0.00693 setlinewidth
0.54542 0.56495 Mdot
0 0 0 setrgbcolor
0.00826 setlinewidth
0.54165 0.56743 Mdot
0 0 0 setrgbcolor
0.00858 setlinewidth
0.53966 0.56841 Mdot
0 0 0 setrgbcolor
0.01723 setlinewidth
0.55955 0.54114 Mdot
0 0 0 setrgbcolor
0.01471 setlinewidth
0.48667 0.54087 Mdot
0 0 0 setrgbcolor
0.00615 setlinewidth
0.49443 0.5123 Mdot
0 0 0 setrgbcolor
0.01701 setlinewidth
0.54422 0.56545 Mdot
0 0 0 setrgbcolor
0.01221 setlinewidth
0.48751 0.52829 Mdot
0 0 0 setrgbcolor
0.00677 setlinewidth
0.53271 0.50044 Mdot
0 0 0 setrgbcolor
0.01464 setlinewidth
0.49431 0.55722 Mdot
0 0 0 setrgbcolor
0.01764 setlinewidth
0.52888 0.57099 Mdot
0 0 0 setrgbcolor
0.0051 setlinewidth
0.5036 0.56569 Mdot
0 0 0 setrgbcolor
0.00577 setlinewidth
0.52559 0.57115 Mdot
0 0 0 setrgbcolor
0.01264 setlinewidth
0.54684 0.56225 Mdot
0 0 0 setrgbcolor
0.01711 setlinewidth
0.5429 0.56512 Mdot
0 0 0 setrgbcolor
0.00799 setlinewidth
0.51762 0.5706 Mdot
0 0 0 setrgbcolor
0.01907 setlinewidth
0.51626 0.50036 Mdot
0 0 0 setrgbcolor
0.01063 setlinewidth
0.55759 0.54391 Mdot
0 0 0 setrgbcolor
0.0068 setlinewidth
0.54132 0.50486 Mdot
0 0 0 setrgbcolor
0.01418 setlinewidth
0.50938 0.50287 Mdot
0 0 0 setrgbcolor
0.01205 setlinewidth
0.52843 0.56997 Mdot
0 0 0 setrgbcolor
0.01851 setlinewidth
0.50219 0.56338 Mdot
0 0 0 setrgbcolor
0.01724 setlinewidth
0.50608 0.50492 Mdot
0 0 0 setrgbcolor
0.00718 setlinewidth
0.50185 0.56286 Mdot
0 0 0 setrgbcolor
0.01365 setlinewidth
0.5574 0.53414 Mdot
0 0 0 setrgbcolor
0.0109 setlinewidth
0.53419 0.56773 Mdot
0 0 0 setrgbcolor
0.01983 setlinewidth
0.52623 0.56894 Mdot
0 0 0 setrgbcolor
0.01327 setlinewidth
0.52422 0.50171 Mdot
0 0 0 setrgbcolor
0.01372 setlinewidth
0.55545 0.52721 Mdot
0 0 0 setrgbcolor
0.00829 setlinewidth
0.55403 0.54741 Mdot
0 0 0 setrgbcolor
0.01084 setlinewidth
0.53651 0.56557 Mdot
0 0 0 setrgbcolor
0.01469 setlinewidth
0.53056 0.56752 Mdot
0 0 0 setrgbcolor
0.01375 setlinewidth
0.51334 0.56679 Mdot
0 0 0 setrgbcolor
0.01737 setlinewidth
0.52183 0.56736 Mdot
0 0 0 setrgbcolor
0.00972 setlinewidth
0.55421 0.52829 Mdot
0 0 0 setrgbcolor
0.01307 setlinewidth
0.51425 0.56571 Mdot
0 0 0 setrgbcolor
0.01268 setlinewidth
0.52272 0.56671 Mdot
0 0 0 setrgbcolor
0.00589 setlinewidth
0.52 0.56631 Mdot
0 0 0 setrgbcolor
0.01418 setlinewidth
0.53003 0.56557 Mdot
0 0 0 setrgbcolor
0.01332 setlinewidth
0.52076 0.50475 Mdot
0 0 0 setrgbcolor
0.01003 setlinewidth
0.50368 0.5591 Mdot
0 0 0 setrgbcolor
0.01594 setlinewidth
0.52324 0.56589 Mdot
0 0 0 setrgbcolor
0.01369 setlinewidth
0.52284 0.56577 Mdot
0 0 0 setrgbcolor
0.00658 setlinewidth
0.52272 0.50499 Mdot
0 0 0 setrgbcolor
0.01211 setlinewidth
0.51659 0.56489 Mdot
0 0 0 setrgbcolor
0.01481 setlinewidth
0.51716 0.50571 Mdot
0 0 0 setrgbcolor
0.01865 setlinewidth
0.51965 0.56524 Mdot
0 0 0 setrgbcolor
0.0158 setlinewidth
0.52469 0.50545 Mdot
0 0 0 setrgbcolor
0.01779 setlinewidth
0.49352 0.5347 Mdot
0 0 0 setrgbcolor
0.01017 setlinewidth
0.52806 0.56367 Mdot
0 0 0 setrgbcolor
0.01008 setlinewidth
0.54698 0.55081 Mdot
0 0 0 setrgbcolor
0.00683 setlinewidth
0.55065 0.54116 Mdot
0 0 0 setrgbcolor
0.01143 setlinewidth
0.49516 0.53637 Mdot
0 0 0 setrgbcolor
0.01704 setlinewidth
0.52717 0.56288 Mdot
0 0 0 setrgbcolor
0.00686 setlinewidth
0.524 0.56247 Mdot
0 0 0 setrgbcolor
0.01129 setlinewidth
0.54368 0.55201 Mdot
0 0 0 setrgbcolor
0.011 setlinewidth
0.54907 0.53799 Mdot
0 0 0 setrgbcolor
0.01611 setlinewidth
0.50391 0.55289 Mdot
0 0 0 setrgbcolor
0.00999 setlinewidth
0.54392 0.55048 Mdot
0 0 0 setrgbcolor
0.00859 setlinewidth
0.51782 0.51059 Mdot
0 0 0 setrgbcolor
0.01844 setlinewidth
0.51117 0.55763 Mdot
0 0 0 setrgbcolor
0.00713 setlinewidth
0.5001 0.52742 Mdot
0 0 0 setrgbcolor
0.00697 setlinewidth
0.50862 0.51584 Mdot
0 0 0 setrgbcolor
0.01136 setlinewidth
0.53571 0.5148 Mdot
0 0 0 setrgbcolor
0.01587 setlinewidth
0.54072 0.55163 Mdot
0 0 0 setrgbcolor
0.01931 setlinewidth
0.50126 0.54189 Mdot
0 0 0 setrgbcolor
0.01167 setlinewidth
0.52632 0.55568 Mdot
0 0 0 setrgbcolor
0.01672 setlinewidth
0.52282 0.51478 Mdot
0 0 0 setrgbcolor
0.01573 setlinewidth
0.51531 0.55367 Mdot
0 0 0 setrgbcolor
0.00984 setlinewidth
0.54233 0.53739 Mdot
0 0 0 setrgbcolor
0.01058 setlinewidth
0.52328 0.51606 Mdot
0 0 0 setrgbcolor
0.01112 setlinewidth
0.50605 0.52748 Mdot
0 0 0 setrgbcolor
0.01676 setlinewidth
0.53547 0.54923 Mdot
0 0 0 setrgbcolor
0.01684 setlinewidth
0.52476 0.51689 Mdot
0 0 0 setrgbcolor
0.01161 setlinewidth
0.53376 0.55041 Mdot
0 0 0 setrgbcolor
0.00915 setlinewidth
0.52785 0.55271 Mdot
0 0 0 setrgbcolor
0.01811 setlinewidth
0.54056 0.53872 Mdot
0 0 0 setrgbcolor
0.01642 setlinewidth
0.52853 0.52422 Mdot
0 0 0 setrgbcolor
0.00907 setlinewidth
0.52895 0.5397 Mdot
1 1 1 setrgbcolor
0.01268 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.00597 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01228 setlinewidth
0.52812 0.53022 Mdot
0 0 0 setrgbcolor
0.00513 setlinewidth
0.5305 0.53051 Mdot
0 0 0 setrgbcolor
0.00726 setlinewidth
0.51476 0.5388 Mdot
0 0 0 setrgbcolor
0.00748 setlinewidth
0.53223 0.535 Mdot
0 0 0 setrgbcolor
0.01924 setlinewidth
0.53736 0.52882 Mdot
0 0 0 setrgbcolor
0.00873 setlinewidth
0.50983 0.52493 Mdot
0 0 0 setrgbcolor
0.01077 setlinewidth
0.51104 0.52095 Mdot
0 0 0 setrgbcolor
0.01501 setlinewidth
0.51272 0.51697 Mdot
0 0 0 setrgbcolor
0.01736 setlinewidth
0.54284 0.52739 Mdot
0 0 0 setrgbcolor
0.01432 setlinewidth
0.51679 0.51461 Mdot
0 0 0 setrgbcolor
0.014 setlinewidth
0.51414 0.51547 Mdot
0 0 0 setrgbcolor
0.01215 setlinewidth
0.51405 0.51543 Mdot
0 0 0 setrgbcolor
0.01103 setlinewidth
0.51169 0.51522 Mdot
0 0 0 setrgbcolor
0.00758 setlinewidth
0.5313 0.51279 Mdot
0 0 0 setrgbcolor
0.00521 setlinewidth
0.51761 0.55909 Mdot
0 0 0 setrgbcolor
0.01456 setlinewidth
0.53454 0.51374 Mdot
0 0 0 setrgbcolor
0.00538 setlinewidth
0.50972 0.5147 Mdot
0 0 0 setrgbcolor
0.00722 setlinewidth
0.54219 0.51945 Mdot
0 0 0 setrgbcolor
0.00998 setlinewidth
0.54056 0.51715 Mdot
0 0 0 setrgbcolor
0.01099 setlinewidth
0.52758 0.50988 Mdot
0 0 0 setrgbcolor
0.01271 setlinewidth
0.54423 0.52018 Mdot
0 0 0 setrgbcolor
0.01195 setlinewidth
0.5128 0.5114 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.54614 0.52288 Mdot
0 0 0 setrgbcolor
0.01911 setlinewidth
0.50573 0.51539 Mdot
0 0 0 setrgbcolor
0.01055 setlinewidth
0.52555 0.56281 Mdot
0 0 0 setrgbcolor
0.01695 setlinewidth
0.55123 0.53738 Mdot
0 0 0 setrgbcolor
0.01811 setlinewidth
0.5509 0.52969 Mdot
0 0 0 setrgbcolor
0.01602 setlinewidth
0.50897 0.51059 Mdot
0 0 0 setrgbcolor
0.01948 setlinewidth
0.51913 0.56358 Mdot
0 0 0 setrgbcolor
0.00785 setlinewidth
0.50415 0.51366 Mdot
0 0 0 setrgbcolor
0.00757 setlinewidth
0.53574 0.50947 Mdot
0 0 0 setrgbcolor
0.01946 setlinewidth
0.53327 0.50836 Mdot
0 0 0 setrgbcolor
0.0072 setlinewidth
0.51341 0.56257 Mdot
0 0 0 setrgbcolor
0.01143 setlinewidth
0.54123 0.51256 Mdot
0 0 0 setrgbcolor
0.0123 setlinewidth
0.51296 0.50781 Mdot
0 0 0 setrgbcolor
0.01922 setlinewidth
0.52363 0.50597 Mdot
0 0 0 setrgbcolor
0.01586 setlinewidth
0.50963 0.50881 Mdot
0 0 0 setrgbcolor
0.01196 setlinewidth
0.5223 0.5055 Mdot
0 0 0 setrgbcolor
0.01072 setlinewidth
0.52728 0.50571 Mdot
0 0 0 setrgbcolor
0.00666 setlinewidth
0.52024 0.50545 Mdot
0 0 0 setrgbcolor
0.01296 setlinewidth
0.49281 0.53423 Mdot
0 0 0 setrgbcolor
0.01762 setlinewidth
0.52249 0.50463 Mdot
0 0 0 setrgbcolor
0.01204 setlinewidth
0.52523 0.50464 Mdot
0 0 0 setrgbcolor
0.00813 setlinewidth
0.52185 0.50438 Mdot
0 0 0 setrgbcolor
0.011 setlinewidth
0.54046 0.50966 Mdot
0 0 0 setrgbcolor
0.00597 setlinewidth
0.51854 0.5664 Mdot
0 0 0 setrgbcolor
0.01428 setlinewidth
0.523 0.50369 Mdot
0 0 0 setrgbcolor
0.01446 setlinewidth
0.52357 0.50365 Mdot
0 0 0 setrgbcolor
0.00966 setlinewidth
0.5122 0.56542 Mdot
0 0 0 setrgbcolor
0.01912 setlinewidth
0.55467 0.54062 Mdot
0 0 0 setrgbcolor
0.00529 setlinewidth
0.52077 0.50328 Mdot
0 0 0 setrgbcolor
0.01002 setlinewidth
0.52244 0.50307 Mdot
0 0 0 setrgbcolor
0.01504 setlinewidth
0.52327 0.50299 Mdot
0 0 0 setrgbcolor
0.0169 setlinewidth
0.53466 0.50505 Mdot
0 0 0 setrgbcolor
0.00811 setlinewidth
0.53363 0.50431 Mdot
0 0 0 setrgbcolor
0.0119 setlinewidth
0.53518 0.56591 Mdot
0 0 0 setrgbcolor
0.00581 setlinewidth
0.52801 0.50279 Mdot
0 0 0 setrgbcolor
0.00978 setlinewidth
0.52076 0.50247 Mdot
0 0 0 setrgbcolor
0.0071 setlinewidth
0.52134 0.50219 Mdot
0 0 0 setrgbcolor
0.0172 setlinewidth
0.49075 0.52761 Mdot
0 0 0 setrgbcolor
0.01475 setlinewidth
0.50417 0.50787 Mdot
0 0 0 setrgbcolor
0.01424 setlinewidth
0.55607 0.54192 Mdot
0 0 0 setrgbcolor
0.00643 setlinewidth
0.49028 0.52768 Mdot
0 0 0 setrgbcolor
0.00678 setlinewidth
0.52448 0.50155 Mdot
0 0 0 setrgbcolor
0.01338 setlinewidth
0.53138 0.50211 Mdot
0 0 0 setrgbcolor
0.00999 setlinewidth
0.55566 0.54693 Mdot
0 0 0 setrgbcolor
0.00716 setlinewidth
0.50085 0.50864 Mdot
0 0 0 setrgbcolor
0.01198 setlinewidth
0.48841 0.54014 Mdot
0 0 0 setrgbcolor
0.01041 setlinewidth
0.5254 0.5004 Mdot
0 0 0 setrgbcolor
0.01342 setlinewidth
0.52454 0.49989 Mdot
0 0 0 setrgbcolor
0.00884 setlinewidth
0.51591 0.50052 Mdot
0 0 0 setrgbcolor
0.01252 setlinewidth
0.52017 0.57097 Mdot
0 0 0 setrgbcolor
0.00865 setlinewidth
0.55916 0.53563 Mdot
0 0 0 setrgbcolor
0.00922 setlinewidth
0.55037 0.51134 Mdot
0 0 0 setrgbcolor
0.01999 setlinewidth
0.50801 0.50223 Mdot
0 0 0 setrgbcolor
0.01738 setlinewidth
0.51005 0.56941 Mdot
0 0 0 setrgbcolor
0.00653 setlinewidth
0.50157 0.50538 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.50363 0.56701 Mdot
0 0 0 setrgbcolor
0.00916 setlinewidth
0.53083 0.57188 Mdot
0 0 0 setrgbcolor
0.01435 setlinewidth
0.48578 0.53354 Mdot
0 0 0 setrgbcolor
0.01343 setlinewidth
0.48602 0.54093 Mdot
0 0 0 setrgbcolor
0.01087 setlinewidth
0.51171 0.57167 Mdot
0 0 0 setrgbcolor
0.00515 setlinewidth
0.52816 0.4976 Mdot
0 0 0 setrgbcolor
0.01215 setlinewidth
0.51348 0.49833 Mdot
0 0 0 setrgbcolor
0.00989 setlinewidth
0.50973 0.57126 Mdot
0 0 0 setrgbcolor
0.00698 setlinewidth
0.50882 0.57103 Mdot
0 0 0 setrgbcolor
0.01596 setlinewidth
0.49533 0.50873 Mdot
0 0 0 setrgbcolor
0.00501 setlinewidth
0.55757 0.55288 Mdot
0 0 0 setrgbcolor
0.01653 setlinewidth
0.55667 0.55455 Mdot
0 0 0 setrgbcolor
0.01156 setlinewidth
0.48797 0.55161 Mdot
0 0 0 setrgbcolor
0.01146 setlinewidth
0.48572 0.54553 Mdot
0 0 0 setrgbcolor
0.01574 setlinewidth
0.56172 0.53821 Mdot
0 0 0 setrgbcolor
0.01457 setlinewidth
0.51171 0.4981 Mdot
0 0 0 setrgbcolor
0.01057 setlinewidth
0.55743 0.51655 Mdot
0 0 0 setrgbcolor
0.01498 setlinewidth
0.56211 0.53176 Mdot
0 0 0 setrgbcolor
0.00739 setlinewidth
0.56188 0.5296 Mdot
0 0 0 setrgbcolor
0.00598 setlinewidth
0.56078 0.54639 Mdot
0 0 0 setrgbcolor
0.00954 setlinewidth
0.56238 0.53682 Mdot
0 0 0 setrgbcolor
0.01773 setlinewidth
0.50359 0.56954 Mdot
0 0 0 setrgbcolor
0.01909 setlinewidth
0.55188 0.50851 Mdot
0 0 0 setrgbcolor
0.008 setlinewidth
0.49865 0.56622 Mdot
0 0 0 setrgbcolor
0.00976 setlinewidth
0.51332 0.4972 Mdot
0 0 0 setrgbcolor
0.01017 setlinewidth
0.48409 0.52941 Mdot
0 0 0 setrgbcolor
0.01508 setlinewidth
0.56252 0.53673 Mdot
0 0 0 setrgbcolor
0.01122 setlinewidth
0.56166 0.52704 Mdot
0 0 0 setrgbcolor
0.00515 setlinewidth
0.53479 0.49766 Mdot
0 0 0 setrgbcolor
0.01758 setlinewidth
0.52135 0.57478 Mdot
0 0 0 setrgbcolor
0.01123 setlinewidth
0.4853 0.54676 Mdot
0 0 0 setrgbcolor
0.01631 setlinewidth
0.55153 0.50797 Mdot
0 0 0 setrgbcolor
0.00607 setlinewidth
0.49242 0.5105 Mdot
0 0 0 setrgbcolor
0.00944 setlinewidth
0.50863 0.49863 Mdot
0 0 0 setrgbcolor
0.01492 setlinewidth
0.48872 0.516 Mdot
0 0 0 setrgbcolor
0.00623 setlinewidth
0.49752 0.50533 Mdot
0 0 0 setrgbcolor
0.01628 setlinewidth
0.56029 0.54836 Mdot
0 0 0 setrgbcolor
0.01674 setlinewidth
0.48373 0.53365 Mdot
0 0 0 setrgbcolor
0.00545 setlinewidth
0.52413 0.57472 Mdot
0 0 0 setrgbcolor
0.01785 setlinewidth
0.53096 0.57391 Mdot
0 0 0 setrgbcolor
0.00713 setlinewidth
0.55528 0.55792 Mdot
0 0 0 setrgbcolor
0.0198 setlinewidth
0.52874 0.57425 Mdot
0 0 0 setrgbcolor
0.00845 setlinewidth
0.53971 0.49977 Mdot
0 0 0 setrgbcolor
0.01908 setlinewidth
0.51123 0.49792 Mdot
0 0 0 setrgbcolor
0.01554 setlinewidth
0.5188 0.49639 Mdot
0 0 0 setrgbcolor
0.01068 setlinewidth
0.53946 0.49974 Mdot
0 0 0 setrgbcolor
0.01615 setlinewidth
0.49492 0.56258 Mdot
0 0 0 setrgbcolor
0.00798 setlinewidth
0.53561 0.57217 Mdot
0 0 0 setrgbcolor
0.01055 setlinewidth
0.50557 0.56997 Mdot
0 0 0 setrgbcolor
0.01394 setlinewidth
0.5013 0.50398 Mdot
0 0 0 setrgbcolor
0.00501 setlinewidth
0.50312 0.56784 Mdot
0 0 0 setrgbcolor
0.01895 setlinewidth
0.50813 0.50028 Mdot
0 0 0 setrgbcolor
0.01005 setlinewidth
0.49806 0.50664 Mdot
0 0 0 setrgbcolor
0.01496 setlinewidth
0.50259 0.56735 Mdot
0 0 0 setrgbcolor
0.01155 setlinewidth
0.54548 0.566 Mdot
0 0 0 setrgbcolor
0.01419 setlinewidth
0.54351 0.56733 Mdot
0 0 0 setrgbcolor
0.01672 setlinewidth
0.54897 0.56285 Mdot
0 0 0 setrgbcolor
0.01753 setlinewidth
0.5203 0.57299 Mdot
0 0 0 setrgbcolor
0.01674 setlinewidth
0.52525 0.49775 Mdot
0 0 0 setrgbcolor
0.0085 setlinewidth
0.53212 0.57169 Mdot
0 0 0 setrgbcolor
0.00878 setlinewidth
0.52863 0.57236 Mdot
0 0 0 setrgbcolor
0.01975 setlinewidth
0.54749 0.56358 Mdot
0 0 0 setrgbcolor
0.0072 setlinewidth
0.56022 0.53501 Mdot
0 0 0 setrgbcolor
0.01705 setlinewidth
0.55958 0.53589 Mdot
0 0 0 setrgbcolor
0.0127 setlinewidth
0.53084 0.57075 Mdot
0 0 0 setrgbcolor
0.01656 setlinewidth
0.53425 0.50103 Mdot
0 0 0 setrgbcolor
0.01099 setlinewidth
0.54529 0.56349 Mdot
0 0 0 setrgbcolor
0.00549 setlinewidth
0.51541 0.5005 Mdot
0 0 0 setrgbcolor
0.01193 setlinewidth
0.54896 0.5599 Mdot
0 0 0 setrgbcolor
0.01059 setlinewidth
0.51404 0.56977 Mdot
0 0 0 setrgbcolor
0.00584 setlinewidth
0.48799 0.53957 Mdot
0 0 0 setrgbcolor
0.00586 setlinewidth
0.52782 0.57005 Mdot
0 0 0 setrgbcolor
0.01485 setlinewidth
0.50231 0.5633 Mdot
0 0 0 setrgbcolor
0.01521 setlinewidth
0.53597 0.56758 Mdot
0 0 0 setrgbcolor
0.00743 setlinewidth
0.51435 0.56855 Mdot
0 0 0 setrgbcolor
0.01973 setlinewidth
0.4895 0.54109 Mdot
0 0 0 setrgbcolor
0.01707 setlinewidth
0.55693 0.53916 Mdot
0 0 0 setrgbcolor
0.01202 setlinewidth
0.52245 0.56912 Mdot
0 0 0 setrgbcolor
0.01076 setlinewidth
0.53172 0.56794 Mdot
0 0 0 setrgbcolor
0.01976 setlinewidth
0.50768 0.50585 Mdot
0 0 0 setrgbcolor
0.01548 setlinewidth
0.51132 0.50428 Mdot
0 0 0 setrgbcolor
0.01312 setlinewidth
0.52012 0.56833 Mdot
0 0 0 setrgbcolor
0.0069 setlinewidth
0.53751 0.56502 Mdot
0 0 0 setrgbcolor
0.00597 setlinewidth
0.52304 0.56832 Mdot
0 0 0 setrgbcolor
0.01491 setlinewidth
0.51619 0.56738 Mdot
0 0 0 setrgbcolor
0.00946 setlinewidth
0.51325 0.50423 Mdot
0 0 0 setrgbcolor
0.00504 setlinewidth
0.5193 0.56729 Mdot
0 0 0 setrgbcolor
0.01746 setlinewidth
0.55457 0.52906 Mdot
0 0 0 setrgbcolor
0.01753 setlinewidth
0.52319 0.56742 Mdot
0 0 0 setrgbcolor
0.00662 setlinewidth
0.52272 0.56736 Mdot
0 0 0 setrgbcolor
0.01156 setlinewidth
0.51521 0.5044 Mdot
0 0 0 setrgbcolor
0.01311 setlinewidth
0.53019 0.56606 Mdot
0 0 0 setrgbcolor
0.01186 setlinewidth
0.50046 0.55691 Mdot
0 0 0 setrgbcolor
0.01582 setlinewidth
0.49239 0.53111 Mdot
0 0 0 setrgbcolor
0.00991 setlinewidth
0.55109 0.52216 Mdot
0 0 0 setrgbcolor
0.01144 setlinewidth
0.55268 0.54344 Mdot
0 0 0 setrgbcolor
0.01983 setlinewidth
0.49924 0.51779 Mdot
0 0 0 setrgbcolor
0.01333 setlinewidth
0.49552 0.54595 Mdot
0 0 0 setrgbcolor
0.01295 setlinewidth
0.52727 0.56442 Mdot
0 0 0 setrgbcolor
0.01849 setlinewidth
0.50841 0.56074 Mdot
0 0 0 setrgbcolor
0.01402 setlinewidth
0.54944 0.52351 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.50795 0.51089 Mdot
0 0 0 setrgbcolor
0.01769 setlinewidth
0.52603 0.56375 Mdot
0 0 0 setrgbcolor
0.00612 setlinewidth
0.52258 0.56382 Mdot
0 0 0 setrgbcolor
0.01008 setlinewidth
0.49761 0.53031 Mdot
0 0 0 setrgbcolor
0.01775 setlinewidth
0.54453 0.54817 Mdot
0 0 0 setrgbcolor
0.00676 setlinewidth
0.51115 0.55608 Mdot
0 0 0 setrgbcolor
0.00805 setlinewidth
0.54673 0.53756 Mdot
0 0 0 setrgbcolor
0.01282 setlinewidth
0.51291 0.51452 Mdot
0 0 0 setrgbcolor
0.00707 setlinewidth
0.52659 0.51249 Mdot
0 0 0 setrgbcolor
0.00574 setlinewidth
0.5409 0.54996 Mdot
0 0 0 setrgbcolor
0.01059 setlinewidth
0.54076 0.54834 Mdot
0 0 0 setrgbcolor
0.00633 setlinewidth
0.51341 0.51579 Mdot
0 0 0 setrgbcolor
0.01597 setlinewidth
0.52275 0.55649 Mdot
0 0 0 setrgbcolor
0.01991 setlinewidth
0.54418 0.53454 Mdot
0 0 0 setrgbcolor
0.01655 setlinewidth
0.51494 0.51643 Mdot
0 0 0 setrgbcolor
0.01761 setlinewidth
0.53735 0.55004 Mdot
0 0 0 setrgbcolor
0.01822 setlinewidth
0.52353 0.5532 Mdot
0 0 0 setrgbcolor
0.0079 setlinewidth
0.52925 0.54989 Mdot
0 0 0 setrgbcolor
0.01286 setlinewidth
0.53083 0.5484 Mdot
0 0 0 setrgbcolor
0.01803 setlinewidth
0.5361 0.53503 Mdot
0 0 0 setrgbcolor
0.01724 setlinewidth
0.51933 0.52351 Mdot
0 0 0 setrgbcolor
0.00784 setlinewidth
0.53432 0.5367 Mdot
0 0 0 setrgbcolor
0.0167 setlinewidth
0.52184 0.53956 Mdot
1 1 1 setrgbcolor
0.00597 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.00939 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01445 setlinewidth
0.52303 0.53962 Mdot
0 0 0 setrgbcolor
0.00676 setlinewidth
0.51533 0.52604 Mdot
0 0 0 setrgbcolor
0.01174 setlinewidth
0.53539 0.52866 Mdot
0 0 0 setrgbcolor
0.00846 setlinewidth
0.51575 0.52174 Mdot
0 0 0 setrgbcolor
0.01112 setlinewidth
0.53779 0.5286 Mdot
0 0 0 setrgbcolor
0.00999 setlinewidth
0.54023 0.533 Mdot
0 0 0 setrgbcolor
0.00598 setlinewidth
0.51655 0.51737 Mdot
0 0 0 setrgbcolor
0.01186 setlinewidth
0.51768 0.51561 Mdot
0 0 0 setrgbcolor
0.00853 setlinewidth
0.51756 0.51558 Mdot
0 0 0 setrgbcolor
0.00736 setlinewidth
0.51496 0.51574 Mdot
0 0 0 setrgbcolor
0.00617 setlinewidth
0.52025 0.5143 Mdot
0 0 0 setrgbcolor
0.0199 setlinewidth
0.51264 0.51553 Mdot
0 0 0 setrgbcolor
0.01588 setlinewidth
0.54406 0.52581 Mdot
0 0 0 setrgbcolor
0.01051 setlinewidth
0.50838 0.51688 Mdot
0 0 0 setrgbcolor
0.01279 setlinewidth
0.51501 0.51165 Mdot
0 0 0 setrgbcolor
0.00961 setlinewidth
0.5275 0.56035 Mdot
0 0 0 setrgbcolor
0.01544 setlinewidth
0.49734 0.53844 Mdot
0 0 0 setrgbcolor
0.0178 setlinewidth
0.50603 0.51538 Mdot
0 0 0 setrgbcolor
0.01151 setlinewidth
0.51051 0.51144 Mdot
0 0 0 setrgbcolor
0.01236 setlinewidth
0.53439 0.51018 Mdot
0 0 0 setrgbcolor
0.00626 setlinewidth
0.5488 0.52352 Mdot
0 0 0 setrgbcolor
0.01664 setlinewidth
0.52983 0.50776 Mdot
0 0 0 setrgbcolor
0.01241 setlinewidth
0.51062 0.50951 Mdot
0 0 0 setrgbcolor
0.00965 setlinewidth
0.53776 0.51066 Mdot
0 0 0 setrgbcolor
0.00661 setlinewidth
0.51394 0.50795 Mdot
0 0 0 setrgbcolor
0.01861 setlinewidth
0.5229 0.56467 Mdot
0 0 0 setrgbcolor
0.01709 setlinewidth
0.4934 0.53197 Mdot
0 0 0 setrgbcolor
0.01251 setlinewidth
0.52895 0.56485 Mdot
0 0 0 setrgbcolor
0.01732 setlinewidth
0.53557 0.56306 Mdot
0 0 0 setrgbcolor
0.0056 setlinewidth
0.4928 0.53212 Mdot
0 0 0 setrgbcolor
0.00516 setlinewidth
0.5443 0.51328 Mdot
0 0 0 setrgbcolor
0.00701 setlinewidth
0.54638 0.51541 Mdot
0 0 0 setrgbcolor
0.01622 setlinewidth
0.52449 0.50437 Mdot
0 0 0 setrgbcolor
0.00846 setlinewidth
0.5208 0.50438 Mdot
0 0 0 setrgbcolor
0.00743 setlinewidth
0.52295 0.5041 Mdot
0 0 0 setrgbcolor
0.01798 setlinewidth
0.54837 0.51587 Mdot
0 0 0 setrgbcolor
0.01942 setlinewidth
0.5228 0.50319 Mdot
0 0 0 setrgbcolor
0.00929 setlinewidth
0.52804 0.50354 Mdot
0 0 0 setrgbcolor
0.00793 setlinewidth
0.50393 0.50946 Mdot
0 0 0 setrgbcolor
0.01184 setlinewidth
0.53479 0.50533 Mdot
0 0 0 setrgbcolor
0.01912 setlinewidth
0.52204 0.50303 Mdot
0 0 0 setrgbcolor
0.01723 setlinewidth
0.49233 0.54534 Mdot
0 0 0 setrgbcolor
0.01783 setlinewidth
0.5507 0.51838 Mdot
0 0 0 setrgbcolor
0.01494 setlinewidth
0.52132 0.56786 Mdot
0 0 0 setrgbcolor
0.01247 setlinewidth
0.53749 0.5061 Mdot
0 0 0 setrgbcolor
0.01538 setlinewidth
0.52557 0.50277 Mdot
0 0 0 setrgbcolor
0.01011 setlinewidth
0.52808 0.56792 Mdot
0 0 0 setrgbcolor
0.01643 setlinewidth
0.52292 0.50215 Mdot
0 0 0 setrgbcolor
0.01867 setlinewidth
0.52347 0.50201 Mdot
0 0 0 setrgbcolor
0.0105 setlinewidth
0.52044 0.50208 Mdot
0 0 0 setrgbcolor
0.00939 setlinewidth
0.50019 0.51081 Mdot
0 0 0 setrgbcolor
0.00533 setlinewidth
0.54349 0.50846 Mdot
0 0 0 setrgbcolor
0.01393 setlinewidth
0.52207 0.50161 Mdot
0 0 0 setrgbcolor
0.01204 setlinewidth
0.52288 0.50139 Mdot
0 0 0 setrgbcolor
0.00735 setlinewidth
0.52006 0.50126 Mdot
0 0 0 setrgbcolor
0.01553 setlinewidth
0.52053 0.50088 Mdot
0 0 0 setrgbcolor
0.01343 setlinewidth
0.55618 0.52476 Mdot
0 0 0 setrgbcolor
0.01008 setlinewidth
0.55774 0.53271 Mdot
0 0 0 setrgbcolor
0.01549 setlinewidth
0.5418 0.50559 Mdot
0 0 0 setrgbcolor
0.00774 setlinewidth
0.5275 0.50045 Mdot
0 0 0 setrgbcolor
0.0118 setlinewidth
0.53476 0.50174 Mdot
0 0 0 setrgbcolor
0.01717 setlinewidth
0.52341 0.49975 Mdot
0 0 0 setrgbcolor
0.01292 setlinewidth
0.5335 0.50115 Mdot
0 0 0 setrgbcolor
0.01917 setlinewidth
0.48751 0.539 Mdot
0 0 0 setrgbcolor
0.01473 setlinewidth
0.4888 0.54661 Mdot
0 0 0 setrgbcolor
0.01267 setlinewidth
0.51388 0.50007 Mdot
0 0 0 setrgbcolor
0.0188 setlinewidth
0.54453 0.56494 Mdot
0 0 0 setrgbcolor
0.00636 setlinewidth
0.50574 0.50311 Mdot
0 0 0 setrgbcolor
0.0194 setlinewidth
0.49944 0.50739 Mdot
0 0 0 setrgbcolor
0.01314 setlinewidth
0.53037 0.49925 Mdot
0 0 0 setrgbcolor
0.01635 setlinewidth
0.52373 0.49844 Mdot
0 0 0 setrgbcolor
0.01052 setlinewidth
0.52258 0.49805 Mdot
0 0 0 setrgbcolor
0.00905 setlinewidth
0.51806 0.57245 Mdot
0 0 0 setrgbcolor
0.01416 setlinewidth
0.52894 0.57254 Mdot
0 0 0 setrgbcolor
0.01152 setlinewidth
0.5108 0.57096 Mdot
0 0 0 setrgbcolor
0.01898 setlinewidth
0.56082 0.53563 Mdot
0 0 0 setrgbcolor
0.01564 setlinewidth
0.48822 0.55149 Mdot
0 0 0 setrgbcolor
0.01983 setlinewidth
0.49257 0.51192 Mdot
0 0 0 setrgbcolor
0.01518 setlinewidth
0.49145 0.55744 Mdot
0 0 0 setrgbcolor
0.01477 setlinewidth
0.56195 0.53681 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.56196 0.54212 Mdot
0 0 0 setrgbcolor
0.01762 setlinewidth
0.50953 0.49829 Mdot
0 0 0 setrgbcolor
0.01689 setlinewidth
0.51913 0.57462 Mdot
0 0 0 setrgbcolor
0.01406 setlinewidth
0.51685 0.57451 Mdot
0 0 0 setrgbcolor
0.00793 setlinewidth
0.5158 0.57441 Mdot
0 0 0 setrgbcolor
0.00942 setlinewidth
0.53911 0.57195 Mdot
0 0 0 setrgbcolor
0.00896 setlinewidth
0.55029 0.50593 Mdot
0 0 0 setrgbcolor
0.01317 setlinewidth
0.52446 0.49521 Mdot
0 0 0 setrgbcolor
0.018 setlinewidth
0.48283 0.53515 Mdot
0 0 0 setrgbcolor
0.0198 setlinewidth
0.50699 0.49838 Mdot
0 0 0 setrgbcolor
0.01749 setlinewidth
0.56317 0.52985 Mdot
0 0 0 setrgbcolor
0.01258 setlinewidth
0.50345 0.57105 Mdot
0 0 0 setrgbcolor
0.00889 setlinewidth
0.48634 0.55295 Mdot
0 0 0 setrgbcolor
0.01639 setlinewidth
0.50901 0.57375 Mdot
0 0 0 setrgbcolor
0.00938 setlinewidth
0.4879 0.51434 Mdot
0 0 0 setrgbcolor
0.01271 setlinewidth
0.4848 0.52062 Mdot
0 0 0 setrgbcolor
0.01785 setlinewidth
0.48226 0.53966 Mdot
0 0 0 setrgbcolor
0.01351 setlinewidth
0.50773 0.49725 Mdot
0 0 0 setrgbcolor
0.01362 setlinewidth
0.49201 0.50821 Mdot
0 0 0 setrgbcolor
0.01052 setlinewidth
0.50239 0.49953 Mdot
0 0 0 setrgbcolor
0.01498 setlinewidth
0.56183 0.55007 Mdot
0 0 0 setrgbcolor
0.01993 setlinewidth
0.56249 0.5482 Mdot
0 0 0 setrgbcolor
0.00614 setlinewidth
0.52738 0.57658 Mdot
0 0 0 setrgbcolor
0.01899 setlinewidth
0.4975 0.56796 Mdot
0 0 0 setrgbcolor
0.00904 setlinewidth
0.56443 0.53227 Mdot
0 0 0 setrgbcolor
0.0135 setlinewidth
0.5293 0.49437 Mdot
0 0 0 setrgbcolor
0.00876 setlinewidth
0.50427 0.49843 Mdot
0 0 0 setrgbcolor
0.01694 setlinewidth
0.55615 0.5104 Mdot
0 0 0 setrgbcolor
0.0194 setlinewidth
0.54881 0.50293 Mdot
0 0 0 setrgbcolor
0.00778 setlinewidth
0.56324 0.52553 Mdot
0 0 0 setrgbcolor
0.00965 setlinewidth
0.5116 0.49565 Mdot
0 0 0 setrgbcolor
0.01328 setlinewidth
0.56261 0.52331 Mdot
0 0 0 setrgbcolor
0.01699 setlinewidth
0.52944 0.57615 Mdot
0 0 0 setrgbcolor
0.00882 setlinewidth
0.56396 0.54101 Mdot
0 0 0 setrgbcolor
0.01629 setlinewidth
0.50891 0.57406 Mdot
0 0 0 setrgbcolor
0.01629 setlinewidth
0.56404 0.53078 Mdot
0 0 0 setrgbcolor
0.0132 setlinewidth
0.49096 0.50962 Mdot
0 0 0 setrgbcolor
0.00643 setlinewidth
0.49392 0.50635 Mdot
0 0 0 setrgbcolor
0.01665 setlinewidth
0.53624 0.5743 Mdot
0 0 0 setrgbcolor
0.00629 setlinewidth
0.5339 0.57499 Mdot
0 0 0 setrgbcolor
0.01867 setlinewidth
0.5476 0.50248 Mdot
0 0 0 setrgbcolor
0.01492 setlinewidth
0.56132 0.52073 Mdot
0 0 0 setrgbcolor
0.01691 setlinewidth
0.56373 0.5307 Mdot
0 0 0 setrgbcolor
0.0112 setlinewidth
0.50549 0.57227 Mdot
0 0 0 setrgbcolor
0.00806 setlinewidth
0.50022 0.50145 Mdot
0 0 0 setrgbcolor
0.00861 setlinewidth
0.53354 0.49586 Mdot
0 0 0 setrgbcolor
0.01888 setlinewidth
0.50478 0.57185 Mdot
0 0 0 setrgbcolor
0.01095 setlinewidth
0.53313 0.49587 Mdot
0 0 0 setrgbcolor
0.01859 setlinewidth
0.53992 0.57185 Mdot
0 0 0 setrgbcolor
0.01788 setlinewidth
0.56244 0.54324 Mdot
0 0 0 setrgbcolor
0.01819 setlinewidth
0.48431 0.54538 Mdot
0 0 0 setrgbcolor
0.00785 setlinewidth
0.55852 0.55398 Mdot
0 0 0 setrgbcolor
0.01569 setlinewidth
0.52344 0.57507 Mdot
0 0 0 setrgbcolor
0.00951 setlinewidth
0.51686 0.49616 Mdot
0 0 0 setrgbcolor
0.00712 setlinewidth
0.48557 0.54675 Mdot
0 0 0 setrgbcolor
0.01362 setlinewidth
0.53162 0.57319 Mdot
0 0 0 setrgbcolor
0.01015 setlinewidth
0.50222 0.56781 Mdot
0 0 0 setrgbcolor
0.0147 setlinewidth
0.50624 0.50064 Mdot
0 0 0 setrgbcolor
0.0057 setlinewidth
0.53509 0.57197 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.54638 0.56569 Mdot
0 0 0 setrgbcolor
0.01654 setlinewidth
0.51543 0.57275 Mdot
0 0 0 setrgbcolor
0.01521 setlinewidth
0.5482 0.56401 Mdot
0 0 0 setrgbcolor
0.01376 setlinewidth
0.55114 0.5602 Mdot
0 0 0 setrgbcolor
0.01336 setlinewidth
0.49831 0.50746 Mdot
0 0 0 setrgbcolor
0.01026 setlinewidth
0.52566 0.49821 Mdot
0 0 0 setrgbcolor
0.01264 setlinewidth
0.53298 0.57123 Mdot
0 0 0 setrgbcolor
0.01094 setlinewidth
0.48603 0.53605 Mdot
0 0 0 setrgbcolor
0.01631 setlinewidth
0.51505 0.57148 Mdot
0 0 0 setrgbcolor
0.00594 setlinewidth
0.54945 0.56121 Mdot
0 0 0 setrgbcolor
0.01162 setlinewidth
0.50174 0.50526 Mdot
0 0 0 setrgbcolor
0.00868 setlinewidth
0.5035 0.50492 Mdot
0 0 0 setrgbcolor
0.01856 setlinewidth
0.52926 0.571 Mdot
0 0 0 setrgbcolor
0.01984 setlinewidth
0.49821 0.56156 Mdot
0 0 0 setrgbcolor
0.0105 setlinewidth
0.49109 0.55098 Mdot
0 0 0 setrgbcolor
0.01489 setlinewidth
0.52318 0.57087 Mdot
0 0 0 setrgbcolor
0.01103 setlinewidth
0.49057 0.52123 Mdot
0 0 0 setrgbcolor
0.01022 setlinewidth
0.55799 0.5295 Mdot
0 0 0 setrgbcolor
0.00923 setlinewidth
0.51621 0.57003 Mdot
0 0 0 setrgbcolor
0.00895 setlinewidth
0.50531 0.50481 Mdot
0 0 0 setrgbcolor
0.01371 setlinewidth
0.52046 0.57041 Mdot
0 0 0 setrgbcolor
0.00576 setlinewidth
0.54643 0.56151 Mdot
0 0 0 setrgbcolor
0.01365 setlinewidth
0.53706 0.56721 Mdot
0 0 0 setrgbcolor
0.00939 setlinewidth
0.52338 0.56997 Mdot
0 0 0 setrgbcolor
0.00621 setlinewidth
0.55712 0.53053 Mdot
0 0 0 setrgbcolor
0.00666 setlinewidth
0.51918 0.56948 Mdot
0 0 0 setrgbcolor
0.00701 setlinewidth
0.54955 0.55722 Mdot
0 0 0 setrgbcolor
0.018 setlinewidth
0.53243 0.56826 Mdot
0 0 0 setrgbcolor
0.01524 setlinewidth
0.52263 0.56904 Mdot
0 0 0 setrgbcolor
0.01435 setlinewidth
0.52312 0.56903 Mdot
0 0 0 setrgbcolor
0.01608 setlinewidth
0.49814 0.51274 Mdot
0 0 0 setrgbcolor
0.00555 setlinewidth
0.50637 0.56437 Mdot
0 0 0 setrgbcolor
0.01672 setlinewidth
0.49007 0.53451 Mdot
0 0 0 setrgbcolor
0.01057 setlinewidth
0.53764 0.56436 Mdot
0 0 0 setrgbcolor
0.01368 setlinewidth
0.52989 0.56657 Mdot
0 0 0 setrgbcolor
0.007 setlinewidth
0.55387 0.53443 Mdot
0 0 0 setrgbcolor
0.0139 setlinewidth
0.52105 0.56545 Mdot
0 0 0 setrgbcolor
0.01961 setlinewidth
0.52612 0.56535 Mdot
0 0 0 setrgbcolor
0.00716 setlinewidth
0.52457 0.56486 Mdot
0 0 0 setrgbcolor
0.01281 setlinewidth
0.50739 0.55919 Mdot
0 0 0 setrgbcolor
0.01967 setlinewidth
0.54926 0.52431 Mdot
0 0 0 setrgbcolor
0.01685 setlinewidth
0.50269 0.5158 Mdot
0 0 0 setrgbcolor
0.00674 setlinewidth
0.54432 0.51768 Mdot
0 0 0 setrgbcolor
0.00717 setlinewidth
0.50319 0.51706 Mdot
0 0 0 setrgbcolor
0.00609 setlinewidth
0.54916 0.53963 Mdot
0 0 0 setrgbcolor
0.0064 setlinewidth
0.50468 0.5175 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.54233 0.51939 Mdot
0 0 0 setrgbcolor
0.01742 setlinewidth
0.51627 0.51157 Mdot
0 0 0 setrgbcolor
0.00549 setlinewidth
0.51884 0.5579 Mdot
0 0 0 setrgbcolor
0.01945 setlinewidth
0.54035 0.54589 Mdot
0 0 0 setrgbcolor
0.01855 setlinewidth
0.51873 0.55439 Mdot
0 0 0 setrgbcolor
0.01711 setlinewidth
0.5366 0.54833 Mdot
0 0 0 setrgbcolor
0.01716 setlinewidth
0.54076 0.53451 Mdot
0 0 0 setrgbcolor
0.01361 setlinewidth
0.50943 0.52422 Mdot
0 0 0 setrgbcolor
0.00827 setlinewidth
0.53604 0.54668 Mdot
0 0 0 setrgbcolor
0.01395 setlinewidth
0.53263 0.54899 Mdot
0 0 0 setrgbcolor
0.01319 setlinewidth
0.52384 0.5501 Mdot
0 0 0 setrgbcolor
0.01051 setlinewidth
0.5373 0.53179 Mdot
0 0 0 setrgbcolor
0.01194 setlinewidth
0.52517 0.54832 Mdot
0 0 0 setrgbcolor
0.01839 setlinewidth
0.51407 0.54054 Mdot
0 0 0 setrgbcolor
0.01411 setlinewidth
0.52831 0.53361 Mdot
0 0 0 setrgbcolor
0.01099 setlinewidth
0.52663 0.53563 Mdot
1 1 1 setrgbcolor
0.00939 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.01109 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.0073 setlinewidth
0.52189 0.52628 Mdot
0 0 0 setrgbcolor
0.01146 setlinewidth
0.53214 0.53916 Mdot
0 0 0 setrgbcolor
0.01088 setlinewidth
0.52141 0.52177 Mdot
0 0 0 setrgbcolor
0.01721 setlinewidth
0.52121 0.51715 Mdot
0 0 0 setrgbcolor
0.01419 setlinewidth
0.5191 0.51572 Mdot
0 0 0 setrgbcolor
0.01257 setlinewidth
0.50403 0.54201 Mdot
0 0 0 setrgbcolor
0.00786 setlinewidth
0.52193 0.51515 Mdot
0 0 0 setrgbcolor
0.00737 setlinewidth
0.5218 0.51514 Mdot
0 0 0 setrgbcolor
0.01137 setlinewidth
0.51227 0.51795 Mdot
0 0 0 setrgbcolor
0.00874 setlinewidth
0.51656 0.51587 Mdot
0 0 0 setrgbcolor
0.00779 setlinewidth
0.54258 0.52591 Mdot
0 0 0 setrgbcolor
0.01398 setlinewidth
0.52424 0.5134 Mdot
0 0 0 setrgbcolor
0.01925 setlinewidth
0.50924 0.51678 Mdot
0 0 0 setrgbcolor
0.01541 setlinewidth
0.54485 0.52549 Mdot
0 0 0 setrgbcolor
0.01211 setlinewidth
0.51798 0.51151 Mdot
0 0 0 setrgbcolor
0.01748 setlinewidth
0.4983 0.53596 Mdot
0 0 0 setrgbcolor
0.0127 setlinewidth
0.51305 0.51202 Mdot
0 0 0 setrgbcolor
0.01368 setlinewidth
0.54791 0.5297 Mdot
0 0 0 setrgbcolor
0.00771 setlinewidth
0.49758 0.53622 Mdot
0 0 0 setrgbcolor
0.01678 setlinewidth
0.51254 0.51002 Mdot
0 0 0 setrgbcolor
0.01453 setlinewidth
0.51564 0.50789 Mdot
0 0 0 setrgbcolor
0.01874 setlinewidth
0.49866 0.55 Mdot
0 0 0 setrgbcolor
0.01037 setlinewidth
0.53811 0.56015 Mdot
0 0 0 setrgbcolor
0.01347 setlinewidth
0.55004 0.52168 Mdot
0 0 0 setrgbcolor
0.00907 setlinewidth
0.50496 0.51108 Mdot
0 0 0 setrgbcolor
0.01454 setlinewidth
0.50101 0.51308 Mdot
0 0 0 setrgbcolor
0.01005 setlinewidth
0.53186 0.5052 Mdot
0 0 0 setrgbcolor
0.01369 setlinewidth
0.53703 0.50699 Mdot
0 0 0 setrgbcolor
0.01124 setlinewidth
0.53335 0.56538 Mdot
0 0 0 setrgbcolor
0.012 setlinewidth
0.52158 0.50315 Mdot
0 0 0 setrgbcolor
0.00727 setlinewidth
0.49179 0.54425 Mdot
0 0 0 setrgbcolor
0.00504 setlinewidth
0.52367 0.50252 Mdot
0 0 0 setrgbcolor
0.01378 setlinewidth
0.52534 0.50256 Mdot
0 0 0 setrgbcolor
0.0162 setlinewidth
0.54032 0.50698 Mdot
0 0 0 setrgbcolor
0.01706 setlinewidth
0.49413 0.55194 Mdot
0 0 0 setrgbcolor
0.0131 setlinewidth
0.53939 0.56467 Mdot
0 0 0 setrgbcolor
0.01132 setlinewidth
0.52315 0.50162 Mdot
0 0 0 setrgbcolor
0.01616 setlinewidth
0.52231 0.50157 Mdot
0 0 0 setrgbcolor
0.01747 setlinewidth
0.52026 0.50086 Mdot
0 0 0 setrgbcolor
0.00945 setlinewidth
0.52853 0.50116 Mdot
0 0 0 setrgbcolor
0.01345 setlinewidth
0.53148 0.56899 Mdot
0 0 0 setrgbcolor
0.01798 setlinewidth
0.52577 0.50076 Mdot
0 0 0 setrgbcolor
0.01897 setlinewidth
0.52284 0.50054 Mdot
0 0 0 setrgbcolor
0.01824 setlinewidth
0.55367 0.51862 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.5458 0.56182 Mdot
0 0 0 setrgbcolor
0.01627 setlinewidth
0.52334 0.50032 Mdot
0 0 0 setrgbcolor
0.01982 setlinewidth
0.52173 0.50012 Mdot
0 0 0 setrgbcolor
0.0083 setlinewidth
0.4987 0.50973 Mdot
0 0 0 setrgbcolor
0.00599 setlinewidth
0.5195 0.50009 Mdot
0 0 0 setrgbcolor
0.01315 setlinewidth
0.52246 0.49978 Mdot
0 0 0 setrgbcolor
0.00884 setlinewidth
0.53568 0.50196 Mdot
0 0 0 setrgbcolor
0.01692 setlinewidth
0.54699 0.5087 Mdot
0 0 0 setrgbcolor
0.00607 setlinewidth
0.51981 0.49963 Mdot
0 0 0 setrgbcolor
0.01399 setlinewidth
0.53827 0.56805 Mdot
0 0 0 setrgbcolor
0.01887 setlinewidth
0.54944 0.51059 Mdot
0 0 0 setrgbcolor
0.01203 setlinewidth
0.50442 0.50431 Mdot
0 0 0 setrgbcolor
0.00528 setlinewidth
0.53845 0.50234 Mdot
0 0 0 setrgbcolor
0.01269 setlinewidth
0.49328 0.55716 Mdot
0 0 0 setrgbcolor
0.00527 setlinewidth
0.51227 0.49988 Mdot
0 0 0 setrgbcolor
0.01026 setlinewidth
0.49161 0.51554 Mdot
0 0 0 setrgbcolor
0.01707 setlinewidth
0.52222 0.49803 Mdot
0 0 0 setrgbcolor
0.01788 setlinewidth
0.55124 0.51078 Mdot
0 0 0 setrgbcolor
0.01958 setlinewidth
0.52663 0.4981 Mdot
0 0 0 setrgbcolor
0.01813 setlinewidth
0.49738 0.56283 Mdot
0 0 0 setrgbcolor
0.00501 setlinewidth
0.55389 0.51304 Mdot
0 0 0 setrgbcolor
0.01238 setlinewidth
0.54461 0.50388 Mdot
0 0 0 setrgbcolor
0.00977 setlinewidth
0.53409 0.49831 Mdot
0 0 0 setrgbcolor
0.01401 setlinewidth
0.53265 0.49789 Mdot
0 0 0 setrgbcolor
0.01912 setlinewidth
0.52184 0.49665 Mdot
0 0 0 setrgbcolor
0.0146 setlinewidth
0.51951 0.57391 Mdot
0 0 0 setrgbcolor
0.01399 setlinewidth
0.52045 0.49645 Mdot
0 0 0 setrgbcolor
0.00873 setlinewidth
0.54201 0.50119 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.52722 0.57437 Mdot
0 0 0 setrgbcolor
0.01035 setlinewidth
0.52876 0.49645 Mdot
0 0 0 setrgbcolor
0.01971 setlinewidth
0.48415 0.54116 Mdot
0 0 0 setrgbcolor
0.01941 setlinewidth
0.5598 0.51889 Mdot
0 0 0 setrgbcolor
0.0188 setlinewidth
0.50611 0.49882 Mdot
0 0 0 setrgbcolor
0.01298 setlinewidth
0.56262 0.52692 Mdot
0 0 0 setrgbcolor
0.01695 setlinewidth
0.53822 0.57284 Mdot
0 0 0 setrgbcolor
0.014 setlinewidth
0.48996 0.55908 Mdot
0 0 0 setrgbcolor
0.01785 setlinewidth
0.55343 0.56256 Mdot
0 0 0 setrgbcolor
0.01186 setlinewidth
0.4834 0.54598 Mdot
0 0 0 setrgbcolor
0.0134 setlinewidth
0.4831 0.52589 Mdot
0 0 0 setrgbcolor
0.01615 setlinewidth
0.48533 0.51892 Mdot
0 0 0 setrgbcolor
0.00795 setlinewidth
0.50291 0.49936 Mdot
0 0 0 setrgbcolor
0.01609 setlinewidth
0.52756 0.57655 Mdot
0 0 0 setrgbcolor
0.00843 setlinewidth
0.5251 0.57679 Mdot
0 0 0 setrgbcolor
0.01273 setlinewidth
0.52396 0.57685 Mdot
0 0 0 setrgbcolor
0.00687 setlinewidth
0.51004 0.57526 Mdot
0 0 0 setrgbcolor
0.01365 setlinewidth
0.48809 0.51197 Mdot
0 0 0 setrgbcolor
0.01647 setlinewidth
0.52029 0.49331 Mdot
0 0 0 setrgbcolor
0.01466 setlinewidth
0.56509 0.52957 Mdot
0 0 0 setrgbcolor
0.01965 setlinewidth
0.50264 0.49813 Mdot
0 0 0 setrgbcolor
0.01937 setlinewidth
0.51591 0.57725 Mdot
0 0 0 setrgbcolor
0.01575 setlinewidth
0.49695 0.50138 Mdot
0 0 0 setrgbcolor
0.00824 setlinewidth
0.54719 0.57081 Mdot
0 0 0 setrgbcolor
0.01267 setlinewidth
0.56584 0.53067 Mdot
0 0 0 setrgbcolor
0.00636 setlinewidth
0.54835 0.50038 Mdot
0 0 0 setrgbcolor
0.01524 setlinewidth
0.50204 0.57306 Mdot
0 0 0 setrgbcolor
0.01746 setlinewidth
0.56633 0.53623 Mdot
0 0 0 setrgbcolor
0.00821 setlinewidth
0.49791 0.50001 Mdot
0 0 0 setrgbcolor
0.0072 setlinewidth
0.48538 0.51372 Mdot
0 0 0 setrgbcolor
0.01606 setlinewidth
0.48781 0.50989 Mdot
0 0 0 setrgbcolor
0.0181 setlinewidth
0.5649 0.52331 Mdot
0 0 0 setrgbcolor
0.00522 setlinewidth
0.50447 0.49601 Mdot
0 0 0 setrgbcolor
0.0106 setlinewidth
0.53375 0.57754 Mdot
0 0 0 setrgbcolor
0.01446 setlinewidth
0.52282 0.49184 Mdot
0 0 0 setrgbcolor
0.01774 setlinewidth
0.49309 0.50385 Mdot
0 0 0 setrgbcolor
0.00725 setlinewidth
0.51353 0.57777 Mdot
0 0 0 setrgbcolor
0.0164 setlinewidth
0.48291 0.55183 Mdot
0 0 0 setrgbcolor
0.01333 setlinewidth
0.50928 0.57646 Mdot
0 0 0 setrgbcolor
0.01444 setlinewidth
0.50841 0.57613 Mdot
0 0 0 setrgbcolor
0.01073 setlinewidth
0.53488 0.57686 Mdot
0 0 0 setrgbcolor
0.01453 setlinewidth
0.48382 0.55311 Mdot
0 0 0 setrgbcolor
0.01479 setlinewidth
0.54364 0.49769 Mdot
0 0 0 setrgbcolor
0.01659 setlinewidth
0.56493 0.54473 Mdot
0 0 0 setrgbcolor
0.01541 setlinewidth
0.5653 0.54268 Mdot
0 0 0 setrgbcolor
0.01566 setlinewidth
0.55246 0.5043 Mdot
0 0 0 setrgbcolor
0.01182 setlinewidth
0.53887 0.57502 Mdot
0 0 0 setrgbcolor
0.01833 setlinewidth
0.526 0.49282 Mdot
0 0 0 setrgbcolor
0.01237 setlinewidth
0.54118 0.57395 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.56462 0.52578 Mdot
0 0 0 setrgbcolor
0.00832 setlinewidth
0.52546 0.49291 Mdot
0 0 0 setrgbcolor
0.00825 setlinewidth
0.50805 0.49584 Mdot
0 0 0 setrgbcolor
0.00953 setlinewidth
0.54156 0.49746 Mdot
0 0 0 setrgbcolor
0.01751 setlinewidth
0.48157 0.54204 Mdot
0 0 0 setrgbcolor
0.01095 setlinewidth
0.49731 0.5022 Mdot
0 0 0 setrgbcolor
0.01796 setlinewidth
0.56175 0.51898 Mdot
0 0 0 setrgbcolor
0.01039 setlinewidth
0.56073 0.51677 Mdot
0 0 0 setrgbcolor
0.01212 setlinewidth
0.50352 0.57246 Mdot
0 0 0 setrgbcolor
0.01515 setlinewidth
0.56472 0.53502 Mdot
0 0 0 setrgbcolor
0.00767 setlinewidth
0.52688 0.57677 Mdot
0 0 0 setrgbcolor
0.01501 setlinewidth
0.48971 0.51055 Mdot
0 0 0 setrgbcolor
0.01618 setlinewidth
0.56309 0.52435 Mdot
0 0 0 setrgbcolor
0.01255 setlinewidth
0.49267 0.50775 Mdot
0 0 0 setrgbcolor
0.01198 setlinewidth
0.54356 0.57092 Mdot
0 0 0 setrgbcolor
0.01796 setlinewidth
0.55832 0.51433 Mdot
0 0 0 setrgbcolor
0.00699 setlinewidth
0.48328 0.52605 Mdot
0 0 0 setrgbcolor
0.01678 setlinewidth
0.48841 0.55677 Mdot
0 0 0 setrgbcolor
0.00846 setlinewidth
0.56229 0.52435 Mdot
0 0 0 setrgbcolor
0.01968 setlinewidth
0.51748 0.57562 Mdot
0 0 0 setrgbcolor
0.01988 setlinewidth
0.49741 0.56665 Mdot
0 0 0 setrgbcolor
0.00906 setlinewidth
0.49413 0.50714 Mdot
0 0 0 setrgbcolor
0.01841 setlinewidth
0.53435 0.57363 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.49564 0.50677 Mdot
0 0 0 setrgbcolor
0.00897 setlinewidth
0.51637 0.5744 Mdot
0 0 0 setrgbcolor
0.01345 setlinewidth
0.516 0.49667 Mdot
0 0 0 setrgbcolor
0.01221 setlinewidth
0.48406 0.53993 Mdot
0 0 0 setrgbcolor
0.00559 setlinewidth
0.53757 0.57185 Mdot
0 0 0 setrgbcolor
0.00549 setlinewidth
0.5597 0.5495 Mdot
0 0 0 setrgbcolor
0.01206 setlinewidth
0.56214 0.53768 Mdot
0 0 0 setrgbcolor
0.00688 setlinewidth
0.48907 0.51613 Mdot
0 0 0 setrgbcolor
0.01675 setlinewidth
0.51669 0.57277 Mdot
0 0 0 setrgbcolor
0.00671 setlinewidth
0.53467 0.57145 Mdot
0 0 0 setrgbcolor
0.01433 setlinewidth
0.54799 0.56363 Mdot
0 0 0 setrgbcolor
0.01116 setlinewidth
0.50526 0.56842 Mdot
0 0 0 setrgbcolor
0.00504 setlinewidth
0.52397 0.5726 Mdot
0 0 0 setrgbcolor
0.01877 setlinewidth
0.54952 0.5616 Mdot
0 0 0 setrgbcolor
0.01307 setlinewidth
0.52102 0.57253 Mdot
0 0 0 setrgbcolor
0.01266 setlinewidth
0.53042 0.5718 Mdot
0 0 0 setrgbcolor
0.01098 setlinewidth
0.51931 0.57178 Mdot
0 0 0 setrgbcolor
0.01109 setlinewidth
0.52375 0.57166 Mdot
0 0 0 setrgbcolor
0.00832 setlinewidth
0.55165 0.55722 Mdot
0 0 0 setrgbcolor
0.01999 setlinewidth
0.52255 0.57082 Mdot
0 0 0 setrgbcolor
0.0172 setlinewidth
0.54984 0.55854 Mdot
0 0 0 setrgbcolor
0.00678 setlinewidth
0.52305 0.57074 Mdot
0 0 0 setrgbcolor
0.00514 setlinewidth
0.49285 0.5187 Mdot
0 0 0 setrgbcolor
0.00602 setlinewidth
0.53257 0.56852 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.53732 0.56672 Mdot
0 0 0 setrgbcolor
0.00637 setlinewidth
0.49332 0.51994 Mdot
0 0 0 setrgbcolor
0.01961 setlinewidth
0.50432 0.56298 Mdot
0 0 0 setrgbcolor
0.00983 setlinewidth
0.5461 0.55936 Mdot
0 0 0 setrgbcolor
0.00751 setlinewidth
0.5291 0.5672 Mdot
0 0 0 setrgbcolor
0.01773 setlinewidth
0.51949 0.56739 Mdot
0 0 0 setrgbcolor
0.00987 setlinewidth
0.49466 0.52018 Mdot
0 0 0 setrgbcolor
0.01112 setlinewidth
0.55311 0.52422 Mdot
0 0 0 setrgbcolor
0.01693 setlinewidth
0.5484 0.55444 Mdot
0 0 0 setrgbcolor
0.01255 setlinewidth
0.5368 0.56372 Mdot
0 0 0 setrgbcolor
0.01814 setlinewidth
0.52464 0.56653 Mdot
0 0 0 setrgbcolor
0.01134 setlinewidth
0.52285 0.56627 Mdot
0 0 0 setrgbcolor
0.01616 setlinewidth
0.55204 0.52546 Mdot
0 0 0 setrgbcolor
0.0181 setlinewidth
0.50535 0.51224 Mdot
0 0 0 setrgbcolor
0.01486 setlinewidth
0.51481 0.55998 Mdot
0 0 0 setrgbcolor
0.01011 setlinewidth
0.54836 0.5301 Mdot
0 0 0 setrgbcolor
0.01925 setlinewidth
0.49946 0.5265 Mdot
0 0 0 setrgbcolor
0.00803 setlinewidth
0.53535 0.51418 Mdot
0 0 0 setrgbcolor
0.00672 setlinewidth
0.54157 0.5203 Mdot
0 0 0 setrgbcolor
0.01441 setlinewidth
0.51374 0.55638 Mdot
0 0 0 setrgbcolor
0.00716 setlinewidth
0.53313 0.51631 Mdot
0 0 0 setrgbcolor
0.01821 setlinewidth
0.54345 0.5363 Mdot
0 0 0 setrgbcolor
0.00734 setlinewidth
0.50612 0.54276 Mdot
0 0 0 setrgbcolor
0.00631 setlinewidth
0.51782 0.55119 Mdot
0 0 0 setrgbcolor
0.01386 setlinewidth
0.53453 0.54424 Mdot
0 0 0 setrgbcolor
0.01376 setlinewidth
0.51877 0.54914 Mdot
0 0 0 setrgbcolor
0.00836 setlinewidth
0.53092 0.54737 Mdot
0 0 0 setrgbcolor
0.01946 setlinewidth
0.52676 0.54868 Mdot
0 0 0 setrgbcolor
0.01329 setlinewidth
0.52994 0.54575 Mdot
0 0 0 setrgbcolor
0.0192 setlinewidth
0.53293 0.53236 Mdot
0 0 0 setrgbcolor
0.01929 setlinewidth
0.5287 0.53008 Mdot
0 0 0 setrgbcolor
0.01914 setlinewidth
0.5179 0.53575 Mdot
0 0 0 setrgbcolor
0.01081 setlinewidth
0.51934 0.53339 Mdot
1 1 1 setrgbcolor
0.01109 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.01408 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01376 setlinewidth
0.5292 0.52547 Mdot
0 0 0 setrgbcolor
0.01865 setlinewidth
0.51263 0.54458 Mdot
0 0 0 setrgbcolor
0.01462 setlinewidth
0.52775 0.52089 Mdot
0 0 0 setrgbcolor
0.01419 setlinewidth
0.51727 0.51838 Mdot
0 0 0 setrgbcolor
0.01245 setlinewidth
0.50532 0.53924 Mdot
0 0 0 setrgbcolor
0.01047 setlinewidth
0.54158 0.53727 Mdot
0 0 0 setrgbcolor
0.0134 setlinewidth
0.50453 0.53962 Mdot
0 0 0 setrgbcolor
0.00918 setlinewidth
0.52646 0.51615 Mdot
0 0 0 setrgbcolor
0.01925 setlinewidth
0.5213 0.51557 Mdot
0 0 0 setrgbcolor
0.01411 setlinewidth
0.51369 0.51767 Mdot
0 0 0 setrgbcolor
0.00864 setlinewidth
0.52392 0.51501 Mdot
0 0 0 setrgbcolor
0.01208 setlinewidth
0.52655 0.51399 Mdot
0 0 0 setrgbcolor
0.01096 setlinewidth
0.52668 0.51398 Mdot
0 0 0 setrgbcolor
0.01364 setlinewidth
0.51651 0.51216 Mdot
0 0 0 setrgbcolor
0.00913 setlinewidth
0.52857 0.51182 Mdot
0 0 0 setrgbcolor
0.01404 setlinewidth
0.50723 0.55377 Mdot
0 0 0 setrgbcolor
0.01054 setlinewidth
0.52159 0.51086 Mdot
0 0 0 setrgbcolor
0.01092 setlinewidth
0.51537 0.5102 Mdot
0 0 0 setrgbcolor
0.01307 setlinewidth
0.5073 0.51251 Mdot
0 0 0 setrgbcolor
0.00929 setlinewidth
0.49857 0.54892 Mdot
0 0 0 setrgbcolor
0.01688 setlinewidth
0.50339 0.51521 Mdot
0 0 0 setrgbcolor
0.01771 setlinewidth
0.518 0.50752 Mdot
0 0 0 setrgbcolor
0.00912 setlinewidth
0.54923 0.52196 Mdot
0 0 0 setrgbcolor
0.01737 setlinewidth
0.5019 0.55654 Mdot
0 0 0 setrgbcolor
0.00619 setlinewidth
0.55119 0.52119 Mdot
0 0 0 setrgbcolor
0.00887 setlinewidth
0.49953 0.51218 Mdot
0 0 0 setrgbcolor
0.00844 setlinewidth
0.55474 0.52511 Mdot
0 0 0 setrgbcolor
0.01238 setlinewidth
0.52254 0.50172 Mdot
0 0 0 setrgbcolor
0.01543 setlinewidth
0.49267 0.51934 Mdot
0 0 0 setrgbcolor
0.00764 setlinewidth
0.54881 0.55834 Mdot
0 0 0 setrgbcolor
0.00827 setlinewidth
0.52443 0.50075 Mdot
0 0 0 setrgbcolor
0.00878 setlinewidth
0.5335 0.50223 Mdot
0 0 0 setrgbcolor
0.01164 setlinewidth
0.50082 0.56215 Mdot
0 0 0 setrgbcolor
0.00729 setlinewidth
0.52612 0.50053 Mdot
0 0 0 setrgbcolor
0.00554 setlinewidth
0.50424 0.50569 Mdot
0 0 0 setrgbcolor
0.01041 setlinewidth
0.52266 0.5 Mdot
0 0 0 setrgbcolor
0.01718 setlinewidth
0.52354 0.49992 Mdot
0 0 0 setrgbcolor
0.01514 setlinewidth
0.539 0.50328 Mdot
0 0 0 setrgbcolor
0.01365 setlinewidth
0.52026 0.4996 Mdot
0 0 0 setrgbcolor
0.01273 setlinewidth
0.54421 0.56454 Mdot
0 0 0 setrgbcolor
0.01118 setlinewidth
0.52276 0.49887 Mdot
0 0 0 setrgbcolor
0.01069 setlinewidth
0.50558 0.56743 Mdot
0 0 0 setrgbcolor
0.01884 setlinewidth
0.51912 0.49894 Mdot
0 0 0 setrgbcolor
0.01842 setlinewidth
0.52145 0.49862 Mdot
0 0 0 setrgbcolor
0.00817 setlinewidth
0.48821 0.54704 Mdot
0 0 0 setrgbcolor
0.01958 setlinewidth
0.52318 0.49856 Mdot
0 0 0 setrgbcolor
0.01486 setlinewidth
0.52582 0.49863 Mdot
0 0 0 setrgbcolor
0.01443 setlinewidth
0.55485 0.5165 Mdot
0 0 0 setrgbcolor
0.01615 setlinewidth
0.51924 0.49842 Mdot
0 0 0 setrgbcolor
0.01076 setlinewidth
0.5287 0.49861 Mdot
0 0 0 setrgbcolor
0.0052 setlinewidth
0.52204 0.49815 Mdot
0 0 0 setrgbcolor
0.01081 setlinewidth
0.51124 0.4999 Mdot
0 0 0 setrgbcolor
0.01247 setlinewidth
0.54199 0.50278 Mdot
0 0 0 setrgbcolor
0.01629 setlinewidth
0.54212 0.56864 Mdot
0 0 0 setrgbcolor
0.01695 setlinewidth
0.54983 0.56293 Mdot
0 0 0 setrgbcolor
0.01665 setlinewidth
0.52097 0.49641 Mdot
0 0 0 setrgbcolor
0.01213 setlinewidth
0.53581 0.49834 Mdot
0 0 0 setrgbcolor
0.01292 setlinewidth
0.48394 0.53148 Mdot
0 0 0 setrgbcolor
0.01131 setlinewidth
0.4873 0.5522 Mdot
0 0 0 setrgbcolor
0.01027 setlinewidth
0.52544 0.4958 Mdot
0 0 0 setrgbcolor
0.00843 setlinewidth
0.48508 0.52392 Mdot
0 0 0 setrgbcolor
0.01703 setlinewidth
0.49612 0.56475 Mdot
0 0 0 setrgbcolor
0.00761 setlinewidth
0.53846 0.49831 Mdot
0 0 0 setrgbcolor
0.00744 setlinewidth
0.55559 0.55902 Mdot
0 0 0 setrgbcolor
0.00776 setlinewidth
0.5485 0.56666 Mdot
0 0 0 setrgbcolor
0.01223 setlinewidth
0.51985 0.49509 Mdot
0 0 0 setrgbcolor
0.00705 setlinewidth
0.50351 0.49986 Mdot
0 0 0 setrgbcolor
0.01146 setlinewidth
0.51829 0.4951 Mdot
0 0 0 setrgbcolor
0.01948 setlinewidth
0.54836 0.50357 Mdot
0 0 0 setrgbcolor
0.00684 setlinewidth
0.55699 0.51283 Mdot
0 0 0 setrgbcolor
0.01702 setlinewidth
0.52933 0.57564 Mdot
0 0 0 setrgbcolor
0.01105 setlinewidth
0.55104 0.50516 Mdot
0 0 0 setrgbcolor
0.0105 setlinewidth
0.53106 0.49467 Mdot
0 0 0 setrgbcolor
0.01871 setlinewidth
0.48617 0.51636 Mdot
0 0 0 setrgbcolor
0.01799 setlinewidth
0.4998 0.50096 Mdot
0 0 0 setrgbcolor
0.01546 setlinewidth
0.5326 0.49487 Mdot
0 0 0 setrgbcolor
0.00869 setlinewidth
0.5266 0.49379 Mdot
0 0 0 setrgbcolor
0.00906 setlinewidth
0.53703 0.57499 Mdot
0 0 0 setrgbcolor
0.00979 setlinewidth
0.54439 0.49898 Mdot
0 0 0 setrgbcolor
0.01129 setlinewidth
0.55251 0.5051 Mdot
0 0 0 setrgbcolor
0.01292 setlinewidth
0.54095 0.49663 Mdot
0 0 0 setrgbcolor
0.00738 setlinewidth
0.55532 0.50706 Mdot
0 0 0 setrgbcolor
0.00657 setlinewidth
0.49844 0.4998 Mdot
0 0 0 setrgbcolor
0.00835 setlinewidth
0.51815 0.57859 Mdot
0 0 0 setrgbcolor
0.01915 setlinewidth
0.49276 0.50408 Mdot
0 0 0 setrgbcolor
0.01332 setlinewidth
0.54746 0.57179 Mdot
0 0 0 setrgbcolor
0.00565 setlinewidth
0.5329 0.57814 Mdot
0 0 0 setrgbcolor
0.01504 setlinewidth
0.53406 0.57791 Mdot
0 0 0 setrgbcolor
0.00764 setlinewidth
0.51588 0.492 Mdot
0 0 0 setrgbcolor
0.00644 setlinewidth
0.53656 0.57729 Mdot
0 0 0 setrgbcolor
0.01093 setlinewidth
0.52398 0.57981 Mdot
0 0 0 setrgbcolor
0.00629 setlinewidth
0.48182 0.51873 Mdot
0 0 0 setrgbcolor
0.01605 setlinewidth
0.56133 0.51229 Mdot
0 0 0 setrgbcolor
0.00878 setlinewidth
0.50843 0.57759 Mdot
0 0 0 setrgbcolor
0.01401 setlinewidth
0.49265 0.50257 Mdot
0 0 0 setrgbcolor
0.01636 setlinewidth
0.48352 0.5144 Mdot
0 0 0 setrgbcolor
0.01011 setlinewidth
0.56126 0.55881 Mdot
0 0 0 setrgbcolor
0.01546 setlinewidth
0.56536 0.52023 Mdot
0 0 0 setrgbcolor
0.01455 setlinewidth
0.48732 0.50738 Mdot
0 0 0 setrgbcolor
0.00567 setlinewidth
0.48409 0.55861 Mdot
0 0 0 setrgbcolor
0.00824 setlinewidth
0.49791 0.49745 Mdot
0 0 0 setrgbcolor
0.01097 setlinewidth
0.55452 0.56846 Mdot
0 0 0 setrgbcolor
0.01466 setlinewidth
0.48454 0.55984 Mdot
0 0 0 setrgbcolor
0.01169 setlinewidth
0.56698 0.5227 Mdot
0 0 0 setrgbcolor
0.01606 setlinewidth
0.54448 0.49498 Mdot
0 0 0 setrgbcolor
0.01488 setlinewidth
0.51569 0.49025 Mdot
0 0 0 setrgbcolor
0.01259 setlinewidth
0.51927 0.58089 Mdot
0 0 0 setrgbcolor
0.01118 setlinewidth
0.51437 0.58019 Mdot
0 0 0 setrgbcolor
0.01549 setlinewidth
0.5134 0.57999 Mdot
0 0 0 setrgbcolor
0.01879 setlinewidth
0.56726 0.52378 Mdot
0 0 0 setrgbcolor
0.01514 setlinewidth
0.47951 0.54881 Mdot
0 0 0 setrgbcolor
0.011 setlinewidth
0.54007 0.57762 Mdot
0 0 0 setrgbcolor
0.00611 setlinewidth
0.56825 0.52953 Mdot
0 0 0 setrgbcolor
0.00719 setlinewidth
0.48927 0.50515 Mdot
0 0 0 setrgbcolor
0.0093 setlinewidth
0.48257 0.515 Mdot
0 0 0 setrgbcolor
0.00961 setlinewidth
0.47801 0.53206 Mdot
0 0 0 setrgbcolor
0.01999 setlinewidth
0.4994 0.49686 Mdot
0 0 0 setrgbcolor
0.01579 setlinewidth
0.56397 0.51634 Mdot
0 0 0 setrgbcolor
0.01766 setlinewidth
0.48481 0.51167 Mdot
0 0 0 setrgbcolor
0.00692 setlinewidth
0.50627 0.57702 Mdot
0 0 0 setrgbcolor
0.01571 setlinewidth
0.48781 0.56309 Mdot
0 0 0 setrgbcolor
0.00537 setlinewidth
0.5401 0.57683 Mdot
0 0 0 setrgbcolor
0.00687 setlinewidth
0.51748 0.49087 Mdot
0 0 0 setrgbcolor
0.01542 setlinewidth
0.51682 0.49106 Mdot
0 0 0 setrgbcolor
0.01608 setlinewidth
0.48583 0.51083 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.48013 0.54637 Mdot
0 0 0 setrgbcolor
0.01952 setlinewidth
0.53651 0.49312 Mdot
0 0 0 setrgbcolor
0.01999 setlinewidth
0.49828 0.57199 Mdot
0 0 0 setrgbcolor
0.01223 setlinewidth
0.48145 0.52098 Mdot
0 0 0 setrgbcolor
0.00672 setlinewidth
0.4869 0.51025 Mdot
0 0 0 setrgbcolor
0.01937 setlinewidth
0.54331 0.57436 Mdot
0 0 0 setrgbcolor
0.0157 setlinewidth
0.54543 0.5729 Mdot
0 0 0 setrgbcolor
0.00601 setlinewidth
0.54636 0.49862 Mdot
0 0 0 setrgbcolor
0.00509 setlinewidth
0.53361 0.49327 Mdot
0 0 0 setrgbcolor
0.0168 setlinewidth
0.53043 0.57804 Mdot
0 0 0 setrgbcolor
0.01736 setlinewidth
0.52011 0.5783 Mdot
0 0 0 setrgbcolor
0.01962 setlinewidth
0.56553 0.53882 Mdot
0 0 0 setrgbcolor
0.01051 setlinewidth
0.56553 0.53662 Mdot
0 0 0 setrgbcolor
0.01439 setlinewidth
0.50584 0.4966 Mdot
0 0 0 setrgbcolor
0.01963 setlinewidth
0.56199 0.51911 Mdot
0 0 0 setrgbcolor
0.01484 setlinewidth
0.51827 0.57723 Mdot
0 0 0 setrgbcolor
0.0121 setlinewidth
0.50524 0.57274 Mdot
0 0 0 setrgbcolor
0.01344 setlinewidth
0.55605 0.51037 Mdot
0 0 0 setrgbcolor
0.0103 setlinewidth
0.55745 0.51251 Mdot
0 0 0 setrgbcolor
0.00849 setlinewidth
0.54619 0.56948 Mdot
0 0 0 setrgbcolor
0.00918 setlinewidth
0.48413 0.52316 Mdot
0 0 0 setrgbcolor
0.01152 setlinewidth
0.5366 0.57373 Mdot
0 0 0 setrgbcolor
0.00983 setlinewidth
0.51766 0.57554 Mdot
0 0 0 setrgbcolor
0.01431 setlinewidth
0.5593 0.51793 Mdot
0 0 0 setrgbcolor
0.00697 setlinewidth
0.56271 0.5288 Mdot
0 0 0 setrgbcolor
0.01561 setlinewidth
0.48453 0.52439 Mdot
0 0 0 setrgbcolor
0.01595 setlinewidth
0.55256 0.50825 Mdot
0 0 0 setrgbcolor
0.0199 setlinewidth
0.53932 0.57142 Mdot
0 0 0 setrgbcolor
0.01795 setlinewidth
0.52177 0.57467 Mdot
0 0 0 setrgbcolor
0.00868 setlinewidth
0.48561 0.52446 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.52479 0.57429 Mdot
0 0 0 setrgbcolor
0.00813 setlinewidth
0.55801 0.51809 Mdot
0 0 0 setrgbcolor
0.0066 setlinewidth
0.51971 0.57416 Mdot
0 0 0 setrgbcolor
0.00758 setlinewidth
0.53576 0.57148 Mdot
0 0 0 setrgbcolor
0.00731 setlinewidth
0.50221 0.56733 Mdot
0 0 0 setrgbcolor
0.01408 setlinewidth
0.5241 0.57337 Mdot
0 0 0 setrgbcolor
0.01643 setlinewidth
0.53121 0.5725 Mdot
0 0 0 setrgbcolor
0.00689 setlinewidth
0.5225 0.5727 Mdot
0 0 0 setrgbcolor
0.00545 setlinewidth
0.52297 0.57254 Mdot
0 0 0 setrgbcolor
0.01534 setlinewidth
0.55852 0.54477 Mdot
0 0 0 setrgbcolor
0.01725 setlinewidth
0.55914 0.53208 Mdot
0 0 0 setrgbcolor
0.0195 setlinewidth
0.54808 0.56133 Mdot
0 0 0 setrgbcolor
0.01954 setlinewidth
0.49456 0.51462 Mdot
0 0 0 setrgbcolor
0.00931 setlinewidth
0.54918 0.559 Mdot
0 0 0 setrgbcolor
0.01841 setlinewidth
0.51802 0.56966 Mdot
0 0 0 setrgbcolor
0.01442 setlinewidth
0.53208 0.56883 Mdot
0 0 0 setrgbcolor
0.00984 setlinewidth
0.53663 0.56624 Mdot
0 0 0 setrgbcolor
0.01289 setlinewidth
0.49012 0.53036 Mdot
0 0 0 setrgbcolor
0.01374 setlinewidth
0.55027 0.55414 Mdot
0 0 0 setrgbcolor
0.00833 setlinewidth
0.52781 0.56802 Mdot
0 0 0 setrgbcolor
0.01134 setlinewidth
0.52097 0.56801 Mdot
0 0 0 setrgbcolor
0.00583 setlinewidth
0.5229 0.56801 Mdot
0 0 0 setrgbcolor
0.00713 setlinewidth
0.54845 0.55581 Mdot
0 0 0 setrgbcolor
0.01048 setlinewidth
0.54417 0.55728 Mdot
0 0 0 setrgbcolor
0.00782 setlinewidth
0.53493 0.56326 Mdot
0 0 0 setrgbcolor
0.01586 setlinewidth
0.51093 0.56276 Mdot
0 0 0 setrgbcolor
0.01645 setlinewidth
0.50887 0.55921 Mdot
0 0 0 setrgbcolor
0.01288 setlinewidth
0.54539 0.55182 Mdot
0 0 0 setrgbcolor
0.01463 setlinewidth
0.54562 0.5196 Mdot
0 0 0 setrgbcolor
0.00991 setlinewidth
0.49854 0.54626 Mdot
0 0 0 setrgbcolor
0.01877 setlinewidth
0.54441 0.52108 Mdot
0 0 0 setrgbcolor
0.00929 setlinewidth
0.52457 0.51202 Mdot
0 0 0 setrgbcolor
0.00712 setlinewidth
0.51153 0.55325 Mdot
0 0 0 setrgbcolor
0.01761 setlinewidth
0.52225 0.5146 Mdot
0 0 0 setrgbcolor
0.00693 setlinewidth
0.53177 0.51742 Mdot
0 0 0 setrgbcolor
0.01988 setlinewidth
0.5405 0.52655 Mdot
0 0 0 setrgbcolor
0.01395 setlinewidth
0.51201 0.55099 Mdot
0 0 0 setrgbcolor
0.01413 setlinewidth
0.50861 0.53725 Mdot
0 0 0 setrgbcolor
0.01377 setlinewidth
0.52002 0.5493 Mdot
0 0 0 setrgbcolor
0.00577 setlinewidth
0.50969 0.53458 Mdot
0 0 0 setrgbcolor
0.01947 setlinewidth
0.53573 0.53382 Mdot
0 0 0 setrgbcolor
0.01767 setlinewidth
0.52409 0.5473 Mdot
0 0 0 setrgbcolor
0.01959 setlinewidth
0.52271 0.54577 Mdot
0 0 0 setrgbcolor
0.00604 setlinewidth
0.5273 0.5435 Mdot
0 0 0 setrgbcolor
0.00641 setlinewidth
0.51881 0.52968 Mdot
0 0 0 setrgbcolor
0.01404 setlinewidth
0.52358 0.5314 Mdot
1 1 1 setrgbcolor
0.01408 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.0178 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01895 setlinewidth
0.52276 0.54587 Mdot
0 0 0 setrgbcolor
0.00858 setlinewidth
0.51419 0.54147 Mdot
0 0 0 setrgbcolor
0.00695 setlinewidth
0.51337 0.54199 Mdot
0 0 0 setrgbcolor
0.01909 setlinewidth
0.52315 0.51801 Mdot
0 0 0 setrgbcolor
0.01182 setlinewidth
0.51921 0.51784 Mdot
0 0 0 setrgbcolor
0.01872 setlinewidth
0.53683 0.52348 Mdot
0 0 0 setrgbcolor
0.01527 setlinewidth
0.53443 0.51897 Mdot
0 0 0 setrgbcolor
0.01034 setlinewidth
0.52664 0.51448 Mdot
0 0 0 setrgbcolor
0.01708 setlinewidth
0.51769 0.55628 Mdot
0 0 0 setrgbcolor
0.0056 setlinewidth
0.52916 0.5135 Mdot
0 0 0 setrgbcolor
0.00914 setlinewidth
0.53201 0.51427 Mdot
0 0 0 setrgbcolor
0.01674 setlinewidth
0.50762 0.55261 Mdot
0 0 0 setrgbcolor
0.01122 setlinewidth
0.52076 0.51172 Mdot
0 0 0 setrgbcolor
0.00512 setlinewidth
0.50732 0.51697 Mdot
0 0 0 setrgbcolor
0.00887 setlinewidth
0.53154 0.51203 Mdot
0 0 0 setrgbcolor
0.01103 setlinewidth
0.53168 0.51201 Mdot
0 0 0 setrgbcolor
0.00964 setlinewidth
0.51094 0.51355 Mdot
0 0 0 setrgbcolor
0.01003 setlinewidth
0.51899 0.50989 Mdot
0 0 0 setrgbcolor
0.00878 setlinewidth
0.52566 0.50958 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.51183 0.56003 Mdot
0 0 0 setrgbcolor
0.00548 setlinewidth
0.53296 0.50949 Mdot
0 0 0 setrgbcolor
0.01783 setlinewidth
0.55077 0.53387 Mdot
0 0 0 setrgbcolor
0.01029 setlinewidth
0.52095 0.50672 Mdot
0 0 0 setrgbcolor
0.00677 setlinewidth
0.50203 0.51449 Mdot
0 0 0 setrgbcolor
0.01697 setlinewidth
0.49588 0.52298 Mdot
0 0 0 setrgbcolor
0.01356 setlinewidth
0.49498 0.55238 Mdot
0 0 0 setrgbcolor
0.01003 setlinewidth
0.51056 0.56608 Mdot
0 0 0 setrgbcolor
0.01047 setlinewidth
0.50531 0.50708 Mdot
0 0 0 setrgbcolor
0.01533 setlinewidth
0.52363 0.50007 Mdot
0 0 0 setrgbcolor
0.0083 setlinewidth
0.48748 0.53699 Mdot
0 0 0 setrgbcolor
0.00718 setlinewidth
0.51575 0.57087 Mdot
0 0 0 setrgbcolor
0.01179 setlinewidth
0.48735 0.52901 Mdot
0 0 0 setrgbcolor
0.01236 setlinewidth
0.52518 0.49878 Mdot
0 0 0 setrgbcolor
0.00967 setlinewidth
0.55481 0.51687 Mdot
0 0 0 setrgbcolor
0.00875 setlinewidth
0.49396 0.55792 Mdot
0 0 0 setrgbcolor
0.00666 setlinewidth
0.52308 0.4983 Mdot
0 0 0 setrgbcolor
0.01185 setlinewidth
0.52044 0.49827 Mdot
0 0 0 setrgbcolor
0.01725 setlinewidth
0.52678 0.49829 Mdot
0 0 0 setrgbcolor
0.01108 setlinewidth
0.52394 0.49807 Mdot
0 0 0 setrgbcolor
0.00855 setlinewidth
0.5109 0.50002 Mdot
0 0 0 setrgbcolor
0.00979 setlinewidth
0.51898 0.49778 Mdot
0 0 0 setrgbcolor
0.01468 setlinewidth
0.52271 0.49712 Mdot
0 0 0 setrgbcolor
0.00761 setlinewidth
0.53461 0.49889 Mdot
0 0 0 setrgbcolor
0.01052 setlinewidth
0.52126 0.49708 Mdot
0 0 0 setrgbcolor
0.01916 setlinewidth
0.51887 0.49723 Mdot
0 0 0 setrgbcolor
0.0174 setlinewidth
0.55631 0.51578 Mdot
0 0 0 setrgbcolor
0.0196 setlinewidth
0.523 0.49675 Mdot
0 0 0 setrgbcolor
0.01435 setlinewidth
0.52166 0.49651 Mdot
0 0 0 setrgbcolor
0.00813 setlinewidth
0.50468 0.5696 Mdot
0 0 0 setrgbcolor
0.0146 setlinewidth
0.52568 0.4964 Mdot
0 0 0 setrgbcolor
0.0112 setlinewidth
0.48655 0.52107 Mdot
0 0 0 setrgbcolor
0.01081 setlinewidth
0.52851 0.49594 Mdot
0 0 0 setrgbcolor
0.01721 setlinewidth
0.54011 0.49913 Mdot
0 0 0 setrgbcolor
0.01634 setlinewidth
0.50198 0.50127 Mdot
0 0 0 setrgbcolor
0.00947 setlinewidth
0.56017 0.51934 Mdot
0 0 0 setrgbcolor
0.00829 setlinewidth
0.51973 0.49491 Mdot
0 0 0 setrgbcolor
0.01186 setlinewidth
0.55894 0.55487 Mdot
0 0 0 setrgbcolor
0.00644 setlinewidth
0.49796 0.50302 Mdot
0 0 0 setrgbcolor
0.01209 setlinewidth
0.5548 0.56206 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.52396 0.49359 Mdot
0 0 0 setrgbcolor
0.01968 setlinewidth
0.51624 0.49401 Mdot
0 0 0 setrgbcolor
0.01821 setlinewidth
0.51788 0.49375 Mdot
0 0 0 setrgbcolor
0.00517 setlinewidth
0.54255 0.49818 Mdot
0 0 0 setrgbcolor
0.01814 setlinewidth
0.53508 0.49458 Mdot
0 0 0 setrgbcolor
0.01369 setlinewidth
0.55803 0.51042 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.55261 0.56669 Mdot
0 0 0 setrgbcolor
0.00603 setlinewidth
0.49023 0.50743 Mdot
0 0 0 setrgbcolor
0.00909 setlinewidth
0.4955 0.5021 Mdot
0 0 0 setrgbcolor
0.01087 setlinewidth
0.53743 0.49416 Mdot
0 0 0 setrgbcolor
0.00778 setlinewidth
0.48072 0.52433 Mdot
0 0 0 setrgbcolor
0.01532 setlinewidth
0.5596 0.55958 Mdot
0 0 0 setrgbcolor
0.01523 setlinewidth
0.53974 0.57596 Mdot
0 0 0 setrgbcolor
0.01992 setlinewidth
0.52398 0.49139 Mdot
0 0 0 setrgbcolor
0.00648 setlinewidth
0.52877 0.49158 Mdot
0 0 0 setrgbcolor
0.0144 setlinewidth
0.53031 0.49155 Mdot
0 0 0 setrgbcolor
0.01357 setlinewidth
0.4815 0.51961 Mdot
0 0 0 setrgbcolor
0.01452 setlinewidth
0.54815 0.49807 Mdot
0 0 0 setrgbcolor
0.01055 setlinewidth
0.48896 0.50595 Mdot
0 0 0 setrgbcolor
0.00671 setlinewidth
0.55813 0.56372 Mdot
0 0 0 setrgbcolor
0.01373 setlinewidth
0.56426 0.55469 Mdot
0 0 0 setrgbcolor
0.01389 setlinewidth
0.55091 0.49932 Mdot
0 0 0 setrgbcolor
0.00577 setlinewidth
0.51153 0.49131 Mdot
0 0 0 setrgbcolor
0.01923 setlinewidth
0.54695 0.57417 Mdot
0 0 0 setrgbcolor
0.00588 setlinewidth
0.52741 0.5808 Mdot
0 0 0 setrgbcolor
0.01838 setlinewidth
0.55837 0.50636 Mdot
0 0 0 setrgbcolor
0.00718 setlinewidth
0.5427 0.49398 Mdot
0 0 0 setrgbcolor
0.00554 setlinewidth
0.53856 0.4921 Mdot
0 0 0 setrgbcolor
0.00734 setlinewidth
0.48343 0.51182 Mdot
0 0 0 setrgbcolor
0.01755 setlinewidth
0.48799 0.56531 Mdot
0 0 0 setrgbcolor
0.00632 setlinewidth
0.55191 0.49907 Mdot
0 0 0 setrgbcolor
0.01673 setlinewidth
0.51643 0.58128 Mdot
0 0 0 setrgbcolor
0.01697 setlinewidth
0.54211 0.57815 Mdot
0 0 0 setrgbcolor
0.00892 setlinewidth
0.49243 0.49991 Mdot
0 0 0 setrgbcolor
0.01969 setlinewidth
0.53282 0.58126 Mdot
0 0 0 setrgbcolor
0.00547 setlinewidth
0.54322 0.57774 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.55472 0.50068 Mdot
0 0 0 setrgbcolor
0.0076 setlinewidth
0.48792 0.56657 Mdot
0 0 0 setrgbcolor
0.01258 setlinewidth
0.5456 0.57673 Mdot
0 0 0 setrgbcolor
0.01545 setlinewidth
0.55606 0.56936 Mdot
0 0 0 setrgbcolor
0.01616 setlinewidth
0.48019 0.55599 Mdot
0 0 0 setrgbcolor
0.01655 setlinewidth
0.47751 0.52061 Mdot
0 0 0 setrgbcolor
0.00644 setlinewidth
0.4753 0.53896 Mdot
0 0 0 setrgbcolor
0.00692 setlinewidth
0.56041 0.50528 Mdot
0 0 0 setrgbcolor
0.01488 setlinewidth
0.50835 0.48972 Mdot
0 0 0 setrgbcolor
0.01049 setlinewidth
0.48277 0.50938 Mdot
0 0 0 setrgbcolor
0.01745 setlinewidth
0.56738 0.5538 Mdot
0 0 0 setrgbcolor
0.0093 setlinewidth
0.47881 0.51684 Mdot
0 0 0 setrgbcolor
0.01744 setlinewidth
0.56553 0.51294 Mdot
0 0 0 setrgbcolor
0.00658 setlinewidth
0.51954 0.58321 Mdot
0 0 0 setrgbcolor
0.01003 setlinewidth
0.52056 0.58327 Mdot
0 0 0 setrgbcolor
0.0102 setlinewidth
0.52584 0.58326 Mdot
0 0 0 setrgbcolor
0.01648 setlinewidth
0.49152 0.49923 Mdot
0 0 0 setrgbcolor
0.01084 setlinewidth
0.48954 0.56961 Mdot
0 0 0 setrgbcolor
0.01218 setlinewidth
0.47928 0.51586 Mdot
0 0 0 setrgbcolor
0.01544 setlinewidth
0.47873 0.5535 Mdot
0 0 0 setrgbcolor
0.00818 setlinewidth
0.53872 0.49005 Mdot
0 0 0 setrgbcolor
0.00882 setlinewidth
0.47595 0.52706 Mdot
0 0 0 setrgbcolor
0.01666 setlinewidth
0.47981 0.51512 Mdot
0 0 0 setrgbcolor
0.01309 setlinewidth
0.56052 0.565 Mdot
0 0 0 setrgbcolor
0.01615 setlinewidth
0.51043 0.5813 Mdot
0 0 0 setrgbcolor
0.01703 setlinewidth
0.5009 0.57731 Mdot
0 0 0 setrgbcolor
0.01747 setlinewidth
0.50848 0.49021 Mdot
0 0 0 setrgbcolor
0.0183 setlinewidth
0.56609 0.51538 Mdot
0 0 0 setrgbcolor
0.019 setlinewidth
0.50774 0.49051 Mdot
0 0 0 setrgbcolor
0.01233 setlinewidth
0.54592 0.57681 Mdot
0 0 0 setrgbcolor
0.0113 setlinewidth
0.56582 0.51651 Mdot
0 0 0 setrgbcolor
0.01322 setlinewidth
0.47723 0.52903 Mdot
0 0 0 setrgbcolor
0.01941 setlinewidth
0.49586 0.4981 Mdot
0 0 0 setrgbcolor
0.00838 setlinewidth
0.54473 0.57606 Mdot
0 0 0 setrgbcolor
0.00586 setlinewidth
0.56729 0.52239 Mdot
0 0 0 setrgbcolor
0.01827 setlinewidth
0.5277 0.48956 Mdot
0 0 0 setrgbcolor
0.0167 setlinewidth
0.47753 0.53027 Mdot
0 0 0 setrgbcolor
0.00821 setlinewidth
0.52321 0.58068 Mdot
0 0 0 setrgbcolor
0.00717 setlinewidth
0.56014 0.50935 Mdot
0 0 0 setrgbcolor
0.01031 setlinewidth
0.47824 0.5302 Mdot
0 0 0 setrgbcolor
0.00669 setlinewidth
0.5241 0.49023 Mdot
0 0 0 setrgbcolor
0.01381 setlinewidth
0.50643 0.57718 Mdot
0 0 0 setrgbcolor
0.01826 setlinewidth
0.53385 0.57886 Mdot
0 0 0 setrgbcolor
0.01217 setlinewidth
0.52069 0.57988 Mdot
0 0 0 setrgbcolor
0.00785 setlinewidth
0.54685 0.57307 Mdot
0 0 0 setrgbcolor
0.00738 setlinewidth
0.53798 0.49377 Mdot
0 0 0 setrgbcolor
0.01316 setlinewidth
0.54862 0.57125 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.5191 0.57827 Mdot
0 0 0 setrgbcolor
0.01064 setlinewidth
0.50131 0.57212 Mdot
0 0 0 setrgbcolor
0.01158 setlinewidth
0.48468 0.51871 Mdot
0 0 0 setrgbcolor
0.01679 setlinewidth
0.52269 0.57679 Mdot
0 0 0 setrgbcolor
0.00603 setlinewidth
0.52038 0.57658 Mdot
0 0 0 setrgbcolor
0.00583 setlinewidth
0.53818 0.57356 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.48214 0.53573 Mdot
0 0 0 setrgbcolor
0.0101 setlinewidth
0.52558 0.57595 Mdot
0 0 0 setrgbcolor
0.01514 setlinewidth
0.54755 0.56767 Mdot
0 0 0 setrgbcolor
0.00767 setlinewidth
0.56329 0.5327 Mdot
0 0 0 setrgbcolor
0.01072 setlinewidth
0.55639 0.5127 Mdot
0 0 0 setrgbcolor
0.01244 setlinewidth
0.56289 0.53041 Mdot
0 0 0 setrgbcolor
0.00812 setlinewidth
0.54858 0.50455 Mdot
0 0 0 setrgbcolor
0.0178 setlinewidth
0.52443 0.57513 Mdot
0 0 0 setrgbcolor
0.0171 setlinewidth
0.5503 0.50657 Mdot
0 0 0 setrgbcolor
0.01309 setlinewidth
0.52249 0.57469 Mdot
0 0 0 setrgbcolor
0.01494 setlinewidth
0.54016 0.57078 Mdot
0 0 0 setrgbcolor
0.00865 setlinewidth
0.52289 0.57445 Mdot
0 0 0 setrgbcolor
0.01216 setlinewidth
0.53154 0.57315 Mdot
0 0 0 setrgbcolor
0.0144 setlinewidth
0.54414 0.50293 Mdot
0 0 0 setrgbcolor
0.0086 setlinewidth
0.5361 0.57141 Mdot
0 0 0 setrgbcolor
0.01472 setlinewidth
0.55259 0.51196 Mdot
0 0 0 setrgbcolor
0.0171 setlinewidth
0.51674 0.57225 Mdot
0 0 0 setrgbcolor
0.01348 setlinewidth
0.55775 0.52276 Mdot
0 0 0 setrgbcolor
0.0162 setlinewidth
0.55085 0.51236 Mdot
0 0 0 setrgbcolor
0.01478 setlinewidth
0.51904 0.57013 Mdot
0 0 0 setrgbcolor
0.00959 setlinewidth
0.49188 0.55102 Mdot
0 0 0 setrgbcolor
0.00988 setlinewidth
0.53093 0.56928 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.50749 0.56622 Mdot
0 0 0 setrgbcolor
0.01525 setlinewidth
0.52099 0.56984 Mdot
0 0 0 setrgbcolor
0.01097 setlinewidth
0.52607 0.5691 Mdot
0 0 0 setrgbcolor
0.01772 setlinewidth
0.54647 0.55903 Mdot
0 0 0 setrgbcolor
0.01238 setlinewidth
0.50447 0.56288 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.53495 0.56592 Mdot
0 0 0 setrgbcolor
0.00836 setlinewidth
0.55477 0.54016 Mdot
0 0 0 setrgbcolor
0.01755 setlinewidth
0.54702 0.55645 Mdot
0 0 0 setrgbcolor
0.00724 setlinewidth
0.55332 0.52683 Mdot
0 0 0 setrgbcolor
0.0065 setlinewidth
0.53204 0.56312 Mdot
0 0 0 setrgbcolor
0.01716 setlinewidth
0.54687 0.55126 Mdot
0 0 0 setrgbcolor
0.01076 setlinewidth
0.54516 0.55328 Mdot
0 0 0 setrgbcolor
0.01075 setlinewidth
0.5054 0.55635 Mdot
0 0 0 setrgbcolor
0.01885 setlinewidth
0.54058 0.55549 Mdot
0 0 0 setrgbcolor
0.01678 setlinewidth
0.51255 0.51151 Mdot
0 0 0 setrgbcolor
0.01737 setlinewidth
0.50531 0.55395 Mdot
0 0 0 setrgbcolor
0.00514 setlinewidth
0.51029 0.51457 Mdot
0 0 0 setrgbcolor
0.00942 setlinewidth
0.49937 0.54023 Mdot
0 0 0 setrgbcolor
0.00668 setlinewidth
0.49998 0.5373 Mdot
0 0 0 setrgbcolor
0.00856 setlinewidth
0.53576 0.51606 Mdot
0 0 0 setrgbcolor
0.00769 setlinewidth
0.54052 0.54966 Mdot
0 0 0 setrgbcolor
0.00501 setlinewidth
0.53448 0.51781 Mdot
0 0 0 setrgbcolor
0.01195 setlinewidth
0.52032 0.51603 Mdot
0 0 0 setrgbcolor
0.00744 setlinewidth
0.51278 0.55101 Mdot
0 0 0 setrgbcolor
0.00694 setlinewidth
0.50818 0.53084 Mdot
0 0 0 setrgbcolor
0.01842 setlinewidth
0.51647 0.54833 Mdot
0 0 0 setrgbcolor
0.00579 setlinewidth
0.51475 0.54695 Mdot
0 0 0 setrgbcolor
0.01001 setlinewidth
0.53059 0.52417 Mdot
0 0 0 setrgbcolor
0.00699 setlinewidth
0.51321 0.53189 Mdot
0 0 0 setrgbcolor
0.00831 setlinewidth
0.51901 0.54389 Mdot
0 0 0 setrgbcolor
0.00503 setlinewidth
0.5263 0.53252 Mdot
1 1 1 setrgbcolor
0.0178 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.00559 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01932 setlinewidth
0.52454 0.54235 Mdot
0 0 0 setrgbcolor
0.01397 setlinewidth
0.52373 0.54302 Mdot
0 0 0 setrgbcolor
0.01382 setlinewidth
0.53394 0.5456 Mdot
0 0 0 setrgbcolor
0.01051 setlinewidth
0.52554 0.51711 Mdot
0 0 0 setrgbcolor
0.01469 setlinewidth
0.52963 0.51666 Mdot
0 0 0 setrgbcolor
0.01097 setlinewidth
0.51857 0.55497 Mdot
0 0 0 setrgbcolor
0.01924 setlinewidth
0.51269 0.51809 Mdot
0 0 0 setrgbcolor
0.01809 setlinewidth
0.51575 0.514 Mdot
0 0 0 setrgbcolor
0.01761 setlinewidth
0.52954 0.55725 Mdot
0 0 0 setrgbcolor
0.00884 setlinewidth
0.50122 0.52615 Mdot
0 0 0 setrgbcolor
0.01856 setlinewidth
0.53227 0.51248 Mdot
0 0 0 setrgbcolor
0.01305 setlinewidth
0.52559 0.51056 Mdot
0 0 0 setrgbcolor
0.01089 setlinewidth
0.50617 0.51641 Mdot
0 0 0 setrgbcolor
0.01618 setlinewidth
0.54433 0.52023 Mdot
0 0 0 setrgbcolor
0.00888 setlinewidth
0.52325 0.50895 Mdot
0 0 0 setrgbcolor
0.00765 setlinewidth
0.54103 0.51592 Mdot
0 0 0 setrgbcolor
0.00708 setlinewidth
0.52348 0.56207 Mdot
0 0 0 setrgbcolor
0.01939 setlinewidth
0.53453 0.51108 Mdot
0 0 0 setrgbcolor
0.00813 setlinewidth
0.53753 0.51145 Mdot
0 0 0 setrgbcolor
0.01935 setlinewidth
0.50426 0.55675 Mdot
0 0 0 setrgbcolor
0.01692 setlinewidth
0.52997 0.50759 Mdot
0 0 0 setrgbcolor
0.00529 setlinewidth
0.53648 0.50921 Mdot
0 0 0 setrgbcolor
0.01621 setlinewidth
0.5366 0.50916 Mdot
0 0 0 setrgbcolor
0.01119 setlinewidth
0.52433 0.50539 Mdot
0 0 0 setrgbcolor
0.01683 setlinewidth
0.49372 0.54201 Mdot
0 0 0 setrgbcolor
0.00989 setlinewidth
0.49222 0.53379 Mdot
0 0 0 setrgbcolor
0.01871 setlinewidth
0.50768 0.50827 Mdot
0 0 0 setrgbcolor
0.01348 setlinewidth
0.53714 0.50637 Mdot
0 0 0 setrgbcolor
0.01859 setlinewidth
0.52208 0.56861 Mdot
0 0 0 setrgbcolor
0.00582 setlinewidth
0.50319 0.56271 Mdot
0 0 0 setrgbcolor
0.00912 setlinewidth
0.48942 0.52576 Mdot
0 0 0 setrgbcolor
0.01718 setlinewidth
0.55907 0.52896 Mdot
0 0 0 setrgbcolor
0.01675 setlinewidth
0.51136 0.50015 Mdot
0 0 0 setrgbcolor
0.00544 setlinewidth
0.5248 0.49816 Mdot
0 0 0 setrgbcolor
0.01786 setlinewidth
0.52742 0.57286 Mdot
0 0 0 setrgbcolor
0.01623 setlinewidth
0.52083 0.49683 Mdot
0 0 0 setrgbcolor
0.00541 setlinewidth
0.51529 0.57325 Mdot
0 0 0 setrgbcolor
0.01276 setlinewidth
0.52586 0.49661 Mdot
0 0 0 setrgbcolor
0.01329 setlinewidth
0.50173 0.5029 Mdot
0 0 0 setrgbcolor
0.01145 setlinewidth
0.52354 0.49644 Mdot
0 0 0 setrgbcolor
0.01351 setlinewidth
0.5191 0.49656 Mdot
0 0 0 setrgbcolor
0.01265 setlinewidth
0.52432 0.49607 Mdot
0 0 0 setrgbcolor
0.01228 setlinewidth
0.49765 0.50536 Mdot
0 0 0 setrgbcolor
0.01147 setlinewidth
0.51876 0.49602 Mdot
0 0 0 setrgbcolor
0.01468 setlinewidth
0.52725 0.49585 Mdot
0 0 0 setrgbcolor
0.01426 setlinewidth
0.52116 0.49549 Mdot
0 0 0 setrgbcolor
0.01817 setlinewidth
0.52267 0.4953 Mdot
0 0 0 setrgbcolor
0.01687 setlinewidth
0.52281 0.49487 Mdot
0 0 0 setrgbcolor
0.01678 setlinewidth
0.52133 0.49484 Mdot
0 0 0 setrgbcolor
0.00942 setlinewidth
0.48237 0.53014 Mdot
0 0 0 setrgbcolor
0.00539 setlinewidth
0.48968 0.51118 Mdot
0 0 0 setrgbcolor
0.01146 setlinewidth
0.52535 0.4941 Mdot
0 0 0 setrgbcolor
0.00601 setlinewidth
0.53506 0.49526 Mdot
0 0 0 setrgbcolor
0.00556 setlinewidth
0.49415 0.50485 Mdot
0 0 0 setrgbcolor
0.0175 setlinewidth
0.5186 0.49353 Mdot
0 0 0 setrgbcolor
0.00592 setlinewidth
0.4821 0.52517 Mdot
0 0 0 setrgbcolor
0.01355 setlinewidth
0.52794 0.49319 Mdot
0 0 0 setrgbcolor
0.01441 setlinewidth
0.51445 0.49318 Mdot
0 0 0 setrgbcolor
0.01983 setlinewidth
0.51607 0.49265 Mdot
0 0 0 setrgbcolor
0.01392 setlinewidth
0.55886 0.51075 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.52228 0.49152 Mdot
0 0 0 setrgbcolor
0.00826 setlinewidth
0.48722 0.50992 Mdot
0 0 0 setrgbcolor
0.00523 setlinewidth
0.54017 0.49468 Mdot
0 0 0 setrgbcolor
0.01493 setlinewidth
0.55974 0.50943 Mdot
0 0 0 setrgbcolor
0.0071 setlinewidth
0.48187 0.51689 Mdot
0 0 0 setrgbcolor
0.01339 setlinewidth
0.53347 0.4908 Mdot
0 0 0 setrgbcolor
0.0105 setlinewidth
0.54185 0.49335 Mdot
0 0 0 setrgbcolor
0.00916 setlinewidth
0.4946 0.57154 Mdot
0 0 0 setrgbcolor
0.00729 setlinewidth
0.52104 0.48929 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.56368 0.51256 Mdot
0 0 0 setrgbcolor
0.01555 setlinewidth
0.52585 0.48874 Mdot
0 0 0 setrgbcolor
0.00904 setlinewidth
0.50753 0.49124 Mdot
0 0 0 setrgbcolor
0.008 setlinewidth
0.53532 0.49003 Mdot
0 0 0 setrgbcolor
0.01204 setlinewidth
0.56777 0.5498 Mdot
0 0 0 setrgbcolor
0.01931 setlinewidth
0.52729 0.48848 Mdot
0 0 0 setrgbcolor
0.0075 setlinewidth
0.5644 0.55793 Mdot
0 0 0 setrgbcolor
0.0111 setlinewidth
0.48851 0.50322 Mdot
0 0 0 setrgbcolor
0.00938 setlinewidth
0.49397 0.57291 Mdot
0 0 0 setrgbcolor
0.00693 setlinewidth
0.55014 0.57476 Mdot
0 0 0 setrgbcolor
0.01337 setlinewidth
0.55918 0.50368 Mdot
0 0 0 setrgbcolor
0.01819 setlinewidth
0.56226 0.56314 Mdot
0 0 0 setrgbcolor
0.00516 setlinewidth
0.4838 0.56318 Mdot
0 0 0 setrgbcolor
0.00983 setlinewidth
0.53733 0.5817 Mdot
0 0 0 setrgbcolor
0.01074 setlinewidth
0.52569 0.58388 Mdot
0 0 0 setrgbcolor
0.01973 setlinewidth
0.47507 0.52705 Mdot
0 0 0 setrgbcolor
0.01132 setlinewidth
0.54621 0.49245 Mdot
0 0 0 setrgbcolor
0.01215 setlinewidth
0.47557 0.54636 Mdot
0 0 0 setrgbcolor
0.00691 setlinewidth
0.56798 0.5547 Mdot
0 0 0 setrgbcolor
0.01576 setlinewidth
0.53487 0.4878 Mdot
0 0 0 setrgbcolor
0.01646 setlinewidth
0.53948 0.48909 Mdot
0 0 0 setrgbcolor
0.00503 setlinewidth
0.47839 0.51466 Mdot
0 0 0 setrgbcolor
0.01991 setlinewidth
0.54887 0.49334 Mdot
0 0 0 setrgbcolor
0.00733 setlinewidth
0.55632 0.57189 Mdot
0 0 0 setrgbcolor
0.01755 setlinewidth
0.47526 0.523 Mdot
0 0 0 setrgbcolor
0.0167 setlinewidth
0.56646 0.55929 Mdot
0 0 0 setrgbcolor
0.00959 setlinewidth
0.55749 0.4995 Mdot
0 0 0 setrgbcolor
0.01756 setlinewidth
0.54192 0.58145 Mdot
0 0 0 setrgbcolor
0.01972 setlinewidth
0.47509 0.52194 Mdot
0 0 0 setrgbcolor
0.0083 setlinewidth
0.54928 0.49296 Mdot
0 0 0 setrgbcolor
0.00959 setlinewidth
0.57111 0.54895 Mdot
0 0 0 setrgbcolor
0.01322 setlinewidth
0.48019 0.56095 Mdot
0 0 0 setrgbcolor
0.01167 setlinewidth
0.47313 0.53405 Mdot
0 0 0 setrgbcolor
0.00971 setlinewidth
0.55102 0.57683 Mdot
0 0 0 setrgbcolor
0.01983 setlinewidth
0.48503 0.50284 Mdot
0 0 0 setrgbcolor
0.00688 setlinewidth
0.50129 0.4903 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.55201 0.57624 Mdot
0 0 0 setrgbcolor
0.01775 setlinewidth
0.47499 0.52113 Mdot
0 0 0 setrgbcolor
0.01104 setlinewidth
0.49368 0.576 Mdot
0 0 0 setrgbcolor
0.01083 setlinewidth
0.55189 0.49423 Mdot
0 0 0 setrgbcolor
0.00758 setlinewidth
0.5541 0.57485 Mdot
0 0 0 setrgbcolor
0.01417 setlinewidth
0.56337 0.56562 Mdot
0 0 0 setrgbcolor
0.01421 setlinewidth
0.52653 0.58562 Mdot
0 0 0 setrgbcolor
0.01518 setlinewidth
0.52755 0.58554 Mdot
0 0 0 setrgbcolor
0.01261 setlinewidth
0.53291 0.58475 Mdot
0 0 0 setrgbcolor
0.00815 setlinewidth
0.50527 0.58238 Mdot
0 0 0 setrgbcolor
0.0171 setlinewidth
0.4728 0.53604 Mdot
0 0 0 setrgbcolor
0.01399 setlinewidth
0.49959 0.49092 Mdot
0 0 0 setrgbcolor
0.01474 setlinewidth
0.51585 0.58508 Mdot
0 0 0 setrgbcolor
0.00555 setlinewidth
0.49881 0.49136 Mdot
0 0 0 setrgbcolor
0.01353 setlinewidth
0.55684 0.49823 Mdot
0 0 0 setrgbcolor
0.01257 setlinewidth
0.47297 0.53729 Mdot
0 0 0 setrgbcolor
0.00592 setlinewidth
0.53128 0.48589 Mdot
0 0 0 setrgbcolor
0.01952 setlinewidth
0.47324 0.53715 Mdot
0 0 0 setrgbcolor
0.01328 setlinewidth
0.48677 0.50117 Mdot
0 0 0 setrgbcolor
0.01698 setlinewidth
0.5628 0.50545 Mdot
0 0 0 setrgbcolor
0.00801 setlinewidth
0.57118 0.54778 Mdot
0 0 0 setrgbcolor
0.01588 setlinewidth
0.56466 0.5606 Mdot
0 0 0 setrgbcolor
0.01359 setlinewidth
0.55086 0.57516 Mdot
0 0 0 setrgbcolor
0.00748 setlinewidth
0.50886 0.58158 Mdot
0 0 0 setrgbcolor
0.00809 setlinewidth
0.51765 0.4873 Mdot
0 0 0 setrgbcolor
0.01095 setlinewidth
0.47647 0.52439 Mdot
0 0 0 setrgbcolor
0.01382 setlinewidth
0.51353 0.4886 Mdot
0 0 0 setrgbcolor
0.00647 setlinewidth
0.56215 0.50802 Mdot
0 0 0 setrgbcolor
0.0165 setlinewidth
0.52663 0.5827 Mdot
0 0 0 setrgbcolor
0.00574 setlinewidth
0.47618 0.54241 Mdot
0 0 0 setrgbcolor
0.01882 setlinewidth
0.5018 0.57717 Mdot
0 0 0 setrgbcolor
0.01649 setlinewidth
0.52353 0.58228 Mdot
0 0 0 setrgbcolor
0.01575 setlinewidth
0.54839 0.57464 Mdot
0 0 0 setrgbcolor
0.01187 setlinewidth
0.56129 0.5093 Mdot
0 0 0 setrgbcolor
0.01212 setlinewidth
0.5369 0.57925 Mdot
0 0 0 setrgbcolor
0.01496 setlinewidth
0.52096 0.58089 Mdot
0 0 0 setrgbcolor
0.01379 setlinewidth
0.52769 0.49012 Mdot
0 0 0 setrgbcolor
0.01225 setlinewidth
0.5632 0.51524 Mdot
0 0 0 setrgbcolor
0.01018 setlinewidth
0.55333 0.50279 Mdot
0 0 0 setrgbcolor
0.00757 setlinewidth
0.54918 0.57128 Mdot
0 0 0 setrgbcolor
0.01977 setlinewidth
0.5213 0.579 Mdot
0 0 0 setrgbcolor
0.00688 setlinewidth
0.52373 0.57887 Mdot
0 0 0 setrgbcolor
0.008 setlinewidth
0.55044 0.56914 Mdot
0 0 0 setrgbcolor
0.0151 setlinewidth
0.52628 0.57759 Mdot
0 0 0 setrgbcolor
0.01246 setlinewidth
0.4867 0.55688 Mdot
0 0 0 setrgbcolor
0.00559 setlinewidth
0.5247 0.57693 Mdot
0 0 0 setrgbcolor
0.01427 setlinewidth
0.52251 0.57677 Mdot
0 0 0 setrgbcolor
0.01298 setlinewidth
0.52282 0.57647 Mdot
0 0 0 setrgbcolor
0.01844 setlinewidth
0.5389 0.5732 Mdot
0 0 0 setrgbcolor
0.01743 setlinewidth
0.51576 0.57514 Mdot
0 0 0 setrgbcolor
0.01191 setlinewidth
0.50476 0.57031 Mdot
0 0 0 setrgbcolor
0.01052 setlinewidth
0.53132 0.57383 Mdot
0 0 0 setrgbcolor
0.01118 setlinewidth
0.5009 0.56732 Mdot
0 0 0 setrgbcolor
0.00563 setlinewidth
0.54739 0.56568 Mdot
0 0 0 setrgbcolor
0.01616 setlinewidth
0.53853 0.49978 Mdot
0 0 0 setrgbcolor
0.01858 setlinewidth
0.53994 0.57006 Mdot
0 0 0 setrgbcolor
0.00762 setlinewidth
0.5356 0.57134 Mdot
0 0 0 setrgbcolor
0.01102 setlinewidth
0.54049 0.50161 Mdot
0 0 0 setrgbcolor
0.01401 setlinewidth
0.53335 0.49882 Mdot
0 0 0 setrgbcolor
0.01687 setlinewidth
0.51718 0.57263 Mdot
0 0 0 setrgbcolor
0.00556 setlinewidth
0.54788 0.50704 Mdot
0 0 0 setrgbcolor
0.01679 setlinewidth
0.51902 0.57205 Mdot
0 0 0 setrgbcolor
0.00834 setlinewidth
0.55803 0.52681 Mdot
0 0 0 setrgbcolor
0.00808 setlinewidth
0.55721 0.52448 Mdot
0 0 0 setrgbcolor
0.01268 setlinewidth
0.52394 0.57054 Mdot
0 0 0 setrgbcolor
0.01646 setlinewidth
0.52912 0.56997 Mdot
0 0 0 setrgbcolor
0.01043 setlinewidth
0.54309 0.50691 Mdot
0 0 0 setrgbcolor
0.00728 setlinewidth
0.49985 0.56048 Mdot
0 0 0 setrgbcolor
0.01995 setlinewidth
0.49084 0.54471 Mdot
0 0 0 setrgbcolor
0.01832 setlinewidth
0.54097 0.50763 Mdot
0 0 0 setrgbcolor
0.01693 setlinewidth
0.49915 0.55802 Mdot
0 0 0 setrgbcolor
0.01764 setlinewidth
0.49089 0.54158 Mdot
0 0 0 setrgbcolor
0.00969 setlinewidth
0.54985 0.51738 Mdot
0 0 0 setrgbcolor
0.00596 setlinewidth
0.50004 0.51287 Mdot
0 0 0 setrgbcolor
0.01023 setlinewidth
0.53228 0.5659 Mdot
0 0 0 setrgbcolor
0.01969 setlinewidth
0.498 0.51641 Mdot
0 0 0 setrgbcolor
0.01637 setlinewidth
0.54308 0.55698 Mdot
0 0 0 setrgbcolor
0.01296 setlinewidth
0.52824 0.56348 Mdot
0 0 0 setrgbcolor
0.0152 setlinewidth
0.54298 0.55423 Mdot
0 0 0 setrgbcolor
0.01918 setlinewidth
0.4975 0.53368 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.50551 0.5539 Mdot
0 0 0 setrgbcolor
0.00915 setlinewidth
0.54843 0.53606 Mdot
0 0 0 setrgbcolor
0.01949 setlinewidth
0.54477 0.52239 Mdot
0 0 0 setrgbcolor
0.01761 setlinewidth
0.50787 0.5164 Mdot
0 0 0 setrgbcolor
0.01874 setlinewidth
0.54001 0.55125 Mdot
0 0 0 setrgbcolor
0.01386 setlinewidth
0.54147 0.54888 Mdot
0 0 0 setrgbcolor
0.01898 setlinewidth
0.53541 0.55427 Mdot
0 0 0 setrgbcolor
0.01191 setlinewidth
0.50655 0.54941 Mdot
0 0 0 setrgbcolor
0.01963 setlinewidth
0.52395 0.51401 Mdot
0 0 0 setrgbcolor
0.01672 setlinewidth
0.50852 0.55057 Mdot
0 0 0 setrgbcolor
0.01237 setlinewidth
0.50245 0.53402 Mdot
0 0 0 setrgbcolor
0.00641 setlinewidth
0.52268 0.51604 Mdot
0 0 0 setrgbcolor
0.01542 setlinewidth
0.53393 0.54824 Mdot
0 0 0 setrgbcolor
0.01625 setlinewidth
0.51015 0.5456 Mdot
0 0 0 setrgbcolor
0.01068 setlinewidth
0.5191 0.5233 Mdot
0 0 0 setrgbcolor
0.0058 setlinewidth
0.51565 0.53267 Mdot
1 1 1 setrgbcolor
0.00559 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.0198 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01365 setlinewidth
0.53509 0.54246 Mdot
0 0 0 setrgbcolor
0.01422 setlinewidth
0.53582 0.54163 Mdot
0 0 0 setrgbcolor
0.01108 setlinewidth
0.50852 0.5285 Mdot
0 0 0 setrgbcolor
0.01391 setlinewidth
0.51928 0.51835 Mdot
0 0 0 setrgbcolor
0.00523 setlinewidth
0.51186 0.51766 Mdot
0 0 0 setrgbcolor
0.01673 setlinewidth
0.52152 0.51366 Mdot
0 0 0 setrgbcolor
0.00849 setlinewidth
0.53092 0.5557 Mdot
0 0 0 setrgbcolor
0.01292 setlinewidth
0.53234 0.51533 Mdot
0 0 0 setrgbcolor
0.00596 setlinewidth
0.50251 0.54612 Mdot
0 0 0 setrgbcolor
0.01421 setlinewidth
0.49961 0.53786 Mdot
0 0 0 setrgbcolor
0.01566 setlinewidth
0.54554 0.54361 Mdot
0 0 0 setrgbcolor
0.00889 setlinewidth
0.53631 0.51424 Mdot
0 0 0 setrgbcolor
0.008 setlinewidth
0.51567 0.55978 Mdot
0 0 0 setrgbcolor
0.01306 setlinewidth
0.53074 0.50857 Mdot
0 0 0 setrgbcolor
0.01269 setlinewidth
0.54217 0.55643 Mdot
0 0 0 setrgbcolor
0.01392 setlinewidth
0.52793 0.50728 Mdot
0 0 0 setrgbcolor
0.00902 setlinewidth
0.49481 0.53004 Mdot
0 0 0 setrgbcolor
0.01912 setlinewidth
0.51132 0.50905 Mdot
0 0 0 setrgbcolor
0.01231 setlinewidth
0.53787 0.50952 Mdot
0 0 0 setrgbcolor
0.0127 setlinewidth
0.53627 0.56239 Mdot
0 0 0 setrgbcolor
0.01001 setlinewidth
0.51462 0.56618 Mdot
0 0 0 setrgbcolor
0.01233 setlinewidth
0.53969 0.50773 Mdot
0 0 0 setrgbcolor
0.01821 setlinewidth
0.52797 0.50345 Mdot
0 0 0 setrgbcolor
0.0135 setlinewidth
0.53426 0.50484 Mdot
0 0 0 setrgbcolor
0.01773 setlinewidth
0.54711 0.51174 Mdot
0 0 0 setrgbcolor
0.01416 setlinewidth
0.54265 0.50766 Mdot
0 0 0 setrgbcolor
0.01108 setlinewidth
0.55119 0.5157 Mdot
0 0 0 setrgbcolor
0.01122 setlinewidth
0.54103 0.50551 Mdot
0 0 0 setrgbcolor
0.00526 setlinewidth
0.54113 0.50544 Mdot
0 0 0 setrgbcolor
0.01805 setlinewidth
0.53483 0.56947 Mdot
0 0 0 setrgbcolor
0.01836 setlinewidth
0.4869 0.53576 Mdot
0 0 0 setrgbcolor
0.01287 setlinewidth
0.49902 0.50773 Mdot
0 0 0 setrgbcolor
0.01667 setlinewidth
0.51265 0.50015 Mdot
0 0 0 setrgbcolor
0.0134 setlinewidth
0.5029 0.50453 Mdot
0 0 0 setrgbcolor
0.00744 setlinewidth
0.5408 0.50249 Mdot
0 0 0 setrgbcolor
0.01852 setlinewidth
0.49132 0.51503 Mdot
0 0 0 setrgbcolor
0.007 setlinewidth
0.4855 0.53069 Mdot
0 0 0 setrgbcolor
0.01283 setlinewidth
0.52597 0.49597 Mdot
0 0 0 setrgbcolor
0.0054 setlinewidth
0.49463 0.5078 Mdot
0 0 0 setrgbcolor
0.01645 setlinewidth
0.5214 0.49524 Mdot
0 0 0 setrgbcolor
0.01511 setlinewidth
0.5195 0.49524 Mdot
0 0 0 setrgbcolor
0.0139 setlinewidth
0.52747 0.57539 Mdot
0 0 0 setrgbcolor
0.01931 setlinewidth
0.51892 0.49475 Mdot
0 0 0 setrgbcolor
0.01149 setlinewidth
0.52402 0.49442 Mdot
0 0 0 setrgbcolor
0.01974 setlinewidth
0.48774 0.51417 Mdot
0 0 0 setrgbcolor
0.01196 setlinewidth
0.52642 0.49423 Mdot
0 0 0 setrgbcolor
0.00525 setlinewidth
0.53998 0.57316 Mdot
0 0 0 setrgbcolor
0.01302 setlinewidth
0.52465 0.49392 Mdot
0 0 0 setrgbcolor
0.01986 setlinewidth
0.52119 0.49382 Mdot
0 0 0 setrgbcolor
0.01518 setlinewidth
0.52266 0.4934 Mdot
0 0 0 setrgbcolor
0.01044 setlinewidth
0.48293 0.52225 Mdot
0 0 0 setrgbcolor
0.01382 setlinewidth
0.52109 0.49314 Mdot
0 0 0 setrgbcolor
0.01367 setlinewidth
0.5275 0.49324 Mdot
0 0 0 setrgbcolor
0.01844 setlinewidth
0.52261 0.49294 Mdot
0 0 0 setrgbcolor
0.0147 setlinewidth
0.51766 0.49224 Mdot
0 0 0 setrgbcolor
0.00648 setlinewidth
0.52484 0.49175 Mdot
0 0 0 setrgbcolor
0.01703 setlinewidth
0.51306 0.49256 Mdot
0 0 0 setrgbcolor
0.01139 setlinewidth
0.51454 0.49176 Mdot
0 0 0 setrgbcolor
0.00763 setlinewidth
0.56586 0.52262 Mdot
0 0 0 setrgbcolor
0.01698 setlinewidth
0.52698 0.49042 Mdot
0 0 0 setrgbcolor
0.01751 setlinewidth
0.53473 0.49143 Mdot
0 0 0 setrgbcolor
0.01284 setlinewidth
0.52048 0.48962 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.50374 0.57688 Mdot
0 0 0 setrgbcolor
0.0092 setlinewidth
0.48656 0.50715 Mdot
0 0 0 setrgbcolor
0.00905 setlinewidth
0.47564 0.53393 Mdot
0 0 0 setrgbcolor
0.01094 setlinewidth
0.50419 0.49175 Mdot
0 0 0 setrgbcolor
0.0053 setlinewidth
0.49038 0.56993 Mdot
0 0 0 setrgbcolor
0.00702 setlinewidth
0.50254 0.57846 Mdot
0 0 0 setrgbcolor
0.00645 setlinewidth
0.47904 0.55381 Mdot
0 0 0 setrgbcolor
0.0107 setlinewidth
0.53908 0.49008 Mdot
0 0 0 setrgbcolor
0.01087 setlinewidth
0.51793 0.48758 Mdot
0 0 0 setrgbcolor
0.01249 setlinewidth
0.47664 0.52065 Mdot
0 0 0 setrgbcolor
0.00738 setlinewidth
0.4746 0.52976 Mdot
0 0 0 setrgbcolor
0.01415 setlinewidth
0.53098 0.48716 Mdot
0 0 0 setrgbcolor
0.01033 setlinewidth
0.52245 0.48626 Mdot
0 0 0 setrgbcolor
0.01648 setlinewidth
0.56092 0.50383 Mdot
0 0 0 setrgbcolor
0.0064 setlinewidth
0.52367 0.48577 Mdot
0 0 0 setrgbcolor
0.012 setlinewidth
0.53979 0.48849 Mdot
0 0 0 setrgbcolor
0.00744 setlinewidth
0.47376 0.52873 Mdot
0 0 0 setrgbcolor
0.01114 setlinewidth
0.47342 0.54156 Mdot
0 0 0 setrgbcolor
0.01387 setlinewidth
0.53215 0.4861 Mdot
0 0 0 setrgbcolor
0.01208 setlinewidth
0.56105 0.50235 Mdot
0 0 0 setrgbcolor
0.01062 setlinewidth
0.48465 0.5683 Mdot
0 0 0 setrgbcolor
0.01573 setlinewidth
0.47297 0.52796 Mdot
0 0 0 setrgbcolor
0.01122 setlinewidth
0.48052 0.50748 Mdot
0 0 0 setrgbcolor
0.01672 setlinewidth
0.53572 0.58519 Mdot
0 0 0 setrgbcolor
0.00851 setlinewidth
0.56483 0.50505 Mdot
0 0 0 setrgbcolor
0.01345 setlinewidth
0.49502 0.49195 Mdot
0 0 0 setrgbcolor
0.01054 setlinewidth
0.52999 0.48395 Mdot
0 0 0 setrgbcolor
0.00858 setlinewidth
0.54734 0.58119 Mdot
0 0 0 setrgbcolor
0.00741 setlinewidth
0.50018 0.5819 Mdot
0 0 0 setrgbcolor
0.00763 setlinewidth
0.55984 0.57201 Mdot
0 0 0 setrgbcolor
0.01046 setlinewidth
0.5723 0.55227 Mdot
0 0 0 setrgbcolor
0.01649 setlinewidth
0.57456 0.54327 Mdot
0 0 0 setrgbcolor
0.00972 setlinewidth
0.53481 0.48457 Mdot
0 0 0 setrgbcolor
0.01564 setlinewidth
0.54248 0.48697 Mdot
0 0 0 setrgbcolor
0.00683 setlinewidth
0.558 0.49657 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.47137 0.54381 Mdot
0 0 0 setrgbcolor
0.00779 setlinewidth
0.57033 0.55807 Mdot
0 0 0 setrgbcolor
0.01243 setlinewidth
0.54484 0.48751 Mdot
0 0 0 setrgbcolor
0.01595 setlinewidth
0.47138 0.54511 Mdot
0 0 0 setrgbcolor
0.0051 setlinewidth
0.55073 0.58034 Mdot
0 0 0 setrgbcolor
0.00573 setlinewidth
0.47115 0.54495 Mdot
0 0 0 setrgbcolor
0.00866 setlinewidth
0.57427 0.54844 Mdot
0 0 0 setrgbcolor
0.01086 setlinewidth
0.54458 0.48709 Mdot
0 0 0 setrgbcolor
0.01959 setlinewidth
0.56449 0.56818 Mdot
0 0 0 setrgbcolor
0.01207 setlinewidth
0.55417 0.49258 Mdot
0 0 0 setrgbcolor
0.01983 setlinewidth
0.49143 0.493 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.49066 0.49358 Mdot
0 0 0 setrgbcolor
0.00897 setlinewidth
0.47929 0.50567 Mdot
0 0 0 setrgbcolor
0.00764 setlinewidth
0.57279 0.55351 Mdot
0 0 0 setrgbcolor
0.01692 setlinewidth
0.55903 0.57419 Mdot
0 0 0 setrgbcolor
0.01565 setlinewidth
0.51126 0.58692 Mdot
0 0 0 setrgbcolor
0.00563 setlinewidth
0.54678 0.48805 Mdot
0 0 0 setrgbcolor
0.00993 setlinewidth
0.55981 0.57344 Mdot
0 0 0 setrgbcolor
0.01795 setlinewidth
0.53403 0.5871 Mdot
0 0 0 setrgbcolor
0.01706 setlinewidth
0.53497 0.58687 Mdot
0 0 0 setrgbcolor
0.01625 setlinewidth
0.56144 0.5717 Mdot
0 0 0 setrgbcolor
0.01166 setlinewidth
0.52231 0.58817 Mdot
0 0 0 setrgbcolor
0.00783 setlinewidth
0.57549 0.54205 Mdot
0 0 0 setrgbcolor
0.01005 setlinewidth
0.54006 0.58526 Mdot
0 0 0 setrgbcolor
0.0105 setlinewidth
0.47067 0.53141 Mdot
0 0 0 setrgbcolor
0.01846 setlinewidth
0.5225 0.48279 Mdot
0 0 0 setrgbcolor
0.0071 setlinewidth
0.47285 0.5501 Mdot
0 0 0 setrgbcolor
0.01317 setlinewidth
0.56878 0.56073 Mdot
0 0 0 setrgbcolor
0.00823 setlinewidth
0.55055 0.49157 Mdot
0 0 0 setrgbcolor
0.01821 setlinewidth
0.51249 0.58574 Mdot
0 0 0 setrgbcolor
0.01772 setlinewidth
0.50695 0.48656 Mdot
0 0 0 setrgbcolor
0.01628 setlinewidth
0.50254 0.48859 Mdot
0 0 0 setrgbcolor
0.01205 setlinewidth
0.50377 0.58228 Mdot
0 0 0 setrgbcolor
0.00848 setlinewidth
0.55705 0.49819 Mdot
0 0 0 setrgbcolor
0.01806 setlinewidth
0.53017 0.58432 Mdot
0 0 0 setrgbcolor
0.01027 setlinewidth
0.57213 0.54105 Mdot
0 0 0 setrgbcolor
0.01934 setlinewidth
0.52663 0.58436 Mdot
0 0 0 setrgbcolor
0.00941 setlinewidth
0.55446 0.57279 Mdot
0 0 0 setrgbcolor
0.01381 setlinewidth
0.48349 0.56366 Mdot
0 0 0 setrgbcolor
0.01954 setlinewidth
0.52315 0.58335 Mdot
0 0 0 setrgbcolor
0.00664 setlinewidth
0.516 0.488 Mdot
0 0 0 setrgbcolor
0.00753 setlinewidth
0.56643 0.55551 Mdot
0 0 0 setrgbcolor
0.01976 setlinewidth
0.55508 0.5011 Mdot
0 0 0 setrgbcolor
0.01736 setlinewidth
0.53935 0.57926 Mdot
0 0 0 setrgbcolor
0.01934 setlinewidth
0.55074 0.57271 Mdot
0 0 0 setrgbcolor
0.01707 setlinewidth
0.52244 0.58139 Mdot
0 0 0 setrgbcolor
0.01465 setlinewidth
0.52484 0.58091 Mdot
0 0 0 setrgbcolor
0.01894 setlinewidth
0.55361 0.50262 Mdot
0 0 0 setrgbcolor
0.00864 setlinewidth
0.49849 0.57242 Mdot
0 0 0 setrgbcolor
0.01548 setlinewidth
0.503 0.57493 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.52684 0.57923 Mdot
0 0 0 setrgbcolor
0.01677 setlinewidth
0.51518 0.57829 Mdot
0 0 0 setrgbcolor
0.01882 setlinewidth
0.52258 0.57895 Mdot
0 0 0 setrgbcolor
0.0198 setlinewidth
0.52489 0.57879 Mdot
0 0 0 setrgbcolor
0.01857 setlinewidth
0.54367 0.49716 Mdot
0 0 0 setrgbcolor
0.01897 setlinewidth
0.52275 0.57861 Mdot
0 0 0 setrgbcolor
0.01244 setlinewidth
0.54998 0.56917 Mdot
0 0 0 setrgbcolor
0.01982 setlinewidth
0.55588 0.50856 Mdot
0 0 0 setrgbcolor
0.01681 setlinewidth
0.48369 0.55058 Mdot
0 0 0 setrgbcolor
0.00923 setlinewidth
0.55058 0.56677 Mdot
0 0 0 setrgbcolor
0.00947 setlinewidth
0.48311 0.54735 Mdot
0 0 0 setrgbcolor
0.01318 setlinewidth
0.49533 0.56556 Mdot
0 0 0 setrgbcolor
0.01724 setlinewidth
0.51554 0.57552 Mdot
0 0 0 setrgbcolor
0.0152 setlinewidth
0.53863 0.5728 Mdot
0 0 0 setrgbcolor
0.01602 setlinewidth
0.49401 0.56314 Mdot
0 0 0 setrgbcolor
0.01216 setlinewidth
0.48786 0.5162 Mdot
0 0 0 setrgbcolor
0.01213 setlinewidth
0.53052 0.57463 Mdot
0 0 0 setrgbcolor
0.00511 setlinewidth
0.48622 0.5202 Mdot
0 0 0 setrgbcolor
0.0106 setlinewidth
0.51713 0.57466 Mdot
0 0 0 setrgbcolor
0.01072 setlinewidth
0.5207 0.49632 Mdot
0 0 0 setrgbcolor
0.01311 setlinewidth
0.52633 0.49649 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.53418 0.57142 Mdot
0 0 0 setrgbcolor
0.0094 setlinewidth
0.52841 0.4981 Mdot
0 0 0 setrgbcolor
0.0197 setlinewidth
0.53853 0.56942 Mdot
0 0 0 setrgbcolor
0.01659 setlinewidth
0.52152 0.57238 Mdot
0 0 0 setrgbcolor
0.00509 setlinewidth
0.54555 0.56373 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.52671 0.57102 Mdot
0 0 0 setrgbcolor
0.01068 setlinewidth
0.48751 0.53824 Mdot
0 0 0 setrgbcolor
0.00639 setlinewidth
0.53671 0.50258 Mdot
0 0 0 setrgbcolor
0.01619 setlinewidth
0.49871 0.55798 Mdot
0 0 0 setrgbcolor
0.0115 setlinewidth
0.53118 0.50326 Mdot
0 0 0 setrgbcolor
0.01627 setlinewidth
0.49521 0.51873 Mdot
0 0 0 setrgbcolor
0.00648 setlinewidth
0.52879 0.50436 Mdot
0 0 0 setrgbcolor
0.01472 setlinewidth
0.5287 0.56635 Mdot
0 0 0 setrgbcolor
0.00696 setlinewidth
0.49204 0.53787 Mdot
0 0 0 setrgbcolor
0.00507 setlinewidth
0.49864 0.5532 Mdot
0 0 0 setrgbcolor
0.0191 setlinewidth
0.54854 0.51933 Mdot
0 0 0 setrgbcolor
0.014 setlinewidth
0.54977 0.52162 Mdot
0 0 0 setrgbcolor
0.01155 setlinewidth
0.50076 0.55412 Mdot
0 0 0 setrgbcolor
0.01076 setlinewidth
0.52369 0.56448 Mdot
0 0 0 setrgbcolor
0.00738 setlinewidth
0.53922 0.51313 Mdot
0 0 0 setrgbcolor
0.00714 setlinewidth
0.50126 0.54874 Mdot
0 0 0 setrgbcolor
0.00882 setlinewidth
0.53795 0.55546 Mdot
0 0 0 setrgbcolor
0.01132 setlinewidth
0.51085 0.51377 Mdot
0 0 0 setrgbcolor
0.00615 setlinewidth
0.50968 0.51609 Mdot
0 0 0 setrgbcolor
0.0154 setlinewidth
0.53714 0.55263 Mdot
0 0 0 setrgbcolor
0.01566 setlinewidth
0.50668 0.52423 Mdot
0 0 0 setrgbcolor
0.00888 setlinewidth
0.52883 0.55387 Mdot
0 0 0 setrgbcolor
0.01127 setlinewidth
0.53378 0.51922 Mdot
0 0 0 setrgbcolor
0.00943 setlinewidth
0.50441 0.53451 Mdot
0 0 0 setrgbcolor
0.01499 setlinewidth
0.53312 0.55002 Mdot
0 0 0 setrgbcolor
0.0119 setlinewidth
0.53964 0.53288 Mdot
0 0 0 setrgbcolor
0.0156 setlinewidth
0.53421 0.54733 Mdot
0 0 0 setrgbcolor
0.00853 setlinewidth
0.52588 0.54786 Mdot
1 1 1 setrgbcolor
0.0198 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.01962 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01594 setlinewidth
0.5175 0.52972 Mdot
0 0 0 setrgbcolor
0.01732 setlinewidth
0.50926 0.54083 Mdot
0 0 0 setrgbcolor
0.00971 setlinewidth
0.51351 0.54894 Mdot
0 0 0 setrgbcolor
0.01261 setlinewidth
0.51884 0.518 Mdot
0 0 0 setrgbcolor
0.01821 setlinewidth
0.52678 0.51755 Mdot
0 0 0 setrgbcolor
0.01631 setlinewidth
0.5026 0.53351 Mdot
0 0 0 setrgbcolor
0.01457 setlinewidth
0.52798 0.51235 Mdot
0 0 0 setrgbcolor
0.00688 setlinewidth
0.5468 0.54012 Mdot
0 0 0 setrgbcolor
0.01712 setlinewidth
0.54741 0.53915 Mdot
0 0 0 setrgbcolor
0.01237 setlinewidth
0.52871 0.56113 Mdot
0 0 0 setrgbcolor
0.01911 setlinewidth
0.5161 0.50923 Mdot
0 0 0 setrgbcolor
0.01133 setlinewidth
0.53922 0.5124 Mdot
0 0 0 setrgbcolor
0.0105 setlinewidth
0.54399 0.55456 Mdot
0 0 0 setrgbcolor
0.01053 setlinewidth
0.49425 0.54073 Mdot
0 0 0 setrgbcolor
0.01 setlinewidth
0.49173 0.53572 Mdot
0 0 0 setrgbcolor
0.01967 setlinewidth
0.54281 0.51068 Mdot
0 0 0 setrgbcolor
0.01979 setlinewidth
0.53275 0.50479 Mdot
0 0 0 setrgbcolor
0.01305 setlinewidth
0.5359 0.50569 Mdot
0 0 0 setrgbcolor
0.01277 setlinewidth
0.49525 0.51864 Mdot
0 0 0 setrgbcolor
0.01289 setlinewidth
0.52775 0.568 Mdot
0 0 0 setrgbcolor
0.0124 setlinewidth
0.50214 0.50987 Mdot
0 0 0 setrgbcolor
0.01767 setlinewidth
0.55685 0.53978 Mdot
0 0 0 setrgbcolor
0.01914 setlinewidth
0.50553 0.50596 Mdot
0 0 0 setrgbcolor
0.00949 setlinewidth
0.53165 0.50085 Mdot
0 0 0 setrgbcolor
0.01318 setlinewidth
0.54305 0.50557 Mdot
0 0 0 setrgbcolor
0.00839 setlinewidth
0.49706 0.51067 Mdot
0 0 0 setrgbcolor
0.01783 setlinewidth
0.51477 0.49989 Mdot
0 0 0 setrgbcolor
0.019 setlinewidth
0.49067 0.51836 Mdot
0 0 0 setrgbcolor
0.01713 setlinewidth
0.55485 0.55367 Mdot
0 0 0 setrgbcolor
0.00595 setlinewidth
0.54951 0.56077 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.48677 0.52747 Mdot
0 0 0 setrgbcolor
0.01515 setlinewidth
0.53823 0.50131 Mdot
0 0 0 setrgbcolor
0.01778 setlinewidth
0.54426 0.50346 Mdot
0 0 0 setrgbcolor
0.01401 setlinewidth
0.54699 0.50293 Mdot
0 0 0 setrgbcolor
0.01095 setlinewidth
0.54484 0.50097 Mdot
0 0 0 setrgbcolor
0.00806 setlinewidth
0.54491 0.50088 Mdot
0 0 0 setrgbcolor
0.00602 setlinewidth
0.55221 0.50648 Mdot
0 0 0 setrgbcolor
0.01161 setlinewidth
0.54812 0.56844 Mdot
0 0 0 setrgbcolor
0.01499 setlinewidth
0.52018 0.49378 Mdot
0 0 0 setrgbcolor
0.01954 setlinewidth
0.52215 0.49348 Mdot
0 0 0 setrgbcolor
0.01248 setlinewidth
0.52706 0.49351 Mdot
0 0 0 setrgbcolor
0.01075 setlinewidth
0.51939 0.49337 Mdot
0 0 0 setrgbcolor
0.00568 setlinewidth
0.55689 0.50997 Mdot
0 0 0 setrgbcolor
0.01919 setlinewidth
0.54365 0.4979 Mdot
0 0 0 setrgbcolor
0.01213 setlinewidth
0.52448 0.49222 Mdot
0 0 0 setrgbcolor
0.018 setlinewidth
0.52135 0.49206 Mdot
0 0 0 setrgbcolor
0.0089 setlinewidth
0.48689 0.51139 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.52491 0.49162 Mdot
0 0 0 setrgbcolor
0.01756 setlinewidth
0.52681 0.49165 Mdot
0 0 0 setrgbcolor
0.00794 setlinewidth
0.52267 0.4914 Mdot
0 0 0 setrgbcolor
0.01367 setlinewidth
0.47943 0.54079 Mdot
0 0 0 setrgbcolor
0.01221 setlinewidth
0.52096 0.49139 Mdot
0 0 0 setrgbcolor
0.01002 setlinewidth
0.54059 0.57576 Mdot
0 0 0 setrgbcolor
0.01952 setlinewidth
0.52243 0.49094 Mdot
0 0 0 setrgbcolor
0.00934 setlinewidth
0.51222 0.49209 Mdot
0 0 0 setrgbcolor
0.00764 setlinewidth
0.51699 0.49102 Mdot
0 0 0 setrgbcolor
0.00521 setlinewidth
0.52746 0.49048 Mdot
0 0 0 setrgbcolor
0.0174 setlinewidth
0.48577 0.56084 Mdot
0 0 0 setrgbcolor
0.01172 setlinewidth
0.51345 0.49104 Mdot
0 0 0 setrgbcolor
0.01273 setlinewidth
0.47714 0.53669 Mdot
0 0 0 setrgbcolor
0.01819 setlinewidth
0.52416 0.48938 Mdot
0 0 0 setrgbcolor
0.01296 setlinewidth
0.47785 0.52696 Mdot
0 0 0 setrgbcolor
0.01614 setlinewidth
0.51505 0.58097 Mdot
0 0 0 setrgbcolor
0.01097 setlinewidth
0.49976 0.5758 Mdot
0 0 0 setrgbcolor
0.01192 setlinewidth
0.55274 0.57159 Mdot
0 0 0 setrgbcolor
0.00972 setlinewidth
0.47562 0.53579 Mdot
0 0 0 setrgbcolor
0.01242 setlinewidth
0.50181 0.49275 Mdot
0 0 0 setrgbcolor
0.01644 setlinewidth
0.51867 0.48791 Mdot
0 0 0 setrgbcolor
0.01884 setlinewidth
0.52565 0.4877 Mdot
0 0 0 setrgbcolor
0.01786 setlinewidth
0.47706 0.54911 Mdot
0 0 0 setrgbcolor
0.00701 setlinewidth
0.5133 0.58285 Mdot
0 0 0 setrgbcolor
0.011 setlinewidth
0.47415 0.53515 Mdot
0 0 0 setrgbcolor
0.01847 setlinewidth
0.53359 0.48752 Mdot
0 0 0 setrgbcolor
0.00987 setlinewidth
0.51486 0.48626 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.47848 0.51284 Mdot
0 0 0 setrgbcolor
0.00529 setlinewidth
0.4921 0.5751 Mdot
0 0 0 setrgbcolor
0.01846 setlinewidth
0.51874 0.48421 Mdot
0 0 0 setrgbcolor
0.00767 setlinewidth
0.57051 0.51506 Mdot
0 0 0 setrgbcolor
0.01002 setlinewidth
0.53679 0.4855 Mdot
0 0 0 setrgbcolor
0.01373 setlinewidth
0.52769 0.48379 Mdot
0 0 0 setrgbcolor
0.01703 setlinewidth
0.51965 0.48353 Mdot
0 0 0 setrgbcolor
0.01391 setlinewidth
0.49007 0.49457 Mdot
0 0 0 setrgbcolor
0.0148 setlinewidth
0.47327 0.5519 Mdot
0 0 0 setrgbcolor
0.013 setlinewidth
0.52804 0.48255 Mdot
0 0 0 setrgbcolor
0.01129 setlinewidth
0.47311 0.55327 Mdot
0 0 0 setrgbcolor
0.01087 setlinewidth
0.53638 0.48379 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.50884 0.58697 Mdot
0 0 0 setrgbcolor
0.01329 setlinewidth
0.47236 0.55318 Mdot
0 0 0 setrgbcolor
0.0178 setlinewidth
0.56063 0.49639 Mdot
0 0 0 setrgbcolor
0.01363 setlinewidth
0.4741 0.51138 Mdot
0 0 0 setrgbcolor
0.01523 setlinewidth
0.52412 0.48076 Mdot
0 0 0 setrgbcolor
0.01864 setlinewidth
0.55992 0.49487 Mdot
0 0 0 setrgbcolor
0.01497 setlinewidth
0.54595 0.58508 Mdot
0 0 0 setrgbcolor
0.00894 setlinewidth
0.48395 0.49708 Mdot
0 0 0 setrgbcolor
0.01067 setlinewidth
0.48465 0.49636 Mdot
0 0 0 setrgbcolor
0.00711 setlinewidth
0.52884 0.48065 Mdot
0 0 0 setrgbcolor
0.00922 setlinewidth
0.53703 0.48193 Mdot
0 0 0 setrgbcolor
0.01591 setlinewidth
0.5568 0.57921 Mdot
0 0 0 setrgbcolor
0.00861 setlinewidth
0.46789 0.5394 Mdot
0 0 0 setrgbcolor
0.01309 setlinewidth
0.56324 0.49716 Mdot
0 0 0 setrgbcolor
0.00845 setlinewidth
0.5389 0.48215 Mdot
0 0 0 setrgbcolor
0.01376 setlinewidth
0.4726 0.55841 Mdot
0 0 0 setrgbcolor
0.01371 setlinewidth
0.55429 0.48944 Mdot
0 0 0 setrgbcolor
0.01812 setlinewidth
0.56815 0.56777 Mdot
0 0 0 setrgbcolor
0.00599 setlinewidth
0.51865 0.59071 Mdot
0 0 0 setrgbcolor
0.00633 setlinewidth
0.5379 0.4818 Mdot
0 0 0 setrgbcolor
0.01327 setlinewidth
0.57775 0.5453 Mdot
0 0 0 setrgbcolor
0.01842 setlinewidth
0.57864 0.53555 Mdot
0 0 0 setrgbcolor
0.01619 setlinewidth
0.57612 0.55169 Mdot
0 0 0 setrgbcolor
0.00663 setlinewidth
0.55864 0.57794 Mdot
0 0 0 setrgbcolor
0.00609 setlinewidth
0.54835 0.486 Mdot
0 0 0 setrgbcolor
0.0141 setlinewidth
0.52948 0.59042 Mdot
0 0 0 setrgbcolor
0.01375 setlinewidth
0.54157 0.58754 Mdot
0 0 0 setrgbcolor
0.01636 setlinewidth
0.53949 0.4825 Mdot
0 0 0 setrgbcolor
0.00824 setlinewidth
0.51286 0.48099 Mdot
0 0 0 setrgbcolor
0.01168 setlinewidth
0.54237 0.58717 Mdot
0 0 0 setrgbcolor
0.00548 setlinewidth
0.57077 0.56319 Mdot
0 0 0 setrgbcolor
0.01812 setlinewidth
0.5778 0.5411 Mdot
0 0 0 setrgbcolor
0.00582 setlinewidth
0.56549 0.57033 Mdot
0 0 0 setrgbcolor
0.01301 setlinewidth
0.49629 0.48746 Mdot
0 0 0 setrgbcolor
0.01132 setlinewidth
0.54682 0.58479 Mdot
0 0 0 setrgbcolor
0.00528 setlinewidth
0.49188 0.49028 Mdot
0 0 0 setrgbcolor
0.00945 setlinewidth
0.56599 0.56945 Mdot
0 0 0 setrgbcolor
0.00689 setlinewidth
0.57646 0.54667 Mdot
0 0 0 setrgbcolor
0.00695 setlinewidth
0.5172 0.5895 Mdot
0 0 0 setrgbcolor
0.00605 setlinewidth
0.56701 0.56742 Mdot
0 0 0 setrgbcolor
0.01536 setlinewidth
0.50723 0.58724 Mdot
0 0 0 setrgbcolor
0.0142 setlinewidth
0.48265 0.57105 Mdot
0 0 0 setrgbcolor
0.00808 setlinewidth
0.57679 0.53432 Mdot
0 0 0 setrgbcolor
0.00901 setlinewidth
0.54168 0.48572 Mdot
0 0 0 setrgbcolor
0.01468 setlinewidth
0.5717 0.55494 Mdot
0 0 0 setrgbcolor
0.00725 setlinewidth
0.50361 0.48767 Mdot
0 0 0 setrgbcolor
0.01267 setlinewidth
0.5336 0.5855 Mdot
0 0 0 setrgbcolor
0.01218 setlinewidth
0.52982 0.58609 Mdot
0 0 0 setrgbcolor
0.00609 setlinewidth
0.54831 0.49167 Mdot
0 0 0 setrgbcolor
0.0089 setlinewidth
0.52556 0.5856 Mdot
0 0 0 setrgbcolor
0.01919 setlinewidth
0.47853 0.55766 Mdot
0 0 0 setrgbcolor
0.01437 setlinewidth
0.4975 0.57801 Mdot
0 0 0 setrgbcolor
0.01583 setlinewidth
0.47731 0.55441 Mdot
0 0 0 setrgbcolor
0.01638 setlinewidth
0.50242 0.57995 Mdot
0 0 0 setrgbcolor
0.01088 setlinewidth
0.52374 0.58373 Mdot
0 0 0 setrgbcolor
0.00633 setlinewidth
0.47583 0.52587 Mdot
0 0 0 setrgbcolor
0.01369 setlinewidth
0.47693 0.52147 Mdot
0 0 0 setrgbcolor
0.01481 setlinewidth
0.55633 0.56989 Mdot
0 0 0 setrgbcolor
0.01495 setlinewidth
0.52594 0.58288 Mdot
0 0 0 setrgbcolor
0.00993 setlinewidth
0.49226 0.57146 Mdot
0 0 0 setrgbcolor
0.01266 setlinewidth
0.54095 0.57897 Mdot
0 0 0 setrgbcolor
0.01894 setlinewidth
0.49035 0.56915 Mdot
0 0 0 setrgbcolor
0.00951 setlinewidth
0.51508 0.58164 Mdot
0 0 0 setrgbcolor
0.0107 setlinewidth
0.56983 0.53406 Mdot
0 0 0 setrgbcolor
0.01501 setlinewidth
0.52269 0.58124 Mdot
0 0 0 setrgbcolor
0.0167 setlinewidth
0.54501 0.49513 Mdot
0 0 0 setrgbcolor
0.01159 setlinewidth
0.5272 0.58088 Mdot
0 0 0 setrgbcolor
0.00739 setlinewidth
0.52271 0.58086 Mdot
0 0 0 setrgbcolor
0.01962 setlinewidth
0.52497 0.58072 Mdot
0 0 0 setrgbcolor
0.00696 setlinewidth
0.55146 0.57045 Mdot
0 0 0 setrgbcolor
0.00842 setlinewidth
0.47899 0.54441 Mdot
0 0 0 setrgbcolor
0.01388 setlinewidth
0.56544 0.55008 Mdot
0 0 0 setrgbcolor
0.00883 setlinewidth
0.51424 0.57878 Mdot
0 0 0 setrgbcolor
0.01799 setlinewidth
0.53154 0.49292 Mdot
0 0 0 setrgbcolor
0.0104 setlinewidth
0.54297 0.49701 Mdot
0 0 0 setrgbcolor
0.01544 setlinewidth
0.51545 0.57767 Mdot
0 0 0 setrgbcolor
0.00741 setlinewidth
0.5069 0.49576 Mdot
0 0 0 setrgbcolor
0.01191 setlinewidth
0.48322 0.52307 Mdot
0 0 0 setrgbcolor
0.0156 setlinewidth
0.51262 0.49505 Mdot
0 0 0 setrgbcolor
0.01478 setlinewidth
0.48273 0.5434 Mdot
0 0 0 setrgbcolor
0.0056 setlinewidth
0.49289 0.56321 Mdot
0 0 0 setrgbcolor
0.00619 setlinewidth
0.54903 0.56696 Mdot
0 0 0 setrgbcolor
0.01763 setlinewidth
0.52913 0.57563 Mdot
0 0 0 setrgbcolor
0.01398 setlinewidth
0.51468 0.49642 Mdot
0 0 0 setrgbcolor
0.01372 setlinewidth
0.53726 0.5725 Mdot
0 0 0 setrgbcolor
0.01774 setlinewidth
0.51897 0.57468 Mdot
0 0 0 setrgbcolor
0.00678 setlinewidth
0.54547 0.50289 Mdot
0 0 0 setrgbcolor
0.005 setlinewidth
0.49162 0.5583 Mdot
0 0 0 setrgbcolor
0.0182 setlinewidth
0.54887 0.56439 Mdot
0 0 0 setrgbcolor
0.01565 setlinewidth
0.49375 0.55894 Mdot
0 0 0 setrgbcolor
0.01783 setlinewidth
0.53186 0.57178 Mdot
0 0 0 setrgbcolor
0.01212 setlinewidth
0.5238 0.57251 Mdot
0 0 0 setrgbcolor
0.01872 setlinewidth
0.53593 0.56905 Mdot
0 0 0 setrgbcolor
0.00937 setlinewidth
0.52339 0.4998 Mdot
0 0 0 setrgbcolor
0.0104 setlinewidth
0.49298 0.55332 Mdot
0 0 0 setrgbcolor
0.00854 setlinewidth
0.51744 0.5014 Mdot
0 0 0 setrgbcolor
0.01733 setlinewidth
0.51492 0.50294 Mdot
0 0 0 setrgbcolor
0.01156 setlinewidth
0.54197 0.56208 Mdot
0 0 0 setrgbcolor
0.00829 setlinewidth
0.49725 0.51558 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.52435 0.56742 Mdot
0 0 0 setrgbcolor
0.00996 setlinewidth
0.49628 0.51818 Mdot
0 0 0 setrgbcolor
0.00643 setlinewidth
0.51861 0.56625 Mdot
0 0 0 setrgbcolor
0.00779 setlinewidth
0.49415 0.52711 Mdot
0 0 0 setrgbcolor
0.00554 setlinewidth
0.49333 0.53813 Mdot
0 0 0 setrgbcolor
0.00832 setlinewidth
0.52632 0.51046 Mdot
0 0 0 setrgbcolor
0.01762 setlinewidth
0.53715 0.51544 Mdot
0 0 0 setrgbcolor
0.01224 setlinewidth
0.53875 0.51764 Mdot
0 0 0 setrgbcolor
0.01992 setlinewidth
0.53125 0.55475 Mdot
0 0 0 setrgbcolor
0.01229 setlinewidth
0.52116 0.55452 Mdot
0 0 0 setrgbcolor
0.01581 setlinewidth
0.52969 0.55195 Mdot
0 0 0 setrgbcolor
0.00675 setlinewidth
0.52086 0.51771 Mdot
0 0 0 setrgbcolor
0.00805 setlinewidth
0.51679 0.54875 Mdot
0 0 0 setrgbcolor
0.00612 setlinewidth
0.52481 0.54987 Mdot
0 0 0 setrgbcolor
0.01006 setlinewidth
0.5254 0.54691 Mdot
0 0 0 setrgbcolor
0.01687 setlinewidth
0.52874 0.53104 Mdot
1 1 1 setrgbcolor
0.01962 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.00565 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00642 setlinewidth
0.52077 0.54234 Mdot
0 0 0 setrgbcolor
0.01371 setlinewidth
0.52773 0.52954 Mdot
0 0 0 setrgbcolor
0.00736 setlinewidth
0.51248 0.53581 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.52621 0.55011 Mdot
0 0 0 setrgbcolor
0.01768 setlinewidth
0.52681 0.51721 Mdot
0 0 0 setrgbcolor
0.01314 setlinewidth
0.50421 0.54462 Mdot
0 0 0 setrgbcolor
0.01937 setlinewidth
0.50062 0.53985 Mdot
0 0 0 setrgbcolor
0.01778 setlinewidth
0.53478 0.51551 Mdot
0 0 0 setrgbcolor
0.00678 setlinewidth
0.50141 0.52164 Mdot
0 0 0 setrgbcolor
0.01121 setlinewidth
0.52182 0.50861 Mdot
0 0 0 setrgbcolor
0.01543 setlinewidth
0.53475 0.50997 Mdot
0 0 0 setrgbcolor
0.00804 setlinewidth
0.50696 0.5115 Mdot
0 0 0 setrgbcolor
0.01612 setlinewidth
0.4934 0.53214 Mdot
0 0 0 setrgbcolor
0.00863 setlinewidth
0.49605 0.52211 Mdot
0 0 0 setrgbcolor
0.01069 setlinewidth
0.50147 0.51316 Mdot
0 0 0 setrgbcolor
0.00761 setlinewidth
0.5096 0.50694 Mdot
0 0 0 setrgbcolor
0.0178 setlinewidth
0.54269 0.56053 Mdot
0 0 0 setrgbcolor
0.017 setlinewidth
0.55817 0.53591 Mdot
0 0 0 setrgbcolor
0.00816 setlinewidth
0.54572 0.5083 Mdot
0 0 0 setrgbcolor
0.00749 setlinewidth
0.5586 0.53481 Mdot
0 0 0 setrgbcolor
0.01997 setlinewidth
0.51766 0.49923 Mdot
0 0 0 setrgbcolor
0.0169 setlinewidth
0.53742 0.50144 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.55705 0.5514 Mdot
0 0 0 setrgbcolor
0.01583 setlinewidth
0.54189 0.56788 Mdot
0 0 0 setrgbcolor
0.01997 setlinewidth
0.54072 0.50188 Mdot
0 0 0 setrgbcolor
0.0069 setlinewidth
0.48648 0.54714 Mdot
0 0 0 setrgbcolor
0.00835 setlinewidth
0.48968 0.5156 Mdot
0 0 0 setrgbcolor
0.005 setlinewidth
0.54865 0.50597 Mdot
0 0 0 setrgbcolor
0.01621 setlinewidth
0.53513 0.49756 Mdot
0 0 0 setrgbcolor
0.01204 setlinewidth
0.48297 0.54329 Mdot
0 0 0 setrgbcolor
0.00727 setlinewidth
0.48219 0.53313 Mdot
0 0 0 setrgbcolor
0.011 setlinewidth
0.4956 0.56694 Mdot
0 0 0 setrgbcolor
0.01271 setlinewidth
0.54743 0.50068 Mdot
0 0 0 setrgbcolor
0.01605 setlinewidth
0.5416 0.49702 Mdot
0 0 0 setrgbcolor
0.01393 setlinewidth
0.48082 0.54263 Mdot
0 0 0 setrgbcolor
0.0165 setlinewidth
0.52113 0.49213 Mdot
0 0 0 setrgbcolor
0.01441 setlinewidth
0.52014 0.49183 Mdot
0 0 0 setrgbcolor
0.01564 setlinewidth
0.52303 0.49151 Mdot
0 0 0 setrgbcolor
0.00653 setlinewidth
0.56713 0.5341 Mdot
0 0 0 setrgbcolor
0.01702 setlinewidth
0.4841 0.55619 Mdot
0 0 0 setrgbcolor
0.01291 setlinewidth
0.54788 0.49832 Mdot
0 0 0 setrgbcolor
0.01745 setlinewidth
0.528 0.49076 Mdot
0 0 0 setrgbcolor
0.01184 setlinewidth
0.4787 0.54223 Mdot
0 0 0 setrgbcolor
0.01787 setlinewidth
0.56239 0.55712 Mdot
0 0 0 setrgbcolor
0.01371 setlinewidth
0.51203 0.49168 Mdot
0 0 0 setrgbcolor
0.01826 setlinewidth
0.52165 0.49019 Mdot
0 0 0 setrgbcolor
0.00941 setlinewidth
0.52489 0.48986 Mdot
0 0 0 setrgbcolor
0.01995 setlinewidth
0.56677 0.54891 Mdot
0 0 0 setrgbcolor
0.01975 setlinewidth
0.52095 0.48957 Mdot
0 0 0 setrgbcolor
0.0121 setlinewidth
0.51667 0.48983 Mdot
0 0 0 setrgbcolor
0.0103 setlinewidth
0.52272 0.4893 Mdot
0 0 0 setrgbcolor
0.01177 setlinewidth
0.5129 0.49041 Mdot
0 0 0 setrgbcolor
0.01077 setlinewidth
0.52508 0.48917 Mdot
0 0 0 setrgbcolor
0.0051 setlinewidth
0.52227 0.48887 Mdot
0 0 0 setrgbcolor
0.01788 setlinewidth
0.51158 0.58039 Mdot
0 0 0 setrgbcolor
0.01244 setlinewidth
0.52699 0.48891 Mdot
0 0 0 setrgbcolor
0.00844 setlinewidth
0.54758 0.49568 Mdot
0 0 0 setrgbcolor
0.01436 setlinewidth
0.55017 0.49737 Mdot
0 0 0 setrgbcolor
0.01531 setlinewidth
0.54762 0.49557 Mdot
0 0 0 setrgbcolor
0.00845 setlinewidth
0.47924 0.51856 Mdot
0 0 0 setrgbcolor
0.01999 setlinewidth
0.50064 0.49407 Mdot
0 0 0 setrgbcolor
0.01066 setlinewidth
0.52713 0.48761 Mdot
0 0 0 setrgbcolor
0.00653 setlinewidth
0.55589 0.50025 Mdot
0 0 0 setrgbcolor
0.01798 setlinewidth
0.54541 0.49271 Mdot
0 0 0 setrgbcolor
0.00727 setlinewidth
0.52333 0.48702 Mdot
0 0 0 setrgbcolor
0.00586 setlinewidth
0.52801 0.58347 Mdot
0 0 0 setrgbcolor
0.01328 setlinewidth
0.56115 0.56539 Mdot
0 0 0 setrgbcolor
0.0105 setlinewidth
0.51699 0.4864 Mdot
0 0 0 setrgbcolor
0.01146 setlinewidth
0.55393 0.5742 Mdot
0 0 0 setrgbcolor
0.01004 setlinewidth
0.56092 0.50317 Mdot
0 0 0 setrgbcolor
0.00975 setlinewidth
0.50231 0.5809 Mdot
0 0 0 setrgbcolor
0.01149 setlinewidth
0.52402 0.48507 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.52578 0.58573 Mdot
0 0 0 setrgbcolor
0.01481 setlinewidth
0.47868 0.5598 Mdot
0 0 0 setrgbcolor
0.00756 setlinewidth
0.51205 0.48535 Mdot
0 0 0 setrgbcolor
0.0173 setlinewidth
0.47835 0.56126 Mdot
0 0 0 setrgbcolor
0.01769 setlinewidth
0.48688 0.49796 Mdot
0 0 0 setrgbcolor
0.01048 setlinewidth
0.53161 0.48366 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.47707 0.56132 Mdot
0 0 0 setrgbcolor
0.00985 setlinewidth
0.56489 0.56809 Mdot
0 0 0 setrgbcolor
0.019 setlinewidth
0.51496 0.48266 Mdot
0 0 0 setrgbcolor
0.01242 setlinewidth
0.51545 0.48183 Mdot
0 0 0 setrgbcolor
0.01231 setlinewidth
0.47174 0.51793 Mdot
0 0 0 setrgbcolor
0.0181 setlinewidth
0.52376 0.48081 Mdot
0 0 0 setrgbcolor
0.01103 setlinewidth
0.53332 0.48114 Mdot
0 0 0 setrgbcolor
0.01197 setlinewidth
0.47928 0.50164 Mdot
0 0 0 setrgbcolor
0.0095 setlinewidth
0.47985 0.50079 Mdot
0 0 0 setrgbcolor
0.01698 setlinewidth
0.5193 0.59087 Mdot
0 0 0 setrgbcolor
0.01632 setlinewidth
0.52317 0.47952 Mdot
0 0 0 setrgbcolor
0.0154 setlinewidth
0.46857 0.54791 Mdot
0 0 0 setrgbcolor
0.01951 setlinewidth
0.53171 0.4795 Mdot
0 0 0 setrgbcolor
0.01777 setlinewidth
0.47572 0.56688 Mdot
0 0 0 setrgbcolor
0.01025 setlinewidth
0.57245 0.50657 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.51759 0.47838 Mdot
0 0 0 setrgbcolor
0.01071 setlinewidth
0.52186 0.47755 Mdot
0 0 0 setrgbcolor
0.01572 setlinewidth
0.55774 0.48879 Mdot
0 0 0 setrgbcolor
0.01125 setlinewidth
0.53005 0.47759 Mdot
0 0 0 setrgbcolor
0.01105 setlinewidth
0.55575 0.58349 Mdot
0 0 0 setrgbcolor
0.01924 setlinewidth
0.55614 0.48736 Mdot
0 0 0 setrgbcolor
0.01901 setlinewidth
0.52708 0.59353 Mdot
0 0 0 setrgbcolor
0.01141 setlinewidth
0.53124 0.47758 Mdot
0 0 0 setrgbcolor
0.01271 setlinewidth
0.48234 0.49365 Mdot
0 0 0 setrgbcolor
0.01602 setlinewidth
0.50295 0.48064 Mdot
0 0 0 setrgbcolor
0.01223 setlinewidth
0.56504 0.57583 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.48644 0.49003 Mdot
0 0 0 setrgbcolor
0.01967 setlinewidth
0.52949 0.47743 Mdot
0 0 0 setrgbcolor
0.00945 setlinewidth
0.54804 0.48272 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.55873 0.4893 Mdot
0 0 0 setrgbcolor
0.01197 setlinewidth
0.48446 0.5787 Mdot
0 0 0 setrgbcolor
0.01378 setlinewidth
0.53697 0.59171 Mdot
0 0 0 setrgbcolor
0.00714 setlinewidth
0.57434 0.56223 Mdot
0 0 0 setrgbcolor
0.00909 setlinewidth
0.5303 0.47797 Mdot
0 0 0 setrgbcolor
0.01247 setlinewidth
0.54017 0.48017 Mdot
0 0 0 setrgbcolor
0.00936 setlinewidth
0.54868 0.58694 Mdot
0 0 0 setrgbcolor
0.01645 setlinewidth
0.51211 0.59183 Mdot
0 0 0 setrgbcolor
0.0183 setlinewidth
0.54927 0.58645 Mdot
0 0 0 setrgbcolor
0.00562 setlinewidth
0.52279 0.59268 Mdot
0 0 0 setrgbcolor
0.01606 setlinewidth
0.56503 0.57436 Mdot
0 0 0 setrgbcolor
0.01026 setlinewidth
0.58011 0.53733 Mdot
0 0 0 setrgbcolor
0.01391 setlinewidth
0.57939 0.52702 Mdot
0 0 0 setrgbcolor
0.01493 setlinewidth
0.57896 0.5443 Mdot
0 0 0 setrgbcolor
0.01725 setlinewidth
0.55273 0.58336 Mdot
0 0 0 setrgbcolor
0.00862 setlinewidth
0.4759 0.56565 Mdot
0 0 0 setrgbcolor
0.00767 setlinewidth
0.47408 0.56247 Mdot
0 0 0 setrgbcolor
0.00767 setlinewidth
0.49132 0.48927 Mdot
0 0 0 setrgbcolor
0.01957 setlinewidth
0.57453 0.55718 Mdot
0 0 0 setrgbcolor
0.00945 setlinewidth
0.5698 0.56547 Mdot
0 0 0 setrgbcolor
0.0084 setlinewidth
0.46769 0.53323 Mdot
0 0 0 setrgbcolor
0.01228 setlinewidth
0.46813 0.52851 Mdot
0 0 0 setrgbcolor
0.01765 setlinewidth
0.56996 0.56449 Mdot
0 0 0 setrgbcolor
0.01476 setlinewidth
0.578 0.53305 Mdot
0 0 0 setrgbcolor
0.01368 setlinewidth
0.53058 0.48114 Mdot
0 0 0 setrgbcolor
0.01545 setlinewidth
0.49815 0.5839 Mdot
0 0 0 setrgbcolor
0.00956 setlinewidth
0.57022 0.56225 Mdot
0 0 0 setrgbcolor
0.01339 setlinewidth
0.57691 0.53912 Mdot
0 0 0 setrgbcolor
0.00863 setlinewidth
0.50319 0.5852 Mdot
0 0 0 setrgbcolor
0.01732 setlinewidth
0.49097 0.57795 Mdot
0 0 0 setrgbcolor
0.01115 setlinewidth
0.48855 0.57586 Mdot
0 0 0 setrgbcolor
0.00667 setlinewidth
0.47267 0.552 Mdot
0 0 0 setrgbcolor
0.01245 setlinewidth
0.53288 0.58745 Mdot
0 0 0 setrgbcolor
0.01828 setlinewidth
0.53668 0.58628 Mdot
0 0 0 setrgbcolor
0.00877 setlinewidth
0.52806 0.58761 Mdot
0 0 0 setrgbcolor
0.01245 setlinewidth
0.57456 0.52623 Mdot
0 0 0 setrgbcolor
0.00951 setlinewidth
0.53686 0.48637 Mdot
0 0 0 setrgbcolor
0.01829 setlinewidth
0.52513 0.58599 Mdot
0 0 0 setrgbcolor
0.00508 setlinewidth
0.47281 0.52934 Mdot
0 0 0 setrgbcolor
0.01559 setlinewidth
0.5155 0.58514 Mdot
0 0 0 setrgbcolor
0.00844 setlinewidth
0.57163 0.54862 Mdot
0 0 0 setrgbcolor
0.0127 setlinewidth
0.47529 0.55046 Mdot
0 0 0 setrgbcolor
0.01012 setlinewidth
0.52697 0.5848 Mdot
0 0 0 setrgbcolor
0.01178 setlinewidth
0.49282 0.49735 Mdot
0 0 0 setrgbcolor
0.01442 setlinewidth
0.48856 0.56945 Mdot
0 0 0 setrgbcolor
0.00515 setlinewidth
0.52284 0.58362 Mdot
0 0 0 setrgbcolor
0.01516 setlinewidth
0.51341 0.58236 Mdot
0 0 0 setrgbcolor
0.01182 setlinewidth
0.52268 0.58323 Mdot
0 0 0 setrgbcolor
0.00565 setlinewidth
0.52494 0.58276 Mdot
0 0 0 setrgbcolor
0.01312 setlinewidth
0.52732 0.58258 Mdot
0 0 0 setrgbcolor
0.0196 setlinewidth
0.48606 0.56459 Mdot
0 0 0 setrgbcolor
0.00787 setlinewidth
0.54152 0.5785 Mdot
0 0 0 setrgbcolor
0.00694 setlinewidth
0.49824 0.49573 Mdot
0 0 0 setrgbcolor
0.01722 setlinewidth
0.51411 0.58105 Mdot
0 0 0 setrgbcolor
0.01232 setlinewidth
0.48805 0.56495 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.53232 0.49061 Mdot
0 0 0 setrgbcolor
0.01738 setlinewidth
0.55613 0.56672 Mdot
0 0 0 setrgbcolor
0.01872 setlinewidth
0.51753 0.4905 Mdot
0 0 0 setrgbcolor
0.01493 setlinewidth
0.50013 0.49685 Mdot
0 0 0 setrgbcolor
0.00565 setlinewidth
0.48595 0.55927 Mdot
0 0 0 setrgbcolor
0.01724 setlinewidth
0.52979 0.49294 Mdot
0 0 0 setrgbcolor
0.01876 setlinewidth
0.51643 0.57749 Mdot
0 0 0 setrgbcolor
0.01963 setlinewidth
0.55033 0.5681 Mdot
0 0 0 setrgbcolor
0.00777 setlinewidth
0.48409 0.51954 Mdot
0 0 0 setrgbcolor
0.01228 setlinewidth
0.52718 0.57693 Mdot
0 0 0 setrgbcolor
0.00592 setlinewidth
0.56405 0.52728 Mdot
0 0 0 setrgbcolor
0.00632 setlinewidth
0.4834 0.5224 Mdot
0 0 0 setrgbcolor
0.00646 setlinewidth
0.48236 0.532 Mdot
0 0 0 setrgbcolor
0.01083 setlinewidth
0.48319 0.54354 Mdot
0 0 0 setrgbcolor
0.01594 setlinewidth
0.56144 0.54473 Mdot
0 0 0 setrgbcolor
0.01919 setlinewidth
0.50266 0.50167 Mdot
0 0 0 setrgbcolor
0.0071 setlinewidth
0.52053 0.57454 Mdot
0 0 0 setrgbcolor
0.01345 setlinewidth
0.50018 0.50367 Mdot
0 0 0 setrgbcolor
0.00914 setlinewidth
0.50866 0.49906 Mdot
0 0 0 setrgbcolor
0.01513 setlinewidth
0.53478 0.57248 Mdot
0 0 0 setrgbcolor
0.0128 setlinewidth
0.53237 0.49873 Mdot
0 0 0 setrgbcolor
0.00725 setlinewidth
0.52869 0.57257 Mdot
0 0 0 setrgbcolor
0.01063 setlinewidth
0.54621 0.56491 Mdot
0 0 0 setrgbcolor
0.01994 setlinewidth
0.53216 0.56914 Mdot
0 0 0 setrgbcolor
0.01488 setlinewidth
0.51332 0.56888 Mdot
0 0 0 setrgbcolor
0.00539 setlinewidth
0.5452 0.56229 Mdot
0 0 0 setrgbcolor
0.01059 setlinewidth
0.51946 0.56923 Mdot
0 0 0 setrgbcolor
0.01662 setlinewidth
0.53671 0.56101 Mdot
0 0 0 setrgbcolor
0.01903 setlinewidth
0.51183 0.50978 Mdot
0 0 0 setrgbcolor
0.01243 setlinewidth
0.50675 0.51821 Mdot
0 0 0 setrgbcolor
0.01512 setlinewidth
0.51281 0.55641 Mdot
0 0 0 setrgbcolor
0.01087 setlinewidth
0.50718 0.5511 Mdot
0 0 0 setrgbcolor
0.01638 setlinewidth
0.52355 0.51327 Mdot
0 0 0 setrgbcolor
0.01392 setlinewidth
0.52545 0.51531 Mdot
0 0 0 setrgbcolor
0.00628 setlinewidth
0.52327 0.5551 Mdot
0 0 0 setrgbcolor
0.01934 setlinewidth
0.5155 0.55104 Mdot
0 0 0 setrgbcolor
0.01821 setlinewidth
0.521 0.55244 Mdot
0 0 0 setrgbcolor
0.00934 setlinewidth
0.5155 0.54789 Mdot
0 0 0 setrgbcolor
0.01694 setlinewidth
0.5163 0.53088 Mdot
1 1 1 setrgbcolor
0.00565 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.01004 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00722 setlinewidth
0.52404 0.53658 Mdot
0 0 0 setrgbcolor
0.00687 setlinewidth
0.53356 0.54208 Mdot
0 0 0 setrgbcolor
0.00509 setlinewidth
0.51184 0.54264 Mdot
0 0 0 setrgbcolor
0.01494 setlinewidth
0.51638 0.54702 Mdot
0 0 0 setrgbcolor
0.01158 setlinewidth
0.53869 0.52773 Mdot
0 0 0 setrgbcolor
0.01275 setlinewidth
0.50959 0.52369 Mdot
0 0 0 setrgbcolor
0.01572 setlinewidth
0.50262 0.53582 Mdot
0 0 0 setrgbcolor
0.01507 setlinewidth
0.50374 0.52504 Mdot
0 0 0 setrgbcolor
0.01072 setlinewidth
0.53998 0.54935 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.53532 0.51512 Mdot
0 0 0 setrgbcolor
0.01199 setlinewidth
0.51332 0.51235 Mdot
0 0 0 setrgbcolor
0.01338 setlinewidth
0.50774 0.51494 Mdot
0 0 0 setrgbcolor
0.01016 setlinewidth
0.5282 0.50702 Mdot
0 0 0 setrgbcolor
0.0121 setlinewidth
0.51497 0.50724 Mdot
0 0 0 setrgbcolor
0.0113 setlinewidth
0.54283 0.51214 Mdot
0 0 0 setrgbcolor
0.01295 setlinewidth
0.49661 0.55248 Mdot
0 0 0 setrgbcolor
0.0171 setlinewidth
0.49496 0.51938 Mdot
0 0 0 setrgbcolor
0.00879 setlinewidth
0.48965 0.53869 Mdot
0 0 0 setrgbcolor
0.01099 setlinewidth
0.492 0.54907 Mdot
0 0 0 setrgbcolor
0.01029 setlinewidth
0.54144 0.50642 Mdot
0 0 0 setrgbcolor
0.0145 setlinewidth
0.48931 0.54875 Mdot
0 0 0 setrgbcolor
0.0147 setlinewidth
0.5212 0.49804 Mdot
0 0 0 setrgbcolor
0.00643 setlinewidth
0.48662 0.54869 Mdot
0 0 0 setrgbcolor
0.01731 setlinewidth
0.50818 0.57166 Mdot
0 0 0 setrgbcolor
0.01421 setlinewidth
0.49437 0.56229 Mdot
0 0 0 setrgbcolor
0.00677 setlinewidth
0.55683 0.55779 Mdot
0 0 0 setrgbcolor
0.0059 setlinewidth
0.48301 0.52419 Mdot
0 0 0 setrgbcolor
0.01763 setlinewidth
0.5416 0.49723 Mdot
0 0 0 setrgbcolor
0.01311 setlinewidth
0.55139 0.50303 Mdot
0 0 0 setrgbcolor
0.00847 setlinewidth
0.54486 0.49718 Mdot
0 0 0 setrgbcolor
0.01323 setlinewidth
0.53816 0.4936 Mdot
0 0 0 setrgbcolor
0.01412 setlinewidth
0.55627 0.56562 Mdot
0 0 0 setrgbcolor
0.00876 setlinewidth
0.52231 0.49022 Mdot
0 0 0 setrgbcolor
0.01958 setlinewidth
0.52118 0.49008 Mdot
0 0 0 setrgbcolor
0.0148 setlinewidth
0.51257 0.49123 Mdot
0 0 0 setrgbcolor
0.01584 setlinewidth
0.50087 0.49554 Mdot
0 0 0 setrgbcolor
0.01778 setlinewidth
0.56842 0.52983 Mdot
0 0 0 setrgbcolor
0.01524 setlinewidth
0.56862 0.52863 Mdot
0 0 0 setrgbcolor
0.01503 setlinewidth
0.52401 0.48929 Mdot
0 0 0 setrgbcolor
0.00688 setlinewidth
0.55339 0.5002 Mdot
0 0 0 setrgbcolor
0.01384 setlinewidth
0.51299 0.4898 Mdot
0 0 0 setrgbcolor
0.0187 setlinewidth
0.51675 0.4886 Mdot
0 0 0 setrgbcolor
0.0072 setlinewidth
0.52207 0.48817 Mdot
0 0 0 setrgbcolor
0.00881 setlinewidth
0.56925 0.54617 Mdot
0 0 0 setrgbcolor
0.01294 setlinewidth
0.48753 0.56698 Mdot
0 0 0 setrgbcolor
0.01285 setlinewidth
0.5211 0.48764 Mdot
0 0 0 setrgbcolor
0.01979 setlinewidth
0.52869 0.48775 Mdot
0 0 0 setrgbcolor
0.01877 setlinewidth
0.52532 0.58331 Mdot
0 0 0 setrgbcolor
0.0147 setlinewidth
0.52523 0.48731 Mdot
0 0 0 setrgbcolor
0.00814 setlinewidth
0.54406 0.49206 Mdot
0 0 0 setrgbcolor
0.00661 setlinewidth
0.52279 0.48709 Mdot
0 0 0 setrgbcolor
0.01364 setlinewidth
0.52216 0.48673 Mdot
0 0 0 setrgbcolor
0.01697 setlinewidth
0.52513 0.48659 Mdot
0 0 0 setrgbcolor
0.01598 setlinewidth
0.55063 0.49493 Mdot
0 0 0 setrgbcolor
0.01149 setlinewidth
0.48703 0.56857 Mdot
0 0 0 setrgbcolor
0.01393 setlinewidth
0.52692 0.48602 Mdot
0 0 0 setrgbcolor
0.01207 setlinewidth
0.48585 0.50184 Mdot
0 0 0 setrgbcolor
0.00535 setlinewidth
0.48527 0.56886 Mdot
0 0 0 setrgbcolor
0.01952 setlinewidth
0.51488 0.5853 Mdot
0 0 0 setrgbcolor
0.00905 setlinewidth
0.52241 0.48467 Mdot
0 0 0 setrgbcolor
0.01524 setlinewidth
0.55021 0.49245 Mdot
0 0 0 setrgbcolor
0.01211 setlinewidth
0.52649 0.48468 Mdot
0 0 0 setrgbcolor
0.01935 setlinewidth
0.51555 0.48506 Mdot
0 0 0 setrgbcolor
0.01494 setlinewidth
0.47262 0.52489 Mdot
0 0 0 setrgbcolor
0.00551 setlinewidth
0.50971 0.4848 Mdot
0 0 0 setrgbcolor
0.01341 setlinewidth
0.54197 0.58411 Mdot
0 0 0 setrgbcolor
0.01766 setlinewidth
0.54895 0.48978 Mdot
0 0 0 setrgbcolor
0.01203 setlinewidth
0.54895 0.48967 Mdot
0 0 0 setrgbcolor
0.01769 setlinewidth
0.55186 0.49114 Mdot
0 0 0 setrgbcolor
0.00604 setlinewidth
0.52215 0.48259 Mdot
0 0 0 setrgbcolor
0.00518 setlinewidth
0.57557 0.52668 Mdot
0 0 0 setrgbcolor
0.01291 setlinewidth
0.54584 0.48707 Mdot
0 0 0 setrgbcolor
0.0099 setlinewidth
0.57405 0.55144 Mdot
0 0 0 setrgbcolor
0.0133 setlinewidth
0.53935 0.58685 Mdot
0 0 0 setrgbcolor
0.00799 setlinewidth
0.47713 0.50695 Mdot
0 0 0 setrgbcolor
0.01471 setlinewidth
0.47753 0.50598 Mdot
0 0 0 setrgbcolor
0.00885 setlinewidth
0.47296 0.55641 Mdot
0 0 0 setrgbcolor
0.01296 setlinewidth
0.57707 0.54222 Mdot
0 0 0 setrgbcolor
0.00839 setlinewidth
0.55775 0.49326 Mdot
0 0 0 setrgbcolor
0.01804 setlinewidth
0.51136 0.48162 Mdot
0 0 0 setrgbcolor
0.01175 setlinewidth
0.52884 0.47998 Mdot
0 0 0 setrgbcolor
0.01792 setlinewidth
0.57305 0.56032 Mdot
0 0 0 setrgbcolor
0.01128 setlinewidth
0.51136 0.4807 Mdot
0 0 0 setrgbcolor
0.01693 setlinewidth
0.56665 0.57062 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.56282 0.49553 Mdot
0 0 0 setrgbcolor
0.0182 setlinewidth
0.48228 0.575 Mdot
0 0 0 setrgbcolor
0.00903 setlinewidth
0.51938 0.47834 Mdot
0 0 0 setrgbcolor
0.01107 setlinewidth
0.51779 0.47716 Mdot
0 0 0 setrgbcolor
0.01998 setlinewidth
0.52879 0.47718 Mdot
0 0 0 setrgbcolor
0.01116 setlinewidth
0.53108 0.59333 Mdot
0 0 0 setrgbcolor
0.01797 setlinewidth
0.57558 0.56271 Mdot
0 0 0 setrgbcolor
0.0165 setlinewidth
0.52596 0.4758 Mdot
0 0 0 setrgbcolor
0.01259 setlinewidth
0.51078 0.47695 Mdot
0 0 0 setrgbcolor
0.00946 setlinewidth
0.51426 0.47545 Mdot
0 0 0 setrgbcolor
0.01668 setlinewidth
0.47468 0.49852 Mdot
0 0 0 setrgbcolor
0.00732 setlinewidth
0.47815 0.49414 Mdot
0 0 0 setrgbcolor
0.00937 setlinewidth
0.52187 0.47424 Mdot
0 0 0 setrgbcolor
0.01355 setlinewidth
0.49344 0.48182 Mdot
0 0 0 setrgbcolor
0.01373 setlinewidth
0.57123 0.49754 Mdot
0 0 0 setrgbcolor
0.0174 setlinewidth
0.48902 0.58624 Mdot
0 0 0 setrgbcolor
0.01092 setlinewidth
0.53612 0.59521 Mdot
0 0 0 setrgbcolor
0.01381 setlinewidth
0.52222 0.4741 Mdot
0 0 0 setrgbcolor
0.01823 setlinewidth
0.55216 0.48143 Mdot
0 0 0 setrgbcolor
0.00566 setlinewidth
0.56443 0.58046 Mdot
0 0 0 setrgbcolor
0.00786 setlinewidth
0.54968 0.48025 Mdot
0 0 0 setrgbcolor
0.00851 setlinewidth
0.51976 0.47426 Mdot
0 0 0 setrgbcolor
0.01772 setlinewidth
0.47384 0.57116 Mdot
0 0 0 setrgbcolor
0.00794 setlinewidth
0.46257 0.54193 Mdot
0 0 0 setrgbcolor
0.00801 setlinewidth
0.47621 0.57416 Mdot
0 0 0 setrgbcolor
0.01076 setlinewidth
0.46226 0.53699 Mdot
0 0 0 setrgbcolor
0.0187 setlinewidth
0.5394 0.4768 Mdot
0 0 0 setrgbcolor
0.00516 setlinewidth
0.51821 0.59584 Mdot
0 0 0 setrgbcolor
0.01456 setlinewidth
0.51965 0.47476 Mdot
0 0 0 setrgbcolor
0.01067 setlinewidth
0.48003 0.4928 Mdot
0 0 0 setrgbcolor
0.01702 setlinewidth
0.54432 0.59199 Mdot
0 0 0 setrgbcolor
0.01559 setlinewidth
0.55127 0.48195 Mdot
0 0 0 setrgbcolor
0.01821 setlinewidth
0.52993 0.47548 Mdot
0 0 0 setrgbcolor
0.01309 setlinewidth
0.57136 0.57119 Mdot
0 0 0 setrgbcolor
0.01277 setlinewidth
0.52897 0.59517 Mdot
0 0 0 setrgbcolor
0.01831 setlinewidth
0.46919 0.56066 Mdot
0 0 0 setrgbcolor
0.00677 setlinewidth
0.55484 0.58534 Mdot
0 0 0 setrgbcolor
0.00979 setlinewidth
0.50054 0.58985 Mdot
0 0 0 setrgbcolor
0.01136 setlinewidth
0.55515 0.58476 Mdot
0 0 0 setrgbcolor
0.00597 setlinewidth
0.48891 0.58298 Mdot
0 0 0 setrgbcolor
0.01218 setlinewidth
0.49173 0.58479 Mdot
0 0 0 setrgbcolor
0.01668 setlinewidth
0.57775 0.55565 Mdot
0 0 0 setrgbcolor
0.01754 setlinewidth
0.46487 0.53729 Mdot
0 0 0 setrgbcolor
0.00849 setlinewidth
0.50537 0.59049 Mdot
0 0 0 setrgbcolor
0.01174 setlinewidth
0.4704 0.55877 Mdot
0 0 0 setrgbcolor
0.00617 setlinewidth
0.56929 0.56979 Mdot
0 0 0 setrgbcolor
0.01866 setlinewidth
0.51779 0.4782 Mdot
0 0 0 setrgbcolor
0.00946 setlinewidth
0.55727 0.58109 Mdot
0 0 0 setrgbcolor
0.0116 setlinewidth
0.57883 0.52883 Mdot
0 0 0 setrgbcolor
0.01293 setlinewidth
0.57636 0.51818 Mdot
0 0 0 setrgbcolor
0.01851 setlinewidth
0.47946 0.50116 Mdot
0 0 0 setrgbcolor
0.00649 setlinewidth
0.48616 0.57648 Mdot
0 0 0 setrgbcolor
0.01599 setlinewidth
0.57832 0.53632 Mdot
0 0 0 setrgbcolor
0.01688 setlinewidth
0.48248 0.57184 Mdot
0 0 0 setrgbcolor
0.00862 setlinewidth
0.53561 0.58846 Mdot
0 0 0 setrgbcolor
0.01198 setlinewidth
0.53048 0.58936 Mdot
0 0 0 setrgbcolor
0.01249 setlinewidth
0.57521 0.5505 Mdot
0 0 0 setrgbcolor
0.00816 setlinewidth
0.57143 0.5599 Mdot
0 0 0 setrgbcolor
0.00587 setlinewidth
0.53917 0.58669 Mdot
0 0 0 setrgbcolor
0.01009 setlinewidth
0.51649 0.58872 Mdot
0 0 0 setrgbcolor
0.01881 setlinewidth
0.57119 0.55887 Mdot
0 0 0 setrgbcolor
0.01696 setlinewidth
0.48415 0.49867 Mdot
0 0 0 setrgbcolor
0.00629 setlinewidth
0.48419 0.57195 Mdot
0 0 0 setrgbcolor
0.01099 setlinewidth
0.52653 0.58817 Mdot
0 0 0 setrgbcolor
0.018 setlinewidth
0.52324 0.48275 Mdot
0 0 0 setrgbcolor
0.0082 setlinewidth
0.48076 0.56642 Mdot
0 0 0 setrgbcolor
0.0163 setlinewidth
0.57444 0.5248 Mdot
0 0 0 setrgbcolor
0.00756 setlinewidth
0.57057 0.55653 Mdot
0 0 0 setrgbcolor
0.00884 setlinewidth
0.51314 0.58619 Mdot
0 0 0 setrgbcolor
0.00677 setlinewidth
0.48571 0.49958 Mdot
0 0 0 setrgbcolor
0.00724 setlinewidth
0.47234 0.52561 Mdot
0 0 0 setrgbcolor
0.01849 setlinewidth
0.52784 0.58669 Mdot
0 0 0 setrgbcolor
0.0087 setlinewidth
0.47201 0.52868 Mdot
0 0 0 setrgbcolor
0.00648 setlinewidth
0.47224 0.53878 Mdot
0 0 0 setrgbcolor
0.00838 setlinewidth
0.57372 0.53135 Mdot
0 0 0 setrgbcolor
0.01343 setlinewidth
0.52302 0.5861 Mdot
0 0 0 setrgbcolor
0.00866 setlinewidth
0.47481 0.55061 Mdot
0 0 0 setrgbcolor
0.01243 setlinewidth
0.52268 0.58573 Mdot
0 0 0 setrgbcolor
0.00611 setlinewidth
0.51325 0.58476 Mdot
0 0 0 setrgbcolor
0.01215 setlinewidth
0.50246 0.49024 Mdot
0 0 0 setrgbcolor
0.01004 setlinewidth
0.52477 0.58491 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.52717 0.58437 Mdot
0 0 0 setrgbcolor
0.01284 setlinewidth
0.56853 0.51831 Mdot
0 0 0 setrgbcolor
0.0139 setlinewidth
0.51764 0.488 Mdot
0 0 0 setrgbcolor
0.01251 setlinewidth
0.48556 0.50672 Mdot
0 0 0 setrgbcolor
0.00833 setlinewidth
0.48782 0.50425 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.51408 0.58079 Mdot
0 0 0 setrgbcolor
0.00877 setlinewidth
0.54089 0.57803 Mdot
0 0 0 setrgbcolor
0.00848 setlinewidth
0.49342 0.50061 Mdot
0 0 0 setrgbcolor
0.00602 setlinewidth
0.56821 0.5422 Mdot
0 0 0 setrgbcolor
0.01008 setlinewidth
0.51475 0.49088 Mdot
0 0 0 setrgbcolor
0.00625 setlinewidth
0.52475 0.57863 Mdot
0 0 0 setrgbcolor
0.01468 setlinewidth
0.5171 0.57718 Mdot
0 0 0 setrgbcolor
0.01372 setlinewidth
0.55366 0.56357 Mdot
0 0 0 setrgbcolor
0.01561 setlinewidth
0.50814 0.57243 Mdot
0 0 0 setrgbcolor
0.01563 setlinewidth
0.51722 0.49656 Mdot
0 0 0 setrgbcolor
0.01128 setlinewidth
0.54721 0.56594 Mdot
0 0 0 setrgbcolor
0.00896 setlinewidth
0.52481 0.57393 Mdot
0 0 0 setrgbcolor
0.00918 setlinewidth
0.53124 0.5729 Mdot
0 0 0 setrgbcolor
0.01061 setlinewidth
0.51431 0.57188 Mdot
0 0 0 setrgbcolor
0.00521 setlinewidth
0.49663 0.51136 Mdot
0 0 0 setrgbcolor
0.01003 setlinewidth
0.52737 0.56987 Mdot
0 0 0 setrgbcolor
0.00975 setlinewidth
0.55478 0.52127 Mdot
0 0 0 setrgbcolor
0.0143 setlinewidth
0.49233 0.52093 Mdot
0 0 0 setrgbcolor
0.01297 setlinewidth
0.54149 0.56332 Mdot
0 0 0 setrgbcolor
0.00818 setlinewidth
0.49769 0.555 Mdot
0 0 0 setrgbcolor
0.01162 setlinewidth
0.55433 0.53992 Mdot
0 0 0 setrgbcolor
0.01837 setlinewidth
0.50431 0.55965 Mdot
0 0 0 setrgbcolor
0.00563 setlinewidth
0.53961 0.56078 Mdot
0 0 0 setrgbcolor
0.00601 setlinewidth
0.50848 0.5132 Mdot
0 0 0 setrgbcolor
0.0169 setlinewidth
0.52994 0.56079 Mdot
0 0 0 setrgbcolor
0.0196 setlinewidth
0.50575 0.55371 Mdot
0 0 0 setrgbcolor
0.00747 setlinewidth
0.51057 0.51503 Mdot
0 0 0 setrgbcolor
0.0179 setlinewidth
0.5051 0.55045 Mdot
0 0 0 setrgbcolor
0.01037 setlinewidth
0.51443 0.55674 Mdot
0 0 0 setrgbcolor
0.00879 setlinewidth
0.51154 0.55433 Mdot
0 0 0 setrgbcolor
0.0164 setlinewidth
0.50302 0.53268 Mdot
1 1 1 setrgbcolor
0.01004 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.00877 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01938 setlinewidth
0.5249 0.54373 Mdot
0 0 0 setrgbcolor
0.00819 setlinewidth
0.51407 0.5381 Mdot
0 0 0 setrgbcolor
0.00591 setlinewidth
0.51947 0.52445 Mdot
0 0 0 setrgbcolor
0.01259 setlinewidth
0.51345 0.52677 Mdot
0 0 0 setrgbcolor
0.0158 setlinewidth
0.53668 0.53556 Mdot
0 0 0 setrgbcolor
0.00782 setlinewidth
0.53018 0.54758 Mdot
0 0 0 setrgbcolor
0.01111 setlinewidth
0.51564 0.51573 Mdot
0 0 0 setrgbcolor
0.01541 setlinewidth
0.52096 0.51217 Mdot
0 0 0 setrgbcolor
0.00878 setlinewidth
0.50261 0.52235 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.54697 0.53983 Mdot
0 0 0 setrgbcolor
0.00733 setlinewidth
0.50003 0.54315 Mdot
0 0 0 setrgbcolor
0.01218 setlinewidth
0.50944 0.55635 Mdot
0 0 0 setrgbcolor
0.0185 setlinewidth
0.50394 0.55354 Mdot
0 0 0 setrgbcolor
0.01357 setlinewidth
0.5214 0.50665 Mdot
0 0 0 setrgbcolor
0.01268 setlinewidth
0.50081 0.55364 Mdot
0 0 0 setrgbcolor
0.01989 setlinewidth
0.54973 0.52415 Mdot
0 0 0 setrgbcolor
0.0052 setlinewidth
0.49769 0.55402 Mdot
0 0 0 setrgbcolor
0.01094 setlinewidth
0.54388 0.5116 Mdot
0 0 0 setrgbcolor
0.00521 setlinewidth
0.55405 0.54645 Mdot
0 0 0 setrgbcolor
0.01932 setlinewidth
0.53487 0.50434 Mdot
0 0 0 setrgbcolor
0.00808 setlinewidth
0.4898 0.52927 Mdot
0 0 0 setrgbcolor
0.01291 setlinewidth
0.5075 0.56693 Mdot
0 0 0 setrgbcolor
0.00773 setlinewidth
0.55038 0.50738 Mdot
0 0 0 setrgbcolor
0.01701 setlinewidth
0.52523 0.49621 Mdot
0 0 0 setrgbcolor
0.00627 setlinewidth
0.52296 0.57457 Mdot
0 0 0 setrgbcolor
0.00975 setlinewidth
0.54759 0.50169 Mdot
0 0 0 setrgbcolor
0.01934 setlinewidth
0.50262 0.49693 Mdot
0 0 0 setrgbcolor
0.00717 setlinewidth
0.49956 0.57294 Mdot
0 0 0 setrgbcolor
0.01228 setlinewidth
0.51387 0.49062 Mdot
0 0 0 setrgbcolor
0.00777 setlinewidth
0.49891 0.57469 Mdot
0 0 0 setrgbcolor
0.0149 setlinewidth
0.47696 0.53177 Mdot
0 0 0 setrgbcolor
0.00689 setlinewidth
0.48722 0.50588 Mdot
0 0 0 setrgbcolor
0.01497 setlinewidth
0.51377 0.48909 Mdot
0 0 0 setrgbcolor
0.00838 setlinewidth
0.52245 0.48807 Mdot
0 0 0 setrgbcolor
0.01873 setlinewidth
0.52366 0.48803 Mdot
0 0 0 setrgbcolor
0.01596 setlinewidth
0.49673 0.57529 Mdot
0 0 0 setrgbcolor
0.01407 setlinewidth
0.54497 0.49222 Mdot
0 0 0 setrgbcolor
0.0178 setlinewidth
0.51726 0.48726 Mdot
0 0 0 setrgbcolor
0.01592 setlinewidth
0.52502 0.48681 Mdot
0 0 0 setrgbcolor
0.01683 setlinewidth
0.5226 0.48597 Mdot
0 0 0 setrgbcolor
0.01951 setlinewidth
0.54048 0.48902 Mdot
0 0 0 setrgbcolor
0.00837 setlinewidth
0.52139 0.48559 Mdot
0 0 0 setrgbcolor
0.0067 setlinewidth
0.54797 0.49167 Mdot
0 0 0 setrgbcolor
0.01477 setlinewidth
0.57025 0.55285 Mdot
0 0 0 setrgbcolor
0.00871 setlinewidth
0.52289 0.48477 Mdot
0 0 0 setrgbcolor
0.013 setlinewidth
0.55575 0.4967 Mdot
0 0 0 setrgbcolor
0.01795 setlinewidth
0.47788 0.51262 Mdot
0 0 0 setrgbcolor
0.00788 setlinewidth
0.52545 0.4846 Mdot
0 0 0 setrgbcolor
0.01497 setlinewidth
0.52209 0.4845 Mdot
0 0 0 setrgbcolor
0.00828 setlinewidth
0.47807 0.51155 Mdot
0 0 0 setrgbcolor
0.01686 setlinewidth
0.48107 0.56435 Mdot
0 0 0 setrgbcolor
0.00919 setlinewidth
0.52908 0.4845 Mdot
0 0 0 setrgbcolor
0.00913 setlinewidth
0.52504 0.48388 Mdot
0 0 0 setrgbcolor
0.01793 setlinewidth
0.54031 0.58426 Mdot
0 0 0 setrgbcolor
0.01937 setlinewidth
0.51448 0.48386 Mdot
0 0 0 setrgbcolor
0.01777 setlinewidth
0.52659 0.48302 Mdot
0 0 0 setrgbcolor
0.01535 setlinewidth
0.52924 0.58793 Mdot
0 0 0 setrgbcolor
0.01436 setlinewidth
0.50805 0.48455 Mdot
0 0 0 setrgbcolor
0.01994 setlinewidth
0.52144 0.48236 Mdot
0 0 0 setrgbcolor
0.00993 setlinewidth
0.56998 0.56116 Mdot
0 0 0 setrgbcolor
0.00995 setlinewidth
0.55658 0.4935 Mdot
0 0 0 setrgbcolor
0.0131 setlinewidth
0.54537 0.48654 Mdot
0 0 0 setrgbcolor
0.00829 setlinewidth
0.52555 0.48172 Mdot
0 0 0 setrgbcolor
0.01417 setlinewidth
0.52017 0.48029 Mdot
0 0 0 setrgbcolor
0.00633 setlinewidth
0.5523 0.4885 Mdot
0 0 0 setrgbcolor
0.0108 setlinewidth
0.57675 0.52199 Mdot
0 0 0 setrgbcolor
0.01802 setlinewidth
0.57668 0.52071 Mdot
0 0 0 setrgbcolor
0.00817 setlinewidth
0.49215 0.58227 Mdot
0 0 0 setrgbcolor
0.0134 setlinewidth
0.5082 0.48106 Mdot
0 0 0 setrgbcolor
0.01335 setlinewidth
0.55095 0.48602 Mdot
0 0 0 setrgbcolor
0.00568 setlinewidth
0.5797 0.53895 Mdot
0 0 0 setrgbcolor
0.01803 setlinewidth
0.50766 0.48014 Mdot
0 0 0 setrgbcolor
0.00639 setlinewidth
0.55615 0.58272 Mdot
0 0 0 setrgbcolor
0.01295 setlinewidth
0.54871 0.48349 Mdot
0 0 0 setrgbcolor
0.01489 setlinewidth
0.54866 0.48338 Mdot
0 0 0 setrgbcolor
0.01709 setlinewidth
0.54477 0.48119 Mdot
0 0 0 setrgbcolor
0.01655 setlinewidth
0.55177 0.48444 Mdot
0 0 0 setrgbcolor
0.01575 setlinewidth
0.5254 0.4766 Mdot
0 0 0 setrgbcolor
0.0103 setlinewidth
0.55326 0.58601 Mdot
0 0 0 setrgbcolor
0.00937 setlinewidth
0.51481 0.47646 Mdot
0 0 0 setrgbcolor
0.01003 setlinewidth
0.55745 0.48576 Mdot
0 0 0 setrgbcolor
0.01655 setlinewidth
0.51224 0.47554 Mdot
0 0 0 setrgbcolor
0.01943 setlinewidth
0.58142 0.51776 Mdot
0 0 0 setrgbcolor
0.01863 setlinewidth
0.5836 0.54384 Mdot
0 0 0 setrgbcolor
0.01735 setlinewidth
0.52341 0.47381 Mdot
0 0 0 setrgbcolor
0.01754 setlinewidth
0.46961 0.50461 Mdot
0 0 0 setrgbcolor
0.01151 setlinewidth
0.50413 0.47651 Mdot
0 0 0 setrgbcolor
0.01135 setlinewidth
0.5849 0.53378 Mdot
0 0 0 setrgbcolor
0.00668 setlinewidth
0.56223 0.48738 Mdot
0 0 0 setrgbcolor
0.00528 setlinewidth
0.47216 0.49957 Mdot
0 0 0 setrgbcolor
0.01683 setlinewidth
0.54354 0.59416 Mdot
0 0 0 setrgbcolor
0.00536 setlinewidth
0.57786 0.56507 Mdot
0 0 0 setrgbcolor
0.01652 setlinewidth
0.58294 0.55334 Mdot
0 0 0 setrgbcolor
0.00984 setlinewidth
0.51943 0.47289 Mdot
0 0 0 setrgbcolor
0.01106 setlinewidth
0.5065 0.47447 Mdot
0 0 0 setrgbcolor
0.01983 setlinewidth
0.48506 0.48447 Mdot
0 0 0 setrgbcolor
0.00933 setlinewidth
0.4963 0.59325 Mdot
0 0 0 setrgbcolor
0.01521 setlinewidth
0.46108 0.55151 Mdot
0 0 0 setrgbcolor
0.01354 setlinewidth
0.51293 0.47207 Mdot
0 0 0 setrgbcolor
0.01095 setlinewidth
0.45997 0.54646 Mdot
0 0 0 setrgbcolor
0.01464 setlinewidth
0.58394 0.5556 Mdot
0 0 0 setrgbcolor
0.00616 setlinewidth
0.4769 0.58002 Mdot
0 0 0 setrgbcolor
0.00567 setlinewidth
0.47969 0.58278 Mdot
0 0 0 setrgbcolor
0.01188 setlinewidth
0.51234 0.47194 Mdot
0 0 0 setrgbcolor
0.00612 setlinewidth
0.47064 0.49811 Mdot
0 0 0 setrgbcolor
0.01332 setlinewidth
0.50928 0.47254 Mdot
0 0 0 setrgbcolor
0.01049 setlinewidth
0.54524 0.59565 Mdot
0 0 0 setrgbcolor
0.01125 setlinewidth
0.46901 0.56999 Mdot
0 0 0 setrgbcolor
0.00801 setlinewidth
0.54397 0.47476 Mdot
0 0 0 setrgbcolor
0.01875 setlinewidth
0.50814 0.47316 Mdot
0 0 0 setrgbcolor
0.01126 setlinewidth
0.56658 0.48846 Mdot
0 0 0 setrgbcolor
0.01228 setlinewidth
0.46015 0.54657 Mdot
0 0 0 setrgbcolor
0.0082 setlinewidth
0.54068 0.47397 Mdot
0 0 0 setrgbcolor
0.01986 setlinewidth
0.52527 0.59909 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.5287 0.47209 Mdot
0 0 0 setrgbcolor
0.00923 setlinewidth
0.46862 0.56795 Mdot
0 0 0 setrgbcolor
0.01251 setlinewidth
0.4916 0.59021 Mdot
0 0 0 setrgbcolor
0.00655 setlinewidth
0.51814 0.47229 Mdot
0 0 0 setrgbcolor
0.01992 setlinewidth
0.57129 0.57613 Mdot
0 0 0 setrgbcolor
0.01787 setlinewidth
0.49467 0.59167 Mdot
0 0 0 setrgbcolor
0.00699 setlinewidth
0.50468 0.5956 Mdot
0 0 0 setrgbcolor
0.0165 setlinewidth
0.53541 0.59687 Mdot
0 0 0 setrgbcolor
0.01845 setlinewidth
0.55104 0.59125 Mdot
0 0 0 setrgbcolor
0.01257 setlinewidth
0.54104 0.47559 Mdot
0 0 0 setrgbcolor
0.01875 setlinewidth
0.46784 0.5071 Mdot
0 0 0 setrgbcolor
0.01133 setlinewidth
0.50897 0.59561 Mdot
0 0 0 setrgbcolor
0.0075 setlinewidth
0.50405 0.47721 Mdot
0 0 0 setrgbcolor
0.0161 setlinewidth
0.48602 0.58402 Mdot
0 0 0 setrgbcolor
0.01656 setlinewidth
0.48131 0.57979 Mdot
0 0 0 setrgbcolor
0.01896 setlinewidth
0.47139 0.50385 Mdot
0 0 0 setrgbcolor
0.01188 setlinewidth
0.57512 0.56554 Mdot
0 0 0 setrgbcolor
0.00828 setlinewidth
0.46297 0.53358 Mdot
0 0 0 setrgbcolor
0.00837 setlinewidth
0.46305 0.5368 Mdot
0 0 0 setrgbcolor
0.01415 setlinewidth
0.48258 0.57969 Mdot
0 0 0 setrgbcolor
0.00704 setlinewidth
0.55952 0.58286 Mdot
0 0 0 setrgbcolor
0.01294 setlinewidth
0.47796 0.5745 Mdot
0 0 0 setrgbcolor
0.01233 setlinewidth
0.46464 0.54722 Mdot
0 0 0 setrgbcolor
0.01366 setlinewidth
0.55951 0.58222 Mdot
0 0 0 setrgbcolor
0.01318 setlinewidth
0.47249 0.50459 Mdot
0 0 0 setrgbcolor
0.01483 setlinewidth
0.46893 0.55907 Mdot
0 0 0 setrgbcolor
0.01828 setlinewidth
0.51802 0.59229 Mdot
0 0 0 setrgbcolor
0.01587 setlinewidth
0.56 0.57817 Mdot
0 0 0 setrgbcolor
0.01799 setlinewidth
0.53267 0.59086 Mdot
0 0 0 setrgbcolor
0.01061 setlinewidth
0.57782 0.54845 Mdot
0 0 0 setrgbcolor
0.00963 setlinewidth
0.50819 0.48121 Mdot
0 0 0 setrgbcolor
0.01137 setlinewidth
0.47211 0.5121 Mdot
0 0 0 setrgbcolor
0.01747 setlinewidth
0.57089 0.56454 Mdot
0 0 0 setrgbcolor
0.01541 setlinewidth
0.48732 0.49234 Mdot
0 0 0 setrgbcolor
0.00771 setlinewidth
0.53778 0.58917 Mdot
0 0 0 setrgbcolor
0.01185 setlinewidth
0.51353 0.59021 Mdot
0 0 0 setrgbcolor
0.01573 setlinewidth
0.47397 0.5092 Mdot
0 0 0 setrgbcolor
0.006 setlinewidth
0.52785 0.59025 Mdot
0 0 0 setrgbcolor
0.00729 setlinewidth
0.54084 0.58682 Mdot
0 0 0 setrgbcolor
0.00826 setlinewidth
0.51296 0.58874 Mdot
0 0 0 setrgbcolor
0.01339 setlinewidth
0.47875 0.50458 Mdot
0 0 0 setrgbcolor
0.01251 setlinewidth
0.52848 0.58856 Mdot
0 0 0 setrgbcolor
0.00537 setlinewidth
0.52322 0.58868 Mdot
0 0 0 setrgbcolor
0.00679 setlinewidth
0.52271 0.58835 Mdot
0 0 0 setrgbcolor
0.01 setlinewidth
0.5693 0.5096 Mdot
0 0 0 setrgbcolor
0.01847 setlinewidth
0.57357 0.52034 Mdot
0 0 0 setrgbcolor
0.01822 setlinewidth
0.50182 0.48766 Mdot
0 0 0 setrgbcolor
0.00877 setlinewidth
0.52448 0.58721 Mdot
0 0 0 setrgbcolor
0.01813 setlinewidth
0.57379 0.52827 Mdot
0 0 0 setrgbcolor
0.01074 setlinewidth
0.52672 0.5863 Mdot
0 0 0 setrgbcolor
0.01488 setlinewidth
0.49874 0.49114 Mdot
0 0 0 setrgbcolor
0.01071 setlinewidth
0.5121 0.58458 Mdot
0 0 0 setrgbcolor
0.01631 setlinewidth
0.56993 0.554 Mdot
0 0 0 setrgbcolor
0.01834 setlinewidth
0.57239 0.54361 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.56926 0.55298 Mdot
0 0 0 setrgbcolor
0.00799 setlinewidth
0.56693 0.51692 Mdot
0 0 0 setrgbcolor
0.01669 setlinewidth
0.56772 0.55067 Mdot
0 0 0 setrgbcolor
0.00679 setlinewidth
0.51372 0.58045 Mdot
0 0 0 setrgbcolor
0.00557 setlinewidth
0.50346 0.57688 Mdot
0 0 0 setrgbcolor
0.01674 setlinewidth
0.48175 0.51534 Mdot
0 0 0 setrgbcolor
0.01686 setlinewidth
0.52194 0.5808 Mdot
0 0 0 setrgbcolor
0.00809 setlinewidth
0.47862 0.52594 Mdot
0 0 0 setrgbcolor
0.0098 setlinewidth
0.53897 0.57771 Mdot
0 0 0 setrgbcolor
0.01441 setlinewidth
0.56666 0.52392 Mdot
0 0 0 setrgbcolor
0.01689 setlinewidth
0.50091 0.49674 Mdot
0 0 0 setrgbcolor
0.01368 setlinewidth
0.55865 0.51116 Mdot
0 0 0 setrgbcolor
0.0181 setlinewidth
0.50923 0.57542 Mdot
0 0 0 setrgbcolor
0.01653 setlinewidth
0.48899 0.56045 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.52039 0.57597 Mdot
0 0 0 setrgbcolor
0.01497 setlinewidth
0.49623 0.5643 Mdot
0 0 0 setrgbcolor
0.01972 setlinewidth
0.52675 0.57394 Mdot
0 0 0 setrgbcolor
0.01864 setlinewidth
0.5613 0.53621 Mdot
0 0 0 setrgbcolor
0.00996 setlinewidth
0.5488 0.5608 Mdot
0 0 0 setrgbcolor
0.01395 setlinewidth
0.49288 0.51549 Mdot
0 0 0 setrgbcolor
0.01216 setlinewidth
0.52177 0.57141 Mdot
0 0 0 setrgbcolor
0.01295 setlinewidth
0.49619 0.55796 Mdot
0 0 0 setrgbcolor
0.0187 setlinewidth
0.54208 0.56428 Mdot
0 0 0 setrgbcolor
0.00938 setlinewidth
0.49488 0.55468 Mdot
0 0 0 setrgbcolor
0.01562 setlinewidth
0.49503 0.51709 Mdot
0 0 0 setrgbcolor
0.01535 setlinewidth
0.48979 0.53658 Mdot
0 0 0 setrgbcolor
0.01438 setlinewidth
0.50189 0.55775 Mdot
0 0 0 setrgbcolor
0.00634 setlinewidth
0.50527 0.55981 Mdot
0 0 0 setrgbcolor
0.019 setlinewidth
0.53498 0.56248 Mdot
0 0 0 setrgbcolor
0.01184 setlinewidth
0.54226 0.5166 Mdot
0 0 0 setrgbcolor
0.01264 setlinewidth
0.53228 0.56015 Mdot
0 0 0 setrgbcolor
0.01331 setlinewidth
0.52197 0.56165 Mdot
0 0 0 setrgbcolor
0.0181 setlinewidth
0.54426 0.53615 Mdot
1 1 1 setrgbcolor
0.00877 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.01382 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.52723 0.53863 Mdot
0 0 0 setrgbcolor
0.01456 setlinewidth
0.52474 0.52699 Mdot
0 0 0 setrgbcolor
0.00501 setlinewidth
0.53056 0.52365 Mdot
0 0 0 setrgbcolor
0.01568 setlinewidth
0.51291 0.54606 Mdot
0 0 0 setrgbcolor
0.01814 setlinewidth
0.51235 0.52414 Mdot
0 0 0 setrgbcolor
0.01512 setlinewidth
0.53914 0.54281 Mdot
0 0 0 setrgbcolor
0.00986 setlinewidth
0.5248 0.51523 Mdot
0 0 0 setrgbcolor
0.0116 setlinewidth
0.51827 0.55625 Mdot
0 0 0 setrgbcolor
0.0058 setlinewidth
0.51488 0.55684 Mdot
0 0 0 setrgbcolor
0.01592 setlinewidth
0.52442 0.55831 Mdot
0 0 0 setrgbcolor
0.01764 setlinewidth
0.49942 0.53334 Mdot
0 0 0 setrgbcolor
0.00592 setlinewidth
0.5449 0.54602 Mdot
0 0 0 setrgbcolor
0.00886 setlinewidth
0.51147 0.55772 Mdot
0 0 0 setrgbcolor
0.00674 setlinewidth
0.52949 0.51073 Mdot
0 0 0 setrgbcolor
0.01179 setlinewidth
0.54971 0.53254 Mdot
0 0 0 setrgbcolor
0.01042 setlinewidth
0.52859 0.50497 Mdot
0 0 0 setrgbcolor
0.01348 setlinewidth
0.52293 0.56966 Mdot
0 0 0 setrgbcolor
0.0055 setlinewidth
0.56018 0.53544 Mdot
0 0 0 setrgbcolor
0.01068 setlinewidth
0.48475 0.53804 Mdot
0 0 0 setrgbcolor
0.01139 setlinewidth
0.54144 0.5005 Mdot
0 0 0 setrgbcolor
0.00882 setlinewidth
0.56016 0.51873 Mdot
0 0 0 setrgbcolor
0.01632 setlinewidth
0.55195 0.50661 Mdot
0 0 0 setrgbcolor
0.00994 setlinewidth
0.49112 0.50971 Mdot
0 0 0 setrgbcolor
0.01268 setlinewidth
0.50591 0.498 Mdot
0 0 0 setrgbcolor
0.00766 setlinewidth
0.52951 0.49364 Mdot
0 0 0 setrgbcolor
0.01615 setlinewidth
0.51428 0.57719 Mdot
0 0 0 setrgbcolor
0.01559 setlinewidth
0.53922 0.57532 Mdot
0 0 0 setrgbcolor
0.00831 setlinewidth
0.48172 0.51819 Mdot
0 0 0 setrgbcolor
0.01422 setlinewidth
0.51351 0.57913 Mdot
0 0 0 setrgbcolor
0.01219 setlinewidth
0.56756 0.54131 Mdot
0 0 0 setrgbcolor
0.01828 setlinewidth
0.48166 0.51707 Mdot
0 0 0 setrgbcolor
0.01125 setlinewidth
0.51591 0.48973 Mdot
0 0 0 setrgbcolor
0.01944 setlinewidth
0.51102 0.5801 Mdot
0 0 0 setrgbcolor
0.01129 setlinewidth
0.49271 0.57117 Mdot
0 0 0 setrgbcolor
0.01866 setlinewidth
0.51525 0.48818 Mdot
0 0 0 setrgbcolor
0.0139 setlinewidth
0.55691 0.50128 Mdot
0 0 0 setrgbcolor
0.01001 setlinewidth
0.55274 0.49583 Mdot
0 0 0 setrgbcolor
0.00897 setlinewidth
0.52388 0.48575 Mdot
0 0 0 setrgbcolor
0.01896 setlinewidth
0.51822 0.48575 Mdot
0 0 0 setrgbcolor
0.0148 setlinewidth
0.5251 0.48552 Mdot
0 0 0 setrgbcolor
0.0121 setlinewidth
0.52601 0.48406 Mdot
0 0 0 setrgbcolor
0.01224 setlinewidth
0.52322 0.48358 Mdot
0 0 0 setrgbcolor
0.01493 setlinewidth
0.52183 0.48339 Mdot
0 0 0 setrgbcolor
0.0148 setlinewidth
0.52302 0.48231 Mdot
0 0 0 setrgbcolor
0.00538 setlinewidth
0.52209 0.48216 Mdot
0 0 0 setrgbcolor
0.01666 setlinewidth
0.50724 0.48449 Mdot
0 0 0 setrgbcolor
0.01754 setlinewidth
0.51388 0.48274 Mdot
0 0 0 setrgbcolor
0.00925 setlinewidth
0.52554 0.48174 Mdot
0 0 0 setrgbcolor
0.01558 setlinewidth
0.52481 0.48106 Mdot
0 0 0 setrgbcolor
0.00867 setlinewidth
0.54722 0.48649 Mdot
0 0 0 setrgbcolor
0.01635 setlinewidth
0.52911 0.48106 Mdot
0 0 0 setrgbcolor
0.01449 setlinewidth
0.54186 0.4839 Mdot
0 0 0 setrgbcolor
0.00879 setlinewidth
0.52048 0.4801 Mdot
0 0 0 setrgbcolor
0.01812 setlinewidth
0.52598 0.47994 Mdot
0 0 0 setrgbcolor
0.00722 setlinewidth
0.505 0.5882 Mdot
0 0 0 setrgbcolor
0.01356 setlinewidth
0.54972 0.48548 Mdot
0 0 0 setrgbcolor
0.01511 setlinewidth
0.52435 0.47879 Mdot
0 0 0 setrgbcolor
0.01441 setlinewidth
0.50573 0.48093 Mdot
0 0 0 setrgbcolor
0.00956 setlinewidth
0.51818 0.4782 Mdot
0 0 0 setrgbcolor
0.01208 setlinewidth
0.54466 0.58851 Mdot
0 0 0 setrgbcolor
0.01672 setlinewidth
0.55572 0.58302 Mdot
0 0 0 setrgbcolor
0.01039 setlinewidth
0.55836 0.48949 Mdot
0 0 0 setrgbcolor
0.01058 setlinewidth
0.50465 0.48009 Mdot
0 0 0 setrgbcolor
0.01106 setlinewidth
0.5453 0.48064 Mdot
0 0 0 setrgbcolor
0.01264 setlinewidth
0.58199 0.54574 Mdot
0 0 0 setrgbcolor
0.00697 setlinewidth
0.55785 0.48608 Mdot
0 0 0 setrgbcolor
0.00686 setlinewidth
0.46768 0.51153 Mdot
0 0 0 setrgbcolor
0.0156 setlinewidth
0.55217 0.48161 Mdot
0 0 0 setrgbcolor
0.00751 setlinewidth
0.51035 0.47521 Mdot
0 0 0 setrgbcolor
0.00768 setlinewidth
0.46907 0.50596 Mdot
0 0 0 setrgbcolor
0.01427 setlinewidth
0.52146 0.47363 Mdot
0 0 0 setrgbcolor
0.01791 setlinewidth
0.58207 0.55452 Mdot
0 0 0 setrgbcolor
0.00749 setlinewidth
0.54987 0.47928 Mdot
0 0 0 setrgbcolor
0.01711 setlinewidth
0.50688 0.47472 Mdot
0 0 0 setrgbcolor
0.00789 setlinewidth
0.54671 0.47704 Mdot
0 0 0 setrgbcolor
0.01087 setlinewidth
0.5466 0.47693 Mdot
0 0 0 setrgbcolor
0.00763 setlinewidth
0.54211 0.47529 Mdot
0 0 0 setrgbcolor
0.01411 setlinewidth
0.49813 0.47706 Mdot
0 0 0 setrgbcolor
0.01942 setlinewidth
0.58239 0.51264 Mdot
0 0 0 setrgbcolor
0.01848 setlinewidth
0.54972 0.47756 Mdot
0 0 0 setrgbcolor
0.01652 setlinewidth
0.58203 0.51133 Mdot
0 0 0 setrgbcolor
0.0183 setlinewidth
0.56965 0.57922 Mdot
0 0 0 setrgbcolor
0.00802 setlinewidth
0.51746 0.47117 Mdot
0 0 0 setrgbcolor
0.01174 setlinewidth
0.56666 0.58312 Mdot
0 0 0 setrgbcolor
0.00576 setlinewidth
0.58752 0.52992 Mdot
0 0 0 setrgbcolor
0.00647 setlinewidth
0.47847 0.48843 Mdot
0 0 0 setrgbcolor
0.01996 setlinewidth
0.46171 0.55639 Mdot
0 0 0 setrgbcolor
0.01141 setlinewidth
0.46361 0.56143 Mdot
0 0 0 setrgbcolor
0.01412 setlinewidth
0.49911 0.47465 Mdot
0 0 0 setrgbcolor
0.01231 setlinewidth
0.51248 0.47091 Mdot
0 0 0 setrgbcolor
0.01946 setlinewidth
0.55477 0.47809 Mdot
0 0 0 setrgbcolor
0.01687 setlinewidth
0.50606 0.59934 Mdot
0 0 0 setrgbcolor
0.0177 setlinewidth
0.48331 0.58858 Mdot
0 0 0 setrgbcolor
0.01829 setlinewidth
0.46395 0.50494 Mdot
0 0 0 setrgbcolor
0.00907 setlinewidth
0.55596 0.59321 Mdot
0 0 0 setrgbcolor
0.01185 setlinewidth
0.4864 0.59104 Mdot
0 0 0 setrgbcolor
0.01822 setlinewidth
0.55889 0.47908 Mdot
0 0 0 setrgbcolor
0.01993 setlinewidth
0.58397 0.50768 Mdot
0 0 0 setrgbcolor
0.00597 setlinewidth
0.5038 0.47124 Mdot
0 0 0 setrgbcolor
0.00612 setlinewidth
0.59015 0.53459 Mdot
0 0 0 setrgbcolor
0.01061 setlinewidth
0.47245 0.57948 Mdot
0 0 0 setrgbcolor
0.01595 setlinewidth
0.45926 0.55667 Mdot
0 0 0 setrgbcolor
0.00538 setlinewidth
0.58943 0.52391 Mdot
0 0 0 setrgbcolor
0.0121 setlinewidth
0.58665 0.55772 Mdot
0 0 0 setrgbcolor
0.00673 setlinewidth
0.5022 0.47126 Mdot
0 0 0 setrgbcolor
0.01692 setlinewidth
0.58992 0.5447 Mdot
0 0 0 setrgbcolor
0.015 setlinewidth
0.49869 0.47241 Mdot
0 0 0 setrgbcolor
0.0124 setlinewidth
0.47034 0.57754 Mdot
0 0 0 setrgbcolor
0.01017 setlinewidth
0.49652 0.47331 Mdot
0 0 0 setrgbcolor
0.00885 setlinewidth
0.45892 0.51491 Mdot
0 0 0 setrgbcolor
0.01725 setlinewidth
0.49667 0.59721 Mdot
0 0 0 setrgbcolor
0.01543 setlinewidth
0.49981 0.59829 Mdot
0 0 0 setrgbcolor
0.01792 setlinewidth
0.58915 0.54707 Mdot
0 0 0 setrgbcolor
0.01954 setlinewidth
0.55386 0.59483 Mdot
0 0 0 setrgbcolor
0.01375 setlinewidth
0.53345 0.46921 Mdot
0 0 0 setrgbcolor
0.00924 setlinewidth
0.5055 0.47089 Mdot
0 0 0 setrgbcolor
0.01537 setlinewidth
0.5329 0.60144 Mdot
0 0 0 setrgbcolor
0.01306 setlinewidth
0.51046 0.60091 Mdot
0 0 0 setrgbcolor
0.0071 setlinewidth
0.51651 0.46896 Mdot
0 0 0 setrgbcolor
0.00901 setlinewidth
0.52951 0.46895 Mdot
0 0 0 setrgbcolor
0.01457 setlinewidth
0.45683 0.54308 Mdot
0 0 0 setrgbcolor
0.01785 setlinewidth
0.46099 0.51108 Mdot
0 0 0 setrgbcolor
0.01373 setlinewidth
0.45735 0.5464 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.46032 0.55694 Mdot
0 0 0 setrgbcolor
0.00866 setlinewidth
0.48284 0.58808 Mdot
0 0 0 setrgbcolor
0.01648 setlinewidth
0.48836 0.59175 Mdot
0 0 0 setrgbcolor
0.0089 setlinewidth
0.4615 0.51172 Mdot
0 0 0 setrgbcolor
0.01586 setlinewidth
0.46617 0.56856 Mdot
0 0 0 setrgbcolor
0.00739 setlinewidth
0.49026 0.47835 Mdot
0 0 0 setrgbcolor
0.01863 setlinewidth
0.55839 0.47988 Mdot
0 0 0 setrgbcolor
0.01011 setlinewidth
0.47793 0.58314 Mdot
0 0 0 setrgbcolor
0.01308 setlinewidth
0.48356 0.58782 Mdot
0 0 0 setrgbcolor
0.01201 setlinewidth
0.51388 0.60036 Mdot
0 0 0 setrgbcolor
0.00895 setlinewidth
0.54169 0.59773 Mdot
0 0 0 setrgbcolor
0.0105 setlinewidth
0.52847 0.4707 Mdot
0 0 0 setrgbcolor
0.0114 setlinewidth
0.46091 0.51963 Mdot
0 0 0 setrgbcolor
0.01117 setlinewidth
0.4622 0.51635 Mdot
0 0 0 setrgbcolor
0.008 setlinewidth
0.5566 0.58958 Mdot
0 0 0 setrgbcolor
0.01231 setlinewidth
0.57566 0.57072 Mdot
0 0 0 setrgbcolor
0.01003 setlinewidth
0.47318 0.49684 Mdot
0 0 0 setrgbcolor
0.00857 setlinewidth
0.46573 0.51088 Mdot
0 0 0 setrgbcolor
0.01857 setlinewidth
0.49265 0.48201 Mdot
0 0 0 setrgbcolor
0.00572 setlinewidth
0.52005 0.59578 Mdot
0 0 0 setrgbcolor
0.01672 setlinewidth
0.5146 0.59433 Mdot
0 0 0 setrgbcolor
0.01536 setlinewidth
0.56226 0.5797 Mdot
0 0 0 setrgbcolor
0.01183 setlinewidth
0.48589 0.48979 Mdot
0 0 0 setrgbcolor
0.01337 setlinewidth
0.56188 0.57906 Mdot
0 0 0 setrgbcolor
0.01479 setlinewidth
0.51334 0.59292 Mdot
0 0 0 setrgbcolor
0.01825 setlinewidth
0.53443 0.59216 Mdot
0 0 0 setrgbcolor
0.01046 setlinewidth
0.57576 0.55925 Mdot
0 0 0 setrgbcolor
0.00665 setlinewidth
0.48282 0.49392 Mdot
0 0 0 setrgbcolor
0.01237 setlinewidth
0.52898 0.59227 Mdot
0 0 0 setrgbcolor
0.01397 setlinewidth
0.53919 0.58965 Mdot
0 0 0 setrgbcolor
0.0193 setlinewidth
0.46665 0.53316 Mdot
0 0 0 setrgbcolor
0.00997 setlinewidth
0.4683 0.5217 Mdot
0 0 0 setrgbcolor
0.01403 setlinewidth
0.52344 0.59137 Mdot
0 0 0 setrgbcolor
0.00608 setlinewidth
0.52276 0.59111 Mdot
0 0 0 setrgbcolor
0.0174 setlinewidth
0.52882 0.59046 Mdot
0 0 0 setrgbcolor
0.01905 setlinewidth
0.51067 0.58881 Mdot
0 0 0 setrgbcolor
0.01539 setlinewidth
0.54148 0.58679 Mdot
0 0 0 setrgbcolor
0.01666 setlinewidth
0.56052 0.57485 Mdot
0 0 0 setrgbcolor
0.01382 setlinewidth
0.52406 0.58969 Mdot
0 0 0 setrgbcolor
0.01014 setlinewidth
0.52598 0.58842 Mdot
0 0 0 setrgbcolor
0.00823 setlinewidth
0.4845 0.49948 Mdot
0 0 0 setrgbcolor
0.01939 setlinewidth
0.49965 0.58218 Mdot
0 0 0 setrgbcolor
0.0141 setlinewidth
0.48178 0.56736 Mdot
0 0 0 setrgbcolor
0.00803 setlinewidth
0.56939 0.55899 Mdot
0 0 0 setrgbcolor
0.01053 setlinewidth
0.57414 0.5411 Mdot
0 0 0 setrgbcolor
0.0162 setlinewidth
0.51063 0.58436 Mdot
0 0 0 setrgbcolor
0.01619 setlinewidth
0.48919 0.5703 Mdot
0 0 0 setrgbcolor
0.01621 setlinewidth
0.55823 0.50194 Mdot
0 0 0 setrgbcolor
0.01582 setlinewidth
0.51892 0.58352 Mdot
0 0 0 setrgbcolor
0.01973 setlinewidth
0.50457 0.57986 Mdot
0 0 0 setrgbcolor
0.0105 setlinewidth
0.47783 0.52027 Mdot
0 0 0 setrgbcolor
0.01434 setlinewidth
0.5642 0.51249 Mdot
0 0 0 setrgbcolor
0.01196 setlinewidth
0.47755 0.54261 Mdot
0 0 0 setrgbcolor
0.01815 setlinewidth
0.48753 0.56378 Mdot
0 0 0 setrgbcolor
0.00715 setlinewidth
0.47988 0.52162 Mdot
0 0 0 setrgbcolor
0.01476 setlinewidth
0.48557 0.56059 Mdot
0 0 0 setrgbcolor
0.01933 setlinewidth
0.56523 0.52077 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.53577 0.57777 Mdot
0 0 0 setrgbcolor
0.01293 setlinewidth
0.5157 0.57879 Mdot
0 0 0 setrgbcolor
0.01528 setlinewidth
0.56504 0.54826 Mdot
0 0 0 setrgbcolor
0.01521 setlinewidth
0.56584 0.53703 Mdot
0 0 0 setrgbcolor
0.01199 setlinewidth
0.56393 0.54732 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.55552 0.51006 Mdot
0 0 0 setrgbcolor
0.01807 setlinewidth
0.49273 0.56275 Mdot
0 0 0 setrgbcolor
0.01943 setlinewidth
0.52154 0.57576 Mdot
0 0 0 setrgbcolor
0.01336 setlinewidth
0.56145 0.54518 Mdot
0 0 0 setrgbcolor
0.01398 setlinewidth
0.4964 0.56438 Mdot
0 0 0 setrgbcolor
0.01756 setlinewidth
0.51568 0.5739 Mdot
0 0 0 setrgbcolor
0.00574 setlinewidth
0.55576 0.51744 Mdot
0 0 0 setrgbcolor
0.01093 setlinewidth
0.54519 0.50541 Mdot
0 0 0 setrgbcolor
0.01399 setlinewidth
0.53509 0.56345 Mdot
0 0 0 setrgbcolor
0.0129 setlinewidth
0.51324 0.56381 Mdot
0 0 0 setrgbcolor
0.01114 setlinewidth
0.54164 0.55878 Mdot
0 0 0 setrgbcolor
0.00713 setlinewidth
0.55094 0.53119 Mdot
0 0 0 setrgbcolor
0.01868 setlinewidth
0.52696 0.56268 Mdot
0 0 0 setrgbcolor
0.00561 setlinewidth
0.52351 0.56069 Mdot
0 0 0 setrgbcolor
0.0134 setlinewidth
0.52703 0.51382 Mdot
0 0 0 setrgbcolor
0.01363 setlinewidth
0.53161 0.53391 Mdot
1 1 1 setrgbcolor
0.01382 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.01731 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01138 setlinewidth
0.52374 0.52439 Mdot
0 0 0 setrgbcolor
0.0149 setlinewidth
0.51152 0.53594 Mdot
0 0 0 setrgbcolor
0.01509 setlinewidth
0.5277 0.54702 Mdot
0 0 0 setrgbcolor
0.01473 setlinewidth
0.53704 0.52541 Mdot
0 0 0 setrgbcolor
0.01852 setlinewidth
0.54144 0.5371 Mdot
0 0 0 setrgbcolor
0.01078 setlinewidth
0.53086 0.55794 Mdot
0 0 0 setrgbcolor
0.01775 setlinewidth
0.54226 0.52106 Mdot
0 0 0 setrgbcolor
0.00611 setlinewidth
0.53433 0.5568 Mdot
0 0 0 setrgbcolor
0.01936 setlinewidth
0.52736 0.55938 Mdot
0 0 0 setrgbcolor
0.01184 setlinewidth
0.53477 0.51325 Mdot
0 0 0 setrgbcolor
0.01967 setlinewidth
0.4958 0.54316 Mdot
0 0 0 setrgbcolor
0.00818 setlinewidth
0.54079 0.55803 Mdot
0 0 0 setrgbcolor
0.01997 setlinewidth
0.55377 0.53966 Mdot
0 0 0 setrgbcolor
0.0098 setlinewidth
0.53845 0.50787 Mdot
0 0 0 setrgbcolor
0.0072 setlinewidth
0.49752 0.51292 Mdot
0 0 0 setrgbcolor
0.01382 setlinewidth
0.53613 0.50207 Mdot
0 0 0 setrgbcolor
0.00938 setlinewidth
0.48867 0.52319 Mdot
0 0 0 setrgbcolor
0.007 setlinewidth
0.48835 0.52205 Mdot
0 0 0 setrgbcolor
0.01309 setlinewidth
0.55971 0.54215 Mdot
0 0 0 setrgbcolor
0.01086 setlinewidth
0.53991 0.57012 Mdot
0 0 0 setrgbcolor
0.00616 setlinewidth
0.51067 0.4985 Mdot
0 0 0 setrgbcolor
0.00644 setlinewidth
0.56233 0.52739 Mdot
0 0 0 setrgbcolor
0.01565 setlinewidth
0.50743 0.57635 Mdot
0 0 0 setrgbcolor
0.017 setlinewidth
0.53103 0.57932 Mdot
0 0 0 setrgbcolor
0.01985 setlinewidth
0.53379 0.49028 Mdot
0 0 0 setrgbcolor
0.00702 setlinewidth
0.53017 0.58148 Mdot
0 0 0 setrgbcolor
0.01947 setlinewidth
0.54746 0.49548 Mdot
0 0 0 setrgbcolor
0.01706 setlinewidth
0.51865 0.48842 Mdot
0 0 0 setrgbcolor
0.01667 setlinewidth
0.5275 0.58288 Mdot
0 0 0 setrgbcolor
0.00852 setlinewidth
0.5174 0.48695 Mdot
0 0 0 setrgbcolor
0.01838 setlinewidth
0.57235 0.52889 Mdot
0 0 0 setrgbcolor
0.00773 setlinewidth
0.55893 0.5002 Mdot
0 0 0 setrgbcolor
0.019 setlinewidth
0.55611 0.57367 Mdot
0 0 0 setrgbcolor
0.01886 setlinewidth
0.51961 0.48399 Mdot
0 0 0 setrgbcolor
0.01805 setlinewidth
0.56922 0.51152 Mdot
0 0 0 setrgbcolor
0.01586 setlinewidth
0.52541 0.48308 Mdot
0 0 0 setrgbcolor
0.01641 setlinewidth
0.52655 0.48266 Mdot
0 0 0 setrgbcolor
0.01602 setlinewidth
0.50742 0.48448 Mdot
0 0 0 setrgbcolor
0.01832 setlinewidth
0.5224 0.481 Mdot
0 0 0 setrgbcolor
0.01593 setlinewidth
0.52389 0.48098 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.52689 0.48102 Mdot
0 0 0 setrgbcolor
0.01993 setlinewidth
0.51385 0.48162 Mdot
0 0 0 setrgbcolor
0.01135 setlinewidth
0.52316 0.47971 Mdot
0 0 0 setrgbcolor
0.00908 setlinewidth
0.52215 0.47971 Mdot
0 0 0 setrgbcolor
0.00703 setlinewidth
0.46931 0.51879 Mdot
0 0 0 setrgbcolor
0.01927 setlinewidth
0.57958 0.53395 Mdot
0 0 0 setrgbcolor
0.01577 setlinewidth
0.52547 0.47873 Mdot
0 0 0 setrgbcolor
0.00872 setlinewidth
0.56185 0.49396 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.52029 0.59235 Mdot
0 0 0 setrgbcolor
0.01026 setlinewidth
0.55644 0.48897 Mdot
0 0 0 setrgbcolor
0.01953 setlinewidth
0.52445 0.47816 Mdot
0 0 0 setrgbcolor
0.00764 setlinewidth
0.50421 0.48112 Mdot
0 0 0 setrgbcolor
0.01 setlinewidth
0.5196 0.47787 Mdot
0 0 0 setrgbcolor
0.01638 setlinewidth
0.52872 0.47747 Mdot
0 0 0 setrgbcolor
0.0099 setlinewidth
0.46933 0.51286 Mdot
0 0 0 setrgbcolor
0.0173 setlinewidth
0.52512 0.47683 Mdot
0 0 0 setrgbcolor
0.01881 setlinewidth
0.50259 0.48045 Mdot
0 0 0 setrgbcolor
0.01317 setlinewidth
0.51633 0.47631 Mdot
0 0 0 setrgbcolor
0.01112 setlinewidth
0.52295 0.47592 Mdot
0 0 0 setrgbcolor
0.00618 setlinewidth
0.54212 0.4784 Mdot
0 0 0 setrgbcolor
0.01934 setlinewidth
0.54807 0.48023 Mdot
0 0 0 setrgbcolor
0.00787 setlinewidth
0.54984 0.47882 Mdot
0 0 0 setrgbcolor
0.01939 setlinewidth
0.50632 0.47458 Mdot
0 0 0 setrgbcolor
0.01212 setlinewidth
0.4677 0.56616 Mdot
0 0 0 setrgbcolor
0.01594 setlinewidth
0.56027 0.58685 Mdot
0 0 0 setrgbcolor
0.00511 setlinewidth
0.47032 0.57109 Mdot
0 0 0 setrgbcolor
0.0165 setlinewidth
0.49325 0.47851 Mdot
0 0 0 setrgbcolor
0.01339 setlinewidth
0.54371 0.47455 Mdot
0 0 0 setrgbcolor
0.00572 setlinewidth
0.50209 0.47466 Mdot
0 0 0 setrgbcolor
0.01754 setlinewidth
0.47431 0.49343 Mdot
0 0 0 setrgbcolor
0.01772 setlinewidth
0.51722 0.47118 Mdot
0 0 0 setrgbcolor
0.00572 setlinewidth
0.55887 0.48164 Mdot
0 0 0 setrgbcolor
0.00662 setlinewidth
0.57062 0.57949 Mdot
0 0 0 setrgbcolor
0.00579 setlinewidth
0.46066 0.51284 Mdot
0 0 0 setrgbcolor
0.0156 setlinewidth
0.55689 0.47824 Mdot
0 0 0 setrgbcolor
0.01248 setlinewidth
0.55003 0.47452 Mdot
0 0 0 setrgbcolor
0.01516 setlinewidth
0.49264 0.47595 Mdot
0 0 0 setrgbcolor
0.0138 setlinewidth
0.5113 0.46936 Mdot
0 0 0 setrgbcolor
0.01716 setlinewidth
0.54684 0.4725 Mdot
0 0 0 setrgbcolor
0.01257 setlinewidth
0.53786 0.46963 Mdot
0 0 0 setrgbcolor
0.01925 setlinewidth
0.54287 0.4707 Mdot
0 0 0 setrgbcolor
0.01842 setlinewidth
0.54271 0.47061 Mdot
0 0 0 setrgbcolor
0.00786 setlinewidth
0.50557 0.46994 Mdot
0 0 0 setrgbcolor
0.0098 setlinewidth
0.59111 0.53665 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.49297 0.59635 Mdot
0 0 0 setrgbcolor
0.01383 setlinewidth
0.46255 0.56703 Mdot
0 0 0 setrgbcolor
0.0086 setlinewidth
0.54562 0.47079 Mdot
0 0 0 setrgbcolor
0.01899 setlinewidth
0.49617 0.59847 Mdot
0 0 0 setrgbcolor
0.00693 setlinewidth
0.47957 0.58862 Mdot
0 0 0 setrgbcolor
0.01377 setlinewidth
0.51791 0.60416 Mdot
0 0 0 setrgbcolor
0.00926 setlinewidth
0.59158 0.54589 Mdot
0 0 0 setrgbcolor
0.01242 setlinewidth
0.4951 0.47179 Mdot
0 0 0 setrgbcolor
0.00814 setlinewidth
0.58155 0.57365 Mdot
0 0 0 setrgbcolor
0.0137 setlinewidth
0.58463 0.50215 Mdot
0 0 0 setrgbcolor
0.01666 setlinewidth
0.54963 0.47062 Mdot
0 0 0 setrgbcolor
0.01437 setlinewidth
0.58397 0.50084 Mdot
0 0 0 setrgbcolor
0.01102 setlinewidth
0.47574 0.58703 Mdot
0 0 0 setrgbcolor
0.01719 setlinewidth
0.57863 0.5782 Mdot
0 0 0 setrgbcolor
0.0118 setlinewidth
0.49251 0.47213 Mdot
0 0 0 setrgbcolor
0.01019 setlinewidth
0.48876 0.47391 Mdot
0 0 0 setrgbcolor
0.01905 setlinewidth
0.45357 0.52417 Mdot
0 0 0 setrgbcolor
0.01605 setlinewidth
0.59187 0.51945 Mdot
0 0 0 setrgbcolor
0.00916 setlinewidth
0.55273 0.47107 Mdot
0 0 0 setrgbcolor
0.00982 setlinewidth
0.56753 0.59045 Mdot
0 0 0 setrgbcolor
0.00827 setlinewidth
0.4856 0.47527 Mdot
0 0 0 setrgbcolor
0.01307 setlinewidth
0.45462 0.55363 Mdot
0 0 0 setrgbcolor
0.01012 setlinewidth
0.45559 0.55699 Mdot
0 0 0 setrgbcolor
0.01525 setlinewidth
0.45389 0.51998 Mdot
0 0 0 setrgbcolor
0.00604 setlinewidth
0.45984 0.56744 Mdot
0 0 0 setrgbcolor
0.00895 setlinewidth
0.45372 0.52062 Mdot
0 0 0 setrgbcolor
0.00746 setlinewidth
0.50399 0.60364 Mdot
0 0 0 setrgbcolor
0.01459 setlinewidth
0.58265 0.49691 Mdot
0 0 0 setrgbcolor
0.00805 setlinewidth
0.467 0.57861 Mdot
0 0 0 setrgbcolor
0.01479 setlinewidth
0.507 0.60432 Mdot
0 0 0 setrgbcolor
0.00637 setlinewidth
0.49281 0.47143 Mdot
0 0 0 setrgbcolor
0.00709 setlinewidth
0.48721 0.5963 Mdot
0 0 0 setrgbcolor
0.01559 setlinewidth
0.59289 0.5241 Mdot
0 0 0 setrgbcolor
0.01137 setlinewidth
0.48094 0.59197 Mdot
0 0 0 setrgbcolor
0.007 setlinewidth
0.49325 0.59931 Mdot
0 0 0 setrgbcolor
0.00733 setlinewidth
0.47741 0.48166 Mdot
0 0 0 setrgbcolor
0.01186 setlinewidth
0.58996 0.51308 Mdot
0 0 0 setrgbcolor
0.01841 setlinewidth
0.50353 0.46768 Mdot
0 0 0 setrgbcolor
0.01738 setlinewidth
0.45294 0.52898 Mdot
0 0 0 setrgbcolor
0.00896 setlinewidth
0.48728 0.59598 Mdot
0 0 0 setrgbcolor
0.01706 setlinewidth
0.59216 0.54888 Mdot
0 0 0 setrgbcolor
0.00614 setlinewidth
0.51768 0.60553 Mdot
0 0 0 setrgbcolor
0.0056 setlinewidth
0.45352 0.52541 Mdot
0 0 0 setrgbcolor
0.01963 setlinewidth
0.52111 0.46519 Mdot
0 0 0 setrgbcolor
0.01192 setlinewidth
0.59316 0.53479 Mdot
0 0 0 setrgbcolor
0.0094 setlinewidth
0.51672 0.46558 Mdot
0 0 0 setrgbcolor
0.00518 setlinewidth
0.54069 0.60279 Mdot
0 0 0 setrgbcolor
0.01883 setlinewidth
0.46115 0.5036 Mdot
0 0 0 setrgbcolor
0.00964 setlinewidth
0.45545 0.51928 Mdot
0 0 0 setrgbcolor
0.00931 setlinewidth
0.5199 0.60456 Mdot
0 0 0 setrgbcolor
0.00728 setlinewidth
0.56134 0.5928 Mdot
0 0 0 setrgbcolor
0.01521 setlinewidth
0.51421 0.46768 Mdot
0 0 0 setrgbcolor
0.01529 setlinewidth
0.4777 0.48526 Mdot
0 0 0 setrgbcolor
0.01076 setlinewidth
0.59045 0.53755 Mdot
0 0 0 setrgbcolor
0.01981 setlinewidth
0.54685 0.47237 Mdot
0 0 0 setrgbcolor
0.01411 setlinewidth
0.5474 0.59777 Mdot
0 0 0 setrgbcolor
0.008 setlinewidth
0.471 0.49445 Mdot
0 0 0 setrgbcolor
0.01214 setlinewidth
0.45744 0.54231 Mdot
0 0 0 setrgbcolor
0.00708 setlinewidth
0.45735 0.53023 Mdot
0 0 0 setrgbcolor
0.00896 setlinewidth
0.46817 0.49923 Mdot
0 0 0 setrgbcolor
0.01429 setlinewidth
0.56051 0.58714 Mdot
0 0 0 setrgbcolor
0.0184 setlinewidth
0.5225 0.59912 Mdot
0 0 0 setrgbcolor
0.01115 setlinewidth
0.51636 0.59844 Mdot
0 0 0 setrgbcolor
0.00668 setlinewidth
0.51441 0.5972 Mdot
0 0 0 setrgbcolor
0.01563 setlinewidth
0.46918 0.50482 Mdot
0 0 0 setrgbcolor
0.00943 setlinewidth
0.47668 0.5755 Mdot
0 0 0 setrgbcolor
0.01822 setlinewidth
0.57695 0.5646 Mdot
0 0 0 setrgbcolor
0.00932 setlinewidth
0.50993 0.59342 Mdot
0 0 0 setrgbcolor
0.01484 setlinewidth
0.53561 0.59331 Mdot
0 0 0 setrgbcolor
0.019 setlinewidth
0.52983 0.59426 Mdot
0 0 0 setrgbcolor
0.01761 setlinewidth
0.46447 0.52745 Mdot
0 0 0 setrgbcolor
0.01761 setlinewidth
0.49704 0.58821 Mdot
0 0 0 setrgbcolor
0.00656 setlinewidth
0.52365 0.59416 Mdot
0 0 0 setrgbcolor
0.01243 setlinewidth
0.52285 0.594 Mdot
0 0 0 setrgbcolor
0.01585 setlinewidth
0.46727 0.55063 Mdot
0 0 0 setrgbcolor
0.00761 setlinewidth
0.48378 0.57751 Mdot
0 0 0 setrgbcolor
0.00706 setlinewidth
0.52881 0.59243 Mdot
0 0 0 setrgbcolor
0.0087 setlinewidth
0.46627 0.52856 Mdot
0 0 0 setrgbcolor
0.01759 setlinewidth
0.53965 0.59003 Mdot
0 0 0 setrgbcolor
0.01731 setlinewidth
0.52353 0.59236 Mdot
0 0 0 setrgbcolor
0.0164 setlinewidth
0.56264 0.57614 Mdot
0 0 0 setrgbcolor
0.00914 setlinewidth
0.56188 0.57555 Mdot
0 0 0 setrgbcolor
0.01226 setlinewidth
0.47793 0.56804 Mdot
0 0 0 setrgbcolor
0.01001 setlinewidth
0.48045 0.57105 Mdot
0 0 0 setrgbcolor
0.01608 setlinewidth
0.50807 0.58888 Mdot
0 0 0 setrgbcolor
0.01653 setlinewidth
0.52497 0.59079 Mdot
0 0 0 setrgbcolor
0.01451 setlinewidth
0.5007 0.58515 Mdot
0 0 0 setrgbcolor
0.01036 setlinewidth
0.54094 0.58675 Mdot
0 0 0 setrgbcolor
0.01808 setlinewidth
0.57287 0.55277 Mdot
0 0 0 setrgbcolor
0.00514 setlinewidth
0.51587 0.58682 Mdot
0 0 0 setrgbcolor
0.01433 setlinewidth
0.48474 0.56927 Mdot
0 0 0 setrgbcolor
0.01391 setlinewidth
0.55854 0.57146 Mdot
0 0 0 setrgbcolor
0.01391 setlinewidth
0.48848 0.57043 Mdot
0 0 0 setrgbcolor
0.00938 setlinewidth
0.51102 0.58245 Mdot
0 0 0 setrgbcolor
0.00656 setlinewidth
0.56454 0.5536 Mdot
0 0 0 setrgbcolor
0.01109 setlinewidth
0.54345 0.49586 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.50946 0.57744 Mdot
0 0 0 setrgbcolor
0.01675 setlinewidth
0.53134 0.57839 Mdot
0 0 0 setrgbcolor
0.01218 setlinewidth
0.51589 0.57848 Mdot
0 0 0 setrgbcolor
0.01078 setlinewidth
0.5665 0.5342 Mdot
0 0 0 setrgbcolor
0.01596 setlinewidth
0.55089 0.50594 Mdot
0 0 0 setrgbcolor
0.01217 setlinewidth
0.50428 0.56741 Mdot
0 0 0 setrgbcolor
0.01335 setlinewidth
0.55276 0.51445 Mdot
0 0 0 setrgbcolor
0.0171 setlinewidth
0.54055 0.50485 Mdot
0 0 0 setrgbcolor
0.01688 setlinewidth
0.55668 0.54319 Mdot
0 0 0 setrgbcolor
0.01812 setlinewidth
0.52869 0.50168 Mdot
0 0 0 setrgbcolor
0.00752 setlinewidth
0.55516 0.5424 Mdot
0 0 0 setrgbcolor
0.00786 setlinewidth
0.55557 0.53136 Mdot
0 0 0 setrgbcolor
0.0073 setlinewidth
0.51781 0.56418 Mdot
0 0 0 setrgbcolor
0.01733 setlinewidth
0.54137 0.51255 Mdot
0 0 0 setrgbcolor
0.01489 setlinewidth
0.55182 0.54058 Mdot
0 0 0 setrgbcolor
0.01006 setlinewidth
0.51379 0.56265 Mdot
0 0 0 setrgbcolor
0.0156 setlinewidth
0.52651 0.56373 Mdot
0 0 0 setrgbcolor
0.00656 setlinewidth
0.5099 0.51339 Mdot
0 0 0 setrgbcolor
0.00685 setlinewidth
0.53241 0.55788 Mdot
0 0 0 setrgbcolor
0.0127 setlinewidth
0.53749 0.52772 Mdot
0 0 0 setrgbcolor
0.00973 setlinewidth
0.517 0.53362 Mdot
1 1 1 setrgbcolor
0.01731 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
1 1 1 setrgbcolor
0.01028 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.52555 0.53669 Mdot
0 0 0 setrgbcolor
0.01021 setlinewidth
0.50967 0.54664 Mdot
0 0 0 setrgbcolor
0.01158 setlinewidth
0.53622 0.52282 Mdot
0 0 0 setrgbcolor
0.01367 setlinewidth
0.54368 0.54571 Mdot
0 0 0 setrgbcolor
0.00626 setlinewidth
0.49853 0.52713 Mdot
0 0 0 setrgbcolor
0.01938 setlinewidth
0.50621 0.51513 Mdot
0 0 0 setrgbcolor
0.00842 setlinewidth
0.49795 0.52601 Mdot
0 0 0 setrgbcolor
0.01939 setlinewidth
0.54967 0.52185 Mdot
0 0 0 setrgbcolor
0.01616 setlinewidth
0.54455 0.55865 Mdot
0 0 0 setrgbcolor
0.01582 setlinewidth
0.54794 0.55661 Mdot
0 0 0 setrgbcolor
0.01281 setlinewidth
0.55589 0.53332 Mdot
0 0 0 setrgbcolor
0.01072 setlinewidth
0.54497 0.5096 Mdot
0 0 0 setrgbcolor
0.00898 setlinewidth
0.55128 0.55491 Mdot
0 0 0 setrgbcolor
0.01415 setlinewidth
0.55391 0.51654 Mdot
0 0 0 setrgbcolor
0.01632 setlinewidth
0.51672 0.49819 Mdot
0 0 0 setrgbcolor
0.01034 setlinewidth
0.55768 0.55524 Mdot
0 0 0 setrgbcolor
0.01217 setlinewidth
0.54731 0.50348 Mdot
0 0 0 setrgbcolor
0.01473 setlinewidth
0.54357 0.49786 Mdot
0 0 0 setrgbcolor
0.01335 setlinewidth
0.52461 0.57942 Mdot
0 0 0 setrgbcolor
0.00969 setlinewidth
0.56792 0.53415 Mdot
0 0 0 setrgbcolor
0.01835 setlinewidth
0.55752 0.56803 Mdot
0 0 0 setrgbcolor
0.01253 setlinewidth
0.52195 0.48658 Mdot
0 0 0 setrgbcolor
0.01693 setlinewidth
0.47466 0.52583 Mdot
0 0 0 setrgbcolor
0.01728 setlinewidth
0.52015 0.48527 Mdot
0 0 0 setrgbcolor
0.01132 setlinewidth
0.57367 0.53589 Mdot
0 0 0 setrgbcolor
0.01041 setlinewidth
0.54895 0.579 Mdot
0 0 0 setrgbcolor
0.00989 setlinewidth
0.53779 0.4861 Mdot
0 0 0 setrgbcolor
0.01345 setlinewidth
0.47322 0.51976 Mdot
0 0 0 setrgbcolor
0.01004 setlinewidth
0.54806 0.5814 Mdot
0 0 0 setrgbcolor
0.01712 setlinewidth
0.54535 0.58326 Mdot
0 0 0 setrgbcolor
0.01647 setlinewidth
0.5737 0.52014 Mdot
0 0 0 setrgbcolor
0.01785 setlinewidth
0.50868 0.48437 Mdot
0 0 0 setrgbcolor
0.013 setlinewidth
0.52137 0.48189 Mdot
0 0 0 setrgbcolor
0.01347 setlinewidth
0.55246 0.48934 Mdot
0 0 0 setrgbcolor
0.00871 setlinewidth
0.52693 0.48005 Mdot
0 0 0 setrgbcolor
0.00772 setlinewidth
0.51444 0.48041 Mdot
0 0 0 setrgbcolor
0.01668 setlinewidth
0.52792 0.47943 Mdot
0 0 0 setrgbcolor
0.0072 setlinewidth
0.52306 0.4784 Mdot
0 0 0 setrgbcolor
0.01704 setlinewidth
0.50381 0.48148 Mdot
0 0 0 setrgbcolor
0.00884 setlinewidth
0.52457 0.47814 Mdot
0 0 0 setrgbcolor
0.01009 setlinewidth
0.52761 0.47771 Mdot
0 0 0 setrgbcolor
0.01632 setlinewidth
0.52228 0.47713 Mdot
0 0 0 setrgbcolor
0.0169 setlinewidth
0.50172 0.48107 Mdot
0 0 0 setrgbcolor
0.0095 setlinewidth
0.52331 0.47697 Mdot
0 0 0 setrgbcolor
0.00627 setlinewidth
0.56425 0.49248 Mdot
0 0 0 setrgbcolor
0.00789 setlinewidth
0.52523 0.4756 Mdot
0 0 0 setrgbcolor
0.01927 setlinewidth
0.51888 0.47566 Mdot
0 0 0 setrgbcolor
0.00536 setlinewidth
0.57261 0.56944 Mdot
0 0 0 setrgbcolor
0.01075 setlinewidth
0.52395 0.47518 Mdot
0 0 0 setrgbcolor
0.01451 setlinewidth
0.47789 0.57516 Mdot
0 0 0 setrgbcolor
0.00854 setlinewidth
0.53729 0.59434 Mdot
0 0 0 setrgbcolor
0.00804 setlinewidth
0.48113 0.57987 Mdot
0 0 0 setrgbcolor
0.01276 setlinewidth
0.51475 0.47461 Mdot
0 0 0 setrgbcolor
0.00802 setlinewidth
0.58256 0.52026 Mdot
0 0 0 setrgbcolor
0.01401 setlinewidth
0.52404 0.47373 Mdot
0 0 0 setrgbcolor
0.01077 setlinewidth
0.52792 0.47381 Mdot
0 0 0 setrgbcolor
0.01874 setlinewidth
0.47306 0.49909 Mdot
0 0 0 setrgbcolor
0.00629 setlinewidth
0.52141 0.47315 Mdot
0 0 0 setrgbcolor
0.00966 setlinewidth
0.57618 0.50267 Mdot
0 0 0 setrgbcolor
0.00805 setlinewidth
0.46128 0.52131 Mdot
0 0 0 setrgbcolor
0.0174 setlinewidth
0.48993 0.48068 Mdot
0 0 0 setrgbcolor
0.0197 setlinewidth
0.50304 0.4745 Mdot
0 0 0 setrgbcolor
0.01723 setlinewidth
0.55827 0.4813 Mdot
0 0 0 setrgbcolor
0.0186 setlinewidth
0.5647 0.48563 Mdot
0 0 0 setrgbcolor
0.005 setlinewidth
0.49827 0.4753 Mdot
0 0 0 setrgbcolor
0.00736 setlinewidth
0.54111 0.47266 Mdot
0 0 0 setrgbcolor
0.00978 setlinewidth
0.54731 0.47362 Mdot
0 0 0 setrgbcolor
0.01992 setlinewidth
0.51297 0.46928 Mdot
0 0 0 setrgbcolor
0.01277 setlinewidth
0.58916 0.52454 Mdot
0 0 0 setrgbcolor
0.00938 setlinewidth
0.48763 0.47822 Mdot
0 0 0 setrgbcolor
0.00676 setlinewidth
0.47017 0.57703 Mdot
0 0 0 setrgbcolor
0.00779 setlinewidth
0.54816 0.47193 Mdot
0 0 0 setrgbcolor
0.00901 setlinewidth
0.54055 0.46852 Mdot
0 0 0 setrgbcolor
0.01156 setlinewidth
0.50533 0.46844 Mdot
0 0 0 setrgbcolor
0.01832 setlinewidth
0.49919 0.46999 Mdot
0 0 0 setrgbcolor
0.01288 setlinewidth
0.49023 0.59686 Mdot
0 0 0 setrgbcolor
0.0177 setlinewidth
0.50554 0.60286 Mdot
0 0 0 setrgbcolor
0.01047 setlinewidth
0.57511 0.58286 Mdot
0 0 0 setrgbcolor
0.0146 setlinewidth
0.55699 0.47348 Mdot
0 0 0 setrgbcolor
0.01438 setlinewidth
0.45242 0.53432 Mdot
0 0 0 setrgbcolor
0.019 setlinewidth
0.50866 0.60462 Mdot
0 0 0 setrgbcolor
0.01744 setlinewidth
0.48747 0.47367 Mdot
0 0 0 setrgbcolor
0.00709 setlinewidth
0.53217 0.46447 Mdot
0 0 0 setrgbcolor
0.01811 setlinewidth
0.54583 0.46755 Mdot
0 0 0 setrgbcolor
0.01035 setlinewidth
0.48478 0.59588 Mdot
0 0 0 setrgbcolor
0.00776 setlinewidth
0.55352 0.47032 Mdot
0 0 0 setrgbcolor
0.0106 setlinewidth
0.54187 0.46599 Mdot
0 0 0 setrgbcolor
0.00951 setlinewidth
0.58402 0.57367 Mdot
0 0 0 setrgbcolor
0.01589 setlinewidth
0.53727 0.46478 Mdot
0 0 0 setrgbcolor
0.01899 setlinewidth
0.53708 0.46472 Mdot
0 0 0 setrgbcolor
0.01691 setlinewidth
0.48398 0.4745 Mdot
0 0 0 setrgbcolor
0.01954 setlinewidth
0.48023 0.47696 Mdot
0 0 0 setrgbcolor
0.01055 setlinewidth
0.45084 0.53005 Mdot
0 0 0 setrgbcolor
0.01135 setlinewidth
0.45681 0.56463 Mdot
0 0 0 setrgbcolor
0.00797 setlinewidth
0.53129 0.60738 Mdot
0 0 0 setrgbcolor
0.01198 setlinewidth
0.45819 0.56796 Mdot
0 0 0 setrgbcolor
0.00797 setlinewidth
0.53955 0.46447 Mdot
0 0 0 setrgbcolor
0.01089 setlinewidth
0.44995 0.5308 Mdot
0 0 0 setrgbcolor
0.00502 setlinewidth
0.46354 0.57816 Mdot
0 0 0 setrgbcolor
0.01541 setlinewidth
0.47621 0.47893 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.54211 0.46375 Mdot
0 0 0 setrgbcolor
0.01135 setlinewidth
0.47165 0.58869 Mdot
0 0 0 setrgbcolor
0.01137 setlinewidth
0.59667 0.52592 Mdot
0 0 0 setrgbcolor
0.01281 setlinewidth
0.44901 0.53964 Mdot
0 0 0 setrgbcolor
0.0063 setlinewidth
0.44878 0.5359 Mdot
0 0 0 setrgbcolor
0.01879 setlinewidth
0.46649 0.48701 Mdot
0 0 0 setrgbcolor
0.00774 setlinewidth
0.48098 0.47395 Mdot
0 0 0 setrgbcolor
0.00591 setlinewidth
0.51331 0.60917 Mdot
0 0 0 setrgbcolor
0.01002 setlinewidth
0.4944 0.60407 Mdot
0 0 0 setrgbcolor
0.01001 setlinewidth
0.59756 0.53558 Mdot
0 0 0 setrgbcolor
0.01565 setlinewidth
0.48704 0.60052 Mdot
0 0 0 setrgbcolor
0.0051 setlinewidth
0.44885 0.52934 Mdot
0 0 0 setrgbcolor
0.0093 setlinewidth
0.58293 0.491 Mdot
0 0 0 setrgbcolor
0.01242 setlinewidth
0.58197 0.48974 Mdot
0 0 0 setrgbcolor
0.01015 setlinewidth
0.59088 0.5662 Mdot
0 0 0 setrgbcolor
0.00513 setlinewidth
0.54385 0.46382 Mdot
0 0 0 setrgbcolor
0.01564 setlinewidth
0.45227 0.51228 Mdot
0 0 0 setrgbcolor
0.00908 setlinewidth
0.58823 0.57143 Mdot
0 0 0 setrgbcolor
0.01643 setlinewidth
0.51599 0.60948 Mdot
0 0 0 setrgbcolor
0.0182 setlinewidth
0.50061 0.60634 Mdot
0 0 0 setrgbcolor
0.01159 setlinewidth
0.49375 0.60378 Mdot
0 0 0 setrgbcolor
0.01758 setlinewidth
0.49061 0.4684 Mdot
0 0 0 setrgbcolor
0.00707 setlinewidth
0.57742 0.58599 Mdot
0 0 0 setrgbcolor
0.01089 setlinewidth
0.59202 0.50801 Mdot
0 0 0 setrgbcolor
0.01597 setlinewidth
0.50307 0.46415 Mdot
0 0 0 setrgbcolor
0.01842 setlinewidth
0.52599 0.60925 Mdot
0 0 0 setrgbcolor
0.0052 setlinewidth
0.50764 0.46303 Mdot
0 0 0 setrgbcolor
0.01305 setlinewidth
0.46447 0.49088 Mdot
0 0 0 setrgbcolor
0.01017 setlinewidth
0.44989 0.54054 Mdot
0 0 0 setrgbcolor
0.00864 setlinewidth
0.45186 0.55299 Mdot
0 0 0 setrgbcolor
0.01098 setlinewidth
0.57707 0.48607 Mdot
0 0 0 setrgbcolor
0.01147 setlinewidth
0.45831 0.50149 Mdot
0 0 0 setrgbcolor
0.0137 setlinewidth
0.45593 0.50688 Mdot
0 0 0 setrgbcolor
0.00741 setlinewidth
0.52676 0.60803 Mdot
0 0 0 setrgbcolor
0.008 setlinewidth
0.49911 0.46685 Mdot
0 0 0 setrgbcolor
0.00939 setlinewidth
0.54812 0.60311 Mdot
0 0 0 setrgbcolor
0.01096 setlinewidth
0.59117 0.51291 Mdot
0 0 0 setrgbcolor
0.01781 setlinewidth
0.58595 0.50189 Mdot
0 0 0 setrgbcolor
0.01625 setlinewidth
0.45615 0.51262 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.5936 0.539 Mdot
0 0 0 setrgbcolor
0.006 setlinewidth
0.56708 0.5897 Mdot
0 0 0 setrgbcolor
0.0149 setlinewidth
0.59198 0.52413 Mdot
0 0 0 setrgbcolor
0.01806 setlinewidth
0.5324 0.46651 Mdot
0 0 0 setrgbcolor
0.00572 setlinewidth
0.47425 0.58457 Mdot
0 0 0 setrgbcolor
0.00998 setlinewidth
0.45389 0.53678 Mdot
0 0 0 setrgbcolor
0.00528 setlinewidth
0.55209 0.59706 Mdot
0 0 0 setrgbcolor
0.00956 setlinewidth
0.45984 0.56034 Mdot
0 0 0 setrgbcolor
0.01084 setlinewidth
0.45529 0.5377 Mdot
0 0 0 setrgbcolor
0.00515 setlinewidth
0.51875 0.60246 Mdot
0 0 0 setrgbcolor
0.00752 setlinewidth
0.52524 0.60225 Mdot
0 0 0 setrgbcolor
0.01021 setlinewidth
0.51618 0.60149 Mdot
0 0 0 setrgbcolor
0.01178 setlinewidth
0.48051 0.5857 Mdot
0 0 0 setrgbcolor
0.01553 setlinewidth
0.49595 0.5948 Mdot
0 0 0 setrgbcolor
0.01789 setlinewidth
0.47264 0.5768 Mdot
0 0 0 setrgbcolor
0.01982 setlinewidth
0.4756 0.57954 Mdot
0 0 0 setrgbcolor
0.01065 setlinewidth
0.58727 0.52762 Mdot
0 0 0 setrgbcolor
0.00713 setlinewidth
0.51001 0.5983 Mdot
0 0 0 setrgbcolor
0.01829 setlinewidth
0.56231 0.58414 Mdot
0 0 0 setrgbcolor
0.01703 setlinewidth
0.52385 0.59707 Mdot
0 0 0 setrgbcolor
0.00757 setlinewidth
0.52296 0.59702 Mdot
0 0 0 setrgbcolor
0.01498 setlinewidth
0.53031 0.59625 Mdot
0 0 0 setrgbcolor
0.00567 setlinewidth
0.49797 0.59118 Mdot
0 0 0 setrgbcolor
0.01647 setlinewidth
0.4786 0.57714 Mdot
0 0 0 setrgbcolor
0.00784 setlinewidth
0.50628 0.59395 Mdot
0 0 0 setrgbcolor
0.01058 setlinewidth
0.53607 0.59441 Mdot
0 0 0 setrgbcolor
0.01028 setlinewidth
0.52291 0.59526 Mdot
0 0 0 setrgbcolor
0.0051 setlinewidth
0.52841 0.59455 Mdot
0 0 0 setrgbcolor
0.01797 setlinewidth
0.48214 0.57782 Mdot
0 0 0 setrgbcolor
0.01208 setlinewidth
0.52372 0.59344 Mdot
0 0 0 setrgbcolor
0.01609 setlinewidth
0.53904 0.59045 Mdot
0 0 0 setrgbcolor
0.00998 setlinewidth
0.57469 0.5582 Mdot
0 0 0 setrgbcolor
0.01044 setlinewidth
0.513 0.59073 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.50669 0.58696 Mdot
0 0 0 setrgbcolor
0.0122 setlinewidth
0.53912 0.5869 Mdot
0 0 0 setrgbcolor
0.01861 setlinewidth
0.56035 0.57253 Mdot
0 0 0 setrgbcolor
0.00695 setlinewidth
0.55921 0.57205 Mdot
0 0 0 setrgbcolor
0.00902 setlinewidth
0.50354 0.58204 Mdot
0 0 0 setrgbcolor
0.00605 setlinewidth
0.51014 0.58217 Mdot
0 0 0 setrgbcolor
0.01361 setlinewidth
0.4957 0.57248 Mdot
0 0 0 setrgbcolor
0.0085 setlinewidth
0.5539 0.56838 Mdot
0 0 0 setrgbcolor
0.00723 setlinewidth
0.56619 0.54665 Mdot
0 0 0 setrgbcolor
0.01177 setlinewidth
0.52588 0.57979 Mdot
0 0 0 setrgbcolor
0.01892 setlinewidth
0.52563 0.49199 Mdot
0 0 0 setrgbcolor
0.01251 setlinewidth
0.51004 0.50048 Mdot
0 0 0 setrgbcolor
0.0164 setlinewidth
0.49192 0.51564 Mdot
0 0 0 setrgbcolor
0.01477 setlinewidth
0.5037 0.56618 Mdot
0 0 0 setrgbcolor
0.00668 setlinewidth
0.55627 0.5489 Mdot
0 0 0 setrgbcolor
0.00667 setlinewidth
0.53416 0.50136 Mdot
0 0 0 setrgbcolor
0.01954 setlinewidth
0.50806 0.56717 Mdot
0 0 0 setrgbcolor
0.00673 setlinewidth
0.52272 0.50191 Mdot
0 0 0 setrgbcolor
0.01009 setlinewidth
0.55496 0.52836 Mdot
0 0 0 setrgbcolor
0.00702 setlinewidth
0.51677 0.5654 Mdot
0 0 0 setrgbcolor
0.01764 setlinewidth
0.53681 0.50998 Mdot
0 0 0 setrgbcolor
0.01685 setlinewidth
0.5241 0.50984 Mdot
0 0 0 setrgbcolor
0.01189 setlinewidth
0.52153 0.55845 Mdot
0 0 0 setrgbcolor
0.01596 setlinewidth
0.54504 0.53936 Mdot
0 0 0 setrgbcolor
0.01013 setlinewidth
0.50128 0.53563 Mdot
0 0 0 setrgbcolor
0.00665 setlinewidth
0.54188 0.5272 Mdot
0 0 0 setrgbcolor
0.00831 setlinewidth
0.54318 0.53878 Mdot
0 0 0 setrgbcolor
0.0165 setlinewidth
0.5391 0.53743 Mdot
0 0 0 setrgbcolor
0.00962 setlinewidth
0.52156 0.5263 Mdot
1 1 1 setrgbcolor
0.01028 setlinewidth
0.91812 0.83983 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.00744 setlinewidth
0.52576 0.54802 Mdot
0 0 0 setrgbcolor
0.0169 setlinewidth
0.51095 0.52956 Mdot
0 0 0 setrgbcolor
0.01245 setlinewidth
0.51012 0.5285 Mdot
0 0 0 setrgbcolor
0.01851 setlinewidth
0.54081 0.53524 Mdot
0 0 0 setrgbcolor
0.01675 setlinewidth
0.51686 0.51595 Mdot
1 1 1 setrgbcolor
0.0102 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01554 setlinewidth
0.5491 0.51924 Mdot
0 0 0 setrgbcolor
0.01086 setlinewidth
0.55994 0.5419 Mdot
0 0 0 setrgbcolor
0.0051 setlinewidth
0.52379 0.49684 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.48371 0.53209 Mdot
0 0 0 setrgbcolor
0.01745 setlinewidth
0.56185 0.5162 Mdot
0 0 0 setrgbcolor
0.01515 setlinewidth
0.48076 0.52608 Mdot
0 0 0 setrgbcolor
0.01021 setlinewidth
0.56211 0.55528 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.55477 0.50422 Mdot
0 0 0 setrgbcolor
0.01028 setlinewidth
0.56516 0.55265 Mdot
0 0 0 setrgbcolor
0.00617 setlinewidth
0.5697 0.52719 Mdot
0 0 0 setrgbcolor
0.01362 setlinewidth
0.56815 0.55039 Mdot
0 0 0 setrgbcolor
0.00914 setlinewidth
0.56472 0.51006 Mdot
0 0 0 setrgbcolor
0.01862 setlinewidth
0.5434 0.57998 Mdot
0 0 0 setrgbcolor
0.011 setlinewidth
0.55547 0.49754 Mdot
0 0 0 setrgbcolor
0.01897 setlinewidth
0.55041 0.49232 Mdot
0 0 0 setrgbcolor
0.00626 setlinewidth
0.52566 0.4841 Mdot
0 0 0 setrgbcolor
0.01109 setlinewidth
0.52337 0.48305 Mdot
0 0 0 setrgbcolor
0.01064 setlinewidth
0.51103 0.48398 Mdot
0 0 0 setrgbcolor
0.00746 setlinewidth
0.57409 0.5498 Mdot
0 0 0 setrgbcolor
0.01927 setlinewidth
0.52341 0.47941 Mdot
0 0 0 setrgbcolor
0.00843 setlinewidth
0.50468 0.48182 Mdot
0 0 0 setrgbcolor
0.01467 setlinewidth
0.49198 0.58276 Mdot
0 0 0 setrgbcolor
0.00674 setlinewidth
0.51567 0.479 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.47505 0.50495 Mdot
0 0 0 setrgbcolor
0.00688 setlinewidth
0.54121 0.48112 Mdot
0 0 0 setrgbcolor
0.00878 setlinewidth
0.46608 0.52973 Mdot
0 0 0 setrgbcolor
0.01943 setlinewidth
0.50221 0.48175 Mdot
0 0 0 setrgbcolor
0.00616 setlinewidth
0.58063 0.52631 Mdot
0 0 0 setrgbcolor
0.00791 setlinewidth
0.49569 0.58718 Mdot
0 0 0 setrgbcolor
0.01534 setlinewidth
0.57475 0.56324 Mdot
0 0 0 setrgbcolor
0.01528 setlinewidth
0.52835 0.47663 Mdot
0 0 0 setrgbcolor
0.01007 setlinewidth
0.5238 0.47557 Mdot
0 0 0 setrgbcolor
0.00848 setlinewidth
0.5291 0.47585 Mdot
0 0 0 setrgbcolor
0.01668 setlinewidth
0.56705 0.576 Mdot
0 0 0 setrgbcolor
0.01194 setlinewidth
0.52523 0.47507 Mdot
0 0 0 setrgbcolor
0.01795 setlinewidth
0.52249 0.47439 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.5636 0.58101 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.56618 0.57866 Mdot
0 0 0 setrgbcolor
0.01393 setlinewidth
0.52347 0.47407 Mdot
0 0 0 setrgbcolor
0.01486 setlinewidth
0.5281 0.47414 Mdot
0 0 0 setrgbcolor
0.01564 setlinewidth
0.51836 0.47345 Mdot
0 0 0 setrgbcolor
0.0178 setlinewidth
0.48854 0.48334 Mdot
0 0 0 setrgbcolor
0.01514 setlinewidth
0.55602 0.4822 Mdot
0 0 0 setrgbcolor
0.00986 setlinewidth
0.52482 0.47237 Mdot
0 0 0 setrgbcolor
0.01319 setlinewidth
0.51358 0.47305 Mdot
0 0 0 setrgbcolor
0.0171 setlinewidth
0.52335 0.47215 Mdot
0 0 0 setrgbcolor
0.01646 setlinewidth
0.5858 0.5273 Mdot
0 0 0 setrgbcolor
0.00729 setlinewidth
0.5008 0.47487 Mdot
0 0 0 setrgbcolor
0.01001 setlinewidth
0.58294 0.5109 Mdot
0 0 0 setrgbcolor
0.00818 setlinewidth
0.52278 0.47066 Mdot
0 0 0 setrgbcolor
0.00784 setlinewidth
0.49577 0.47648 Mdot
0 0 0 setrgbcolor
0.00679 setlinewidth
0.51984 0.47049 Mdot
0 0 0 setrgbcolor
0.00768 setlinewidth
0.48196 0.58602 Mdot
0 0 0 setrgbcolor
0.01415 setlinewidth
0.52671 0.47012 Mdot
0 0 0 setrgbcolor
0.01307 setlinewidth
0.48456 0.48125 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.55511 0.59388 Mdot
0 0 0 setrgbcolor
0.00903 setlinewidth
0.45591 0.54474 Mdot
0 0 0 setrgbcolor
0.00762 setlinewidth
0.56736 0.48367 Mdot
0 0 0 setrgbcolor
0.01102 setlinewidth
0.50898 0.46795 Mdot
0 0 0 setrgbcolor
0.00811 setlinewidth
0.58766 0.56265 Mdot
0 0 0 setrgbcolor
0.00905 setlinewidth
0.53877 0.4669 Mdot
0 0 0 setrgbcolor
0.00603 setlinewidth
0.49381 0.47098 Mdot
0 0 0 setrgbcolor
0.01388 setlinewidth
0.49999 0.46839 Mdot
0 0 0 setrgbcolor
0.00922 setlinewidth
0.45237 0.54067 Mdot
0 0 0 setrgbcolor
0.01324 setlinewidth
0.50407 0.60368 Mdot
0 0 0 setrgbcolor
0.01089 setlinewidth
0.55791 0.4731 Mdot
0 0 0 setrgbcolor
0.00796 setlinewidth
0.58032 0.49247 Mdot
0 0 0 setrgbcolor
0.01308 setlinewidth
0.58992 0.50979 Mdot
0 0 0 setrgbcolor
0.00504 setlinewidth
0.4636 0.57544 Mdot
0 0 0 setrgbcolor
0.01165 setlinewidth
0.54481 0.46693 Mdot
0 0 0 setrgbcolor
0.0096 setlinewidth
0.48155 0.47673 Mdot
0 0 0 setrgbcolor
0.01768 setlinewidth
0.46534 0.57868 Mdot
0 0 0 setrgbcolor
0.01854 setlinewidth
0.56504 0.47659 Mdot
0 0 0 setrgbcolor
0.01313 setlinewidth
0.5205 0.60768 Mdot
0 0 0 setrgbcolor
0.00679 setlinewidth
0.45077 0.54164 Mdot
0 0 0 setrgbcolor
0.01135 setlinewidth
0.4972 0.60357 Mdot
0 0 0 setrgbcolor
0.01974 setlinewidth
0.47382 0.48134 Mdot
0 0 0 setrgbcolor
0.01843 setlinewidth
0.47732 0.4782 Mdot
0 0 0 setrgbcolor
0.00603 setlinewidth
0.54459 0.46508 Mdot
0 0 0 setrgbcolor
0.00755 setlinewidth
0.53586 0.4628 Mdot
0 0 0 setrgbcolor
0.01639 setlinewidth
0.52334 0.6091 Mdot
0 0 0 setrgbcolor
0.01622 setlinewidth
0.47154 0.58847 Mdot
0 0 0 setrgbcolor
0.01635 setlinewidth
0.46915 0.48408 Mdot
0 0 0 setrgbcolor
0.00574 setlinewidth
0.44971 0.551 Mdot
0 0 0 setrgbcolor
0.00974 setlinewidth
0.52526 0.46004 Mdot
0 0 0 setrgbcolor
0.00572 setlinewidth
0.44863 0.5472 Mdot
0 0 0 setrgbcolor
0.01725 setlinewidth
0.59537 0.51337 Mdot
0 0 0 setrgbcolor
0.01316 setlinewidth
0.55258 0.46536 Mdot
0 0 0 setrgbcolor
0.0053 setlinewidth
0.53012 0.45957 Mdot
0 0 0 setrgbcolor
0.00671 setlinewidth
0.52989 0.45954 Mdot
0 0 0 setrgbcolor
0.01507 setlinewidth
0.53962 0.46104 Mdot
0 0 0 setrgbcolor
0.01656 setlinewidth
0.48014 0.59826 Mdot
0 0 0 setrgbcolor
0.00846 setlinewidth
0.53509 0.46008 Mdot
0 0 0 setrgbcolor
0.01913 setlinewidth
0.44669 0.54051 Mdot
0 0 0 setrgbcolor
0.00639 setlinewidth
0.45844 0.4941 Mdot
0 0 0 setrgbcolor
0.01185 setlinewidth
0.54769 0.46269 Mdot
0 0 0 setrgbcolor
0.0069 setlinewidth
0.54552 0.60877 Mdot
0 0 0 setrgbcolor
0.0097 setlinewidth
0.44741 0.52241 Mdot
0 0 0 setrgbcolor
0.01337 setlinewidth
0.53171 0.45893 Mdot
0 0 0 setrgbcolor
0.00923 setlinewidth
0.58815 0.5766 Mdot
0 0 0 setrgbcolor
0.0107 setlinewidth
0.47093 0.47834 Mdot
0 0 0 setrgbcolor
0.01127 setlinewidth
0.49613 0.60836 Mdot
0 0 0 setrgbcolor
0.01722 setlinewidth
0.59485 0.56574 Mdot
0 0 0 setrgbcolor
0.01372 setlinewidth
0.50418 0.61096 Mdot
0 0 0 setrgbcolor
0.00627 setlinewidth
0.53247 0.45788 Mdot
0 0 0 setrgbcolor
0.01022 setlinewidth
0.47869 0.47114 Mdot
0 0 0 setrgbcolor
0.0075 setlinewidth
0.5028 0.61081 Mdot
0 0 0 setrgbcolor
0.01579 setlinewidth
0.52422 0.6135 Mdot
0 0 0 setrgbcolor
0.0199 setlinewidth
0.44673 0.5521 Mdot
0 0 0 setrgbcolor
0.01471 setlinewidth
0.51019 0.61246 Mdot
0 0 0 setrgbcolor
0.00621 setlinewidth
0.45059 0.56464 Mdot
0 0 0 setrgbcolor
0.0102 setlinewidth
0.45405 0.49862 Mdot
0 0 0 setrgbcolor
0.00808 setlinewidth
0.44891 0.51056 Mdot
0 0 0 setrgbcolor
0.00874 setlinewidth
0.44719 0.5165 Mdot
0 0 0 setrgbcolor
0.01488 setlinewidth
0.52635 0.61348 Mdot
0 0 0 setrgbcolor
0.01872 setlinewidth
0.53259 0.4578 Mdot
0 0 0 setrgbcolor
0.00893 setlinewidth
0.48946 0.46483 Mdot
0 0 0 setrgbcolor
0.01053 setlinewidth
0.49389 0.46293 Mdot
0 0 0 setrgbcolor
0.00799 setlinewidth
0.59787 0.51403 Mdot
0 0 0 setrgbcolor
0.01071 setlinewidth
0.44652 0.52252 Mdot
0 0 0 setrgbcolor
0.00905 setlinewidth
0.53497 0.61192 Mdot
0 0 0 setrgbcolor
0.01768 setlinewidth
0.48419 0.46838 Mdot
0 0 0 setrgbcolor
0.00551 setlinewidth
0.57567 0.47865 Mdot
0 0 0 setrgbcolor
0.01579 setlinewidth
0.57689 0.47982 Mdot
0 0 0 setrgbcolor
0.01308 setlinewidth
0.44708 0.54785 Mdot
0 0 0 setrgbcolor
0.01239 setlinewidth
0.59916 0.5241 Mdot
0 0 0 setrgbcolor
0.00753 setlinewidth
0.5967 0.55719 Mdot
0 0 0 setrgbcolor
0.01579 setlinewidth
0.59455 0.56308 Mdot
0 0 0 setrgbcolor
0.01213 setlinewidth
0.44794 0.54864 Mdot
0 0 0 setrgbcolor
0.01023 setlinewidth
0.58478 0.58001 Mdot
0 0 0 setrgbcolor
0.01295 setlinewidth
0.53408 0.61065 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.45603 0.57132 Mdot
0 0 0 setrgbcolor
0.01381 setlinewidth
0.47488 0.59418 Mdot
0 0 0 setrgbcolor
0.01676 setlinewidth
0.58744 0.49625 Mdot
0 0 0 setrgbcolor
0.01744 setlinewidth
0.55468 0.60244 Mdot
0 0 0 setrgbcolor
0.01222 setlinewidth
0.5671 0.47581 Mdot
0 0 0 setrgbcolor
0.00648 setlinewidth
0.47026 0.58653 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.47981 0.59455 Mdot
0 0 0 setrgbcolor
0.01573 setlinewidth
0.47351 0.58893 Mdot
0 0 0 setrgbcolor
0.00661 setlinewidth
0.51577 0.46282 Mdot
0 0 0 setrgbcolor
0.01447 setlinewidth
0.49658 0.60174 Mdot
0 0 0 setrgbcolor
0.01648 setlinewidth
0.52168 0.6063 Mdot
0 0 0 setrgbcolor
0.00722 setlinewidth
0.51859 0.60569 Mdot
0 0 0 setrgbcolor
0.01322 setlinewidth
0.58454 0.5017 Mdot
0 0 0 setrgbcolor
0.00973 setlinewidth
0.47489 0.58611 Mdot
0 0 0 setrgbcolor
0.01796 setlinewidth
0.52813 0.60515 Mdot
0 0 0 setrgbcolor
0.01058 setlinewidth
0.57711 0.49103 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.57049 0.58576 Mdot
0 0 0 setrgbcolor
0.01326 setlinewidth
0.51099 0.60334 Mdot
0 0 0 setrgbcolor
0.00942 setlinewidth
0.55534 0.59574 Mdot
0 0 0 setrgbcolor
0.01637 setlinewidth
0.47798 0.58633 Mdot
0 0 0 setrgbcolor
0.00781 setlinewidth
0.49667 0.5978 Mdot
0 0 0 setrgbcolor
0.01721 setlinewidth
0.59036 0.52867 Mdot
0 0 0 setrgbcolor
0.0157 setlinewidth
0.5859 0.5134 Mdot
0 0 0 setrgbcolor
0.01263 setlinewidth
0.50544 0.59946 Mdot
0 0 0 setrgbcolor
0.00908 setlinewidth
0.52308 0.60019 Mdot
0 0 0 setrgbcolor
0.006 setlinewidth
0.52402 0.60011 Mdot
0 0 0 setrgbcolor
0.01089 setlinewidth
0.53035 0.59831 Mdot
0 0 0 setrgbcolor
0.0102 setlinewidth
0.52224 0.5984 Mdot
0 0 0 setrgbcolor
0.01467 setlinewidth
0.5276 0.59686 Mdot
0 0 0 setrgbcolor
0.01493 setlinewidth
0.53569 0.59557 Mdot
0 0 0 setrgbcolor
0.01902 setlinewidth
0.51051 0.59522 Mdot
0 0 0 setrgbcolor
0.01978 setlinewidth
0.52229 0.59643 Mdot
0 0 0 setrgbcolor
0.00904 setlinewidth
0.50304 0.59228 Mdot
0 0 0 setrgbcolor
0.00851 setlinewidth
0.56164 0.58091 Mdot
0 0 0 setrgbcolor
0.01449 setlinewidth
0.57927 0.51796 Mdot
0 0 0 setrgbcolor
0.0142 setlinewidth
0.49835 0.58769 Mdot
0 0 0 setrgbcolor
0.01482 setlinewidth
0.53727 0.59106 Mdot
0 0 0 setrgbcolor
0.01692 setlinewidth
0.48815 0.579 Mdot
0 0 0 setrgbcolor
0.0085 setlinewidth
0.50469 0.58689 Mdot
0 0 0 setrgbcolor
0.01361 setlinewidth
0.53601 0.58742 Mdot
0 0 0 setrgbcolor
0.00583 setlinewidth
0.47432 0.52076 Mdot
0 0 0 setrgbcolor
0.00526 setlinewidth
0.56861 0.55206 Mdot
0 0 0 setrgbcolor
0.01449 setlinewidth
0.50573 0.49087 Mdot
0 0 0 setrgbcolor
0.00724 setlinewidth
0.51964 0.58212 Mdot
0 0 0 setrgbcolor
0.01019 setlinewidth
0.55523 0.56928 Mdot
0 0 0 setrgbcolor
0.01421 setlinewidth
0.49037 0.50221 Mdot
0 0 0 setrgbcolor
0.00912 setlinewidth
0.49392 0.57137 Mdot
0 0 0 setrgbcolor
0.01548 setlinewidth
0.55376 0.56897 Mdot
0 0 0 setrgbcolor
0.01919 setlinewidth
0.49835 0.57176 Mdot
0 0 0 setrgbcolor
0.01833 setlinewidth
0.50303 0.50173 Mdot
0 0 0 setrgbcolor
0.01863 setlinewidth
0.5466 0.56603 Mdot
0 0 0 setrgbcolor
0.00851 setlinewidth
0.48547 0.54013 Mdot
0 0 0 setrgbcolor
0.00993 setlinewidth
0.50646 0.56865 Mdot
0 0 0 setrgbcolor
0.00823 setlinewidth
0.51483 0.49934 Mdot
0 0 0 setrgbcolor
0.0199 setlinewidth
0.55576 0.54147 Mdot
0 0 0 setrgbcolor
0.00697 setlinewidth
0.50493 0.50981 Mdot
0 0 0 setrgbcolor
0.01626 setlinewidth
0.50961 0.56075 Mdot
0 0 0 setrgbcolor
0.0189 setlinewidth
0.51816 0.50795 Mdot
1 1 1 setrgbcolor
0.0102 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01457 setlinewidth
0.54475 0.54544 Mdot
0 0 0 setrgbcolor
0.01313 setlinewidth
0.50405 0.52738 Mdot
0 0 0 setrgbcolor
0.00565 setlinewidth
0.53989 0.52424 Mdot
0 0 0 setrgbcolor
0.0124 setlinewidth
0.52536 0.52513 Mdot
0 0 0 setrgbcolor
0.0195 setlinewidth
0.53058 0.5373 Mdot
0 0 0 setrgbcolor
0.01649 setlinewidth
0.52847 0.53699 Mdot
0 0 0 setrgbcolor
0.01412 setlinewidth
0.52387 0.53623 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01482 setlinewidth
0.52536 0.53007 Mdot
0 0 0 setrgbcolor
0.00663 setlinewidth
0.5243 0.52909 Mdot
0 0 0 setrgbcolor
0.00903 setlinewidth
0.52895 0.51507 Mdot
0 0 0 setrgbcolor
0.01428 setlinewidth
0.54327 0.54694 Mdot
0 0 0 setrgbcolor
0.01845 setlinewidth
0.49617 0.537 Mdot
0 0 0 setrgbcolor
0.01929 setlinewidth
0.49178 0.53128 Mdot
1 1 1 setrgbcolor
0.01869 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01048 setlinewidth
0.55646 0.53138 Mdot
0 0 0 setrgbcolor
0.01588 setlinewidth
0.53151 0.49429 Mdot
0 0 0 setrgbcolor
0.01736 setlinewidth
0.56159 0.51351 Mdot
0 0 0 setrgbcolor
0.01002 setlinewidth
0.47507 0.53747 Mdot
0 0 0 setrgbcolor
0.00651 setlinewidth
0.48042 0.51051 Mdot
0 0 0 setrgbcolor
0.01727 setlinewidth
0.5755 0.53548 Mdot
0 0 0 setrgbcolor
0.00627 setlinewidth
0.51441 0.48312 Mdot
0 0 0 setrgbcolor
0.00561 setlinewidth
0.50942 0.58839 Mdot
0 0 0 setrgbcolor
0.0063 setlinewidth
0.52956 0.48091 Mdot
0 0 0 setrgbcolor
0.01075 setlinewidth
0.5269 0.4802 Mdot
0 0 0 setrgbcolor
0.00861 setlinewidth
0.56348 0.49712 Mdot
0 0 0 setrgbcolor
0.01454 setlinewidth
0.50686 0.48195 Mdot
0 0 0 setrgbcolor
0.01224 setlinewidth
0.50415 0.48229 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.57276 0.50846 Mdot
0 0 0 setrgbcolor
0.0191 setlinewidth
0.57898 0.54914 Mdot
0 0 0 setrgbcolor
0.00734 setlinewidth
0.51341 0.59244 Mdot
0 0 0 setrgbcolor
0.00506 setlinewidth
0.5628 0.57775 Mdot
0 0 0 setrgbcolor
0.00511 setlinewidth
0.51753 0.47729 Mdot
0 0 0 setrgbcolor
0.00671 setlinewidth
0.52564 0.47646 Mdot
0 0 0 setrgbcolor
0.00865 setlinewidth
0.58146 0.54596 Mdot
0 0 0 setrgbcolor
0.01171 setlinewidth
0.48934 0.48619 Mdot
0 0 0 setrgbcolor
0.01897 setlinewidth
0.55613 0.4855 Mdot
0 0 0 setrgbcolor
0.01427 setlinewidth
0.56232 0.49012 Mdot
0 0 0 setrgbcolor
0.00908 setlinewidth
0.57392 0.50167 Mdot
0 0 0 setrgbcolor
0.01739 setlinewidth
0.5819 0.51873 Mdot
0 0 0 setrgbcolor
0.01979 setlinewidth
0.58387 0.54316 Mdot
0 0 0 setrgbcolor
0.01287 setlinewidth
0.46414 0.55471 Mdot
0 0 0 setrgbcolor
0.01004 setlinewidth
0.52956 0.47284 Mdot
0 0 0 setrgbcolor
0.01922 setlinewidth
0.52457 0.47249 Mdot
0 0 0 setrgbcolor
0.01002 setlinewidth
0.54376 0.47542 Mdot
0 0 0 setrgbcolor
0.00839 setlinewidth
0.49754 0.59341 Mdot
0 0 0 setrgbcolor
0.00658 setlinewidth
0.5258 0.47174 Mdot
0 0 0 setrgbcolor
0.01031 setlinewidth
0.52999 0.47193 Mdot
0 0 0 setrgbcolor
0.006 setlinewidth
0.52275 0.47149 Mdot
0 0 0 setrgbcolor
0.01387 setlinewidth
0.49488 0.47799 Mdot
0 0 0 setrgbcolor
0.01099 setlinewidth
0.4838 0.48474 Mdot
0 0 0 setrgbcolor
0.00663 setlinewidth
0.49985 0.47552 Mdot
0 0 0 setrgbcolor
0.00533 setlinewidth
0.51811 0.4712 Mdot
0 0 0 setrgbcolor
0.01137 setlinewidth
0.52361 0.471 Mdot
0 0 0 setrgbcolor
0.01776 setlinewidth
0.51294 0.47157 Mdot
0 0 0 setrgbcolor
0.01734 setlinewidth
0.52829 0.47034 Mdot
0 0 0 setrgbcolor
0.01036 setlinewidth
0.58892 0.54171 Mdot
0 0 0 setrgbcolor
0.01425 setlinewidth
0.45873 0.55115 Mdot
0 0 0 setrgbcolor
0.014 setlinewidth
0.52267 0.46907 Mdot
0 0 0 setrgbcolor
0.00698 setlinewidth
0.52425 0.46906 Mdot
0 0 0 setrgbcolor
0.01393 setlinewidth
0.51832 0.46795 Mdot
0 0 0 setrgbcolor
0.009 setlinewidth
0.52141 0.46765 Mdot
0 0 0 setrgbcolor
0.0107 setlinewidth
0.45647 0.55244 Mdot
0 0 0 setrgbcolor
0.01213 setlinewidth
0.52512 0.46647 Mdot
0 0 0 setrgbcolor
0.01056 setlinewidth
0.47492 0.58536 Mdot
0 0 0 setrgbcolor
0.0061 setlinewidth
0.55772 0.47426 Mdot
0 0 0 setrgbcolor
0.01739 setlinewidth
0.47693 0.58847 Mdot
0 0 0 setrgbcolor
0.01553 setlinewidth
0.59046 0.55573 Mdot
0 0 0 setrgbcolor
0.00812 setlinewidth
0.58422 0.57023 Mdot
0 0 0 setrgbcolor
0.0136 setlinewidth
0.50556 0.46715 Mdot
0 0 0 setrgbcolor
0.01947 setlinewidth
0.5909 0.51626 Mdot
0 0 0 setrgbcolor
0.01419 setlinewidth
0.48992 0.47277 Mdot
0 0 0 setrgbcolor
0.01657 setlinewidth
0.58115 0.576 Mdot
0 0 0 setrgbcolor
0.01283 setlinewidth
0.4779 0.4807 Mdot
0 0 0 setrgbcolor
0.00815 setlinewidth
0.58342 0.57316 Mdot
0 0 0 setrgbcolor
0.00774 setlinewidth
0.49571 0.4691 Mdot
0 0 0 setrgbcolor
0.00685 setlinewidth
0.47017 0.48672 Mdot
0 0 0 setrgbcolor
0.00599 setlinewidth
0.47316 0.48294 Mdot
0 0 0 setrgbcolor
0.01453 setlinewidth
0.45537 0.56236 Mdot
0 0 0 setrgbcolor
0.00592 setlinewidth
0.52051 0.60864 Mdot
0 0 0 setrgbcolor
0.01849 setlinewidth
0.46511 0.49034 Mdot
0 0 0 setrgbcolor
0.01732 setlinewidth
0.45343 0.55863 Mdot
0 0 0 setrgbcolor
0.00659 setlinewidth
0.48366 0.59776 Mdot
0 0 0 setrgbcolor
0.00584 setlinewidth
0.59509 0.51658 Mdot
0 0 0 setrgbcolor
0.0137 setlinewidth
0.57273 0.59082 Mdot
0 0 0 setrgbcolor
0.00674 setlinewidth
0.58917 0.49993 Mdot
0 0 0 setrgbcolor
0.01665 setlinewidth
0.51252 0.60959 Mdot
0 0 0 setrgbcolor
0.01674 setlinewidth
0.53511 0.46131 Mdot
0 0 0 setrgbcolor
0.00965 setlinewidth
0.44945 0.5521 Mdot
0 0 0 setrgbcolor
0.00834 setlinewidth
0.5678 0.4741 Mdot
0 0 0 setrgbcolor
0.01309 setlinewidth
0.44722 0.53336 Mdot
0 0 0 setrgbcolor
0.01294 setlinewidth
0.53713 0.61045 Mdot
0 0 0 setrgbcolor
0.01652 setlinewidth
0.45406 0.50248 Mdot
0 0 0 setrgbcolor
0.0192 setlinewidth
0.54057 0.46042 Mdot
0 0 0 setrgbcolor
0.00828 setlinewidth
0.55513 0.46471 Mdot
0 0 0 setrgbcolor
0.01625 setlinewidth
0.49226 0.60675 Mdot
0 0 0 setrgbcolor
0.01797 setlinewidth
0.53949 0.61157 Mdot
0 0 0 setrgbcolor
0.01438 setlinewidth
0.52981 0.45764 Mdot
0 0 0 setrgbcolor
0.00521 setlinewidth
0.53917 0.45859 Mdot
0 0 0 setrgbcolor
0.01084 setlinewidth
0.46353 0.48431 Mdot
0 0 0 setrgbcolor
0.0194 setlinewidth
0.56254 0.46721 Mdot
0 0 0 setrgbcolor
0.01504 setlinewidth
0.51749 0.45657 Mdot
0 0 0 setrgbcolor
0.01062 setlinewidth
0.6001 0.55341 Mdot
0 0 0 setrgbcolor
0.00945 setlinewidth
0.58103 0.48129 Mdot
0 0 0 setrgbcolor
0.01748 setlinewidth
0.59358 0.49785 Mdot
0 0 0 setrgbcolor
0.00582 setlinewidth
0.52174 0.45534 Mdot
0 0 0 setrgbcolor
0.01749 setlinewidth
0.52149 0.45534 Mdot
0 0 0 setrgbcolor
0.01156 setlinewidth
0.44841 0.56425 Mdot
0 0 0 setrgbcolor
0.01752 setlinewidth
0.52677 0.45507 Mdot
0 0 0 setrgbcolor
0.01764 setlinewidth
0.45406 0.57662 Mdot
0 0 0 setrgbcolor
0.01504 setlinewidth
0.44741 0.50804 Mdot
0 0 0 setrgbcolor
0.00792 setlinewidth
0.53163 0.45533 Mdot
0 0 0 setrgbcolor
0.00639 setlinewidth
0.44372 0.52116 Mdot
0 0 0 setrgbcolor
0.01914 setlinewidth
0.44282 0.52755 Mdot
0 0 0 setrgbcolor
0.00793 setlinewidth
0.46871 0.47576 Mdot
0 0 0 setrgbcolor
0.01307 setlinewidth
0.54567 0.45771 Mdot
0 0 0 setrgbcolor
0.01089 setlinewidth
0.52246 0.45447 Mdot
0 0 0 setrgbcolor
0.0149 setlinewidth
0.50788 0.61506 Mdot
0 0 0 setrgbcolor
0.01614 setlinewidth
0.53954 0.45578 Mdot
0 0 0 setrgbcolor
0.00524 setlinewidth
0.55978 0.60817 Mdot
0 0 0 setrgbcolor
0.01333 setlinewidth
0.51619 0.61661 Mdot
0 0 0 setrgbcolor
0.01642 setlinewidth
0.44125 0.53398 Mdot
0 0 0 setrgbcolor
0.0137 setlinewidth
0.51409 0.61671 Mdot
0 0 0 setrgbcolor
0.00604 setlinewidth
0.59738 0.50091 Mdot
0 0 0 setrgbcolor
0.00957 setlinewidth
0.52119 0.45339 Mdot
0 0 0 setrgbcolor
0.00958 setlinewidth
0.47686 0.46764 Mdot
0 0 0 setrgbcolor
0.01076 setlinewidth
0.52158 0.61738 Mdot
0 0 0 setrgbcolor
0.0195 setlinewidth
0.48083 0.46499 Mdot
0 0 0 setrgbcolor
0.01715 setlinewidth
0.4448 0.56007 Mdot
0 0 0 setrgbcolor
0.01301 setlinewidth
0.53617 0.61641 Mdot
0 0 0 setrgbcolor
0.01763 setlinewidth
0.59833 0.56827 Mdot
0 0 0 setrgbcolor
0.01262 setlinewidth
0.47054 0.47226 Mdot
0 0 0 setrgbcolor
0.00712 setlinewidth
0.44503 0.56081 Mdot
0 0 0 setrgbcolor
0.01961 setlinewidth
0.53758 0.61614 Mdot
0 0 0 setrgbcolor
0.01633 setlinewidth
0.51948 0.4534 Mdot
0 0 0 setrgbcolor
0.01799 setlinewidth
0.45639 0.58302 Mdot
0 0 0 setrgbcolor
0.0133 setlinewidth
0.60211 0.556 Mdot
0 0 0 setrgbcolor
0.0127 setlinewidth
0.47881 0.60389 Mdot
0 0 0 setrgbcolor
0.00914 setlinewidth
0.54411 0.61342 Mdot
0 0 0 setrgbcolor
0.01859 setlinewidth
0.47123 0.59678 Mdot
0 0 0 setrgbcolor
0.00652 setlinewidth
0.47456 0.59882 Mdot
0 0 0 setrgbcolor
0.00563 setlinewidth
0.48195 0.6037 Mdot
0 0 0 setrgbcolor
0.01642 setlinewidth
0.54144 0.61236 Mdot
0 0 0 setrgbcolor
0.01366 setlinewidth
0.56501 0.46827 Mdot
0 0 0 setrgbcolor
0.01336 setlinewidth
0.56643 0.46928 Mdot
0 0 0 setrgbcolor
0.00615 setlinewidth
0.59405 0.50164 Mdot
0 0 0 setrgbcolor
0.01739 setlinewidth
0.49795 0.4617 Mdot
0 0 0 setrgbcolor
0.01949 setlinewidth
0.47409 0.59581 Mdot
0 0 0 setrgbcolor
0.01977 setlinewidth
0.49906 0.60879 Mdot
0 0 0 setrgbcolor
0.01506 setlinewidth
0.5957 0.51206 Mdot
0 0 0 setrgbcolor
0.01908 setlinewidth
0.47648 0.59564 Mdot
0 0 0 setrgbcolor
0.0107 setlinewidth
0.59819 0.5471 Mdot
0 0 0 setrgbcolor
0.01536 setlinewidth
0.59673 0.55361 Mdot
0 0 0 setrgbcolor
0.01332 setlinewidth
0.5888 0.57285 Mdot
0 0 0 setrgbcolor
0.00989 setlinewidth
0.55983 0.60089 Mdot
0 0 0 setrgbcolor
0.01468 setlinewidth
0.55293 0.46688 Mdot
0 0 0 setrgbcolor
0.00838 setlinewidth
0.52502 0.60988 Mdot
0 0 0 setrgbcolor
0.00893 setlinewidth
0.57786 0.48489 Mdot
0 0 0 setrgbcolor
0.00606 setlinewidth
0.52156 0.60972 Mdot
0 0 0 setrgbcolor
0.01774 setlinewidth
0.49703 0.60481 Mdot
0 0 0 setrgbcolor
0.00757 setlinewidth
0.51288 0.60843 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.53098 0.60778 Mdot
0 0 0 setrgbcolor
0.01065 setlinewidth
0.50572 0.60529 Mdot
0 0 0 setrgbcolor
0.01011 setlinewidth
0.52323 0.6035 Mdot
0 0 0 setrgbcolor
0.01549 setlinewidth
0.52414 0.60328 Mdot
0 0 0 setrgbcolor
0.01401 setlinewidth
0.55675 0.59402 Mdot
0 0 0 setrgbcolor
0.00539 setlinewidth
0.56347 0.4813 Mdot
0 0 0 setrgbcolor
0.01569 setlinewidth
0.50038 0.59832 Mdot
0 0 0 setrgbcolor
0.01035 setlinewidth
0.50863 0.60027 Mdot
0 0 0 setrgbcolor
0.01213 setlinewidth
0.57284 0.49126 Mdot
0 0 0 setrgbcolor
0.01869 setlinewidth
0.52156 0.6018 Mdot
0 0 0 setrgbcolor
0.01281 setlinewidth
0.57105 0.58131 Mdot
0 0 0 setrgbcolor
0.01625 setlinewidth
0.48223 0.58682 Mdot
0 0 0 setrgbcolor
0.00888 setlinewidth
0.49433 0.5943 Mdot
0 0 0 setrgbcolor
0.01296 setlinewidth
0.52991 0.60051 Mdot
0 0 0 setrgbcolor
0.00651 setlinewidth
0.45842 0.52868 Mdot
0 0 0 setrgbcolor
0.00506 setlinewidth
0.52077 0.5998 Mdot
0 0 0 setrgbcolor
0.01049 setlinewidth
0.5264 0.59945 Mdot
0 0 0 setrgbcolor
0.01709 setlinewidth
0.53442 0.59691 Mdot
0 0 0 setrgbcolor
0.00611 setlinewidth
0.49994 0.59258 Mdot
0 0 0 setrgbcolor
0.01526 setlinewidth
0.58206 0.51862 Mdot
0 0 0 setrgbcolor
0.01805 setlinewidth
0.57473 0.50337 Mdot
0 0 0 setrgbcolor
0.01667 setlinewidth
0.47104 0.50706 Mdot
0 0 0 setrgbcolor
0.00611 setlinewidth
0.53434 0.59207 Mdot
0 0 0 setrgbcolor
0.01901 setlinewidth
0.48516 0.57819 Mdot
0 0 0 setrgbcolor
0.01519 setlinewidth
0.48502 0.49289 Mdot
0 0 0 setrgbcolor
0.00913 setlinewidth
0.55824 0.5778 Mdot
0 0 0 setrgbcolor
0.01878 setlinewidth
0.48936 0.57796 Mdot
0 0 0 setrgbcolor
0.01333 setlinewidth
0.53167 0.58852 Mdot
0 0 0 setrgbcolor
0.00565 setlinewidth
0.47072 0.54717 Mdot
0 0 0 setrgbcolor
0.0189 setlinewidth
0.51299 0.58552 Mdot
0 0 0 setrgbcolor
0.00552 setlinewidth
0.48273 0.50465 Mdot
0 0 0 setrgbcolor
0.01588 setlinewidth
0.56641 0.50934 Mdot
0 0 0 setrgbcolor
0.01852 setlinewidth
0.49623 0.57359 Mdot
0 0 0 setrgbcolor
0.01813 setlinewidth
0.49406 0.50035 Mdot
0 0 0 setrgbcolor
0.00935 setlinewidth
0.48507 0.5128 Mdot
0 0 0 setrgbcolor
0.01629 setlinewidth
0.54732 0.56682 Mdot
0 0 0 setrgbcolor
0.00561 setlinewidth
0.49738 0.56498 Mdot
0 0 0 setrgbcolor
0.00725 setlinewidth
0.54557 0.56673 Mdot
0 0 0 setrgbcolor
0.0141 setlinewidth
0.55866 0.54679 Mdot
0 0 0 setrgbcolor
0.01839 setlinewidth
0.48606 0.53122 Mdot
0 0 0 setrgbcolor
0.01806 setlinewidth
0.49789 0.50882 Mdot
1 1 1 setrgbcolor
0.01869 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01874 setlinewidth
0.53687 0.56482 Mdot
0 0 0 setrgbcolor
0.01179 setlinewidth
0.54186 0.53785 Mdot
0 0 0 setrgbcolor
0.01768 setlinewidth
0.50691 0.52563 Mdot
0 0 0 setrgbcolor
0.01914 setlinewidth
0.50696 0.53741 Mdot
0 0 0 setrgbcolor
0.01515 setlinewidth
0.52199 0.52241 Mdot
0 0 0 setrgbcolor
0.01594 setlinewidth
0.51179 0.53749 Mdot
0 0 0 setrgbcolor
0.00959 setlinewidth
0.53044 0.54374 Mdot
0 0 0 setrgbcolor
0.009 setlinewidth
0.51403 0.53749 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01778 setlinewidth
0.51156 0.54003 Mdot
0 0 0 setrgbcolor
0.00926 setlinewidth
0.50588 0.53481 Mdot
0 0 0 setrgbcolor
0.01888 setlinewidth
0.53981 0.52745 Mdot
0 0 0 setrgbcolor
0.01476 setlinewidth
0.54104 0.5283 Mdot
0 0 0 setrgbcolor
0.01763 setlinewidth
0.54187 0.51222 Mdot
0 0 0 setrgbcolor
0.01695 setlinewidth
0.48803 0.54389 Mdot
0 0 0 setrgbcolor
0.00579 setlinewidth
0.56125 0.54312 Mdot
0 0 0 setrgbcolor
0.00934 setlinewidth
0.48911 0.51525 Mdot
1 1 1 setrgbcolor
0.01047 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01268 setlinewidth
0.53945 0.49038 Mdot
0 0 0 setrgbcolor
0.01026 setlinewidth
0.57155 0.52496 Mdot
0 0 0 setrgbcolor
0.00558 setlinewidth
0.51871 0.48163 Mdot
0 0 0 setrgbcolor
0.01424 setlinewidth
0.47698 0.56353 Mdot
0 0 0 setrgbcolor
0.0142 setlinewidth
0.50755 0.48244 Mdot
0 0 0 setrgbcolor
0.01633 setlinewidth
0.51035 0.48166 Mdot
0 0 0 setrgbcolor
0.0113 setlinewidth
0.49248 0.48886 Mdot
0 0 0 setrgbcolor
0.01803 setlinewidth
0.52943 0.59153 Mdot
0 0 0 setrgbcolor
0.01877 setlinewidth
0.57285 0.50565 Mdot
0 0 0 setrgbcolor
0.00737 setlinewidth
0.46989 0.56075 Mdot
0 0 0 setrgbcolor
0.01112 setlinewidth
0.53051 0.47664 Mdot
0 0 0 setrgbcolor
0.01458 setlinewidth
0.53342 0.47695 Mdot
0 0 0 setrgbcolor
0.00523 setlinewidth
0.48561 0.48832 Mdot
0 0 0 setrgbcolor
0.01242 setlinewidth
0.51993 0.47516 Mdot
0 0 0 setrgbcolor
0.01184 setlinewidth
0.5335 0.5952 Mdot
0 0 0 setrgbcolor
0.00883 setlinewidth
0.4958 0.47959 Mdot
0 0 0 setrgbcolor
0.01907 setlinewidth
0.46706 0.56248 Mdot
0 0 0 setrgbcolor
0.01039 setlinewidth
0.52792 0.47302 Mdot
0 0 0 setrgbcolor
0.00698 setlinewidth
0.50038 0.47625 Mdot
0 0 0 setrgbcolor
0.01555 setlinewidth
0.51626 0.59863 Mdot
0 0 0 setrgbcolor
0.01969 setlinewidth
0.51293 0.47007 Mdot
0 0 0 setrgbcolor
0.01926 setlinewidth
0.52531 0.46913 Mdot
0 0 0 setrgbcolor
0.014 setlinewidth
0.57042 0.4884 Mdot
0 0 0 setrgbcolor
0.01939 setlinewidth
0.51818 0.46886 Mdot
0 0 0 setrgbcolor
0.00985 setlinewidth
0.58929 0.52646 Mdot
0 0 0 setrgbcolor
0.00587 setlinewidth
0.49042 0.59375 Mdot
0 0 0 setrgbcolor
0.01901 setlinewidth
0.52306 0.46841 Mdot
0 0 0 setrgbcolor
0.01581 setlinewidth
0.53045 0.4687 Mdot
0 0 0 setrgbcolor
0.00505 setlinewidth
0.52625 0.46818 Mdot
0 0 0 setrgbcolor
0.01923 setlinewidth
0.52373 0.46778 Mdot
0 0 0 setrgbcolor
0.01773 setlinewidth
0.5305 0.4677 Mdot
0 0 0 setrgbcolor
0.0103 setlinewidth
0.47697 0.48522 Mdot
0 0 0 setrgbcolor
0.01491 setlinewidth
0.46976 0.49268 Mdot
0 0 0 setrgbcolor
0.00676 setlinewidth
0.46598 0.57299 Mdot
0 0 0 setrgbcolor
0.00892 setlinewidth
0.49261 0.59669 Mdot
0 0 0 setrgbcolor
0.00737 setlinewidth
0.56023 0.47755 Mdot
0 0 0 setrgbcolor
0.00915 setlinewidth
0.46326 0.56944 Mdot
0 0 0 setrgbcolor
0.01737 setlinewidth
0.58153 0.49876 Mdot
0 0 0 setrgbcolor
0.01057 setlinewidth
0.52816 0.46635 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.52195 0.46596 Mdot
0 0 0 setrgbcolor
0.01082 setlinewidth
0.58168 0.57258 Mdot
0 0 0 setrgbcolor
0.01393 setlinewidth
0.47199 0.48832 Mdot
0 0 0 setrgbcolor
0.00612 setlinewidth
0.52355 0.4657 Mdot
0 0 0 setrgbcolor
0.01542 setlinewidth
0.4879 0.47513 Mdot
0 0 0 setrgbcolor
0.01159 setlinewidth
0.56727 0.48136 Mdot
0 0 0 setrgbcolor
0.01993 setlinewidth
0.46462 0.49725 Mdot
0 0 0 setrgbcolor
0.01855 setlinewidth
0.54518 0.4691 Mdot
0 0 0 setrgbcolor
0.01252 setlinewidth
0.51698 0.46552 Mdot
0 0 0 setrgbcolor
0.00592 setlinewidth
0.52003 0.46471 Mdot
0 0 0 setrgbcolor
0.00881 setlinewidth
0.59401 0.54026 Mdot
0 0 0 setrgbcolor
0.01591 setlinewidth
0.503 0.46681 Mdot
0 0 0 setrgbcolor
0.00974 setlinewidth
0.45733 0.56338 Mdot
0 0 0 setrgbcolor
0.01708 setlinewidth
0.45207 0.54442 Mdot
0 0 0 setrgbcolor
0.01733 setlinewidth
0.49288 0.47043 Mdot
0 0 0 setrgbcolor
0.01259 setlinewidth
0.58071 0.49158 Mdot
0 0 0 setrgbcolor
0.01966 setlinewidth
0.52325 0.46293 Mdot
0 0 0 setrgbcolor
0.0196 setlinewidth
0.5957 0.53658 Mdot
0 0 0 setrgbcolor
0.01319 setlinewidth
0.45394 0.51158 Mdot
0 0 0 setrgbcolor
0.00576 setlinewidth
0.59153 0.50811 Mdot
0 0 0 setrgbcolor
0.00929 setlinewidth
0.49949 0.60543 Mdot
0 0 0 setrgbcolor
0.01879 setlinewidth
0.59731 0.53332 Mdot
0 0 0 setrgbcolor
0.01508 setlinewidth
0.45949 0.49147 Mdot
0 0 0 setrgbcolor
0.01543 setlinewidth
0.55725 0.4658 Mdot
0 0 0 setrgbcolor
0.0117 setlinewidth
0.53876 0.61132 Mdot
0 0 0 setrgbcolor
0.00912 setlinewidth
0.60103 0.53112 Mdot
0 0 0 setrgbcolor
0.0085 setlinewidth
0.53004 0.61354 Mdot
0 0 0 setrgbcolor
0.00722 setlinewidth
0.45521 0.57628 Mdot
0 0 0 setrgbcolor
0.01222 setlinewidth
0.53026 0.45612 Mdot
0 0 0 setrgbcolor
0.00509 setlinewidth
0.4453 0.51854 Mdot
0 0 0 setrgbcolor
0.01736 setlinewidth
0.44342 0.53263 Mdot
0 0 0 setrgbcolor
0.01369 setlinewidth
0.44347 0.53935 Mdot
0 0 0 setrgbcolor
0.01279 setlinewidth
0.50756 0.61365 Mdot
0 0 0 setrgbcolor
0.01051 setlinewidth
0.46241 0.58823 Mdot
0 0 0 setrgbcolor
0.01762 setlinewidth
0.59927 0.56175 Mdot
0 0 0 setrgbcolor
0.00694 setlinewidth
0.59683 0.56825 Mdot
0 0 0 setrgbcolor
0.0198 setlinewidth
0.59777 0.50431 Mdot
0 0 0 setrgbcolor
0.00751 setlinewidth
0.60346 0.54564 Mdot
0 0 0 setrgbcolor
0.00736 setlinewidth
0.59861 0.56495 Mdot
0 0 0 setrgbcolor
0.01384 setlinewidth
0.46152 0.48197 Mdot
0 0 0 setrgbcolor
0.01732 setlinewidth
0.53469 0.45437 Mdot
0 0 0 setrgbcolor
0.00826 setlinewidth
0.55457 0.6109 Mdot
0 0 0 setrgbcolor
0.00537 setlinewidth
0.52268 0.45328 Mdot
0 0 0 setrgbcolor
0.01128 setlinewidth
0.50933 0.45421 Mdot
0 0 0 setrgbcolor
0.00742 setlinewidth
0.58902 0.58511 Mdot
0 0 0 setrgbcolor
0.01777 setlinewidth
0.56523 0.46416 Mdot
0 0 0 setrgbcolor
0.01517 setlinewidth
0.44103 0.54635 Mdot
0 0 0 setrgbcolor
0.01694 setlinewidth
0.53207 0.45277 Mdot
0 0 0 setrgbcolor
0.01291 setlinewidth
0.54985 0.4565 Mdot
0 0 0 setrgbcolor
0.00821 setlinewidth
0.55625 0.6118 Mdot
0 0 0 setrgbcolor
0.01279 setlinewidth
0.59163 0.48765 Mdot
0 0 0 setrgbcolor
0.01904 setlinewidth
0.60058 0.5041 Mdot
0 0 0 setrgbcolor
0.00996 setlinewidth
0.51235 0.45235 Mdot
0 0 0 setrgbcolor
0.01557 setlinewidth
0.51261 0.45231 Mdot
0 0 0 setrgbcolor
0.01502 setlinewidth
0.44756 0.57277 Mdot
0 0 0 setrgbcolor
0.0199 setlinewidth
0.51735 0.45123 Mdot
0 0 0 setrgbcolor
0.01137 setlinewidth
0.55707 0.45796 Mdot
0 0 0 setrgbcolor
0.01735 setlinewidth
0.52221 0.45072 Mdot
0 0 0 setrgbcolor
0.01385 setlinewidth
0.51231 0.45135 Mdot
0 0 0 setrgbcolor
0.00803 setlinewidth
0.46626 0.47244 Mdot
0 0 0 setrgbcolor
0.0112 setlinewidth
0.52179 0.62023 Mdot
0 0 0 setrgbcolor
0.01277 setlinewidth
0.4471 0.57356 Mdot
0 0 0 setrgbcolor
0.00885 setlinewidth
0.46945 0.4691 Mdot
0 0 0 setrgbcolor
0.01852 setlinewidth
0.53646 0.45094 Mdot
0 0 0 setrgbcolor
0.0162 setlinewidth
0.57785 0.46967 Mdot
0 0 0 setrgbcolor
0.01277 setlinewidth
0.45924 0.47831 Mdot
0 0 0 setrgbcolor
0.01647 setlinewidth
0.52986 0.6207 Mdot
0 0 0 setrgbcolor
0.01219 setlinewidth
0.5294 0.44996 Mdot
0 0 0 setrgbcolor
0.01866 setlinewidth
0.46123 0.59484 Mdot
0 0 0 setrgbcolor
0.01124 setlinewidth
0.52711 0.62115 Mdot
0 0 0 setrgbcolor
0.00894 setlinewidth
0.50889 0.45057 Mdot
0 0 0 setrgbcolor
0.01102 setlinewidth
0.60882 0.54205 Mdot
0 0 0 setrgbcolor
0.01563 setlinewidth
0.59285 0.48499 Mdot
0 0 0 setrgbcolor
0.01901 setlinewidth
0.53424 0.62081 Mdot
0 0 0 setrgbcolor
0.0107 setlinewidth
0.57316 0.60555 Mdot
0 0 0 setrgbcolor
0.01565 setlinewidth
0.48605 0.61323 Mdot
0 0 0 setrgbcolor
0.01633 setlinewidth
0.50529 0.45099 Mdot
0 0 0 setrgbcolor
0.01229 setlinewidth
0.54852 0.61773 Mdot
0 0 0 setrgbcolor
0.00994 setlinewidth
0.54902 0.61732 Mdot
0 0 0 setrgbcolor
0.01864 setlinewidth
0.47576 0.60709 Mdot
0 0 0 setrgbcolor
0.0183 setlinewidth
0.59452 0.48777 Mdot
0 0 0 setrgbcolor
0.01219 setlinewidth
0.47896 0.60876 Mdot
0 0 0 setrgbcolor
0.00822 setlinewidth
0.48706 0.61274 Mdot
0 0 0 setrgbcolor
0.01175 setlinewidth
0.60461 0.55823 Mdot
0 0 0 setrgbcolor
0.01689 setlinewidth
0.47651 0.60583 Mdot
0 0 0 setrgbcolor
0.00639 setlinewidth
0.55282 0.61373 Mdot
0 0 0 setrgbcolor
0.01409 setlinewidth
0.48011 0.46338 Mdot
0 0 0 setrgbcolor
0.01054 setlinewidth
0.47798 0.60538 Mdot
0 0 0 setrgbcolor
0.01441 setlinewidth
0.50341 0.61568 Mdot
0 0 0 setrgbcolor
0.01765 setlinewidth
0.60484 0.54493 Mdot
0 0 0 setrgbcolor
0.0139 setlinewidth
0.54837 0.61313 Mdot
0 0 0 setrgbcolor
0.00561 setlinewidth
0.55021 0.45931 Mdot
0 0 0 setrgbcolor
0.00806 setlinewidth
0.55177 0.46015 Mdot
0 0 0 setrgbcolor
0.00689 setlinewidth
0.49918 0.61196 Mdot
0 0 0 setrgbcolor
0.00714 setlinewidth
0.51565 0.61344 Mdot
0 0 0 setrgbcolor
0.01864 setlinewidth
0.52495 0.61349 Mdot
0 0 0 setrgbcolor
0.01479 setlinewidth
0.52857 0.61315 Mdot
0 0 0 setrgbcolor
0.00551 setlinewidth
0.44551 0.53916 Mdot
0 0 0 setrgbcolor
0.00719 setlinewidth
0.50719 0.61127 Mdot
0 0 0 setrgbcolor
0.01381 setlinewidth
0.58485 0.48952 Mdot
0 0 0 setrgbcolor
0.01729 setlinewidth
0.53511 0.46001 Mdot
0 0 0 setrgbcolor
0.01887 setlinewidth
0.5336 0.61015 Mdot
0 0 0 setrgbcolor
0.00858 setlinewidth
0.47853 0.59571 Mdot
0 0 0 setrgbcolor
0.01269 setlinewidth
0.56307 0.59866 Mdot
0 0 0 setrgbcolor
0.01899 setlinewidth
0.49899 0.60495 Mdot
0 0 0 setrgbcolor
0.00527 setlinewidth
0.49186 0.60169 Mdot
0 0 0 setrgbcolor
0.01397 setlinewidth
0.56333 0.47477 Mdot
0 0 0 setrgbcolor
0.0106 setlinewidth
0.58679 0.50026 Mdot
0 0 0 setrgbcolor
0.01456 setlinewidth
0.45349 0.515 Mdot
0 0 0 setrgbcolor
0.01495 setlinewidth
0.50754 0.60578 Mdot
0 0 0 setrgbcolor
0.01344 setlinewidth
0.5888 0.56499 Mdot
0 0 0 setrgbcolor
0.01483 setlinewidth
0.52337 0.60697 Mdot
0 0 0 setrgbcolor
0.00763 setlinewidth
0.59468 0.53657 Mdot
0 0 0 setrgbcolor
0.01131 setlinewidth
0.59411 0.54362 Mdot
0 0 0 setrgbcolor
0.01874 setlinewidth
0.52421 0.60661 Mdot
0 0 0 setrgbcolor
0.01047 setlinewidth
0.52091 0.60549 Mdot
0 0 0 setrgbcolor
0.00591 setlinewidth
0.49628 0.59916 Mdot
0 0 0 setrgbcolor
0.00667 setlinewidth
0.46493 0.4982 Mdot
0 0 0 setrgbcolor
0.01819 setlinewidth
0.51924 0.60356 Mdot
0 0 0 setrgbcolor
0.00656 setlinewidth
0.45817 0.5566 Mdot
0 0 0 setrgbcolor
0.00554 setlinewidth
0.47814 0.5865 Mdot
0 0 0 setrgbcolor
0.01478 setlinewidth
0.52895 0.60294 Mdot
0 0 0 setrgbcolor
0.00674 setlinewidth
0.52485 0.60238 Mdot
0 0 0 setrgbcolor
0.01868 setlinewidth
0.54545 0.47351 Mdot
0 0 0 setrgbcolor
0.01012 setlinewidth
0.55601 0.59216 Mdot
0 0 0 setrgbcolor
0.00503 setlinewidth
0.48179 0.58568 Mdot
0 0 0 setrgbcolor
0.01406 setlinewidth
0.46327 0.51081 Mdot
0 0 0 setrgbcolor
0.0085 setlinewidth
0.53223 0.59859 Mdot
0 0 0 setrgbcolor
0.0075 setlinewidth
0.5563 0.48242 Mdot
0 0 0 setrgbcolor
0.01598 setlinewidth
0.56838 0.57678 Mdot
0 0 0 setrgbcolor
0.01836 setlinewidth
0.4659 0.51895 Mdot
0 0 0 setrgbcolor
0.01198 setlinewidth
0.53032 0.59364 Mdot
0 0 0 setrgbcolor
0.00792 setlinewidth
0.47325 0.50464 Mdot
0 0 0 setrgbcolor
0.00653 setlinewidth
0.48681 0.58022 Mdot
0 0 0 setrgbcolor
0.01745 setlinewidth
0.50633 0.59008 Mdot
0 0 0 setrgbcolor
0.01226 setlinewidth
0.52628 0.5904 Mdot
0 0 0 setrgbcolor
0.00805 setlinewidth
0.46888 0.53793 Mdot
0 0 0 setrgbcolor
0.0126 setlinewidth
0.55863 0.49488 Mdot
0 0 0 setrgbcolor
0.01071 setlinewidth
0.56866 0.50965 Mdot
0 0 0 setrgbcolor
0.00506 setlinewidth
0.4857 0.5712 Mdot
0 0 0 setrgbcolor
0.01037 setlinewidth
0.47733 0.5129 Mdot
0 0 0 setrgbcolor
0.013 setlinewidth
0.55204 0.57524 Mdot
1 1 1 setrgbcolor
0.01047 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.00946 setlinewidth
0.54902 0.50258 Mdot
0 0 0 setrgbcolor
0.01839 setlinewidth
0.48769 0.52904 Mdot
0 0 0 setrgbcolor
0.01986 setlinewidth
0.48942 0.54127 Mdot
0 0 0 setrgbcolor
0.00914 setlinewidth
0.53684 0.56561 Mdot
0 0 0 setrgbcolor
0.01641 setlinewidth
0.53492 0.56579 Mdot
0 0 0 setrgbcolor
0.01885 setlinewidth
0.52512 0.56515 Mdot
0 0 0 setrgbcolor
0.01073 setlinewidth
0.49416 0.54063 Mdot
0 0 0 setrgbcolor
0.0174 setlinewidth
0.49637 0.54029 Mdot
0 0 0 setrgbcolor
0.01905 setlinewidth
0.50224 0.52339 Mdot
0 0 0 setrgbcolor
0.01719 setlinewidth
0.5451 0.543 Mdot
0 0 0 setrgbcolor
0.00647 setlinewidth
0.51407 0.54427 Mdot
0 0 0 setrgbcolor
0.01935 setlinewidth
0.52511 0.53637 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01651 setlinewidth
0.52244 0.53617 Mdot
0 0 0 setrgbcolor
0.0103 setlinewidth
0.52918 0.54069 Mdot
0 0 0 setrgbcolor
0.01533 setlinewidth
0.50447 0.54838 Mdot
0 0 0 setrgbcolor
0.01624 setlinewidth
0.50084 0.51863 Mdot
0 0 0 setrgbcolor
0.00583 setlinewidth
0.55578 0.52332 Mdot
0 0 0 setrgbcolor
0.01225 setlinewidth
0.55714 0.52401 Mdot
0 0 0 setrgbcolor
0.00947 setlinewidth
0.55485 0.50722 Mdot
0 0 0 setrgbcolor
0.01466 setlinewidth
0.49398 0.57052 Mdot
1 1 1 setrgbcolor
0.0168 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01585 setlinewidth
0.48552 0.56877 Mdot
0 0 0 setrgbcolor
0.01201 setlinewidth
0.49796 0.491 Mdot
0 0 0 setrgbcolor
0.00515 setlinewidth
0.48225 0.57103 Mdot
0 0 0 setrgbcolor
0.0152 setlinewidth
0.51231 0.48197 Mdot
0 0 0 setrgbcolor
0.01688 setlinewidth
0.49009 0.49158 Mdot
0 0 0 setrgbcolor
0.01092 setlinewidth
0.51502 0.48071 Mdot
0 0 0 setrgbcolor
0.01047 setlinewidth
0.57863 0.53643 Mdot
0 0 0 setrgbcolor
0.01401 setlinewidth
0.5471 0.48505 Mdot
0 0 0 setrgbcolor
0.01018 setlinewidth
0.52372 0.47934 Mdot
0 0 0 setrgbcolor
0.00598 setlinewidth
0.49864 0.48098 Mdot
0 0 0 setrgbcolor
0.00511 setlinewidth
0.50248 0.47681 Mdot
0 0 0 setrgbcolor
0.00739 setlinewidth
0.47288 0.4987 Mdot
0 0 0 setrgbcolor
0.01444 setlinewidth
0.48127 0.58215 Mdot
0 0 0 setrgbcolor
0.011 setlinewidth
0.47786 0.5789 Mdot
0 0 0 setrgbcolor
0.00593 setlinewidth
0.52279 0.47252 Mdot
0 0 0 setrgbcolor
0.01399 setlinewidth
0.55105 0.59178 Mdot
0 0 0 setrgbcolor
0.00882 setlinewidth
0.46799 0.50425 Mdot
0 0 0 setrgbcolor
0.01682 setlinewidth
0.47904 0.48987 Mdot
0 0 0 setrgbcolor
0.01688 setlinewidth
0.534 0.47235 Mdot
0 0 0 setrgbcolor
0.0136 setlinewidth
0.46202 0.55483 Mdot
0 0 0 setrgbcolor
0.01183 setlinewidth
0.47413 0.49388 Mdot
0 0 0 setrgbcolor
0.01003 setlinewidth
0.53698 0.47221 Mdot
0 0 0 setrgbcolor
0.01398 setlinewidth
0.58507 0.516 Mdot
0 0 0 setrgbcolor
0.01931 setlinewidth
0.47022 0.57358 Mdot
0 0 0 setrgbcolor
0.0074 setlinewidth
0.5095 0.59999 Mdot
0 0 0 setrgbcolor
0.01713 setlinewidth
0.45842 0.52075 Mdot
0 0 0 setrgbcolor
0.00779 setlinewidth
0.53011 0.46905 Mdot
0 0 0 setrgbcolor
0.01402 setlinewidth
0.53727 0.6012 Mdot
0 0 0 setrgbcolor
0.01939 setlinewidth
0.48807 0.47775 Mdot
0 0 0 setrgbcolor
0.01069 setlinewidth
0.51359 0.46846 Mdot
0 0 0 setrgbcolor
0.01166 setlinewidth
0.55495 0.59506 Mdot
0 0 0 setrgbcolor
0.0086 setlinewidth
0.51174 0.60275 Mdot
0 0 0 setrgbcolor
0.01218 setlinewidth
0.51858 0.46637 Mdot
0 0 0 setrgbcolor
0.00547 setlinewidth
0.52597 0.46551 Mdot
0 0 0 setrgbcolor
0.01789 setlinewidth
0.5234 0.46513 Mdot
0 0 0 setrgbcolor
0.00989 setlinewidth
0.49183 0.47215 Mdot
0 0 0 setrgbcolor
0.01755 setlinewidth
0.52382 0.46438 Mdot
0 0 0 setrgbcolor
0.01245 setlinewidth
0.58201 0.49576 Mdot
0 0 0 setrgbcolor
0.00883 setlinewidth
0.52653 0.46438 Mdot
0 0 0 setrgbcolor
0.00929 setlinewidth
0.53093 0.46425 Mdot
0 0 0 setrgbcolor
0.01312 setlinewidth
0.50156 0.46678 Mdot
0 0 0 setrgbcolor
0.01739 setlinewidth
0.53057 0.46321 Mdot
0 0 0 setrgbcolor
0.01068 setlinewidth
0.51592 0.46317 Mdot
0 0 0 setrgbcolor
0.01789 setlinewidth
0.52123 0.46282 Mdot
0 0 0 setrgbcolor
0.00533 setlinewidth
0.52275 0.46229 Mdot
0 0 0 setrgbcolor
0.01272 setlinewidth
0.45938 0.49927 Mdot
0 0 0 setrgbcolor
0.00743 setlinewidth
0.52766 0.46222 Mdot
0 0 0 setrgbcolor
0.00795 setlinewidth
0.51871 0.46186 Mdot
0 0 0 setrgbcolor
0.00932 setlinewidth
0.44821 0.52942 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.4484 0.54422 Mdot
0 0 0 setrgbcolor
0.01491 setlinewidth
0.44947 0.55114 Mdot
0 0 0 setrgbcolor
0.01035 setlinewidth
0.51838 0.61093 Mdot
0 0 0 setrgbcolor
0.01327 setlinewidth
0.52117 0.45952 Mdot
0 0 0 setrgbcolor
0.01269 setlinewidth
0.54525 0.46234 Mdot
0 0 0 setrgbcolor
0.01393 setlinewidth
0.46706 0.58743 Mdot
0 0 0 setrgbcolor
0.01078 setlinewidth
0.57493 0.47831 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.56225 0.46868 Mdot
0 0 0 setrgbcolor
0.00564 setlinewidth
0.56977 0.47154 Mdot
0 0 0 setrgbcolor
0.00631 setlinewidth
0.47549 0.59876 Mdot
0 0 0 setrgbcolor
0.00776 setlinewidth
0.6002 0.51504 Mdot
0 0 0 setrgbcolor
0.01734 setlinewidth
0.45787 0.48931 Mdot
0 0 0 setrgbcolor
0.00983 setlinewidth
0.58734 0.48738 Mdot
0 0 0 setrgbcolor
0.01055 setlinewidth
0.44625 0.55885 Mdot
0 0 0 setrgbcolor
0.019 setlinewidth
0.5988 0.56445 Mdot
0 0 0 setrgbcolor
0.00811 setlinewidth
0.58436 0.48009 Mdot
0 0 0 setrgbcolor
0.01845 setlinewidth
0.52538 0.61848 Mdot
0 0 0 setrgbcolor
0.0125 setlinewidth
0.60602 0.52881 Mdot
0 0 0 setrgbcolor
0.01048 setlinewidth
0.55788 0.61146 Mdot
0 0 0 setrgbcolor
0.01537 setlinewidth
0.5489 0.61506 Mdot
0 0 0 setrgbcolor
0.01306 setlinewidth
0.52442 0.45152 Mdot
0 0 0 setrgbcolor
0.01387 setlinewidth
0.45558 0.58519 Mdot
0 0 0 setrgbcolor
0.00927 setlinewidth
0.5544 0.45714 Mdot
0 0 0 setrgbcolor
0.01409 setlinewidth
0.60671 0.52474 Mdot
0 0 0 setrgbcolor
0.01941 setlinewidth
0.59764 0.49566 Mdot
0 0 0 setrgbcolor
0.00818 setlinewidth
0.50132 0.45305 Mdot
0 0 0 setrgbcolor
0.00808 setlinewidth
0.60731 0.52112 Mdot
0 0 0 setrgbcolor
0.01215 setlinewidth
0.45439 0.58614 Mdot
0 0 0 setrgbcolor
0.01023 setlinewidth
0.45859 0.47892 Mdot
0 0 0 setrgbcolor
0.01261 setlinewidth
0.51486 0.44991 Mdot
0 0 0 setrgbcolor
0.01399 setlinewidth
0.52741 0.44908 Mdot
0 0 0 setrgbcolor
0.00713 setlinewidth
0.4607 0.47501 Mdot
0 0 0 setrgbcolor
0.01964 setlinewidth
0.50305 0.4507 Mdot
0 0 0 setrgbcolor
0.01672 setlinewidth
0.50329 0.45061 Mdot
0 0 0 setrgbcolor
0.00509 setlinewidth
0.45129 0.48617 Mdot
0 0 0 setrgbcolor
0.01381 setlinewidth
0.52363 0.4479 Mdot
0 0 0 setrgbcolor
0.00698 setlinewidth
0.60931 0.51834 Mdot
0 0 0 setrgbcolor
0.01863 setlinewidth
0.50738 0.44877 Mdot
0 0 0 setrgbcolor
0.0182 setlinewidth
0.47061 0.60613 Mdot
0 0 0 setrgbcolor
0.01244 setlinewidth
0.50189 0.44973 Mdot
0 0 0 setrgbcolor
0.00844 setlinewidth
0.57181 0.60888 Mdot
0 0 0 setrgbcolor
0.00549 setlinewidth
0.54217 0.44889 Mdot
0 0 0 setrgbcolor
0.01975 setlinewidth
0.5119 0.44747 Mdot
0 0 0 setrgbcolor
0.00851 setlinewidth
0.55949 0.45433 Mdot
0 0 0 setrgbcolor
0.00582 setlinewidth
0.60035 0.49091 Mdot
0 0 0 setrgbcolor
0.01753 setlinewidth
0.60939 0.55796 Mdot
0 0 0 setrgbcolor
0.00827 setlinewidth
0.61097 0.55077 Mdot
0 0 0 setrgbcolor
0.0143 setlinewidth
0.57263 0.60965 Mdot
0 0 0 setrgbcolor
0.01177 setlinewidth
0.53721 0.62356 Mdot
0 0 0 setrgbcolor
0.00623 setlinewidth
0.61051 0.55425 Mdot
0 0 0 setrgbcolor
0.01711 setlinewidth
0.61257 0.53328 Mdot
0 0 0 setrgbcolor
0.00752 setlinewidth
0.54865 0.44931 Mdot
0 0 0 setrgbcolor
0.00817 setlinewidth
0.49634 0.44961 Mdot
0 0 0 setrgbcolor
0.00612 setlinewidth
0.60278 0.57687 Mdot
0 0 0 setrgbcolor
0.01943 setlinewidth
0.51778 0.4456 Mdot
0 0 0 setrgbcolor
0.01006 setlinewidth
0.52537 0.44545 Mdot
0 0 0 setrgbcolor
0.00936 setlinewidth
0.58967 0.47461 Mdot
0 0 0 setrgbcolor
0.01276 setlinewidth
0.5445 0.62296 Mdot
0 0 0 setrgbcolor
0.01525 setlinewidth
0.60142 0.49037 Mdot
0 0 0 setrgbcolor
0.00513 setlinewidth
0.5412 0.62388 Mdot
0 0 0 setrgbcolor
0.00649 setlinewidth
0.49645 0.62171 Mdot
0 0 0 setrgbcolor
0.00947 setlinewidth
0.49093 0.45076 Mdot
0 0 0 setrgbcolor
0.00842 setlinewidth
0.48386 0.61695 Mdot
0 0 0 setrgbcolor
0.00851 setlinewidth
0.57052 0.45822 Mdot
0 0 0 setrgbcolor
0.01546 setlinewidth
0.54748 0.62256 Mdot
0 0 0 setrgbcolor
0.00873 setlinewidth
0.48671 0.61826 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.49505 0.62126 Mdot
0 0 0 setrgbcolor
0.01526 setlinewidth
0.58722 0.47186 Mdot
0 0 0 setrgbcolor
0.01397 setlinewidth
0.5605 0.61737 Mdot
0 0 0 setrgbcolor
0.01376 setlinewidth
0.48227 0.6157 Mdot
0 0 0 setrgbcolor
0.00981 setlinewidth
0.5847 0.60099 Mdot
0 0 0 setrgbcolor
0.00825 setlinewidth
0.46356 0.4679 Mdot
0 0 0 setrgbcolor
0.01107 setlinewidth
0.61274 0.52904 Mdot
0 0 0 setrgbcolor
0.01573 setlinewidth
0.55997 0.61695 Mdot
0 0 0 setrgbcolor
0.01516 setlinewidth
0.48264 0.61511 Mdot
0 0 0 setrgbcolor
0.01197 setlinewidth
0.43676 0.55174 Mdot
0 0 0 setrgbcolor
0.01776 setlinewidth
0.5095 0.62215 Mdot
0 0 0 setrgbcolor
0.01322 setlinewidth
0.58637 0.47471 Mdot
0 0 0 setrgbcolor
0.00776 setlinewidth
0.56049 0.61288 Mdot
0 0 0 setrgbcolor
0.00592 setlinewidth
0.50316 0.61902 Mdot
0 0 0 setrgbcolor
0.01942 setlinewidth
0.43915 0.52575 Mdot
0 0 0 setrgbcolor
0.01354 setlinewidth
0.60607 0.54701 Mdot
0 0 0 setrgbcolor
0.01333 setlinewidth
0.55434 0.61302 Mdot
0 0 0 setrgbcolor
0.00952 setlinewidth
0.47748 0.60535 Mdot
0 0 0 setrgbcolor
0.01424 setlinewidth
0.53189 0.45252 Mdot
0 0 0 setrgbcolor
0.01864 setlinewidth
0.51921 0.61824 Mdot
0 0 0 setrgbcolor
0.01344 setlinewidth
0.50989 0.61724 Mdot
0 0 0 setrgbcolor
0.01351 setlinewidth
0.53347 0.45314 Mdot
0 0 0 setrgbcolor
0.01598 setlinewidth
0.52856 0.61696 Mdot
0 0 0 setrgbcolor
0.01725 setlinewidth
0.44702 0.50671 Mdot
0 0 0 setrgbcolor
0.01578 setlinewidth
0.53213 0.61609 Mdot
0 0 0 setrgbcolor
0.00991 setlinewidth
0.44892 0.56807 Mdot
0 0 0 setrgbcolor
0.01881 setlinewidth
0.49127 0.60966 Mdot
0 0 0 setrgbcolor
0.01955 setlinewidth
0.4991 0.612 Mdot
0 0 0 setrgbcolor
0.00836 setlinewidth
0.51452 0.45583 Mdot
0 0 0 setrgbcolor
0.00626 setlinewidth
0.60228 0.53319 Mdot
0 0 0 setrgbcolor
0.01152 setlinewidth
0.44614 0.52008 Mdot
0 0 0 setrgbcolor
0.01475 setlinewidth
0.4735 0.59604 Mdot
0 0 0 setrgbcolor
0.01953 setlinewidth
0.53579 0.61231 Mdot
0 0 0 setrgbcolor
0.01775 setlinewidth
0.50739 0.61165 Mdot
0 0 0 setrgbcolor
0.01278 setlinewidth
0.49409 0.60649 Mdot
0 0 0 setrgbcolor
0.01427 setlinewidth
0.4763 0.59472 Mdot
0 0 0 setrgbcolor
0.00799 setlinewidth
0.52352 0.6106 Mdot
0 0 0 setrgbcolor
0.01097 setlinewidth
0.5242 0.61011 Mdot
0 0 0 setrgbcolor
0.00746 setlinewidth
0.4489 0.52816 Mdot
0 0 0 setrgbcolor
0.0168 setlinewidth
0.52034 0.60945 Mdot
0 0 0 setrgbcolor
0.0142 setlinewidth
0.57024 0.47855 Mdot
0 0 0 setrgbcolor
0.01339 setlinewidth
0.56395 0.59601 Mdot
0 0 0 setrgbcolor
0.00598 setlinewidth
0.45391 0.51226 Mdot
0 0 0 setrgbcolor
0.00513 setlinewidth
0.51782 0.60772 Mdot
0 0 0 setrgbcolor
0.01723 setlinewidth
0.54432 0.46672 Mdot
0 0 0 setrgbcolor
0.0067 setlinewidth
0.52749 0.60568 Mdot
0 0 0 setrgbcolor
0.01484 setlinewidth
0.52302 0.6057 Mdot
0 0 0 setrgbcolor
0.01887 setlinewidth
0.45382 0.5474 Mdot
0 0 0 setrgbcolor
0.01871 setlinewidth
0.47896 0.58845 Mdot
0 0 0 setrgbcolor
0.0176 setlinewidth
0.57236 0.48958 Mdot
0 0 0 setrgbcolor
0.01428 setlinewidth
0.52386 0.46844 Mdot
0 0 0 setrgbcolor
0.01597 setlinewidth
0.45797 0.52026 Mdot
0 0 0 setrgbcolor
0.01894 setlinewidth
0.52918 0.60074 Mdot
0 0 0 setrgbcolor
0.01506 setlinewidth
0.58426 0.55701 Mdot
0 0 0 setrgbcolor
0.01482 setlinewidth
0.47543 0.57934 Mdot
0 0 0 setrgbcolor
0.01995 setlinewidth
0.50014 0.59581 Mdot
0 0 0 setrgbcolor
0.01696 setlinewidth
0.58576 0.52636 Mdot
0 0 0 setrgbcolor
0.01361 setlinewidth
0.58624 0.53384 Mdot
0 0 0 setrgbcolor
0.00601 setlinewidth
0.55294 0.59049 Mdot
0 0 0 setrgbcolor
0.00848 setlinewidth
0.52537 0.59595 Mdot
0 0 0 setrgbcolor
0.01361 setlinewidth
0.53555 0.47603 Mdot
0 0 0 setrgbcolor
0.01536 setlinewidth
0.52009 0.59322 Mdot
0 0 0 setrgbcolor
0.0199 setlinewidth
0.56227 0.57266 Mdot
0 0 0 setrgbcolor
0.00803 setlinewidth
0.46902 0.53551 Mdot
1 1 1 setrgbcolor
0.0168 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.00921 setlinewidth
0.47247 0.54793 Mdot
0 0 0 setrgbcolor
0.01153 setlinewidth
0.53819 0.48876 Mdot
0 0 0 setrgbcolor
0.0068 setlinewidth
0.47676 0.54658 Mdot
0 0 0 setrgbcolor
0.01486 setlinewidth
0.47878 0.5459 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.54313 0.57367 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.5505 0.5026 Mdot
0 0 0 setrgbcolor
0.0121 setlinewidth
0.48193 0.52748 Mdot
0 0 0 setrgbcolor
0.01027 setlinewidth
0.52785 0.49843 Mdot
0 0 0 setrgbcolor
0.00766 setlinewidth
0.51196 0.56736 Mdot
0 0 0 setrgbcolor
0.01268 setlinewidth
0.52227 0.56653 Mdot
0 0 0 setrgbcolor
0.017 setlinewidth
0.52425 0.56605 Mdot
0 0 0 setrgbcolor
0.00728 setlinewidth
0.4966 0.54739 Mdot
0 0 0 setrgbcolor
0.0166 setlinewidth
0.50641 0.5375 Mdot
0 0 0 setrgbcolor
0.00725 setlinewidth
0.52848 0.54129 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.0055 setlinewidth
0.52367 0.55039 Mdot
0 0 0 setrgbcolor
0.01674 setlinewidth
0.51513 0.52018 Mdot
0 0 0 setrgbcolor
0.01786 setlinewidth
0.54066 0.53495 Mdot
0 0 0 setrgbcolor
0.01204 setlinewidth
0.54815 0.53862 Mdot
0 0 0 setrgbcolor
0.00617 setlinewidth
0.51445 0.57504 Mdot
0 0 0 setrgbcolor
0.01537 setlinewidth
0.50502 0.57453 Mdot
0 0 0 setrgbcolor
0.01065 setlinewidth
0.50562 0.49221 Mdot
0 0 0 setrgbcolor
0.01914 setlinewidth
0.50148 0.5774 Mdot
0 0 0 setrgbcolor
0.00895 setlinewidth
0.49717 0.49409 Mdot
0 0 0 setrgbcolor
0.01066 setlinewidth
0.57128 0.51655 Mdot
0 0 0 setrgbcolor
0.01107 setlinewidth
0.57269 0.51707 Mdot
0 0 0 setrgbcolor
0.0063 setlinewidth
0.47962 0.50424 Mdot
0 0 0 setrgbcolor
0.0167 setlinewidth
0.47531 0.51073 Mdot
0 0 0 setrgbcolor
0.01651 setlinewidth
0.47683 0.56383 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.51825 0.48063 Mdot
0 0 0 setrgbcolor
0.01098 setlinewidth
0.46757 0.52926 Mdot
0 0 0 setrgbcolor
0.00795 setlinewidth
0.56709 0.5 Mdot
0 0 0 setrgbcolor
0.01791 setlinewidth
0.52069 0.47892 Mdot
0 0 0 setrgbcolor
0.01785 setlinewidth
0.47973 0.49909 Mdot
0 0 0 setrgbcolor
0.00864 setlinewidth
0.48424 0.49418 Mdot
1 1 1 setrgbcolor
0.0137 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00512 setlinewidth
0.50338 0.48185 Mdot
0 0 0 setrgbcolor
0.00657 setlinewidth
0.49673 0.5863 Mdot
0 0 0 setrgbcolor
0.00506 setlinewidth
0.50067 0.58916 Mdot
0 0 0 setrgbcolor
0.01579 setlinewidth
0.4877 0.58197 Mdot
0 0 0 setrgbcolor
0.01057 setlinewidth
0.52919 0.47612 Mdot
0 0 0 setrgbcolor
0.01307 setlinewidth
0.50616 0.47696 Mdot
0 0 0 setrgbcolor
0.01982 setlinewidth
0.4906 0.4803 Mdot
0 0 0 setrgbcolor
0.01869 setlinewidth
0.55394 0.47831 Mdot
0 0 0 setrgbcolor
0.01034 setlinewidth
0.46351 0.50711 Mdot
0 0 0 setrgbcolor
0.00707 setlinewidth
0.52596 0.46928 Mdot
0 0 0 setrgbcolor
0.00941 setlinewidth
0.45632 0.53993 Mdot
0 0 0 setrgbcolor
0.01098 setlinewidth
0.45873 0.55515 Mdot
0 0 0 setrgbcolor
0.00823 setlinewidth
0.46083 0.56211 Mdot
0 0 0 setrgbcolor
0.01032 setlinewidth
0.49277 0.47397 Mdot
0 0 0 setrgbcolor
0.01267 setlinewidth
0.5313 0.60355 Mdot
0 0 0 setrgbcolor
0.0142 setlinewidth
0.51497 0.46662 Mdot
0 0 0 setrgbcolor
0.01673 setlinewidth
0.5371 0.46732 Mdot
0 0 0 setrgbcolor
0.01277 setlinewidth
0.53997 0.4667 Mdot
0 0 0 setrgbcolor
0.01392 setlinewidth
0.53204 0.46457 Mdot
0 0 0 setrgbcolor
0.00658 setlinewidth
0.53348 0.60613 Mdot
0 0 0 setrgbcolor
0.0183 setlinewidth
0.59425 0.52685 Mdot
0 0 0 setrgbcolor
0.01832 setlinewidth
0.51933 0.46368 Mdot
0 0 0 setrgbcolor
0.01915 setlinewidth
0.50143 0.46688 Mdot
0 0 0 setrgbcolor
0.01747 setlinewidth
0.48363 0.59697 Mdot
0 0 0 setrgbcolor
0.01372 setlinewidth
0.57312 0.58884 Mdot
0 0 0 setrgbcolor
0.01704 setlinewidth
0.52376 0.46164 Mdot
0 0 0 setrgbcolor
0.01075 setlinewidth
0.52651 0.46161 Mdot
0 0 0 setrgbcolor
0.01755 setlinewidth
0.52387 0.4608 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.5595 0.60077 Mdot
0 0 0 setrgbcolor
0.01643 setlinewidth
0.51524 0.46086 Mdot
0 0 0 setrgbcolor
0.0137 setlinewidth
0.45698 0.57067 Mdot
0 0 0 setrgbcolor
0.01636 setlinewidth
0.5266 0.46037 Mdot
0 0 0 setrgbcolor
0.00519 setlinewidth
0.45827 0.49724 Mdot
0 0 0 setrgbcolor
0.01793 setlinewidth
0.52057 0.45963 Mdot
0 0 0 setrgbcolor
0.00762 setlinewidth
0.53093 0.45953 Mdot
0 0 0 setrgbcolor
0.01821 setlinewidth
0.51756 0.45907 Mdot
0 0 0 setrgbcolor
0.01478 setlinewidth
0.52189 0.45885 Mdot
0 0 0 setrgbcolor
0.00928 setlinewidth
0.53013 0.45854 Mdot
0 0 0 setrgbcolor
0.00571 setlinewidth
0.52681 0.45799 Mdot
0 0 0 setrgbcolor
0.01871 setlinewidth
0.57659 0.59177 Mdot
0 0 0 setrgbcolor
0.01699 setlinewidth
0.49287 0.60753 Mdot
0 0 0 setrgbcolor
0.00694 setlinewidth
0.59595 0.50465 Mdot
0 0 0 setrgbcolor
0.01781 setlinewidth
0.51902 0.4563 Mdot
0 0 0 setrgbcolor
0.00845 setlinewidth
0.53945 0.61382 Mdot
0 0 0 setrgbcolor
0.01084 setlinewidth
0.46873 0.59657 Mdot
0 0 0 setrgbcolor
0.01257 setlinewidth
0.54381 0.45534 Mdot
0 0 0 setrgbcolor
0.00867 setlinewidth
0.58822 0.48411 Mdot
0 0 0 setrgbcolor
0.01413 setlinewidth
0.46684 0.59779 Mdot
0 0 0 setrgbcolor
0.01907 setlinewidth
0.4546 0.48663 Mdot
0 0 0 setrgbcolor
0.01163 setlinewidth
0.56184 0.45919 Mdot
0 0 0 setrgbcolor
0.01529 setlinewidth
0.44751 0.4953 Mdot
0 0 0 setrgbcolor
0.01896 setlinewidth
0.45541 0.48231 Mdot
0 0 0 setrgbcolor
0.01363 setlinewidth
0.57641 0.46717 Mdot
0 0 0 setrgbcolor
0.01576 setlinewidth
0.49401 0.45307 Mdot
0 0 0 setrgbcolor
0.01647 setlinewidth
0.56936 0.461 Mdot
0 0 0 setrgbcolor
0.01065 setlinewidth
0.51789 0.4477 Mdot
0 0 0 setrgbcolor
0.01038 setlinewidth
0.54485 0.62088 Mdot
0 0 0 setrgbcolor
0.00885 setlinewidth
0.50682 0.44766 Mdot
0 0 0 setrgbcolor
0.01787 setlinewidth
0.49421 0.45044 Mdot
0 0 0 setrgbcolor
0.00617 setlinewidth
0.4843 0.61624 Mdot
0 0 0 setrgbcolor
0.01655 setlinewidth
0.49442 0.45032 Mdot
0 0 0 setrgbcolor
0.01687 setlinewidth
0.58944 0.47472 Mdot
0 0 0 setrgbcolor
0.01204 setlinewidth
0.5491 0.44866 Mdot
0 0 0 setrgbcolor
0.01401 setlinewidth
0.56806 0.61393 Mdot
0 0 0 setrgbcolor
0.01532 setlinewidth
0.60719 0.50156 Mdot
0 0 0 setrgbcolor
0.00659 setlinewidth
0.51908 0.44477 Mdot
0 0 0 setrgbcolor
0.0057 setlinewidth
0.57677 0.60886 Mdot
0 0 0 setrgbcolor
0.00525 setlinewidth
0.49192 0.44969 Mdot
0 0 0 setrgbcolor
0.01492 setlinewidth
0.4975 0.44779 Mdot
0 0 0 setrgbcolor
0.00737 setlinewidth
0.58424 0.46765 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.51429 0.44422 Mdot
0 0 0 setrgbcolor
0.01874 setlinewidth
0.61286 0.55352 Mdot
0 0 0 setrgbcolor
0.00722 setlinewidth
0.50134 0.44575 Mdot
0 0 0 setrgbcolor
0.01905 setlinewidth
0.61384 0.51517 Mdot
0 0 0 setrgbcolor
0.01618 setlinewidth
0.48443 0.4506 Mdot
0 0 0 setrgbcolor
0.01322 setlinewidth
0.59937 0.48186 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.53236 0.44228 Mdot
0 0 0 setrgbcolor
0.01849 setlinewidth
0.61336 0.51083 Mdot
0 0 0 setrgbcolor
0.01109 setlinewidth
0.50535 0.44297 Mdot
0 0 0 setrgbcolor
0.00669 setlinewidth
0.61279 0.50699 Mdot
0 0 0 setrgbcolor
0.01081 setlinewidth
0.51299 0.44158 Mdot
0 0 0 setrgbcolor
0.00699 setlinewidth
0.55061 0.44513 Mdot
0 0 0 setrgbcolor
0.01881 setlinewidth
0.47741 0.45278 Mdot
0 0 0 setrgbcolor
0.00564 setlinewidth
0.55331 0.62481 Mdot
0 0 0 setrgbcolor
0.01386 setlinewidth
0.50961 0.62891 Mdot
0 0 0 setrgbcolor
0.01735 setlinewidth
0.58774 0.60436 Mdot
0 0 0 setrgbcolor
0.00981 setlinewidth
0.49532 0.62585 Mdot
0 0 0 setrgbcolor
0.00912 setlinewidth
0.53757 0.44176 Mdot
0 0 0 setrgbcolor
0.01939 setlinewidth
0.61269 0.5039 Mdot
0 0 0 setrgbcolor
0.00969 setlinewidth
0.49762 0.62686 Mdot
0 0 0 setrgbcolor
0.01175 setlinewidth
0.58755 0.60514 Mdot
0 0 0 setrgbcolor
0.01452 setlinewidth
0.44962 0.47505 Mdot
0 0 0 setrgbcolor
0.01013 setlinewidth
0.55928 0.62325 Mdot
0 0 0 setrgbcolor
0.01899 setlinewidth
0.55559 0.62471 Mdot
0 0 0 setrgbcolor
0.00535 setlinewidth
0.59794 0.4767 Mdot
0 0 0 setrgbcolor
0.01271 setlinewidth
0.50569 0.62884 Mdot
0 0 0 setrgbcolor
0.01239 setlinewidth
0.49129 0.62496 Mdot
0 0 0 setrgbcolor
0.01659 setlinewidth
0.61762 0.54549 Mdot
0 0 0 setrgbcolor
0.01083 setlinewidth
0.61813 0.53772 Mdot
0 0 0 setrgbcolor
0.0081 setlinewidth
0.58288 0.46149 Mdot
0 0 0 setrgbcolor
0.01721 setlinewidth
0.61792 0.54145 Mdot
0 0 0 setrgbcolor
0.01508 setlinewidth
0.6167 0.51916 Mdot
0 0 0 setrgbcolor
0.00671 setlinewidth
0.43309 0.56577 Mdot
0 0 0 setrgbcolor
0.01916 setlinewidth
0.61281 0.56639 Mdot
0 0 0 setrgbcolor
0.01192 setlinewidth
0.56053 0.62254 Mdot
0 0 0 setrgbcolor
0.00907 setlinewidth
0.49044 0.62439 Mdot
0 0 0 setrgbcolor
0.01876 setlinewidth
0.55908 0.44761 Mdot
0 0 0 setrgbcolor
0.01076 setlinewidth
0.59696 0.47611 Mdot
0 0 0 setrgbcolor
0.01507 setlinewidth
0.4293 0.53881 Mdot
0 0 0 setrgbcolor
0.01491 setlinewidth
0.57131 0.61537 Mdot
0 0 0 setrgbcolor
0.01077 setlinewidth
0.57647 0.45926 Mdot
0 0 0 setrgbcolor
0.01165 setlinewidth
0.51713 0.62796 Mdot
0 0 0 setrgbcolor
0.01047 setlinewidth
0.56967 0.61509 Mdot
0 0 0 setrgbcolor
0.0099 setlinewidth
0.59342 0.59471 Mdot
0 0 0 setrgbcolor
0.01108 setlinewidth
0.43275 0.51811 Mdot
0 0 0 setrgbcolor
0.00776 setlinewidth
0.50887 0.62573 Mdot
0 0 0 setrgbcolor
0.00932 setlinewidth
0.44387 0.5811 Mdot
0 0 0 setrgbcolor
0.00686 setlinewidth
0.47941 0.61537 Mdot
0 0 0 setrgbcolor
0.01492 setlinewidth
0.43279 0.5321 Mdot
0 0 0 setrgbcolor
0.00771 setlinewidth
0.61097 0.51508 Mdot
0 0 0 setrgbcolor
0.0066 setlinewidth
0.51375 0.62305 Mdot
0 0 0 setrgbcolor
0.01454 setlinewidth
0.57284 0.4626 Mdot
0 0 0 setrgbcolor
0.01797 setlinewidth
0.49276 0.61794 Mdot
0 0 0 setrgbcolor
0.01219 setlinewidth
0.43547 0.54011 Mdot
0 0 0 setrgbcolor
0.01468 setlinewidth
0.47179 0.60648 Mdot
0 0 0 setrgbcolor
0.01116 setlinewidth
0.511 0.44851 Mdot
0 0 0 setrgbcolor
0.00812 setlinewidth
0.52341 0.62274 Mdot
0 0 0 setrgbcolor
0.01461 setlinewidth
0.5665 0.61101 Mdot
0 0 0 setrgbcolor
0.01837 setlinewidth
0.51249 0.44892 Mdot
0 0 0 setrgbcolor
0.00522 setlinewidth
0.50084 0.61925 Mdot
0 0 0 setrgbcolor
0.01319 setlinewidth
0.43761 0.52297 Mdot
0 0 0 setrgbcolor
0.0164 setlinewidth
0.49242 0.45487 Mdot
0 0 0 setrgbcolor
0.01903 setlinewidth
0.47346 0.60479 Mdot
0 0 0 setrgbcolor
0.01562 setlinewidth
0.53219 0.6201 Mdot
0 0 0 setrgbcolor
0.00933 setlinewidth
0.55887 0.61217 Mdot
0 0 0 setrgbcolor
0.01273 setlinewidth
0.44214 0.5593 Mdot
0 0 0 setrgbcolor
0.01382 setlinewidth
0.49364 0.61437 Mdot
0 0 0 setrgbcolor
0.01722 setlinewidth
0.53545 0.61869 Mdot
0 0 0 setrgbcolor
0.00987 setlinewidth
0.50828 0.61776 Mdot
0 0 0 setrgbcolor
0.01049 setlinewidth
0.44134 0.53072 Mdot
0 0 0 setrgbcolor
0.01651 setlinewidth
0.53735 0.61432 Mdot
0 0 0 setrgbcolor
0.00588 setlinewidth
0.47336 0.59805 Mdot
0 0 0 setrgbcolor
0.01529 setlinewidth
0.52365 0.6144 Mdot
0 0 0 setrgbcolor
0.01382 setlinewidth
0.60198 0.53532 Mdot
0 0 0 setrgbcolor
0.01573 setlinewidth
0.52412 0.6138 Mdot
0 0 0 setrgbcolor
0.0137 setlinewidth
0.5199 0.61369 Mdot
0 0 0 setrgbcolor
0.01841 setlinewidth
0.46745 0.5892 Mdot
0 0 0 setrgbcolor
0.01307 setlinewidth
0.51661 0.6123 Mdot
0 0 0 setrgbcolor
0.01023 setlinewidth
0.52099 0.60949 Mdot
0 0 0 setrgbcolor
0.00639 setlinewidth
0.52172 0.46155 Mdot
0 0 0 setrgbcolor
0.00501 setlinewidth
0.52557 0.6088 Mdot
0 0 0 setrgbcolor
0.00991 setlinewidth
0.49489 0.60265 Mdot
0 0 0 setrgbcolor
0.00634 setlinewidth
0.49992 0.46672 Mdot
0 0 0 setrgbcolor
0.01643 setlinewidth
0.59389 0.52157 Mdot
0 0 0 setrgbcolor
0.01938 setlinewidth
0.45233 0.54497 Mdot
0 0 0 setrgbcolor
0.00615 setlinewidth
0.55062 0.46965 Mdot
0 0 0 setrgbcolor
0.00517 setlinewidth
0.56212 0.5933 Mdot
0 0 0 setrgbcolor
0.00722 setlinewidth
0.4574 0.55732 Mdot
0 0 0 setrgbcolor
0.01803 setlinewidth
0.52539 0.6035 Mdot
0 0 0 setrgbcolor
0.01687 setlinewidth
0.46089 0.55531 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.51974 0.59916 Mdot
0 0 0 setrgbcolor
0.01621 setlinewidth
0.51166 0.47282 Mdot
0 0 0 setrgbcolor
0.00709 setlinewidth
0.46256 0.55432 Mdot
0 0 0 setrgbcolor
0.01702 setlinewidth
0.51345 0.59714 Mdot
0 0 0 setrgbcolor
0.01432 setlinewidth
0.55278 0.48094 Mdot
1 1 1 setrgbcolor
0.0137 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.00585 setlinewidth
0.4625 0.53482 Mdot
0 0 0 setrgbcolor
0.00709 setlinewidth
0.54747 0.58936 Mdot
0 0 0 setrgbcolor
0.01851 setlinewidth
0.57493 0.54961 Mdot
0 0 0 setrgbcolor
0.01691 setlinewidth
0.57139 0.51733 Mdot
0 0 0 setrgbcolor
0.00735 setlinewidth
0.57301 0.52508 Mdot
0 0 0 setrgbcolor
0.01316 setlinewidth
0.51444 0.48578 Mdot
0 0 0 setrgbcolor
0.01707 setlinewidth
0.4792 0.5533 Mdot
0 0 0 setrgbcolor
0.01877 setlinewidth
0.55275 0.56946 Mdot
0 0 0 setrgbcolor
0.01406 setlinewidth
0.4982 0.57169 Mdot
0 0 0 setrgbcolor
0.0177 setlinewidth
0.50406 0.49757 Mdot
0 0 0 setrgbcolor
0.01675 setlinewidth
0.53184 0.57351 Mdot
0 0 0 setrgbcolor
0.01729 setlinewidth
0.52835 0.49829 Mdot
0 0 0 setrgbcolor
0.00723 setlinewidth
0.50832 0.5693 Mdot
0 0 0 setrgbcolor
0.00799 setlinewidth
0.48694 0.54159 Mdot
0 0 0 setrgbcolor
0.01561 setlinewidth
0.51024 0.5685 Mdot
0 0 0 setrgbcolor
0.01078 setlinewidth
0.50967 0.54217 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.00822 setlinewidth
0.53132 0.51946 Mdot
0 0 0 setrgbcolor
0.00645 setlinewidth
0.54471 0.54948 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.55958 0.53085 Mdot
0 0 0 setrgbcolor
0.01196 setlinewidth
0.48644 0.51609 Mdot
0 0 0 setrgbcolor
0.00842 setlinewidth
0.48115 0.53641 Mdot
0 0 0 setrgbcolor
0.01812 setlinewidth
0.52754 0.57745 Mdot
0 0 0 setrgbcolor
0.01922 setlinewidth
0.48983 0.50871 Mdot
0 0 0 setrgbcolor
0.01866 setlinewidth
0.50664 0.49544 Mdot
0 0 0 setrgbcolor
0.01773 setlinewidth
0.53746 0.57655 Mdot
0 0 0 setrgbcolor
0.00981 setlinewidth
0.51517 0.49215 Mdot
0 0 0 setrgbcolor
0.01061 setlinewidth
0.56743 0.53354 Mdot
0 0 0 setrgbcolor
0.01367 setlinewidth
0.49598 0.57068 Mdot
0 0 0 setrgbcolor
0.00966 setlinewidth
0.52391 0.58099 Mdot
0 0 0 setrgbcolor
0.00616 setlinewidth
0.48871 0.50342 Mdot
0 0 0 setrgbcolor
0.00915 setlinewidth
0.49249 0.49764 Mdot
0 0 0 setrgbcolor
0.01315 setlinewidth
0.50908 0.58788 Mdot
0 0 0 setrgbcolor
0.0164 setlinewidth
0.50988 0.48188 Mdot
0 0 0 setrgbcolor
0.00578 setlinewidth
0.47194 0.51433 Mdot
0 0 0 setrgbcolor
0.01981 setlinewidth
0.46952 0.54926 Mdot
0 0 0 setrgbcolor
0.01362 setlinewidth
0.51907 0.59101 Mdot
0 0 0 setrgbcolor
0.00618 setlinewidth
0.47416 0.5646 Mdot
0 0 0 setrgbcolor
0.01637 setlinewidth
0.5251 0.47824 Mdot
0 0 0 setrgbcolor
0.01513 setlinewidth
0.52335 0.59341 Mdot
0 0 0 setrgbcolor
0.00986 setlinewidth
0.47723 0.57147 Mdot
0 0 0 setrgbcolor
0.00579 setlinewidth
0.52707 0.47609 Mdot
0 0 0 setrgbcolor
0.01776 setlinewidth
0.49553 0.48239 Mdot
0 0 0 setrgbcolor
0.01048 setlinewidth
0.51133 0.47642 Mdot
1 1 1 setrgbcolor
0.00661 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00601 setlinewidth
0.5348 0.47186 Mdot
0 0 0 setrgbcolor
0.01773 setlinewidth
0.49584 0.47557 Mdot
0 0 0 setrgbcolor
0.0084 setlinewidth
0.46304 0.50512 Mdot
0 0 0 setrgbcolor
0.0173 setlinewidth
0.47296 0.581 Mdot
0 0 0 setrgbcolor
0.00641 setlinewidth
0.58526 0.50715 Mdot
0 0 0 setrgbcolor
0.01098 setlinewidth
0.58663 0.50747 Mdot
0 0 0 setrgbcolor
0.01219 setlinewidth
0.52924 0.46538 Mdot
0 0 0 setrgbcolor
0.01063 setlinewidth
0.57772 0.49061 Mdot
0 0 0 setrgbcolor
0.0131 setlinewidth
0.51702 0.46443 Mdot
0 0 0 setrgbcolor
0.0138 setlinewidth
0.50274 0.46692 Mdot
0 0 0 setrgbcolor
0.01684 setlinewidth
0.50429 0.60423 Mdot
0 0 0 setrgbcolor
0.00823 setlinewidth
0.55943 0.47024 Mdot
0 0 0 setrgbcolor
0.00691 setlinewidth
0.52041 0.46073 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.53958 0.4616 Mdot
0 0 0 setrgbcolor
0.01032 setlinewidth
0.55478 0.60401 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.53356 0.45959 Mdot
0 0 0 setrgbcolor
0.00571 setlinewidth
0.54212 0.46051 Mdot
0 0 0 setrgbcolor
0.00824 setlinewidth
0.51503 0.45851 Mdot
0 0 0 setrgbcolor
0.01846 setlinewidth
0.52411 0.45793 Mdot
0 0 0 setrgbcolor
0.01555 setlinewidth
0.52687 0.45745 Mdot
0 0 0 setrgbcolor
0.00988 setlinewidth
0.52387 0.45706 Mdot
0 0 0 setrgbcolor
0.01172 setlinewidth
0.55675 0.60642 Mdot
0 0 0 setrgbcolor
0.01336 setlinewidth
0.52001 0.4564 Mdot
0 0 0 setrgbcolor
0.00576 setlinewidth
0.51385 0.61392 Mdot
0 0 0 setrgbcolor
0.01325 setlinewidth
0.52645 0.45618 Mdot
0 0 0 setrgbcolor
0.00662 setlinewidth
0.45487 0.49497 Mdot
0 0 0 setrgbcolor
0.0097 setlinewidth
0.51667 0.45632 Mdot
0 0 0 setrgbcolor
0.01703 setlinewidth
0.48659 0.60619 Mdot
0 0 0 setrgbcolor
0.01436 setlinewidth
0.52102 0.45539 Mdot
0 0 0 setrgbcolor
0.00529 setlinewidth
0.44847 0.50505 Mdot
0 0 0 setrgbcolor
0.00626 setlinewidth
0.5304 0.45463 Mdot
0 0 0 setrgbcolor
0.01419 setlinewidth
0.52562 0.45372 Mdot
0 0 0 setrgbcolor
0.01524 setlinewidth
0.52917 0.45375 Mdot
0 0 0 setrgbcolor
0.01839 setlinewidth
0.45421 0.49046 Mdot
0 0 0 setrgbcolor
0.01891 setlinewidth
0.48407 0.60778 Mdot
0 0 0 setrgbcolor
0.01476 setlinewidth
0.51692 0.45327 Mdot
0 0 0 setrgbcolor
0.00779 setlinewidth
0.58174 0.59708 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.59432 0.58258 Mdot
0 0 0 setrgbcolor
0.01151 setlinewidth
0.60689 0.51455 Mdot
0 0 0 setrgbcolor
0.0106 setlinewidth
0.56163 0.61374 Mdot
0 0 0 setrgbcolor
0.00927 setlinewidth
0.488 0.45418 Mdot
0 0 0 setrgbcolor
0.01523 setlinewidth
0.54082 0.44832 Mdot
0 0 0 setrgbcolor
0.00998 setlinewidth
0.59711 0.58521 Mdot
0 0 0 setrgbcolor
0.01922 setlinewidth
0.51108 0.44477 Mdot
0 0 0 setrgbcolor
0.01725 setlinewidth
0.60318 0.49123 Mdot
0 0 0 setrgbcolor
0.01733 setlinewidth
0.4865 0.45152 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.48667 0.45136 Mdot
0 0 0 setrgbcolor
0.01951 setlinewidth
0.5018 0.62455 Mdot
0 0 0 setrgbcolor
0.00691 setlinewidth
0.49911 0.44658 Mdot
0 0 0 setrgbcolor
0.01996 setlinewidth
0.55873 0.44947 Mdot
0 0 0 setrgbcolor
0.01008 setlinewidth
0.48314 0.45118 Mdot
0 0 0 setrgbcolor
0.01024 setlinewidth
0.59071 0.4711 Mdot
0 0 0 setrgbcolor
0.01273 setlinewidth
0.48844 0.44832 Mdot
0 0 0 setrgbcolor
0.00996 setlinewidth
0.51019 0.44166 Mdot
0 0 0 setrgbcolor
0.01818 setlinewidth
0.56494 0.62057 Mdot
0 0 0 setrgbcolor
0.00672 setlinewidth
0.57442 0.45544 Mdot
0 0 0 setrgbcolor
0.00538 setlinewidth
0.49124 0.44563 Mdot
0 0 0 setrgbcolor
0.00957 setlinewidth
0.56573 0.45019 Mdot
0 0 0 setrgbcolor
0.01579 setlinewidth
0.50463 0.44191 Mdot
0 0 0 setrgbcolor
0.01308 setlinewidth
0.47405 0.45344 Mdot
0 0 0 setrgbcolor
0.01011 setlinewidth
0.54144 0.44077 Mdot
0 0 0 setrgbcolor
0.00614 setlinewidth
0.46578 0.45693 Mdot
0 0 0 setrgbcolor
0.01727 setlinewidth
0.49292 0.44224 Mdot
0 0 0 setrgbcolor
0.01749 setlinewidth
0.43947 0.48444 Mdot
0 0 0 setrgbcolor
0.01967 setlinewidth
0.58638 0.61005 Mdot
0 0 0 setrgbcolor
0.01673 setlinewidth
0.58724 0.46132 Mdot
0 0 0 setrgbcolor
0.01522 setlinewidth
0.52089 0.43706 Mdot
0 0 0 setrgbcolor
0.01473 setlinewidth
0.50006 0.43957 Mdot
0 0 0 setrgbcolor
0.01644 setlinewidth
0.59424 0.60349 Mdot
0 0 0 setrgbcolor
0.00882 setlinewidth
0.57991 0.45485 Mdot
0 0 0 setrgbcolor
0.01649 setlinewidth
0.43514 0.58049 Mdot
0 0 0 setrgbcolor
0.00718 setlinewidth
0.50972 0.63331 Mdot
0 0 0 setrgbcolor
0.00742 setlinewidth
0.60926 0.48656 Mdot
0 0 0 setrgbcolor
0.01806 setlinewidth
0.52497 0.63442 Mdot
0 0 0 setrgbcolor
0.01079 setlinewidth
0.51127 0.6341 Mdot
0 0 0 setrgbcolor
0.00887 setlinewidth
0.53886 0.4371 Mdot
0 0 0 setrgbcolor
0.01833 setlinewidth
0.52431 0.43579 Mdot
0 0 0 setrgbcolor
0.0175 setlinewidth
0.62255 0.54016 Mdot
0 0 0 setrgbcolor
0.00925 setlinewidth
0.59607 0.46735 Mdot
0 0 0 setrgbcolor
0.00962 setlinewidth
0.56916 0.62385 Mdot
0 0 0 setrgbcolor
0.0051 setlinewidth
0.42497 0.55348 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.50328 0.63315 Mdot
0 0 0 setrgbcolor
0.00995 setlinewidth
0.61642 0.49989 Mdot
0 0 0 setrgbcolor
0.0096 setlinewidth
0.51854 0.6351 Mdot
0 0 0 setrgbcolor
0.01069 setlinewidth
0.61464 0.49547 Mdot
0 0 0 setrgbcolor
0.00568 setlinewidth
0.50116 0.63277 Mdot
0 0 0 setrgbcolor
0.00563 setlinewidth
0.61277 0.49158 Mdot
0 0 0 setrgbcolor
0.00536 setlinewidth
0.60119 0.59746 Mdot
0 0 0 setrgbcolor
0.01129 setlinewidth
0.42343 0.53179 Mdot
0 0 0 setrgbcolor
0.0056 setlinewidth
0.57328 0.6215 Mdot
0 0 0 setrgbcolor
0.01965 setlinewidth
0.5694 0.62359 Mdot
0 0 0 setrgbcolor
0.00769 setlinewidth
0.59989 0.5984 Mdot
0 0 0 setrgbcolor
0.01184 setlinewidth
0.44372 0.59505 Mdot
0 0 0 setrgbcolor
0.01972 setlinewidth
0.42444 0.54627 Mdot
0 0 0 setrgbcolor
0.00507 setlinewidth
0.61032 0.48849 Mdot
0 0 0 setrgbcolor
0.01175 setlinewidth
0.54386 0.43857 Mdot
0 0 0 setrgbcolor
0.01386 setlinewidth
0.59005 0.46245 Mdot
0 0 0 setrgbcolor
0.01672 setlinewidth
0.57115 0.44908 Mdot
0 0 0 setrgbcolor
0.01409 setlinewidth
0.57253 0.62073 Mdot
0 0 0 setrgbcolor
0.01549 setlinewidth
0.42687 0.55422 Mdot
0 0 0 setrgbcolor
0.00863 setlinewidth
0.48444 0.62534 Mdot
0 0 0 setrgbcolor
0.01754 setlinewidth
0.52593 0.63288 Mdot
0 0 0 setrgbcolor
0.01008 setlinewidth
0.6204 0.53144 Mdot
0 0 0 setrgbcolor
0.0162 setlinewidth
0.42575 0.5363 Mdot
0 0 0 setrgbcolor
0.01547 setlinewidth
0.61965 0.5232 Mdot
0 0 0 setrgbcolor
0.01898 setlinewidth
0.58683 0.46214 Mdot
0 0 0 setrgbcolor
0.01964 setlinewidth
0.61488 0.50399 Mdot
0 0 0 setrgbcolor
0.01355 setlinewidth
0.61974 0.52718 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.51611 0.63184 Mdot
0 0 0 setrgbcolor
0.00527 setlinewidth
0.61795 0.55416 Mdot
0 0 0 setrgbcolor
0.00915 setlinewidth
0.47337 0.6174 Mdot
0 0 0 setrgbcolor
0.01526 setlinewidth
0.43495 0.57312 Mdot
0 0 0 setrgbcolor
0.00682 setlinewidth
0.5801 0.61187 Mdot
0 0 0 setrgbcolor
0.00886 setlinewidth
0.56075 0.44804 Mdot
0 0 0 setrgbcolor
0.0126 setlinewidth
0.49645 0.62624 Mdot
0 0 0 setrgbcolor
0.01152 setlinewidth
0.42885 0.54386 Mdot
0 0 0 setrgbcolor
0.01499 setlinewidth
0.47029 0.45743 Mdot
0 0 0 setrgbcolor
0.00504 setlinewidth
0.47371 0.61549 Mdot
0 0 0 setrgbcolor
0.0146 setlinewidth
0.48882 0.44778 Mdot
0 0 0 setrgbcolor
0.01155 setlinewidth
0.57733 0.61189 Mdot
0 0 0 setrgbcolor
0.01319 setlinewidth
0.49011 0.44797 Mdot
0 0 0 setrgbcolor
0.00973 setlinewidth
0.51864 0.62852 Mdot
0 0 0 setrgbcolor
0.01058 setlinewidth
0.50425 0.62648 Mdot
0 0 0 setrgbcolor
0.00508 setlinewidth
0.52802 0.62684 Mdot
0 0 0 setrgbcolor
0.01198 setlinewidth
0.49514 0.62254 Mdot
0 0 0 setrgbcolor
0.01429 setlinewidth
0.59841 0.58707 Mdot
0 0 0 setrgbcolor
0.01426 setlinewidth
0.4706 0.60868 Mdot
0 0 0 setrgbcolor
0.01245 setlinewidth
0.51027 0.62397 Mdot
0 0 0 setrgbcolor
0.0174 setlinewidth
0.46249 0.60046 Mdot
0 0 0 setrgbcolor
0.01715 setlinewidth
0.55425 0.45234 Mdot
0 0 0 setrgbcolor
0.0152 setlinewidth
0.53559 0.6229 Mdot
0 0 0 setrgbcolor
0.00736 setlinewidth
0.5383 0.62099 Mdot
0 0 0 setrgbcolor
0.0069 setlinewidth
0.57024 0.60834 Mdot
0 0 0 setrgbcolor
0.00927 setlinewidth
0.43899 0.55711 Mdot
0 0 0 setrgbcolor
0.00927 setlinewidth
0.60287 0.50101 Mdot
0 0 0 setrgbcolor
0.01721 setlinewidth
0.44546 0.56914 Mdot
0 0 0 setrgbcolor
0.01902 setlinewidth
0.56147 0.61076 Mdot
0 0 0 setrgbcolor
0.01458 setlinewidth
0.52376 0.61838 Mdot
0 0 0 setrgbcolor
0.00661 setlinewidth
0.51963 0.6182 Mdot
0 0 0 setrgbcolor
0.01962 setlinewidth
0.52396 0.61771 Mdot
0 0 0 setrgbcolor
0.00827 setlinewidth
0.53811 0.61628 Mdot
0 0 0 setrgbcolor
0.0106 setlinewidth
0.51572 0.61726 Mdot
0 0 0 setrgbcolor
0.0097 setlinewidth
0.4752 0.46879 Mdot
0 0 0 setrgbcolor
0.01245 setlinewidth
0.49104 0.61049 Mdot
0 0 0 setrgbcolor
0.0134 setlinewidth
0.44783 0.56662 Mdot
0 0 0 setrgbcolor
0.01038 setlinewidth
0.44899 0.56537 Mdot
0 0 0 setrgbcolor
0.00866 setlinewidth
0.49683 0.4599 Mdot
0 0 0 setrgbcolor
0.01022 setlinewidth
0.51889 0.61377 Mdot
0 0 0 setrgbcolor
0.00551 setlinewidth
0.44545 0.54526 Mdot
0 0 0 setrgbcolor
0.01539 setlinewidth
0.52328 0.61241 Mdot
0 0 0 setrgbcolor
0.00537 setlinewidth
0.4861 0.47337 Mdot
0 0 0 setrgbcolor
0.01813 setlinewidth
0.52686 0.4637 Mdot
0 0 0 setrgbcolor
0.00584 setlinewidth
0.52104 0.60701 Mdot
0 0 0 setrgbcolor
0.00666 setlinewidth
0.59188 0.524 Mdot
0 0 0 setrgbcolor
0.01619 setlinewidth
0.50678 0.60223 Mdot
1 1 1 setrgbcolor
0.00661 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01071 setlinewidth
0.51374 0.60339 Mdot
0 0 0 setrgbcolor
0.01313 setlinewidth
0.46314 0.562 Mdot
0 0 0 setrgbcolor
0.00677 setlinewidth
0.55741 0.59093 Mdot
0 0 0 setrgbcolor
0.01859 setlinewidth
0.57952 0.511 Mdot
0 0 0 setrgbcolor
0.01484 setlinewidth
0.52888 0.47525 Mdot
0 0 0 setrgbcolor
0.0126 setlinewidth
0.4888 0.48652 Mdot
0 0 0 setrgbcolor
0.00976 setlinewidth
0.48475 0.57825 Mdot
0 0 0 setrgbcolor
0.01131 setlinewidth
0.46805 0.54879 Mdot
0 0 0 setrgbcolor
0.01991 setlinewidth
0.5397 0.58916 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.47915 0.50047 Mdot
0 0 0 setrgbcolor
0.01139 setlinewidth
0.49395 0.57431 Mdot
0 0 0 setrgbcolor
0.01101 setlinewidth
0.49564 0.57321 Mdot
0 0 0 setrgbcolor
0.00528 setlinewidth
0.50343 0.49743 Mdot
0 0 0 setrgbcolor
0.01893 setlinewidth
0.51871 0.57516 Mdot
0 0 0 setrgbcolor
0.01871 setlinewidth
0.56087 0.54355 Mdot
0 0 0 setrgbcolor
0.00695 setlinewidth
0.55192 0.51038 Mdot
0 0 0 setrgbcolor
0.01894 setlinewidth
0.54008 0.56775 Mdot
0 0 0 setrgbcolor
0.01797 setlinewidth
0.55471 0.51823 Mdot
0 0 0 setrgbcolor
0.01447 setlinewidth
0.48984 0.54603 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01016 setlinewidth
0.49869 0.54153 Mdot
0 0 0 setrgbcolor
0.00556 setlinewidth
0.50098 0.51971 Mdot
0 0 0 setrgbcolor
0.0166 setlinewidth
0.50316 0.51158 Mdot
0 0 0 setrgbcolor
0.01035 setlinewidth
0.54857 0.51615 Mdot
0 0 0 setrgbcolor
0.00595 setlinewidth
0.50077 0.50631 Mdot
0 0 0 setrgbcolor
0.01222 setlinewidth
0.51866 0.57474 Mdot
0 0 0 setrgbcolor
0.01083 setlinewidth
0.51809 0.49523 Mdot
0 0 0 setrgbcolor
0.00884 setlinewidth
0.50352 0.49976 Mdot
0 0 0 setrgbcolor
0.01213 setlinewidth
0.48448 0.52025 Mdot
0 0 0 setrgbcolor
0.01001 setlinewidth
0.48735 0.55667 Mdot
0 0 0 setrgbcolor
0.0086 setlinewidth
0.56649 0.54529 Mdot
0 0 0 setrgbcolor
0.00687 setlinewidth
0.52616 0.49049 Mdot
0 0 0 setrgbcolor
0.00991 setlinewidth
0.49413 0.57182 Mdot
0 0 0 setrgbcolor
0.014 setlinewidth
0.49808 0.57848 Mdot
0 0 0 setrgbcolor
0.00614 setlinewidth
0.55199 0.57704 Mdot
0 0 0 setrgbcolor
0.00528 setlinewidth
0.5485 0.58128 Mdot
0 0 0 setrgbcolor
0.01911 setlinewidth
0.51789 0.48078 Mdot
0 0 0 setrgbcolor
0.00591 setlinewidth
0.56186 0.57464 Mdot
0 0 0 setrgbcolor
0.00742 setlinewidth
0.50276 0.48364 Mdot
0 0 0 setrgbcolor
0.00981 setlinewidth
0.47218 0.51228 Mdot
0 0 0 setrgbcolor
0.01764 setlinewidth
0.5781 0.52367 Mdot
0 0 0 setrgbcolor
0.00618 setlinewidth
0.53341 0.59071 Mdot
0 0 0 setrgbcolor
0.01467 setlinewidth
0.51778 0.47496 Mdot
0 0 0 setrgbcolor
0.01055 setlinewidth
0.54385 0.5925 Mdot
0 0 0 setrgbcolor
0.01574 setlinewidth
0.4936 0.58908 Mdot
0 0 0 setrgbcolor
0.00672 setlinewidth
0.53249 0.47461 Mdot
0 0 0 setrgbcolor
0.01676 setlinewidth
0.50102 0.4766 Mdot
0 0 0 setrgbcolor
0.01307 setlinewidth
0.58586 0.52531 Mdot
0 0 0 setrgbcolor
0.01484 setlinewidth
0.53383 0.47209 Mdot
0 0 0 setrgbcolor
0.01654 setlinewidth
0.54826 0.59438 Mdot
1 1 1 setrgbcolor
0.00704 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00887 setlinewidth
0.50554 0.46664 Mdot
0 0 0 setrgbcolor
0.00648 setlinewidth
0.54018 0.46652 Mdot
0 0 0 setrgbcolor
0.01152 setlinewidth
0.4597 0.50328 Mdot
0 0 0 setrgbcolor
0.01455 setlinewidth
0.45447 0.51467 Mdot
0 0 0 setrgbcolor
0.00599 setlinewidth
0.52812 0.60859 Mdot
0 0 0 setrgbcolor
0.01054 setlinewidth
0.51968 0.46177 Mdot
0 0 0 setrgbcolor
0.00611 setlinewidth
0.45752 0.4988 Mdot
0 0 0 setrgbcolor
0.00887 setlinewidth
0.53244 0.46077 Mdot
0 0 0 setrgbcolor
0.01813 setlinewidth
0.52177 0.45744 Mdot
0 0 0 setrgbcolor
0.01383 setlinewidth
0.50848 0.61335 Mdot
0 0 0 setrgbcolor
0.01568 setlinewidth
0.51534 0.45606 Mdot
0 0 0 setrgbcolor
0.01931 setlinewidth
0.52442 0.45399 Mdot
0 0 0 setrgbcolor
0.01129 setlinewidth
0.53453 0.45416 Mdot
0 0 0 setrgbcolor
0.01064 setlinewidth
0.50541 0.61542 Mdot
0 0 0 setrgbcolor
0.01574 setlinewidth
0.51612 0.45355 Mdot
0 0 0 setrgbcolor
0.00978 setlinewidth
0.54119 0.45526 Mdot
0 0 0 setrgbcolor
0.00674 setlinewidth
0.52382 0.45314 Mdot
0 0 0 setrgbcolor
0.00523 setlinewidth
0.51961 0.4531 Mdot
0 0 0 setrgbcolor
0.01613 setlinewidth
0.52701 0.45306 Mdot
0 0 0 setrgbcolor
0.01048 setlinewidth
0.53747 0.6174 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.52021 0.45191 Mdot
0 0 0 setrgbcolor
0.00962 setlinewidth
0.52605 0.45183 Mdot
0 0 0 setrgbcolor
0.00644 setlinewidth
0.59664 0.49524 Mdot
0 0 0 setrgbcolor
0.00561 setlinewidth
0.54321 0.45375 Mdot
0 0 0 setrgbcolor
0.01187 setlinewidth
0.58584 0.47923 Mdot
0 0 0 setrgbcolor
0.01324 setlinewidth
0.56304 0.46101 Mdot
0 0 0 setrgbcolor
0.00613 setlinewidth
0.59788 0.49538 Mdot
0 0 0 setrgbcolor
0.01352 setlinewidth
0.51505 0.45041 Mdot
0 0 0 setrgbcolor
0.01113 setlinewidth
0.52414 0.44946 Mdot
0 0 0 setrgbcolor
0.01435 setlinewidth
0.52932 0.44961 Mdot
0 0 0 setrgbcolor
0.0069 setlinewidth
0.57867 0.60105 Mdot
0 0 0 setrgbcolor
0.01031 setlinewidth
0.52771 0.44891 Mdot
0 0 0 setrgbcolor
0.01966 setlinewidth
0.48381 0.45618 Mdot
0 0 0 setrgbcolor
0.00799 setlinewidth
0.5803 0.60333 Mdot
0 0 0 setrgbcolor
0.01283 setlinewidth
0.48057 0.45376 Mdot
0 0 0 setrgbcolor
0.01148 setlinewidth
0.48067 0.45357 Mdot
0 0 0 setrgbcolor
0.00601 setlinewidth
0.47626 0.45402 Mdot
0 0 0 setrgbcolor
0.00761 setlinewidth
0.4923 0.44663 Mdot
0 0 0 setrgbcolor
0.01815 setlinewidth
0.50441 0.44279 Mdot
0 0 0 setrgbcolor
0.01047 setlinewidth
0.53631 0.44155 Mdot
0 0 0 setrgbcolor
0.00964 setlinewidth
0.48088 0.45022 Mdot
0 0 0 setrgbcolor
0.01061 setlinewidth
0.52237 0.63053 Mdot
0 0 0 setrgbcolor
0.01966 setlinewidth
0.46608 0.45791 Mdot
0 0 0 setrgbcolor
0.01444 setlinewidth
0.60261 0.59004 Mdot
0 0 0 setrgbcolor
0.00935 setlinewidth
0.58369 0.61047 Mdot
0 0 0 setrgbcolor
0.00565 setlinewidth
0.48238 0.44706 Mdot
0 0 0 setrgbcolor
0.01963 setlinewidth
0.43414 0.49546 Mdot
0 0 0 setrgbcolor
0.01238 setlinewidth
0.61324 0.57301 Mdot
0 0 0 setrgbcolor
0.01733 setlinewidth
0.50131 0.43984 Mdot
0 0 0 setrgbcolor
0.00843 setlinewidth
0.45701 0.46291 Mdot
0 0 0 setrgbcolor
0.00979 setlinewidth
0.49529 0.44103 Mdot
0 0 0 setrgbcolor
0.01049 setlinewidth
0.61537 0.4999 Mdot
0 0 0 setrgbcolor
0.0139 setlinewidth
0.44319 0.59506 Mdot
0 0 0 setrgbcolor
0.00769 setlinewidth
0.55283 0.43994 Mdot
0 0 0 setrgbcolor
0.0076 setlinewidth
0.6151 0.57545 Mdot
0 0 0 setrgbcolor
0.00584 setlinewidth
0.48138 0.44342 Mdot
0 0 0 setrgbcolor
0.01513 setlinewidth
0.60579 0.47623 Mdot
0 0 0 setrgbcolor
0.0081 setlinewidth
0.53172 0.43388 Mdot
0 0 0 setrgbcolor
0.01337 setlinewidth
0.42685 0.56892 Mdot
0 0 0 setrgbcolor
0.01141 setlinewidth
0.58886 0.45728 Mdot
0 0 0 setrgbcolor
0.01043 setlinewidth
0.55877 0.43964 Mdot
0 0 0 setrgbcolor
0.01762 setlinewidth
0.48747 0.43955 Mdot
0 0 0 setrgbcolor
0.01122 setlinewidth
0.56867 0.44367 Mdot
0 0 0 setrgbcolor
0.01966 setlinewidth
0.58449 0.61742 Mdot
0 0 0 setrgbcolor
0.00695 setlinewidth
0.50842 0.43353 Mdot
0 0 0 setrgbcolor
0.00732 setlinewidth
0.52644 0.63892 Mdot
0 0 0 setrgbcolor
0.00845 setlinewidth
0.42006 0.547 Mdot
0 0 0 setrgbcolor
0.01868 setlinewidth
0.54179 0.63793 Mdot
0 0 0 setrgbcolor
0.01518 setlinewidth
0.52707 0.63961 Mdot
0 0 0 setrgbcolor
0.01419 setlinewidth
0.50961 0.43179 Mdot
0 0 0 setrgbcolor
0.01907 setlinewidth
0.42205 0.56182 Mdot
0 0 0 setrgbcolor
0.01213 setlinewidth
0.58036 0.44787 Mdot
0 0 0 setrgbcolor
0.00994 setlinewidth
0.52477 0.43075 Mdot
0 0 0 setrgbcolor
0.01346 setlinewidth
0.51777 0.63984 Mdot
0 0 0 setrgbcolor
0.01062 setlinewidth
0.57115 0.44237 Mdot
0 0 0 setrgbcolor
0.0058 setlinewidth
0.60259 0.60346 Mdot
0 0 0 setrgbcolor
0.00643 setlinewidth
0.44884 0.60922 Mdot
0 0 0 setrgbcolor
0.0164 setlinewidth
0.51439 0.63984 Mdot
0 0 0 setrgbcolor
0.0151 setlinewidth
0.60899 0.59549 Mdot
0 0 0 setrgbcolor
0.0161 setlinewidth
0.53299 0.63975 Mdot
0 0 0 setrgbcolor
0.00627 setlinewidth
0.42403 0.56977 Mdot
0 0 0 setrgbcolor
0.01965 setlinewidth
0.4195 0.55155 Mdot
0 0 0 setrgbcolor
0.00956 setlinewidth
0.60564 0.47077 Mdot
0 0 0 setrgbcolor
0.00916 setlinewidth
0.58372 0.62068 Mdot
0 0 0 setrgbcolor
0.01775 setlinewidth
0.58731 0.45293 Mdot
0 0 0 setrgbcolor
0.01312 setlinewidth
0.43308 0.58817 Mdot
0 0 0 setrgbcolor
0.01887 setlinewidth
0.42172 0.55901 Mdot
0 0 0 setrgbcolor
0.01055 setlinewidth
0.62664 0.52492 Mdot
0 0 0 setrgbcolor
0.00743 setlinewidth
0.49254 0.63483 Mdot
0 0 0 setrgbcolor
0.01736 setlinewidth
0.52555 0.43175 Mdot
0 0 0 setrgbcolor
0.01155 setlinewidth
0.61287 0.48374 Mdot
0 0 0 setrgbcolor
0.01352 setlinewidth
0.58552 0.61778 Mdot
0 0 0 setrgbcolor
0.01309 setlinewidth
0.58166 0.62055 Mdot
0 0 0 setrgbcolor
0.00751 setlinewidth
0.47842 0.62833 Mdot
0 0 0 setrgbcolor
0.01767 setlinewidth
0.60974 0.47943 Mdot
0 0 0 setrgbcolor
0.01662 setlinewidth
0.61099 0.58847 Mdot
0 0 0 setrgbcolor
0.01596 setlinewidth
0.44977 0.46352 Mdot
0 0 0 setrgbcolor
0.01919 setlinewidth
0.60654 0.47571 Mdot
0 0 0 setrgbcolor
0.00653 setlinewidth
0.53546 0.63677 Mdot
0 0 0 setrgbcolor
0.00853 setlinewidth
0.55472 0.43823 Mdot
0 0 0 setrgbcolor
0.00697 setlinewidth
0.47729 0.6264 Mdot
0 0 0 setrgbcolor
0.00617 setlinewidth
0.52456 0.63715 Mdot
0 0 0 setrgbcolor
0.00738 setlinewidth
0.46689 0.45058 Mdot
0 0 0 setrgbcolor
0.00588 setlinewidth
0.57655 0.44906 Mdot
0 0 0 setrgbcolor
0.01148 setlinewidth
0.60851 0.58975 Mdot
0 0 0 setrgbcolor
0.01419 setlinewidth
0.58257 0.61726 Mdot
0 0 0 setrgbcolor
0.00704 setlinewidth
0.46785 0.4506 Mdot
0 0 0 setrgbcolor
0.00796 setlinewidth
0.50228 0.63425 Mdot
0 0 0 setrgbcolor
0.00831 setlinewidth
0.6016 0.473 Mdot
0 0 0 setrgbcolor
0.01071 setlinewidth
0.43022 0.57143 Mdot
0 0 0 setrgbcolor
0.01353 setlinewidth
0.47112 0.61996 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.50928 0.63347 Mdot
0 0 0 setrgbcolor
0.0161 setlinewidth
0.46118 0.61266 Mdot
0 0 0 setrgbcolor
0.01713 setlinewidth
0.49866 0.63074 Mdot
0 0 0 setrgbcolor
0.01574 setlinewidth
0.57104 0.44941 Mdot
0 0 0 setrgbcolor
0.01825 setlinewidth
0.52434 0.63351 Mdot
0 0 0 setrgbcolor
0.01886 setlinewidth
0.54061 0.43908 Mdot
0 0 0 setrgbcolor
0.013 setlinewidth
0.43774 0.58293 Mdot
0 0 0 setrgbcolor
0.01795 setlinewidth
0.53278 0.63049 Mdot
0 0 0 setrgbcolor
0.01753 setlinewidth
0.6168 0.51657 Mdot
0 0 0 setrgbcolor
0.01269 setlinewidth
0.61467 0.50805 Mdot
0 0 0 setrgbcolor
0.01537 setlinewidth
0.60645 0.48867 Mdot
0 0 0 setrgbcolor
0.01474 setlinewidth
0.58606 0.60711 Mdot
0 0 0 setrgbcolor
0.01012 setlinewidth
0.43874 0.58005 Mdot
0 0 0 setrgbcolor
0.01033 setlinewidth
0.51333 0.63013 Mdot
0 0 0 setrgbcolor
0.00782 setlinewidth
0.6151 0.51223 Mdot
0 0 0 setrgbcolor
0.01099 setlinewidth
0.43926 0.57863 Mdot
0 0 0 setrgbcolor
0.01602 setlinewidth
0.6172 0.54084 Mdot
0 0 0 setrgbcolor
0.01398 setlinewidth
0.43221 0.55844 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.45148 0.47482 Mdot
0 0 0 setrgbcolor
0.01396 setlinewidth
0.5822 0.60763 Mdot
0 0 0 setrgbcolor
0.01568 setlinewidth
0.53851 0.62541 Mdot
0 0 0 setrgbcolor
0.01774 setlinewidth
0.53138 0.44485 Mdot
0 0 0 setrgbcolor
0.01913 setlinewidth
0.48898 0.61912 Mdot
0 0 0 setrgbcolor
0.00842 setlinewidth
0.47129 0.4622 Mdot
0 0 0 setrgbcolor
0.00867 setlinewidth
0.54043 0.62307 Mdot
0 0 0 setrgbcolor
0.00704 setlinewidth
0.51956 0.62298 Mdot
0 0 0 setrgbcolor
0.01848 setlinewidth
0.51523 0.62258 Mdot
0 0 0 setrgbcolor
0.01605 setlinewidth
0.59884 0.5786 Mdot
0 0 0 setrgbcolor
0.00539 setlinewidth
0.52383 0.62256 Mdot
0 0 0 setrgbcolor
0.01171 setlinewidth
0.52372 0.62185 Mdot
0 0 0 setrgbcolor
0.01973 setlinewidth
0.57119 0.60521 Mdot
0 0 0 setrgbcolor
0.0081 setlinewidth
0.46062 0.478 Mdot
0 0 0 setrgbcolor
0.01842 setlinewidth
0.53793 0.61832 Mdot
0 0 0 setrgbcolor
0.01934 setlinewidth
0.51686 0.61857 Mdot
0 0 0 setrgbcolor
0.01733 setlinewidth
0.56175 0.60908 Mdot
0 0 0 setrgbcolor
0.01544 setlinewidth
0.44971 0.5733 Mdot
0 0 0 setrgbcolor
0.0075 setlinewidth
0.52074 0.61655 Mdot
0 0 0 setrgbcolor
0.01875 setlinewidth
0.58817 0.48786 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.50028 0.46144 Mdot
0 0 0 setrgbcolor
0.01246 setlinewidth
0.50054 0.60852 Mdot
1 1 1 setrgbcolor
0.00704 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01909 setlinewidth
0.51636 0.61136 Mdot
0 0 0 setrgbcolor
0.01429 setlinewidth
0.45117 0.55901 Mdot
0 0 0 setrgbcolor
0.00743 setlinewidth
0.50776 0.60871 Mdot
0 0 0 setrgbcolor
0.01226 setlinewidth
0.46302 0.49135 Mdot
0 0 0 setrgbcolor
0.01087 setlinewidth
0.4549 0.50733 Mdot
0 0 0 setrgbcolor
0.01784 setlinewidth
0.47262 0.58702 Mdot
0 0 0 setrgbcolor
0.0116 setlinewidth
0.50198 0.47328 Mdot
0 0 0 setrgbcolor
0.01474 setlinewidth
0.48014 0.58166 Mdot
0 0 0 setrgbcolor
0.0057 setlinewidth
0.48147 0.58028 Mdot
0 0 0 setrgbcolor
0.01197 setlinewidth
0.54978 0.58934 Mdot
0 0 0 setrgbcolor
0.00955 setlinewidth
0.47732 0.5005 Mdot
0 0 0 setrgbcolor
0.01612 setlinewidth
0.57571 0.51402 Mdot
0 0 0 setrgbcolor
0.01759 setlinewidth
0.47033 0.55305 Mdot
0 0 0 setrgbcolor
0.01989 setlinewidth
0.52992 0.59023 Mdot
0 0 0 setrgbcolor
0.00768 setlinewidth
0.55945 0.50247 Mdot
0 0 0 setrgbcolor
0.01311 setlinewidth
0.50448 0.57893 Mdot
0 0 0 setrgbcolor
0.01263 setlinewidth
0.52481 0.56803 Mdot
0 0 0 setrgbcolor
0.01269 setlinewidth
0.5282 0.50638 Mdot
0 0 0 setrgbcolor
0.0058 setlinewidth
0.53208 0.51414 Mdot
0 0 0 setrgbcolor
0.0119 setlinewidth
0.54252 0.5396 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.00906 setlinewidth
0.51944 0.54398 Mdot
0 0 0 setrgbcolor
0.01802 setlinewidth
0.51832 0.52107 Mdot
0 0 0 setrgbcolor
0.00529 setlinewidth
0.51904 0.51233 Mdot
0 0 0 setrgbcolor
0.01496 setlinewidth
0.50067 0.52424 Mdot
0 0 0 setrgbcolor
0.00692 setlinewidth
0.51542 0.50728 Mdot
0 0 0 setrgbcolor
0.00822 setlinewidth
0.50911 0.56144 Mdot
0 0 0 setrgbcolor
0.01847 setlinewidth
0.51687 0.5001 Mdot
0 0 0 setrgbcolor
0.00949 setlinewidth
0.51781 0.57613 Mdot
0 0 0 setrgbcolor
0.01452 setlinewidth
0.48547 0.51803 Mdot
0 0 0 setrgbcolor
0.0102 setlinewidth
0.53097 0.49312 Mdot
0 0 0 setrgbcolor
0.01665 setlinewidth
0.54382 0.57546 Mdot
0 0 0 setrgbcolor
0.01795 setlinewidth
0.52247 0.58246 Mdot
0 0 0 setrgbcolor
0.01514 setlinewidth
0.56592 0.50999 Mdot
0 0 0 setrgbcolor
0.00671 setlinewidth
0.53803 0.48696 Mdot
0 0 0 setrgbcolor
0.01019 setlinewidth
0.51202 0.48365 Mdot
0 0 0 setrgbcolor
0.01849 setlinewidth
0.52701 0.47829 Mdot
0 0 0 setrgbcolor
0.01028 setlinewidth
0.46549 0.52341 Mdot
0 0 0 setrgbcolor
0.01497 setlinewidth
0.51806 0.59421 Mdot
0 0 0 setrgbcolor
0.0168 setlinewidth
0.46914 0.51086 Mdot
0 0 0 setrgbcolor
0.00774 setlinewidth
0.50814 0.47673 Mdot
0 0 0 setrgbcolor
0.0132 setlinewidth
0.52521 0.47233 Mdot
0 0 0 setrgbcolor
0.00525 setlinewidth
0.46545 0.50664 Mdot
0 0 0 setrgbcolor
0.01383 setlinewidth
0.58776 0.53762 Mdot
0 0 0 setrgbcolor
0.01963 setlinewidth
0.55951 0.58999 Mdot
0 0 0 setrgbcolor
0.0096 setlinewidth
0.57712 0.57295 Mdot
0 0 0 setrgbcolor
0.00502 setlinewidth
0.57398 0.5779 Mdot
0 0 0 setrgbcolor
0.01137 setlinewidth
0.53999 0.46963 Mdot
0 0 0 setrgbcolor
0.01279 setlinewidth
0.54054 0.46682 Mdot
0 0 0 setrgbcolor
0.01062 setlinewidth
0.50979 0.4658 Mdot
0 0 0 setrgbcolor
0.01212 setlinewidth
0.58632 0.569 Mdot
0 0 0 setrgbcolor
0.00837 setlinewidth
0.56983 0.59036 Mdot
0 0 0 setrgbcolor
0.01086 setlinewidth
0.595 0.51339 Mdot
0 0 0 setrgbcolor
0.00684 setlinewidth
0.57411 0.5917 Mdot
0 0 0 setrgbcolor
0.01325 setlinewidth
0.52283 0.45853 Mdot
1 1 1 setrgbcolor
0.00949 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00535 setlinewidth
0.54497 0.46011 Mdot
0 0 0 setrgbcolor
0.01369 setlinewidth
0.55402 0.60957 Mdot
0 0 0 setrgbcolor
0.01433 setlinewidth
0.53533 0.45545 Mdot
0 0 0 setrgbcolor
0.00863 setlinewidth
0.52335 0.45376 Mdot
0 0 0 setrgbcolor
0.01859 setlinewidth
0.60218 0.51395 Mdot
0 0 0 setrgbcolor
0.01609 setlinewidth
0.5162 0.4534 Mdot
0 0 0 setrgbcolor
0.01617 setlinewidth
0.53341 0.61747 Mdot
0 0 0 setrgbcolor
0.00784 setlinewidth
0.516 0.45072 Mdot
0 0 0 setrgbcolor
0.01223 setlinewidth
0.52995 0.62012 Mdot
0 0 0 setrgbcolor
0.00631 setlinewidth
0.52467 0.44982 Mdot
0 0 0 setrgbcolor
0.01517 setlinewidth
0.5194 0.44969 Mdot
0 0 0 setrgbcolor
0.01811 setlinewidth
0.52371 0.44905 Mdot
0 0 0 setrgbcolor
0.00502 setlinewidth
0.48188 0.45878 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.52689 0.44845 Mdot
0 0 0 setrgbcolor
0.0116 setlinewidth
0.51952 0.44838 Mdot
0 0 0 setrgbcolor
0.01817 setlinewidth
0.53483 0.44836 Mdot
0 0 0 setrgbcolor
0.0168 setlinewidth
0.52541 0.44735 Mdot
0 0 0 setrgbcolor
0.00879 setlinewidth
0.51353 0.44771 Mdot
0 0 0 setrgbcolor
0.00655 setlinewidth
0.54175 0.44842 Mdot
0 0 0 setrgbcolor
0.01147 setlinewidth
0.52244 0.44525 Mdot
0 0 0 setrgbcolor
0.00502 setlinewidth
0.52771 0.44457 Mdot
0 0 0 setrgbcolor
0.01375 setlinewidth
0.47698 0.4569 Mdot
0 0 0 setrgbcolor
0.0058 setlinewidth
0.54305 0.44656 Mdot
0 0 0 setrgbcolor
0.01023 setlinewidth
0.477 0.45668 Mdot
0 0 0 setrgbcolor
0.0087 setlinewidth
0.56258 0.61756 Mdot
0 0 0 setrgbcolor
0.01252 setlinewidth
0.52578 0.44412 Mdot
0 0 0 setrgbcolor
0.01944 setlinewidth
0.47194 0.4579 Mdot
0 0 0 setrgbcolor
0.01041 setlinewidth
0.43433 0.50735 Mdot
0 0 0 setrgbcolor
0.01729 setlinewidth
0.56434 0.45088 Mdot
0 0 0 setrgbcolor
0.01961 setlinewidth
0.46126 0.46362 Mdot
0 0 0 setrgbcolor
0.01367 setlinewidth
0.48695 0.44769 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.4755 0.45328 Mdot
0 0 0 setrgbcolor
0.01652 setlinewidth
0.45196 0.47029 Mdot
0 0 0 setrgbcolor
0.00508 setlinewidth
0.59064 0.46617 Mdot
0 0 0 setrgbcolor
0.01421 setlinewidth
0.49838 0.44177 Mdot
0 0 0 setrgbcolor
0.01025 setlinewidth
0.60438 0.48114 Mdot
0 0 0 setrgbcolor
0.01927 setlinewidth
0.47546 0.44984 Mdot
0 0 0 setrgbcolor
0.01377 setlinewidth
0.60158 0.59453 Mdot
0 0 0 setrgbcolor
0.01388 setlinewidth
0.45716 0.6086 Mdot
0 0 0 setrgbcolor
0.0112 setlinewidth
0.60539 0.48111 Mdot
0 0 0 setrgbcolor
0.01081 setlinewidth
0.53042 0.43528 Mdot
0 0 0 setrgbcolor
0.01488 setlinewidth
0.48697 0.44156 Mdot
0 0 0 setrgbcolor
0.00677 setlinewidth
0.43524 0.5842 Mdot
0 0 0 setrgbcolor
0.00955 setlinewidth
0.60273 0.59675 Mdot
0 0 0 setrgbcolor
0.01944 setlinewidth
0.49307 0.43933 Mdot
0 0 0 setrgbcolor
0.01416 setlinewidth
0.54506 0.63372 Mdot
0 0 0 setrgbcolor
0.01176 setlinewidth
0.47163 0.4464 Mdot
0 0 0 setrgbcolor
0.01497 setlinewidth
0.4233 0.56281 Mdot
0 0 0 setrgbcolor
0.01044 setlinewidth
0.47613 0.44149 Mdot
0 0 0 setrgbcolor
0.00907 setlinewidth
0.4262 0.57785 Mdot
0 0 0 setrgbcolor
0.01403 setlinewidth
0.60425 0.60395 Mdot
0 0 0 setrgbcolor
0.007 setlinewidth
0.54426 0.43108 Mdot
0 0 0 setrgbcolor
0.00504 setlinewidth
0.49572 0.43189 Mdot
0 0 0 setrgbcolor
0.01893 setlinewidth
0.52039 0.42836 Mdot
0 0 0 setrgbcolor
0.00715 setlinewidth
0.62065 0.57976 Mdot
0 0 0 setrgbcolor
0.01278 setlinewidth
0.42757 0.58587 Mdot
0 0 0 setrgbcolor
0.01675 setlinewidth
0.62841 0.56035 Mdot
0 0 0 setrgbcolor
0.0103 setlinewidth
0.45932 0.62284 Mdot
0 0 0 setrgbcolor
0.00728 setlinewidth
0.41969 0.56785 Mdot
0 0 0 setrgbcolor
0.00618 setlinewidth
0.54859 0.42989 Mdot
0 0 0 setrgbcolor
0.01875 setlinewidth
0.61858 0.48343 Mdot
0 0 0 setrgbcolor
0.00562 setlinewidth
0.55913 0.43247 Mdot
0 0 0 setrgbcolor
0.01746 setlinewidth
0.54465 0.64235 Mdot
0 0 0 setrgbcolor
0.01086 setlinewidth
0.49438 0.43004 Mdot
0 0 0 setrgbcolor
0.01801 setlinewidth
0.58226 0.44332 Mdot
0 0 0 setrgbcolor
0.01667 setlinewidth
0.6291 0.56275 Mdot
0 0 0 setrgbcolor
0.0059 setlinewidth
0.60303 0.46034 Mdot
0 0 0 setrgbcolor
0.01858 setlinewidth
0.50913 0.4265 Mdot
0 0 0 setrgbcolor
0.00544 setlinewidth
0.6022 0.61142 Mdot
0 0 0 setrgbcolor
0.00613 setlinewidth
0.54423 0.64307 Mdot
0 0 0 setrgbcolor
0.01872 setlinewidth
0.42081 0.57536 Mdot
0 0 0 setrgbcolor
0.01483 setlinewidth
0.43707 0.60368 Mdot
0 0 0 setrgbcolor
0.01505 setlinewidth
0.53407 0.64469 Mdot
0 0 0 setrgbcolor
0.01 setlinewidth
0.55915 0.63921 Mdot
0 0 0 setrgbcolor
0.00625 setlinewidth
0.52952 0.64526 Mdot
0 0 0 setrgbcolor
0.00869 setlinewidth
0.55806 0.43093 Mdot
0 0 0 setrgbcolor
0.00794 setlinewidth
0.5687 0.43513 Mdot
0 0 0 setrgbcolor
0.01031 setlinewidth
0.54831 0.64253 Mdot
0 0 0 setrgbcolor
0.01403 setlinewidth
0.43251 0.47292 Mdot
0 0 0 setrgbcolor
0.01627 setlinewidth
0.50345 0.64342 Mdot
0 0 0 setrgbcolor
0.01905 setlinewidth
0.6154 0.5944 Mdot
0 0 0 setrgbcolor
0.00769 setlinewidth
0.48693 0.63878 Mdot
0 0 0 setrgbcolor
0.01356 setlinewidth
0.44684 0.4569 Mdot
0 0 0 setrgbcolor
0.00632 setlinewidth
0.42698 0.58721 Mdot
0 0 0 setrgbcolor
0.00625 setlinewidth
0.44738 0.45679 Mdot
0 0 0 setrgbcolor
0.00612 setlinewidth
0.50515 0.42774 Mdot
0 0 0 setrgbcolor
0.01255 setlinewidth
0.48428 0.63704 Mdot
0 0 0 setrgbcolor
0.00688 setlinewidth
0.61974 0.58517 Mdot
0 0 0 setrgbcolor
0.01828 setlinewidth
0.59583 0.45508 Mdot
0 0 0 setrgbcolor
0.01854 setlinewidth
0.5959 0.61543 Mdot
0 0 0 setrgbcolor
0.01992 setlinewidth
0.57303 0.43951 Mdot
0 0 0 setrgbcolor
0.00513 setlinewidth
0.43512 0.59805 Mdot
0 0 0 setrgbcolor
0.00873 setlinewidth
0.4639 0.6253 Mdot
0 0 0 setrgbcolor
0.01207 setlinewidth
0.47517 0.63141 Mdot
0 0 0 setrgbcolor
0.01736 setlinewidth
0.51009 0.64169 Mdot
0 0 0 setrgbcolor
0.01574 setlinewidth
0.43456 0.59503 Mdot
0 0 0 setrgbcolor
0.00547 setlinewidth
0.5338 0.64148 Mdot
0 0 0 setrgbcolor
0.01895 setlinewidth
0.54519 0.6395 Mdot
0 0 0 setrgbcolor
0.01985 setlinewidth
0.42402 0.57377 Mdot
0 0 0 setrgbcolor
0.00744 setlinewidth
0.53425 0.42977 Mdot
0 0 0 setrgbcolor
0.00909 setlinewidth
0.43437 0.59352 Mdot
0 0 0 setrgbcolor
0.00817 setlinewidth
0.59141 0.61578 Mdot
0 0 0 setrgbcolor
0.01843 setlinewidth
0.4306 0.48466 Mdot
0 0 0 setrgbcolor
0.00622 setlinewidth
0.59498 0.61232 Mdot
0 0 0 setrgbcolor
0.01883 setlinewidth
0.50418 0.63869 Mdot
0 0 0 setrgbcolor
0.00634 setlinewidth
0.51574 0.63998 Mdot
0 0 0 setrgbcolor
0.0172 setlinewidth
0.6241 0.50861 Mdot
0 0 0 setrgbcolor
0.00524 setlinewidth
0.60261 0.46767 Mdot
0 0 0 setrgbcolor
0.01905 setlinewidth
0.55774 0.43749 Mdot
0 0 0 setrgbcolor
0.01292 setlinewidth
0.59819 0.4637 Mdot
0 0 0 setrgbcolor
0.01912 setlinewidth
0.59371 0.46037 Mdot
0 0 0 setrgbcolor
0.01246 setlinewidth
0.53054 0.63793 Mdot
0 0 0 setrgbcolor
0.01951 setlinewidth
0.51705 0.43317 Mdot
0 0 0 setrgbcolor
0.0126 setlinewidth
0.61599 0.57787 Mdot
0 0 0 setrgbcolor
0.01011 setlinewidth
0.58976 0.61237 Mdot
0 0 0 setrgbcolor
0.01828 setlinewidth
0.44697 0.46861 Mdot
0 0 0 setrgbcolor
0.01949 setlinewidth
0.51737 0.6361 Mdot
0 0 0 setrgbcolor
0.01587 setlinewidth
0.55005 0.4389 Mdot
0 0 0 setrgbcolor
0.01122 setlinewidth
0.61236 0.57968 Mdot
0 0 0 setrgbcolor
0.01694 setlinewidth
0.5863 0.45847 Mdot
0 0 0 setrgbcolor
0.00771 setlinewidth
0.53741 0.63367 Mdot
0 0 0 setrgbcolor
0.01243 setlinewidth
0.48903 0.62831 Mdot
0 0 0 setrgbcolor
0.01555 setlinewidth
0.43715 0.48672 Mdot
0 0 0 setrgbcolor
0.00508 setlinewidth
0.44008 0.58679 Mdot
0 0 0 setrgbcolor
0.0156 setlinewidth
0.50548 0.44089 Mdot
0 0 0 setrgbcolor
0.01428 setlinewidth
0.5407 0.62769 Mdot
0 0 0 setrgbcolor
0.01738 setlinewidth
0.51522 0.62821 Mdot
0 0 0 setrgbcolor
0.00861 setlinewidth
0.58842 0.6015 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.43771 0.57195 Mdot
0 0 0 setrgbcolor
0.00949 setlinewidth
0.51973 0.628 Mdot
0 0 0 setrgbcolor
0.01697 setlinewidth
0.52386 0.62696 Mdot
0 0 0 setrgbcolor
0.01432 setlinewidth
0.54161 0.62504 Mdot
0 0 0 setrgbcolor
0.01173 setlinewidth
0.43316 0.51808 Mdot
0 0 0 setrgbcolor
0.00946 setlinewidth
0.59112 0.47428 Mdot
0 0 0 setrgbcolor
0.01874 setlinewidth
0.43903 0.50031 Mdot
0 0 0 setrgbcolor
0.01663 setlinewidth
0.52342 0.62625 Mdot
0 0 0 setrgbcolor
0.01214 setlinewidth
0.5836 0.60268 Mdot
0 0 0 setrgbcolor
0.01476 setlinewidth
0.60265 0.49327 Mdot
0 0 0 setrgbcolor
0.01769 setlinewidth
0.60619 0.50186 Mdot
0 0 0 setrgbcolor
0.01643 setlinewidth
0.51504 0.62391 Mdot
0 0 0 setrgbcolor
0.01335 setlinewidth
0.60343 0.4976 Mdot
0 0 0 setrgbcolor
0.0076 setlinewidth
0.47262 0.46342 Mdot
0 0 0 setrgbcolor
0.00972 setlinewidth
0.60981 0.52732 Mdot
0 0 0 setrgbcolor
0.01536 setlinewidth
0.46279 0.5978 Mdot
0 0 0 setrgbcolor
0.00801 setlinewidth
0.53672 0.62057 Mdot
0 0 0 setrgbcolor
0.01223 setlinewidth
0.51808 0.62128 Mdot
0 0 0 setrgbcolor
0.00531 setlinewidth
0.49521 0.61595 Mdot
1 1 1 setrgbcolor
0.00949 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.00998 setlinewidth
0.5022 0.61513 Mdot
0 0 0 setrgbcolor
0.01258 setlinewidth
0.51165 0.61662 Mdot
0 0 0 setrgbcolor
0.01468 setlinewidth
0.56896 0.602 Mdot
0 0 0 setrgbcolor
0.01048 setlinewidth
0.55941 0.60748 Mdot
0 0 0 setrgbcolor
0.01219 setlinewidth
0.59407 0.56995 Mdot
0 0 0 setrgbcolor
0.01163 setlinewidth
0.46794 0.59127 Mdot
0 0 0 setrgbcolor
0.00667 setlinewidth
0.47383 0.47557 Mdot
0 0 0 setrgbcolor
0.01228 setlinewidth
0.46877 0.58967 Mdot
0 0 0 setrgbcolor
0.01654 setlinewidth
0.45189 0.50774 Mdot
0 0 0 setrgbcolor
0.01688 setlinewidth
0.45261 0.56319 Mdot
0 0 0 setrgbcolor
0.01038 setlinewidth
0.5671 0.47673 Mdot
0 0 0 setrgbcolor
0.01438 setlinewidth
0.49007 0.585 Mdot
0 0 0 setrgbcolor
0.01542 setlinewidth
0.5186 0.59292 Mdot
0 0 0 setrgbcolor
0.01974 setlinewidth
0.53943 0.58899 Mdot
0 0 0 setrgbcolor
0.00905 setlinewidth
0.5539 0.50638 Mdot
0 0 0 setrgbcolor
0.0069 setlinewidth
0.53448 0.49696 Mdot
0 0 0 setrgbcolor
0.01492 setlinewidth
0.50776 0.57074 Mdot
0 0 0 setrgbcolor
0.01456 setlinewidth
0.50152 0.50608 Mdot
0 0 0 setrgbcolor
0.01493 setlinewidth
0.50631 0.51357 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.52074 0.53848 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01791 setlinewidth
0.51983 0.52572 Mdot
0 0 0 setrgbcolor
0.01399 setlinewidth
0.54242 0.54324 Mdot
0 0 0 setrgbcolor
0.00779 setlinewidth
0.53763 0.51968 Mdot
0 0 0 setrgbcolor
0.01058 setlinewidth
0.50241 0.52171 Mdot
0 0 0 setrgbcolor
0.0189 setlinewidth
0.53672 0.51053 Mdot
0 0 0 setrgbcolor
0.00971 setlinewidth
0.53383 0.56295 Mdot
0 0 0 setrgbcolor
0.00976 setlinewidth
0.53197 0.50589 Mdot
0 0 0 setrgbcolor
0.0159 setlinewidth
0.53192 0.49825 Mdot
0 0 0 setrgbcolor
0.01658 setlinewidth
0.48123 0.53047 Mdot
0 0 0 setrgbcolor
0.01088 setlinewidth
0.48294 0.51697 Mdot
0 0 0 setrgbcolor
0.00888 setlinewidth
0.54411 0.57695 Mdot
0 0 0 setrgbcolor
0.00659 setlinewidth
0.47785 0.51325 Mdot
0 0 0 setrgbcolor
0.01693 setlinewidth
0.54461 0.48884 Mdot
0 0 0 setrgbcolor
0.00935 setlinewidth
0.52289 0.4821 Mdot
0 0 0 setrgbcolor
0.00621 setlinewidth
0.54928 0.58287 Mdot
0 0 0 setrgbcolor
0.01608 setlinewidth
0.57019 0.57239 Mdot
0 0 0 setrgbcolor
0.00504 setlinewidth
0.51694 0.47562 Mdot
0 0 0 setrgbcolor
0.01939 setlinewidth
0.5501 0.48137 Mdot
0 0 0 setrgbcolor
0.00855 setlinewidth
0.53678 0.4742 Mdot
0 0 0 setrgbcolor
0.00859 setlinewidth
0.54521 0.59582 Mdot
0 0 0 setrgbcolor
0.01261 setlinewidth
0.53323 0.46836 Mdot
0 0 0 setrgbcolor
0.01364 setlinewidth
0.58229 0.5009 Mdot
0 0 0 setrgbcolor
0.00898 setlinewidth
0.51533 0.46416 Mdot
0 0 0 setrgbcolor
0.01634 setlinewidth
0.54712 0.46323 Mdot
0 0 0 setrgbcolor
0.01352 setlinewidth
0.54677 0.46026 Mdot
0 0 0 setrgbcolor
0.008 setlinewidth
0.586 0.58537 Mdot
0 0 0 setrgbcolor
0.01949 setlinewidth
0.52631 0.4546 Mdot
0 0 0 setrgbcolor
0.00725 setlinewidth
0.59891 0.57061 Mdot
0 0 0 setrgbcolor
0.01252 setlinewidth
0.60146 0.56497 Mdot
0 0 0 setrgbcolor
0.01914 setlinewidth
0.48255 0.46162 Mdot
0 0 0 setrgbcolor
0.01623 setlinewidth
0.44042 0.51924 Mdot
0 0 0 setrgbcolor
0.012 setlinewidth
0.60713 0.52643 Mdot
1 1 1 setrgbcolor
0.00757 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00737 setlinewidth
0.51761 0.45045 Mdot
0 0 0 setrgbcolor
0.00586 setlinewidth
0.52508 0.44965 Mdot
0 0 0 setrgbcolor
0.01598 setlinewidth
0.54878 0.45268 Mdot
0 0 0 setrgbcolor
0.00606 setlinewidth
0.53769 0.44944 Mdot
0 0 0 setrgbcolor
0.00616 setlinewidth
0.59557 0.58431 Mdot
0 0 0 setrgbcolor
0.01011 setlinewidth
0.51634 0.44775 Mdot
0 0 0 setrgbcolor
0.01024 setlinewidth
0.47617 0.46054 Mdot
0 0 0 setrgbcolor
0.01352 setlinewidth
0.47611 0.46032 Mdot
0 0 0 setrgbcolor
0.01815 setlinewidth
0.51943 0.44614 Mdot
0 0 0 setrgbcolor
0.01575 setlinewidth
0.60936 0.55953 Mdot
0 0 0 setrgbcolor
0.00547 setlinewidth
0.47068 0.46243 Mdot
0 0 0 setrgbcolor
0.01038 setlinewidth
0.52485 0.44541 Mdot
0 0 0 setrgbcolor
0.00679 setlinewidth
0.52356 0.44479 Mdot
0 0 0 setrgbcolor
0.00626 setlinewidth
0.51899 0.44479 Mdot
0 0 0 setrgbcolor
0.01909 setlinewidth
0.46018 0.47007 Mdot
0 0 0 setrgbcolor
0.01366 setlinewidth
0.5602 0.61808 Mdot
0 0 0 setrgbcolor
0.00844 setlinewidth
0.51251 0.44509 Mdot
0 0 0 setrgbcolor
0.01995 setlinewidth
0.59945 0.58513 Mdot
0 0 0 setrgbcolor
0.01602 setlinewidth
0.45127 0.47846 Mdot
0 0 0 setrgbcolor
0.01295 setlinewidth
0.58063 0.60681 Mdot
0 0 0 setrgbcolor
0.01825 setlinewidth
0.52651 0.44366 Mdot
0 0 0 setrgbcolor
0.01022 setlinewidth
0.55651 0.62138 Mdot
0 0 0 setrgbcolor
0.01695 setlinewidth
0.52455 0.44278 Mdot
0 0 0 setrgbcolor
0.01404 setlinewidth
0.60903 0.50012 Mdot
0 0 0 setrgbcolor
0.01887 setlinewidth
0.47286 0.45713 Mdot
0 0 0 setrgbcolor
0.00872 setlinewidth
0.53435 0.44229 Mdot
0 0 0 setrgbcolor
0.00669 setlinewidth
0.52061 0.44113 Mdot
0 0 0 setrgbcolor
0.01768 setlinewidth
0.48355 0.44952 Mdot
0 0 0 setrgbcolor
0.00805 setlinewidth
0.52562 0.43958 Mdot
0 0 0 setrgbcolor
0.01374 setlinewidth
0.5411 0.44124 Mdot
0 0 0 setrgbcolor
0.01433 setlinewidth
0.52348 0.43944 Mdot
0 0 0 setrgbcolor
0.00767 setlinewidth
0.45007 0.59837 Mdot
0 0 0 setrgbcolor
0.01441 setlinewidth
0.47116 0.45368 Mdot
0 0 0 setrgbcolor
0.01992 setlinewidth
0.47663 0.62029 Mdot
0 0 0 setrgbcolor
0.01374 setlinewidth
0.54152 0.43914 Mdot
0 0 0 setrgbcolor
0.01362 setlinewidth
0.49345 0.4416 Mdot
0 0 0 setrgbcolor
0.01948 setlinewidth
0.6151 0.49968 Mdot
0 0 0 setrgbcolor
0.01761 setlinewidth
0.43337 0.57823 Mdot
0 0 0 setrgbcolor
0.01339 setlinewidth
0.48033 0.44335 Mdot
0 0 0 setrgbcolor
0.01917 setlinewidth
0.58783 0.61412 Mdot
0 0 0 setrgbcolor
0.007 setlinewidth
0.4861 0.44006 Mdot
0 0 0 setrgbcolor
0.0173 setlinewidth
0.46451 0.4509 Mdot
0 0 0 setrgbcolor
0.00503 setlinewidth
0.56297 0.44021 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.43706 0.5934 Mdot
0 0 0 setrgbcolor
0.01821 setlinewidth
0.52344 0.42974 Mdot
0 0 0 setrgbcolor
0.00558 setlinewidth
0.46698 0.4452 Mdot
0 0 0 setrgbcolor
0.01084 setlinewidth
0.59138 0.45191 Mdot
0 0 0 setrgbcolor
0.01422 setlinewidth
0.42674 0.58424 Mdot
0 0 0 setrgbcolor
0.01953 setlinewidth
0.4377 0.6016 Mdot
0 0 0 setrgbcolor
0.01719 setlinewidth
0.56869 0.6338 Mdot
0 0 0 setrgbcolor
0.01984 setlinewidth
0.60749 0.46535 Mdot
0 0 0 setrgbcolor
0.01942 setlinewidth
0.60817 0.46518 Mdot
0 0 0 setrgbcolor
0.01233 setlinewidth
0.4837 0.4322 Mdot
0 0 0 setrgbcolor
0.01771 setlinewidth
0.62198 0.58448 Mdot
0 0 0 setrgbcolor
0.00888 setlinewidth
0.47491 0.63517 Mdot
0 0 0 setrgbcolor
0.01003 setlinewidth
0.42662 0.59199 Mdot
0 0 0 setrgbcolor
0.00516 setlinewidth
0.50811 0.42449 Mdot
0 0 0 setrgbcolor
0.01524 setlinewidth
0.62251 0.58671 Mdot
0 0 0 setrgbcolor
0.01338 setlinewidth
0.53331 0.42333 Mdot
0 0 0 setrgbcolor
0.01056 setlinewidth
0.44707 0.61878 Mdot
0 0 0 setrgbcolor
0.01515 setlinewidth
0.47968 0.43066 Mdot
0 0 0 setrgbcolor
0.01175 setlinewidth
0.53555 0.42151 Mdot
0 0 0 setrgbcolor
0.01872 setlinewidth
0.42 0.48509 Mdot
0 0 0 setrgbcolor
0.01328 setlinewidth
0.4929 0.42465 Mdot
0 0 0 setrgbcolor
0.00878 setlinewidth
0.62184 0.5943 Mdot
0 0 0 setrgbcolor
0.0167 setlinewidth
0.54604 0.4225 Mdot
0 0 0 setrgbcolor
0.01838 setlinewidth
0.56338 0.64335 Mdot
0 0 0 setrgbcolor
0.01373 setlinewidth
0.63434 0.56652 Mdot
0 0 0 setrgbcolor
0.01737 setlinewidth
0.42989 0.60364 Mdot
0 0 0 setrgbcolor
0.00835 setlinewidth
0.43031 0.46645 Mdot
0 0 0 setrgbcolor
0.01516 setlinewidth
0.55136 0.64743 Mdot
0 0 0 setrgbcolor
0.01917 setlinewidth
0.56183 0.64427 Mdot
0 0 0 setrgbcolor
0.01882 setlinewidth
0.57078 0.43002 Mdot
0 0 0 setrgbcolor
0.01079 setlinewidth
0.43034 0.46629 Mdot
0 0 0 setrgbcolor
0.01542 setlinewidth
0.54581 0.64875 Mdot
0 0 0 setrgbcolor
0.01419 setlinewidth
0.61559 0.46593 Mdot
0 0 0 setrgbcolor
0.00516 setlinewidth
0.63833 0.54503 Mdot
0 0 0 setrgbcolor
0.01199 setlinewidth
0.57604 0.63815 Mdot
0 0 0 setrgbcolor
0.01325 setlinewidth
0.43816 0.61375 Mdot
0 0 0 setrgbcolor
0.00794 setlinewidth
0.59439 0.44439 Mdot
0 0 0 setrgbcolor
0.00591 setlinewidth
0.49865 0.64829 Mdot
0 0 0 setrgbcolor
0.01609 setlinewidth
0.51674 0.65071 Mdot
0 0 0 setrgbcolor
0.01645 setlinewidth
0.54109 0.42131 Mdot
0 0 0 setrgbcolor
0.00507 setlinewidth
0.61673 0.60276 Mdot
0 0 0 setrgbcolor
0.01191 setlinewidth
0.56361 0.64332 Mdot
0 0 0 setrgbcolor
0.01212 setlinewidth
0.42182 0.59048 Mdot
0 0 0 setrgbcolor
0.00644 setlinewidth
0.48398 0.42693 Mdot
0 0 0 setrgbcolor
0.01435 setlinewidth
0.55255 0.42392 Mdot
0 0 0 setrgbcolor
0.00554 setlinewidth
0.43597 0.61081 Mdot
0 0 0 setrgbcolor
0.01541 setlinewidth
0.63765 0.54758 Mdot
0 0 0 setrgbcolor
0.01953 setlinewidth
0.4945 0.64695 Mdot
0 0 0 setrgbcolor
0.01068 setlinewidth
0.41432 0.49786 Mdot
0 0 0 setrgbcolor
0.01489 setlinewidth
0.43502 0.60933 Mdot
0 0 0 setrgbcolor
0.01618 setlinewidth
0.47082 0.63779 Mdot
0 0 0 setrgbcolor
0.01611 setlinewidth
0.48281 0.64254 Mdot
0 0 0 setrgbcolor
0.01031 setlinewidth
0.51955 0.64827 Mdot
0 0 0 setrgbcolor
0.00669 setlinewidth
0.42579 0.47893 Mdot
0 0 0 setrgbcolor
0.01107 setlinewidth
0.5108 0.42443 Mdot
0 0 0 setrgbcolor
0.01092 setlinewidth
0.55361 0.42805 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.41759 0.4992 Mdot
0 0 0 setrgbcolor
0.01116 setlinewidth
0.51152 0.64613 Mdot
0 0 0 setrgbcolor
0.0064 setlinewidth
0.62352 0.58327 Mdot
0 0 0 setrgbcolor
0.01402 setlinewidth
0.5433 0.64472 Mdot
0 0 0 setrgbcolor
0.01945 setlinewidth
0.52336 0.64584 Mdot
0 0 0 setrgbcolor
0.0106 setlinewidth
0.57975 0.44052 Mdot
0 0 0 setrgbcolor
0.01974 setlinewidth
0.55449 0.64104 Mdot
0 0 0 setrgbcolor
0.01454 setlinewidth
0.43524 0.60191 Mdot
0 0 0 setrgbcolor
0.00855 setlinewidth
0.60461 0.60838 Mdot
0 0 0 setrgbcolor
0.01256 setlinewidth
0.49147 0.43096 Mdot
0 0 0 setrgbcolor
0.01863 setlinewidth
0.62524 0.57303 Mdot
0 0 0 setrgbcolor
0.00954 setlinewidth
0.42889 0.58709 Mdot
0 0 0 setrgbcolor
0.01508 setlinewidth
0.41576 0.53229 Mdot
0 0 0 setrgbcolor
0.01536 setlinewidth
0.53436 0.42869 Mdot
0 0 0 setrgbcolor
0.01182 setlinewidth
0.53691 0.64169 Mdot
0 0 0 setrgbcolor
0.01182 setlinewidth
0.49138 0.63776 Mdot
0 0 0 setrgbcolor
0.0066 setlinewidth
0.41877 0.5131 Mdot
0 0 0 setrgbcolor
0.01487 setlinewidth
0.5222 0.64175 Mdot
0 0 0 setrgbcolor
0.01768 setlinewidth
0.59768 0.6096 Mdot
0 0 0 setrgbcolor
0.00642 setlinewidth
0.60069 0.60546 Mdot
0 0 0 setrgbcolor
0.01061 setlinewidth
0.47818 0.44104 Mdot
0 0 0 setrgbcolor
0.00687 setlinewidth
0.52483 0.43155 Mdot
0 0 0 setrgbcolor
0.01325 setlinewidth
0.58551 0.4528 Mdot
0 0 0 setrgbcolor
0.00675 setlinewidth
0.57995 0.44939 Mdot
0 0 0 setrgbcolor
0.01749 setlinewidth
0.54157 0.63641 Mdot
0 0 0 setrgbcolor
0.01856 setlinewidth
0.57436 0.44667 Mdot
0 0 0 setrgbcolor
0.01095 setlinewidth
0.44586 0.46984 Mdot
0 0 0 setrgbcolor
0.01486 setlinewidth
0.61417 0.49223 Mdot
0 0 0 setrgbcolor
0.01074 setlinewidth
0.45616 0.61026 Mdot
0 0 0 setrgbcolor
0.00641 setlinewidth
0.59327 0.60644 Mdot
0 0 0 setrgbcolor
0.01186 setlinewidth
0.51575 0.6341 Mdot
0 0 0 setrgbcolor
0.01546 setlinewidth
0.5647 0.44602 Mdot
0 0 0 setrgbcolor
0.00757 setlinewidth
0.52014 0.63324 Mdot
0 0 0 setrgbcolor
0.01118 setlinewidth
0.61522 0.56631 Mdot
0 0 0 setrgbcolor
0.00963 setlinewidth
0.54193 0.62987 Mdot
0 0 0 setrgbcolor
0.00779 setlinewidth
0.52384 0.6316 Mdot
0 0 0 setrgbcolor
0.01878 setlinewidth
0.52306 0.63094 Mdot
0 0 0 setrgbcolor
0.01741 setlinewidth
0.42909 0.51904 Mdot
0 0 0 setrgbcolor
0.01019 setlinewidth
0.51358 0.62975 Mdot
0 0 0 setrgbcolor
0.0135 setlinewidth
0.49124 0.62441 Mdot
0 0 0 setrgbcolor
0.01878 setlinewidth
0.43812 0.57619 Mdot
0 0 0 setrgbcolor
0.01133 setlinewidth
0.61053 0.56886 Mdot
0 0 0 setrgbcolor
0.00971 setlinewidth
0.45836 0.60291 Mdot
0 0 0 setrgbcolor
0.01965 setlinewidth
0.54165 0.62704 Mdot
0 0 0 setrgbcolor
0.00655 setlinewidth
0.44643 0.48237 Mdot
0 0 0 setrgbcolor
0.0103 setlinewidth
0.4586 0.60117 Mdot
0 0 0 setrgbcolor
0.00555 setlinewidth
0.51549 0.62665 Mdot
1 1 1 setrgbcolor
0.00757 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01896 setlinewidth
0.49751 0.62261 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.50723 0.6228 Mdot
0 0 0 setrgbcolor
0.01685 setlinewidth
0.53445 0.62321 Mdot
0 0 0 setrgbcolor
0.01549 setlinewidth
0.58658 0.59553 Mdot
0 0 0 setrgbcolor
0.01705 setlinewidth
0.56911 0.46196 Mdot
0 0 0 setrgbcolor
0.00705 setlinewidth
0.58101 0.59755 Mdot
0 0 0 setrgbcolor
0.0141 setlinewidth
0.58352 0.48001 Mdot
0 0 0 setrgbcolor
0.00548 setlinewidth
0.5884 0.48846 Mdot
0 0 0 setrgbcolor
0.01672 setlinewidth
0.58464 0.48445 Mdot
0 0 0 setrgbcolor
0.01563 setlinewidth
0.5543 0.60634 Mdot
0 0 0 setrgbcolor
0.00533 setlinewidth
0.5633 0.59921 Mdot
0 0 0 setrgbcolor
0.01138 setlinewidth
0.59539 0.51463 Mdot
0 0 0 setrgbcolor
0.00578 setlinewidth
0.47649 0.59343 Mdot
0 0 0 setrgbcolor
0.01831 setlinewidth
0.54043 0.46872 Mdot
0 0 0 setrgbcolor
0.0171 setlinewidth
0.58378 0.56192 Mdot
0 0 0 setrgbcolor
0.01993 setlinewidth
0.50639 0.59748 Mdot
0 0 0 setrgbcolor
0.01398 setlinewidth
0.47361 0.51 Mdot
0 0 0 setrgbcolor
0.0055 setlinewidth
0.5268 0.59032 Mdot
0 0 0 setrgbcolor
0.01008 setlinewidth
0.49 0.57617 Mdot
0 0 0 setrgbcolor
0.01156 setlinewidth
0.47903 0.51707 Mdot
0 0 0 setrgbcolor
0.00696 setlinewidth
0.50594 0.49533 Mdot
0 0 0 setrgbcolor
0.01099 setlinewidth
0.52739 0.50206 Mdot
0 0 0 setrgbcolor
0.00778 setlinewidth
0.49676 0.54078 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01547 setlinewidth
0.52227 0.52275 Mdot
0 0 0 setrgbcolor
0.01447 setlinewidth
0.54103 0.52418 Mdot
0 0 0 setrgbcolor
0.01809 setlinewidth
0.50109 0.53513 Mdot
0 0 0 setrgbcolor
0.01452 setlinewidth
0.50058 0.52095 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.4943 0.51793 Mdot
0 0 0 setrgbcolor
0.01608 setlinewidth
0.55792 0.51517 Mdot
0 0 0 setrgbcolor
0.00832 setlinewidth
0.54957 0.50178 Mdot
0 0 0 setrgbcolor
0.0089 setlinewidth
0.56646 0.53891 Mdot
0 0 0 setrgbcolor
0.0103 setlinewidth
0.55527 0.50585 Mdot
0 0 0 setrgbcolor
0.01259 setlinewidth
0.56031 0.56073 Mdot
0 0 0 setrgbcolor
0.01377 setlinewidth
0.54786 0.4939 Mdot
0 0 0 setrgbcolor
0.01435 setlinewidth
0.53483 0.47868 Mdot
0 0 0 setrgbcolor
0.00702 setlinewidth
0.57172 0.57382 Mdot
0 0 0 setrgbcolor
0.01295 setlinewidth
0.527 0.47297 Mdot
0 0 0 setrgbcolor
0.01323 setlinewidth
0.55822 0.4822 Mdot
0 0 0 setrgbcolor
0.01077 setlinewidth
0.57716 0.57927 Mdot
0 0 0 setrgbcolor
0.01772 setlinewidth
0.45244 0.53023 Mdot
0 0 0 setrgbcolor
0.01398 setlinewidth
0.54662 0.46835 Mdot
0 0 0 setrgbcolor
0.01067 setlinewidth
0.56163 0.47364 Mdot
0 0 0 setrgbcolor
0.00858 setlinewidth
0.52192 0.46148 Mdot
0 0 0 setrgbcolor
0.01598 setlinewidth
0.54138 0.46291 Mdot
0 0 0 setrgbcolor
0.00829 setlinewidth
0.57372 0.59345 Mdot
0 0 0 setrgbcolor
0.01695 setlinewidth
0.59634 0.56527 Mdot
0 0 0 setrgbcolor
0.00713 setlinewidth
0.486 0.46429 Mdot
0 0 0 setrgbcolor
0.00699 setlinewidth
0.45529 0.48673 Mdot
0 0 0 setrgbcolor
0.01289 setlinewidth
0.46321 0.47667 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.47843 0.46426 Mdot
0 0 0 setrgbcolor
0.01103 setlinewidth
0.47828 0.46405 Mdot
0 0 0 setrgbcolor
0.01243 setlinewidth
0.47282 0.46711 Mdot
0 0 0 setrgbcolor
0.01564 setlinewidth
0.55338 0.45544 Mdot
0 0 0 setrgbcolor
0.01001 setlinewidth
0.52992 0.44992 Mdot
0 0 0 setrgbcolor
0.01778 setlinewidth
0.59653 0.48891 Mdot
0 0 0 setrgbcolor
0.00705 setlinewidth
0.55205 0.45245 Mdot
0 0 0 setrgbcolor
0.01473 setlinewidth
0.51952 0.4471 Mdot
0 0 0 setrgbcolor
0.01297 setlinewidth
0.47335 0.46136 Mdot
0 0 0 setrgbcolor
0.0186 setlinewidth
0.52684 0.44507 Mdot
0 0 0 setrgbcolor
0.00682 setlinewidth
0.51717 0.44456 Mdot
0 0 0 setrgbcolor
0.01911 setlinewidth
0.47089 0.61052 Mdot
1 1 1 setrgbcolor
0.01549 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00736 setlinewidth
0.45011 0.59229 Mdot
0 0 0 setrgbcolor
0.01501 setlinewidth
0.4825 0.45182 Mdot
0 0 0 setrgbcolor
0.00685 setlinewidth
0.5197 0.44241 Mdot
0 0 0 setrgbcolor
0.01199 setlinewidth
0.51211 0.44248 Mdot
0 0 0 setrgbcolor
0.01956 setlinewidth
0.46996 0.45815 Mdot
0 0 0 setrgbcolor
0.01442 setlinewidth
0.53931 0.44281 Mdot
0 0 0 setrgbcolor
0.01636 setlinewidth
0.5187 0.44111 Mdot
0 0 0 setrgbcolor
0.01249 setlinewidth
0.52492 0.44078 Mdot
0 0 0 setrgbcolor
0.00872 setlinewidth
0.52335 0.44035 Mdot
0 0 0 setrgbcolor
0.0107 setlinewidth
0.55125 0.44435 Mdot
0 0 0 setrgbcolor
0.01509 setlinewidth
0.50085 0.62934 Mdot
0 0 0 setrgbcolor
0.00885 setlinewidth
0.52586 0.43873 Mdot
0 0 0 setrgbcolor
0.01131 setlinewidth
0.52351 0.43815 Mdot
0 0 0 setrgbcolor
0.00529 setlinewidth
0.61134 0.5767 Mdot
0 0 0 setrgbcolor
0.01116 setlinewidth
0.51877 0.43712 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.49007 0.44212 Mdot
0 0 0 setrgbcolor
0.00512 setlinewidth
0.45442 0.60749 Mdot
0 0 0 setrgbcolor
0.0102 setlinewidth
0.53307 0.43606 Mdot
0 0 0 setrgbcolor
0.00687 setlinewidth
0.52092 0.43493 Mdot
0 0 0 setrgbcolor
0.01063 setlinewidth
0.46072 0.45651 Mdot
0 0 0 setrgbcolor
0.01842 setlinewidth
0.52316 0.43472 Mdot
0 0 0 setrgbcolor
0.00667 setlinewidth
0.47599 0.44613 Mdot
0 0 0 setrgbcolor
0.01971 setlinewidth
0.62172 0.55936 Mdot
0 0 0 setrgbcolor
0.00942 setlinewidth
0.62344 0.55307 Mdot
0 0 0 setrgbcolor
0.01676 setlinewidth
0.58744 0.61484 Mdot
0 0 0 setrgbcolor
0.01932 setlinewidth
0.481 0.44182 Mdot
0 0 0 setrgbcolor
0.01405 setlinewidth
0.53915 0.43391 Mdot
0 0 0 setrgbcolor
0.00961 setlinewidth
0.62315 0.51188 Mdot
0 0 0 setrgbcolor
0.01373 setlinewidth
0.58372 0.61886 Mdot
0 0 0 setrgbcolor
0.00992 setlinewidth
0.6195 0.57427 Mdot
0 0 0 setrgbcolor
0.01497 setlinewidth
0.44067 0.59973 Mdot
0 0 0 setrgbcolor
0.01373 setlinewidth
0.53857 0.4317 Mdot
0 0 0 setrgbcolor
0.01753 setlinewidth
0.46082 0.45033 Mdot
0 0 0 setrgbcolor
0.01098 setlinewidth
0.60645 0.6001 Mdot
0 0 0 setrgbcolor
0.01955 setlinewidth
0.45424 0.616 Mdot
0 0 0 setrgbcolor
0.01231 setlinewidth
0.6294 0.54627 Mdot
0 0 0 setrgbcolor
0.01513 setlinewidth
0.6227 0.57462 Mdot
0 0 0 setrgbcolor
0.007 setlinewidth
0.61892 0.48419 Mdot
0 0 0 setrgbcolor
0.01974 setlinewidth
0.51573 0.42513 Mdot
0 0 0 setrgbcolor
0.01255 setlinewidth
0.43923 0.6079 Mdot
0 0 0 setrgbcolor
0.01801 setlinewidth
0.55872 0.42941 Mdot
0 0 0 setrgbcolor
0.01347 setlinewidth
0.47325 0.43437 Mdot
0 0 0 setrgbcolor
0.01139 setlinewidth
0.62333 0.48288 Mdot
0 0 0 setrgbcolor
0.01593 setlinewidth
0.49506 0.64549 Mdot
0 0 0 setrgbcolor
0.01585 setlinewidth
0.61169 0.60696 Mdot
0 0 0 setrgbcolor
0.00784 setlinewidth
0.46291 0.63265 Mdot
0 0 0 setrgbcolor
0.0076 setlinewidth
0.41347 0.49926 Mdot
0 0 0 setrgbcolor
0.01059 setlinewidth
0.49566 0.42247 Mdot
0 0 0 setrgbcolor
0.00935 setlinewidth
0.4666 0.4336 Mdot
0 0 0 setrgbcolor
0.00547 setlinewidth
0.59195 0.63056 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.58752 0.43706 Mdot
0 0 0 setrgbcolor
0.0188 setlinewidth
0.52053 0.41713 Mdot
0 0 0 setrgbcolor
0.01251 setlinewidth
0.41874 0.47865 Mdot
0 0 0 setrgbcolor
0.01566 setlinewidth
0.4392 0.61983 Mdot
0 0 0 setrgbcolor
0.019 setlinewidth
0.4772 0.42535 Mdot
0 0 0 setrgbcolor
0.0175 setlinewidth
0.41824 0.47851 Mdot
0 0 0 setrgbcolor
0.0053 setlinewidth
0.60517 0.44854 Mdot
0 0 0 setrgbcolor
0.00665 setlinewidth
0.60544 0.44827 Mdot
0 0 0 setrgbcolor
0.01283 setlinewidth
0.52028 0.41502 Mdot
0 0 0 setrgbcolor
0.01685 setlinewidth
0.63825 0.57113 Mdot
0 0 0 setrgbcolor
0.01021 setlinewidth
0.44709 0.62922 Mdot
0 0 0 setrgbcolor
0.00803 setlinewidth
0.40415 0.51365 Mdot
0 0 0 setrgbcolor
0.00631 setlinewidth
0.42619 0.60768 Mdot
0 0 0 setrgbcolor
0.0122 setlinewidth
0.63806 0.57348 Mdot
0 0 0 setrgbcolor
0.01882 setlinewidth
0.52996 0.41438 Mdot
0 0 0 setrgbcolor
0.01404 setlinewidth
0.44328 0.62659 Mdot
0 0 0 setrgbcolor
0.01365 setlinewidth
0.44158 0.62524 Mdot
0 0 0 setrgbcolor
0.01647 setlinewidth
0.46353 0.4295 Mdot
0 0 0 setrgbcolor
0.01325 setlinewidth
0.58152 0.64183 Mdot
0 0 0 setrgbcolor
0.01981 setlinewidth
0.51313 0.65639 Mdot
0 0 0 setrgbcolor
0.01563 setlinewidth
0.48184 0.64956 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.56866 0.64789 Mdot
0 0 0 setrgbcolor
0.01477 setlinewidth
0.55468 0.4182 Mdot
0 0 0 setrgbcolor
0.01986 setlinewidth
0.53181 0.65637 Mdot
0 0 0 setrgbcolor
0.01654 setlinewidth
0.50762 0.65568 Mdot
0 0 0 setrgbcolor
0.00625 setlinewidth
0.57881 0.64311 Mdot
0 0 0 setrgbcolor
0.01415 setlinewidth
0.40953 0.49265 Mdot
0 0 0 setrgbcolor
0.01496 setlinewidth
0.56235 0.65013 Mdot
0 0 0 setrgbcolor
0.00818 setlinewidth
0.40366 0.51481 Mdot
0 0 0 setrgbcolor
0.01019 setlinewidth
0.52103 0.41421 Mdot
0 0 0 setrgbcolor
0.00834 setlinewidth
0.63497 0.58183 Mdot
0 0 0 setrgbcolor
0.01272 setlinewidth
0.49384 0.65286 Mdot
0 0 0 setrgbcolor
0.01372 setlinewidth
0.53255 0.41506 Mdot
0 0 0 setrgbcolor
0.00516 setlinewidth
0.59133 0.63477 Mdot
0 0 0 setrgbcolor
0.01078 setlinewidth
0.57974 0.42937 Mdot
0 0 0 setrgbcolor
0.01098 setlinewidth
0.43588 0.61795 Mdot
0 0 0 setrgbcolor
0.01601 setlinewidth
0.64219 0.55085 Mdot
0 0 0 setrgbcolor
0.0099 setlinewidth
0.60579 0.44835 Mdot
0 0 0 setrgbcolor
0.00711 setlinewidth
0.57792 0.64207 Mdot
0 0 0 setrgbcolor
0.01179 setlinewidth
0.40426 0.54928 Mdot
0 0 0 setrgbcolor
0.00571 setlinewidth
0.40399 0.52912 Mdot
0 0 0 setrgbcolor
0.01428 setlinewidth
0.42568 0.60372 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.64162 0.52774 Mdot
0 0 0 setrgbcolor
0.01138 setlinewidth
0.53024 0.65378 Mdot
0 0 0 setrgbcolor
0.01746 setlinewidth
0.48584 0.4228 Mdot
0 0 0 setrgbcolor
0.01267 setlinewidth
0.62671 0.59181 Mdot
0 0 0 setrgbcolor
0.0072 setlinewidth
0.46562 0.43285 Mdot
0 0 0 setrgbcolor
0.01555 setlinewidth
0.52038 0.65279 Mdot
0 0 0 setrgbcolor
0.00516 setlinewidth
0.63941 0.53067 Mdot
0 0 0 setrgbcolor
0.01482 setlinewidth
0.52988 0.41946 Mdot
0 0 0 setrgbcolor
0.01118 setlinewidth
0.53176 0.65087 Mdot
0 0 0 setrgbcolor
0.01463 setlinewidth
0.55248 0.64683 Mdot
0 0 0 setrgbcolor
0.01072 setlinewidth
0.49609 0.64716 Mdot
0 0 0 setrgbcolor
0.01751 setlinewidth
0.42211 0.48056 Mdot
0 0 0 setrgbcolor
0.01054 setlinewidth
0.45142 0.44559 Mdot
0 0 0 setrgbcolor
0.01232 setlinewidth
0.56271 0.64145 Mdot
0 0 0 setrgbcolor
0.01459 setlinewidth
0.50767 0.4235 Mdot
0 0 0 setrgbcolor
0.00973 setlinewidth
0.45344 0.62393 Mdot
0 0 0 setrgbcolor
0.01386 setlinewidth
0.55779 0.42817 Mdot
0 0 0 setrgbcolor
0.01565 setlinewidth
0.41083 0.53398 Mdot
0 0 0 setrgbcolor
0.01405 setlinewidth
0.52761 0.64697 Mdot
0 0 0 setrgbcolor
0.00823 setlinewidth
0.54304 0.64478 Mdot
0 0 0 setrgbcolor
0.01816 setlinewidth
0.49681 0.42815 Mdot
0 0 0 setrgbcolor
0.00649 setlinewidth
0.42816 0.59153 Mdot
0 0 0 setrgbcolor
0.00818 setlinewidth
0.42193 0.49358 Mdot
0 0 0 setrgbcolor
0.00876 setlinewidth
0.62578 0.5707 Mdot
0 0 0 setrgbcolor
0.01746 setlinewidth
0.45231 0.6162 Mdot
0 0 0 setrgbcolor
0.01752 setlinewidth
0.60883 0.60001 Mdot
0 0 0 setrgbcolor
0.00909 setlinewidth
0.45187 0.61439 Mdot
0 0 0 setrgbcolor
0.01602 setlinewidth
0.54493 0.63878 Mdot
0 0 0 setrgbcolor
0.0197 setlinewidth
0.51682 0.64017 Mdot
0 0 0 setrgbcolor
0.01419 setlinewidth
0.62439 0.5598 Mdot
0 0 0 setrgbcolor
0.01804 setlinewidth
0.48904 0.63373 Mdot
0 0 0 setrgbcolor
0.01549 setlinewidth
0.5208 0.63868 Mdot
0 0 0 setrgbcolor
0.00566 setlinewidth
0.5491 0.43576 Mdot
0 0 0 setrgbcolor
0.01817 setlinewidth
0.55551 0.43766 Mdot
0 0 0 setrgbcolor
0.01594 setlinewidth
0.56194 0.44029 Mdot
0 0 0 setrgbcolor
0.01319 setlinewidth
0.59961 0.60248 Mdot
0 0 0 setrgbcolor
0.01113 setlinewidth
0.51261 0.63607 Mdot
0 0 0 setrgbcolor
0.00664 setlinewidth
0.52376 0.63649 Mdot
0 0 0 setrgbcolor
0.01528 setlinewidth
0.52266 0.63593 Mdot
0 0 0 setrgbcolor
0.0122 setlinewidth
0.60178 0.59772 Mdot
0 0 0 setrgbcolor
0.01725 setlinewidth
0.49408 0.63104 Mdot
0 0 0 setrgbcolor
0.01093 setlinewidth
0.53767 0.43677 Mdot
1 1 1 setrgbcolor
0.01549 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01681 setlinewidth
0.54202 0.63209 Mdot
0 0 0 setrgbcolor
0.01175 setlinewidth
0.51314 0.63264 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.50344 0.62989 Mdot
0 0 0 setrgbcolor
0.01357 setlinewidth
0.54044 0.62924 Mdot
0 0 0 setrgbcolor
0.00727 setlinewidth
0.59238 0.6 Mdot
0 0 0 setrgbcolor
0.00997 setlinewidth
0.59656 0.47698 Mdot
0 0 0 setrgbcolor
0.00552 setlinewidth
0.53114 0.6264 Mdot
0 0 0 setrgbcolor
0.00657 setlinewidth
0.4648 0.6041 Mdot
0 0 0 setrgbcolor
0.01821 setlinewidth
0.60794 0.55466 Mdot
0 0 0 setrgbcolor
0.01062 setlinewidth
0.54125 0.45291 Mdot
0 0 0 setrgbcolor
0.01562 setlinewidth
0.60237 0.55813 Mdot
0 0 0 setrgbcolor
0.00679 setlinewidth
0.58011 0.58985 Mdot
0 0 0 setrgbcolor
0.00954 setlinewidth
0.44646 0.51836 Mdot
0 0 0 setrgbcolor
0.01427 setlinewidth
0.57409 0.59283 Mdot
0 0 0 setrgbcolor
0.0185 setlinewidth
0.49405 0.60406 Mdot
0 0 0 setrgbcolor
0.01639 setlinewidth
0.54645 0.6061 Mdot
0 0 0 setrgbcolor
0.01764 setlinewidth
0.55778 0.4695 Mdot
0 0 0 setrgbcolor
0.01122 setlinewidth
0.50956 0.46484 Mdot
0 0 0 setrgbcolor
0.01297 setlinewidth
0.45217 0.52491 Mdot
0 0 0 setrgbcolor
0.0153 setlinewidth
0.5592 0.47399 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.56379 0.47757 Mdot
0 0 0 setrgbcolor
0.00916 setlinewidth
0.47274 0.58446 Mdot
0 0 0 setrgbcolor
0.01089 setlinewidth
0.55418 0.59735 Mdot
0 0 0 setrgbcolor
0.00746 setlinewidth
0.47562 0.49821 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.57407 0.50393 Mdot
0 0 0 setrgbcolor
0.011 setlinewidth
0.51253 0.5937 Mdot
0 0 0 setrgbcolor
0.01029 setlinewidth
0.47218 0.54688 Mdot
0 0 0 setrgbcolor
0.0107 setlinewidth
0.56797 0.55537 Mdot
0 0 0 setrgbcolor
0.01028 setlinewidth
0.49767 0.50188 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01133 setlinewidth
0.52419 0.53675 Mdot
0 0 0 setrgbcolor
0.01381 setlinewidth
0.52131 0.52217 Mdot
0 0 0 setrgbcolor
0.01719 setlinewidth
0.51412 0.52005 Mdot
0 0 0 setrgbcolor
0.01859 setlinewidth
0.54409 0.52065 Mdot
0 0 0 setrgbcolor
0.00884 setlinewidth
0.56319 0.51924 Mdot
0 0 0 setrgbcolor
0.01436 setlinewidth
0.47006 0.53942 Mdot
0 0 0 setrgbcolor
0.01451 setlinewidth
0.56724 0.49473 Mdot
0 0 0 setrgbcolor
0.01319 setlinewidth
0.57804 0.50732 Mdot
0 0 0 setrgbcolor
0.01705 setlinewidth
0.57362 0.49805 Mdot
0 0 0 setrgbcolor
0.01911 setlinewidth
0.56381 0.48684 Mdot
0 0 0 setrgbcolor
0.01936 setlinewidth
0.54718 0.47318 Mdot
0 0 0 setrgbcolor
0.01604 setlinewidth
0.58715 0.5544 Mdot
0 0 0 setrgbcolor
0.01523 setlinewidth
0.59022 0.53072 Mdot
0 0 0 setrgbcolor
0.01356 setlinewidth
0.53778 0.46855 Mdot
0 0 0 setrgbcolor
0.01774 setlinewidth
0.46414 0.49435 Mdot
0 0 0 setrgbcolor
0.00515 setlinewidth
0.47048 0.48275 Mdot
0 0 0 setrgbcolor
0.00783 setlinewidth
0.49222 0.46632 Mdot
0 0 0 setrgbcolor
0.01796 setlinewidth
0.47849 0.4714 Mdot
0 0 0 setrgbcolor
0.00886 setlinewidth
0.52924 0.45757 Mdot
0 0 0 setrgbcolor
0.0087 setlinewidth
0.48387 0.46756 Mdot
0 0 0 setrgbcolor
0.01957 setlinewidth
0.57092 0.47314 Mdot
0 0 0 setrgbcolor
0.00765 setlinewidth
0.48364 0.46736 Mdot
0 0 0 setrgbcolor
0.01584 setlinewidth
0.55589 0.46068 Mdot
0 0 0 setrgbcolor
0.0177 setlinewidth
0.59915 0.56645 Mdot
0 0 0 setrgbcolor
0.01943 setlinewidth
0.54913 0.45592 Mdot
0 0 0 setrgbcolor
0.01356 setlinewidth
0.47721 0.46545 Mdot
0 0 0 setrgbcolor
0.0062 setlinewidth
0.47295 0.60401 Mdot
0 0 0 setrgbcolor
0.00822 setlinewidth
0.5718 0.46378 Mdot
0 0 0 setrgbcolor
0.00957 setlinewidth
0.49689 0.61981 Mdot
0 0 0 setrgbcolor
0.00867 setlinewidth
0.47222 0.46276 Mdot
0 0 0 setrgbcolor
0.0067 setlinewidth
0.60456 0.5714 Mdot
0 0 0 setrgbcolor
0.00647 setlinewidth
0.48409 0.45421 Mdot
0 0 0 setrgbcolor
0.01321 setlinewidth
0.53343 0.44445 Mdot
0 0 0 setrgbcolor
0.00766 setlinewidth
0.52187 0.44325 Mdot
0 0 0 setrgbcolor
0.00795 setlinewidth
0.60203 0.58681 Mdot
0 0 0 setrgbcolor
0.01849 setlinewidth
0.51847 0.44105 Mdot
0 0 0 setrgbcolor
0.01197 setlinewidth
0.47769 0.61921 Mdot
0 0 0 setrgbcolor
0.01904 setlinewidth
0.52852 0.43999 Mdot
0 0 0 setrgbcolor
0.0075 setlinewidth
0.55825 0.44635 Mdot
0 0 0 setrgbcolor
0.01506 setlinewidth
0.46079 0.46268 Mdot
0 0 0 setrgbcolor
0.01625 setlinewidth
0.5124 0.43976 Mdot
0 0 0 setrgbcolor
0.00522 setlinewidth
0.52022 0.43844 Mdot
0 0 0 setrgbcolor
0.00589 setlinewidth
0.55593 0.44349 Mdot
0 0 0 setrgbcolor
0.01564 setlinewidth
0.51867 0.43728 Mdot
0 0 0 setrgbcolor
0.01775 setlinewidth
0.48861 0.44308 Mdot
0 0 0 setrgbcolor
0.00885 setlinewidth
0.47444 0.44953 Mdot
0 0 0 setrgbcolor
0.0145 setlinewidth
0.62065 0.55398 Mdot
1 1 1 setrgbcolor
0.01114 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.0145 setlinewidth
0.52487 0.43593 Mdot
0 0 0 setrgbcolor
0.01308 setlinewidth
0.52311 0.43575 Mdot
0 0 0 setrgbcolor
0.00954 setlinewidth
0.4611 0.61332 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.52879 0.6351 Mdot
0 0 0 setrgbcolor
0.01158 setlinewidth
0.53999 0.43567 Mdot
0 0 0 setrgbcolor
0.01047 setlinewidth
0.47828 0.44431 Mdot
0 0 0 setrgbcolor
0.00691 setlinewidth
0.52496 0.43368 Mdot
0 0 0 setrgbcolor
0.01177 setlinewidth
0.52233 0.43349 Mdot
0 0 0 setrgbcolor
0.01957 setlinewidth
0.45833 0.45642 Mdot
0 0 0 setrgbcolor
0.01287 setlinewidth
0.51705 0.43321 Mdot
0 0 0 setrgbcolor
0.01171 setlinewidth
0.47666 0.6282 Mdot
0 0 0 setrgbcolor
0.01688 setlinewidth
0.55208 0.43533 Mdot
0 0 0 setrgbcolor
0.0195 setlinewidth
0.60746 0.47425 Mdot
0 0 0 setrgbcolor
0.0057 setlinewidth
0.51826 0.43063 Mdot
0 0 0 setrgbcolor
0.01915 setlinewidth
0.52044 0.43006 Mdot
0 0 0 setrgbcolor
0.01138 setlinewidth
0.53098 0.4298 Mdot
0 0 0 setrgbcolor
0.00611 setlinewidth
0.45835 0.62215 Mdot
0 0 0 setrgbcolor
0.01089 setlinewidth
0.53592 0.42662 Mdot
0 0 0 setrgbcolor
0.01531 setlinewidth
0.41376 0.51448 Mdot
0 0 0 setrgbcolor
0.01494 setlinewidth
0.53426 0.42448 Mdot
0 0 0 setrgbcolor
0.00642 setlinewidth
0.46527 0.43817 Mdot
0 0 0 setrgbcolor
0.00581 setlinewidth
0.63385 0.56397 Mdot
0 0 0 setrgbcolor
0.00742 setlinewidth
0.50776 0.42159 Mdot
0 0 0 setrgbcolor
0.00754 setlinewidth
0.61356 0.6076 Mdot
0 0 0 setrgbcolor
0.01077 setlinewidth
0.48405 0.64446 Mdot
0 0 0 setrgbcolor
0.01855 setlinewidth
0.61003 0.61237 Mdot
0 0 0 setrgbcolor
0.01445 setlinewidth
0.45622 0.43861 Mdot
0 0 0 setrgbcolor
0.01702 setlinewidth
0.41331 0.4927 Mdot
0 0 0 setrgbcolor
0.01007 setlinewidth
0.51893 0.65319 Mdot
0 0 0 setrgbcolor
0.00773 setlinewidth
0.64071 0.54431 Mdot
0 0 0 setrgbcolor
0.00754 setlinewidth
0.64139 0.53745 Mdot
0 0 0 setrgbcolor
0.01583 setlinewidth
0.63438 0.49432 Mdot
0 0 0 setrgbcolor
0.00617 setlinewidth
0.41226 0.49268 Mdot
0 0 0 setrgbcolor
0.01791 setlinewidth
0.6399 0.56034 Mdot
0 0 0 setrgbcolor
0.00818 setlinewidth
0.4839 0.42236 Mdot
0 0 0 setrgbcolor
0.01185 setlinewidth
0.62981 0.58944 Mdot
0 0 0 setrgbcolor
0.00868 setlinewidth
0.55157 0.41895 Mdot
0 0 0 setrgbcolor
0.01391 setlinewidth
0.45479 0.63488 Mdot
0 0 0 setrgbcolor
0.01519 setlinewidth
0.64214 0.56031 Mdot
0 0 0 setrgbcolor
0.00668 setlinewidth
0.64477 0.52952 Mdot
0 0 0 setrgbcolor
0.01337 setlinewidth
0.62349 0.46614 Mdot
0 0 0 setrgbcolor
0.0154 setlinewidth
0.40118 0.53106 Mdot
0 0 0 setrgbcolor
0.01561 setlinewidth
0.46323 0.42853 Mdot
0 0 0 setrgbcolor
0.01563 setlinewidth
0.50664 0.41283 Mdot
0 0 0 setrgbcolor
0.00534 setlinewidth
0.43731 0.62443 Mdot
0 0 0 setrgbcolor
0.00577 setlinewidth
0.46177 0.64363 Mdot
0 0 0 setrgbcolor
0.01949 setlinewidth
0.62572 0.46421 Mdot
0 0 0 setrgbcolor
0.01075 setlinewidth
0.63254 0.59614 Mdot
0 0 0 setrgbcolor
0.00652 setlinewidth
0.45647 0.64154 Mdot
0 0 0 setrgbcolor
0.01973 setlinewidth
0.45407 0.64044 Mdot
0 0 0 setrgbcolor
0.01885 setlinewidth
0.57875 0.42237 Mdot
0 0 0 setrgbcolor
0.01858 setlinewidth
0.50365 0.41084 Mdot
0 0 0 setrgbcolor
0.01038 setlinewidth
0.39972 0.50897 Mdot
0 0 0 setrgbcolor
0.01915 setlinewidth
0.39673 0.53263 Mdot
0 0 0 setrgbcolor
0.01122 setlinewidth
0.61336 0.62398 Mdot
0 0 0 setrgbcolor
0.0057 setlinewidth
0.44535 0.43536 Mdot
0 0 0 setrgbcolor
0.01778 setlinewidth
0.51172 0.40867 Mdot
0 0 0 setrgbcolor
0.01164 setlinewidth
0.59687 0.43155 Mdot
0 0 0 setrgbcolor
0.01298 setlinewidth
0.59666 0.43127 Mdot
0 0 0 setrgbcolor
0.01933 setlinewidth
0.49663 0.66005 Mdot
0 0 0 setrgbcolor
0.013 setlinewidth
0.39987 0.56811 Mdot
0 0 0 setrgbcolor
0.00645 setlinewidth
0.39613 0.5475 Mdot
0 0 0 setrgbcolor
0.00989 setlinewidth
0.52974 0.66273 Mdot
0 0 0 setrgbcolor
0.01201 setlinewidth
0.44238 0.63412 Mdot
0 0 0 setrgbcolor
0.01328 setlinewidth
0.52307 0.66284 Mdot
0 0 0 setrgbcolor
0.00604 setlinewidth
0.50788 0.66191 Mdot
0 0 0 setrgbcolor
0.0117 setlinewidth
0.42871 0.62102 Mdot
0 0 0 setrgbcolor
0.01379 setlinewidth
0.49906 0.41022 Mdot
0 0 0 setrgbcolor
0.00955 setlinewidth
0.54789 0.66016 Mdot
0 0 0 setrgbcolor
0.00678 setlinewidth
0.64878 0.55496 Mdot
0 0 0 setrgbcolor
0.01999 setlinewidth
0.53459 0.40869 Mdot
0 0 0 setrgbcolor
0.01489 setlinewidth
0.59787 0.63781 Mdot
0 0 0 setrgbcolor
0.01453 setlinewidth
0.50978 0.40925 Mdot
0 0 0 setrgbcolor
0.01998 setlinewidth
0.58488 0.64605 Mdot
0 0 0 setrgbcolor
0.008 setlinewidth
0.64778 0.55755 Mdot
0 0 0 setrgbcolor
0.01564 setlinewidth
0.57812 0.64934 Mdot
0 0 0 setrgbcolor
0.01462 setlinewidth
0.46109 0.42517 Mdot
0 0 0 setrgbcolor
0.00934 setlinewidth
0.4414 0.43892 Mdot
0 0 0 setrgbcolor
0.01807 setlinewidth
0.40336 0.4951 Mdot
0 0 0 setrgbcolor
0.00921 setlinewidth
0.59403 0.63964 Mdot
0 0 0 setrgbcolor
0.01183 setlinewidth
0.39876 0.55182 Mdot
0 0 0 setrgbcolor
0.00662 setlinewidth
0.42728 0.45447 Mdot
0 0 0 setrgbcolor
0.00722 setlinewidth
0.55939 0.41632 Mdot
0 0 0 setrgbcolor
0.00805 setlinewidth
0.54157 0.65804 Mdot
0 0 0 setrgbcolor
0.0169 setlinewidth
0.60384 0.62925 Mdot
0 0 0 setrgbcolor
0.00539 setlinewidth
0.40237 0.50871 Mdot
0 0 0 setrgbcolor
0.0198 setlinewidth
0.59022 0.6389 Mdot
0 0 0 setrgbcolor
0.0191 setlinewidth
0.42378 0.60855 Mdot
0 0 0 setrgbcolor
0.01321 setlinewidth
0.53034 0.65848 Mdot
0 0 0 setrgbcolor
0.01776 setlinewidth
0.45517 0.63827 Mdot
0 0 0 setrgbcolor
0.01404 setlinewidth
0.64213 0.56709 Mdot
0 0 0 setrgbcolor
0.0199 setlinewidth
0.58898 0.43183 Mdot
0 0 0 setrgbcolor
0.01882 setlinewidth
0.50308 0.65619 Mdot
0 0 0 setrgbcolor
0.00691 setlinewidth
0.50314 0.41457 Mdot
0 0 0 setrgbcolor
0.00782 setlinewidth
0.47936 0.42256 Mdot
0 0 0 setrgbcolor
0.0066 setlinewidth
0.54047 0.65497 Mdot
0 0 0 setrgbcolor
0.01954 setlinewidth
0.45048 0.63063 Mdot
0 0 0 setrgbcolor
0.00893 setlinewidth
0.64286 0.53353 Mdot
0 0 0 setrgbcolor
0.00811 setlinewidth
0.46785 0.42925 Mdot
0 0 0 setrgbcolor
0.01135 setlinewidth
0.44936 0.62886 Mdot
0 0 0 setrgbcolor
0.01809 setlinewidth
0.56071 0.64785 Mdot
0 0 0 setrgbcolor
0.00632 setlinewidth
0.63709 0.50942 Mdot
0 0 0 setrgbcolor
0.00775 setlinewidth
0.53329 0.65169 Mdot
0 0 0 setrgbcolor
0.0098 setlinewidth
0.53088 0.41911 Mdot
0 0 0 setrgbcolor
0.0155 setlinewidth
0.63087 0.57916 Mdot
0 0 0 setrgbcolor
0.01789 setlinewidth
0.5692 0.64087 Mdot
0 0 0 setrgbcolor
0.0182 setlinewidth
0.54849 0.64724 Mdot
0 0 0 setrgbcolor
0.01321 setlinewidth
0.48893 0.64365 Mdot
0 0 0 setrgbcolor
0.00535 setlinewidth
0.6333 0.513 Mdot
0 0 0 setrgbcolor
0.01678 setlinewidth
0.51844 0.64638 Mdot
0 0 0 setrgbcolor
0.00971 setlinewidth
0.49228 0.64025 Mdot
0 0 0 setrgbcolor
0.01114 setlinewidth
0.52168 0.64431 Mdot
0 0 0 setrgbcolor
0.01509 setlinewidth
0.54718 0.6409 Mdot
0 0 0 setrgbcolor
0.0098 setlinewidth
0.51226 0.64281 Mdot
1 1 1 setrgbcolor
0.01114 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.00632 setlinewidth
0.51916 0.42872 Mdot
0 0 0 setrgbcolor
0.00962 setlinewidth
0.52364 0.64166 Mdot
0 0 0 setrgbcolor
0.01127 setlinewidth
0.52226 0.64125 Mdot
0 0 0 setrgbcolor
0.01627 setlinewidth
0.526 0.42965 Mdot
0 0 0 setrgbcolor
0.01821 setlinewidth
0.45599 0.61674 Mdot
0 0 0 setrgbcolor
0.019 setlinewidth
0.50662 0.43173 Mdot
0 0 0 setrgbcolor
0.01266 setlinewidth
0.5006 0.6378 Mdot
0 0 0 setrgbcolor
0.01076 setlinewidth
0.51123 0.63925 Mdot
0 0 0 setrgbcolor
0.01043 setlinewidth
0.5329 0.43133 Mdot
0 0 0 setrgbcolor
0.01363 setlinewidth
0.60767 0.59092 Mdot
0 0 0 setrgbcolor
0.01258 setlinewidth
0.42219 0.53106 Mdot
0 0 0 setrgbcolor
0.01044 setlinewidth
0.54082 0.63452 Mdot
0 0 0 setrgbcolor
0.01933 setlinewidth
0.6212 0.55753 Mdot
0 0 0 setrgbcolor
0.01031 setlinewidth
0.5379 0.63185 Mdot
0 0 0 setrgbcolor
0.00661 setlinewidth
0.42777 0.53703 Mdot
0 0 0 setrgbcolor
0.00787 setlinewidth
0.52693 0.6303 Mdot
0 0 0 setrgbcolor
0.01939 setlinewidth
0.59649 0.59505 Mdot
0 0 0 setrgbcolor
0.01123 setlinewidth
0.61635 0.54641 Mdot
0 0 0 setrgbcolor
0.00637 setlinewidth
0.59756 0.58976 Mdot
0 0 0 setrgbcolor
0.01953 setlinewidth
0.45729 0.59554 Mdot
0 0 0 setrgbcolor
0.00558 setlinewidth
0.50899 0.44819 Mdot
0 0 0 setrgbcolor
0.01668 setlinewidth
0.48246 0.6127 Mdot
0 0 0 setrgbcolor
0.01548 setlinewidth
0.58658 0.59368 Mdot
0 0 0 setrgbcolor
0.01147 setlinewidth
0.57155 0.46416 Mdot
0 0 0 setrgbcolor
0.0062 setlinewidth
0.4764 0.46587 Mdot
0 0 0 setrgbcolor
0.01592 setlinewidth
0.44569 0.50593 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.44875 0.55689 Mdot
0 0 0 setrgbcolor
0.00655 setlinewidth
0.53609 0.60718 Mdot
0 0 0 setrgbcolor
0.01325 setlinewidth
0.52659 0.46291 Mdot
0 0 0 setrgbcolor
0.01221 setlinewidth
0.59378 0.5439 Mdot
0 0 0 setrgbcolor
0.01703 setlinewidth
0.49748 0.59941 Mdot
0 0 0 setrgbcolor
0.00517 setlinewidth
0.52822 0.4674 Mdot
0 0 0 setrgbcolor
0.00938 setlinewidth
0.56889 0.58514 Mdot
0 0 0 setrgbcolor
0.01086 setlinewidth
0.5628 0.58919 Mdot
0 0 0 setrgbcolor
0.00967 setlinewidth
0.58762 0.54848 Mdot
0 0 0 setrgbcolor
0.01155 setlinewidth
0.5334 0.4704 Mdot
0 0 0 setrgbcolor
0.01041 setlinewidth
0.54186 0.59696 Mdot
0 0 0 setrgbcolor
0.0176 setlinewidth
0.46668 0.50642 Mdot
0 0 0 setrgbcolor
0.01407 setlinewidth
0.54655 0.49639 Mdot
0 0 0 setrgbcolor
0.01932 setlinewidth
0.54711 0.5512 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.00765 setlinewidth
0.53639 0.51903 Mdot
0 0 0 setrgbcolor
0.01515 setlinewidth
0.54414 0.52012 Mdot
0 0 0 setrgbcolor
0.00757 setlinewidth
0.54946 0.53477 Mdot
0 0 0 setrgbcolor
0.01673 setlinewidth
0.49261 0.54596 Mdot
0 0 0 setrgbcolor
0.00873 setlinewidth
0.56674 0.51503 Mdot
0 0 0 setrgbcolor
0.01948 setlinewidth
0.47761 0.50058 Mdot
0 0 0 setrgbcolor
0.00598 setlinewidth
0.48184 0.48766 Mdot
0 0 0 setrgbcolor
0.01897 setlinewidth
0.58505 0.51065 Mdot
0 0 0 setrgbcolor
0.01624 setlinewidth
0.48762 0.47473 Mdot
0 0 0 setrgbcolor
0.00836 setlinewidth
0.50106 0.46727 Mdot
0 0 0 setrgbcolor
0.01533 setlinewidth
0.49239 0.46991 Mdot
0 0 0 setrgbcolor
0.01963 setlinewidth
0.49208 0.46975 Mdot
0 0 0 setrgbcolor
0.0076 setlinewidth
0.48446 0.46887 Mdot
0 0 0 setrgbcolor
0.01779 setlinewidth
0.54866 0.4622 Mdot
0 0 0 setrgbcolor
0.00814 setlinewidth
0.5592 0.46548 Mdot
0 0 0 setrgbcolor
0.01963 setlinewidth
0.58386 0.48461 Mdot
0 0 0 setrgbcolor
0.00734 setlinewidth
0.50102 0.61254 Mdot
0 0 0 setrgbcolor
0.01714 setlinewidth
0.57874 0.47697 Mdot
0 0 0 setrgbcolor
0.01228 setlinewidth
0.47807 0.46695 Mdot
0 0 0 setrgbcolor
0.00715 setlinewidth
0.59061 0.48708 Mdot
0 0 0 setrgbcolor
0.0161 setlinewidth
0.59672 0.49603 Mdot
0 0 0 setrgbcolor
0.00821 setlinewidth
0.53686 0.45229 Mdot
0 0 0 setrgbcolor
0.0142 setlinewidth
0.48842 0.45625 Mdot
0 0 0 setrgbcolor
0.01764 setlinewidth
0.46502 0.4688 Mdot
0 0 0 setrgbcolor
0.01944 setlinewidth
0.61278 0.54378 Mdot
0 0 0 setrgbcolor
0.00519 setlinewidth
0.52698 0.62548 Mdot
0 0 0 setrgbcolor
0.0187 setlinewidth
0.61221 0.51858 Mdot
0 0 0 setrgbcolor
0.01039 setlinewidth
0.56394 0.45123 Mdot
0 0 0 setrgbcolor
0.00954 setlinewidth
0.55593 0.44741 Mdot
0 0 0 setrgbcolor
0.01093 setlinewidth
0.50595 0.62774 Mdot
0 0 0 setrgbcolor
0.005 setlinewidth
0.58179 0.46172 Mdot
0 0 0 setrgbcolor
0.00742 setlinewidth
0.47601 0.45312 Mdot
0 0 0 setrgbcolor
0.01655 setlinewidth
0.48726 0.62411 Mdot
0 0 0 setrgbcolor
0.01568 setlinewidth
0.45997 0.46286 Mdot
0 0 0 setrgbcolor
0.01984 setlinewidth
0.52452 0.43883 Mdot
0 0 0 setrgbcolor
0.017 setlinewidth
0.48933 0.44417 Mdot
0 0 0 setrgbcolor
0.01947 setlinewidth
0.53659 0.43817 Mdot
0 0 0 setrgbcolor
0.00639 setlinewidth
0.52022 0.43714 Mdot
0 0 0 setrgbcolor
0.00627 setlinewidth
0.47834 0.44717 Mdot
0 0 0 setrgbcolor
0.00751 setlinewidth
0.51345 0.43683 Mdot
0 0 0 setrgbcolor
0.00517 setlinewidth
0.5798 0.45192 Mdot
0 0 0 setrgbcolor
0.01584 setlinewidth
0.52099 0.4342 Mdot
0 0 0 setrgbcolor
0.01633 setlinewidth
0.53001 0.43441 Mdot
0 0 0 setrgbcolor
0.01873 setlinewidth
0.4213 0.52968 Mdot
0 0 0 setrgbcolor
0.01897 setlinewidth
0.51893 0.43327 Mdot
0 0 0 setrgbcolor
0.01539 setlinewidth
0.62473 0.55471 Mdot
0 0 0 setrgbcolor
0.00554 setlinewidth
0.50406 0.63736 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.52284 0.43098 Mdot
0 0 0 setrgbcolor
0.00517 setlinewidth
0.5247 0.43087 Mdot
0 0 0 setrgbcolor
0.0087 setlinewidth
0.51556 0.42939 Mdot
0 0 0 setrgbcolor
0.00772 setlinewidth
0.48327 0.63383 Mdot
0 0 0 setrgbcolor
0.00748 setlinewidth
0.56127 0.43614 Mdot
0 0 0 setrgbcolor
0.01679 setlinewidth
0.52109 0.4288 Mdot
0 0 0 setrgbcolor
0.01193 setlinewidth
0.52384 0.42857 Mdot
1 1 1 setrgbcolor
0.00685 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00692 setlinewidth
0.558 0.43358 Mdot
0 0 0 setrgbcolor
0.01047 setlinewidth
0.55916 0.637 Mdot
0 0 0 setrgbcolor
0.01765 setlinewidth
0.5396 0.42814 Mdot
0 0 0 setrgbcolor
0.00734 setlinewidth
0.51566 0.42657 Mdot
0 0 0 setrgbcolor
0.00577 setlinewidth
0.62978 0.55917 Mdot
0 0 0 setrgbcolor
0.00685 setlinewidth
0.51763 0.42563 Mdot
0 0 0 setrgbcolor
0.01083 setlinewidth
0.4605 0.4432 Mdot
0 0 0 setrgbcolor
0.01048 setlinewidth
0.41478 0.50762 Mdot
0 0 0 setrgbcolor
0.0197 setlinewidth
0.52814 0.42363 Mdot
0 0 0 setrgbcolor
0.01657 setlinewidth
0.62844 0.57577 Mdot
0 0 0 setrgbcolor
0.01846 setlinewidth
0.55102 0.42585 Mdot
0 0 0 setrgbcolor
0.01476 setlinewidth
0.41322 0.50779 Mdot
0 0 0 setrgbcolor
0.01747 setlinewidth
0.53147 0.4196 Mdot
0 0 0 setrgbcolor
0.00918 setlinewidth
0.44949 0.44525 Mdot
0 0 0 setrgbcolor
0.01216 setlinewidth
0.52875 0.4177 Mdot
0 0 0 setrgbcolor
0.01887 setlinewidth
0.40609 0.54898 Mdot
0 0 0 setrgbcolor
0.01177 setlinewidth
0.64141 0.53863 Mdot
0 0 0 setrgbcolor
0.01326 setlinewidth
0.50007 0.41918 Mdot
0 0 0 setrgbcolor
0.00938 setlinewidth
0.50966 0.6535 Mdot
0 0 0 setrgbcolor
0.01049 setlinewidth
0.61397 0.45734 Mdot
0 0 0 setrgbcolor
0.00919 setlinewidth
0.47375 0.42406 Mdot
0 0 0 setrgbcolor
0.01941 setlinewidth
0.47616 0.64791 Mdot
0 0 0 setrgbcolor
0.00977 setlinewidth
0.45211 0.43393 Mdot
0 0 0 setrgbcolor
0.0135 setlinewidth
0.54546 0.65773 Mdot
0 0 0 setrgbcolor
0.01161 setlinewidth
0.45494 0.63977 Mdot
0 0 0 setrgbcolor
0.0165 setlinewidth
0.39744 0.52684 Mdot
0 0 0 setrgbcolor
0.0174 setlinewidth
0.39772 0.55157 Mdot
0 0 0 setrgbcolor
0.01892 setlinewidth
0.54169 0.40933 Mdot
0 0 0 setrgbcolor
0.00712 setlinewidth
0.48175 0.65621 Mdot
0 0 0 setrgbcolor
0.0159 setlinewidth
0.49252 0.41064 Mdot
0 0 0 setrgbcolor
0.01121 setlinewidth
0.47516 0.65487 Mdot
0 0 0 setrgbcolor
0.01733 setlinewidth
0.63682 0.59636 Mdot
0 0 0 setrgbcolor
0.0191 setlinewidth
0.63373 0.6019 Mdot
0 0 0 setrgbcolor
0.01208 setlinewidth
0.47215 0.65409 Mdot
0 0 0 setrgbcolor
0.01161 setlinewidth
0.65174 0.54746 Mdot
0 0 0 setrgbcolor
0.01537 setlinewidth
0.43096 0.44416 Mdot
0 0 0 setrgbcolor
0.01103 setlinewidth
0.40334 0.5877 Mdot
0 0 0 setrgbcolor
0.01829 setlinewidth
0.39616 0.56714 Mdot
0 0 0 setrgbcolor
0.01486 setlinewidth
0.48675 0.40924 Mdot
0 0 0 setrgbcolor
0.01186 setlinewidth
0.63941 0.47439 Mdot
0 0 0 setrgbcolor
0.01326 setlinewidth
0.65416 0.52585 Mdot
0 0 0 setrgbcolor
0.0116 setlinewidth
0.65361 0.51855 Mdot
0 0 0 setrgbcolor
0.01223 setlinewidth
0.64894 0.57502 Mdot
0 0 0 setrgbcolor
0.00958 setlinewidth
0.65503 0.54289 Mdot
0 0 0 setrgbcolor
0.01675 setlinewidth
0.6217 0.44675 Mdot
0 0 0 setrgbcolor
0.00795 setlinewidth
0.45475 0.6496 Mdot
0 0 0 setrgbcolor
0.01306 setlinewidth
0.65602 0.54261 Mdot
0 0 0 setrgbcolor
0.01399 setlinewidth
0.49245 0.40579 Mdot
0 0 0 setrgbcolor
0.01079 setlinewidth
0.65383 0.50984 Mdot
0 0 0 setrgbcolor
0.01825 setlinewidth
0.43824 0.63809 Mdot
0 0 0 setrgbcolor
0.0101 setlinewidth
0.5651 0.40867 Mdot
0 0 0 setrgbcolor
0.00549 setlinewidth
0.51458 0.66874 Mdot
0 0 0 setrgbcolor
0.00629 setlinewidth
0.39131 0.51262 Mdot
0 0 0 setrgbcolor
0.01172 setlinewidth
0.62131 0.44452 Mdot
0 0 0 setrgbcolor
0.01966 setlinewidth
0.39414 0.57158 Mdot
0 0 0 setrgbcolor
0.012 setlinewidth
0.64866 0.58198 Mdot
0 0 0 setrgbcolor
0.01425 setlinewidth
0.42076 0.44891 Mdot
0 0 0 setrgbcolor
0.00712 setlinewidth
0.47662 0.40972 Mdot
0 0 0 setrgbcolor
0.00539 setlinewidth
0.43842 0.43156 Mdot
0 0 0 setrgbcolor
0.01252 setlinewidth
0.40775 0.46725 Mdot
0 0 0 setrgbcolor
0.0142 setlinewidth
0.63135 0.6142 Mdot
0 0 0 setrgbcolor
0.01282 setlinewidth
0.52433 0.66927 Mdot
0 0 0 setrgbcolor
0.01092 setlinewidth
0.54763 0.667 Mdot
0 0 0 setrgbcolor
0.01678 setlinewidth
0.54011 0.66811 Mdot
0 0 0 setrgbcolor
0.01216 setlinewidth
0.58244 0.4154 Mdot
0 0 0 setrgbcolor
0.01723 setlinewidth
0.38952 0.52693 Mdot
0 0 0 setrgbcolor
0.01564 setlinewidth
0.58169 0.41516 Mdot
0 0 0 setrgbcolor
0.00634 setlinewidth
0.48565 0.40703 Mdot
0 0 0 setrgbcolor
0.01262 setlinewidth
0.51156 0.40226 Mdot
0 0 0 setrgbcolor
0.00988 setlinewidth
0.42568 0.62641 Mdot
0 0 0 setrgbcolor
0.01871 setlinewidth
0.56407 0.66192 Mdot
0 0 0 setrgbcolor
0.0189 setlinewidth
0.46158 0.65263 Mdot
0 0 0 setrgbcolor
0.01001 setlinewidth
0.59886 0.642 Mdot
0 0 0 setrgbcolor
0.01249 setlinewidth
0.59204 0.64644 Mdot
0 0 0 setrgbcolor
0.00748 setlinewidth
0.45142 0.4262 Mdot
0 0 0 setrgbcolor
0.01942 setlinewidth
0.47513 0.41394 Mdot
0 0 0 setrgbcolor
0.01439 setlinewidth
0.45337 0.64559 Mdot
0 0 0 setrgbcolor
0.01096 setlinewidth
0.61115 0.63148 Mdot
0 0 0 setrgbcolor
0.01017 setlinewidth
0.44008 0.43504 Mdot
0 0 0 setrgbcolor
0.00709 setlinewidth
0.45157 0.64395 Mdot
0 0 0 setrgbcolor
0.00676 setlinewidth
0.5121 0.66454 Mdot
0 0 0 setrgbcolor
0.01225 setlinewidth
0.5342 0.40628 Mdot
0 0 0 setrgbcolor
0.00753 setlinewidth
0.6063 0.63405 Mdot
0 0 0 setrgbcolor
0.01425 setlinewidth
0.55291 0.66096 Mdot
0 0 0 setrgbcolor
0.01932 setlinewidth
0.65205 0.53671 Mdot
0 0 0 setrgbcolor
0.01501 setlinewidth
0.54088 0.66305 Mdot
0 0 0 setrgbcolor
0.0184 setlinewidth
0.6502 0.53968 Mdot
0 0 0 setrgbcolor
0.01708 setlinewidth
0.54897 0.65811 Mdot
0 0 0 setrgbcolor
0.01274 setlinewidth
0.56549 0.4176 Mdot
0 0 0 setrgbcolor
0.01064 setlinewidth
0.59944 0.63406 Mdot
0 0 0 setrgbcolor
0.00641 setlinewidth
0.61242 0.62193 Mdot
0 0 0 setrgbcolor
0.01773 setlinewidth
0.50053 0.41427 Mdot
0 0 0 setrgbcolor
0.01969 setlinewidth
0.49111 0.65389 Mdot
0 0 0 setrgbcolor
0.01255 setlinewidth
0.53889 0.65588 Mdot
0 0 0 setrgbcolor
0.01488 setlinewidth
0.56733 0.64791 Mdot
0 0 0 setrgbcolor
0.00952 setlinewidth
0.40284 0.54762 Mdot
0 0 0 setrgbcolor
0.01265 setlinewidth
0.64201 0.55088 Mdot
0 0 0 setrgbcolor
0.00889 setlinewidth
0.45093 0.63092 Mdot
0 0 0 setrgbcolor
0.01889 setlinewidth
0.49239 0.65003 Mdot
0 0 0 setrgbcolor
0.01178 setlinewidth
0.55283 0.64916 Mdot
0 0 0 setrgbcolor
0.01156 setlinewidth
0.52054 0.65264 Mdot
0 0 0 setrgbcolor
0.01674 setlinewidth
0.40787 0.55303 Mdot
0 0 0 setrgbcolor
0.00857 setlinewidth
0.5733 0.63953 Mdot
1 1 1 setrgbcolor
0.00685 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01604 setlinewidth
0.5126 0.64989 Mdot
0 0 0 setrgbcolor
0.01894 setlinewidth
0.48634 0.42644 Mdot
0 0 0 setrgbcolor
0.011 setlinewidth
0.47355 0.43166 Mdot
0 0 0 setrgbcolor
0.00685 setlinewidth
0.52275 0.65009 Mdot
0 0 0 setrgbcolor
0.01611 setlinewidth
0.63523 0.51562 Mdot
0 0 0 setrgbcolor
0.01636 setlinewidth
0.499 0.64642 Mdot
0 0 0 setrgbcolor
0.01252 setlinewidth
0.49311 0.42629 Mdot
0 0 0 setrgbcolor
0.01269 setlinewidth
0.50992 0.64643 Mdot
0 0 0 setrgbcolor
0.01199 setlinewidth
0.52346 0.64713 Mdot
0 0 0 setrgbcolor
0.01331 setlinewidth
0.52186 0.64691 Mdot
0 0 0 setrgbcolor
0.00796 setlinewidth
0.49999 0.42692 Mdot
0 0 0 setrgbcolor
0.01395 setlinewidth
0.54804 0.64293 Mdot
0 0 0 setrgbcolor
0.01829 setlinewidth
0.62395 0.49128 Mdot
0 0 0 setrgbcolor
0.00959 setlinewidth
0.6281 0.56562 Mdot
0 0 0 setrgbcolor
0.00935 setlinewidth
0.44492 0.60914 Mdot
0 0 0 setrgbcolor
0.01685 setlinewidth
0.41846 0.51843 Mdot
0 0 0 setrgbcolor
0.01461 setlinewidth
0.61861 0.49579 Mdot
0 0 0 setrgbcolor
0.01541 setlinewidth
0.53828 0.63737 Mdot
0 0 0 setrgbcolor
0.0063 setlinewidth
0.44332 0.47224 Mdot
0 0 0 setrgbcolor
0.00766 setlinewidth
0.47252 0.6233 Mdot
0 0 0 setrgbcolor
0.00963 setlinewidth
0.42834 0.57063 Mdot
0 0 0 setrgbcolor
0.01989 setlinewidth
0.53407 0.63507 Mdot
0 0 0 setrgbcolor
0.01562 setlinewidth
0.522 0.63508 Mdot
0 0 0 setrgbcolor
0.00974 setlinewidth
0.47435 0.44862 Mdot
0 0 0 setrgbcolor
0.01901 setlinewidth
0.60047 0.5819 Mdot
0 0 0 setrgbcolor
0.01052 setlinewidth
0.43669 0.5159 Mdot
0 0 0 setrgbcolor
0.01411 setlinewidth
0.60914 0.54478 Mdot
0 0 0 setrgbcolor
0.0074 setlinewidth
0.58788 0.58805 Mdot
0 0 0 setrgbcolor
0.00599 setlinewidth
0.48265 0.60758 Mdot
0 0 0 setrgbcolor
0.01375 setlinewidth
0.54009 0.45508 Mdot
0 0 0 setrgbcolor
0.01864 setlinewidth
0.49174 0.46123 Mdot
0 0 0 setrgbcolor
0.01612 setlinewidth
0.58761 0.58238 Mdot
0 0 0 setrgbcolor
0.01039 setlinewidth
0.60071 0.53397 Mdot
0 0 0 setrgbcolor
0.01514 setlinewidth
0.49348 0.46568 Mdot
0 0 0 setrgbcolor
0.00642 setlinewidth
0.52367 0.60998 Mdot
0 0 0 setrgbcolor
0.01722 setlinewidth
0.57564 0.58823 Mdot
0 0 0 setrgbcolor
0.01504 setlinewidth
0.49889 0.46799 Mdot
0 0 0 setrgbcolor
0.0063 setlinewidth
0.52683 0.59856 Mdot
0 0 0 setrgbcolor
0.01793 setlinewidth
0.54739 0.58732 Mdot
0 0 0 setrgbcolor
0.00528 setlinewidth
0.55312 0.58217 Mdot
0 0 0 setrgbcolor
0.01459 setlinewidth
0.57284 0.53515 Mdot
0 0 0 setrgbcolor
0.01587 setlinewidth
0.56648 0.54095 Mdot
0 0 0 setrgbcolor
0.01905 setlinewidth
0.51421 0.4931 Mdot
0 0 0 setrgbcolor
0.01564 setlinewidth
0.52215 0.55026 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01763 setlinewidth
0.51915 0.5491 Mdot
0 0 0 setrgbcolor
0.01063 setlinewidth
0.49522 0.50468 Mdot
0 0 0 setrgbcolor
0.00676 setlinewidth
0.55999 0.51445 Mdot
0 0 0 setrgbcolor
0.01516 setlinewidth
0.56789 0.51438 Mdot
0 0 0 setrgbcolor
0.01671 setlinewidth
0.4969 0.49073 Mdot
0 0 0 setrgbcolor
0.01922 setlinewidth
0.57557 0.52879 Mdot
0 0 0 setrgbcolor
0.00652 setlinewidth
0.49989 0.47653 Mdot
0 0 0 setrgbcolor
0.0051 setlinewidth
0.50372 0.47082 Mdot
0 0 0 setrgbcolor
0.0183 setlinewidth
0.50334 0.47071 Mdot
0 0 0 setrgbcolor
0.01726 setlinewidth
0.51217 0.4667 Mdot
0 0 0 setrgbcolor
0.01998 setlinewidth
0.4949 0.47105 Mdot
0 0 0 setrgbcolor
0.01747 setlinewidth
0.58893 0.50565 Mdot
0 0 0 setrgbcolor
0.00504 setlinewidth
0.4874 0.47015 Mdot
0 0 0 setrgbcolor
0.01416 setlinewidth
0.47345 0.4742 Mdot
0 0 0 setrgbcolor
0.01497 setlinewidth
0.53309 0.61712 Mdot
0 0 0 setrgbcolor
0.00632 setlinewidth
0.49545 0.4575 Mdot
0 0 0 setrgbcolor
0.01093 setlinewidth
0.43606 0.54378 Mdot
0 0 0 setrgbcolor
0.00892 setlinewidth
0.46593 0.46899 Mdot
0 0 0 setrgbcolor
0.00638 setlinewidth
0.55896 0.45383 Mdot
0 0 0 setrgbcolor
0.00986 setlinewidth
0.48086 0.45638 Mdot
0 0 0 setrgbcolor
0.00907 setlinewidth
0.60524 0.49834 Mdot
0 0 0 setrgbcolor
0.00615 setlinewidth
0.54433 0.44554 Mdot
0 0 0 setrgbcolor
0.01501 setlinewidth
0.57007 0.45554 Mdot
0 0 0 setrgbcolor
0.01369 setlinewidth
0.48139 0.44993 Mdot
0 0 0 setrgbcolor
0.00582 setlinewidth
0.49238 0.44503 Mdot
0 0 0 setrgbcolor
0.01202 setlinewidth
0.51809 0.63131 Mdot
0 0 0 setrgbcolor
0.01165 setlinewidth
0.53797 0.63236 Mdot
0 0 0 setrgbcolor
0.01866 setlinewidth
0.59159 0.46437 Mdot
0 0 0 setrgbcolor
0.01941 setlinewidth
0.59828 0.47148 Mdot
0 0 0 setrgbcolor
0.01019 setlinewidth
0.5598 0.62694 Mdot
0 0 0 setrgbcolor
0.01506 setlinewidth
0.4235 0.52233 Mdot
0 0 0 setrgbcolor
0.00514 setlinewidth
0.52734 0.43376 Mdot
0 0 0 setrgbcolor
0.01764 setlinewidth
0.51525 0.43354 Mdot
0 0 0 setrgbcolor
0.0132 setlinewidth
0.4215 0.52278 Mdot
0 0 0 setrgbcolor
0.01926 setlinewidth
0.52233 0.43274 Mdot
0 0 0 setrgbcolor
0.01148 setlinewidth
0.60501 0.47302 Mdot
0 0 0 setrgbcolor
0.00905 setlinewidth
0.61262 0.48138 Mdot
0 0 0 setrgbcolor
0.00549 setlinewidth
0.56124 0.43747 Mdot
0 0 0 setrgbcolor
0.01098 setlinewidth
0.53917 0.43112 Mdot
0 0 0 setrgbcolor
0.01759 setlinewidth
0.52198 0.42961 Mdot
0 0 0 setrgbcolor
0.01363 setlinewidth
0.57011 0.44012 Mdot
0 0 0 setrgbcolor
0.00536 setlinewidth
0.51951 0.429 Mdot
0 0 0 setrgbcolor
0.01219 setlinewidth
0.513 0.64213 Mdot
0 0 0 setrgbcolor
0.00867 setlinewidth
0.45953 0.44895 Mdot
0 0 0 setrgbcolor
0.01511 setlinewidth
0.53117 0.42835 Mdot
0 0 0 setrgbcolor
0.0123 setlinewidth
0.53527 0.64279 Mdot
0 0 0 setrgbcolor
0.00761 setlinewidth
0.41901 0.56621 Mdot
0 0 0 setrgbcolor
0.01276 setlinewidth
0.52256 0.42603 Mdot
0 0 0 setrgbcolor
0.01209 setlinewidth
0.5244 0.42561 Mdot
0 0 0 setrgbcolor
0.01631 setlinewidth
0.58991 0.44814 Mdot
0 0 0 setrgbcolor
0.00652 setlinewidth
0.51444 0.42562 Mdot
0 0 0 setrgbcolor
0.00927 setlinewidth
0.51987 0.4241 Mdot
0 0 0 setrgbcolor
0.01705 setlinewidth
0.52256 0.42341 Mdot
0 0 0 setrgbcolor
0.01965 setlinewidth
0.44714 0.45294 Mdot
0 0 0 setrgbcolor
0.01158 setlinewidth
0.63548 0.52887 Mdot
0 0 0 setrgbcolor
0.00641 setlinewidth
0.63086 0.50259 Mdot
0 0 0 setrgbcolor
0.01498 setlinewidth
0.51332 0.42274 Mdot
0 0 0 setrgbcolor
0.0104 setlinewidth
0.51492 0.42145 Mdot
1 1 1 setrgbcolor
0.01238 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01856 setlinewidth
0.58486 0.43836 Mdot
0 0 0 setrgbcolor
0.00876 setlinewidth
0.53805 0.42039 Mdot
0 0 0 setrgbcolor
0.01439 setlinewidth
0.56201 0.42507 Mdot
0 0 0 setrgbcolor
0.00643 setlinewidth
0.55792 0.42298 Mdot
0 0 0 setrgbcolor
0.01953 setlinewidth
0.52467 0.41768 Mdot
0 0 0 setrgbcolor
0.01372 setlinewidth
0.59043 0.63464 Mdot
0 0 0 setrgbcolor
0.01067 setlinewidth
0.40331 0.5451 Mdot
0 0 0 setrgbcolor
0.01214 setlinewidth
0.49322 0.41788 Mdot
0 0 0 setrgbcolor
0.01288 setlinewidth
0.40704 0.57042 Mdot
0 0 0 setrgbcolor
0.01435 setlinewidth
0.54794 0.41622 Mdot
0 0 0 setrgbcolor
0.00601 setlinewidth
0.46605 0.42734 Mdot
0 0 0 setrgbcolor
0.01729 setlinewidth
0.52601 0.41304 Mdot
0 0 0 setrgbcolor
0.0142 setlinewidth
0.44487 0.44109 Mdot
0 0 0 setrgbcolor
0.01547 setlinewidth
0.64665 0.5387 Mdot
0 0 0 setrgbcolor
0.01699 setlinewidth
0.5223 0.41157 Mdot
0 0 0 setrgbcolor
0.01683 setlinewidth
0.50248 0.65816 Mdot
0 0 0 setrgbcolor
0.00647 setlinewidth
0.53862 0.65915 Mdot
0 0 0 setrgbcolor
0.01079 setlinewidth
0.4785 0.65283 Mdot
0 0 0 setrgbcolor
0.01636 setlinewidth
0.651 0.54271 Mdot
0 0 0 setrgbcolor
0.01091 setlinewidth
0.40457 0.58686 Mdot
0 0 0 setrgbcolor
0.01932 setlinewidth
0.42166 0.45526 Mdot
0 0 0 setrgbcolor
0.00892 setlinewidth
0.41494 0.6069 Mdot
0 0 0 setrgbcolor
0.0186 setlinewidth
0.65109 0.56043 Mdot
0 0 0 setrgbcolor
0.00761 setlinewidth
0.50624 0.66622 Mdot
0 0 0 setrgbcolor
0.00562 setlinewidth
0.47918 0.41064 Mdot
0 0 0 setrgbcolor
0.01769 setlinewidth
0.49866 0.66581 Mdot
0 0 0 setrgbcolor
0.00673 setlinewidth
0.49518 0.66546 Mdot
0 0 0 setrgbcolor
0.0077 setlinewidth
0.57332 0.65872 Mdot
0 0 0 setrgbcolor
0.00917 setlinewidth
0.61504 0.43878 Mdot
0 0 0 setrgbcolor
0.01119 setlinewidth
0.52948 0.40104 Mdot
0 0 0 setrgbcolor
0.00888 setlinewidth
0.65682 0.51956 Mdot
0 0 0 setrgbcolor
0.0059 setlinewidth
0.47078 0.41031 Mdot
0 0 0 setrgbcolor
0.0138 setlinewidth
0.38723 0.53204 Mdot
0 0 0 setrgbcolor
0.01935 setlinewidth
0.45413 0.65404 Mdot
0 0 0 setrgbcolor
0.01753 setlinewidth
0.39775 0.59213 Mdot
0 0 0 setrgbcolor
0.01252 setlinewidth
0.47268 0.66359 Mdot
0 0 0 setrgbcolor
0.00896 setlinewidth
0.40547 0.46223 Mdot
0 0 0 setrgbcolor
0.01827 setlinewidth
0.47347 0.40596 Mdot
0 0 0 setrgbcolor
0.01654 setlinewidth
0.39456 0.48316 Mdot
0 0 0 setrgbcolor
0.00683 setlinewidth
0.38471 0.54719 Mdot
0 0 0 setrgbcolor
0.00659 setlinewidth
0.41967 0.44162 Mdot
0 0 0 setrgbcolor
0.01048 setlinewidth
0.45532 0.41283 Mdot
0 0 0 setrgbcolor
0.01887 setlinewidth
0.65301 0.58768 Mdot
0 0 0 setrgbcolor
0.01552 setlinewidth
0.65541 0.58139 Mdot
0 0 0 setrgbcolor
0.00949 setlinewidth
0.66322 0.52766 Mdot
0 0 0 setrgbcolor
0.01841 setlinewidth
0.5349 0.67522 Mdot
0 0 0 setrgbcolor
0.01482 setlinewidth
0.4342 0.64422 Mdot
0 0 0 setrgbcolor
0.01016 setlinewidth
0.547 0.39682 Mdot
0 0 0 setrgbcolor
0.00972 setlinewidth
0.63705 0.45296 Mdot
0 0 0 setrgbcolor
0.00847 setlinewidth
0.46184 0.4087 Mdot
0 0 0 setrgbcolor
0.00873 setlinewidth
0.61283 0.427 Mdot
0 0 0 setrgbcolor
0.0057 setlinewidth
0.6604 0.50468 Mdot
0 0 0 setrgbcolor
0.0081 setlinewidth
0.65848 0.4971 Mdot
0 0 0 setrgbcolor
0.00651 setlinewidth
0.66203 0.5573 Mdot
0 0 0 setrgbcolor
0.01904 setlinewidth
0.66312 0.52255 Mdot
0 0 0 setrgbcolor
0.01459 setlinewidth
0.5424 0.67463 Mdot
0 0 0 setrgbcolor
0.00735 setlinewidth
0.48702 0.39945 Mdot
0 0 0 setrgbcolor
0.01956 setlinewidth
0.47265 0.66638 Mdot
0 0 0 setrgbcolor
0.01286 setlinewidth
0.56585 0.66901 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.55786 0.67126 Mdot
0 0 0 setrgbcolor
0.01768 setlinewidth
0.60948 0.4249 Mdot
0 0 0 setrgbcolor
0.01545 setlinewidth
0.65506 0.48806 Mdot
0 0 0 setrgbcolor
0.01779 setlinewidth
0.66263 0.52221 Mdot
0 0 0 setrgbcolor
0.01556 setlinewidth
0.41569 0.44535 Mdot
0 0 0 setrgbcolor
0.00752 setlinewidth
0.42601 0.43439 Mdot
0 0 0 setrgbcolor
0.01267 setlinewidth
0.56215 0.40115 Mdot
0 0 0 setrgbcolor
0.01454 setlinewidth
0.46115 0.66043 Mdot
0 0 0 setrgbcolor
0.01492 setlinewidth
0.44786 0.41787 Mdot
0 0 0 setrgbcolor
0.01759 setlinewidth
0.56085 0.40106 Mdot
0 0 0 setrgbcolor
0.01717 setlinewidth
0.45874 0.65901 Mdot
0 0 0 setrgbcolor
0.01445 setlinewidth
0.65833 0.56502 Mdot
0 0 0 setrgbcolor
0.01573 setlinewidth
0.57934 0.66161 Mdot
0 0 0 setrgbcolor
0.01275 setlinewidth
0.6443 0.60162 Mdot
0 0 0 setrgbcolor
0.01966 setlinewidth
0.39016 0.56723 Mdot
0 0 0 setrgbcolor
0.00631 setlinewidth
0.52279 0.67195 Mdot
0 0 0 setrgbcolor
0.00985 setlinewidth
0.50551 0.40015 Mdot
0 0 0 setrgbcolor
0.00904 setlinewidth
0.55138 0.66642 Mdot
0 0 0 setrgbcolor
0.00509 setlinewidth
0.39423 0.57217 Mdot
0 0 0 setrgbcolor
0.01416 setlinewidth
0.5635 0.66253 Mdot
0 0 0 setrgbcolor
0.01041 setlinewidth
0.60297 0.64166 Mdot
0 0 0 setrgbcolor
0.01611 setlinewidth
0.46873 0.41432 Mdot
0 0 0 setrgbcolor
0.00576 setlinewidth
0.60942 0.63601 Mdot
0 0 0 setrgbcolor
0.0121 setlinewidth
0.45028 0.64612 Mdot
0 0 0 setrgbcolor
0.00525 setlinewidth
0.49566 0.66416 Mdot
0 0 0 setrgbcolor
0.01221 setlinewidth
0.62011 0.62322 Mdot
0 0 0 setrgbcolor
0.01527 setlinewidth
0.55667 0.66031 Mdot
0 0 0 setrgbcolor
0.01492 setlinewidth
0.61443 0.62671 Mdot
0 0 0 setrgbcolor
0.00603 setlinewidth
0.53629 0.40687 Mdot
0 0 0 setrgbcolor
0.00962 setlinewidth
0.44083 0.43696 Mdot
0 0 0 setrgbcolor
0.01695 setlinewidth
0.49458 0.66011 Mdot
0 0 0 setrgbcolor
0.01032 setlinewidth
0.4529 0.42947 Mdot
0 0 0 setrgbcolor
0.01341 setlinewidth
0.3962 0.53526 Mdot
0 0 0 setrgbcolor
0.01096 setlinewidth
0.54403 0.65957 Mdot
0 0 0 setrgbcolor
0.01325 setlinewidth
0.64676 0.51742 Mdot
0 0 0 setrgbcolor
0.00914 setlinewidth
0.45907 0.42825 Mdot
0 0 0 setrgbcolor
0.00918 setlinewidth
0.43677 0.62481 Mdot
0 0 0 setrgbcolor
0.00979 setlinewidth
0.52304 0.65892 Mdot
1 1 1 setrgbcolor
0.01238 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01047 setlinewidth
0.60459 0.62794 Mdot
0 0 0 setrgbcolor
0.01039 setlinewidth
0.49887 0.65559 Mdot
0 0 0 setrgbcolor
0.01499 setlinewidth
0.51368 0.65725 Mdot
0 0 0 setrgbcolor
0.0169 setlinewidth
0.41269 0.58761 Mdot
0 0 0 setrgbcolor
0.01563 setlinewidth
0.46538 0.42782 Mdot
0 0 0 setrgbcolor
0.01648 setlinewidth
0.5717 0.64723 Mdot
0 0 0 setrgbcolor
0.01096 setlinewidth
0.64405 0.52092 Mdot
0 0 0 setrgbcolor
0.00711 setlinewidth
0.41287 0.48394 Mdot
0 0 0 setrgbcolor
0.00878 setlinewidth
0.61594 0.61332 Mdot
0 0 0 setrgbcolor
0.01238 setlinewidth
0.52396 0.65603 Mdot
0 0 0 setrgbcolor
0.01591 setlinewidth
0.55564 0.65071 Mdot
0 0 0 setrgbcolor
0.00773 setlinewidth
0.50937 0.65411 Mdot
0 0 0 setrgbcolor
0.01988 setlinewidth
0.52151 0.65293 Mdot
0 0 0 setrgbcolor
0.0077 setlinewidth
0.52324 0.65293 Mdot
0 0 0 setrgbcolor
0.01064 setlinewidth
0.43983 0.45464 Mdot
0 0 0 setrgbcolor
0.01537 setlinewidth
0.46507 0.63564 Mdot
0 0 0 setrgbcolor
0.01229 setlinewidth
0.57445 0.63777 Mdot
0 0 0 setrgbcolor
0.00894 setlinewidth
0.41008 0.53016 Mdot
0 0 0 setrgbcolor
0.01579 setlinewidth
0.54729 0.64509 Mdot
0 0 0 setrgbcolor
0.00914 setlinewidth
0.63355 0.53428 Mdot
0 0 0 setrgbcolor
0.00891 setlinewidth
0.53441 0.64085 Mdot
0 0 0 setrgbcolor
0.01196 setlinewidth
0.51661 0.64085 Mdot
0 0 0 setrgbcolor
0.00743 setlinewidth
0.52906 0.6391 Mdot
0 0 0 setrgbcolor
0.01848 setlinewidth
0.61866 0.49841 Mdot
0 0 0 setrgbcolor
0.00511 setlinewidth
0.60191 0.47473 Mdot
0 0 0 setrgbcolor
0.01658 setlinewidth
0.46914 0.61819 Mdot
0 0 0 setrgbcolor
0.01641 setlinewidth
0.45558 0.46515 Mdot
0 0 0 setrgbcolor
0.01828 setlinewidth
0.6176 0.55223 Mdot
0 0 0 setrgbcolor
0.00527 setlinewidth
0.4573 0.46953 Mdot
0 0 0 setrgbcolor
0.0124 setlinewidth
0.59522 0.48045 Mdot
0 0 0 setrgbcolor
0.01544 setlinewidth
0.46254 0.47109 Mdot
0 0 0 setrgbcolor
0.01772 setlinewidth
0.50388 0.45093 Mdot
0 0 0 setrgbcolor
0.01925 setlinewidth
0.50986 0.61483 Mdot
0 0 0 setrgbcolor
0.00563 setlinewidth
0.58694 0.57389 Mdot
0 0 0 setrgbcolor
0.00737 setlinewidth
0.57366 0.58232 Mdot
0 0 0 setrgbcolor
0.0092 setlinewidth
0.50989 0.60259 Mdot
0 0 0 setrgbcolor
0.00908 setlinewidth
0.58943 0.53365 Mdot
0 0 0 setrgbcolor
0.01318 setlinewidth
0.57191 0.57647 Mdot
0 0 0 setrgbcolor
0.01204 setlinewidth
0.55969 0.58445 Mdot
0 0 0 setrgbcolor
0.01802 setlinewidth
0.47901 0.49492 Mdot
0 0 0 setrgbcolor
0.01063 setlinewidth
0.57757 0.52373 Mdot
0 0 0 setrgbcolor
0.00687 setlinewidth
0.52851 0.58788 Mdot
0 0 0 setrgbcolor
0.00992 setlinewidth
0.5334 0.58165 Mdot
0 0 0 setrgbcolor
0.01499 setlinewidth
0.49452 0.55323 Mdot
0 0 0 setrgbcolor
0.009 setlinewidth
0.54583 0.52954 Mdot
0 0 0 setrgbcolor
0.0115 setlinewidth
0.53973 0.53663 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01656 setlinewidth
0.54846 0.54817 Mdot
0 0 0 setrgbcolor
0.00587 setlinewidth
0.51622 0.50597 Mdot
0 0 0 setrgbcolor
0.00762 setlinewidth
0.51504 0.49136 Mdot
0 0 0 setrgbcolor
0.01601 setlinewidth
0.51482 0.47628 Mdot
0 0 0 setrgbcolor
0.01873 setlinewidth
0.50814 0.47147 Mdot
0 0 0 setrgbcolor
0.01147 setlinewidth
0.51736 0.4698 Mdot
0 0 0 setrgbcolor
0.01535 setlinewidth
0.51694 0.46975 Mdot
0 0 0 setrgbcolor
0.01088 setlinewidth
0.58364 0.50598 Mdot
0 0 0 setrgbcolor
0.00668 setlinewidth
0.49991 0.47177 Mdot
0 0 0 setrgbcolor
0.01343 setlinewidth
0.48588 0.47821 Mdot
0 0 0 setrgbcolor
0.0191 setlinewidth
0.45761 0.55569 Mdot
0 0 0 setrgbcolor
0.00999 setlinewidth
0.52505 0.46421 Mdot
0 0 0 setrgbcolor
0.01005 setlinewidth
0.59122 0.50471 Mdot
0 0 0 setrgbcolor
0.00835 setlinewidth
0.47617 0.47413 Mdot
0 0 0 setrgbcolor
0.01974 setlinewidth
0.60107 0.51853 Mdot
0 0 0 setrgbcolor
0.00795 setlinewidth
0.50495 0.45751 Mdot
0 0 0 setrgbcolor
0.01533 setlinewidth
0.43938 0.53573 Mdot
0 0 0 setrgbcolor
0.01264 setlinewidth
0.48893 0.45877 Mdot
0 0 0 setrgbcolor
0.01951 setlinewidth
0.43704 0.53653 Mdot
0 0 0 setrgbcolor
0.00882 setlinewidth
0.48748 0.4521 Mdot
0 0 0 setrgbcolor
0.00883 setlinewidth
0.5677 0.61713 Mdot
0 0 0 setrgbcolor
0.01277 setlinewidth
0.49776 0.44528 Mdot
0 0 0 setrgbcolor
0.01664 setlinewidth
0.43965 0.58159 Mdot
0 0 0 setrgbcolor
0.01163 setlinewidth
0.60923 0.49245 Mdot
0 0 0 setrgbcolor
0.0196 setlinewidth
0.46272 0.45479 Mdot
0 0 0 setrgbcolor
0.01431 setlinewidth
0.55114 0.43729 Mdot
0 0 0 setrgbcolor
0.01044 setlinewidth
0.56794 0.44348 Mdot
0 0 0 setrgbcolor
0.00827 setlinewidth
0.55221 0.63422 Mdot
0 0 0 setrgbcolor
0.01363 setlinewidth
0.44968 0.46097 Mdot
0 0 0 setrgbcolor
0.00979 setlinewidth
0.51775 0.42976 Mdot
0 0 0 setrgbcolor
0.00689 setlinewidth
0.57896 0.44348 Mdot
0 0 0 setrgbcolor
0.01203 setlinewidth
0.53015 0.428 Mdot
0 0 0 setrgbcolor
0.01493 setlinewidth
0.5247 0.42778 Mdot
0 0 0 setrgbcolor
0.01204 setlinewidth
0.57227 0.6325 Mdot
0 0 0 setrgbcolor
0.01041 setlinewidth
0.41743 0.56251 Mdot
0 0 0 setrgbcolor
0.00657 setlinewidth
0.52314 0.42464 Mdot
0 0 0 setrgbcolor
0.00702 setlinewidth
0.52038 0.42443 Mdot
0 0 0 setrgbcolor
0.00928 setlinewidth
0.42458 0.58795 Mdot
0 0 0 setrgbcolor
0.0176 setlinewidth
0.62229 0.4824 Mdot
0 0 0 setrgbcolor
0.0171 setlinewidth
0.59371 0.62372 Mdot
0 0 0 setrgbcolor
0.00626 setlinewidth
0.54092 0.42337 Mdot
0 0 0 setrgbcolor
0.00584 setlinewidth
0.54624 0.64638 Mdot
0 0 0 setrgbcolor
0.01551 setlinewidth
0.53191 0.42185 Mdot
0 0 0 setrgbcolor
0.01086 setlinewidth
0.5138 0.42183 Mdot
0 0 0 setrgbcolor
0.01709 setlinewidth
0.52229 0.4209 Mdot
0 0 0 setrgbcolor
0.01144 setlinewidth
0.52399 0.42017 Mdot
0 0 0 setrgbcolor
0.00961 setlinewidth
0.51874 0.41938 Mdot
0 0 0 setrgbcolor
0.00733 setlinewidth
0.60129 0.44924 Mdot
0 0 0 setrgbcolor
0.01553 setlinewidth
0.56454 0.42631 Mdot
0 0 0 setrgbcolor
0.01815 setlinewidth
0.51141 0.41908 Mdot
0 0 0 setrgbcolor
0.01777 setlinewidth
0.52119 0.41823 Mdot
0 0 0 setrgbcolor
0.01697 setlinewidth
0.60929 0.45558 Mdot
0 0 0 setrgbcolor
0.01828 setlinewidth
0.56885 0.64392 Mdot
0 0 0 setrgbcolor
0.00912 setlinewidth
0.44229 0.44938 Mdot
0 0 0 setrgbcolor
0.01179 setlinewidth
0.51251 0.41751 Mdot
0 0 0 setrgbcolor
0.01602 setlinewidth
0.57376 0.42762 Mdot
0 0 0 setrgbcolor
0.01204 setlinewidth
0.46153 0.43179 Mdot
0 0 0 setrgbcolor
0.01574 setlinewidth
0.61556 0.45615 Mdot
1 1 1 setrgbcolor
0.00763 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01063 setlinewidth
0.48776 0.41756 Mdot
0 0 0 setrgbcolor
0.00523 setlinewidth
0.52075 0.41206 Mdot
0 0 0 setrgbcolor
0.01885 setlinewidth
0.53532 0.41261 Mdot
0 0 0 setrgbcolor
0.01295 setlinewidth
0.42132 0.60544 Mdot
0 0 0 setrgbcolor
0.00769 setlinewidth
0.62438 0.46368 Mdot
0 0 0 setrgbcolor
0.00802 setlinewidth
0.41845 0.46783 Mdot
0 0 0 setrgbcolor
0.00665 setlinewidth
0.59444 0.43276 Mdot
0 0 0 setrgbcolor
0.01202 setlinewidth
0.43445 0.62455 Mdot
0 0 0 setrgbcolor
0.00799 setlinewidth
0.56019 0.4135 Mdot
0 0 0 setrgbcolor
0.01702 setlinewidth
0.55546 0.41202 Mdot
0 0 0 setrgbcolor
0.01319 setlinewidth
0.5198 0.40714 Mdot
0 0 0 setrgbcolor
0.01789 setlinewidth
0.50705 0.66279 Mdot
0 0 0 setrgbcolor
0.00979 setlinewidth
0.58628 0.42349 Mdot
0 0 0 setrgbcolor
0.01222 setlinewidth
0.51526 0.40627 Mdot
0 0 0 setrgbcolor
0.00521 setlinewidth
0.53264 0.66493 Mdot
0 0 0 setrgbcolor
0.00597 setlinewidth
0.54285 0.40675 Mdot
0 0 0 setrgbcolor
0.01995 setlinewidth
0.64454 0.4831 Mdot
0 0 0 setrgbcolor
0.01726 setlinewidth
0.39186 0.55211 Mdot
0 0 0 setrgbcolor
0.00979 setlinewidth
0.65348 0.50993 Mdot
0 0 0 setrgbcolor
0.01909 setlinewidth
0.56955 0.66091 Mdot
0 0 0 setrgbcolor
0.01329 setlinewidth
0.62088 0.62778 Mdot
0 0 0 setrgbcolor
0.01516 setlinewidth
0.46763 0.41272 Mdot
0 0 0 setrgbcolor
0.00641 setlinewidth
0.40985 0.61226 Mdot
0 0 0 setrgbcolor
0.00788 setlinewidth
0.5342 0.67308 Mdot
0 0 0 setrgbcolor
0.01823 setlinewidth
0.45697 0.41391 Mdot
0 0 0 setrgbcolor
0.00662 setlinewidth
0.38874 0.56821 Mdot
0 0 0 setrgbcolor
0.0143 setlinewidth
0.38906 0.50115 Mdot
0 0 0 setrgbcolor
0.01819 setlinewidth
0.52598 0.67374 Mdot
0 0 0 setrgbcolor
0.00752 setlinewidth
0.52219 0.67387 Mdot
0 0 0 setrgbcolor
0.01472 setlinewidth
0.39698 0.47799 Mdot
0 0 0 setrgbcolor
0.00993 setlinewidth
0.47587 0.668 Mdot
0 0 0 setrgbcolor
0.01081 setlinewidth
0.66305 0.51876 Mdot
0 0 0 setrgbcolor
0.01464 setlinewidth
0.51559 0.3945 Mdot
0 0 0 setrgbcolor
0.01219 setlinewidth
0.4065 0.45471 Mdot
0 0 0 setrgbcolor
0.01222 setlinewidth
0.49551 0.67535 Mdot
0 0 0 setrgbcolor
0.00811 setlinewidth
0.4562 0.40917 Mdot
0 0 0 setrgbcolor
0.0092 setlinewidth
0.60101 0.65591 Mdot
0 0 0 setrgbcolor
0.01671 setlinewidth
0.66631 0.52244 Mdot
0 0 0 setrgbcolor
0.01183 setlinewidth
0.43685 0.41938 Mdot
0 0 0 setrgbcolor
0.00905 setlinewidth
0.60989 0.41942 Mdot
0 0 0 setrgbcolor
0.01893 setlinewidth
0.66805 0.54115 Mdot
0 0 0 setrgbcolor
0.00978 setlinewidth
0.44925 0.66106 Mdot
0 0 0 setrgbcolor
0.01845 setlinewidth
0.44016 0.41423 Mdot
0 0 0 setrgbcolor
0.00779 setlinewidth
0.66511 0.49743 Mdot
0 0 0 setrgbcolor
0.01616 setlinewidth
0.39674 0.4596 Mdot
0 0 0 setrgbcolor
0.01756 setlinewidth
0.40521 0.4467 Mdot
0 0 0 setrgbcolor
0.01441 setlinewidth
0.55659 0.67915 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.46267 0.4006 Mdot
0 0 0 setrgbcolor
0.01044 setlinewidth
0.52526 0.38765 Mdot
0 0 0 setrgbcolor
0.01648 setlinewidth
0.48806 0.6789 Mdot
0 0 0 setrgbcolor
0.01028 setlinewidth
0.42344 0.42624 Mdot
0 0 0 setrgbcolor
0.01216 setlinewidth
0.38548 0.58884 Mdot
0 0 0 setrgbcolor
0.00868 setlinewidth
0.47373 0.67448 Mdot
0 0 0 setrgbcolor
0.01507 setlinewidth
0.47082 0.67337 Mdot
0 0 0 setrgbcolor
0.00849 setlinewidth
0.56113 0.67774 Mdot
0 0 0 setrgbcolor
0.00683 setlinewidth
0.66601 0.57019 Mdot
0 0 0 setrgbcolor
0.01274 setlinewidth
0.66746 0.5632 Mdot
0 0 0 setrgbcolor
0.00588 setlinewidth
0.59656 0.40806 Mdot
0 0 0 setrgbcolor
0.00537 setlinewidth
0.38826 0.59347 Mdot
0 0 0 setrgbcolor
0.01776 setlinewidth
0.6264 0.43117 Mdot
0 0 0 setrgbcolor
0.00838 setlinewidth
0.66658 0.5054 Mdot
0 0 0 setrgbcolor
0.00972 setlinewidth
0.57527 0.67217 Mdot
0 0 0 setrgbcolor
0.01874 setlinewidth
0.58329 0.66869 Mdot
0 0 0 setrgbcolor
0.01252 setlinewidth
0.53681 0.38987 Mdot
0 0 0 setrgbcolor
0.00973 setlinewidth
0.535 0.39004 Mdot
0 0 0 setrgbcolor
0.00945 setlinewidth
0.5901 0.40661 Mdot
0 0 0 setrgbcolor
0.01668 setlinewidth
0.65793 0.4818 Mdot
0 0 0 setrgbcolor
0.01004 setlinewidth
0.65458 0.47414 Mdot
0 0 0 setrgbcolor
0.00847 setlinewidth
0.47518 0.39864 Mdot
0 0 0 setrgbcolor
0.01809 setlinewidth
0.66733 0.53704 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.6626 0.50026 Mdot
0 0 0 setrgbcolor
0.00817 setlinewidth
0.43779 0.41956 Mdot
0 0 0 setrgbcolor
0.01883 setlinewidth
0.45445 0.66171 Mdot
0 0 0 setrgbcolor
0.01905 setlinewidth
0.38089 0.5556 Mdot
0 0 0 setrgbcolor
0.01144 setlinewidth
0.53461 0.67818 Mdot
0 0 0 setrgbcolor
0.01702 setlinewidth
0.64722 0.46534 Mdot
0 0 0 setrgbcolor
0.01535 setlinewidth
0.41101 0.44759 Mdot
0 0 0 setrgbcolor
0.01062 setlinewidth
0.59262 0.65933 Mdot
0 0 0 setrgbcolor
0.01684 setlinewidth
0.66043 0.5001 Mdot
0 0 0 setrgbcolor
0.00897 setlinewidth
0.42137 0.43796 Mdot
0 0 0 setrgbcolor
0.01946 setlinewidth
0.5025 0.67412 Mdot
0 0 0 setrgbcolor
0.01474 setlinewidth
0.38759 0.50051 Mdot
0 0 0 setrgbcolor
0.00955 setlinewidth
0.40325 0.60711 Mdot
0 0 0 setrgbcolor
0.00788 setlinewidth
0.43374 0.64193 Mdot
0 0 0 setrgbcolor
0.01017 setlinewidth
0.4264 0.43576 Mdot
0 0 0 setrgbcolor
0.006 setlinewidth
0.56114 0.66858 Mdot
0 0 0 setrgbcolor
0.01009 setlinewidth
0.65066 0.58684 Mdot
0 0 0 setrgbcolor
0.01566 setlinewidth
0.65996 0.5461 Mdot
0 0 0 setrgbcolor
0.01435 setlinewidth
0.4989 0.67023 Mdot
0 0 0 setrgbcolor
0.01049 setlinewidth
0.57258 0.66285 Mdot
0 0 0 setrgbcolor
0.00866 setlinewidth
0.43161 0.43436 Mdot
0 0 0 setrgbcolor
0.00761 setlinewidth
0.50296 0.40073 Mdot
0 0 0 setrgbcolor
0.01439 setlinewidth
0.38908 0.54863 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.4081 0.46627 Mdot
0 0 0 setrgbcolor
0.00892 setlinewidth
0.56297 0.66168 Mdot
0 0 0 setrgbcolor
0.01017 setlinewidth
0.60981 0.63537 Mdot
1 1 1 setrgbcolor
0.00763 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01912 setlinewidth
0.50036 0.66512 Mdot
0 0 0 setrgbcolor
0.00773 setlinewidth
0.61541 0.62852 Mdot
0 0 0 setrgbcolor
0.01683 setlinewidth
0.54833 0.66282 Mdot
0 0 0 setrgbcolor
0.00787 setlinewidth
0.46087 0.64936 Mdot
0 0 0 setrgbcolor
0.01265 setlinewidth
0.52581 0.66517 Mdot
0 0 0 setrgbcolor
0.00918 setlinewidth
0.51552 0.66478 Mdot
0 0 0 setrgbcolor
0.01551 setlinewidth
0.5097 0.6622 Mdot
0 0 0 setrgbcolor
0.01719 setlinewidth
0.62355 0.6136 Mdot
0 0 0 setrgbcolor
0.00763 setlinewidth
0.52523 0.66212 Mdot
0 0 0 setrgbcolor
0.0106 setlinewidth
0.61733 0.61817 Mdot
0 0 0 setrgbcolor
0.00665 setlinewidth
0.52122 0.65932 Mdot
0 0 0 setrgbcolor
0.01357 setlinewidth
0.52298 0.65908 Mdot
0 0 0 setrgbcolor
0.01061 setlinewidth
0.57328 0.64612 Mdot
0 0 0 setrgbcolor
0.00919 setlinewidth
0.55654 0.65211 Mdot
0 0 0 setrgbcolor
0.01611 setlinewidth
0.42084 0.47491 Mdot
0 0 0 setrgbcolor
0.01142 setlinewidth
0.60477 0.6211 Mdot
0 0 0 setrgbcolor
0.00627 setlinewidth
0.45804 0.63106 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.42238 0.47921 Mdot
0 0 0 setrgbcolor
0.01851 setlinewidth
0.63201 0.49838 Mdot
0 0 0 setrgbcolor
0.01583 setlinewidth
0.5448 0.64762 Mdot
0 0 0 setrgbcolor
0.01923 setlinewidth
0.6135 0.60413 Mdot
0 0 0 setrgbcolor
0.00805 setlinewidth
0.51109 0.64771 Mdot
0 0 0 setrgbcolor
0.01509 setlinewidth
0.5722 0.63603 Mdot
0 0 0 setrgbcolor
0.01872 setlinewidth
0.42702 0.48006 Mdot
0 0 0 setrgbcolor
0.00536 setlinewidth
0.62852 0.5026 Mdot
0 0 0 setrgbcolor
0.01956 setlinewidth
0.52934 0.64516 Mdot
0 0 0 setrgbcolor
0.011 setlinewidth
0.52309 0.64415 Mdot
0 0 0 setrgbcolor
0.00934 setlinewidth
0.46526 0.45258 Mdot
0 0 0 setrgbcolor
0.01768 setlinewidth
0.61613 0.51857 Mdot
0 0 0 setrgbcolor
0.01426 setlinewidth
0.49549 0.62198 Mdot
0 0 0 setrgbcolor
0.01514 setlinewidth
0.57144 0.4613 Mdot
0 0 0 setrgbcolor
0.01087 setlinewidth
0.59311 0.48338 Mdot
0 0 0 setrgbcolor
0.0169 setlinewidth
0.44345 0.50237 Mdot
0 0 0 setrgbcolor
0.01491 setlinewidth
0.49206 0.60937 Mdot
0 0 0 setrgbcolor
0.0072 setlinewidth
0.56372 0.4685 Mdot
0 0 0 setrgbcolor
0.01593 setlinewidth
0.59904 0.54018 Mdot
0 0 0 setrgbcolor
0.01596 setlinewidth
0.46604 0.56057 Mdot
0 0 0 setrgbcolor
0.00551 setlinewidth
0.50715 0.59143 Mdot
0 0 0 setrgbcolor
0.01163 setlinewidth
0.56722 0.56788 Mdot
0 0 0 setrgbcolor
0.01026 setlinewidth
0.55415 0.57877 Mdot
0 0 0 setrgbcolor
0.01014 setlinewidth
0.53927 0.58316 Mdot
0 0 0 setrgbcolor
0.00679 setlinewidth
0.51074 0.58425 Mdot
0 0 0 setrgbcolor
0.0178 setlinewidth
0.55085 0.57295 Mdot
0 0 0 setrgbcolor
0.00823 setlinewidth
0.56253 0.5254 Mdot
0 0 0 setrgbcolor
0.00645 setlinewidth
0.5477 0.51694 Mdot
0 0 0 setrgbcolor
0.00642 setlinewidth
0.50873 0.53646 Mdot
0 0 0 setrgbcolor
0.01775 setlinewidth
0.51407 0.52811 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01675 setlinewidth
0.53964 0.5039 Mdot
0 0 0 setrgbcolor
0.00519 setlinewidth
0.48513 0.56441 Mdot
0 0 0 setrgbcolor
0.00753 setlinewidth
0.5354 0.48901 Mdot
0 0 0 setrgbcolor
0.00589 setlinewidth
0.57909 0.54269 Mdot
0 0 0 setrgbcolor
0.00783 setlinewidth
0.50184 0.48018 Mdot
0 0 0 setrgbcolor
0.0066 setlinewidth
0.46192 0.54675 Mdot
0 0 0 setrgbcolor
0.01737 setlinewidth
0.53169 0.47353 Mdot
0 0 0 setrgbcolor
0.01016 setlinewidth
0.51509 0.4713 Mdot
0 0 0 setrgbcolor
0.01679 setlinewidth
0.45934 0.54795 Mdot
0 0 0 setrgbcolor
0.0077 setlinewidth
0.5236 0.46966 Mdot
0 0 0 setrgbcolor
0.01895 setlinewidth
0.49038 0.47759 Mdot
0 0 0 setrgbcolor
0.01412 setlinewidth
0.53222 0.46647 Mdot
0 0 0 setrgbcolor
0.01287 setlinewidth
0.53267 0.46646 Mdot
0 0 0 setrgbcolor
0.0138 setlinewidth
0.53904 0.45947 Mdot
0 0 0 setrgbcolor
0.0066 setlinewidth
0.49999 0.45977 Mdot
0 0 0 setrgbcolor
0.00552 setlinewidth
0.51653 0.45585 Mdot
0 0 0 setrgbcolor
0.01251 setlinewidth
0.46727 0.59402 Mdot
0 0 0 setrgbcolor
0.01579 setlinewidth
0.49648 0.45319 Mdot
0 0 0 setrgbcolor
0.01013 setlinewidth
0.47018 0.46006 Mdot
0 0 0 setrgbcolor
0.00802 setlinewidth
0.50531 0.44452 Mdot
0 0 0 setrgbcolor
0.01076 setlinewidth
0.60589 0.49349 Mdot
0 0 0 setrgbcolor
0.01758 setlinewidth
0.45727 0.46856 Mdot
0 0 0 setrgbcolor
0.01994 setlinewidth
0.43943 0.57788 Mdot
0 0 0 setrgbcolor
0.01636 setlinewidth
0.44981 0.60301 Mdot
0 0 0 setrgbcolor
0.00846 setlinewidth
0.61266 0.49101 Mdot
0 0 0 setrgbcolor
0.01205 setlinewidth
0.62433 0.50394 Mdot
0 0 0 setrgbcolor
0.0139 setlinewidth
0.4449 0.45805 Mdot
0 0 0 setrgbcolor
0.01812 setlinewidth
0.52084 0.42536 Mdot
0 0 0 setrgbcolor
0.00905 setlinewidth
0.60314 0.61211 Mdot
0 0 0 setrgbcolor
0.00526 setlinewidth
0.55677 0.42762 Mdot
0 0 0 setrgbcolor
0.01916 setlinewidth
0.52719 0.42219 Mdot
0 0 0 setrgbcolor
0.00937 setlinewidth
0.53276 0.42152 Mdot
0 0 0 setrgbcolor
0.00538 setlinewidth
0.42196 0.4809 Mdot
0 0 0 setrgbcolor
0.01598 setlinewidth
0.4459 0.62171 Mdot
0 0 0 setrgbcolor
0.01382 setlinewidth
0.52151 0.41949 Mdot
0 0 0 setrgbcolor
0.0053 setlinewidth
0.52441 0.41925 Mdot
0 0 0 setrgbcolor
0.00941 setlinewidth
0.57487 0.43128 Mdot
0 0 0 setrgbcolor
0.00874 setlinewidth
0.46076 0.4369 Mdot
0 0 0 setrgbcolor
0.01408 setlinewidth
0.588 0.63232 Mdot
0 0 0 setrgbcolor
0.00787 setlinewidth
0.51372 0.41794 Mdot
0 0 0 setrgbcolor
0.00932 setlinewidth
0.62615 0.47555 Mdot
0 0 0 setrgbcolor
0.00936 setlinewidth
0.52204 0.41558 Mdot
0 0 0 setrgbcolor
0.01965 setlinewidth
0.5101 0.41554 Mdot
0 0 0 setrgbcolor
0.01445 setlinewidth
0.53212 0.41495 Mdot
0 0 0 setrgbcolor
0.01406 setlinewidth
0.52347 0.41455 Mdot
0 0 0 setrgbcolor
0.01007 setlinewidth
0.51779 0.41462 Mdot
0 0 0 setrgbcolor
0.01878 setlinewidth
0.46121 0.63956 Mdot
0 0 0 setrgbcolor
0.01899 setlinewidth
0.54164 0.41502 Mdot
0 0 0 setrgbcolor
0.0091 setlinewidth
0.51057 0.41376 Mdot
0 0 0 setrgbcolor
0.01812 setlinewidth
0.51981 0.41304 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.58507 0.42953 Mdot
0 0 0 setrgbcolor
0.01631 setlinewidth
0.40539 0.57152 Mdot
0 0 0 setrgbcolor
0.01096 setlinewidth
0.4842 0.41799 Mdot
0 0 0 setrgbcolor
0.00603 setlinewidth
0.60712 0.62774 Mdot
0 0 0 setrgbcolor
0.00754 setlinewidth
0.58141 0.64604 Mdot
0 0 0 setrgbcolor
0.00675 setlinewidth
0.56538 0.41421 Mdot
0 0 0 setrgbcolor
0.0168 setlinewidth
0.51661 0.40685 Mdot
0 0 0 setrgbcolor
0.01123 setlinewidth
0.53148 0.40499 Mdot
1 1 1 setrgbcolor
0.0062 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00968 setlinewidth
0.6269 0.61553 Mdot
0 0 0 setrgbcolor
0.01971 setlinewidth
0.57437 0.41408 Mdot
0 0 0 setrgbcolor
0.01487 setlinewidth
0.39207 0.51999 Mdot
0 0 0 setrgbcolor
0.01841 setlinewidth
0.60312 0.64034 Mdot
0 0 0 setrgbcolor
0.00696 setlinewidth
0.40184 0.5887 Mdot
0 0 0 setrgbcolor
0.01223 setlinewidth
0.63471 0.46316 Mdot
0 0 0 setrgbcolor
0.01415 setlinewidth
0.60681 0.432 Mdot
0 0 0 setrgbcolor
0.01062 setlinewidth
0.3963 0.49509 Mdot
0 0 0 setrgbcolor
0.01075 setlinewidth
0.4302 0.63078 Mdot
0 0 0 setrgbcolor
0.01597 setlinewidth
0.51321 0.40202 Mdot
0 0 0 setrgbcolor
0.01188 setlinewidth
0.50807 0.4019 Mdot
0 0 0 setrgbcolor
0.00527 setlinewidth
0.53937 0.66899 Mdot
0 0 0 setrgbcolor
0.01541 setlinewidth
0.61576 0.43732 Mdot
0 0 0 setrgbcolor
0.01744 setlinewidth
0.45885 0.41662 Mdot
0 0 0 setrgbcolor
0.01252 setlinewidth
0.55052 0.40109 Mdot
0 0 0 setrgbcolor
0.00867 setlinewidth
0.55563 0.40183 Mdot
0 0 0 setrgbcolor
0.01904 setlinewidth
0.53587 0.3978 Mdot
0 0 0 setrgbcolor
0.0097 setlinewidth
0.44648 0.41972 Mdot
0 0 0 setrgbcolor
0.01987 setlinewidth
0.62109 0.43696 Mdot
0 0 0 setrgbcolor
0.00846 setlinewidth
0.56524 0.66769 Mdot
0 0 0 setrgbcolor
0.01101 setlinewidth
0.59461 0.4161 Mdot
0 0 0 setrgbcolor
0.01936 setlinewidth
0.4002 0.46989 Mdot
0 0 0 setrgbcolor
0.01908 setlinewidth
0.58354 0.40788 Mdot
0 0 0 setrgbcolor
0.01539 setlinewidth
0.63067 0.44344 Mdot
0 0 0 setrgbcolor
0.01687 setlinewidth
0.44202 0.41516 Mdot
0 0 0 setrgbcolor
0.00807 setlinewidth
0.50264 0.6792 Mdot
0 0 0 setrgbcolor
0.00784 setlinewidth
0.60088 0.65844 Mdot
0 0 0 setrgbcolor
0.01067 setlinewidth
0.42276 0.42893 Mdot
0 0 0 setrgbcolor
0.01809 setlinewidth
0.55197 0.67878 Mdot
0 0 0 setrgbcolor
0.01157 setlinewidth
0.55588 0.67811 Mdot
0 0 0 setrgbcolor
0.0162 setlinewidth
0.56432 0.67627 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.50084 0.39004 Mdot
0 0 0 setrgbcolor
0.00788 setlinewidth
0.65168 0.46071 Mdot
0 0 0 setrgbcolor
0.01639 setlinewidth
0.5223 0.68423 Mdot
0 0 0 setrgbcolor
0.00599 setlinewidth
0.64859 0.61638 Mdot
0 0 0 setrgbcolor
0.01029 setlinewidth
0.66494 0.48748 Mdot
0 0 0 setrgbcolor
0.0078 setlinewidth
0.38497 0.47688 Mdot
0 0 0 setrgbcolor
0.01995 setlinewidth
0.4704 0.67606 Mdot
0 0 0 setrgbcolor
0.00798 setlinewidth
0.42237 0.42328 Mdot
0 0 0 setrgbcolor
0.00691 setlinewidth
0.39087 0.46236 Mdot
0 0 0 setrgbcolor
0.00975 setlinewidth
0.40391 0.43859 Mdot
0 0 0 setrgbcolor
0.01558 setlinewidth
0.38959 0.61125 Mdot
0 0 0 setrgbcolor
0.00564 setlinewidth
0.44034 0.40572 Mdot
0 0 0 setrgbcolor
0.01015 setlinewidth
0.62686 0.64922 Mdot
0 0 0 setrgbcolor
0.01755 setlinewidth
0.67206 0.49555 Mdot
0 0 0 setrgbcolor
0.00697 setlinewidth
0.59806 0.40026 Mdot
0 0 0 setrgbcolor
0.01007 setlinewidth
0.39081 0.61577 Mdot
0 0 0 setrgbcolor
0.01795 setlinewidth
0.50113 0.38185 Mdot
0 0 0 setrgbcolor
0.00608 setlinewidth
0.50725 0.68962 Mdot
0 0 0 setrgbcolor
0.01421 setlinewidth
0.67387 0.49906 Mdot
0 0 0 setrgbcolor
0.0125 setlinewidth
0.49072 0.68712 Mdot
0 0 0 setrgbcolor
0.01638 setlinewidth
0.48744 0.68638 Mdot
0 0 0 setrgbcolor
0.01999 setlinewidth
0.67738 0.51859 Mdot
0 0 0 setrgbcolor
0.01856 setlinewidth
0.57846 0.68032 Mdot
0 0 0 setrgbcolor
0.01557 setlinewidth
0.37405 0.57832 Mdot
0 0 0 setrgbcolor
0.00651 setlinewidth
0.66468 0.47319 Mdot
0 0 0 setrgbcolor
0.01508 setlinewidth
0.41015 0.42986 Mdot
0 0 0 setrgbcolor
0.01677 setlinewidth
0.38657 0.46305 Mdot
0 0 0 setrgbcolor
0.00973 setlinewidth
0.44536 0.40208 Mdot
0 0 0 setrgbcolor
0.01171 setlinewidth
0.3697 0.52108 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.57945 0.67851 Mdot
0 0 0 setrgbcolor
0.01768 setlinewidth
0.46355 0.67704 Mdot
0 0 0 setrgbcolor
0.0192 setlinewidth
0.39432 0.45158 Mdot
0 0 0 setrgbcolor
0.0114 setlinewidth
0.50779 0.38255 Mdot
0 0 0 setrgbcolor
0.00658 setlinewidth
0.50554 0.38305 Mdot
0 0 0 setrgbcolor
0.01204 setlinewidth
0.40113 0.62816 Mdot
0 0 0 setrgbcolor
0.01679 setlinewidth
0.57313 0.39126 Mdot
0 0 0 setrgbcolor
0.01048 setlinewidth
0.39775 0.44859 Mdot
0 0 0 setrgbcolor
0.01326 setlinewidth
0.59121 0.67087 Mdot
0 0 0 setrgbcolor
0.01979 setlinewidth
0.43643 0.65975 Mdot
0 0 0 setrgbcolor
0.01117 setlinewidth
0.37563 0.57039 Mdot
0 0 0 setrgbcolor
0.01724 setlinewidth
0.59874 0.66612 Mdot
0 0 0 setrgbcolor
0.00936 setlinewidth
0.40136 0.44641 Mdot
0 0 0 setrgbcolor
0.01693 setlinewidth
0.38182 0.483 Mdot
0 0 0 setrgbcolor
0.0082 setlinewidth
0.60708 0.41043 Mdot
0 0 0 setrgbcolor
0.01291 setlinewidth
0.56363 0.391 Mdot
0 0 0 setrgbcolor
0.01823 setlinewidth
0.54694 0.6831 Mdot
0 0 0 setrgbcolor
0.00505 setlinewidth
0.51141 0.6835 Mdot
0 0 0 setrgbcolor
0.01427 setlinewidth
0.67094 0.55021 Mdot
0 0 0 setrgbcolor
0.015 setlinewidth
0.67118 0.54262 Mdot
0 0 0 setrgbcolor
0.01256 setlinewidth
0.66036 0.48186 Mdot
0 0 0 setrgbcolor
0.01909 setlinewidth
0.46769 0.39998 Mdot
0 0 0 setrgbcolor
0.00703 setlinewidth
0.50529 0.68011 Mdot
0 0 0 setrgbcolor
0.00613 setlinewidth
0.64086 0.45103 Mdot
0 0 0 setrgbcolor
0.00809 setlinewidth
0.64562 0.45854 Mdot
0 0 0 setrgbcolor
0.01787 setlinewidth
0.60281 0.65532 Mdot
0 0 0 setrgbcolor
0.01718 setlinewidth
0.46047 0.66401 Mdot
0 0 0 setrgbcolor
0.01505 setlinewidth
0.56945 0.66965 Mdot
0 0 0 setrgbcolor
0.01473 setlinewidth
0.66328 0.51531 Mdot
0 0 0 setrgbcolor
0.01771 setlinewidth
0.65218 0.47731 Mdot
1 1 1 setrgbcolor
0.0062 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01665 setlinewidth
0.62953 0.44314 Mdot
0 0 0 setrgbcolor
0.00531 setlinewidth
0.50354 0.6748 Mdot
0 0 0 setrgbcolor
0.01587 setlinewidth
0.39032 0.49026 Mdot
0 0 0 setrgbcolor
0.01807 setlinewidth
0.57938 0.66212 Mdot
0 0 0 setrgbcolor
0.01759 setlinewidth
0.64823 0.47761 Mdot
0 0 0 setrgbcolor
0.01218 setlinewidth
0.39155 0.49451 Mdot
0 0 0 setrgbcolor
0.00954 setlinewidth
0.51807 0.67241 Mdot
0 0 0 setrgbcolor
0.01824 setlinewidth
0.52869 0.67137 Mdot
0 0 0 setrgbcolor
0.01758 setlinewidth
0.51096 0.6706 Mdot
0 0 0 setrgbcolor
0.01797 setlinewidth
0.56728 0.66242 Mdot
0 0 0 setrgbcolor
0.01945 setlinewidth
0.39518 0.49473 Mdot
0 0 0 setrgbcolor
0.01707 setlinewidth
0.5514 0.66576 Mdot
0 0 0 setrgbcolor
0.0062 setlinewidth
0.5265 0.66837 Mdot
0 0 0 setrgbcolor
0.00702 setlinewidth
0.45033 0.64583 Mdot
0 0 0 setrgbcolor
0.01461 setlinewidth
0.64901 0.57078 Mdot
0 0 0 setrgbcolor
0.00629 setlinewidth
0.52103 0.66609 Mdot
0 0 0 setrgbcolor
0.01166 setlinewidth
0.52271 0.6656 Mdot
0 0 0 setrgbcolor
0.01095 setlinewidth
0.6522 0.52638 Mdot
0 0 0 setrgbcolor
0.00617 setlinewidth
0.61156 0.62813 Mdot
0 0 0 setrgbcolor
0.00816 setlinewidth
0.6158 0.62016 Mdot
0 0 0 setrgbcolor
0.0165 setlinewidth
0.55526 0.65365 Mdot
0 0 0 setrgbcolor
0.00961 setlinewidth
0.42707 0.46049 Mdot
0 0 0 setrgbcolor
0.01693 setlinewidth
0.50581 0.65568 Mdot
0 0 0 setrgbcolor
0.00637 setlinewidth
0.57159 0.64499 Mdot
0 0 0 setrgbcolor
0.00932 setlinewidth
0.62047 0.60338 Mdot
0 0 0 setrgbcolor
0.01595 setlinewidth
0.61406 0.60916 Mdot
0 0 0 setrgbcolor
0.00868 setlinewidth
0.54053 0.65079 Mdot
0 0 0 setrgbcolor
0.01434 setlinewidth
0.51647 0.65036 Mdot
0 0 0 setrgbcolor
0.0079 setlinewidth
0.52328 0.6505 Mdot
0 0 0 setrgbcolor
0.01249 setlinewidth
0.41025 0.5155 Mdot
0 0 0 setrgbcolor
0.01447 setlinewidth
0.59931 0.61426 Mdot
0 0 0 setrgbcolor
0.01107 setlinewidth
0.56629 0.63479 Mdot
0 0 0 setrgbcolor
0.01857 setlinewidth
0.48156 0.63151 Mdot
0 0 0 setrgbcolor
0.01166 setlinewidth
0.60442 0.59524 Mdot
0 0 0 setrgbcolor
0.01171 setlinewidth
0.6075 0.48117 Mdot
0 0 0 setrgbcolor
0.00503 setlinewidth
0.47455 0.61903 Mdot
0 0 0 setrgbcolor
0.01716 setlinewidth
0.60339 0.48624 Mdot
0 0 0 setrgbcolor
0.01209 setlinewidth
0.43879 0.57243 Mdot
0 0 0 setrgbcolor
0.01047 setlinewidth
0.53381 0.4525 Mdot
0 0 0 setrgbcolor
0.0115 setlinewidth
0.52554 0.46138 Mdot
0 0 0 setrgbcolor
0.01857 setlinewidth
0.48462 0.59839 Mdot
0 0 0 setrgbcolor
0.01033 setlinewidth
0.58977 0.50524 Mdot
0 0 0 setrgbcolor
0.01266 setlinewidth
0.5593 0.47209 Mdot
0 0 0 setrgbcolor
0.01749 setlinewidth
0.48651 0.59044 Mdot
0 0 0 setrgbcolor
0.01298 setlinewidth
0.51538 0.58507 Mdot
0 0 0 setrgbcolor
0.00622 setlinewidth
0.57268 0.53081 Mdot
0 0 0 setrgbcolor
0.01554 setlinewidth
0.47542 0.54118 Mdot
0 0 0 setrgbcolor
0.01128 setlinewidth
0.4795 0.53168 Mdot
0 0 0 setrgbcolor
0.0184 setlinewidth
0.53015 0.57824 Mdot
0 0 0 setrgbcolor
0.01907 setlinewidth
0.52537 0.5727 Mdot
0 0 0 setrgbcolor
0.01097 setlinewidth
0.54198 0.56488 Mdot
0 0 0 setrgbcolor
0.01663 setlinewidth
0.51259 0.51478 Mdot
0 0 0 setrgbcolor
0.01966 setlinewidth
0.52958 0.52125 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01925 setlinewidth
0.51746 0.56905 Mdot
0 0 0 setrgbcolor
0.01524 setlinewidth
0.49023 0.55439 Mdot
0 0 0 setrgbcolor
0.01457 setlinewidth
0.48756 0.55604 Mdot
0 0 0 setrgbcolor
0.0197 setlinewidth
0.5643 0.49799 Mdot
0 0 0 setrgbcolor
0.00608 setlinewidth
0.52064 0.47952 Mdot
0 0 0 setrgbcolor
0.00524 setlinewidth
0.50798 0.4787 Mdot
0 0 0 setrgbcolor
0.01738 setlinewidth
0.55696 0.48327 Mdot
0 0 0 setrgbcolor
0.01132 setlinewidth
0.53222 0.46825 Mdot
0 0 0 setrgbcolor
0.00788 setlinewidth
0.50076 0.6025 Mdot
0 0 0 setrgbcolor
0.01902 setlinewidth
0.5405 0.4652 Mdot
0 0 0 setrgbcolor
0.01254 setlinewidth
0.54964 0.46789 Mdot
0 0 0 setrgbcolor
0.01793 setlinewidth
0.51357 0.45887 Mdot
0 0 0 setrgbcolor
0.00592 setlinewidth
0.4685 0.59008 Mdot
0 0 0 setrgbcolor
0.01011 setlinewidth
0.54841 0.46054 Mdot
0 0 0 setrgbcolor
0.01569 setlinewidth
0.54885 0.46045 Mdot
0 0 0 setrgbcolor
0.01653 setlinewidth
0.46982 0.47489 Mdot
0 0 0 setrgbcolor
0.01323 setlinewidth
0.48176 0.46407 Mdot
0 0 0 setrgbcolor
0.01395 setlinewidth
0.52963 0.45215 Mdot
0 0 0 setrgbcolor
0.01034 setlinewidth
0.50805 0.4527 Mdot
0 0 0 setrgbcolor
0.01211 setlinewidth
0.60938 0.53229 Mdot
0 0 0 setrgbcolor
0.00854 setlinewidth
0.55337 0.45223 Mdot
0 0 0 setrgbcolor
0.01358 setlinewidth
0.48174 0.61452 Mdot
0 0 0 setrgbcolor
0.01411 setlinewidth
0.51474 0.44237 Mdot
0 0 0 setrgbcolor
0.01228 setlinewidth
0.45288 0.46626 Mdot
0 0 0 setrgbcolor
0.01114 setlinewidth
0.43237 0.49341 Mdot
0 0 0 setrgbcolor
0.01021 setlinewidth
0.4774 0.6346 Mdot
0 0 0 setrgbcolor
0.00857 setlinewidth
0.4275 0.58899 Mdot
0 0 0 setrgbcolor
0.01344 setlinewidth
0.46409 0.44207 Mdot
0 0 0 setrgbcolor
0.01986 setlinewidth
0.52439 0.42023 Mdot
0 0 0 setrgbcolor
0.00581 setlinewidth
0.6252 0.47701 Mdot
0 0 0 setrgbcolor
0.00884 setlinewidth
0.49418 0.65096 Mdot
0 0 0 setrgbcolor
0.01437 setlinewidth
0.40387 0.53839 Mdot
0 0 0 setrgbcolor
0.009 setlinewidth
0.52965 0.41594 Mdot
0 0 0 setrgbcolor
0.01833 setlinewidth
0.52287 0.41413 Mdot
0 0 0 setrgbcolor
0.01785 setlinewidth
0.40392 0.51228 Mdot
0 0 0 setrgbcolor
0.00628 setlinewidth
0.53499 0.41434 Mdot
0 0 0 setrgbcolor
0.01697 setlinewidth
0.51426 0.41384 Mdot
0 0 0 setrgbcolor
0.00782 setlinewidth
0.52571 0.4134 Mdot
0 0 0 setrgbcolor
0.01791 setlinewidth
0.42371 0.60734 Mdot
0 0 0 setrgbcolor
0.01694 setlinewidth
0.48294 0.41887 Mdot
0 0 0 setrgbcolor
0.00649 setlinewidth
0.50955 0.41201 Mdot
0 0 0 setrgbcolor
0.01187 setlinewidth
0.63064 0.47341 Mdot
0 0 0 setrgbcolor
0.00658 setlinewidth
0.56072 0.41665 Mdot
0 0 0 setrgbcolor
0.01836 setlinewidth
0.52185 0.41005 Mdot
0 0 0 setrgbcolor
0.00591 setlinewidth
0.51711 0.40978 Mdot
0 0 0 setrgbcolor
0.00623 setlinewidth
0.5093 0.41012 Mdot
0 0 0 setrgbcolor
0.00648 setlinewidth
0.52288 0.40877 Mdot
0 0 0 setrgbcolor
0.00735 setlinewidth
0.51853 0.40784 Mdot
0 0 0 setrgbcolor
0.00564 setlinewidth
0.53174 0.40774 Mdot
0 0 0 setrgbcolor
0.01439 setlinewidth
0.4581 0.64656 Mdot
0 0 0 setrgbcolor
0.00776 setlinewidth
0.54118 0.40624 Mdot
0 0 0 setrgbcolor
0.00881 setlinewidth
0.57905 0.4175 Mdot
0 0 0 setrgbcolor
0.01039 setlinewidth
0.64364 0.48515 Mdot
0 0 0 setrgbcolor
0.01276 setlinewidth
0.40162 0.48605 Mdot
0 0 0 setrgbcolor
0.01589 setlinewidth
0.63748 0.60178 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.45366 0.42187 Mdot
0 0 0 setrgbcolor
0.01187 setlinewidth
0.5125 0.40208 Mdot
0 0 0 setrgbcolor
0.00834 setlinewidth
0.62362 0.62525 Mdot
0 0 0 setrgbcolor
0.01677 setlinewidth
0.44031 0.42718 Mdot
0 0 0 setrgbcolor
0.01151 setlinewidth
0.58764 0.41409 Mdot
0 0 0 setrgbcolor
0.01057 setlinewidth
0.52668 0.39771 Mdot
0 0 0 setrgbcolor
0.00839 setlinewidth
0.50665 0.39777 Mdot
0 0 0 setrgbcolor
0.01836 setlinewidth
0.50122 0.39852 Mdot
1 1 1 setrgbcolor
0.01895 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01691 setlinewidth
0.56343 0.40154 Mdot
0 0 0 setrgbcolor
0.01973 setlinewidth
0.63817 0.45532 Mdot
0 0 0 setrgbcolor
0.01974 setlinewidth
0.61674 0.64073 Mdot
0 0 0 setrgbcolor
0.00873 setlinewidth
0.64058 0.61785 Mdot
0 0 0 setrgbcolor
0.00781 setlinewidth
0.57154 0.39997 Mdot
0 0 0 setrgbcolor
0.00623 setlinewidth
0.41436 0.44074 Mdot
0 0 0 setrgbcolor
0.01597 setlinewidth
0.43218 0.42342 Mdot
0 0 0 setrgbcolor
0.013 setlinewidth
0.57395 0.67088 Mdot
0 0 0 setrgbcolor
0.00771 setlinewidth
0.52731 0.3897 Mdot
0 0 0 setrgbcolor
0.01872 setlinewidth
0.54318 0.39061 Mdot
0 0 0 setrgbcolor
0.01748 setlinewidth
0.38162 0.496 Mdot
0 0 0 setrgbcolor
0.0132 setlinewidth
0.54836 0.39053 Mdot
0 0 0 setrgbcolor
0.00678 setlinewidth
0.60726 0.41324 Mdot
0 0 0 setrgbcolor
0.01019 setlinewidth
0.63617 0.63181 Mdot
0 0 0 setrgbcolor
0.01639 setlinewidth
0.3844 0.48029 Mdot
0 0 0 setrgbcolor
0.01877 setlinewidth
0.65733 0.60228 Mdot
0 0 0 setrgbcolor
0.01691 setlinewidth
0.61666 0.41735 Mdot
0 0 0 setrgbcolor
0.00834 setlinewidth
0.64107 0.44122 Mdot
0 0 0 setrgbcolor
0.00611 setlinewidth
0.59866 0.66604 Mdot
0 0 0 setrgbcolor
0.01842 setlinewidth
0.41003 0.43521 Mdot
0 0 0 setrgbcolor
0.00524 setlinewidth
0.58988 0.39885 Mdot
0 0 0 setrgbcolor
0.01582 setlinewidth
0.53328 0.68698 Mdot
0 0 0 setrgbcolor
0.01331 setlinewidth
0.48622 0.38785 Mdot
0 0 0 setrgbcolor
0.01968 setlinewidth
0.57633 0.3922 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.62057 0.41619 Mdot
0 0 0 setrgbcolor
0.00884 setlinewidth
0.39102 0.45407 Mdot
0 0 0 setrgbcolor
0.00902 setlinewidth
0.40274 0.63319 Mdot
0 0 0 setrgbcolor
0.00786 setlinewidth
0.49685 0.68843 Mdot
0 0 0 setrgbcolor
0.0134 setlinewidth
0.58305 0.67978 Mdot
0 0 0 setrgbcolor
0.00992 setlinewidth
0.63035 0.42145 Mdot
0 0 0 setrgbcolor
0.01908 setlinewidth
0.58687 0.67855 Mdot
0 0 0 setrgbcolor
0.01592 setlinewidth
0.55184 0.6897 Mdot
0 0 0 setrgbcolor
0.0127 setlinewidth
0.59506 0.67546 Mdot
0 0 0 setrgbcolor
0.01884 setlinewidth
0.42183 0.41447 Mdot
0 0 0 setrgbcolor
0.00702 setlinewidth
0.40224 0.63785 Mdot
0 0 0 setrgbcolor
0.01294 setlinewidth
0.6308 0.65159 Mdot
0 0 0 setrgbcolor
0.00956 setlinewidth
0.37664 0.60212 Mdot
0 0 0 setrgbcolor
0.00941 setlinewidth
0.65086 0.43634 Mdot
0 0 0 setrgbcolor
0.01954 setlinewidth
0.67151 0.60065 Mdot
0 0 0 setrgbcolor
0.01644 setlinewidth
0.36967 0.48241 Mdot
0 0 0 setrgbcolor
0.01256 setlinewidth
0.47617 0.37992 Mdot
0 0 0 setrgbcolor
0.0066 setlinewidth
0.66817 0.46237 Mdot
0 0 0 setrgbcolor
0.00714 setlinewidth
0.36092 0.54442 Mdot
0 0 0 setrgbcolor
0.01455 setlinewidth
0.38814 0.44465 Mdot
0 0 0 setrgbcolor
0.01019 setlinewidth
0.50798 0.69744 Mdot
0 0 0 setrgbcolor
0.01712 setlinewidth
0.52938 0.69804 Mdot
0 0 0 setrgbcolor
0.00808 setlinewidth
0.51147 0.69776 Mdot
0 0 0 setrgbcolor
0.01065 setlinewidth
0.37409 0.46955 Mdot
0 0 0 setrgbcolor
0.00725 setlinewidth
0.57955 0.38245 Mdot
0 0 0 setrgbcolor
0.00984 setlinewidth
0.4184 0.41042 Mdot
0 0 0 setrgbcolor
0.00597 setlinewidth
0.40693 0.64971 Mdot
0 0 0 setrgbcolor
0.01297 setlinewidth
0.37555 0.46605 Mdot
0 0 0 setrgbcolor
0.00614 setlinewidth
0.37112 0.59423 Mdot
0 0 0 setrgbcolor
0.01636 setlinewidth
0.64902 0.63879 Mdot
0 0 0 setrgbcolor
0.01752 setlinewidth
0.36329 0.5039 Mdot
0 0 0 setrgbcolor
0.01482 setlinewidth
0.37718 0.46335 Mdot
0 0 0 setrgbcolor
0.01976 setlinewidth
0.47742 0.69144 Mdot
0 0 0 setrgbcolor
0.01224 setlinewidth
0.67197 0.47005 Mdot
0 0 0 setrgbcolor
0.00777 setlinewidth
0.59918 0.67866 Mdot
0 0 0 setrgbcolor
0.0172 setlinewidth
0.47692 0.37989 Mdot
0 0 0 setrgbcolor
0.01804 setlinewidth
0.44511 0.6775 Mdot
0 0 0 setrgbcolor
0.00589 setlinewidth
0.47437 0.38082 Mdot
0 0 0 setrgbcolor
0.01547 setlinewidth
0.67196 0.47364 Mdot
0 0 0 setrgbcolor
0.01955 setlinewidth
0.67727 0.49378 Mdot
0 0 0 setrgbcolor
0.01258 setlinewidth
0.59614 0.67695 Mdot
0 0 0 setrgbcolor
0.01372 setlinewidth
0.54342 0.3779 Mdot
0 0 0 setrgbcolor
0.01749 setlinewidth
0.36664 0.51046 Mdot
0 0 0 setrgbcolor
0.01586 setlinewidth
0.43304 0.40504 Mdot
0 0 0 setrgbcolor
0.01802 setlinewidth
0.65423 0.44816 Mdot
0 0 0 setrgbcolor
0.00694 setlinewidth
0.36745 0.5147 Mdot
0 0 0 setrgbcolor
0.00562 setlinewidth
0.52202 0.69201 Mdot
0 0 0 setrgbcolor
0.01546 setlinewidth
0.53125 0.37941 Mdot
0 0 0 setrgbcolor
0.01341 setlinewidth
0.55904 0.68664 Mdot
0 0 0 setrgbcolor
0.00913 setlinewidth
0.46424 0.67906 Mdot
0 0 0 setrgbcolor
0.00716 setlinewidth
0.60449 0.66751 Mdot
0 0 0 setrgbcolor
0.0195 setlinewidth
0.36972 0.51447 Mdot
0 0 0 setrgbcolor
0.01907 setlinewidth
0.51352 0.68948 Mdot
0 0 0 setrgbcolor
0.01057 setlinewidth
0.57937 0.39226 Mdot
0 0 0 setrgbcolor
0.01767 setlinewidth
0.61098 0.66151 Mdot
1 1 1 setrgbcolor
0.01895 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01559 setlinewidth
0.50837 0.68441 Mdot
0 0 0 setrgbcolor
0.01882 setlinewidth
0.44686 0.66203 Mdot
0 0 0 setrgbcolor
0.0181 setlinewidth
0.52122 0.68005 Mdot
0 0 0 setrgbcolor
0.0193 setlinewidth
0.57559 0.66982 Mdot
0 0 0 setrgbcolor
0.01609 setlinewidth
0.51318 0.67919 Mdot
0 0 0 setrgbcolor
0.01042 setlinewidth
0.39234 0.47459 Mdot
0 0 0 setrgbcolor
0.01636 setlinewidth
0.6662 0.52886 Mdot
0 0 0 setrgbcolor
0.01901 setlinewidth
0.60883 0.64999 Mdot
0 0 0 setrgbcolor
0.01753 setlinewidth
0.64353 0.45853 Mdot
0 0 0 setrgbcolor
0.00669 setlinewidth
0.66504 0.52083 Mdot
0 0 0 setrgbcolor
0.0148 setlinewidth
0.5315 0.67753 Mdot
0 0 0 setrgbcolor
0.00871 setlinewidth
0.61691 0.4294 Mdot
0 0 0 setrgbcolor
0.0128 setlinewidth
0.38216 0.5339 Mdot
0 0 0 setrgbcolor
0.00803 setlinewidth
0.62292 0.43651 Mdot
0 0 0 setrgbcolor
0.01895 setlinewidth
0.52768 0.67479 Mdot
0 0 0 setrgbcolor
0.00752 setlinewidth
0.58314 0.66066 Mdot
0 0 0 setrgbcolor
0.01992 setlinewidth
0.52096 0.67325 Mdot
0 0 0 setrgbcolor
0.00949 setlinewidth
0.52243 0.67251 Mdot
0 0 0 setrgbcolor
0.01843 setlinewidth
0.60189 0.42315 Mdot
0 0 0 setrgbcolor
0.01175 setlinewidth
0.55289 0.66858 Mdot
0 0 0 setrgbcolor
0.00606 setlinewidth
0.56909 0.66282 Mdot
0 0 0 setrgbcolor
0.00582 setlinewidth
0.63113 0.45529 Mdot
0 0 0 setrgbcolor
0.00837 setlinewidth
0.64873 0.49354 Mdot
0 0 0 setrgbcolor
0.01138 setlinewidth
0.50116 0.66476 Mdot
0 0 0 setrgbcolor
0.00729 setlinewidth
0.62543 0.45637 Mdot
0 0 0 setrgbcolor
0.01613 setlinewidth
0.55162 0.65566 Mdot
0 0 0 setrgbcolor
0.01495 setlinewidth
0.5096 0.65786 Mdot
0 0 0 setrgbcolor
0.01387 setlinewidth
0.51654 0.65705 Mdot
0 0 0 setrgbcolor
0.00737 setlinewidth
0.4691 0.64338 Mdot
0 0 0 setrgbcolor
0.01032 setlinewidth
0.41494 0.58859 Mdot
0 0 0 setrgbcolor
0.01465 setlinewidth
0.53459 0.65487 Mdot
0 0 0 setrgbcolor
0.00638 setlinewidth
0.6074 0.62066 Mdot
0 0 0 setrgbcolor
0.01552 setlinewidth
0.56634 0.64433 Mdot
0 0 0 setrgbcolor
0.00561 setlinewidth
0.63826 0.55459 Mdot
0 0 0 setrgbcolor
0.00866 setlinewidth
0.45868 0.63155 Mdot
0 0 0 setrgbcolor
0.01975 setlinewidth
0.60978 0.61171 Mdot
0 0 0 setrgbcolor
0.00718 setlinewidth
0.63419 0.50732 Mdot
0 0 0 setrgbcolor
0.00585 setlinewidth
0.55668 0.63462 Mdot
0 0 0 setrgbcolor
0.00512 setlinewidth
0.61016 0.59352 Mdot
0 0 0 setrgbcolor
0.01759 setlinewidth
0.60399 0.60059 Mdot
0 0 0 setrgbcolor
0.01566 setlinewidth
0.58782 0.60826 Mdot
0 0 0 setrgbcolor
0.00994 setlinewidth
0.4625 0.60894 Mdot
0 0 0 setrgbcolor
0.01919 setlinewidth
0.49117 0.44967 Mdot
0 0 0 setrgbcolor
0.01539 setlinewidth
0.46237 0.60048 Mdot
0 0 0 setrgbcolor
0.01661 setlinewidth
0.48295 0.46033 Mdot
0 0 0 setrgbcolor
0.00659 setlinewidth
0.57375 0.46745 Mdot
0 0 0 setrgbcolor
0.01572 setlinewidth
0.58844 0.58766 Mdot
0 0 0 setrgbcolor
0.01298 setlinewidth
0.44215 0.55117 Mdot
0 0 0 setrgbcolor
0.0187 setlinewidth
0.44453 0.54073 Mdot
0 0 0 setrgbcolor
0.01062 setlinewidth
0.56924 0.47351 Mdot
0 0 0 setrgbcolor
0.01205 setlinewidth
0.51886 0.46604 Mdot
0 0 0 setrgbcolor
0.01902 setlinewidth
0.48943 0.59075 Mdot
0 0 0 setrgbcolor
0.01652 setlinewidth
0.4744 0.51817 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.55529 0.49581 Mdot
0 0 0 setrgbcolor
0.00779 setlinewidth
0.50294 0.58148 Mdot
0 0 0 setrgbcolor
0.01743 setlinewidth
0.49688 0.57644 Mdot
0 0 0 setrgbcolor
0.01714 setlinewidth
0.49245 0.52227 Mdot
0 0 0 setrgbcolor
0.00671 setlinewidth
0.51249 0.5658 Mdot
0 0 0 setrgbcolor
0.01522 setlinewidth
0.53955 0.52543 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01392 setlinewidth
0.52311 0.55778 Mdot
0 0 0 setrgbcolor
0.00594 setlinewidth
0.52051 0.55989 Mdot
0 0 0 setrgbcolor
0.00683 setlinewidth
0.55318 0.56885 Mdot
0 0 0 setrgbcolor
0.00963 setlinewidth
0.52818 0.47691 Mdot
0 0 0 setrgbcolor
0.01851 setlinewidth
0.54138 0.47571 Mdot
0 0 0 setrgbcolor
0.01717 setlinewidth
0.50348 0.59808 Mdot
0 0 0 setrgbcolor
0.0166 setlinewidth
0.48689 0.47918 Mdot
0 0 0 setrgbcolor
0.01787 setlinewidth
0.53871 0.60616 Mdot
0 0 0 setrgbcolor
0.01475 setlinewidth
0.49705 0.46615 Mdot
0 0 0 setrgbcolor
0.01457 setlinewidth
0.55042 0.46226 Mdot
0 0 0 setrgbcolor
0.01962 setlinewidth
0.44949 0.50427 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.52904 0.45562 Mdot
0 0 0 setrgbcolor
0.01128 setlinewidth
0.58883 0.48794 Mdot
0 0 0 setrgbcolor
0.00776 setlinewidth
0.5785 0.47384 Mdot
0 0 0 setrgbcolor
0.013 setlinewidth
0.46611 0.47315 Mdot
0 0 0 setrgbcolor
0.01646 setlinewidth
0.55794 0.45779 Mdot
0 0 0 setrgbcolor
0.01299 setlinewidth
0.52168 0.4502 Mdot
0 0 0 setrgbcolor
0.00982 setlinewidth
0.51908 0.62152 Mdot
0 0 0 setrgbcolor
0.01846 setlinewidth
0.56766 0.45911 Mdot
0 0 0 setrgbcolor
0.00769 setlinewidth
0.54358 0.44612 Mdot
0 0 0 setrgbcolor
0.00658 setlinewidth
0.56455 0.45173 Mdot
0 0 0 setrgbcolor
0.00901 setlinewidth
0.56497 0.45157 Mdot
0 0 0 setrgbcolor
0.01918 setlinewidth
0.45738 0.6033 Mdot
0 0 0 setrgbcolor
0.01368 setlinewidth
0.52561 0.43851 Mdot
0 0 0 setrgbcolor
0.00608 setlinewidth
0.42421 0.55501 Mdot
0 0 0 setrgbcolor
0.00667 setlinewidth
0.4716 0.44661 Mdot
0 0 0 setrgbcolor
0.0081 setlinewidth
0.56716 0.44238 Mdot
0 0 0 setrgbcolor
0.01434 setlinewidth
0.41985 0.52829 Mdot
0 0 0 setrgbcolor
0.00751 setlinewidth
0.51454 0.64316 Mdot
0 0 0 setrgbcolor
0.01663 setlinewidth
0.45358 0.62292 Mdot
0 0 0 setrgbcolor
0.00902 setlinewidth
0.63751 0.51684 Mdot
0 0 0 setrgbcolor
0.00559 setlinewidth
0.41113 0.50197 Mdot
0 0 0 setrgbcolor
0.00533 setlinewidth
0.52819 0.41426 Mdot
0 0 0 setrgbcolor
0.01593 setlinewidth
0.48426 0.41983 Mdot
0 0 0 setrgbcolor
0.01445 setlinewidth
0.53199 0.65789 Mdot
0 0 0 setrgbcolor
0.01128 setlinewidth
0.51545 0.40943 Mdot
0 0 0 setrgbcolor
0.01753 setlinewidth
0.53191 0.40901 Mdot
0 0 0 setrgbcolor
0.01689 setlinewidth
0.49248 0.65859 Mdot
0 0 0 setrgbcolor
0.00902 setlinewidth
0.52437 0.40829 Mdot
0 0 0 setrgbcolor
0.01291 setlinewidth
0.50986 0.40836 Mdot
0 0 0 setrgbcolor
0.01834 setlinewidth
0.52697 0.40707 Mdot
0 0 0 setrgbcolor
0.01862 setlinewidth
0.4527 0.42789 Mdot
0 0 0 setrgbcolor
0.0186 setlinewidth
0.53663 0.40649 Mdot
0 0 0 setrgbcolor
0.01573 setlinewidth
0.50884 0.40647 Mdot
0 0 0 setrgbcolor
0.00706 setlinewidth
0.43919 0.43558 Mdot
0 0 0 setrgbcolor
0.00665 setlinewidth
0.51677 0.40482 Mdot
0 0 0 setrgbcolor
0.01644 setlinewidth
0.52172 0.4043 Mdot
0 0 0 setrgbcolor
0.0061 setlinewidth
0.52224 0.40283 Mdot
0 0 0 setrgbcolor
0.00632 setlinewidth
0.51742 0.40261 Mdot
0 0 0 setrgbcolor
0.01674 setlinewidth
0.53074 0.4003 Mdot
0 0 0 setrgbcolor
0.01195 setlinewidth
0.56254 0.40464 Mdot
0 0 0 setrgbcolor
0.01991 setlinewidth
0.38739 0.51562 Mdot
0 0 0 setrgbcolor
0.01236 setlinewidth
0.4126 0.45386 Mdot
0 0 0 setrgbcolor
0.01031 setlinewidth
0.50872 0.39777 Mdot
0 0 0 setrgbcolor
0.01086 setlinewidth
0.53945 0.39721 Mdot
0 0 0 setrgbcolor
0.00676 setlinewidth
0.42769 0.43324 Mdot
0 0 0 setrgbcolor
0.01706 setlinewidth
0.63999 0.45683 Mdot
0 0 0 setrgbcolor
0.01042 setlinewidth
0.3867 0.49921 Mdot
0 0 0 setrgbcolor
0.016 setlinewidth
0.49521 0.39608 Mdot
0 0 0 setrgbcolor
0.01623 setlinewidth
0.50058 0.39439 Mdot
0 0 0 setrgbcolor
0.00906 setlinewidth
0.52117 0.39095 Mdot
0 0 0 setrgbcolor
0.00623 setlinewidth
0.5799 0.40254 Mdot
0 0 0 setrgbcolor
0.01781 setlinewidth
0.64357 0.45228 Mdot
0 0 0 setrgbcolor
0.0063 setlinewidth
0.40439 0.44911 Mdot
1 1 1 setrgbcolor
0.00513 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.00815 setlinewidth
0.55851 0.38876 Mdot
0 0 0 setrgbcolor
0.006 setlinewidth
0.38609 0.4716 Mdot
0 0 0 setrgbcolor
0.01666 setlinewidth
0.5861 0.39768 Mdot
0 0 0 setrgbcolor
0.0113 setlinewidth
0.65722 0.46258 Mdot
0 0 0 setrgbcolor
0.00862 setlinewidth
0.51759 0.38274 Mdot
0 0 0 setrgbcolor
0.01398 setlinewidth
0.42465 0.6534 Mdot
0 0 0 setrgbcolor
0.01566 setlinewidth
0.66855 0.58608 Mdot
0 0 0 setrgbcolor
0.01166 setlinewidth
0.65698 0.61285 Mdot
0 0 0 setrgbcolor
0.01138 setlinewidth
0.5337 0.381 Mdot
0 0 0 setrgbcolor
0.00501 setlinewidth
0.56507 0.38584 Mdot
0 0 0 setrgbcolor
0.01257 setlinewidth
0.47278 0.38795 Mdot
0 0 0 setrgbcolor
0.01222 setlinewidth
0.53859 0.38005 Mdot
0 0 0 setrgbcolor
0.01472 setlinewidth
0.40878 0.42622 Mdot
0 0 0 setrgbcolor
0.01897 setlinewidth
0.60908 0.66807 Mdot
0 0 0 setrgbcolor
0.0066 setlinewidth
0.65018 0.63026 Mdot
0 0 0 setrgbcolor
0.0141 setlinewidth
0.64385 0.4324 Mdot
0 0 0 setrgbcolor
0.01496 setlinewidth
0.42237 0.65846 Mdot
0 0 0 setrgbcolor
0.01355 setlinewidth
0.56641 0.69081 Mdot
0 0 0 setrgbcolor
0.01959 setlinewidth
0.38899 0.62563 Mdot
0 0 0 setrgbcolor
0.01009 setlinewidth
0.60196 0.39374 Mdot
0 0 0 setrgbcolor
0.01058 setlinewidth
0.67051 0.60281 Mdot
0 0 0 setrgbcolor
0.0108 setlinewidth
0.5275 0.69746 Mdot
0 0 0 setrgbcolor
0.01828 setlinewidth
0.56462 0.37721 Mdot
0 0 0 setrgbcolor
0.01132 setlinewidth
0.57998 0.3818 Mdot
0 0 0 setrgbcolor
0.0176 setlinewidth
0.36196 0.5044 Mdot
0 0 0 setrgbcolor
0.0185 setlinewidth
0.36233 0.56908 Mdot
0 0 0 setrgbcolor
0.0071 setlinewidth
0.61121 0.39652 Mdot
0 0 0 setrgbcolor
0.0133 setlinewidth
0.63106 0.65976 Mdot
0 0 0 setrgbcolor
0.01079 setlinewidth
0.66592 0.61832 Mdot
0 0 0 setrgbcolor
0.01432 setlinewidth
0.37372 0.46298 Mdot
0 0 0 setrgbcolor
0.00601 setlinewidth
0.6401 0.41742 Mdot
0 0 0 setrgbcolor
0.01207 setlinewidth
0.36255 0.49072 Mdot
0 0 0 setrgbcolor
0.01866 setlinewidth
0.68278 0.58414 Mdot
0 0 0 setrgbcolor
0.01923 setlinewidth
0.61322 0.39477 Mdot
0 0 0 setrgbcolor
0.01307 setlinewidth
0.58268 0.69136 Mdot
0 0 0 setrgbcolor
0.00939 setlinewidth
0.61378 0.67662 Mdot
0 0 0 setrgbcolor
0.01036 setlinewidth
0.61726 0.67482 Mdot
0 0 0 setrgbcolor
0.01732 setlinewidth
0.36183 0.48702 Mdot
0 0 0 setrgbcolor
0.00548 setlinewidth
0.37635 0.61882 Mdot
0 0 0 setrgbcolor
0.01992 setlinewidth
0.45219 0.38205 Mdot
0 0 0 setrgbcolor
0.00778 setlinewidth
0.35429 0.52766 Mdot
0 0 0 setrgbcolor
0.01541 setlinewidth
0.62254 0.39872 Mdot
0 0 0 setrgbcolor
0.00652 setlinewidth
0.62468 0.67049 Mdot
0 0 0 setrgbcolor
0.01203 setlinewidth
0.39651 0.42318 Mdot
0 0 0 setrgbcolor
0.00759 setlinewidth
0.42081 0.67067 Mdot
0 0 0 setrgbcolor
0.01318 setlinewidth
0.36124 0.48413 Mdot
0 0 0 setrgbcolor
0.01417 setlinewidth
0.65735 0.6404 Mdot
0 0 0 setrgbcolor
0.01847 setlinewidth
0.53155 0.70606 Mdot
0 0 0 setrgbcolor
0.00559 setlinewidth
0.53505 0.70592 Mdot
0 0 0 setrgbcolor
0.00746 setlinewidth
0.55341 0.70378 Mdot
0 0 0 setrgbcolor
0.01814 setlinewidth
0.45967 0.69437 Mdot
0 0 0 setrgbcolor
0.01786 setlinewidth
0.64099 0.41122 Mdot
0 0 0 setrgbcolor
0.0162 setlinewidth
0.49558 0.70431 Mdot
0 0 0 setrgbcolor
0.00592 setlinewidth
0.44641 0.38231 Mdot
0 0 0 setrgbcolor
0.00727 setlinewidth
0.44372 0.38371 Mdot
0 0 0 setrgbcolor
0.01686 setlinewidth
0.35195 0.53434 Mdot
0 0 0 setrgbcolor
0.01018 setlinewidth
0.55491 0.36723 Mdot
0 0 0 setrgbcolor
0.01157 setlinewidth
0.35225 0.53864 Mdot
0 0 0 setrgbcolor
0.01885 setlinewidth
0.66168 0.43581 Mdot
0 0 0 setrgbcolor
0.01131 setlinewidth
0.68747 0.58106 Mdot
0 0 0 setrgbcolor
0.01382 setlinewidth
0.40176 0.41581 Mdot
0 0 0 setrgbcolor
0.01521 setlinewidth
0.35292 0.53817 Mdot
0 0 0 setrgbcolor
0.01402 setlinewidth
0.66561 0.62499 Mdot
0 0 0 setrgbcolor
0.01968 setlinewidth
0.61733 0.67428 Mdot
0 0 0 setrgbcolor
0.00884 setlinewidth
0.509 0.36922 Mdot
0 0 0 setrgbcolor
0.01687 setlinewidth
0.47229 0.69397 Mdot
0 0 0 setrgbcolor
0.01117 setlinewidth
0.66137 0.44365 Mdot
0 0 0 setrgbcolor
0.00618 setlinewidth
0.49481 0.373 Mdot
0 0 0 setrgbcolor
0.01787 setlinewidth
0.53381 0.69946 Mdot
0 0 0 setrgbcolor
0.01079 setlinewidth
0.36401 0.49425 Mdot
0 0 0 setrgbcolor
0.00779 setlinewidth
0.60994 0.67325 Mdot
0 0 0 setrgbcolor
0.01765 setlinewidth
0.36165 0.55668 Mdot
0 0 0 setrgbcolor
0.0111 setlinewidth
0.52325 0.6981 Mdot
0 0 0 setrgbcolor
0.00648 setlinewidth
0.4482 0.67907 Mdot
0 0 0 setrgbcolor
0.01977 setlinewidth
0.65927 0.44761 Mdot
0 0 0 setrgbcolor
0.00735 setlinewidth
0.5701 0.68883 Mdot
1 1 1 setrgbcolor
0.00513 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.51468 0.69375 Mdot
0 0 0 setrgbcolor
0.01581 setlinewidth
0.54433 0.37824 Mdot
0 0 0 setrgbcolor
0.01418 setlinewidth
0.66626 0.46811 Mdot
0 0 0 setrgbcolor
0.01647 setlinewidth
0.633 0.42397 Mdot
0 0 0 setrgbcolor
0.01524 setlinewidth
0.61389 0.66244 Mdot
0 0 0 setrgbcolor
0.00902 setlinewidth
0.61877 0.65528 Mdot
0 0 0 setrgbcolor
0.0085 setlinewidth
0.51631 0.68787 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.52484 0.68763 Mdot
0 0 0 setrgbcolor
0.00662 setlinewidth
0.53405 0.68366 Mdot
0 0 0 setrgbcolor
0.00513 setlinewidth
0.52867 0.68143 Mdot
0 0 0 setrgbcolor
0.01815 setlinewidth
0.39654 0.6085 Mdot
0 0 0 setrgbcolor
0.00718 setlinewidth
0.52103 0.6808 Mdot
0 0 0 setrgbcolor
0.0186 setlinewidth
0.57887 0.6694 Mdot
0 0 0 setrgbcolor
0.01598 setlinewidth
0.52216 0.67985 Mdot
0 0 0 setrgbcolor
0.00709 setlinewidth
0.49753 0.67488 Mdot
0 0 0 setrgbcolor
0.01988 setlinewidth
0.55251 0.67151 Mdot
0 0 0 setrgbcolor
0.00809 setlinewidth
0.6097 0.64389 Mdot
0 0 0 setrgbcolor
0.01872 setlinewidth
0.58309 0.41109 Mdot
0 0 0 setrgbcolor
0.0091 setlinewidth
0.45913 0.65738 Mdot
0 0 0 setrgbcolor
0.01247 setlinewidth
0.58324 0.65889 Mdot
0 0 0 setrgbcolor
0.00639 setlinewidth
0.44574 0.64669 Mdot
0 0 0 setrgbcolor
0.01409 setlinewidth
0.56795 0.66324 Mdot
0 0 0 setrgbcolor
0.00648 setlinewidth
0.59004 0.41756 Mdot
0 0 0 setrgbcolor
0.00923 setlinewidth
0.61577 0.43719 Mdot
0 0 0 setrgbcolor
0.00573 setlinewidth
0.56507 0.40716 Mdot
0 0 0 setrgbcolor
0.00554 setlinewidth
0.50293 0.6667 Mdot
0 0 0 setrgbcolor
0.01079 setlinewidth
0.65062 0.50761 Mdot
0 0 0 setrgbcolor
0.01403 setlinewidth
0.50953 0.66491 Mdot
0 0 0 setrgbcolor
0.0115 setlinewidth
0.64792 0.49933 Mdot
0 0 0 setrgbcolor
0.01383 setlinewidth
0.59948 0.43604 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.54559 0.65849 Mdot
0 0 0 setrgbcolor
0.01583 setlinewidth
0.52719 0.66014 Mdot
0 0 0 setrgbcolor
0.0086 setlinewidth
0.59223 0.43822 Mdot
0 0 0 setrgbcolor
0.00938 setlinewidth
0.44245 0.62303 Mdot
0 0 0 setrgbcolor
0.01347 setlinewidth
0.62316 0.47343 Mdot
0 0 0 setrgbcolor
0.01515 setlinewidth
0.41151 0.56642 Mdot
0 0 0 setrgbcolor
0.00781 setlinewidth
0.55747 0.64466 Mdot
0 0 0 setrgbcolor
0.00958 setlinewidth
0.44012 0.61437 Mdot
0 0 0 setrgbcolor
0.01465 setlinewidth
0.41185 0.55532 Mdot
0 0 0 setrgbcolor
0.01501 setlinewidth
0.44644 0.45373 Mdot
0 0 0 setrgbcolor
0.00851 setlinewidth
0.43893 0.46616 Mdot
0 0 0 setrgbcolor
0.01953 setlinewidth
0.59679 0.61383 Mdot
0 0 0 setrgbcolor
0.00543 setlinewidth
0.54359 0.63609 Mdot
0 0 0 setrgbcolor
0.00532 setlinewidth
0.59689 0.60415 Mdot
0 0 0 setrgbcolor
0.01677 setlinewidth
0.61785 0.53969 Mdot
0 0 0 setrgbcolor
0.01089 setlinewidth
0.60575 0.4906 Mdot
0 0 0 setrgbcolor
0.01905 setlinewidth
0.46316 0.60055 Mdot
0 0 0 setrgbcolor
0.01496 setlinewidth
0.43587 0.52762 Mdot
0 0 0 setrgbcolor
0.00706 setlinewidth
0.58692 0.59349 Mdot
0 0 0 setrgbcolor
0.01341 setlinewidth
0.59235 0.58513 Mdot
0 0 0 setrgbcolor
0.00719 setlinewidth
0.47428 0.46643 Mdot
0 0 0 setrgbcolor
0.01863 setlinewidth
0.57032 0.60404 Mdot
0 0 0 setrgbcolor
0.01708 setlinewidth
0.5322 0.4589 Mdot
0 0 0 setrgbcolor
0.00779 setlinewidth
0.46724 0.58469 Mdot
0 0 0 setrgbcolor
0.01579 setlinewidth
0.47426 0.58902 Mdot
0 0 0 setrgbcolor
0.00796 setlinewidth
0.45363 0.52918 Mdot
0 0 0 setrgbcolor
0.0156 setlinewidth
0.52759 0.46602 Mdot
0 0 0 setrgbcolor
0.01228 setlinewidth
0.56582 0.58249 Mdot
0 0 0 setrgbcolor
0.01536 setlinewidth
0.48052 0.57137 Mdot
0 0 0 setrgbcolor
0.01573 setlinewidth
0.51439 0.49172 Mdot
0 0 0 setrgbcolor
0.01138 setlinewidth
0.50139 0.52521 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.0098 setlinewidth
0.5567 0.55877 Mdot
0 0 0 setrgbcolor
0.01192 setlinewidth
0.5591 0.55618 Mdot
0 0 0 setrgbcolor
0.01079 setlinewidth
0.47271 0.51247 Mdot
0 0 0 setrgbcolor
0.00817 setlinewidth
0.50781 0.48068 Mdot
0 0 0 setrgbcolor
0.0112 setlinewidth
0.54287 0.60104 Mdot
0 0 0 setrgbcolor
0.01968 setlinewidth
0.54999 0.47171 Mdot
0 0 0 setrgbcolor
0.00605 setlinewidth
0.48415 0.47788 Mdot
0 0 0 setrgbcolor
0.01701 setlinewidth
0.51541 0.46566 Mdot
0 0 0 setrgbcolor
0.00689 setlinewidth
0.59059 0.5632 Mdot
0 0 0 setrgbcolor
0.01121 setlinewidth
0.56296 0.46839 Mdot
0 0 0 setrgbcolor
0.01689 setlinewidth
0.45239 0.56861 Mdot
0 0 0 setrgbcolor
0.01107 setlinewidth
0.44359 0.54189 Mdot
0 0 0 setrgbcolor
0.00794 setlinewidth
0.49386 0.61337 Mdot
0 0 0 setrgbcolor
0.01769 setlinewidth
0.54562 0.44966 Mdot
0 0 0 setrgbcolor
0.0067 setlinewidth
0.5794 0.60432 Mdot
0 0 0 setrgbcolor
0.011 setlinewidth
0.5367 0.44528 Mdot
0 0 0 setrgbcolor
0.00868 setlinewidth
0.56865 0.45307 Mdot
0 0 0 setrgbcolor
0.01968 setlinewidth
0.48315 0.44985 Mdot
0 0 0 setrgbcolor
0.01335 setlinewidth
0.5602 0.62324 Mdot
0 0 0 setrgbcolor
0.01113 setlinewidth
0.42859 0.5164 Mdot
0 0 0 setrgbcolor
0.01177 setlinewidth
0.57486 0.44726 Mdot
0 0 0 setrgbcolor
0.01346 setlinewidth
0.53736 0.43265 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.55757 0.43754 Mdot
0 0 0 setrgbcolor
0.01198 setlinewidth
0.49029 0.63436 Mdot
0 0 0 setrgbcolor
0.01902 setlinewidth
0.59872 0.46059 Mdot
0 0 0 setrgbcolor
0.00881 setlinewidth
0.58463 0.44707 Mdot
0 0 0 setrgbcolor
0.01813 setlinewidth
0.61174 0.47361 Mdot
0 0 0 setrgbcolor
0.01947 setlinewidth
0.57964 0.43994 Mdot
0 0 0 setrgbcolor
0.01736 setlinewidth
0.58 0.43971 Mdot
0 0 0 setrgbcolor
0.01869 setlinewidth
0.55572 0.6466 Mdot
0 0 0 setrgbcolor
0.00674 setlinewidth
0.57947 0.42989 Mdot
0 0 0 setrgbcolor
0.0144 setlinewidth
0.48829 0.42043 Mdot
0 0 0 setrgbcolor
0.01982 setlinewidth
0.40238 0.53434 Mdot
0 0 0 setrgbcolor
0.01499 setlinewidth
0.44356 0.44411 Mdot
0 0 0 setrgbcolor
0.00766 setlinewidth
0.45635 0.43399 Mdot
0 0 0 setrgbcolor
0.01254 setlinewidth
0.41803 0.46723 Mdot
0 0 0 setrgbcolor
0.01385 setlinewidth
0.39807 0.51775 Mdot
0 0 0 setrgbcolor
0.00706 setlinewidth
0.53202 0.4074 Mdot
0 0 0 setrgbcolor
0.01261 setlinewidth
0.51727 0.40459 Mdot
0 0 0 setrgbcolor
0.01122 setlinewidth
0.53191 0.666 Mdot
0 0 0 setrgbcolor
0.00825 setlinewidth
0.42921 0.44373 Mdot
0 0 0 setrgbcolor
0.00992 setlinewidth
0.51109 0.40444 Mdot
0 0 0 setrgbcolor
0.01059 setlinewidth
0.50929 0.40269 Mdot
0 0 0 setrgbcolor
0.01245 setlinewidth
0.52593 0.40193 Mdot
0 0 0 setrgbcolor
0.01064 setlinewidth
0.57298 0.65967 Mdot
0 0 0 setrgbcolor
0.00972 setlinewidth
0.5338 0.40142 Mdot
0 0 0 setrgbcolor
0.01982 setlinewidth
0.52808 0.40026 Mdot
0 0 0 setrgbcolor
0.01837 setlinewidth
0.51683 0.39967 Mdot
0 0 0 setrgbcolor
0.01869 setlinewidth
0.40623 0.46387 Mdot
0 0 0 setrgbcolor
0.01306 setlinewidth
0.52167 0.39831 Mdot
0 0 0 setrgbcolor
0.00733 setlinewidth
0.53752 0.39806 Mdot
0 0 0 setrgbcolor
0.00588 setlinewidth
0.51659 0.39731 Mdot
0 0 0 setrgbcolor
0.01936 setlinewidth
0.5216 0.39672 Mdot
0 0 0 setrgbcolor
0.01028 setlinewidth
0.38988 0.48986 Mdot
0 0 0 setrgbcolor
0.01571 setlinewidth
0.50556 0.39386 Mdot
0 0 0 setrgbcolor
0.01204 setlinewidth
0.52912 0.39272 Mdot
0 0 0 setrgbcolor
0.00597 setlinewidth
0.6615 0.49642 Mdot
0 0 0 setrgbcolor
0.01111 setlinewidth
0.49054 0.39445 Mdot
0 0 0 setrgbcolor
0.01473 setlinewidth
0.49548 0.39182 Mdot
0 0 0 setrgbcolor
0.00726 setlinewidth
0.53642 0.38812 Mdot
0 0 0 setrgbcolor
0.00946 setlinewidth
0.56187 0.39189 Mdot
0 0 0 setrgbcolor
0.00556 setlinewidth
0.51524 0.38483 Mdot
0 0 0 setrgbcolor
0.00869 setlinewidth
0.45455 0.67072 Mdot
0 0 0 setrgbcolor
0.00618 setlinewidth
0.40246 0.44006 Mdot
1 1 1 setrgbcolor
0.00604 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01684 setlinewidth
0.4616 0.39015 Mdot
0 0 0 setrgbcolor
0.01962 setlinewidth
0.57695 0.38692 Mdot
0 0 0 setrgbcolor
0.00777 setlinewidth
0.41088 0.64748 Mdot
0 0 0 setrgbcolor
0.01661 setlinewidth
0.45051 0.67645 Mdot
0 0 0 setrgbcolor
0.00692 setlinewidth
0.36443 0.52755 Mdot
0 0 0 setrgbcolor
0.01027 setlinewidth
0.50731 0.37713 Mdot
0 0 0 setrgbcolor
0.01335 setlinewidth
0.37434 0.59355 Mdot
0 0 0 setrgbcolor
0.00566 setlinewidth
0.55063 0.37637 Mdot
0 0 0 setrgbcolor
0.01904 setlinewidth
0.64868 0.43349 Mdot
0 0 0 setrgbcolor
0.0142 setlinewidth
0.52253 0.37265 Mdot
0 0 0 setrgbcolor
0.01077 setlinewidth
0.36835 0.48355 Mdot
0 0 0 setrgbcolor
0.01739 setlinewidth
0.36096 0.51364 Mdot
0 0 0 setrgbcolor
0.00521 setlinewidth
0.52674 0.37087 Mdot
0 0 0 setrgbcolor
0.01938 setlinewidth
0.58005 0.38096 Mdot
0 0 0 setrgbcolor
0.01421 setlinewidth
0.6499 0.42824 Mdot
0 0 0 setrgbcolor
0.00627 setlinewidth
0.55501 0.37234 Mdot
0 0 0 setrgbcolor
0.00615 setlinewidth
0.35799 0.5101 Mdot
0 0 0 setrgbcolor
0.01261 setlinewidth
0.35591 0.55277 Mdot
0 0 0 setrgbcolor
0.00902 setlinewidth
0.39151 0.64274 Mdot
0 0 0 setrgbcolor
0.01658 setlinewidth
0.35512 0.50737 Mdot
0 0 0 setrgbcolor
0.01309 setlinewidth
0.38164 0.43947 Mdot
0 0 0 setrgbcolor
0.01396 setlinewidth
0.6634 0.43695 Mdot
0 0 0 setrgbcolor
0.01642 setlinewidth
0.56098 0.7026 Mdot
0 0 0 setrgbcolor
0.00959 setlinewidth
0.64279 0.66036 Mdot
0 0 0 setrgbcolor
0.01375 setlinewidth
0.60038 0.69029 Mdot
0 0 0 setrgbcolor
0.00791 setlinewidth
0.6858 0.59519 Mdot
0 0 0 setrgbcolor
0.00961 setlinewidth
0.69403 0.56521 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.54873 0.36372 Mdot
0 0 0 setrgbcolor
0.01116 setlinewidth
0.43106 0.38811 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.44242 0.68994 Mdot
0 0 0 setrgbcolor
0.00619 setlinewidth
0.6419 0.40768 Mdot
0 0 0 setrgbcolor
0.01933 setlinewidth
0.59055 0.37447 Mdot
0 0 0 setrgbcolor
0.01061 setlinewidth
0.56501 0.36586 Mdot
0 0 0 setrgbcolor
0.01912 setlinewidth
0.67953 0.61469 Mdot
0 0 0 setrgbcolor
0.01478 setlinewidth
0.59896 0.37588 Mdot
0 0 0 setrgbcolor
0.01345 setlinewidth
0.34777 0.56045 Mdot
0 0 0 setrgbcolor
0.01555 setlinewidth
0.69457 0.58288 Mdot
0 0 0 setrgbcolor
0.01339 setlinewidth
0.34751 0.56488 Mdot
0 0 0 setrgbcolor
0.01603 setlinewidth
0.61317 0.68897 Mdot
0 0 0 setrgbcolor
0.00705 setlinewidth
0.6604 0.64883 Mdot
0 0 0 setrgbcolor
0.00797 setlinewidth
0.59867 0.37384 Mdot
0 0 0 setrgbcolor
0.00589 setlinewidth
0.63084 0.39292 Mdot
0 0 0 setrgbcolor
0.00721 setlinewidth
0.34645 0.56442 Mdot
0 0 0 setrgbcolor
0.01196 setlinewidth
0.69007 0.6001 Mdot
0 0 0 setrgbcolor
0.0058 setlinewidth
0.41863 0.38977 Mdot
0 0 0 setrgbcolor
0.01862 setlinewidth
0.41598 0.39168 Mdot
0 0 0 setrgbcolor
0.01651 setlinewidth
0.64228 0.66924 Mdot
0 0 0 setrgbcolor
0.00932 setlinewidth
0.64517 0.66689 Mdot
0 0 0 setrgbcolor
0.00507 setlinewidth
0.60676 0.37652 Mdot
0 0 0 setrgbcolor
0.01509 setlinewidth
0.37649 0.43169 Mdot
0 0 0 setrgbcolor
0.01807 setlinewidth
0.47968 0.70961 Mdot
0 0 0 setrgbcolor
0.01714 setlinewidth
0.55704 0.71182 Mdot
0 0 0 setrgbcolor
0.01657 setlinewidth
0.70092 0.56158 Mdot
0 0 0 setrgbcolor
0.01604 setlinewidth
0.65128 0.66137 Mdot
0 0 0 setrgbcolor
0.00928 setlinewidth
0.56034 0.71122 Mdot
0 0 0 setrgbcolor
0.00821 setlinewidth
0.51732 0.7151 Mdot
0 0 0 setrgbcolor
0.01325 setlinewidth
0.57809 0.70656 Mdot
0 0 0 setrgbcolor
0.01864 setlinewidth
0.52529 0.35576 Mdot
0 0 0 setrgbcolor
0.01681 setlinewidth
0.6784 0.62516 Mdot
0 0 0 setrgbcolor
0.00898 setlinewidth
0.34461 0.51834 Mdot
0 0 0 setrgbcolor
0.00507 setlinewidth
0.35065 0.5826 Mdot
0 0 0 setrgbcolor
0.0181 setlinewidth
0.62147 0.38687 Mdot
0 0 0 setrgbcolor
0.01097 setlinewidth
0.48446 0.70817 Mdot
0 0 0 setrgbcolor
0.01994 setlinewidth
0.47208 0.36615 Mdot
0 0 0 setrgbcolor
0.00715 setlinewidth
0.45676 0.37257 Mdot
0 0 0 setrgbcolor
0.01044 setlinewidth
0.64447 0.40934 Mdot
0 0 0 setrgbcolor
0.01703 setlinewidth
0.45466 0.69628 Mdot
0 0 0 setrgbcolor
0.01319 setlinewidth
0.69435 0.55845 Mdot
0 0 0 setrgbcolor
0.01646 setlinewidth
0.54617 0.70568 Mdot
0 0 0 setrgbcolor
0.00549 setlinewidth
0.63141 0.66748 Mdot
0 0 0 setrgbcolor
0.00778 setlinewidth
0.53401 0.7058 Mdot
1 1 1 setrgbcolor
0.00604 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.00713 setlinewidth
0.6747 0.60847 Mdot
0 0 0 setrgbcolor
0.01856 setlinewidth
0.38529 0.6313 Mdot
0 0 0 setrgbcolor
0.00953 setlinewidth
0.52222 0.70265 Mdot
0 0 0 setrgbcolor
0.01831 setlinewidth
0.50386 0.3698 Mdot
0 0 0 setrgbcolor
0.00666 setlinewidth
0.63943 0.41805 Mdot
0 0 0 setrgbcolor
0.01653 setlinewidth
0.57927 0.68981 Mdot
0 0 0 setrgbcolor
0.00705 setlinewidth
0.61958 0.66777 Mdot
0 0 0 setrgbcolor
0.01859 setlinewidth
0.52022 0.69653 Mdot
0 0 0 setrgbcolor
0.01373 setlinewidth
0.52873 0.69513 Mdot
0 0 0 setrgbcolor
0.01991 setlinewidth
0.63506 0.42276 Mdot
0 0 0 setrgbcolor
0.01301 setlinewidth
0.53614 0.68984 Mdot
0 0 0 setrgbcolor
0.01458 setlinewidth
0.43689 0.66402 Mdot
0 0 0 setrgbcolor
0.01928 setlinewidth
0.45259 0.67317 Mdot
0 0 0 setrgbcolor
0.01193 setlinewidth
0.60104 0.40253 Mdot
0 0 0 setrgbcolor
0.00712 setlinewidth
0.61826 0.65615 Mdot
0 0 0 setrgbcolor
0.01998 setlinewidth
0.52125 0.68874 Mdot
0 0 0 setrgbcolor
0.00992 setlinewidth
0.49526 0.68592 Mdot
0 0 0 setrgbcolor
0.00604 setlinewidth
0.52939 0.68833 Mdot
0 0 0 setrgbcolor
0.01049 setlinewidth
0.52193 0.68762 Mdot
0 0 0 setrgbcolor
0.01335 setlinewidth
0.64344 0.44335 Mdot
0 0 0 setrgbcolor
0.01487 setlinewidth
0.62099 0.64802 Mdot
0 0 0 setrgbcolor
0.00955 setlinewidth
0.38604 0.58647 Mdot
0 0 0 setrgbcolor
0.01346 setlinewidth
0.57872 0.66878 Mdot
0 0 0 setrgbcolor
0.01801 setlinewidth
0.38417 0.57503 Mdot
0 0 0 setrgbcolor
0.01529 setlinewidth
0.49694 0.67687 Mdot
0 0 0 setrgbcolor
0.01888 setlinewidth
0.42613 0.64034 Mdot
0 0 0 setrgbcolor
0.01818 setlinewidth
0.55006 0.67484 Mdot
0 0 0 setrgbcolor
0.00896 setlinewidth
0.50271 0.67415 Mdot
0 0 0 setrgbcolor
0.01896 setlinewidth
0.42159 0.63179 Mdot
0 0 0 setrgbcolor
0.00793 setlinewidth
0.40305 0.46507 Mdot
0 0 0 setrgbcolor
0.01388 setlinewidth
0.54078 0.39793 Mdot
0 0 0 setrgbcolor
0.01818 setlinewidth
0.52085 0.39693 Mdot
0 0 0 setrgbcolor
0.01844 setlinewidth
0.3969 0.47911 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.56358 0.66411 Mdot
0 0 0 setrgbcolor
0.00621 setlinewidth
0.57919 0.65735 Mdot
0 0 0 setrgbcolor
0.01937 setlinewidth
0.54822 0.40356 Mdot
0 0 0 setrgbcolor
0.0107 setlinewidth
0.51868 0.66682 Mdot
0 0 0 setrgbcolor
0.00581 setlinewidth
0.60467 0.63776 Mdot
0 0 0 setrgbcolor
0.00946 setlinewidth
0.53731 0.6625 Mdot
0 0 0 setrgbcolor
0.00849 setlinewidth
0.57766 0.41981 Mdot
0 0 0 setrgbcolor
0.01576 setlinewidth
0.39999 0.54319 Mdot
0 0 0 setrgbcolor
0.00927 setlinewidth
0.55826 0.42149 Mdot
0 0 0 setrgbcolor
0.01072 setlinewidth
0.43852 0.61451 Mdot
0 0 0 setrgbcolor
0.01388 setlinewidth
0.54982 0.42506 Mdot
0 0 0 setrgbcolor
0.00603 setlinewidth
0.54516 0.64654 Mdot
0 0 0 setrgbcolor
0.017 setlinewidth
0.42876 0.47402 Mdot
0 0 0 setrgbcolor
0.01977 setlinewidth
0.61944 0.47993 Mdot
0 0 0 setrgbcolor
0.01309 setlinewidth
0.62369 0.48821 Mdot
0 0 0 setrgbcolor
0.00783 setlinewidth
0.41603 0.54224 Mdot
0 0 0 setrgbcolor
0.00825 setlinewidth
0.4386 0.59762 Mdot
0 0 0 setrgbcolor
0.00517 setlinewidth
0.52756 0.63973 Mdot
0 0 0 setrgbcolor
0.01494 setlinewidth
0.44613 0.60109 Mdot
0 0 0 setrgbcolor
0.00643 setlinewidth
0.58692 0.4569 Mdot
0 0 0 setrgbcolor
0.0105 setlinewidth
0.57963 0.60862 Mdot
0 0 0 setrgbcolor
0.01 setlinewidth
0.44831 0.58197 Mdot
0 0 0 setrgbcolor
0.01958 setlinewidth
0.48527 0.45694 Mdot
0 0 0 setrgbcolor
0.0103 setlinewidth
0.57713 0.59853 Mdot
0 0 0 setrgbcolor
0.01954 setlinewidth
0.48093 0.46516 Mdot
0 0 0 setrgbcolor
0.01108 setlinewidth
0.5676 0.47804 Mdot
0 0 0 setrgbcolor
0.00617 setlinewidth
0.54735 0.60253 Mdot
0 0 0 setrgbcolor
0.01848 setlinewidth
0.46961 0.49413 Mdot
0 0 0 setrgbcolor
0.00736 setlinewidth
0.56316 0.58898 Mdot
0 0 0 setrgbcolor
0.01903 setlinewidth
0.5879 0.52767 Mdot
0 0 0 setrgbcolor
0.01068 setlinewidth
0.4607 0.53103 Mdot
0 0 0 setrgbcolor
0.01876 setlinewidth
0.56734 0.5794 Mdot
0 0 0 setrgbcolor
0.01964 setlinewidth
0.53739 0.58079 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01499 setlinewidth
0.50109 0.51704 Mdot
0 0 0 setrgbcolor
0.00623 setlinewidth
0.47423 0.55191 Mdot
0 0 0 setrgbcolor
0.00526 setlinewidth
0.48728 0.57808 Mdot
0 0 0 setrgbcolor
0.01902 setlinewidth
0.53162 0.47874 Mdot
0 0 0 setrgbcolor
0.01205 setlinewidth
0.50627 0.47968 Mdot
0 0 0 setrgbcolor
0.01984 setlinewidth
0.45343 0.52815 Mdot
0 0 0 setrgbcolor
0.01551 setlinewidth
0.59443 0.55205 Mdot
0 0 0 setrgbcolor
0.0134 setlinewidth
0.53598 0.46207 Mdot
0 0 0 setrgbcolor
0.01486 setlinewidth
0.59646 0.549 Mdot
0 0 0 setrgbcolor
0.01247 setlinewidth
0.53541 0.61826 Mdot
0 0 0 setrgbcolor
0.01702 setlinewidth
0.57223 0.46277 Mdot
0 0 0 setrgbcolor
0.01278 setlinewidth
0.49831 0.45112 Mdot
0 0 0 setrgbcolor
0.01779 setlinewidth
0.5849 0.59822 Mdot
0 0 0 setrgbcolor
0.0082 setlinewidth
0.42617 0.55078 Mdot
0 0 0 setrgbcolor
0.01581 setlinewidth
0.58417 0.45728 Mdot
0 0 0 setrgbcolor
0.00817 setlinewidth
0.5523 0.43767 Mdot
0 0 0 setrgbcolor
0.01483 setlinewidth
0.56237 0.44073 Mdot
0 0 0 setrgbcolor
0.01557 setlinewidth
0.41831 0.53453 Mdot
0 0 0 setrgbcolor
0.00942 setlinewidth
0.5323 0.6407 Mdot
0 0 0 setrgbcolor
0.00914 setlinewidth
0.62776 0.55168 Mdot
0 0 0 setrgbcolor
0.01072 setlinewidth
0.43073 0.47971 Mdot
0 0 0 setrgbcolor
0.01544 setlinewidth
0.4535 0.45187 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.4647 0.43942 Mdot
0 0 0 setrgbcolor
0.01211 setlinewidth
0.5858 0.44055 Mdot
0 0 0 setrgbcolor
0.0064 setlinewidth
0.54933 0.42458 Mdot
0 0 0 setrgbcolor
0.01316 setlinewidth
0.62087 0.59641 Mdot
0 0 0 setrgbcolor
0.00951 setlinewidth
0.60323 0.61902 Mdot
0 0 0 setrgbcolor
0.01576 setlinewidth
0.43704 0.45393 Mdot
0 0 0 setrgbcolor
0.01476 setlinewidth
0.49498 0.42022 Mdot
0 0 0 setrgbcolor
0.01968 setlinewidth
0.57071 0.42632 Mdot
0 0 0 setrgbcolor
0.01058 setlinewidth
0.41587 0.47831 Mdot
0 0 0 setrgbcolor
0.00512 setlinewidth
0.59016 0.43356 Mdot
0 0 0 setrgbcolor
0.00998 setlinewidth
0.40263 0.5075 Mdot
0 0 0 setrgbcolor
0.00883 setlinewidth
0.59936 0.43181 Mdot
0 0 0 setrgbcolor
0.01668 setlinewidth
0.5926 0.42524 Mdot
0 0 0 setrgbcolor
0.01261 setlinewidth
0.59287 0.42495 Mdot
0 0 0 setrgbcolor
0.01864 setlinewidth
0.61618 0.44358 Mdot
0 0 0 setrgbcolor
0.01239 setlinewidth
0.59909 0.64426 Mdot
0 0 0 setrgbcolor
0.01809 setlinewidth
0.6314 0.45506 Mdot
0 0 0 setrgbcolor
0.00662 setlinewidth
0.51324 0.40008 Mdot
0 0 0 setrgbcolor
0.0117 setlinewidth
0.51965 0.3992 Mdot
0 0 0 setrgbcolor
0.01365 setlinewidth
0.53564 0.39959 Mdot
0 0 0 setrgbcolor
0.00584 setlinewidth
0.51071 0.3986 Mdot
0 0 0 setrgbcolor
0.0107 setlinewidth
0.58934 0.41491 Mdot
0 0 0 setrgbcolor
0.01471 setlinewidth
0.52745 0.39503 Mdot
0 0 0 setrgbcolor
0.01243 setlinewidth
0.51731 0.39426 Mdot
0 0 0 setrgbcolor
0.0157 setlinewidth
0.57468 0.66806 Mdot
0 0 0 setrgbcolor
0.01215 setlinewidth
0.52897 0.39296 Mdot
0 0 0 setrgbcolor
0.01812 setlinewidth
0.53515 0.39319 Mdot
0 0 0 setrgbcolor
0.01651 setlinewidth
0.52171 0.39206 Mdot
0 0 0 setrgbcolor
0.01415 setlinewidth
0.51612 0.39189 Mdot
0 0 0 setrgbcolor
0.00726 setlinewidth
0.40371 0.45487 Mdot
0 0 0 setrgbcolor
0.01241 setlinewidth
0.521 0.39045 Mdot
0 0 0 setrgbcolor
0.00985 setlinewidth
0.48764 0.39342 Mdot
0 0 0 setrgbcolor
0.01963 setlinewidth
0.50328 0.39026 Mdot
0 0 0 setrgbcolor
0.01791 setlinewidth
0.3774 0.55028 Mdot
0 0 0 setrgbcolor
0.01575 setlinewidth
0.53753 0.38914 Mdot
0 0 0 setrgbcolor
0.01071 setlinewidth
0.49178 0.38991 Mdot
0 0 0 setrgbcolor
0.00881 setlinewidth
0.39673 0.61629 Mdot
0 0 0 setrgbcolor
0.01745 setlinewidth
0.52694 0.38511 Mdot
0 0 0 setrgbcolor
0.01814 setlinewidth
0.61521 0.65575 Mdot
0 0 0 setrgbcolor
0.01158 setlinewidth
0.49129 0.68413 Mdot
0 0 0 setrgbcolor
0.00727 setlinewidth
0.3699 0.53675 Mdot
0 0 0 setrgbcolor
0.01677 setlinewidth
0.37286 0.50491 Mdot
0 0 0 setrgbcolor
0.01928 setlinewidth
0.44155 0.6664 Mdot
0 0 0 setrgbcolor
0.0128 setlinewidth
0.53219 0.3792 Mdot
0 0 0 setrgbcolor
0.00677 setlinewidth
0.50928 0.37944 Mdot
0 0 0 setrgbcolor
0.00774 setlinewidth
0.45363 0.39411 Mdot
0 0 0 setrgbcolor
0.0119 setlinewidth
0.36477 0.53372 Mdot
0 0 0 setrgbcolor
0.01112 setlinewidth
0.48561 0.6908 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.36855 0.5776 Mdot
0 0 0 setrgbcolor
0.01037 setlinewidth
0.55849 0.3788 Mdot
0 0 0 setrgbcolor
0.01023 setlinewidth
0.3597 0.5315 Mdot
0 0 0 setrgbcolor
0.01482 setlinewidth
0.49712 0.37302 Mdot
1 1 1 setrgbcolor
0.01247 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01244 setlinewidth
0.37526 0.45812 Mdot
0 0 0 setrgbcolor
0.01362 setlinewidth
0.41622 0.66466 Mdot
0 0 0 setrgbcolor
0.00596 setlinewidth
0.67927 0.4714 Mdot
0 0 0 setrgbcolor
0.012 setlinewidth
0.51029 0.36588 Mdot
0 0 0 setrgbcolor
0.01826 setlinewidth
0.56997 0.37126 Mdot
0 0 0 setrgbcolor
0.01696 setlinewidth
0.54002 0.36489 Mdot
0 0 0 setrgbcolor
0.0144 setlinewidth
0.51345 0.36338 Mdot
0 0 0 setrgbcolor
0.01645 setlinewidth
0.41454 0.39763 Mdot
0 0 0 setrgbcolor
0.00618 setlinewidth
0.35486 0.58714 Mdot
0 0 0 setrgbcolor
0.01807 setlinewidth
0.54166 0.36009 Mdot
0 0 0 setrgbcolor
0.01399 setlinewidth
0.56939 0.3647 Mdot
0 0 0 setrgbcolor
0.01142 setlinewidth
0.35403 0.5918 Mdot
0 0 0 setrgbcolor
0.01617 setlinewidth
0.47102 0.70654 Mdot
0 0 0 setrgbcolor
0.01458 setlinewidth
0.64984 0.40783 Mdot
0 0 0 setrgbcolor
0.00524 setlinewidth
0.35124 0.59162 Mdot
0 0 0 setrgbcolor
0.00881 setlinewidth
0.64829 0.40225 Mdot
0 0 0 setrgbcolor
0.00916 setlinewidth
0.52936 0.35251 Mdot
0 0 0 setrgbcolor
0.00868 setlinewidth
0.59566 0.70344 Mdot
0 0 0 setrgbcolor
0.01298 setlinewidth
0.35945 0.45164 Mdot
0 0 0 setrgbcolor
0.01493 setlinewidth
0.39347 0.40421 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.39587 0.40182 Mdot
0 0 0 setrgbcolor
0.00556 setlinewidth
0.54544 0.35196 Mdot
0 0 0 setrgbcolor
0.01122 setlinewidth
0.57309 0.3565 Mdot
0 0 0 setrgbcolor
0.00702 setlinewidth
0.63332 0.68522 Mdot
0 0 0 setrgbcolor
0.01695 setlinewidth
0.66065 0.40932 Mdot
0 0 0 setrgbcolor
0.01227 setlinewidth
0.6729 0.64777 Mdot
0 0 0 setrgbcolor
0.01746 setlinewidth
0.33598 0.54538 Mdot
0 0 0 setrgbcolor
0.01492 setlinewidth
0.6314 0.38238 Mdot
0 0 0 setrgbcolor
0.01758 setlinewidth
0.57992 0.35664 Mdot
0 0 0 setrgbcolor
0.01216 setlinewidth
0.50439 0.72252 Mdot
0 0 0 setrgbcolor
0.01297 setlinewidth
0.35041 0.61016 Mdot
0 0 0 setrgbcolor
0.01526 setlinewidth
0.70764 0.57266 Mdot
0 0 0 setrgbcolor
0.01351 setlinewidth
0.71146 0.53971 Mdot
0 0 0 setrgbcolor
0.00552 setlinewidth
0.57706 0.3547 Mdot
0 0 0 setrgbcolor
0.00705 setlinewidth
0.70238 0.59436 Mdot
0 0 0 setrgbcolor
0.01064 setlinewidth
0.64146 0.68248 Mdot
0 0 0 setrgbcolor
0.00641 setlinewidth
0.6128 0.36911 Mdot
0 0 0 setrgbcolor
0.01944 setlinewidth
0.54166 0.72335 Mdot
0 0 0 setrgbcolor
0.01052 setlinewidth
0.58313 0.71447 Mdot
0 0 0 setrgbcolor
0.01961 setlinewidth
0.58314 0.35626 Mdot
0 0 0 setrgbcolor
0.00831 setlinewidth
0.68447 0.63348 Mdot
0 0 0 setrgbcolor
0.01363 setlinewidth
0.58601 0.71343 Mdot
0 0 0 setrgbcolor
0.00899 setlinewidth
0.49242 0.34904 Mdot
0 0 0 setrgbcolor
0.00698 setlinewidth
0.71035 0.55866 Mdot
0 0 0 setrgbcolor
0.01046 setlinewidth
0.66652 0.65779 Mdot
0 0 0 setrgbcolor
0.00767 setlinewidth
0.66857 0.65496 Mdot
0 0 0 setrgbcolor
0.01924 setlinewidth
0.60199 0.70628 Mdot
0 0 0 setrgbcolor
0.01823 setlinewidth
0.70626 0.57773 Mdot
0 0 0 setrgbcolor
0.01119 setlinewidth
0.43532 0.36921 Mdot
0 0 0 setrgbcolor
0.01437 setlinewidth
0.41998 0.37849 Mdot
0 0 0 setrgbcolor
0.00805 setlinewidth
0.6728 0.64837 Mdot
0 0 0 setrgbcolor
0.00677 setlinewidth
0.50036 0.72113 Mdot
0 0 0 setrgbcolor
0.01086 setlinewidth
0.46624 0.713 Mdot
0 0 0 setrgbcolor
0.01961 setlinewidth
0.7094 0.53546 Mdot
0 0 0 setrgbcolor
0.0099 setlinewidth
0.38244 0.6559 Mdot
0 0 0 setrgbcolor
0.01565 setlinewidth
0.59242 0.36501 Mdot
0 0 0 setrgbcolor
0.01276 setlinewidth
0.69178 0.60647 Mdot
1 1 1 setrgbcolor
0.01247 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.00626 setlinewidth
0.55836 0.71062 Mdot
0 0 0 setrgbcolor
0.01291 setlinewidth
0.46062 0.36802 Mdot
0 0 0 setrgbcolor
0.00989 setlinewidth
0.5452 0.71246 Mdot
0 0 0 setrgbcolor
0.00577 setlinewidth
0.61625 0.38485 Mdot
0 0 0 setrgbcolor
0.01969 setlinewidth
0.53062 0.71094 Mdot
0 0 0 setrgbcolor
0.01416 setlinewidth
0.4331 0.68294 Mdot
0 0 0 setrgbcolor
0.0197 setlinewidth
0.36799 0.61045 Mdot
0 0 0 setrgbcolor
0.01453 setlinewidth
0.36391 0.59902 Mdot
0 0 0 setrgbcolor
0.01734 setlinewidth
0.45021 0.69025 Mdot
0 0 0 setrgbcolor
0.01926 setlinewidth
0.63994 0.65873 Mdot
0 0 0 setrgbcolor
0.01039 setlinewidth
0.52475 0.70509 Mdot
0 0 0 setrgbcolor
0.01102 setlinewidth
0.53266 0.70251 Mdot
0 0 0 setrgbcolor
0.01746 setlinewidth
0.6902 0.53405 Mdot
0 0 0 setrgbcolor
0.01327 setlinewidth
0.36458 0.48341 Mdot
0 0 0 setrgbcolor
0.00836 setlinewidth
0.36037 0.4988 Mdot
0 0 0 setrgbcolor
0.00945 setlinewidth
0.58573 0.68984 Mdot
0 0 0 setrgbcolor
0.01148 setlinewidth
0.41501 0.6603 Mdot
0 0 0 setrgbcolor
0.01881 setlinewidth
0.49465 0.6977 Mdot
0 0 0 setrgbcolor
0.01754 setlinewidth
0.40841 0.65217 Mdot
0 0 0 setrgbcolor
0.01719 setlinewidth
0.60613 0.39526 Mdot
0 0 0 setrgbcolor
0.01612 setlinewidth
0.52161 0.69708 Mdot
0 0 0 setrgbcolor
0.00717 setlinewidth
0.53757 0.69614 Mdot
0 0 0 setrgbcolor
0.01451 setlinewidth
0.62384 0.66105 Mdot
0 0 0 setrgbcolor
0.01588 setlinewidth
0.67451 0.59023 Mdot
0 0 0 setrgbcolor
0.00776 setlinewidth
0.52176 0.69586 Mdot
0 0 0 setrgbcolor
0.01247 setlinewidth
0.52976 0.69555 Mdot
0 0 0 setrgbcolor
0.01983 setlinewidth
0.49212 0.68831 Mdot
0 0 0 setrgbcolor
0.00716 setlinewidth
0.36977 0.56438 Mdot
0 0 0 setrgbcolor
0.01471 setlinewidth
0.59949 0.40114 Mdot
0 0 0 setrgbcolor
0.00939 setlinewidth
0.55937 0.38583 Mdot
0 0 0 setrgbcolor
0.00801 setlinewidth
0.49657 0.68477 Mdot
0 0 0 setrgbcolor
0.00921 setlinewidth
0.47197 0.3939 Mdot
0 0 0 setrgbcolor
0.01047 setlinewidth
0.61662 0.64933 Mdot
0 0 0 setrgbcolor
0.01478 setlinewidth
0.49238 0.39156 Mdot
0 0 0 setrgbcolor
0.0094 setlinewidth
0.54548 0.67889 Mdot
0 0 0 setrgbcolor
0.01372 setlinewidth
0.3859 0.48896 Mdot
0 0 0 setrgbcolor
0.00575 setlinewidth
0.4175 0.63237 Mdot
0 0 0 setrgbcolor
0.00832 setlinewidth
0.57471 0.66846 Mdot
0 0 0 setrgbcolor
0.01152 setlinewidth
0.38271 0.56122 Mdot
0 0 0 setrgbcolor
0.0149 setlinewidth
0.60877 0.42154 Mdot
0 0 0 setrgbcolor
0.00954 setlinewidth
0.49973 0.39625 Mdot
0 0 0 setrgbcolor
0.01342 setlinewidth
0.61668 0.64051 Mdot
0 0 0 setrgbcolor
0.00838 setlinewidth
0.50955 0.6751 Mdot
0 0 0 setrgbcolor
0.01402 setlinewidth
0.41323 0.61505 Mdot
0 0 0 setrgbcolor
0.00681 setlinewidth
0.55588 0.66591 Mdot
0 0 0 setrgbcolor
0.01146 setlinewidth
0.5271 0.66806 Mdot
0 0 0 setrgbcolor
0.01889 setlinewidth
0.42074 0.6176 Mdot
0 0 0 setrgbcolor
0.01281 setlinewidth
0.57074 0.65663 Mdot
0 0 0 setrgbcolor
0.00749 setlinewidth
0.53089 0.40832 Mdot
0 0 0 setrgbcolor
0.01765 setlinewidth
0.50958 0.41344 Mdot
0 0 0 setrgbcolor
0.01802 setlinewidth
0.41831 0.59765 Mdot
0 0 0 setrgbcolor
0.01696 setlinewidth
0.59327 0.63247 Mdot
0 0 0 setrgbcolor
0.0197 setlinewidth
0.5005 0.41864 Mdot
0 0 0 setrgbcolor
0.01563 setlinewidth
0.52988 0.6505 Mdot
0 0 0 setrgbcolor
0.00931 setlinewidth
0.43624 0.46259 Mdot
0 0 0 setrgbcolor
0.01967 setlinewidth
0.50941 0.64602 Mdot
0 0 0 setrgbcolor
0.01924 setlinewidth
0.43255 0.47183 Mdot
0 0 0 setrgbcolor
0.01352 setlinewidth
0.42421 0.50371 Mdot
0 0 0 setrgbcolor
0.01206 setlinewidth
0.42048 0.5433 Mdot
0 0 0 setrgbcolor
0.01696 setlinewidth
0.54145 0.44589 Mdot
0 0 0 setrgbcolor
0.01637 setlinewidth
0.58014 0.46461 Mdot
0 0 0 setrgbcolor
0.01824 setlinewidth
0.58583 0.47262 Mdot
0 0 0 setrgbcolor
0.00952 setlinewidth
0.55632 0.60606 Mdot
0 0 0 setrgbcolor
0.01067 setlinewidth
0.51994 0.60463 Mdot
0 0 0 setrgbcolor
0.0085 setlinewidth
0.55106 0.59594 Mdot
0 0 0 setrgbcolor
0.01651 setlinewidth
0.52154 0.47138 Mdot
0 0 0 setrgbcolor
0.00934 setlinewidth
0.53365 0.58815 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.50464 0.58354 Mdot
0 0 0 setrgbcolor
0.00799 setlinewidth
0.53608 0.57752 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.54943 0.52016 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01397 setlinewidth
0.5334 0.51716 Mdot
0 0 0 setrgbcolor
0.01933 setlinewidth
0.51052 0.55732 Mdot
0 0 0 setrgbcolor
0.01639 setlinewidth
0.48466 0.53609 Mdot
0 0 0 setrgbcolor
0.01909 setlinewidth
0.52743 0.58241 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.53147 0.47784 Mdot
0 0 0 setrgbcolor
0.00918 setlinewidth
0.45787 0.56367 Mdot
0 0 0 setrgbcolor
0.01889 setlinewidth
0.55715 0.47283 Mdot
0 0 0 setrgbcolor
0.00571 setlinewidth
0.4467 0.54824 Mdot
0 0 0 setrgbcolor
0.0071 setlinewidth
0.45036 0.49014 Mdot
0 0 0 setrgbcolor
0.01126 setlinewidth
0.51644 0.4498 Mdot
0 0 0 setrgbcolor
0.01466 setlinewidth
0.5577 0.45495 Mdot
0 0 0 setrgbcolor
0.01747 setlinewidth
0.46879 0.45797 Mdot
0 0 0 setrgbcolor
0.00734 setlinewidth
0.58022 0.61717 Mdot
0 0 0 setrgbcolor
0.01119 setlinewidth
0.42403 0.52315 Mdot
0 0 0 setrgbcolor
0.01965 setlinewidth
0.43318 0.49118 Mdot
0 0 0 setrgbcolor
0.01918 setlinewidth
0.4511 0.46281 Mdot
0 0 0 setrgbcolor
0.01888 setlinewidth
0.47758 0.44339 Mdot
0 0 0 setrgbcolor
0.01566 setlinewidth
0.63171 0.53932 Mdot
0 0 0 setrgbcolor
0.00956 setlinewidth
0.63322 0.53583 Mdot
0 0 0 setrgbcolor
0.00594 setlinewidth
0.59358 0.44988 Mdot
0 0 0 setrgbcolor
0.01628 setlinewidth
0.56754 0.42718 Mdot
0 0 0 setrgbcolor
0.0195 setlinewidth
0.62755 0.58908 Mdot
0 0 0 setrgbcolor
0.01532 setlinewidth
0.50414 0.41874 Mdot
0 0 0 setrgbcolor
0.00604 setlinewidth
0.57782 0.64116 Mdot
0 0 0 setrgbcolor
0.01131 setlinewidth
0.57825 0.4287 Mdot
0 0 0 setrgbcolor
0.01695 setlinewidth
0.60364 0.4423 Mdot
0 0 0 setrgbcolor
0.00777 setlinewidth
0.56076 0.4142 Mdot
0 0 0 setrgbcolor
0.01551 setlinewidth
0.40057 0.57104 Mdot
0 0 0 setrgbcolor
0.01431 setlinewidth
0.41289 0.46943 Mdot
0 0 0 setrgbcolor
0.0052 setlinewidth
0.60064 0.42475 Mdot
0 0 0 setrgbcolor
0.00557 setlinewidth
0.38931 0.55848 Mdot
0 0 0 setrgbcolor
0.01349 setlinewidth
0.38742 0.52553 Mdot
0 0 0 setrgbcolor
0.01228 setlinewidth
0.58206 0.4125 Mdot
0 0 0 setrgbcolor
0.00736 setlinewidth
0.4287 0.63588 Mdot
0 0 0 setrgbcolor
0.00996 setlinewidth
0.66253 0.53407 Mdot
0 0 0 setrgbcolor
0.01845 setlinewidth
0.51625 0.39512 Mdot
0 0 0 setrgbcolor
0.00824 setlinewidth
0.5131 0.39404 Mdot
0 0 0 setrgbcolor
0.01836 setlinewidth
0.52249 0.39314 Mdot
0 0 0 setrgbcolor
0.01573 setlinewidth
0.38223 0.55626 Mdot
0 0 0 setrgbcolor
0.01475 setlinewidth
0.60268 0.41683 Mdot
0 0 0 setrgbcolor
0.019 setlinewidth
0.646 0.60841 Mdot
0 0 0 setrgbcolor
0.00846 setlinewidth
0.53876 0.39086 Mdot
0 0 0 setrgbcolor
0.01459 setlinewidth
0.66091 0.58211 Mdot
0 0 0 setrgbcolor
0.0188 setlinewidth
0.39191 0.60055 Mdot
0 0 0 setrgbcolor
0.01341 setlinewidth
0.51822 0.3885 Mdot
0 0 0 setrgbcolor
0.00763 setlinewidth
0.48687 0.3927 Mdot
0 0 0 setrgbcolor
0.01789 setlinewidth
0.52883 0.38758 Mdot
0 0 0 setrgbcolor
0.00569 setlinewidth
0.37517 0.55488 Mdot
0 0 0 setrgbcolor
0.01587 setlinewidth
0.51608 0.38629 Mdot
0 0 0 setrgbcolor
0.01553 setlinewidth
0.52184 0.38551 Mdot
0 0 0 setrgbcolor
0.01821 setlinewidth
0.61064 0.41355 Mdot
0 0 0 setrgbcolor
0.01034 setlinewidth
0.50213 0.38681 Mdot
0 0 0 setrgbcolor
0.0197 setlinewidth
0.60233 0.40786 Mdot
0 0 0 setrgbcolor
0.0157 setlinewidth
0.52955 0.38521 Mdot
0 0 0 setrgbcolor
0.01136 setlinewidth
0.60248 0.40751 Mdot
0 0 0 setrgbcolor
0.01714 setlinewidth
0.48985 0.38842 Mdot
0 0 0 setrgbcolor
0.01775 setlinewidth
0.52048 0.38399 Mdot
0 0 0 setrgbcolor
0.00712 setlinewidth
0.53583 0.3844 Mdot
0 0 0 setrgbcolor
0.01149 setlinewidth
0.47982 0.68126 Mdot
0 0 0 setrgbcolor
0.00995 setlinewidth
0.44969 0.39928 Mdot
0 0 0 setrgbcolor
0.01423 setlinewidth
0.62944 0.42306 Mdot
0 0 0 setrgbcolor
0.01211 setlinewidth
0.59584 0.39773 Mdot
0 0 0 setrgbcolor
0.01668 setlinewidth
0.37824 0.47771 Mdot
0 0 0 setrgbcolor
0.01219 setlinewidth
0.64251 0.63569 Mdot
0 0 0 setrgbcolor
0.01979 setlinewidth
0.53656 0.37987 Mdot
0 0 0 setrgbcolor
0.01046 setlinewidth
0.53337 0.69272 Mdot
0 0 0 setrgbcolor
0.01299 setlinewidth
0.52428 0.37755 Mdot
0 0 0 setrgbcolor
0.01378 setlinewidth
0.64618 0.43261 Mdot
0 0 0 setrgbcolor
0.01835 setlinewidth
0.61881 0.66423 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.50369 0.3748 Mdot
0 0 0 setrgbcolor
0.01422 setlinewidth
0.52691 0.37065 Mdot
0 0 0 setrgbcolor
0.01973 setlinewidth
0.44958 0.68332 Mdot
0 0 0 setrgbcolor
0.01696 setlinewidth
0.52624 0.70062 Mdot
0 0 0 setrgbcolor
0.01928 setlinewidth
0.37327 0.61278 Mdot
0 0 0 setrgbcolor
0.01551 setlinewidth
0.48777 0.3704 Mdot
0 0 0 setrgbcolor
0.01616 setlinewidth
0.55232 0.36582 Mdot
0 0 0 setrgbcolor
0.00504 setlinewidth
0.37191 0.61775 Mdot
0 0 0 setrgbcolor
0.01057 setlinewidth
0.40412 0.40982 Mdot
0 0 0 setrgbcolor
0.01385 setlinewidth
0.65651 0.64579 Mdot
0 0 0 setrgbcolor
0.0083 setlinewidth
0.36748 0.61809 Mdot
1 1 1 setrgbcolor
0.01801 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01903 setlinewidth
0.49775 0.36093 Mdot
0 0 0 setrgbcolor
0.00988 setlinewidth
0.49954 0.35786 Mdot
0 0 0 setrgbcolor
0.00849 setlinewidth
0.52716 0.35483 Mdot
0 0 0 setrgbcolor
0.01182 setlinewidth
0.35231 0.47425 Mdot
0 0 0 setrgbcolor
0.00863 setlinewidth
0.55899 0.35625 Mdot
0 0 0 setrgbcolor
0.01526 setlinewidth
0.37816 0.42041 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.50549 0.7196 Mdot
0 0 0 setrgbcolor
0.01141 setlinewidth
0.38012 0.41758 Mdot
0 0 0 setrgbcolor
0.01849 setlinewidth
0.52564 0.34971 Mdot
0 0 0 setrgbcolor
0.01696 setlinewidth
0.3392 0.57364 Mdot
0 0 0 setrgbcolor
0.0089 setlinewidth
0.55432 0.34972 Mdot
0 0 0 setrgbcolor
0.00959 setlinewidth
0.68876 0.44252 Mdot
0 0 0 setrgbcolor
0.01591 setlinewidth
0.36146 0.63779 Mdot
0 0 0 setrgbcolor
0.0107 setlinewidth
0.50758 0.34426 Mdot
0 0 0 setrgbcolor
0.01613 setlinewidth
0.52223 0.341 Mdot
0 0 0 setrgbcolor
0.01871 setlinewidth
0.64231 0.38101 Mdot
0 0 0 setrgbcolor
0.01224 setlinewidth
0.62969 0.69974 Mdot
0 0 0 setrgbcolor
0.00579 setlinewidth
0.55014 0.34096 Mdot
0 0 0 setrgbcolor
0.00757 setlinewidth
0.6377 0.37555 Mdot
0 0 0 setrgbcolor
0.01342 setlinewidth
0.53274 0.73252 Mdot
0 0 0 setrgbcolor
0.01669 setlinewidth
0.55468 0.34006 Mdot
0 0 0 setrgbcolor
0.00946 setlinewidth
0.66316 0.67561 Mdot
0 0 0 setrgbcolor
0.01418 setlinewidth
0.61191 0.35796 Mdot
0 0 0 setrgbcolor
0.01379 setlinewidth
0.54913 0.33868 Mdot
0 0 0 setrgbcolor
0.01649 setlinewidth
0.64785 0.3811 Mdot
0 0 0 setrgbcolor
0.01037 setlinewidth
0.45855 0.34774 Mdot
0 0 0 setrgbcolor
0.00828 setlinewidth
0.38743 0.39054 Mdot
0 0 0 setrgbcolor
0.00916 setlinewidth
0.40162 0.37843 Mdot
0 0 0 setrgbcolor
0.01631 setlinewidth
0.5674 0.72873 Mdot
0 0 0 setrgbcolor
0.01642 setlinewidth
0.69708 0.63057 Mdot
0 0 0 setrgbcolor
0.0185 setlinewidth
0.38871 0.68111 Mdot
0 0 0 setrgbcolor
0.01261 setlinewidth
0.55247 0.33943 Mdot
0 0 0 setrgbcolor
0.01163 setlinewidth
0.58615 0.34759 Mdot
0 0 0 setrgbcolor
0.01806 setlinewidth
0.60831 0.71389 Mdot
0 0 0 setrgbcolor
0.01074 setlinewidth
0.61055 0.71246 Mdot
0 0 0 setrgbcolor
0.01512 setlinewidth
0.48263 0.72858 Mdot
0 0 0 setrgbcolor
0.01221 setlinewidth
0.66552 0.67205 Mdot
0 0 0 setrgbcolor
0.01558 setlinewidth
0.71996 0.54601 Mdot
0 0 0 setrgbcolor
0.01266 setlinewidth
0.51935 0.73241 Mdot
0 0 0 setrgbcolor
0.01229 setlinewidth
0.7184 0.51053 Mdot
0 0 0 setrgbcolor
0.00982 setlinewidth
0.71624 0.56993 Mdot
0 0 0 setrgbcolor
0.01095 setlinewidth
0.62356 0.70298 Mdot
0 0 0 setrgbcolor
0.0105 setlinewidth
0.70093 0.61426 Mdot
0 0 0 setrgbcolor
0.0082 setlinewidth
0.68437 0.64272 Mdot
0 0 0 setrgbcolor
0.00913 setlinewidth
0.41784 0.37349 Mdot
0 0 0 setrgbcolor
0.00608 setlinewidth
0.35913 0.63719 Mdot
0 0 0 setrgbcolor
0.01158 setlinewidth
0.35299 0.6261 Mdot
0 0 0 setrgbcolor
0.01068 setlinewidth
0.68531 0.63949 Mdot
0 0 0 setrgbcolor
0.01451 setlinewidth
0.71543 0.53114 Mdot
0 0 0 setrgbcolor
0.01318 setlinewidth
0.33252 0.52421 Mdot
0 0 0 setrgbcolor
0.00795 setlinewidth
0.33436 0.50783 Mdot
0 0 0 setrgbcolor
0.01381 setlinewidth
0.55485 0.34746 Mdot
0 0 0 setrgbcolor
0.01295 setlinewidth
0.68709 0.63204 Mdot
1 1 1 setrgbcolor
0.01801 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.00544 setlinewidth
0.71211 0.55214 Mdot
0 0 0 setrgbcolor
0.01004 setlinewidth
0.43502 0.70276 Mdot
0 0 0 setrgbcolor
0.01552 setlinewidth
0.45252 0.70808 Mdot
0 0 0 setrgbcolor
0.01722 setlinewidth
0.55616 0.71804 Mdot
0 0 0 setrgbcolor
0.01958 setlinewidth
0.41027 0.68213 Mdot
0 0 0 setrgbcolor
0.01153 setlinewidth
0.70602 0.50705 Mdot
0 0 0 setrgbcolor
0.01217 setlinewidth
0.56958 0.71432 Mdot
0 0 0 setrgbcolor
0.00568 setlinewidth
0.40191 0.67471 Mdot
0 0 0 setrgbcolor
0.01539 setlinewidth
0.53943 0.71855 Mdot
0 0 0 setrgbcolor
0.01118 setlinewidth
0.34787 0.59021 Mdot
0 0 0 setrgbcolor
0.01242 setlinewidth
0.57765 0.36436 Mdot
0 0 0 setrgbcolor
0.01725 setlinewidth
0.69538 0.58528 Mdot
0 0 0 setrgbcolor
0.01036 setlinewidth
0.52965 0.71349 Mdot
0 0 0 setrgbcolor
0.01188 setlinewidth
0.49591 0.71004 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.34933 0.51072 Mdot
0 0 0 setrgbcolor
0.00555 setlinewidth
0.53638 0.70981 Mdot
0 0 0 setrgbcolor
0.01721 setlinewidth
0.35653 0.58536 Mdot
0 0 0 setrgbcolor
0.015 setlinewidth
0.52212 0.70583 Mdot
0 0 0 setrgbcolor
0.01598 setlinewidth
0.42201 0.39898 Mdot
0 0 0 setrgbcolor
0.0102 setlinewidth
0.40193 0.65355 Mdot
0 0 0 setrgbcolor
0.00574 setlinewidth
0.52165 0.70457 Mdot
0 0 0 setrgbcolor
0.01847 setlinewidth
0.48892 0.70087 Mdot
0 0 0 setrgbcolor
0.00622 setlinewidth
0.53817 0.70268 Mdot
0 0 0 setrgbcolor
0.01801 setlinewidth
0.52971 0.70316 Mdot
0 0 0 setrgbcolor
0.01633 setlinewidth
0.58869 0.68929 Mdot
0 0 0 setrgbcolor
0.00793 setlinewidth
0.39329 0.63644 Mdot
0 0 0 setrgbcolor
0.00852 setlinewidth
0.49161 0.69669 Mdot
0 0 0 setrgbcolor
0.01512 setlinewidth
0.44125 0.3932 Mdot
0 0 0 setrgbcolor
0.01069 setlinewidth
0.64153 0.64879 Mdot
0 0 0 setrgbcolor
0.01683 setlinewidth
0.56253 0.37741 Mdot
0 0 0 setrgbcolor
0.01954 setlinewidth
0.40022 0.63808 Mdot
0 0 0 setrgbcolor
0.01232 setlinewidth
0.51016 0.37577 Mdot
0 0 0 setrgbcolor
0.01652 setlinewidth
0.44788 0.39691 Mdot
0 0 0 setrgbcolor
0.01288 setlinewidth
0.39299 0.618 Mdot
0 0 0 setrgbcolor
0.00605 setlinewidth
0.62167 0.65382 Mdot
0 0 0 setrgbcolor
0.00531 setlinewidth
0.55383 0.38488 Mdot
0 0 0 setrgbcolor
0.00885 setlinewidth
0.67347 0.50951 Mdot
0 0 0 setrgbcolor
0.00504 setlinewidth
0.50038 0.68509 Mdot
0 0 0 setrgbcolor
0.01485 setlinewidth
0.53882 0.68397 Mdot
0 0 0 setrgbcolor
0.01192 setlinewidth
0.38896 0.47619 Mdot
0 0 0 setrgbcolor
0.01863 setlinewidth
0.38627 0.48633 Mdot
0 0 0 setrgbcolor
0.01999 setlinewidth
0.66357 0.57157 Mdot
0 0 0 setrgbcolor
0.01054 setlinewidth
0.38181 0.52054 Mdot
0 0 0 setrgbcolor
0.01079 setlinewidth
0.38396 0.5619 Mdot
0 0 0 setrgbcolor
0.0076 setlinewidth
0.56663 0.66903 Mdot
0 0 0 setrgbcolor
0.01643 setlinewidth
0.51548 0.67546 Mdot
0 0 0 setrgbcolor
0.01066 setlinewidth
0.45664 0.41334 Mdot
0 0 0 setrgbcolor
0.01813 setlinewidth
0.47829 0.4044 Mdot
0 0 0 setrgbcolor
0.01637 setlinewidth
0.4476 0.42029 Mdot
0 0 0 setrgbcolor
0.00605 setlinewidth
0.60821 0.64286 Mdot
0 0 0 setrgbcolor
0.0187 setlinewidth
0.56332 0.40488 Mdot
0 0 0 setrgbcolor
0.00683 setlinewidth
0.54499 0.66916 Mdot
0 0 0 setrgbcolor
0.00918 setlinewidth
0.60523 0.6337 Mdot
0 0 0 setrgbcolor
0.00812 setlinewidth
0.55794 0.65742 Mdot
0 0 0 setrgbcolor
0.01039 setlinewidth
0.49026 0.65528 Mdot
0 0 0 setrgbcolor
0.01854 setlinewidth
0.51239 0.65701 Mdot
0 0 0 setrgbcolor
0.01732 setlinewidth
0.57546 0.62899 Mdot
0 0 0 setrgbcolor
0.01422 setlinewidth
0.48934 0.44212 Mdot
0 0 0 setrgbcolor
0.00728 setlinewidth
0.48968 0.61104 Mdot
0 0 0 setrgbcolor
0.00862 setlinewidth
0.47042 0.47207 Mdot
0 0 0 setrgbcolor
0.00631 setlinewidth
0.53173 0.45534 Mdot
0 0 0 setrgbcolor
0.01793 setlinewidth
0.46965 0.59142 Mdot
0 0 0 setrgbcolor
0.01218 setlinewidth
0.53856 0.46281 Mdot
0 0 0 setrgbcolor
0.01538 setlinewidth
0.52783 0.60715 Mdot
0 0 0 setrgbcolor
0.00542 setlinewidth
0.51988 0.59741 Mdot
0 0 0 setrgbcolor
0.00848 setlinewidth
0.49998 0.59192 Mdot
0 0 0 setrgbcolor
0.01407 setlinewidth
0.50026 0.58051 Mdot
0 0 0 setrgbcolor
0.01288 setlinewidth
0.50445 0.51862 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.0093 setlinewidth
0.52098 0.53926 Mdot
0 0 0 setrgbcolor
0.01111 setlinewidth
0.55088 0.55725 Mdot
0 0 0 setrgbcolor
0.0089 setlinewidth
0.49621 0.57185 Mdot
0 0 0 setrgbcolor
0.00791 setlinewidth
0.4821 0.55769 Mdot
0 0 0 setrgbcolor
0.01491 setlinewidth
0.56813 0.51213 Mdot
0 0 0 setrgbcolor
0.01684 setlinewidth
0.4762 0.49746 Mdot
0 0 0 setrgbcolor
0.0057 setlinewidth
0.5711 0.58078 Mdot
0 0 0 setrgbcolor
0.01353 setlinewidth
0.45331 0.53551 Mdot
0 0 0 setrgbcolor
0.01273 setlinewidth
0.55853 0.4718 Mdot
0 0 0 setrgbcolor
0.00853 setlinewidth
0.45756 0.50132 Mdot
0 0 0 setrgbcolor
0.01833 setlinewidth
0.48886 0.46153 Mdot
0 0 0 setrgbcolor
0.01623 setlinewidth
0.47093 0.46939 Mdot
0 0 0 setrgbcolor
0.01778 setlinewidth
0.53668 0.44536 Mdot
0 0 0 setrgbcolor
0.0166 setlinewidth
0.58305 0.46255 Mdot
0 0 0 setrgbcolor
0.00541 setlinewidth
0.49453 0.44517 Mdot
0 0 0 setrgbcolor
0.00508 setlinewidth
0.43309 0.58839 Mdot
0 0 0 setrgbcolor
0.00586 setlinewidth
0.42988 0.48248 Mdot
0 0 0 setrgbcolor
0.0066 setlinewidth
0.57936 0.44399 Mdot
0 0 0 setrgbcolor
0.00789 setlinewidth
0.41165 0.54389 Mdot
0 0 0 setrgbcolor
0.007 setlinewidth
0.41852 0.57729 Mdot
0 0 0 setrgbcolor
0.01772 setlinewidth
0.51539 0.41555 Mdot
0 0 0 setrgbcolor
0.01839 setlinewidth
0.40982 0.57617 Mdot
0 0 0 setrgbcolor
0.01867 setlinewidth
0.62622 0.60951 Mdot
0 0 0 setrgbcolor
0.01568 setlinewidth
0.469 0.65107 Mdot
0 0 0 setrgbcolor
0.01838 setlinewidth
0.4011 0.57592 Mdot
0 0 0 setrgbcolor
0.00611 setlinewidth
0.42516 0.62016 Mdot
0 0 0 setrgbcolor
0.01621 setlinewidth
0.58143 0.41376 Mdot
0 0 0 setrgbcolor
0.00901 setlinewidth
0.61263 0.43302 Mdot
0 0 0 setrgbcolor
0.00908 setlinewidth
0.39087 0.49678 Mdot
0 0 0 setrgbcolor
0.0082 setlinewidth
0.59218 0.41359 Mdot
0 0 0 setrgbcolor
0.0125 setlinewidth
0.57086 0.40152 Mdot
0 0 0 setrgbcolor
0.00847 setlinewidth
0.62477 0.63512 Mdot
0 0 0 setrgbcolor
0.0054 setlinewidth
0.66637 0.52036 Mdot
0 0 0 setrgbcolor
0.00748 setlinewidth
0.66719 0.51648 Mdot
0 0 0 setrgbcolor
0.0192 setlinewidth
0.52 0.38939 Mdot
0 0 0 setrgbcolor
0.01226 setlinewidth
0.51638 0.38882 Mdot
0 0 0 setrgbcolor
0.01933 setlinewidth
0.48846 0.39192 Mdot
0 0 0 setrgbcolor
0.00941 setlinewidth
0.61996 0.42357 Mdot
0 0 0 setrgbcolor
0.01174 setlinewidth
0.52565 0.38631 Mdot
0 0 0 setrgbcolor
0.01032 setlinewidth
0.45033 0.405 Mdot
0 0 0 setrgbcolor
0.00506 setlinewidth
0.66851 0.57327 Mdot
0 0 0 setrgbcolor
0.01856 setlinewidth
0.48999 0.38707 Mdot
0 0 0 setrgbcolor
0.01584 setlinewidth
0.51955 0.38231 Mdot
0 0 0 setrgbcolor
0.01033 setlinewidth
0.50228 0.38332 Mdot
0 0 0 setrgbcolor
0.01806 setlinewidth
0.5907 0.39628 Mdot
0 0 0 setrgbcolor
0.01359 setlinewidth
0.5165 0.38042 Mdot
0 0 0 setrgbcolor
0.00896 setlinewidth
0.54114 0.38125 Mdot
0 0 0 setrgbcolor
0.01337 setlinewidth
0.52415 0.69108 Mdot
0 0 0 setrgbcolor
0.01442 setlinewidth
0.52995 0.37957 Mdot
0 0 0 setrgbcolor
0.01099 setlinewidth
0.52208 0.37864 Mdot
0 0 0 setrgbcolor
0.01351 setlinewidth
0.40243 0.6358 Mdot
0 0 0 setrgbcolor
0.01667 setlinewidth
0.61197 0.4059 Mdot
0 0 0 setrgbcolor
0.01418 setlinewidth
0.52008 0.37733 Mdot
0 0 0 setrgbcolor
0.01347 setlinewidth
0.52975 0.37703 Mdot
0 0 0 setrgbcolor
0.01703 setlinewidth
0.53571 0.37515 Mdot
0 0 0 setrgbcolor
0.01038 setlinewidth
0.40059 0.64117 Mdot
0 0 0 setrgbcolor
0.00901 setlinewidth
0.61125 0.3974 Mdot
0 0 0 setrgbcolor
0.01332 setlinewidth
0.52127 0.37013 Mdot
0 0 0 setrgbcolor
0.00981 setlinewidth
0.53458 0.3704 Mdot
0 0 0 setrgbcolor
0.0183 setlinewidth
0.40093 0.42366 Mdot
0 0 0 setrgbcolor
0.00792 setlinewidth
0.49029 0.69762 Mdot
0 0 0 setrgbcolor
0.00764 setlinewidth
0.4989 0.37086 Mdot
0 0 0 setrgbcolor
0.01292 setlinewidth
0.3947 0.64227 Mdot
0 0 0 setrgbcolor
0.01263 setlinewidth
0.60781 0.3882 Mdot
0 0 0 setrgbcolor
0.01885 setlinewidth
0.57899 0.69578 Mdot
0 0 0 setrgbcolor
0.01741 setlinewidth
0.60782 0.38782 Mdot
0 0 0 setrgbcolor
0.00663 setlinewidth
0.61731 0.39273 Mdot
0 0 0 setrgbcolor
0.00969 setlinewidth
0.35601 0.49788 Mdot
0 0 0 setrgbcolor
0.00681 setlinewidth
0.69253 0.51038 Mdot
0 0 0 setrgbcolor
0.01982 setlinewidth
0.47997 0.36917 Mdot
0 0 0 setrgbcolor
0.00613 setlinewidth
0.68611 0.59118 Mdot
0 0 0 setrgbcolor
0.00788 setlinewidth
0.52086 0.36267 Mdot
0 0 0 setrgbcolor
0.00848 setlinewidth
0.59814 0.37884 Mdot
0 0 0 setrgbcolor
0.01146 setlinewidth
0.69705 0.56129 Mdot
0 0 0 setrgbcolor
0.01445 setlinewidth
0.57067 0.70515 Mdot
0 0 0 setrgbcolor
0.01805 setlinewidth
0.63709 0.39957 Mdot
0 0 0 setrgbcolor
0.0062 setlinewidth
0.37156 0.43904 Mdot
0 0 0 setrgbcolor
0.00939 setlinewidth
0.37293 0.43584 Mdot
0 0 0 setrgbcolor
0.00854 setlinewidth
0.35456 0.60136 Mdot
0 0 0 setrgbcolor
0.01427 setlinewidth
0.48578 0.35786 Mdot
0 0 0 setrgbcolor
0.00873 setlinewidth
0.68359 0.62063 Mdot
0 0 0 setrgbcolor
0.0135 setlinewidth
0.66203 0.65414 Mdot
0 0 0 setrgbcolor
0.01688 setlinewidth
0.5435 0.35344 Mdot
0 0 0 setrgbcolor
0.01592 setlinewidth
0.65443 0.40684 Mdot
0 0 0 setrgbcolor
0.01218 setlinewidth
0.48594 0.35447 Mdot
1 1 1 setrgbcolor
0.01315 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01173 setlinewidth
0.51273 0.34661 Mdot
0 0 0 setrgbcolor
0.01287 setlinewidth
0.38365 0.6639 Mdot
0 0 0 setrgbcolor
0.00767 setlinewidth
0.54434 0.34262 Mdot
0 0 0 setrgbcolor
0.00724 setlinewidth
0.54439 0.72838 Mdot
0 0 0 setrgbcolor
0.00872 setlinewidth
0.50783 0.34174 Mdot
0 0 0 setrgbcolor
0.00569 setlinewidth
0.6944 0.62966 Mdot
0 0 0 setrgbcolor
0.01196 setlinewidth
0.53547 0.33684 Mdot
0 0 0 setrgbcolor
0.00986 setlinewidth
0.48476 0.33947 Mdot
0 0 0 setrgbcolor
0.01591 setlinewidth
0.49674 0.33369 Mdot
0 0 0 setrgbcolor
0.00688 setlinewidth
0.3619 0.40797 Mdot
0 0 0 setrgbcolor
0.01824 setlinewidth
0.3738 0.39325 Mdot
0 0 0 setrgbcolor
0.01564 setlinewidth
0.52281 0.3289 Mdot
0 0 0 setrgbcolor
0.01934 setlinewidth
0.68803 0.41089 Mdot
0 0 0 setrgbcolor
0.01831 setlinewidth
0.42621 0.35212 Mdot
0 0 0 setrgbcolor
0.01734 setlinewidth
0.40422 0.70567 Mdot
0 0 0 setrgbcolor
0.00615 setlinewidth
0.56343 0.73916 Mdot
0 0 0 setrgbcolor
0.01642 setlinewidth
0.62541 0.35447 Mdot
0 0 0 setrgbcolor
0.00806 setlinewidth
0.52442 0.32735 Mdot
0 0 0 setrgbcolor
0.00793 setlinewidth
0.66099 0.69145 Mdot
0 0 0 setrgbcolor
0.01194 setlinewidth
0.61764 0.34969 Mdot
0 0 0 setrgbcolor
0.01279 setlinewidth
0.51631 0.32702 Mdot
0 0 0 setrgbcolor
0.00825 setlinewidth
0.58368 0.33608 Mdot
0 0 0 setrgbcolor
0.01375 setlinewidth
0.35268 0.65482 Mdot
0 0 0 setrgbcolor
0.01165 setlinewidth
0.36058 0.66531 Mdot
0 0 0 setrgbcolor
0.01306 setlinewidth
0.51631 0.32742 Mdot
0 0 0 setrgbcolor
0.00783 setlinewidth
0.31588 0.55385 Mdot
0 0 0 setrgbcolor
0.01196 setlinewidth
0.50325 0.74243 Mdot
0 0 0 setrgbcolor
0.015 setlinewidth
0.31512 0.53688 Mdot
0 0 0 setrgbcolor
0.0178 setlinewidth
0.59316 0.73105 Mdot
0 0 0 setrgbcolor
0.01807 setlinewidth
0.62446 0.35402 Mdot
0 0 0 setrgbcolor
0.00708 setlinewidth
0.68764 0.66169 Mdot
0 0 0 setrgbcolor
0.01885 setlinewidth
0.379 0.38612 Mdot
0 0 0 setrgbcolor
0.00564 setlinewidth
0.55182 0.33001 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.54055 0.74163 Mdot
0 0 0 setrgbcolor
0.00719 setlinewidth
0.63093 0.71015 Mdot
0 0 0 setrgbcolor
0.01627 setlinewidth
0.33635 0.61932 Mdot
0 0 0 setrgbcolor
0.01635 setlinewidth
0.6323 0.70841 Mdot
0 0 0 setrgbcolor
0.01694 setlinewidth
0.44296 0.72272 Mdot
0 0 0 setrgbcolor
0.01385 setlinewidth
0.71284 0.60938 Mdot
0 0 0 setrgbcolor
0.00803 setlinewidth
0.403 0.69846 Mdot
0 0 0 setrgbcolor
0.00557 setlinewidth
0.41269 0.70495 Mdot
0 0 0 setrgbcolor
0.00773 setlinewidth
0.68323 0.65812 Mdot
1 1 1 setrgbcolor
0.01315 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01413 setlinewidth
0.45975 0.72603 Mdot
0 0 0 setrgbcolor
0.01459 setlinewidth
0.32226 0.53816 Mdot
0 0 0 setrgbcolor
0.01225 setlinewidth
0.64114 0.69692 Mdot
0 0 0 setrgbcolor
0.01625 setlinewidth
0.5107 0.33591 Mdot
0 0 0 setrgbcolor
0.00808 setlinewidth
0.33987 0.61346 Mdot
0 0 0 setrgbcolor
0.00825 setlinewidth
0.72032 0.51646 Mdot
0 0 0 setrgbcolor
0.01766 setlinewidth
0.71257 0.4791 Mdot
0 0 0 setrgbcolor
0.01211 setlinewidth
0.71867 0.54254 Mdot
0 0 0 setrgbcolor
0.00974 setlinewidth
0.70747 0.59206 Mdot
0 0 0 setrgbcolor
0.01219 setlinewidth
0.69366 0.62475 Mdot
0 0 0 setrgbcolor
0.01022 setlinewidth
0.375 0.41237 Mdot
0 0 0 setrgbcolor
0.0064 setlinewidth
0.39332 0.67721 Mdot
0 0 0 setrgbcolor
0.01032 setlinewidth
0.56615 0.72258 Mdot
0 0 0 setrgbcolor
0.01029 setlinewidth
0.54813 0.72544 Mdot
0 0 0 setrgbcolor
0.0063 setlinewidth
0.69326 0.62126 Mdot
0 0 0 setrgbcolor
0.01106 setlinewidth
0.57898 0.7169 Mdot
0 0 0 setrgbcolor
0.0113 setlinewidth
0.38061 0.66093 Mdot
0 0 0 setrgbcolor
0.01634 setlinewidth
0.49913 0.72269 Mdot
0 0 0 setrgbcolor
0.0152 setlinewidth
0.70763 0.5018 Mdot
0 0 0 setrgbcolor
0.01137 setlinewidth
0.53465 0.7217 Mdot
0 0 0 setrgbcolor
0.01319 setlinewidth
0.39137 0.40336 Mdot
0 0 0 setrgbcolor
0.01783 setlinewidth
0.38643 0.66177 Mdot
0 0 0 setrgbcolor
0.01513 setlinewidth
0.69208 0.61326 Mdot
0 0 0 setrgbcolor
0.01475 setlinewidth
0.53041 0.34992 Mdot
0 0 0 setrgbcolor
0.00993 setlinewidth
0.37458 0.64226 Mdot
0 0 0 setrgbcolor
0.01285 setlinewidth
0.70545 0.52476 Mdot
0 0 0 setrgbcolor
0.01623 setlinewidth
0.53961 0.71708 Mdot
0 0 0 setrgbcolor
0.00591 setlinewidth
0.48771 0.71435 Mdot
0 0 0 setrgbcolor
0.01416 setlinewidth
0.39664 0.40621 Mdot
0 0 0 setrgbcolor
0.01167 setlinewidth
0.34741 0.49736 Mdot
0 0 0 setrgbcolor
0.01976 setlinewidth
0.52274 0.71499 Mdot
0 0 0 setrgbcolor
0.00999 setlinewidth
0.34599 0.5082 Mdot
0 0 0 setrgbcolor
0.00608 setlinewidth
0.52163 0.71378 Mdot
0 0 0 setrgbcolor
0.00719 setlinewidth
0.48829 0.70977 Mdot
0 0 0 setrgbcolor
0.01575 setlinewidth
0.346 0.54402 Mdot
0 0 0 setrgbcolor
0.01062 setlinewidth
0.35425 0.58615 Mdot
0 0 0 setrgbcolor
0.01315 setlinewidth
0.52921 0.71125 Mdot
0 0 0 setrgbcolor
0.00844 setlinewidth
0.68902 0.47813 Mdot
0 0 0 setrgbcolor
0.00938 setlinewidth
0.53781 0.7096 Mdot
0 0 0 setrgbcolor
0.01534 setlinewidth
0.45664 0.37383 Mdot
0 0 0 setrgbcolor
0.00817 setlinewidth
0.51086 0.36652 Mdot
0 0 0 setrgbcolor
0.01702 setlinewidth
0.6873 0.56294 Mdot
0 0 0 setrgbcolor
0.0101 setlinewidth
0.5875 0.68866 Mdot
0 0 0 setrgbcolor
0.00685 setlinewidth
0.3952 0.43066 Mdot
0 0 0 setrgbcolor
0.01798 setlinewidth
0.40344 0.42199 Mdot
0 0 0 setrgbcolor
0.01306 setlinewidth
0.49181 0.69682 Mdot
0 0 0 setrgbcolor
0.01857 setlinewidth
0.50056 0.37596 Mdot
0 0 0 setrgbcolor
0.01663 setlinewidth
0.42365 0.40919 Mdot
0 0 0 setrgbcolor
0.01277 setlinewidth
0.53031 0.69042 Mdot
0 0 0 setrgbcolor
0.00822 setlinewidth
0.63504 0.63861 Mdot
0 0 0 setrgbcolor
0.00914 setlinewidth
0.50312 0.68493 Mdot
0 0 0 setrgbcolor
0.01348 setlinewidth
0.61229 0.64701 Mdot
0 0 0 setrgbcolor
0.0147 setlinewidth
0.47139 0.66768 Mdot
0 0 0 setrgbcolor
0.01769 setlinewidth
0.50944 0.39545 Mdot
0 0 0 setrgbcolor
0.01202 setlinewidth
0.55452 0.67108 Mdot
0 0 0 setrgbcolor
0.01086 setlinewidth
0.53131 0.67433 Mdot
0 0 0 setrgbcolor
0.01511 setlinewidth
0.49373 0.66642 Mdot
0 0 0 setrgbcolor
0.01727 setlinewidth
0.64339 0.48685 Mdot
0 0 0 setrgbcolor
0.01762 setlinewidth
0.54115 0.66036 Mdot
0 0 0 setrgbcolor
0.01953 setlinewidth
0.43423 0.44683 Mdot
0 0 0 setrgbcolor
0.00871 setlinewidth
0.59269 0.63774 Mdot
0 0 0 setrgbcolor
0.01737 setlinewidth
0.64095 0.55415 Mdot
0 0 0 setrgbcolor
0.01671 setlinewidth
0.41795 0.48101 Mdot
0 0 0 setrgbcolor
0.01236 setlinewidth
0.58646 0.62867 Mdot
0 0 0 setrgbcolor
0.01743 setlinewidth
0.43491 0.6048 Mdot
0 0 0 setrgbcolor
0.01804 setlinewidth
0.45859 0.62221 Mdot
0 0 0 setrgbcolor
0.01887 setlinewidth
0.55171 0.62831 Mdot
0 0 0 setrgbcolor
0.01434 setlinewidth
0.47711 0.45381 Mdot
0 0 0 setrgbcolor
0.01801 setlinewidth
0.4643 0.60098 Mdot
0 0 0 setrgbcolor
0.01025 setlinewidth
0.48464 0.46052 Mdot
0 0 0 setrgbcolor
0.01643 setlinewidth
0.49574 0.6127 Mdot
0 0 0 setrgbcolor
0.01986 setlinewidth
0.46219 0.58912 Mdot
0 0 0 setrgbcolor
0.00962 setlinewidth
0.4854 0.60377 Mdot
0 0 0 setrgbcolor
0.01764 setlinewidth
0.45589 0.52421 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01877 setlinewidth
0.52306 0.56182 Mdot
0 0 0 setrgbcolor
0.01496 setlinewidth
0.48928 0.54342 Mdot
0 0 0 setrgbcolor
0.01168 setlinewidth
0.56078 0.53681 Mdot
0 0 0 setrgbcolor
0.01837 setlinewidth
0.50717 0.50069 Mdot
0 0 0 setrgbcolor
0.01991 setlinewidth
0.53957 0.57434 Mdot
0 0 0 setrgbcolor
0.01859 setlinewidth
0.48804 0.50762 Mdot
0 0 0 setrgbcolor
0.00626 setlinewidth
0.49575 0.47274 Mdot
0 0 0 setrgbcolor
0.01383 setlinewidth
0.59347 0.55096 Mdot
0 0 0 setrgbcolor
0.00607 setlinewidth
0.51288 0.46176 Mdot
0 0 0 setrgbcolor
0.0068 setlinewidth
0.45412 0.49282 Mdot
0 0 0 setrgbcolor
0.01578 setlinewidth
0.44463 0.55859 Mdot
0 0 0 setrgbcolor
0.0179 setlinewidth
0.47368 0.60103 Mdot
0 0 0 setrgbcolor
0.01155 setlinewidth
0.60354 0.50143 Mdot
0 0 0 setrgbcolor
0.0187 setlinewidth
0.45639 0.59184 Mdot
0 0 0 setrgbcolor
0.00567 setlinewidth
0.51481 0.44407 Mdot
0 0 0 setrgbcolor
0.0089 setlinewidth
0.44646 0.59203 Mdot
0 0 0 setrgbcolor
0.01207 setlinewidth
0.58603 0.46114 Mdot
0 0 0 setrgbcolor
0.01185 setlinewidth
0.61626 0.57251 Mdot
0 0 0 setrgbcolor
0.01286 setlinewidth
0.55799 0.43737 Mdot
0 0 0 setrgbcolor
0.00598 setlinewidth
0.43648 0.59314 Mdot
0 0 0 setrgbcolor
0.01803 setlinewidth
0.41284 0.51383 Mdot
0 0 0 setrgbcolor
0.01819 setlinewidth
0.46699 0.63508 Mdot
0 0 0 setrgbcolor
0.01565 setlinewidth
0.6078 0.44767 Mdot
0 0 0 setrgbcolor
0.01548 setlinewidth
0.52818 0.41027 Mdot
0 0 0 setrgbcolor
0.01289 setlinewidth
0.51602 0.66074 Mdot
0 0 0 setrgbcolor
0.01648 setlinewidth
0.59962 0.42905 Mdot
0 0 0 setrgbcolor
0.0061 setlinewidth
0.45585 0.41051 Mdot
0 0 0 setrgbcolor
0.0185 setlinewidth
0.4412 0.65478 Mdot
0 0 0 setrgbcolor
0.00913 setlinewidth
0.4925 0.39069 Mdot
0 0 0 setrgbcolor
0.01772 setlinewidth
0.43897 0.66064 Mdot
0 0 0 setrgbcolor
0.00642 setlinewidth
0.52042 0.38278 Mdot
0 0 0 setrgbcolor
0.01625 setlinewidth
0.52432 0.38274 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.40558 0.43795 Mdot
0 0 0 setrgbcolor
0.01994 setlinewidth
0.49235 0.38549 Mdot
0 0 0 setrgbcolor
0.00649 setlinewidth
0.37078 0.52085 Mdot
0 0 0 setrgbcolor
0.01805 setlinewidth
0.59293 0.39752 Mdot
0 0 0 setrgbcolor
0.0146 setlinewidth
0.43189 0.66269 Mdot
0 0 0 setrgbcolor
0.00686 setlinewidth
0.52893 0.37865 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.50384 0.37958 Mdot
0 0 0 setrgbcolor
0.01039 setlinewidth
0.57883 0.38666 Mdot
0 0 0 setrgbcolor
0.01246 setlinewidth
0.67104 0.59485 Mdot
0 0 0 setrgbcolor
0.01404 setlinewidth
0.52124 0.37559 Mdot
0 0 0 setrgbcolor
0.00614 setlinewidth
0.60301 0.3956 Mdot
0 0 0 setrgbcolor
0.00819 setlinewidth
0.51741 0.37419 Mdot
0 0 0 setrgbcolor
0.0172 setlinewidth
0.62789 0.41237 Mdot
0 0 0 setrgbcolor
0.01892 setlinewidth
0.5224 0.37143 Mdot
0 0 0 setrgbcolor
0.01499 setlinewidth
0.53072 0.37104 Mdot
0 0 0 setrgbcolor
0.01747 setlinewidth
0.51985 0.37043 Mdot
0 0 0 setrgbcolor
0.00511 setlinewidth
0.54255 0.37085 Mdot
0 0 0 setrgbcolor
0.01823 setlinewidth
0.52952 0.36848 Mdot
0 0 0 setrgbcolor
0.01907 setlinewidth
0.37456 0.45864 Mdot
0 0 0 setrgbcolor
0.01006 setlinewidth
0.57269 0.69504 Mdot
0 0 0 setrgbcolor
0.00793 setlinewidth
0.37521 0.45517 Mdot
0 0 0 setrgbcolor
0.01362 setlinewidth
0.3816 0.62682 Mdot
0 0 0 setrgbcolor
0.01601 setlinewidth
0.49531 0.36749 Mdot
0 0 0 setrgbcolor
0.0103 setlinewidth
0.53473 0.36555 Mdot
0 0 0 setrgbcolor
0.01021 setlinewidth
0.67077 0.62214 Mdot
0 0 0 setrgbcolor
0.00973 setlinewidth
0.53672 0.70664 Mdot
0 0 0 setrgbcolor
0.01832 setlinewidth
0.63167 0.40142 Mdot
0 0 0 setrgbcolor
0.00945 setlinewidth
0.51811 0.3629 Mdot
0 0 0 setrgbcolor
0.01678 setlinewidth
0.47441 0.36906 Mdot
0 0 0 setrgbcolor
0.00679 setlinewidth
0.59572 0.37801 Mdot
0 0 0 setrgbcolor
0.01158 setlinewidth
0.53162 0.3609 Mdot
0 0 0 setrgbcolor
0.01219 setlinewidth
0.696 0.49524 Mdot
0 0 0 setrgbcolor
0.00858 setlinewidth
0.69599 0.49105 Mdot
0 0 0 setrgbcolor
0.01514 setlinewidth
0.61859 0.38444 Mdot
0 0 0 setrgbcolor
0.01202 setlinewidth
0.51437 0.35539 Mdot
0 0 0 setrgbcolor
0.017 setlinewidth
0.70525 0.5507 Mdot
0 0 0 setrgbcolor
0.01001 setlinewidth
0.61484 0.3758 Mdot
0 0 0 setrgbcolor
0.01071 setlinewidth
0.47529 0.35663 Mdot
0 0 0 setrgbcolor
0.01544 setlinewidth
0.4162 0.68704 Mdot
0 0 0 setrgbcolor
0.01293 setlinewidth
0.62607 0.69273 Mdot
0 0 0 setrgbcolor
0.01511 setlinewidth
0.60815 0.3669 Mdot
0 0 0 setrgbcolor
0.00526 setlinewidth
0.47366 0.35318 Mdot
0 0 0 setrgbcolor
0.00666 setlinewidth
0.608 0.3665 Mdot
0 0 0 setrgbcolor
0.00788 setlinewidth
0.59555 0.35887 Mdot
0 0 0 setrgbcolor
0.01832 setlinewidth
0.61833 0.37001 Mdot
0 0 0 setrgbcolor
0.01971 setlinewidth
0.6169 0.70385 Mdot
0 0 0 setrgbcolor
0.0183 setlinewidth
0.53238 0.34214 Mdot
0 0 0 setrgbcolor
0.019 setlinewidth
0.49762 0.34057 Mdot
1 1 1 setrgbcolor
0.00844 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01701 setlinewidth
0.63787 0.37389 Mdot
0 0 0 setrgbcolor
0.00965 setlinewidth
0.71523 0.481 Mdot
0 0 0 setrgbcolor
0.01776 setlinewidth
0.72087 0.56732 Mdot
0 0 0 setrgbcolor
0.01545 setlinewidth
0.48938 0.33654 Mdot
0 0 0 setrgbcolor
0.01275 setlinewidth
0.72656 0.53415 Mdot
0 0 0 setrgbcolor
0.01526 setlinewidth
0.52669 0.33107 Mdot
0 0 0 setrgbcolor
0.00809 setlinewidth
0.6547 0.37868 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.7018 0.63764 Mdot
0 0 0 setrgbcolor
0.0172 setlinewidth
0.4625 0.3384 Mdot
0 0 0 setrgbcolor
0.01077 setlinewidth
0.34565 0.4295 Mdot
0 0 0 setrgbcolor
0.01671 setlinewidth
0.71963 0.59906 Mdot
0 0 0 setrgbcolor
0.01452 setlinewidth
0.58599 0.73229 Mdot
0 0 0 setrgbcolor
0.00684 setlinewidth
0.35429 0.41261 Mdot
0 0 0 setrgbcolor
0.01948 setlinewidth
0.51381 0.32682 Mdot
0 0 0 setrgbcolor
0.0168 setlinewidth
0.47066 0.33054 Mdot
0 0 0 setrgbcolor
0.01818 setlinewidth
0.39801 0.36192 Mdot
0 0 0 setrgbcolor
0.00794 setlinewidth
0.42859 0.72841 Mdot
0 0 0 setrgbcolor
0.01894 setlinewidth
0.72617 0.6075 Mdot
0 0 0 setrgbcolor
0.0108 setlinewidth
0.49271 0.32124 Mdot
0 0 0 setrgbcolor
0.01813 setlinewidth
0.31212 0.58586 Mdot
0 0 0 setrgbcolor
0.00881 setlinewidth
0.30869 0.56873 Mdot
0 0 0 setrgbcolor
0.01058 setlinewidth
0.36353 0.68369 Mdot
0 0 0 setrgbcolor
0.01546 setlinewidth
0.37277 0.69336 Mdot
0 0 0 setrgbcolor
0.00947 setlinewidth
0.49096 0.31953 Mdot
0 0 0 setrgbcolor
0.01717 setlinewidth
0.34739 0.40519 Mdot
0 0 0 setrgbcolor
0.01568 setlinewidth
0.48063 0.32074 Mdot
0 0 0 setrgbcolor
0.0156 setlinewidth
0.59493 0.74211 Mdot
0 0 0 setrgbcolor
0.01417 setlinewidth
0.59908 0.32993 Mdot
0 0 0 setrgbcolor
0.0144 setlinewidth
0.33653 0.65011 Mdot
0 0 0 setrgbcolor
0.01539 setlinewidth
0.67554 0.37811 Mdot
0 0 0 setrgbcolor
0.01656 setlinewidth
0.47692 0.32138 Mdot
0 0 0 setrgbcolor
0.00624 setlinewidth
0.58832 0.32641 Mdot
0 0 0 setrgbcolor
0.00629 setlinewidth
0.52722 0.75403 Mdot
0 0 0 setrgbcolor
0.01313 setlinewidth
0.30717 0.56963 Mdot
0 0 0 setrgbcolor
0.00753 setlinewidth
0.54777 0.31842 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.68729 0.67878 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.5116 0.31791 Mdot
0 0 0 setrgbcolor
0.01602 setlinewidth
0.33443 0.64402 Mdot
0 0 0 setrgbcolor
0.01183 setlinewidth
0.41213 0.72238 Mdot
0 0 0 setrgbcolor
0.00899 setlinewidth
0.42261 0.72779 Mdot
0 0 0 setrgbcolor
0.00569 setlinewidth
0.45689 0.74204 Mdot
0 0 0 setrgbcolor
0.01045 setlinewidth
0.56292 0.74851 Mdot
0 0 0 setrgbcolor
0.00581 setlinewidth
0.61738 0.73028 Mdot
0 0 0 setrgbcolor
0.01167 setlinewidth
0.59079 0.33005 Mdot
0 0 0 setrgbcolor
0.00813 setlinewidth
0.47184 0.74348 Mdot
0 0 0 setrgbcolor
0.01822 setlinewidth
0.33494 0.43348 Mdot
1 1 1 setrgbcolor
0.00844 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01515 setlinewidth
0.46287 0.33173 Mdot
0 0 0 setrgbcolor
0.01673 setlinewidth
0.39273 0.70237 Mdot
0 0 0 setrgbcolor
0.00775 setlinewidth
0.70441 0.64401 Mdot
0 0 0 setrgbcolor
0.00978 setlinewidth
0.37655 0.68745 Mdot
0 0 0 setrgbcolor
0.01141 setlinewidth
0.64923 0.70351 Mdot
0 0 0 setrgbcolor
0.01078 setlinewidth
0.34693 0.42179 Mdot
0 0 0 setrgbcolor
0.01622 setlinewidth
0.64954 0.70156 Mdot
0 0 0 setrgbcolor
0.00871 setlinewidth
0.38079 0.68766 Mdot
0 0 0 setrgbcolor
0.00584 setlinewidth
0.31522 0.52504 Mdot
0 0 0 setrgbcolor
0.01254 setlinewidth
0.31524 0.53634 Mdot
0 0 0 setrgbcolor
0.01691 setlinewidth
0.36486 0.66935 Mdot
0 0 0 setrgbcolor
0.01707 setlinewidth
0.31996 0.57298 Mdot
0 0 0 setrgbcolor
0.00731 setlinewidth
0.35031 0.42399 Mdot
0 0 0 setrgbcolor
0.00719 setlinewidth
0.33403 0.61489 Mdot
0 0 0 setrgbcolor
0.00592 setlinewidth
0.50429 0.73543 Mdot
0 0 0 setrgbcolor
0.01623 setlinewidth
0.71774 0.58521 Mdot
0 0 0 setrgbcolor
0.01251 setlinewidth
0.65303 0.68856 Mdot
0 0 0 setrgbcolor
0.00936 setlinewidth
0.69245 0.64143 Mdot
0 0 0 setrgbcolor
0.00676 setlinewidth
0.55612 0.73166 Mdot
0 0 0 setrgbcolor
0.0085 setlinewidth
0.5744 0.72623 Mdot
0 0 0 setrgbcolor
0.01649 setlinewidth
0.47743 0.34327 Mdot
0 0 0 setrgbcolor
0.01334 setlinewidth
0.48878 0.7285 Mdot
0 0 0 setrgbcolor
0.01279 setlinewidth
0.40289 0.38089 Mdot
0 0 0 setrgbcolor
0.01701 setlinewidth
0.34768 0.44962 Mdot
0 0 0 setrgbcolor
0.01342 setlinewidth
0.53943 0.72975 Mdot
0 0 0 setrgbcolor
0.00884 setlinewidth
0.3544 0.43941 Mdot
0 0 0 setrgbcolor
0.00783 setlinewidth
0.58571 0.71864 Mdot
0 0 0 setrgbcolor
0.00698 setlinewidth
0.48699 0.72381 Mdot
0 0 0 setrgbcolor
0.00689 setlinewidth
0.69219 0.44738 Mdot
0 0 0 setrgbcolor
0.01513 setlinewidth
0.70662 0.48571 Mdot
0 0 0 setrgbcolor
0.01235 setlinewidth
0.54208 0.7244 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.52346 0.72458 Mdot
0 0 0 setrgbcolor
0.01264 setlinewidth
0.37138 0.42304 Mdot
0 0 0 setrgbcolor
0.01489 setlinewidth
0.52171 0.7235 Mdot
0 0 0 setrgbcolor
0.01742 setlinewidth
0.70751 0.51377 Mdot
0 0 0 setrgbcolor
0.00844 setlinewidth
0.52823 0.71992 Mdot
0 0 0 setrgbcolor
0.01407 setlinewidth
0.45455 0.36422 Mdot
0 0 0 setrgbcolor
0.01532 setlinewidth
0.69236 0.605 Mdot
0 0 0 setrgbcolor
0.01459 setlinewidth
0.5364 0.71707 Mdot
0 0 0 setrgbcolor
0.00802 setlinewidth
0.70196 0.56822 Mdot
0 0 0 setrgbcolor
0.01489 setlinewidth
0.69041 0.60144 Mdot
0 0 0 setrgbcolor
0.01049 setlinewidth
0.48449 0.71023 Mdot
0 0 0 setrgbcolor
0.0142 setlinewidth
0.44332 0.3759 Mdot
0 0 0 setrgbcolor
0.0157 setlinewidth
0.68531 0.47263 Mdot
0 0 0 setrgbcolor
0.0196 setlinewidth
0.68586 0.59329 Mdot
0 0 0 setrgbcolor
0.00594 setlinewidth
0.68462 0.49747 Mdot
0 0 0 setrgbcolor
0.00724 setlinewidth
0.49081 0.69659 Mdot
0 0 0 setrgbcolor
0.01189 setlinewidth
0.58169 0.68854 Mdot
0 0 0 setrgbcolor
0.00905 setlinewidth
0.52035 0.69851 Mdot
0 0 0 setrgbcolor
0.01873 setlinewidth
0.45422 0.68317 Mdot
0 0 0 setrgbcolor
0.00756 setlinewidth
0.38048 0.46055 Mdot
0 0 0 setrgbcolor
0.0055 setlinewidth
0.36839 0.4984 Mdot
0 0 0 setrgbcolor
0.01019 setlinewidth
0.65739 0.45094 Mdot
0 0 0 setrgbcolor
0.01727 setlinewidth
0.45071 0.39489 Mdot
0 0 0 setrgbcolor
0.01783 setlinewidth
0.47516 0.6789 Mdot
0 0 0 setrgbcolor
0.00638 setlinewidth
0.40316 0.62359 Mdot
0 0 0 setrgbcolor
0.00843 setlinewidth
0.51549 0.68186 Mdot
0 0 0 setrgbcolor
0.01258 setlinewidth
0.6662 0.54121 Mdot
0 0 0 setrgbcolor
0.01665 setlinewidth
0.53877 0.67522 Mdot
0 0 0 setrgbcolor
0.00756 setlinewidth
0.429 0.63827 Mdot
0 0 0 setrgbcolor
0.01915 setlinewidth
0.61972 0.62938 Mdot
0 0 0 setrgbcolor
0.01447 setlinewidth
0.52113 0.66608 Mdot
0 0 0 setrgbcolor
0.00756 setlinewidth
0.59536 0.6417 Mdot
0 0 0 setrgbcolor
0.01679 setlinewidth
0.42022 0.46116 Mdot
0 0 0 setrgbcolor
0.00883 setlinewidth
0.42922 0.61563 Mdot
0 0 0 setrgbcolor
0.00626 setlinewidth
0.42465 0.6037 Mdot
0 0 0 setrgbcolor
0.01863 setlinewidth
0.42787 0.46697 Mdot
0 0 0 setrgbcolor
0.01408 setlinewidth
0.40739 0.53752 Mdot
0 0 0 setrgbcolor
0.0133 setlinewidth
0.57022 0.63505 Mdot
0 0 0 setrgbcolor
0.01211 setlinewidth
0.44998 0.61554 Mdot
0 0 0 setrgbcolor
0.01145 setlinewidth
0.46214 0.6233 Mdot
0 0 0 setrgbcolor
0.01787 setlinewidth
0.60022 0.4684 Mdot
0 0 0 setrgbcolor
0.00902 setlinewidth
0.56076 0.62656 Mdot
0 0 0 setrgbcolor
0.0096 setlinewidth
0.52306 0.63138 Mdot
0 0 0 setrgbcolor
0.01809 setlinewidth
0.60658 0.53986 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.00618 setlinewidth
0.53043 0.54584 Mdot
0 0 0 setrgbcolor
0.01574 setlinewidth
0.52333 0.50913 Mdot
0 0 0 setrgbcolor
0.00974 setlinewidth
0.54191 0.49896 Mdot
0 0 0 setrgbcolor
0.0175 setlinewidth
0.48502 0.56838 Mdot
0 0 0 setrgbcolor
0.01345 setlinewidth
0.5678 0.55976 Mdot
0 0 0 setrgbcolor
0.01397 setlinewidth
0.48464 0.49933 Mdot
0 0 0 setrgbcolor
0.00634 setlinewidth
0.52448 0.47202 Mdot
0 0 0 setrgbcolor
0.01289 setlinewidth
0.5014 0.60089 Mdot
0 0 0 setrgbcolor
0.01415 setlinewidth
0.58605 0.5703 Mdot
0 0 0 setrgbcolor
0.01156 setlinewidth
0.52068 0.60782 Mdot
0 0 0 setrgbcolor
0.0074 setlinewidth
0.49069 0.60259 Mdot
0 0 0 setrgbcolor
0.014 setlinewidth
0.53972 0.45797 Mdot
0 0 0 setrgbcolor
0.01158 setlinewidth
0.60219 0.52806 Mdot
0 0 0 setrgbcolor
0.00618 setlinewidth
0.44334 0.52747 Mdot
0 0 0 setrgbcolor
0.0171 setlinewidth
0.47991 0.60525 Mdot
0 0 0 setrgbcolor
0.01707 setlinewidth
0.53748 0.43947 Mdot
0 0 0 setrgbcolor
0.01674 setlinewidth
0.51571 0.64418 Mdot
0 0 0 setrgbcolor
0.01456 setlinewidth
0.6362 0.53791 Mdot
0 0 0 setrgbcolor
0.01368 setlinewidth
0.57917 0.42554 Mdot
0 0 0 setrgbcolor
0.01387 setlinewidth
0.63767 0.48471 Mdot
0 0 0 setrgbcolor
0.00816 setlinewidth
0.61236 0.44559 Mdot
0 0 0 setrgbcolor
0.01345 setlinewidth
0.3962 0.54148 Mdot
0 0 0 setrgbcolor
0.00729 setlinewidth
0.46624 0.415 Mdot
0 0 0 setrgbcolor
0.01094 setlinewidth
0.54186 0.40258 Mdot
0 0 0 setrgbcolor
0.01378 setlinewidth
0.41824 0.45141 Mdot
0 0 0 setrgbcolor
0.01953 setlinewidth
0.56784 0.66397 Mdot
0 0 0 setrgbcolor
0.00566 setlinewidth
0.48805 0.66847 Mdot
0 0 0 setrgbcolor
0.00807 setlinewidth
0.66063 0.55713 Mdot
0 0 0 setrgbcolor
0.01179 setlinewidth
0.48553 0.67491 Mdot
0 0 0 setrgbcolor
0.01006 setlinewidth
0.38742 0.47768 Mdot
0 0 0 setrgbcolor
0.0165 setlinewidth
0.49893 0.38858 Mdot
0 0 0 setrgbcolor
0.01921 setlinewidth
0.38729 0.47406 Mdot
0 0 0 setrgbcolor
0.00722 setlinewidth
0.47756 0.6781 Mdot
0 0 0 setrgbcolor
0.00599 setlinewidth
0.62976 0.42817 Mdot
0 0 0 setrgbcolor
0.00829 setlinewidth
0.41929 0.64847 Mdot
0 0 0 setrgbcolor
0.01353 setlinewidth
0.49697 0.38331 Mdot
0 0 0 setrgbcolor
0.01724 setlinewidth
0.61706 0.4102 Mdot
0 0 0 setrgbcolor
0.01174 setlinewidth
0.52502 0.37576 Mdot
0 0 0 setrgbcolor
0.00716 setlinewidth
0.52897 0.37506 Mdot
0 0 0 setrgbcolor
0.016 setlinewidth
0.50683 0.37532 Mdot
0 0 0 setrgbcolor
0.00766 setlinewidth
0.53214 0.37009 Mdot
0 0 0 setrgbcolor
0.01647 setlinewidth
0.52322 0.36829 Mdot
0 0 0 setrgbcolor
0.01685 setlinewidth
0.51878 0.36751 Mdot
0 0 0 setrgbcolor
0.00737 setlinewidth
0.5228 0.36385 Mdot
0 0 0 setrgbcolor
0.01695 setlinewidth
0.51982 0.36326 Mdot
0 0 0 setrgbcolor
0.01785 setlinewidth
0.47164 0.36972 Mdot
0 0 0 setrgbcolor
0.01206 setlinewidth
0.49326 0.3645 Mdot
0 0 0 setrgbcolor
0.0167 setlinewidth
0.53105 0.36202 Mdot
0 0 0 setrgbcolor
0.01019 setlinewidth
0.601 0.37874 Mdot
0 0 0 setrgbcolor
0.00585 setlinewidth
0.52883 0.35962 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.5839 0.36991 Mdot
0 0 0 setrgbcolor
0.01534 setlinewidth
0.54277 0.35982 Mdot
0 0 0 setrgbcolor
0.01354 setlinewidth
0.51497 0.3559 Mdot
0 0 0 setrgbcolor
0.00643 setlinewidth
0.53286 0.35574 Mdot
0 0 0 setrgbcolor
0.01746 setlinewidth
0.60968 0.3751 Mdot
0 0 0 setrgbcolor
0.01114 setlinewidth
0.45786 0.70592 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.52779 0.35154 Mdot
0 0 0 setrgbcolor
0.00501 setlinewidth
0.58691 0.70961 Mdot
0 0 0 setrgbcolor
0.01716 setlinewidth
0.62333 0.69249 Mdot
0 0 0 setrgbcolor
0.01341 setlinewidth
0.63791 0.38838 Mdot
0 0 0 setrgbcolor
0.00979 setlinewidth
0.46713 0.357 Mdot
0 0 0 setrgbcolor
0.01493 setlinewidth
0.50785 0.34891 Mdot
0 0 0 setrgbcolor
0.01891 setlinewidth
0.46367 0.35381 Mdot
0 0 0 setrgbcolor
0.00904 setlinewidth
0.59637 0.35821 Mdot
0 0 0 setrgbcolor
0.00586 setlinewidth
0.71203 0.57299 Mdot
0 0 0 setrgbcolor
0.01009 setlinewidth
0.63743 0.37645 Mdot
0 0 0 setrgbcolor
0.00761 setlinewidth
0.61948 0.36106 Mdot
0 0 0 setrgbcolor
0.00735 setlinewidth
0.3403 0.45355 Mdot
0 0 0 setrgbcolor
0.01373 setlinewidth
0.71316 0.60203 Mdot
0 0 0 setrgbcolor
0.01123 setlinewidth
0.48286 0.33686 Mdot
0 0 0 setrgbcolor
0.01405 setlinewidth
0.51949 0.33236 Mdot
0 0 0 setrgbcolor
0.01639 setlinewidth
0.61255 0.35278 Mdot
0 0 0 setrgbcolor
0.00698 setlinewidth
0.34492 0.43506 Mdot
0 0 0 setrgbcolor
0.01 setlinewidth
0.60266 0.34476 Mdot
0 0 0 setrgbcolor
0.01829 setlinewidth
0.60234 0.34438 Mdot
0 0 0 setrgbcolor
0.00545 setlinewidth
0.58768 0.33863 Mdot
0 0 0 setrgbcolor
0.00641 setlinewidth
0.71803 0.46435 Mdot
0 0 0 setrgbcolor
0.0138 setlinewidth
0.47156 0.33428 Mdot
0 0 0 setrgbcolor
0.01048 setlinewidth
0.71708 0.45995 Mdot
1 1 1 setrgbcolor
0.01838 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01665 setlinewidth
0.6129 0.34628 Mdot
0 0 0 setrgbcolor
0.01504 setlinewidth
0.67224 0.6832 Mdot
0 0 0 setrgbcolor
0.0163 setlinewidth
0.44251 0.34099 Mdot
0 0 0 setrgbcolor
0.01563 setlinewidth
0.73494 0.52156 Mdot
0 0 0 setrgbcolor
0.00818 setlinewidth
0.66264 0.69631 Mdot
0 0 0 setrgbcolor
0.00778 setlinewidth
0.50702 0.3222 Mdot
0 0 0 setrgbcolor
0.01562 setlinewidth
0.37635 0.37643 Mdot
0 0 0 setrgbcolor
0.00907 setlinewidth
0.63078 0.3471 Mdot
0 0 0 setrgbcolor
0.00584 setlinewidth
0.31599 0.60137 Mdot
0 0 0 setrgbcolor
0.01798 setlinewidth
0.49068 0.32022 Mdot
0 0 0 setrgbcolor
0.00742 setlinewidth
0.32194 0.61829 Mdot
0 0 0 setrgbcolor
0.01822 setlinewidth
0.44591 0.33171 Mdot
0 0 0 setrgbcolor
0.01581 setlinewidth
0.46097 0.74824 Mdot
0 0 0 setrgbcolor
0.01618 setlinewidth
0.62831 0.73093 Mdot
0 0 0 setrgbcolor
0.01192 setlinewidth
0.64581 0.34938 Mdot
0 0 0 setrgbcolor
0.0168 setlinewidth
0.72801 0.4467 Mdot
0 0 0 setrgbcolor
0.00588 setlinewidth
0.38541 0.71119 Mdot
0 0 0 setrgbcolor
0.01261 setlinewidth
0.32581 0.42937 Mdot
0 0 0 setrgbcolor
0.01506 setlinewidth
0.74734 0.53721 Mdot
0 0 0 setrgbcolor
0.0085 setlinewidth
0.39551 0.71992 Mdot
0 0 0 setrgbcolor
0.01065 setlinewidth
0.4619 0.31856 Mdot
0 0 0 setrgbcolor
0.00584 setlinewidth
0.74655 0.50127 Mdot
0 0 0 setrgbcolor
0.00776 setlinewidth
0.7353 0.61485 Mdot
0 0 0 setrgbcolor
0.01718 setlinewidth
0.34892 0.6809 Mdot
0 0 0 setrgbcolor
0.01478 setlinewidth
0.7477 0.57131 Mdot
0 0 0 setrgbcolor
0.01626 setlinewidth
0.30559 0.60321 Mdot
0 0 0 setrgbcolor
0.00709 setlinewidth
0.45657 0.3173 Mdot
0 0 0 setrgbcolor
0.0184 setlinewidth
0.44462 0.32046 Mdot
0 0 0 setrgbcolor
0.01344 setlinewidth
0.34108 0.67537 Mdot
0 0 0 setrgbcolor
0.01314 setlinewidth
0.43712 0.322 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.74886 0.57983 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.42925 0.74542 Mdot
0 0 0 setrgbcolor
0.01116 setlinewidth
0.30537 0.461 Mdot
0 0 0 setrgbcolor
0.00577 setlinewidth
0.62549 0.74125 Mdot
0 0 0 setrgbcolor
0.01739 setlinewidth
0.43994 0.7497 Mdot
0 0 0 setrgbcolor
0.01375 setlinewidth
0.5641 0.30918 Mdot
0 0 0 setrgbcolor
0.01057 setlinewidth
0.55346 0.763 Mdot
0 0 0 setrgbcolor
0.0183 setlinewidth
0.4681 0.31252 Mdot
0 0 0 setrgbcolor
0.01674 setlinewidth
0.55081 0.30753 Mdot
0 0 0 setrgbcolor
0.01251 setlinewidth
0.47642 0.75999 Mdot
0 0 0 setrgbcolor
0.00932 setlinewidth
0.50613 0.30657 Mdot
0 0 0 setrgbcolor
0.00904 setlinewidth
0.29529 0.55754 Mdot
0 0 0 setrgbcolor
0.01834 setlinewidth
0.31181 0.44742 Mdot
0 0 0 setrgbcolor
0.01288 setlinewidth
0.29682 0.56905 Mdot
0 0 0 setrgbcolor
0.0096 setlinewidth
0.38193 0.71477 Mdot
0 0 0 setrgbcolor
0.01923 setlinewidth
0.40074 0.72791 Mdot
0 0 0 setrgbcolor
0.00554 setlinewidth
0.30609 0.60575 Mdot
0 0 0 setrgbcolor
0.0195 setlinewidth
0.65036 0.34618 Mdot
0 0 0 setrgbcolor
0.01846 setlinewidth
0.48847 0.75985 Mdot
0 0 0 setrgbcolor
0.00692 setlinewidth
0.31292 0.44929 Mdot
0 0 0 setrgbcolor
0.01599 setlinewidth
0.41493 0.33569 Mdot
0 0 0 setrgbcolor
0.00631 setlinewidth
0.32524 0.64658 Mdot
0 0 0 setrgbcolor
0.01607 setlinewidth
0.36501 0.69798 Mdot
0 0 0 setrgbcolor
0.00622 setlinewidth
0.3842 0.71458 Mdot
0 0 0 setrgbcolor
0.0175 setlinewidth
0.58522 0.75293 Mdot
0 0 0 setrgbcolor
0.00654 setlinewidth
0.54812 0.31123 Mdot
1 1 1 setrgbcolor
0.01838 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01037 setlinewidth
0.63836 0.72656 Mdot
0 0 0 setrgbcolor
0.01784 setlinewidth
0.70619 0.66223 Mdot
0 0 0 setrgbcolor
0.01543 setlinewidth
0.30921 0.47619 Mdot
0 0 0 setrgbcolor
0.01613 setlinewidth
0.31377 0.46475 Mdot
0 0 0 setrgbcolor
0.01777 setlinewidth
0.35336 0.39697 Mdot
0 0 0 setrgbcolor
0.00938 setlinewidth
0.32597 0.44545 Mdot
0 0 0 setrgbcolor
0.00595 setlinewidth
0.42257 0.3456 Mdot
0 0 0 setrgbcolor
0.01064 setlinewidth
0.51127 0.74803 Mdot
0 0 0 setrgbcolor
0.00556 setlinewidth
0.66142 0.69449 Mdot
0 0 0 setrgbcolor
0.01973 setlinewidth
0.49228 0.74306 Mdot
0 0 0 setrgbcolor
0.00942 setlinewidth
0.66047 0.69247 Mdot
0 0 0 setrgbcolor
0.01495 setlinewidth
0.71107 0.6235 Mdot
0 0 0 setrgbcolor
0.01932 setlinewidth
0.39792 0.37142 Mdot
0 0 0 setrgbcolor
0.01489 setlinewidth
0.48801 0.73856 Mdot
0 0 0 setrgbcolor
0.01003 setlinewidth
0.5628 0.73732 Mdot
0 0 0 setrgbcolor
0.01487 setlinewidth
0.54363 0.7377 Mdot
0 0 0 setrgbcolor
0.01535 setlinewidth
0.38661 0.38548 Mdot
0 0 0 setrgbcolor
0.01197 setlinewidth
0.58015 0.72924 Mdot
0 0 0 setrgbcolor
0.0159 setlinewidth
0.52423 0.73462 Mdot
0 0 0 setrgbcolor
0.01143 setlinewidth
0.52189 0.73376 Mdot
0 0 0 setrgbcolor
0.01551 setlinewidth
0.54353 0.73193 Mdot
0 0 0 setrgbcolor
0.01199 setlinewidth
0.33267 0.48294 Mdot
0 0 0 setrgbcolor
0.01531 setlinewidth
0.32601 0.52363 Mdot
0 0 0 setrgbcolor
0.00893 setlinewidth
0.65758 0.67862 Mdot
0 0 0 setrgbcolor
0.01757 setlinewidth
0.58898 0.71989 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.47906 0.72515 Mdot
0 0 0 setrgbcolor
0.01838 setlinewidth
0.5268 0.72926 Mdot
0 0 0 setrgbcolor
0.01358 setlinewidth
0.53392 0.72525 Mdot
0 0 0 setrgbcolor
0.01889 setlinewidth
0.69114 0.62308 Mdot
0 0 0 setrgbcolor
0.00599 setlinewidth
0.70955 0.55953 Mdot
0 0 0 setrgbcolor
0.01786 setlinewidth
0.44016 0.70151 Mdot
0 0 0 setrgbcolor
0.00643 setlinewidth
0.39168 0.40414 Mdot
0 0 0 setrgbcolor
0.00608 setlinewidth
0.37707 0.64727 Mdot
0 0 0 setrgbcolor
0.00655 setlinewidth
0.47945 0.71047 Mdot
0 0 0 setrgbcolor
0.01014 setlinewidth
0.65636 0.41785 Mdot
0 0 0 setrgbcolor
0.0069 setlinewidth
0.50946 0.70849 Mdot
0 0 0 setrgbcolor
0.01605 setlinewidth
0.67743 0.45604 Mdot
0 0 0 setrgbcolor
0.00689 setlinewidth
0.40327 0.65893 Mdot
0 0 0 setrgbcolor
0.01934 setlinewidth
0.45803 0.69445 Mdot
0 0 0 setrgbcolor
0.00953 setlinewidth
0.36569 0.47774 Mdot
0 0 0 setrgbcolor
0.01818 setlinewidth
0.68122 0.48576 Mdot
0 0 0 setrgbcolor
0.01131 setlinewidth
0.67877 0.58497 Mdot
0 0 0 setrgbcolor
0.01626 setlinewidth
0.36293 0.55844 Mdot
0 0 0 setrgbcolor
0.01019 setlinewidth
0.57105 0.68961 Mdot
0 0 0 setrgbcolor
0.01612 setlinewidth
0.39753 0.63572 Mdot
0 0 0 setrgbcolor
0.00649 setlinewidth
0.68272 0.5445 Mdot
0 0 0 setrgbcolor
0.00662 setlinewidth
0.39065 0.62409 Mdot
0 0 0 setrgbcolor
0.01538 setlinewidth
0.3728 0.48262 Mdot
0 0 0 setrgbcolor
0.01456 setlinewidth
0.67516 0.58157 Mdot
0 0 0 setrgbcolor
0.01194 setlinewidth
0.49845 0.69208 Mdot
0 0 0 setrgbcolor
0.01604 setlinewidth
0.64773 0.44608 Mdot
0 0 0 setrgbcolor
0.00553 setlinewidth
0.66702 0.57378 Mdot
0 0 0 setrgbcolor
0.01337 setlinewidth
0.52008 0.68203 Mdot
0 0 0 setrgbcolor
0.00923 setlinewidth
0.4163 0.63283 Mdot
0 0 0 setrgbcolor
0.00638 setlinewidth
0.49899 0.67507 Mdot
0 0 0 setrgbcolor
0.00602 setlinewidth
0.64882 0.47262 Mdot
0 0 0 setrgbcolor
0.01676 setlinewidth
0.4295 0.63915 Mdot
0 0 0 setrgbcolor
0.00799 setlinewidth
0.61129 0.42809 Mdot
0 0 0 setrgbcolor
0.01032 setlinewidth
0.57107 0.63904 Mdot
0 0 0 setrgbcolor
0.01734 setlinewidth
0.5954 0.62245 Mdot
0 0 0 setrgbcolor
0.00541 setlinewidth
0.63154 0.52219 Mdot
0 0 0 setrgbcolor
0.01879 setlinewidth
0.49114 0.63896 Mdot
0 0 0 setrgbcolor
0.01563 setlinewidth
0.54158 0.63588 Mdot
0 0 0 setrgbcolor
0.01547 setlinewidth
0.5292 0.62846 Mdot
0 0 0 setrgbcolor
0.01913 setlinewidth
0.54564 0.45654 Mdot
0 0 0 setrgbcolor
0.01671 setlinewidth
0.56147 0.53071 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.01618 setlinewidth
0.52015 0.50099 Mdot
0 0 0 setrgbcolor
0.0063 setlinewidth
0.53118 0.57215 Mdot
0 0 0 setrgbcolor
0.01487 setlinewidth
0.48115 0.53643 Mdot
0 0 0 setrgbcolor
0.00718 setlinewidth
0.56184 0.505 Mdot
0 0 0 setrgbcolor
0.01531 setlinewidth
0.57495 0.54192 Mdot
0 0 0 setrgbcolor
0.01546 setlinewidth
0.57878 0.49159 Mdot
0 0 0 setrgbcolor
0.01534 setlinewidth
0.54071 0.60676 Mdot
0 0 0 setrgbcolor
0.00953 setlinewidth
0.55169 0.60341 Mdot
0 0 0 setrgbcolor
0.016 setlinewidth
0.52962 0.61112 Mdot
0 0 0 setrgbcolor
0.01269 setlinewidth
0.55578 0.46653 Mdot
0 0 0 setrgbcolor
0.01575 setlinewidth
0.57214 0.6078 Mdot
0 0 0 setrgbcolor
0.00882 setlinewidth
0.61428 0.55076 Mdot
0 0 0 setrgbcolor
0.00944 setlinewidth
0.43128 0.55825 Mdot
0 0 0 setrgbcolor
0.01341 setlinewidth
0.56807 0.4496 Mdot
0 0 0 setrgbcolor
0.0161 setlinewidth
0.56139 0.4309 Mdot
0 0 0 setrgbcolor
0.01808 setlinewidth
0.43856 0.46277 Mdot
0 0 0 setrgbcolor
0.00581 setlinewidth
0.6335 0.55907 Mdot
0 0 0 setrgbcolor
0.00773 setlinewidth
0.40983 0.49462 Mdot
0 0 0 setrgbcolor
0.00817 setlinewidth
0.56935 0.64648 Mdot
0 0 0 setrgbcolor
0.01881 setlinewidth
0.6431 0.51254 Mdot
0 0 0 setrgbcolor
0.01447 setlinewidth
0.40888 0.49096 Mdot
0 0 0 setrgbcolor
0.00576 setlinewidth
0.48119 0.41764 Mdot
0 0 0 setrgbcolor
0.01513 setlinewidth
0.46614 0.66493 Mdot
0 0 0 setrgbcolor
0.00872 setlinewidth
0.54113 0.67581 Mdot
0 0 0 setrgbcolor
0.01559 setlinewidth
0.59889 0.40973 Mdot
0 0 0 setrgbcolor
0.00629 setlinewidth
0.55564 0.39226 Mdot
0 0 0 setrgbcolor
0.01179 setlinewidth
0.53844 0.68292 Mdot
0 0 0 setrgbcolor
0.01685 setlinewidth
0.50753 0.38516 Mdot
0 0 0 setrgbcolor
0.00781 setlinewidth
0.52993 0.68739 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.6767 0.51775 Mdot
0 0 0 setrgbcolor
0.01034 setlinewidth
0.50374 0.38012 Mdot
0 0 0 setrgbcolor
0.00823 setlinewidth
0.63581 0.42513 Mdot
0 0 0 setrgbcolor
0.01533 setlinewidth
0.62227 0.65999 Mdot
0 0 0 setrgbcolor
0.00559 setlinewidth
0.66838 0.46188 Mdot
0 0 0 setrgbcolor
0.01558 setlinewidth
0.51118 0.3703 Mdot
0 0 0 setrgbcolor
0.01596 setlinewidth
0.52993 0.36763 Mdot
0 0 0 setrgbcolor
0.00581 setlinewidth
0.53367 0.36624 Mdot
0 0 0 setrgbcolor
0.01556 setlinewidth
0.47209 0.37068 Mdot
0 0 0 setrgbcolor
0.01378 setlinewidth
0.52538 0.36031 Mdot
0 0 0 setrgbcolor
0.0195 setlinewidth
0.52058 0.36028 Mdot
0 0 0 setrgbcolor
0.01888 setlinewidth
0.53506 0.36063 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.49304 0.36162 Mdot
0 0 0 setrgbcolor
0.00724 setlinewidth
0.70165 0.53438 Mdot
0 0 0 setrgbcolor
0.01351 setlinewidth
0.52326 0.35586 Mdot
0 0 0 setrgbcolor
0.00678 setlinewidth
0.52 0.35578 Mdot
0 0 0 setrgbcolor
0.00807 setlinewidth
0.6472 0.40427 Mdot
0 0 0 setrgbcolor
0.01632 setlinewidth
0.63023 0.3877 Mdot
0 0 0 setrgbcolor
0.01367 setlinewidth
0.53088 0.35258 Mdot
0 0 0 setrgbcolor
0.01721 setlinewidth
0.507 0.71941 Mdot
0 0 0 setrgbcolor
0.01 setlinewidth
0.52769 0.35051 Mdot
0 0 0 setrgbcolor
0.00631 setlinewidth
0.34664 0.4783 Mdot
0 0 0 setrgbcolor
0.01942 setlinewidth
0.51209 0.34911 Mdot
0 0 0 setrgbcolor
0.01759 setlinewidth
0.46205 0.35858 Mdot
0 0 0 setrgbcolor
0.00556 setlinewidth
0.54169 0.34832 Mdot
0 0 0 setrgbcolor
0.01558 setlinewidth
0.53014 0.34586 Mdot
0 0 0 setrgbcolor
0.01289 setlinewidth
0.45688 0.35596 Mdot
0 0 0 setrgbcolor
0.00846 setlinewidth
0.34678 0.45889 Mdot
0 0 0 setrgbcolor
0.01013 setlinewidth
0.52327 0.34246 Mdot
0 0 0 setrgbcolor
0.00727 setlinewidth
0.50177 0.34326 Mdot
0 0 0 setrgbcolor
0.01497 setlinewidth
0.5854 0.35167 Mdot
0 0 0 setrgbcolor
0.00504 setlinewidth
0.6047 0.35789 Mdot
0 0 0 setrgbcolor
0.01366 setlinewidth
0.61122 0.3527 Mdot
0 0 0 setrgbcolor
0.01287 setlinewidth
0.63866 0.70592 Mdot
0 0 0 setrgbcolor
0.01491 setlinewidth
0.46955 0.33547 Mdot
0 0 0 setrgbcolor
0.00518 setlinewidth
0.59206 0.33758 Mdot
0 0 0 setrgbcolor
0.01373 setlinewidth
0.64131 0.36175 Mdot
0 0 0 setrgbcolor
0.01585 setlinewidth
0.33698 0.6328 Mdot
0 0 0 setrgbcolor
0.01935 setlinewidth
0.67363 0.68297 Mdot
0 0 0 setrgbcolor
0.01212 setlinewidth
0.34519 0.6492 Mdot
0 0 0 setrgbcolor
0.01482 setlinewidth
0.45572 0.3349 Mdot
0 0 0 setrgbcolor
0.00875 setlinewidth
0.50561 0.32446 Mdot
0 0 0 setrgbcolor
0.01264 setlinewidth
0.42643 0.34688 Mdot
0 0 0 setrgbcolor
0.01947 setlinewidth
0.36318 0.39446 Mdot
0 0 0 setrgbcolor
0.00793 setlinewidth
0.63603 0.34953 Mdot
0 0 0 setrgbcolor
0.01064 setlinewidth
0.61382 0.33665 Mdot
1 1 1 setrgbcolor
0.00851 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01897 setlinewidth
0.31626 0.45688 Mdot
0 0 0 setrgbcolor
0.01315 setlinewidth
0.60379 0.32933 Mdot
0 0 0 setrgbcolor
0.01568 setlinewidth
0.42445 0.33701 Mdot
0 0 0 setrgbcolor
0.0111 setlinewidth
0.48658 0.31644 Mdot
0 0 0 setrgbcolor
0.01253 setlinewidth
0.57443 0.31906 Mdot
0 0 0 setrgbcolor
0.01453 setlinewidth
0.59101 0.32278 Mdot
0 0 0 setrgbcolor
0.01083 setlinewidth
0.74624 0.54404 Mdot
0 0 0 setrgbcolor
0.0192 setlinewidth
0.59053 0.32244 Mdot
0 0 0 setrgbcolor
0.01282 setlinewidth
0.46766 0.31739 Mdot
0 0 0 setrgbcolor
0.0071 setlinewidth
0.60057 0.32263 Mdot
0 0 0 setrgbcolor
0.01141 setlinewidth
0.41758 0.73595 Mdot
0 0 0 setrgbcolor
0.00853 setlinewidth
0.3181 0.63685 Mdot
0 0 0 setrgbcolor
0.00617 setlinewidth
0.42803 0.74367 Mdot
0 0 0 setrgbcolor
0.0175 setlinewidth
0.74895 0.57485 Mdot
0 0 0 setrgbcolor
0.0166 setlinewidth
0.5001 0.76421 Mdot
0 0 0 setrgbcolor
0.01592 setlinewidth
0.37327 0.71005 Mdot
0 0 0 setrgbcolor
0.01883 setlinewidth
0.43266 0.32107 Mdot
0 0 0 setrgbcolor
0.00618 setlinewidth
0.71485 0.66704 Mdot
0 0 0 setrgbcolor
0.01141 setlinewidth
0.72985 0.42852 Mdot
0 0 0 setrgbcolor
0.00871 setlinewidth
0.72785 0.42404 Mdot
0 0 0 setrgbcolor
0.01683 setlinewidth
0.61525 0.32055 Mdot
0 0 0 setrgbcolor
0.01638 setlinewidth
0.70531 0.68236 Mdot
0 0 0 setrgbcolor
0.00782 setlinewidth
0.35993 0.70585 Mdot
0 0 0 setrgbcolor
0.01755 setlinewidth
0.42387 0.3209 Mdot
0 0 0 setrgbcolor
0.01217 setlinewidth
0.75459 0.48649 Mdot
0 0 0 setrgbcolor
0.0156 setlinewidth
0.41107 0.32631 Mdot
0 0 0 setrgbcolor
0.01069 setlinewidth
0.28893 0.49303 Mdot
0 0 0 setrgbcolor
0.0099 setlinewidth
0.66908 0.72408 Mdot
0 0 0 setrgbcolor
0.0176 setlinewidth
0.6271 0.32051 Mdot
0 0 0 setrgbcolor
0.00685 setlinewidth
0.40005 0.32942 Mdot
0 0 0 setrgbcolor
0.01402 setlinewidth
0.28951 0.59284 Mdot
0 0 0 setrgbcolor
0.00531 setlinewidth
0.29249 0.60433 Mdot
0 0 0 setrgbcolor
0.00872 setlinewidth
0.28915 0.47852 Mdot
0 0 0 setrgbcolor
0.00946 setlinewidth
0.72833 0.40877 Mdot
0 0 0 setrgbcolor
0.01484 setlinewidth
0.30585 0.64042 Mdot
0 0 0 setrgbcolor
0.00972 setlinewidth
0.45388 0.76663 Mdot
0 0 0 setrgbcolor
0.00799 setlinewidth
0.28779 0.48044 Mdot
0 0 0 setrgbcolor
0.01591 setlinewidth
0.7624 0.50168 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.46415 0.76978 Mdot
0 0 0 setrgbcolor
0.01508 setlinewidth
0.329 0.67952 Mdot
0 0 0 setrgbcolor
0.01031 setlinewidth
0.42451 0.31456 Mdot
0 0 0 setrgbcolor
0.00573 setlinewidth
0.75403 0.46373 Mdot
0 0 0 setrgbcolor
0.01833 setlinewidth
0.39694 0.74163 Mdot
0 0 0 setrgbcolor
0.01741 setlinewidth
0.75944 0.58628 Mdot
0 0 0 setrgbcolor
0.01374 setlinewidth
0.41737 0.75272 Mdot
0 0 0 setrgbcolor
0.01856 setlinewidth
0.37557 0.7268 Mdot
0 0 0 setrgbcolor
0.01838 setlinewidth
0.4615 0.30172 Mdot
0 0 0 setrgbcolor
0.0143 setlinewidth
0.50084 0.77591 Mdot
0 0 0 setrgbcolor
0.01309 setlinewidth
0.37078 0.34784 Mdot
0 0 0 setrgbcolor
0.0185 setlinewidth
0.76464 0.53815 Mdot
0 0 0 setrgbcolor
0.01076 setlinewidth
0.397 0.74133 Mdot
0 0 0 setrgbcolor
0.01839 setlinewidth
0.28319 0.5087 Mdot
0 0 0 setrgbcolor
0.01229 setlinewidth
0.52219 0.29399 Mdot
0 0 0 setrgbcolor
0.01035 setlinewidth
0.50714 0.29474 Mdot
0 0 0 setrgbcolor
0.01417 setlinewidth
0.28518 0.49641 Mdot
0 0 0 setrgbcolor
0.01893 setlinewidth
0.58064 0.76906 Mdot
0 0 0 setrgbcolor
0.00921 setlinewidth
0.509 0.77459 Mdot
0 0 0 setrgbcolor
0.01185 setlinewidth
0.65317 0.73662 Mdot
0 0 0 setrgbcolor
0.0091 setlinewidth
0.31238 0.42121 Mdot
0 0 0 setrgbcolor
0.01218 setlinewidth
0.29143 0.47507 Mdot
0 0 0 setrgbcolor
0.01347 setlinewidth
0.49886 0.29942 Mdot
1 1 1 setrgbcolor
0.00851 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01085 setlinewidth
0.7594 0.54763 Mdot
0 0 0 setrgbcolor
0.01535 setlinewidth
0.61252 0.31746 Mdot
0 0 0 setrgbcolor
0.01147 setlinewidth
0.60606 0.75488 Mdot
0 0 0 setrgbcolor
0.01737 setlinewidth
0.37027 0.35728 Mdot
0 0 0 setrgbcolor
0.01114 setlinewidth
0.34571 0.38818 Mdot
0 0 0 setrgbcolor
0.01917 setlinewidth
0.29456 0.55533 Mdot
0 0 0 setrgbcolor
0.01998 setlinewidth
0.29502 0.51283 Mdot
0 0 0 setrgbcolor
0.00989 setlinewidth
0.33523 0.40454 Mdot
0 0 0 setrgbcolor
0.01527 setlinewidth
0.65434 0.72027 Mdot
0 0 0 setrgbcolor
0.00806 setlinewidth
0.51977 0.7603 Mdot
0 0 0 setrgbcolor
0.00795 setlinewidth
0.4982 0.75772 Mdot
0 0 0 setrgbcolor
0.01298 setlinewidth
0.4915 0.75375 Mdot
0 0 0 setrgbcolor
0.00586 setlinewidth
0.71522 0.64263 Mdot
0 0 0 setrgbcolor
0.00713 setlinewidth
0.33734 0.42319 Mdot
0 0 0 setrgbcolor
0.00594 setlinewidth
0.35898 0.6749 Mdot
0 0 0 setrgbcolor
0.01578 setlinewidth
0.56756 0.74263 Mdot
0 0 0 setrgbcolor
0.0087 setlinewidth
0.54691 0.74565 Mdot
0 0 0 setrgbcolor
0.01093 setlinewidth
0.47609 0.74137 Mdot
0 0 0 setrgbcolor
0.01254 setlinewidth
0.52501 0.74513 Mdot
0 0 0 setrgbcolor
0.01339 setlinewidth
0.52217 0.74457 Mdot
0 0 0 setrgbcolor
0.01016 setlinewidth
0.43047 0.72226 Mdot
0 0 0 setrgbcolor
0.0151 setlinewidth
0.31822 0.50303 Mdot
0 0 0 setrgbcolor
0.01746 setlinewidth
0.66574 0.68385 Mdot
0 0 0 setrgbcolor
0.00866 setlinewidth
0.54376 0.73982 Mdot
0 0 0 setrgbcolor
0.01214 setlinewidth
0.58269 0.73196 Mdot
0 0 0 setrgbcolor
0.00851 setlinewidth
0.52495 0.73936 Mdot
0 0 0 setrgbcolor
0.00925 setlinewidth
0.38364 0.68356 Mdot
0 0 0 setrgbcolor
0.01843 setlinewidth
0.32635 0.58619 Mdot
0 0 0 setrgbcolor
0.01616 setlinewidth
0.66342 0.68193 Mdot
0 0 0 setrgbcolor
0.01968 setlinewidth
0.32416 0.50705 Mdot
0 0 0 setrgbcolor
0.01091 setlinewidth
0.53041 0.73433 Mdot
0 0 0 setrgbcolor
0.00719 setlinewidth
0.46994 0.72643 Mdot
0 0 0 setrgbcolor
0.01244 setlinewidth
0.58812 0.72115 Mdot
0 0 0 setrgbcolor
0.00954 setlinewidth
0.36307 0.64967 Mdot
0 0 0 setrgbcolor
0.01568 setlinewidth
0.37192 0.66065 Mdot
0 0 0 setrgbcolor
0.01852 setlinewidth
0.44372 0.71286 Mdot
0 0 0 setrgbcolor
0.00702 setlinewidth
0.70543 0.60148 Mdot
0 0 0 setrgbcolor
0.01974 setlinewidth
0.49833 0.72051 Mdot
0 0 0 setrgbcolor
0.0134 setlinewidth
0.65335 0.6681 Mdot
0 0 0 setrgbcolor
0.01832 setlinewidth
0.3871 0.65531 Mdot
0 0 0 setrgbcolor
0.00515 setlinewidth
0.40041 0.66005 Mdot
0 0 0 setrgbcolor
0.01574 setlinewidth
0.4813 0.70518 Mdot
0 0 0 setrgbcolor
0.01494 setlinewidth
0.67763 0.60455 Mdot
0 0 0 setrgbcolor
0.01381 setlinewidth
0.60551 0.39335 Mdot
0 0 0 setrgbcolor
0.01278 setlinewidth
0.68656 0.53431 Mdot
0 0 0 setrgbcolor
0.01367 setlinewidth
0.55572 0.6926 Mdot
0 0 0 setrgbcolor
0.0164 setlinewidth
0.47615 0.68765 Mdot
0 0 0 setrgbcolor
0.00516 setlinewidth
0.4995 0.69193 Mdot
0 0 0 setrgbcolor
0.01623 setlinewidth
0.63247 0.43015 Mdot
0 0 0 setrgbcolor
0.01287 setlinewidth
0.63931 0.46108 Mdot
0 0 0 setrgbcolor
0.00638 setlinewidth
0.45806 0.65154 Mdot
0 0 0 setrgbcolor
0.01639 setlinewidth
0.65185 0.56654 Mdot
0 0 0 setrgbcolor
0.00693 setlinewidth
0.59553 0.42491 Mdot
0 0 0 setrgbcolor
0.01415 setlinewidth
0.64659 0.56356 Mdot
0 0 0 setrgbcolor
0.01783 setlinewidth
0.55241 0.41228 Mdot
0 0 0 setrgbcolor
0.00592 setlinewidth
0.64889 0.52311 Mdot
0 0 0 setrgbcolor
0.0058 setlinewidth
0.6349 0.55672 Mdot
0 0 0 setrgbcolor
0.0085 setlinewidth
0.59855 0.45287 Mdot
0 0 0 setrgbcolor
0.00758 setlinewidth
0.50819 0.64122 Mdot
0 0 0 setrgbcolor
0.00613 setlinewidth
0.54027 0.64017 Mdot
0 0 0 setrgbcolor
0.0145 setlinewidth
0.49353 0.63531 Mdot
0 0 0 setrgbcolor
0.01579 setlinewidth
0.56266 0.61923 Mdot
0 0 0 setrgbcolor
0.01462 setlinewidth
0.48279 0.45338 Mdot
0 0 0 setrgbcolor
0.00998 setlinewidth
0.584 0.50822 Mdot
0 0 0 setrgbcolor
0.01113 setlinewidth
0.50789 0.52855 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.00965 setlinewidth
0.52469 0.5396 Mdot
0 0 0 setrgbcolor
0.01083 setlinewidth
0.55906 0.49696 Mdot
0 0 0 setrgbcolor
0.01018 setlinewidth
0.47462 0.56977 Mdot
0 0 0 setrgbcolor
0.01495 setlinewidth
0.58112 0.56898 Mdot
0 0 0 setrgbcolor
0.01629 setlinewidth
0.4658 0.47082 Mdot
0 0 0 setrgbcolor
0.0084 setlinewidth
0.44095 0.50801 Mdot
0 0 0 setrgbcolor
0.01342 setlinewidth
0.60174 0.49459 Mdot
0 0 0 setrgbcolor
0.01758 setlinewidth
0.43919 0.50443 Mdot
0 0 0 setrgbcolor
0.00662 setlinewidth
0.58357 0.60978 Mdot
0 0 0 setrgbcolor
0.00752 setlinewidth
0.62079 0.53095 Mdot
0 0 0 setrgbcolor
0.01014 setlinewidth
0.59441 0.60362 Mdot
0 0 0 setrgbcolor
0.01778 setlinewidth
0.58807 0.45571 Mdot
0 0 0 setrgbcolor
0.0137 setlinewidth
0.60514 0.59853 Mdot
0 0 0 setrgbcolor
0.01356 setlinewidth
0.61592 0.47803 Mdot
0 0 0 setrgbcolor
0.00535 setlinewidth
0.50012 0.41767 Mdot
0 0 0 setrgbcolor
0.01193 setlinewidth
0.62585 0.60017 Mdot
0 0 0 setrgbcolor
0.01249 setlinewidth
0.59639 0.43624 Mdot
0 0 0 setrgbcolor
0.01885 setlinewidth
0.58522 0.41802 Mdot
0 0 0 setrgbcolor
0.0186 setlinewidth
0.66018 0.5343 Mdot
0 0 0 setrgbcolor
0.01751 setlinewidth
0.5203 0.67502 Mdot
0 0 0 setrgbcolor
0.0071 setlinewidth
0.62565 0.64116 Mdot
0 0 0 setrgbcolor
0.01454 setlinewidth
0.51795 0.38005 Mdot
0 0 0 setrgbcolor
0.01838 setlinewidth
0.67946 0.54018 Mdot
0 0 0 setrgbcolor
0.0119 setlinewidth
0.59827 0.67593 Mdot
0 0 0 setrgbcolor
0.01738 setlinewidth
0.51241 0.37555 Mdot
0 0 0 setrgbcolor
0.01222 setlinewidth
0.36472 0.50191 Mdot
0 0 0 setrgbcolor
0.01758 setlinewidth
0.56865 0.37919 Mdot
0 0 0 setrgbcolor
0.01556 setlinewidth
0.68113 0.48997 Mdot
0 0 0 setrgbcolor
0.0191 setlinewidth
0.59555 0.68379 Mdot
0 0 0 setrgbcolor
0.01105 setlinewidth
0.58688 0.68965 Mdot
0 0 0 setrgbcolor
0.01369 setlinewidth
0.47597 0.37137 Mdot
0 0 0 setrgbcolor
0.00676 setlinewidth
0.51673 0.36425 Mdot
0 0 0 setrgbcolor
0.0102 setlinewidth
0.36021 0.48227 Mdot
0 0 0 setrgbcolor
0.01382 setlinewidth
0.61577 0.39002 Mdot
0 0 0 setrgbcolor
0.00744 setlinewidth
0.53485 0.35831 Mdot
0 0 0 setrgbcolor
0.01865 setlinewidth
0.4948 0.35854 Mdot
0 0 0 setrgbcolor
0.01133 setlinewidth
0.53812 0.35626 Mdot
0 0 0 setrgbcolor
0.01057 setlinewidth
0.52271 0.35242 Mdot
0 0 0 setrgbcolor
0.00667 setlinewidth
0.5276 0.35162 Mdot
0 0 0 setrgbcolor
0.0109 setlinewidth
0.46066 0.36086 Mdot
0 0 0 setrgbcolor
0.00878 setlinewidth
0.53746 0.35028 Mdot
0 0 0 setrgbcolor
0.00584 setlinewidth
0.52041 0.34792 Mdot
0 0 0 setrgbcolor
0.01279 setlinewidth
0.52375 0.34744 Mdot
0 0 0 setrgbcolor
0.01448 setlinewidth
0.65454 0.39997 Mdot
0 0 0 setrgbcolor
0.01801 setlinewidth
0.45397 0.35912 Mdot
0 0 0 setrgbcolor
0.00886 setlinewidth
0.67679 0.64822 Mdot
0 0 0 setrgbcolor
0.0067 setlinewidth
0.53016 0.34279 Mdot
0 0 0 setrgbcolor
0.01142 setlinewidth
0.50969 0.34251 Mdot
0 0 0 setrgbcolor
0.00735 setlinewidth
0.52613 0.34123 Mdot
0 0 0 setrgbcolor
0.00556 setlinewidth
0.71235 0.49041 Mdot
0 0 0 setrgbcolor
0.00851 setlinewidth
0.56168 0.7266 Mdot
0 0 0 setrgbcolor
0.00936 setlinewidth
0.3709 0.66119 Mdot
0 0 0 setrgbcolor
0.01858 setlinewidth
0.69334 0.43311 Mdot
0 0 0 setrgbcolor
0.01733 setlinewidth
0.49657 0.33836 Mdot
0 0 0 setrgbcolor
0.01825 setlinewidth
0.52669 0.33607 Mdot
0 0 0 setrgbcolor
0.00783 setlinewidth
0.53924 0.33658 Mdot
0 0 0 setrgbcolor
0.00761 setlinewidth
0.381 0.67682 Mdot
0 0 0 setrgbcolor
0.00624 setlinewidth
0.51831 0.3338 Mdot
0 0 0 setrgbcolor
0.01409 setlinewidth
0.35986 0.41455 Mdot
0 0 0 setrgbcolor
0.00642 setlinewidth
0.63771 0.36209 Mdot
0 0 0 setrgbcolor
0.0155 setlinewidth
0.6584 0.37648 Mdot
0 0 0 setrgbcolor
0.01626 setlinewidth
0.31982 0.48569 Mdot
0 0 0 setrgbcolor
0.00541 setlinewidth
0.45874 0.33618 Mdot
0 0 0 setrgbcolor
0.01662 setlinewidth
0.41567 0.35539 Mdot
0 0 0 setrgbcolor
0.01576 setlinewidth
0.58281 0.33251 Mdot
0 0 0 setrgbcolor
0.01802 setlinewidth
0.44317 0.33809 Mdot
0 0 0 setrgbcolor
0.01294 setlinewidth
0.60325 0.33562 Mdot
0 0 0 setrgbcolor
0.01823 setlinewidth
0.73645 0.50431 Mdot
0 0 0 setrgbcolor
0.01532 setlinewidth
0.49162 0.31866 Mdot
0 0 0 setrgbcolor
0.0073 setlinewidth
0.40808 0.34588 Mdot
0 0 0 setrgbcolor
0.00738 setlinewidth
0.60688 0.3292 Mdot
0 0 0 setrgbcolor
0.01537 setlinewidth
0.34436 0.66861 Mdot
0 0 0 setrgbcolor
0.01707 setlinewidth
0.58251 0.31696 Mdot
0 0 0 setrgbcolor
0.00799 setlinewidth
0.46682 0.314 Mdot
0 0 0 setrgbcolor
0.00711 setlinewidth
0.44648 0.31838 Mdot
0 0 0 setrgbcolor
0.01108 setlinewidth
0.45885 0.75674 Mdot
0 0 0 setrgbcolor
0.00586 setlinewidth
0.68943 0.69516 Mdot
0 0 0 setrgbcolor
0.0148 setlinewidth
0.40872 0.73607 Mdot
0 0 0 setrgbcolor
0.00651 setlinewidth
0.63696 0.33351 Mdot
1 1 1 setrgbcolor
0.01784 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01209 setlinewidth
0.4691 0.76348 Mdot
0 0 0 setrgbcolor
0.01734 setlinewidth
0.28721 0.52733 Mdot
0 0 0 setrgbcolor
0.00645 setlinewidth
0.60117 0.31235 Mdot
0 0 0 setrgbcolor
0.01316 setlinewidth
0.55613 0.30115 Mdot
0 0 0 setrgbcolor
0.01858 setlinewidth
0.40735 0.32852 Mdot
0 0 0 setrgbcolor
0.00967 setlinewidth
0.72085 0.66621 Mdot
0 0 0 setrgbcolor
0.00755 setlinewidth
0.62659 0.32183 Mdot
0 0 0 setrgbcolor
0.0097 setlinewidth
0.58838 0.30657 Mdot
0 0 0 setrgbcolor
0.0164 setlinewidth
0.57328 0.30208 Mdot
0 0 0 setrgbcolor
0.01712 setlinewidth
0.57264 0.30182 Mdot
0 0 0 setrgbcolor
0.0109 setlinewidth
0.39039 0.7339 Mdot
0 0 0 setrgbcolor
0.00611 setlinewidth
0.5444 0.77555 Mdot
0 0 0 setrgbcolor
0.01911 setlinewidth
0.39548 0.33006 Mdot
0 0 0 setrgbcolor
0.01724 setlinewidth
0.58136 0.30031 Mdot
0 0 0 setrgbcolor
0.00751 setlinewidth
0.38275 0.33786 Mdot
0 0 0 setrgbcolor
0.00732 setlinewidth
0.29872 0.62875 Mdot
0 0 0 setrgbcolor
0.00638 setlinewidth
0.281 0.51291 Mdot
0 0 0 setrgbcolor
0.01124 setlinewidth
0.30299 0.64002 Mdot
0 0 0 setrgbcolor
0.00695 setlinewidth
0.36879 0.34314 Mdot
0 0 0 setrgbcolor
0.01995 setlinewidth
0.31972 0.675 Mdot
0 0 0 setrgbcolor
0.00937 setlinewidth
0.2772 0.51525 Mdot
0 0 0 setrgbcolor
0.01473 setlinewidth
0.77046 0.5085 Mdot
0 0 0 setrgbcolor
0.00595 setlinewidth
0.59131 0.29579 Mdot
0 0 0 setrgbcolor
0.00545 setlinewidth
0.34559 0.71196 Mdot
0 0 0 setrgbcolor
0.00724 setlinewidth
0.272 0.54494 Mdot
0 0 0 setrgbcolor
0.00789 setlinewidth
0.77487 0.54108 Mdot
0 0 0 setrgbcolor
0.00559 setlinewidth
0.27119 0.53226 Mdot
0 0 0 setrgbcolor
0.00954 setlinewidth
0.72893 0.38909 Mdot
0 0 0 setrgbcolor
0.01225 setlinewidth
0.75088 0.64435 Mdot
0 0 0 setrgbcolor
0.00672 setlinewidth
0.72584 0.38471 Mdot
0 0 0 setrgbcolor
0.01741 setlinewidth
0.48513 0.78511 Mdot
0 0 0 setrgbcolor
0.018 setlinewidth
0.33422 0.36744 Mdot
0 0 0 setrgbcolor
0.01992 setlinewidth
0.38435 0.3241 Mdot
0 0 0 setrgbcolor
0.00587 setlinewidth
0.42124 0.76683 Mdot
0 0 0 setrgbcolor
0.00778 setlinewidth
0.74199 0.66208 Mdot
0 0 0 setrgbcolor
0.00993 setlinewidth
0.59861 0.29389 Mdot
0 0 0 setrgbcolor
0.00671 setlinewidth
0.39645 0.75445 Mdot
0 0 0 setrgbcolor
0.0052 setlinewidth
0.49436 0.78722 Mdot
0 0 0 setrgbcolor
0.01809 setlinewidth
0.27083 0.50991 Mdot
0 0 0 setrgbcolor
0.00561 setlinewidth
0.28356 0.45197 Mdot
0 0 0 setrgbcolor
0.01043 setlinewidth
0.44219 0.77576 Mdot
0 0 0 setrgbcolor
0.01911 setlinewidth
0.41895 0.76672 Mdot
0 0 0 setrgbcolor
0.00723 setlinewidth
0.41725 0.30455 Mdot
0 0 0 setrgbcolor
0.00728 setlinewidth
0.70576 0.71173 Mdot
0 0 0 setrgbcolor
0.01678 setlinewidth
0.76111 0.44663 Mdot
0 0 0 setrgbcolor
0.01299 setlinewidth
0.52914 0.78925 Mdot
0 0 0 setrgbcolor
0.00958 setlinewidth
0.47597 0.28584 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.4602 0.28934 Mdot
0 0 0 setrgbcolor
0.0156 setlinewidth
0.71404 0.3691 Mdot
0 0 0 setrgbcolor
0.01645 setlinewidth
0.32502 0.37779 Mdot
0 0 0 setrgbcolor
0.01632 setlinewidth
0.27688 0.59158 Mdot
0 0 0 setrgbcolor
0.0163 setlinewidth
0.27089 0.54835 Mdot
0 0 0 setrgbcolor
0.01154 setlinewidth
0.53257 0.78726 Mdot
0 0 0 setrgbcolor
0.01293 setlinewidth
0.3025 0.41356 Mdot
0 0 0 setrgbcolor
0.01588 setlinewidth
0.29371 0.432 Mdot
0 0 0 setrgbcolor
0.0122 setlinewidth
0.44639 0.29601 Mdot
0 0 0 setrgbcolor
0.00616 setlinewidth
0.60724 0.77211 Mdot
0 0 0 setrgbcolor
0.01894 setlinewidth
0.76295 0.46212 Mdot
1 1 1 setrgbcolor
0.01784 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.00739 setlinewidth
0.74623 0.42327 Mdot
0 0 0 setrgbcolor
0.01524 setlinewidth
0.77096 0.55291 Mdot
0 0 0 setrgbcolor
0.01443 setlinewidth
0.76726 0.50089 Mdot
0 0 0 setrgbcolor
0.00895 setlinewidth
0.67586 0.72849 Mdot
0 0 0 setrgbcolor
0.01036 setlinewidth
0.29248 0.45107 Mdot
0 0 0 setrgbcolor
0.01851 setlinewidth
0.56328 0.29449 Mdot
0 0 0 setrgbcolor
0.00742 setlinewidth
0.35067 0.70526 Mdot
0 0 0 setrgbcolor
0.00922 setlinewidth
0.62395 0.75455 Mdot
0 0 0 setrgbcolor
0.01994 setlinewidth
0.28203 0.53564 Mdot
0 0 0 setrgbcolor
0.00533 setlinewidth
0.30092 0.61936 Mdot
0 0 0 setrgbcolor
0.01174 setlinewidth
0.50641 0.77223 Mdot
0 0 0 setrgbcolor
0.01619 setlinewidth
0.28627 0.539 Mdot
0 0 0 setrgbcolor
0.01955 setlinewidth
0.52942 0.77207 Mdot
0 0 0 setrgbcolor
0.00521 setlinewidth
0.49747 0.7691 Mdot
0 0 0 setrgbcolor
0.01548 setlinewidth
0.7548 0.51246 Mdot
0 0 0 setrgbcolor
0.0114 setlinewidth
0.37196 0.71123 Mdot
0 0 0 setrgbcolor
0.01778 setlinewidth
0.42619 0.74479 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.34441 0.67937 Mdot
0 0 0 setrgbcolor
0.01608 setlinewidth
0.3547 0.68945 Mdot
0 0 0 setrgbcolor
0.01101 setlinewidth
0.47601 0.75857 Mdot
0 0 0 setrgbcolor
0.00776 setlinewidth
0.66352 0.712 Mdot
0 0 0 setrgbcolor
0.0151 setlinewidth
0.52575 0.75616 Mdot
0 0 0 setrgbcolor
0.01284 setlinewidth
0.52255 0.75596 Mdot
0 0 0 setrgbcolor
0.01228 setlinewidth
0.54895 0.75377 Mdot
0 0 0 setrgbcolor
0.01419 setlinewidth
0.43352 0.73372 Mdot
0 0 0 setrgbcolor
0.01904 setlinewidth
0.56986 0.74786 Mdot
0 0 0 setrgbcolor
0.01829 setlinewidth
0.46312 0.74424 Mdot
0 0 0 setrgbcolor
0.00562 setlinewidth
0.36493 0.68222 Mdot
0 0 0 setrgbcolor
0.01784 setlinewidth
0.52276 0.75032 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.54259 0.74828 Mdot
0 0 0 setrgbcolor
0.00984 setlinewidth
0.37737 0.68541 Mdot
0 0 0 setrgbcolor
0.00931 setlinewidth
0.526 0.74449 Mdot
0 0 0 setrgbcolor
0.00671 setlinewidth
0.58145 0.73487 Mdot
0 0 0 setrgbcolor
0.00824 setlinewidth
0.71206 0.62127 Mdot
0 0 0 setrgbcolor
0.00553 setlinewidth
0.48773 0.73462 Mdot
0 0 0 setrgbcolor
0.00745 setlinewidth
0.58264 0.72301 Mdot
0 0 0 setrgbcolor
0.01034 setlinewidth
0.46528 0.72119 Mdot
0 0 0 setrgbcolor
0.00802 setlinewidth
0.66066 0.67265 Mdot
0 0 0 setrgbcolor
0.01946 setlinewidth
0.6569 0.67103 Mdot
0 0 0 setrgbcolor
0.01888 setlinewidth
0.45424 0.70393 Mdot
0 0 0 setrgbcolor
0.00927 setlinewidth
0.47833 0.70523 Mdot
0 0 0 setrgbcolor
0.00706 setlinewidth
0.63925 0.65824 Mdot
0 0 0 setrgbcolor
0.01653 setlinewidth
0.68574 0.57974 Mdot
0 0 0 setrgbcolor
0.01773 setlinewidth
0.42627 0.66929 Mdot
0 0 0 setrgbcolor
0.00623 setlinewidth
0.53624 0.69821 Mdot
0 0 0 setrgbcolor
0.01881 setlinewidth
0.54172 0.37678 Mdot
0 0 0 setrgbcolor
0.01782 setlinewidth
0.65088 0.58769 Mdot
0 0 0 setrgbcolor
0.01381 setlinewidth
0.48417 0.406 Mdot
0 0 0 setrgbcolor
0.01248 setlinewidth
0.57303 0.41099 Mdot
0 0 0 setrgbcolor
0.01176 setlinewidth
0.45608 0.64772 Mdot
0 0 0 setrgbcolor
0.01895 setlinewidth
0.41623 0.46046 Mdot
0 0 0 setrgbcolor
0.01601 setlinewidth
0.47212 0.65178 Mdot
0 0 0 setrgbcolor
0.0155 setlinewidth
0.648 0.51194 Mdot
0 0 0 setrgbcolor
0.01485 setlinewidth
0.53102 0.41191 Mdot
0 0 0 setrgbcolor
0.00864 setlinewidth
0.50456 0.64613 Mdot
0 0 0 setrgbcolor
0.01493 setlinewidth
0.58275 0.44255 Mdot
0 0 0 setrgbcolor
0.01906 setlinewidth
0.53594 0.44089 Mdot
0 0 0 setrgbcolor
0.01083 setlinewidth
0.61155 0.55189 Mdot
0 0 0 setrgbcolor
0.01005 setlinewidth
0.52294 0.62108 Mdot
0 0 0 setrgbcolor
0.01171 setlinewidth
0.60481 0.54961 Mdot
0 0 0 setrgbcolor
0.01705 setlinewidth
0.60083 0.50653 Mdot
0 0 0 setrgbcolor
0.00844 setlinewidth
0.44935 0.53486 Mdot
0 0 0 setrgbcolor
0.01027 setlinewidth
0.58999 0.54432 Mdot
0 0 0 setrgbcolor
0.00526 setlinewidth
0.52572 0.50159 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.00544 setlinewidth
0.52445 0.57486 Mdot
0 0 0 setrgbcolor
0.01056 setlinewidth
0.47952 0.51654 Mdot
0 0 0 setrgbcolor
0.00522 setlinewidth
0.5721 0.53604 Mdot
0 0 0 setrgbcolor
0.00784 setlinewidth
0.47699 0.51316 Mdot
0 0 0 setrgbcolor
0.01325 setlinewidth
0.49882 0.47447 Mdot
0 0 0 setrgbcolor
0.01988 setlinewidth
0.59954 0.48655 Mdot
0 0 0 setrgbcolor
0.0189 setlinewidth
0.63263 0.5581 Mdot
0 0 0 setrgbcolor
0.0154 setlinewidth
0.52219 0.41439 Mdot
0 0 0 setrgbcolor
0.01256 setlinewidth
0.39391 0.52261 Mdot
0 0 0 setrgbcolor
0.00564 setlinewidth
0.64095 0.47743 Mdot
0 0 0 setrgbcolor
0.00842 setlinewidth
0.63942 0.60043 Mdot
0 0 0 setrgbcolor
0.01065 setlinewidth
0.61958 0.4392 Mdot
0 0 0 setrgbcolor
0.01174 setlinewidth
0.64944 0.59243 Mdot
0 0 0 setrgbcolor
0.01092 setlinewidth
0.38482 0.50342 Mdot
0 0 0 setrgbcolor
0.01832 setlinewidth
0.6656 0.51244 Mdot
0 0 0 setrgbcolor
0.01042 setlinewidth
0.65934 0.58555 Mdot
0 0 0 setrgbcolor
0.01507 setlinewidth
0.65124 0.45797 Mdot
0 0 0 setrgbcolor
0.01618 setlinewidth
0.57964 0.67776 Mdot
0 0 0 setrgbcolor
0.01771 setlinewidth
0.62301 0.41769 Mdot
0 0 0 setrgbcolor
0.00786 setlinewidth
0.60751 0.40066 Mdot
0 0 0 setrgbcolor
0.01162 setlinewidth
0.52966 0.37288 Mdot
0 0 0 setrgbcolor
0.01945 setlinewidth
0.67927 0.58432 Mdot
0 0 0 setrgbcolor
0.00902 setlinewidth
0.52256 0.36922 Mdot
0 0 0 setrgbcolor
0.00666 setlinewidth
0.4833 0.37122 Mdot
0 0 0 setrgbcolor
0.01598 setlinewidth
0.52321 0.35694 Mdot
0 0 0 setrgbcolor
0.01796 setlinewidth
0.57997 0.36341 Mdot
0 0 0 setrgbcolor
0.01616 setlinewidth
0.70292 0.51006 Mdot
0 0 0 setrgbcolor
0.01886 setlinewidth
0.49861 0.35491 Mdot
0 0 0 setrgbcolor
0.0054 setlinewidth
0.46331 0.3632 Mdot
0 0 0 setrgbcolor
0.018 setlinewidth
0.41637 0.68488 Mdot
0 0 0 setrgbcolor
0.00639 setlinewidth
0.68205 0.62759 Mdot
0 0 0 setrgbcolor
0.00681 setlinewidth
0.36705 0.43505 Mdot
0 0 0 setrgbcolor
0.01991 setlinewidth
0.45545 0.36261 Mdot
0 0 0 setrgbcolor
0.01 setlinewidth
0.33668 0.51373 Mdot
0 0 0 setrgbcolor
0.01724 setlinewidth
0.53947 0.34776 Mdot
0 0 0 setrgbcolor
0.0119 setlinewidth
0.65705 0.66809 Mdot
0 0 0 setrgbcolor
0.01041 setlinewidth
0.42792 0.69959 Mdot
0 0 0 setrgbcolor
0.00753 setlinewidth
0.542 0.34509 Mdot
0 0 0 setrgbcolor
0.01363 setlinewidth
0.52507 0.34384 Mdot
0 0 0 setrgbcolor
0.01024 setlinewidth
0.65444 0.67678 Mdot
0 0 0 setrgbcolor
0.00791 setlinewidth
0.64603 0.68415 Mdot
0 0 0 setrgbcolor
0.01643 setlinewidth
0.52972 0.34218 Mdot
0 0 0 setrgbcolor
0.01548 setlinewidth
0.52104 0.33965 Mdot
0 0 0 setrgbcolor
0.01643 setlinewidth
0.52425 0.33858 Mdot
0 0 0 setrgbcolor
0.01304 setlinewidth
0.53912 0.33911 Mdot
0 0 0 setrgbcolor
0.01022 setlinewidth
0.62838 0.36668 Mdot
0 0 0 setrgbcolor
0.01543 setlinewidth
0.7212 0.51342 Mdot
0 0 0 setrgbcolor
0.01429 setlinewidth
0.50796 0.33601 Mdot
0 0 0 setrgbcolor
0.01272 setlinewidth
0.5289 0.33272 Mdot
0 0 0 setrgbcolor
0.01461 setlinewidth
0.41133 0.36562 Mdot
0 0 0 setrgbcolor
0.01294 setlinewidth
0.52421 0.33184 Mdot
0 0 0 setrgbcolor
0.01493 setlinewidth
0.49269 0.33409 Mdot
0 0 0 setrgbcolor
0.00932 setlinewidth
0.71369 0.46038 Mdot
0 0 0 setrgbcolor
0.01578 setlinewidth
0.52265 0.32648 Mdot
0 0 0 setrgbcolor
0.01293 setlinewidth
0.45139 0.33858 Mdot
0 0 0 setrgbcolor
0.01625 setlinewidth
0.51319 0.32564 Mdot
0 0 0 setrgbcolor
0.01742 setlinewidth
0.53545 0.32481 Mdot
0 0 0 setrgbcolor
0.01007 setlinewidth
0.43503 0.34328 Mdot
0 0 0 setrgbcolor
0.00995 setlinewidth
0.38333 0.69671 Mdot
0 0 0 setrgbcolor
0.01187 setlinewidth
0.61966 0.7267 Mdot
0 0 0 setrgbcolor
0.01425 setlinewidth
0.39831 0.35743 Mdot
0 0 0 setrgbcolor
0.01515 setlinewidth
0.66674 0.37062 Mdot
0 0 0 setrgbcolor
0.01775 setlinewidth
0.3007 0.56159 Mdot
0 0 0 setrgbcolor
0.00842 setlinewidth
0.47852 0.31502 Mdot
0 0 0 setrgbcolor
0.01099 setlinewidth
0.72856 0.62824 Mdot
0 0 0 setrgbcolor
0.01616 setlinewidth
0.57584 0.31311 Mdot
0 0 0 setrgbcolor
0.01919 setlinewidth
0.74031 0.45616 Mdot
0 0 0 setrgbcolor
0.01101 setlinewidth
0.71014 0.39896 Mdot
0 0 0 setrgbcolor
0.01802 setlinewidth
0.63825 0.3342 Mdot
0 0 0 setrgbcolor
0.0094 setlinewidth
0.42883 0.32288 Mdot
0 0 0 setrgbcolor
0.00881 setlinewidth
0.44923 0.31479 Mdot
0 0 0 setrgbcolor
0.01369 setlinewidth
0.4539 0.75766 Mdot
0 0 0 setrgbcolor
0.00973 setlinewidth
0.59611 0.31279 Mdot
0 0 0 setrgbcolor
0.01618 setlinewidth
0.66176 0.34565 Mdot
0 0 0 setrgbcolor
0.01498 setlinewidth
0.28831 0.54822 Mdot
0 0 0 setrgbcolor
0.01508 setlinewidth
0.38812 0.34023 Mdot
0 0 0 setrgbcolor
0.01255 setlinewidth
0.32273 0.66314 Mdot
0 0 0 setrgbcolor
0.0189 setlinewidth
0.5076 0.77252 Mdot
0 0 0 setrgbcolor
0.01197 setlinewidth
0.32809 0.67406 Mdot
0 0 0 setrgbcolor
0.00546 setlinewidth
0.43133 0.75814 Mdot
0 0 0 setrgbcolor
0.0176 setlinewidth
0.59623 0.30561 Mdot
0 0 0 setrgbcolor
0.01507 setlinewidth
0.28226 0.55136 Mdot
0 0 0 setrgbcolor
0.00657 setlinewidth
0.56776 0.29731 Mdot
0 0 0 setrgbcolor
0.01793 setlinewidth
0.3621 0.35416 Mdot
0 0 0 setrgbcolor
0.01808 setlinewidth
0.37384 0.34401 Mdot
0 0 0 setrgbcolor
0.0133 setlinewidth
0.51713 0.77836 Mdot
1 1 1 setrgbcolor
0.01017 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01564 setlinewidth
0.34733 0.7076 Mdot
0 0 0 setrgbcolor
0.01566 setlinewidth
0.34605 0.36209 Mdot
0 0 0 setrgbcolor
0.00883 setlinewidth
0.76194 0.46734 Mdot
0 0 0 setrgbcolor
0.00782 setlinewidth
0.53357 0.28589 Mdot
0 0 0 setrgbcolor
0.01599 setlinewidth
0.27678 0.58254 Mdot
0 0 0 setrgbcolor
0.01782 setlinewidth
0.6241 0.30495 Mdot
0 0 0 setrgbcolor
0.01207 setlinewidth
0.27316 0.56989 Mdot
0 0 0 setrgbcolor
0.00887 setlinewidth
0.58155 0.28942 Mdot
0 0 0 setrgbcolor
0.01876 setlinewidth
0.55006 0.28384 Mdot
0 0 0 setrgbcolor
0.00683 setlinewidth
0.5493 0.28369 Mdot
0 0 0 setrgbcolor
0.01641 setlinewidth
0.56662 0.28576 Mdot
0 0 0 setrgbcolor
0.01493 setlinewidth
0.37454 0.74225 Mdot
0 0 0 setrgbcolor
0.01571 setlinewidth
0.60872 0.29476 Mdot
0 0 0 setrgbcolor
0.01023 setlinewidth
0.592 0.78164 Mdot
0 0 0 setrgbcolor
0.00663 setlinewidth
0.73633 0.67713 Mdot
0 0 0 setrgbcolor
0.01197 setlinewidth
0.55587 0.28067 Mdot
0 0 0 setrgbcolor
0.00965 setlinewidth
0.26607 0.54758 Mdot
0 0 0 setrgbcolor
0.00814 setlinewidth
0.30844 0.39305 Mdot
0 0 0 setrgbcolor
0.01004 setlinewidth
0.26947 0.48703 Mdot
0 0 0 setrgbcolor
0.01797 setlinewidth
0.351 0.34049 Mdot
0 0 0 setrgbcolor
0.00811 setlinewidth
0.76186 0.6422 Mdot
0 0 0 setrgbcolor
0.01369 setlinewidth
0.42699 0.7797 Mdot
0 0 0 setrgbcolor
0.01665 setlinewidth
0.454 0.78929 Mdot
0 0 0 setrgbcolor
0.00515 setlinewidth
0.55969 0.27447 Mdot
0 0 0 setrgbcolor
0.01768 setlinewidth
0.37695 0.31503 Mdot
0 0 0 setrgbcolor
0.00643 setlinewidth
0.52175 0.80014 Mdot
0 0 0 setrgbcolor
0.0194 setlinewidth
0.44935 0.78968 Mdot
0 0 0 setrgbcolor
0.01887 setlinewidth
0.47432 0.79607 Mdot
0 0 0 setrgbcolor
0.01886 setlinewidth
0.26248 0.5872 Mdot
0 0 0 setrgbcolor
0.01227 setlinewidth
0.27468 0.63017 Mdot
0 0 0 setrgbcolor
0.00806 setlinewidth
0.29082 0.40573 Mdot
0 0 0 setrgbcolor
0.00783 setlinewidth
0.52935 0.80137 Mdot
0 0 0 setrgbcolor
0.01075 setlinewidth
0.27212 0.44583 Mdot
0 0 0 setrgbcolor
0.01091 setlinewidth
0.26574 0.46595 Mdot
0 0 0 setrgbcolor
0.00985 setlinewidth
0.56125 0.27149 Mdot
0 0 0 setrgbcolor
0.01734 setlinewidth
0.41353 0.29208 Mdot
0 0 0 setrgbcolor
0.00771 setlinewidth
0.42879 0.28566 Mdot
0 0 0 setrgbcolor
0.01997 setlinewidth
0.78129 0.46745 Mdot
0 0 0 setrgbcolor
0.00894 setlinewidth
0.71312 0.34806 Mdot
0 0 0 setrgbcolor
0.01472 setlinewidth
0.709 0.34398 Mdot
0 0 0 setrgbcolor
0.01596 setlinewidth
0.56006 0.79958 Mdot
0 0 0 setrgbcolor
0.01806 setlinewidth
0.2611 0.48591 Mdot
0 0 0 setrgbcolor
0.01798 setlinewidth
0.3948 0.30172 Mdot
0 0 0 setrgbcolor
0.01264 setlinewidth
0.78743 0.50173 Mdot
0 0 0 setrgbcolor
0.01957 setlinewidth
0.77701 0.61564 Mdot
0 0 0 setrgbcolor
0.00691 setlinewidth
0.76947 0.63591 Mdot
0 0 0 setrgbcolor
0.01906 setlinewidth
0.26037 0.57352 Mdot
0 0 0 setrgbcolor
0.00666 setlinewidth
0.73553 0.69418 Mdot
0 0 0 setrgbcolor
0.01497 setlinewidth
0.55807 0.79755 Mdot
0 0 0 setrgbcolor
0.01136 setlinewidth
0.26251 0.5765 Mdot
1 1 1 setrgbcolor
0.01017 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.01892 setlinewidth
0.75163 0.40383 Mdot
0 0 0 setrgbcolor
0.00726 setlinewidth
0.35326 0.73694 Mdot
0 0 0 setrgbcolor
0.00911 setlinewidth
0.28902 0.65611 Mdot
0 0 0 setrgbcolor
0.00863 setlinewidth
0.68367 0.33019 Mdot
0 0 0 setrgbcolor
0.01658 setlinewidth
0.63157 0.7722 Mdot
0 0 0 setrgbcolor
0.01771 setlinewidth
0.33652 0.71183 Mdot
0 0 0 setrgbcolor
0.01094 setlinewidth
0.36955 0.74078 Mdot
0 0 0 setrgbcolor
0.0181 setlinewidth
0.50532 0.27965 Mdot
0 0 0 setrgbcolor
0.0104 setlinewidth
0.3476 0.72084 Mdot
0 0 0 setrgbcolor
0.00739 setlinewidth
0.42805 0.7684 Mdot
0 0 0 setrgbcolor
0.00739 setlinewidth
0.5166 0.78632 Mdot
0 0 0 setrgbcolor
0.01694 setlinewidth
0.74621 0.42066 Mdot
0 0 0 setrgbcolor
0.00608 setlinewidth
0.72089 0.38229 Mdot
0 0 0 setrgbcolor
0.00534 setlinewidth
0.50579 0.78431 Mdot
0 0 0 setrgbcolor
0.01222 setlinewidth
0.53971 0.78326 Mdot
0 0 0 setrgbcolor
0.01317 setlinewidth
0.69135 0.71742 Mdot
0 0 0 setrgbcolor
0.01967 setlinewidth
0.35187 0.71247 Mdot
0 0 0 setrgbcolor
0.00829 setlinewidth
0.63736 0.7523 Mdot
0 0 0 setrgbcolor
0.00973 setlinewidth
0.4791 0.7764 Mdot
0 0 0 setrgbcolor
0.01342 setlinewidth
0.76667 0.51634 Mdot
0 0 0 setrgbcolor
0.01167 setlinewidth
0.75263 0.46156 Mdot
0 0 0 setrgbcolor
0.00789 setlinewidth
0.42847 0.75648 Mdot
0 0 0 setrgbcolor
0.01518 setlinewidth
0.36249 0.71427 Mdot
0 0 0 setrgbcolor
0.01865 setlinewidth
0.45971 0.76356 Mdot
0 0 0 setrgbcolor
0.01134 setlinewidth
0.52301 0.76797 Mdot
0 0 0 setrgbcolor
0.00933 setlinewidth
0.52638 0.76775 Mdot
0 0 0 setrgbcolor
0.01066 setlinewidth
0.54946 0.76226 Mdot
0 0 0 setrgbcolor
0.01017 setlinewidth
0.52036 0.76222 Mdot
0 0 0 setrgbcolor
0.0142 setlinewidth
0.56922 0.7534 Mdot
0 0 0 setrgbcolor
0.00901 setlinewidth
0.53995 0.75753 Mdot
0 0 0 setrgbcolor
0.01647 setlinewidth
0.5209 0.75587 Mdot
0 0 0 setrgbcolor
0.01696 setlinewidth
0.47845 0.75077 Mdot
0 0 0 setrgbcolor
0.00891 setlinewidth
0.66422 0.70266 Mdot
0 0 0 setrgbcolor
0.01968 setlinewidth
0.73251 0.47656 Mdot
0 0 0 setrgbcolor
0.0175 setlinewidth
0.45165 0.73994 Mdot
0 0 0 setrgbcolor
0.00718 setlinewidth
0.57599 0.73849 Mdot
0 0 0 setrgbcolor
0.01467 setlinewidth
0.43497 0.72375 Mdot
0 0 0 setrgbcolor
0.0088 setlinewidth
0.39833 0.69194 Mdot
0 0 0 setrgbcolor
0.01913 setlinewidth
0.45809 0.722 Mdot
0 0 0 setrgbcolor
0.01498 setlinewidth
0.57229 0.72614 Mdot
0 0 0 setrgbcolor
0.00799 setlinewidth
0.69477 0.59986 Mdot
0 0 0 setrgbcolor
0.00596 setlinewidth
0.35145 0.47837 Mdot
0 0 0 setrgbcolor
0.01979 setlinewidth
0.64501 0.66223 Mdot
0 0 0 setrgbcolor
0.01636 setlinewidth
0.46894 0.37073 Mdot
0 0 0 setrgbcolor
0.00537 setlinewidth
0.51353 0.70705 Mdot
0 0 0 setrgbcolor
0.0162 setlinewidth
0.63988 0.66113 Mdot
0 0 0 setrgbcolor
0.01063 setlinewidth
0.41156 0.41105 Mdot
0 0 0 setrgbcolor
0.01535 setlinewidth
0.41964 0.66594 Mdot
0 0 0 setrgbcolor
0.01074 setlinewidth
0.43592 0.66795 Mdot
0 0 0 setrgbcolor
0.01759 setlinewidth
0.61479 0.65051 Mdot
0 0 0 setrgbcolor
0.01168 setlinewidth
0.4583 0.40947 Mdot
0 0 0 setrgbcolor
0.01054 setlinewidth
0.50225 0.40135 Mdot
0 0 0 setrgbcolor
0.00966 setlinewidth
0.46616 0.65766 Mdot
0 0 0 setrgbcolor
0.01541 setlinewidth
0.39034 0.55042 Mdot
0 0 0 setrgbcolor
0.01203 setlinewidth
0.65108 0.56049 Mdot
0 0 0 setrgbcolor
0.01734 setlinewidth
0.46486 0.43904 Mdot
0 0 0 setrgbcolor
0.01276 setlinewidth
0.47859 0.62909 Mdot
0 0 0 setrgbcolor
0.01994 setlinewidth
0.51432 0.43294 Mdot
0 0 0 setrgbcolor
0.01749 setlinewidth
0.61082 0.57462 Mdot
0 0 0 setrgbcolor
0.01085 setlinewidth
0.5945 0.49515 Mdot
0 0 0 setrgbcolor
0.01624 setlinewidth
0.46034 0.50421 Mdot
0 0 0 setrgbcolor
0.01332 setlinewidth
0.54044 0.4973 Mdot
0 0 0 setrgbcolor
0.01229 setlinewidth
0.55913 0.54328 Mdot
0 0 0 setrgbcolor
0.01545 setlinewidth
0.55126 0.54197 Mdot
0 0 0 setrgbcolor
0.01802 setlinewidth
0.53412 0.53878 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 50; pictureWidth = 282; pictureHeight = 277; endGroup; endGroup; endGroup]
%!
%%Creator: Mathematica
Mpstart % Start of picture
% Scaling calculations
[
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] Mscale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
0 0 moveto
1 0 lineto
1 1 lineto
0 1 lineto
closepath
clip
newpath
%%Object: Graphics3D
gsave
0.002 setlinewidth
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.06132 0.72899 lineto
stroke
0.41259 0.97619 moveto
0.42805 0.53407 lineto
stroke
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.42805 0.53407 moveto
0.41259 0.97619 lineto
stroke
0.42805 0.53407 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.13892 0.23925 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.42805 0.53407 lineto
stroke
0.87475 0.38789 moveto
0.65131 0.02381 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
grestore
0 0 0 setrgbcolor
0.00769 setlinewidth
0.52392 0.51907 Mdot
0 0 0 setrgbcolor
0.01738 setlinewidth
0.52071 0.51599 Mdot
0 0 0 setrgbcolor
0.00632 setlinewidth
0.5362 0.47273 Mdot
0 0 0 setrgbcolor
0.01944 setlinewidth
0.57871 0.57248 Mdot
0 0 0 setrgbcolor
0.00879 setlinewidth
0.43304 0.53879 Mdot
0 0 0 setrgbcolor
0.00632 setlinewidth
0.62123 0.52496 Mdot
0 0 0 setrgbcolor
0.01816 setlinewidth
0.41965 0.52068 Mdot
0 0 0 setrgbcolor
0.00946 setlinewidth
0.54634 0.40719 Mdot
0 0 0 setrgbcolor
0.01061 setlinewidth
0.63949 0.46924 Mdot
0 0 0 setrgbcolor
0.01856 setlinewidth
0.36624 0.53901 Mdot
0 0 0 setrgbcolor
0.01855 setlinewidth
0.68318 0.53894 Mdot
0 0 0 setrgbcolor
0.0116 setlinewidth
0.38474 0.45426 Mdot
0 0 0 setrgbcolor
0.00985 setlinewidth
0.49387 0.36963 Mdot
0 0 0 setrgbcolor
0.01414 setlinewidth
0.64837 0.41685 Mdot
0 0 0 setrgbcolor
0.00931 setlinewidth
0.54205 0.36337 Mdot
0 0 0 setrgbcolor
0.01849 setlinewidth
0.67716 0.45326 Mdot
0 0 0 setrgbcolor
0.01432 setlinewidth
0.5337 0.36084 Mdot
0 0 0 setrgbcolor
0.01316 setlinewidth
0.47158 0.70249 Mdot
0 0 0 setrgbcolor
0.00819 setlinewidth
0.69455 0.58247 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.47013 0.36493 Mdot
0 0 0 setrgbcolor
0.01705 setlinewidth
0.46152 0.3657 Mdot
0 0 0 setrgbcolor
0.01351 setlinewidth
0.64174 0.6723 Mdot
0 0 0 setrgbcolor
0.00925 setlinewidth
0.70311 0.57261 Mdot
0 0 0 setrgbcolor
0.01451 setlinewidth
0.48411 0.71617 Mdot
0 0 0 setrgbcolor
0.00591 setlinewidth
0.50439 0.35036 Mdot
0 0 0 setrgbcolor
0.01902 setlinewidth
0.5303 0.34818 Mdot
0 0 0 setrgbcolor
0.01324 setlinewidth
0.64609 0.39396 Mdot
0 0 0 setrgbcolor
0.00907 setlinewidth
0.62669 0.37887 Mdot
0 0 0 setrgbcolor
0.01532 setlinewidth
0.70676 0.48611 Mdot
0 0 0 setrgbcolor
0.0197 setlinewidth
0.68245 0.43134 Mdot
0 0 0 setrgbcolor
0.00531 setlinewidth
0.71154 0.56395 Mdot
0 0 0 setrgbcolor
0.00872 setlinewidth
0.41409 0.37647 Mdot
0 0 0 setrgbcolor
0.00563 setlinewidth
0.54343 0.33599 Mdot
0 0 0 setrgbcolor
0.0153 setlinewidth
0.52752 0.33448 Mdot
0 0 0 setrgbcolor
0.00536 setlinewidth
0.58869 0.34508 Mdot
0 0 0 setrgbcolor
0.00903 setlinewidth
0.32893 0.59358 Mdot
0 0 0 setrgbcolor
0.01499 setlinewidth
0.53159 0.33197 Mdot
0 0 0 setrgbcolor
0.01451 setlinewidth
0.54499 0.33282 Mdot
0 0 0 setrgbcolor
0.01548 setlinewidth
0.52187 0.33091 Mdot
0 0 0 setrgbcolor
0.00564 setlinewidth
0.43346 0.71963 Mdot
0 0 0 setrgbcolor
0.00801 setlinewidth
0.52471 0.32926 Mdot
0 0 0 setrgbcolor
0.01112 setlinewidth
0.5071 0.32949 Mdot
0 0 0 setrgbcolor
0.01775 setlinewidth
0.43217 0.34972 Mdot
0 0 0 setrgbcolor
0.01602 setlinewidth
0.44828 0.34207 Mdot
0 0 0 setrgbcolor
0.01915 setlinewidth
0.49053 0.33022 Mdot
0 0 0 setrgbcolor
0.01452 setlinewidth
0.72954 0.55982 Mdot
0 0 0 setrgbcolor
0.01806 setlinewidth
0.39619 0.37052 Mdot
0 0 0 setrgbcolor
0.01587 setlinewidth
0.53986 0.3272 Mdot
0 0 0 setrgbcolor
0.00696 setlinewidth
0.52712 0.32247 Mdot
0 0 0 setrgbcolor
0.00609 setlinewidth
0.52203 0.3224 Mdot
0 0 0 setrgbcolor
0.01581 setlinewidth
0.31096 0.58213 Mdot
0 0 0 setrgbcolor
0.01889 setlinewidth
0.50827 0.31803 Mdot
0 0 0 setrgbcolor
0.01682 setlinewidth
0.51826 0.31722 Mdot
0 0 0 setrgbcolor
0.01704 setlinewidth
0.53044 0.31327 Mdot
0 0 0 setrgbcolor
0.01733 setlinewidth
0.73564 0.60532 Mdot
0 0 0 setrgbcolor
0.00972 setlinewidth
0.73959 0.47802 Mdot
0 0 0 setrgbcolor
0.01671 setlinewidth
0.71469 0.65173 Mdot
0 0 0 setrgbcolor
0.00952 setlinewidth
0.63535 0.34027 Mdot
0 0 0 setrgbcolor
0.00542 setlinewidth
0.30298 0.58638 Mdot
0 0 0 setrgbcolor
0.01547 setlinewidth
0.70468 0.67028 Mdot
0 0 0 setrgbcolor
0.01751 setlinewidth
0.36058 0.6941 Mdot
0 0 0 setrgbcolor
0.01871 setlinewidth
0.71235 0.66133 Mdot
0 0 0 setrgbcolor
0.01097 setlinewidth
0.46733 0.31343 Mdot
0 0 0 setrgbcolor
0.00903 setlinewidth
0.36677 0.70456 Mdot
0 0 0 setrgbcolor
0.01815 setlinewidth
0.41624 0.33031 Mdot
0 0 0 setrgbcolor
0.00877 setlinewidth
0.37671 0.35512 Mdot
0 0 0 setrgbcolor
0.00671 setlinewidth
0.43526 0.31847 Mdot
0 0 0 setrgbcolor
0.01638 setlinewidth
0.35101 0.37382 Mdot
0 0 0 setrgbcolor
0.01752 setlinewidth
0.36088 0.36152 Mdot
0 0 0 setrgbcolor
0.01027 setlinewidth
0.50708 0.77372 Mdot
0 0 0 setrgbcolor
0.0164 setlinewidth
0.75566 0.47887 Mdot
0 0 0 setrgbcolor
0.01874 setlinewidth
0.29756 0.61909 Mdot
0 0 0 setrgbcolor
0.01475 setlinewidth
0.67841 0.71912 Mdot
0 0 0 setrgbcolor
0.01806 setlinewidth
0.3339 0.38473 Mdot
0 0 0 setrgbcolor
0.01811 setlinewidth
0.73796 0.42414 Mdot
0 0 0 setrgbcolor
0.01704 setlinewidth
0.38758 0.73652 Mdot
0 0 0 setrgbcolor
0.01002 setlinewidth
0.2913 0.60687 Mdot
0 0 0 setrgbcolor
0.0191 setlinewidth
0.56446 0.29426 Mdot
0 0 0 setrgbcolor
0.00559 setlinewidth
0.48115 0.77739 Mdot
0 0 0 setrgbcolor
0.00559 setlinewidth
0.67065 0.33797 Mdot
0 0 0 setrgbcolor
0.01775 setlinewidth
0.56193 0.78245 Mdot
0 0 0 setrgbcolor
0.01857 setlinewidth
0.2778 0.58558 Mdot
0 0 0 setrgbcolor
0.01425 setlinewidth
0.27147 0.52391 Mdot
0 0 0 setrgbcolor
0.00828 setlinewidth
0.58308 0.29041 Mdot
0 0 0 setrgbcolor
0.01428 setlinewidth
0.29577 0.42269 Mdot
0 0 0 setrgbcolor
0.01434 setlinewidth
0.63088 0.30513 Mdot
0 0 0 setrgbcolor
0.00677 setlinewidth
0.5702 0.78752 Mdot
0 0 0 setrgbcolor
0.01839 setlinewidth
0.54829 0.27961 Mdot
0 0 0 setrgbcolor
0.01858 setlinewidth
0.41475 0.76892 Mdot
1 1 1 setrgbcolor
0.01697 setlinewidth
0.15656 0.25284 Mdot
0 0 0 setrgbcolor
0.01394 setlinewidth
0.57925 0.28307 Mdot
0 0 0 setrgbcolor
0.01165 setlinewidth
0.65592 0.31299 Mdot
0 0 0 setrgbcolor
0.01595 setlinewidth
0.77434 0.59993 Mdot
0 0 0 setrgbcolor
0.01881 setlinewidth
0.7164 0.36044 Mdot
0 0 0 setrgbcolor
0.01252 setlinewidth
0.32737 0.36245 Mdot
0 0 0 setrgbcolor
0.01772 setlinewidth
0.50799 0.27417 Mdot
0 0 0 setrgbcolor
0.01047 setlinewidth
0.75753 0.41572 Mdot
0 0 0 setrgbcolor
0.0095 setlinewidth
0.52249 0.26917 Mdot
0 0 0 setrgbcolor
0.01622 setlinewidth
0.52165 0.26915 Mdot
0 0 0 setrgbcolor
0.01862 setlinewidth
0.5394 0.26816 Mdot
0 0 0 setrgbcolor
0.00529 setlinewidth
0.5556 0.26923 Mdot
0 0 0 setrgbcolor
0.0165 setlinewidth
0.27072 0.6269 Mdot
0 0 0 setrgbcolor
0.01773 setlinewidth
0.60254 0.27763 Mdot
0 0 0 setrgbcolor
0.00841 setlinewidth
0.2885 0.66878 Mdot
0 0 0 setrgbcolor
0.00828 setlinewidth
0.27068 0.43902 Mdot
0 0 0 setrgbcolor
0.00687 setlinewidth
0.52531 0.26497 Mdot
0 0 0 setrgbcolor
0.00713 setlinewidth
0.34403 0.33241 Mdot
0 0 0 setrgbcolor
0.01687 setlinewidth
0.25725 0.48261 Mdot
0 0 0 setrgbcolor
0.00964 setlinewidth
0.25379 0.50395 Mdot
0 0 0 setrgbcolor
0.0151 setlinewidth
0.58264 0.26994 Mdot
0 0 0 setrgbcolor
0.0114 setlinewidth
0.46606 0.80145 Mdot
0 0 0 setrgbcolor
0.01496 setlinewidth
0.64074 0.78203 Mdot
0 0 0 setrgbcolor
0.01065 setlinewidth
0.49398 0.80807 Mdot
0 0 0 setrgbcolor
0.0111 setlinewidth
0.77484 0.42443 Mdot
0 0 0 setrgbcolor
0.01104 setlinewidth
0.48706 0.80927 Mdot
0 0 0 setrgbcolor
0.01961 setlinewidth
0.52198 0.25819 Mdot
0 0 0 setrgbcolor
0.00556 setlinewidth
0.24596 0.52528 Mdot
0 0 0 setrgbcolor
0.00835 setlinewidth
0.51251 0.81286 Mdot
0 0 0 setrgbcolor
0.00691 setlinewidth
0.37095 0.30294 Mdot
0 0 0 setrgbcolor
0.00812 setlinewidth
0.56221 0.81112 Mdot
0 0 0 setrgbcolor
0.01054 setlinewidth
0.7761 0.6519 Mdot
0 0 0 setrgbcolor
0.01219 setlinewidth
0.38444 0.29371 Mdot
0 0 0 setrgbcolor
0.00873 setlinewidth
0.25522 0.61426 Mdot
0 0 0 setrgbcolor
0.00566 setlinewidth
0.5676 0.81169 Mdot
0 0 0 setrgbcolor
0.01942 setlinewidth
0.34841 0.3164 Mdot
0 0 0 setrgbcolor
0.00771 setlinewidth
0.25506 0.61718 Mdot
0 0 0 setrgbcolor
0.01591 setlinewidth
0.51695 0.25514 Mdot
0 0 0 setrgbcolor
0.00766 setlinewidth
0.79316 0.61134 Mdot
0 0 0 setrgbcolor
0.01595 setlinewidth
0.29195 0.69438 Mdot
0 0 0 setrgbcolor
0.00542 setlinewidth
0.36714 0.76849 Mdot
0 0 0 setrgbcolor
0.01733 setlinewidth
0.59207 0.80662 Mdot
0 0 0 setrgbcolor
0.01509 setlinewidth
0.34048 0.74549 Mdot
1 1 1 setrgbcolor
0.01697 setlinewidth
0.91812 0.83983 Mdot
0 0 0 setrgbcolor
0.00623 setlinewidth
0.35167 0.75337 Mdot
0 0 0 setrgbcolor
0.013 setlinewidth
0.37712 0.77096 Mdot
0 0 0 setrgbcolor
0.00667 setlinewidth
0.67609 0.30444 Mdot
0 0 0 setrgbcolor
0.01885 setlinewidth
0.68107 0.30801 Mdot
0 0 0 setrgbcolor
0.01822 setlinewidth
0.58419 0.80525 Mdot
0 0 0 setrgbcolor
0.01292 setlinewidth
0.77542 0.42264 Mdot
0 0 0 setrgbcolor
0.00604 setlinewidth
0.44263 0.27482 Mdot
0 0 0 setrgbcolor
0.00826 setlinewidth
0.34936 0.74471 Mdot
0 0 0 setrgbcolor
0.01843 setlinewidth
0.43639 0.79231 Mdot
0 0 0 setrgbcolor
0.01325 setlinewidth
0.78316 0.45849 Mdot
0 0 0 setrgbcolor
0.00585 setlinewidth
0.78971 0.58192 Mdot
0 0 0 setrgbcolor
0.01353 setlinewidth
0.78429 0.60477 Mdot
0 0 0 setrgbcolor
0.01911 setlinewidth
0.75534 0.67208 Mdot
0 0 0 setrgbcolor
0.01398 setlinewidth
0.35733 0.74543 Mdot
0 0 0 setrgbcolor
0.01866 setlinewidth
0.65184 0.76958 Mdot
0 0 0 setrgbcolor
0.00796 setlinewidth
0.72389 0.36066 Mdot
0 0 0 setrgbcolor
0.01477 setlinewidth
0.63701 0.29509 Mdot
0 0 0 setrgbcolor
0.01032 setlinewidth
0.52833 0.79981 Mdot
0 0 0 setrgbcolor
0.01954 setlinewidth
0.51614 0.79916 Mdot
0 0 0 setrgbcolor
0.01583 setlinewidth
0.42934 0.78044 Mdot
0 0 0 setrgbcolor
0.01021 setlinewidth
0.48546 0.7945 Mdot
0 0 0 setrgbcolor
0.01125 setlinewidth
0.55005 0.79382 Mdot
0 0 0 setrgbcolor
0.01503 setlinewidth
0.46025 0.78395 Mdot
0 0 0 setrgbcolor
0.00545 setlinewidth
0.64473 0.74871 Mdot
0 0 0 setrgbcolor
0.00567 setlinewidth
0.67687 0.34392 Mdot
0 0 0 setrgbcolor
0.00621 setlinewidth
0.52352 0.78061 Mdot
0 0 0 setrgbcolor
0.0069 setlinewidth
0.52686 0.77996 Mdot
0 0 0 setrgbcolor
0.01686 setlinewidth
0.71022 0.38018 Mdot
0 0 0 setrgbcolor
0.01733 setlinewidth
0.69745 0.70429 Mdot
0 0 0 setrgbcolor
0.01806 setlinewidth
0.4416 0.7611 Mdot
0 0 0 setrgbcolor
0.01697 setlinewidth
0.51787 0.77513 Mdot
0 0 0 setrgbcolor
0.00701 setlinewidth
0.47128 0.7688 Mdot
0 0 0 setrgbcolor
0.01694 setlinewidth
0.54822 0.77136 Mdot
0 0 0 setrgbcolor
0.00527 setlinewidth
0.41997 0.74672 Mdot
0 0 0 setrgbcolor
0.01647 setlinewidth
0.37666 0.71885 Mdot
0 0 0 setrgbcolor
0.01039 setlinewidth
0.51537 0.76862 Mdot
0 0 0 setrgbcolor
0.0095 setlinewidth
0.53584 0.76782 Mdot
0 0 0 setrgbcolor
0.01022 setlinewidth
0.29416 0.5066 Mdot
0 0 0 setrgbcolor
0.00949 setlinewidth
0.56531 0.75966 Mdot
0 0 0 setrgbcolor
0.008 setlinewidth
0.7438 0.4789 Mdot
0 0 0 setrgbcolor
0.01684 setlinewidth
0.71857 0.42293 Mdot
0 0 0 setrgbcolor
0.01804 setlinewidth
0.44036 0.74209 Mdot
0 0 0 setrgbcolor
0.01602 setlinewidth
0.56616 0.74345 Mdot
0 0 0 setrgbcolor
0.00778 setlinewidth
0.34067 0.42818 Mdot
0 0 0 setrgbcolor
0.00821 setlinewidth
0.65503 0.69339 Mdot
0 0 0 setrgbcolor
0.01066 setlinewidth
0.38714 0.68972 Mdot
0 0 0 setrgbcolor
0.01584 setlinewidth
0.39274 0.37699 Mdot
0 0 0 setrgbcolor
0.01234 setlinewidth
0.55719 0.73126 Mdot
0 0 0 setrgbcolor
0.01285 setlinewidth
0.40241 0.68969 Mdot
0 0 0 setrgbcolor
0.00549 setlinewidth
0.69097 0.44288 Mdot
0 0 0 setrgbcolor
0.01188 setlinewidth
0.33585 0.57518 Mdot
0 0 0 setrgbcolor
0.01349 setlinewidth
0.48892 0.71962 Mdot
0 0 0 setrgbcolor
0.01384 setlinewidth
0.38306 0.41913 Mdot
0 0 0 setrgbcolor
0.0164 setlinewidth
0.42786 0.67513 Mdot
0 0 0 setrgbcolor
0.01551 setlinewidth
0.42513 0.40347 Mdot
0 0 0 setrgbcolor
0.00621 setlinewidth
0.39075 0.44886 Mdot
0 0 0 setrgbcolor
0.00884 setlinewidth
0.6183 0.65417 Mdot
0 0 0 setrgbcolor
0.01878 setlinewidth
0.61197 0.65381 Mdot
0 0 0 setrgbcolor
0.01381 setlinewidth
0.66219 0.58059 Mdot
0 0 0 setrgbcolor
0.0193 setlinewidth
0.43269 0.64398 Mdot
0 0 0 setrgbcolor
0.01601 setlinewidth
0.43865 0.43452 Mdot
0 0 0 setrgbcolor
0.01807 setlinewidth
0.39284 0.51729 Mdot
0 0 0 setrgbcolor
0.01284 setlinewidth
0.5803 0.64652 Mdot
0 0 0 setrgbcolor
0.01622 setlinewidth
0.6018 0.54621 Mdot
0 0 0 setrgbcolor
0.01794 setlinewidth
0.47135 0.49764 Mdot
0 0 0 setrgbcolor
0.0175 setlinewidth
0.47065 0.542 Mdot
0 0 0 setrgbcolor
0.01796 setlinewidth
0.52841 0.48662 Mdot
0 0 0 setrgbcolor
0.00602 setlinewidth
0.55871 0.56757 Mdot
0 0 0 setrgbcolor
0.00598 setlinewidth
0.4889 0.54268 Mdot
0 0 0 setrgbcolor
0.0061 setlinewidth
0.49736 0.54282 Mdot
0 setgray
0.002 setlinewidth
0.65131 0.02381 moveto
0.87475 0.38789 lineto
stroke
0.65131 0.02381 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
0.93868 0.85568 moveto
0.87475 0.38789 lineto
stroke
0.13892 0.23925 moveto
0.06132 0.72899 lineto
stroke
0.13892 0.23925 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.65131 0.02381 lineto
stroke
0.68112 0.53747 moveto
0.06132 0.72899 lineto
stroke
0.06132 0.72899 moveto
0.68112 0.53747 lineto
stroke
0.06132 0.72899 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.41259 0.97619 lineto
stroke
0.93868 0.85568 moveto
0.68112 0.53747 lineto
stroke
% End of Graphics
Mpend % End of picture
^*)
