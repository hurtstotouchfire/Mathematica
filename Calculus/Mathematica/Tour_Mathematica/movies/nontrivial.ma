(*^

::[paletteColors = 128; currentKernel; 
	fontset = title, nohscroll, center, bold, L3,  24, "Times"; ;
	fontset = subtitle, nohscroll, center, bold,  20, "Times"; ;
	fontset = subsubtitle, nohscroll, center, bold,  14, "Times"; ;
	fontset = section, nohscroll, grayBox, bold,  18, "Times"; ;
	fontset = subsection, nohscroll, blackBox, bold,  14, "Times"; ;
	fontset = subsubsection, nohscroll, whiteBox, bold,  12, "Times"; ;
	fontset = text,  14, "Times"; ;
	fontset = smalltext,  12;
	fontset = input, nowordwrap, bold,  18, "Courier"; ;
	fontset = output, nowordwrap,  18, "Courier"; ;
	fontset = message, nowordwrap, R65535,  18, "Courier"; ;
	fontset = print, nowordwrap,  18, "Courier"; ;
	fontset = info, nowordwrap,  18, "Courier"; ;
	fontset = postscript, nowordwrap,  18, "Courier"; ;
	fontset = name, nohscroll, italic, B65535,  12, "Times"; ;
	fontset = header,  10, "Times"; ;
	fontset = Left Header, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, italic, L1,  12, "Times"; ;
	fontset = footer, center,  12;
	fontset = Left Footer, inactive, nohscroll, noKeepOnOnePage, preserveAspect, center, M7, italic, L1,  12, "Times"; ;
	fontset = help,  10, "Times"; ;
	fontset = clipboard,  12;
	fontset = completions,  12;
	fontset = special1,  12;
	fontset = special2, center,  12;
	fontset = special3, right,  12;
	fontset = special4,  12;
	fontset = special5,  12;
	next21StandardFontEncoding; ]
:[font = title; inactive; startGroup; ]
Non-Trivial Graphics in Mathematica
by Theodore W. Gray
;[s]
3:0,0;24,1;36,2;55,-1;
3:1,21,16,Times,1,24,0,0,0;1,22,17,Times,3,24,0,0,0;1,10,8,Times,2,12,0,0,0;
:[font = text; inactive; ]
     Producing complex and beautiful two and three dimensional graphics using the functions Plot, Plot3D, ContourPlot, DensityPlot, etc is trivial in Mathematica.  
     In this Notebook we will concentrate on the less well known Graphics and Graphics3D functions, which allow much finer control over the graphics produced by Mathematica.
;[s]
17:0,0;92,1;96,2;98,3;104,4;106,5;117,6;119,7;130,8;150,9;161,10;230,11;238,12;243,13;253,14;326,15;337,16;339,-1;
17:1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,13,10,Times,2,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,13,10,Times,2,14,0,0,0;1,13,10,Times,0,14,0,0,0;
:[font = section; inactive; Cclosed; startGroup; ]
Introduction to Graphics Primitives
:[font = text; inactive; ]
     Mathematica defines a set of primitive graphics objects you can use to build up complex pictures.  For example, the following draws a line and a filled polygon:
;[s]
2:0,0;16,1;166,-1;
2:1,13,10,Times,2,14,0,0,0;1,13,10,Times,0,14,0,0,0;
:[font = input; startGroup; ]
Show[Graphics[
		{
		Line[{{0, 0}, {4, 4}}],
		Polygon[{{1, 1}, {1, 3},
		 		 {3, 3}, {3, 1}}]
		}
	]]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 46; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.2381 0.01472 0.14715 [
[ 0 0 0 0 ]
[ 1 0.618034 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
gsave
0.004 setlinewidth
0.02381 0.01472 moveto
0.97619 0.60332 lineto
stroke
0.2619 0.16187 moveto
0.2619 0.45617 lineto
0.7381 0.45617 lineto
0.7381 0.16187 lineto
fill
grestore
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; endGroup; ]
The Unformatted text for this cell was not generated.
Use options in the Actions Settings dialog box to control
when Unformatted text is generated.
;[o]
-Graphics-
:[font = text; inactive; ]
     The function Graphics takes a list of graphics primitives and labels them as graphical objects.  The function Show actually displays the objects as PostScript graphics.
     You can use the full power of Mathematica in producing the list of graphics objects.  For example, the following displays a bunch of random lines:
;[s]
3:0,0;209,1;220,2;326,-1;
3:1,13,10,Times,0,14,0,0,0;1,13,10,Times,2,14,0,0,0;1,13,10,Times,0,14,0,0,0;
:[font = input; startGroup; ]
Show[Graphics[
	Table[Line[{{Random[], Random[]},
				{Random[], Random[]}}],
		  {50}]
	]]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 46; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.96996 0.01472 0.5888 [
[ 0 0 0 0 ]
[ 1 0.618034 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
gsave
0.004 setlinewidth
0.1447 0.28115 moveto
0.57738 0.25996 lineto
stroke
0.80453 0.39396 moveto
0.80854 0.49699 lineto
stroke
0.50119 0.48088 moveto
0.65223 0.49465 lineto
stroke
0.29448 0.34798 moveto
0.68888 0.27499 lineto
stroke
0.58546 0.53228 moveto
0.25157 0.25294 lineto
stroke
0.3438 0.29266 moveto
0.39226 0.03003 lineto
stroke
0.68355 0.15768 moveto
0.38571 0.48031 lineto
stroke
0.53911 0.57477 moveto
0.14802 0.28494 lineto
stroke
0.047 0.39895 moveto
0.84359 0.47167 lineto
stroke
0.32679 0.17733 moveto
0.52698 0.5966 lineto
stroke
0.9023 0.28553 moveto
0.96807 0.13432 lineto
stroke
0.56371 0.60332 moveto
0.79427 0.29578 lineto
stroke
0.70593 0.47397 moveto
0.18015 0.55531 lineto
stroke
0.96226 0.44277 moveto
0.18846 0.18306 lineto
stroke
0.28765 0.41689 moveto
0.05646 0.0324 lineto
stroke
0.22398 0.06378 moveto
0.83387 0.04209 lineto
stroke
0.19348 0.1693 moveto
0.07151 0.0421 lineto
stroke
0.81562 0.53044 moveto
0.38729 0.18781 lineto
stroke
0.77169 0.40253 moveto
0.11623 0.45548 lineto
stroke
0.18527 0.331 moveto
0.11547 0.03414 lineto
stroke
0.52481 0.58467 moveto
0.932 0.56777 lineto
stroke
0.69394 0.03386 moveto
0.82321 0.368 lineto
stroke
0.35157 0.46743 moveto
0.92484 0.48058 lineto
stroke
0.78242 0.11017 moveto
0.20596 0.36829 lineto
stroke
0.58977 0.25969 moveto
0.282 0.46386 lineto
stroke
0.26361 0.31372 moveto
0.14048 0.58404 lineto
stroke
0.50477 0.26505 moveto
0.45889 0.2743 lineto
stroke
0.7641 0.06383 moveto
0.67168 0.4981 lineto
stroke
0.96798 0.21542 moveto
0.14889 0.26294 lineto
stroke
0.05825 0.12222 moveto
0.64925 0.18304 lineto
stroke
0.64102 0.32704 moveto
0.59634 0.52928 lineto
stroke
0.93474 0.18571 moveto
0.1764 0.11134 lineto
stroke
0.36652 0.58595 moveto
0.43836 0.4518 lineto
stroke
0.30482 0.33158 moveto
0.0787 0.12587 lineto
stroke
0.16912 0.39375 moveto
0.54599 0.37797 lineto
stroke
0.40864 0.48146 moveto
0.65488 0.12762 lineto
stroke
0.57901 0.27626 moveto
0.25551 0.15426 lineto
stroke
0.23959 0.50296 moveto
0.29124 0.42691 lineto
stroke
0.20307 0.10135 moveto
0.76579 0.58891 lineto
stroke
0.42444 0.1173 moveto
0.59306 0.42065 lineto
stroke
0.65913 0.3322 moveto
0.16724 0.27038 lineto
stroke
0.4372 0.51113 moveto
0.28115 0.52765 lineto
stroke
0.79524 0.60213 moveto
0.32346 0.29804 lineto
stroke
0.66741 0.23238 moveto
0.8694 0.11782 lineto
stroke
0.24626 0.04535 moveto
0.97619 0.19788 lineto
stroke
0.96133 0.39624 moveto
0.27634 0.39439 lineto
stroke
0.4969 0.1234 moveto
0.46241 0.28388 lineto
stroke
0.8357 0.51045 moveto
0.50508 0.39524 lineto
stroke
0.78692 0.58465 moveto
0.31836 0.1459 lineto
stroke
0.82895 0.4819 moveto
0.82752 0.03849 lineto
stroke
grestore
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; endGroup; ]
The Unformatted text for this cell was not generated.
Use options in the Actions Settings dialog box to control
when Unformatted text is generated.
;[o]
-Graphics-
:[font = text; inactive; ]
     A slight variation shows a random filled polygon:
:[font = input; startGroup; ]
Show[Graphics[Polygon[
	 Table[{Random[], Random[]}, {50}]
	 ]]]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 46; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 1.00002 0.01472 0.59819 [
[ 0 0 0 0 ]
[ 1 0.618034 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.63061 0.33447 moveto
0.7034 0.56369 lineto
0.68497 0.20469 lineto
0.24348 0.25233 lineto
0.84577 0.2587 lineto
0.31467 0.54581 lineto
0.43722 0.09731 lineto
0.83411 0.28341 lineto
0.0574 0.36519 lineto
0.02941 0.12649 lineto
0.28485 0.37884 lineto
0.92219 0.03998 lineto
0.96315 0.60332 lineto
0.69698 0.10238 lineto
0.56967 0.05715 lineto
0.83639 0.32339 lineto
0.18176 0.30736 lineto
0.05711 0.53975 lineto
0.47591 0.30372 lineto
0.45008 0.34573 lineto
0.56632 0.583 lineto
0.58903 0.24293 lineto
0.32639 0.05208 lineto
0.83478 0.45731 lineto
0.16842 0.18508 lineto
0.78425 0.01523 lineto
0.72285 0.37636 lineto
0.6651 0.36632 lineto
0.24188 0.4096 lineto
0.86667 0.1863 lineto
0.76272 0.01479 lineto
0.16714 0.24616 lineto
0.90183 0.01551 lineto
0.96276 0.56307 lineto
0.3457 0.41328 lineto
0.51701 0.50156 lineto
0.75731 0.28529 lineto
0.41616 0.51397 lineto
0.84841 0.25324 lineto
0.76418 0.06337 lineto
0.57981 0.49906 lineto
0.75887 0.10216 lineto
0.64084 0.42704 lineto
0.62628 0.45593 lineto
0.73515 0.33817 lineto
0.97619 0.47527 lineto
0.23456 0.3419 lineto
0.37718 0.15904 lineto
0.10703 0.06896 lineto
0.6828 0.48211 lineto
fill
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; endGroup; ]
The Unformatted text for this cell was not generated.
Use options in the Actions Settings dialog box to control
when Unformatted text is generated.
;[o]
-Graphics-
:[font = text; inactive; ]
     By simply substituting Graphics3D for Graphics and adding a third dimension to each coordinate, we can produce 3D graphics:
;[s]
5:0,0;28,1;38,2;43,3;51,4;129,-1;
5:1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;
:[font = input; startGroup; ]
Show[Graphics3D[
	Table[Polygon[
   			Table[{Random[], 
   				   Random[], 
   				   Random[]}, 
				  {5}]
    			],
    	 {4}]
    ]]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 46; pictureWidth = 282; pictureHeight = 282; ]
%!
%%Creator: Mathematica
%%AspectRatio: 1 
MathPictureStart
% Scaling calculations
0.02381 0.95238 0.02381 0.95238 [
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] MathScale
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
0.14751 0.23607 moveto
0.41308 0.50554 lineto
stroke
0.14751 0.23607 moveto
0.07934 0.66666 lineto
stroke
0.39954 0.89434 moveto
0.07934 0.66666 lineto
stroke
0.39954 0.89434 moveto
0.41308 0.50554 lineto
stroke
0.61735 0.03936 moveto
0.82251 0.37222 lineto
stroke
0.61735 0.03936 moveto
0.64346 0.49086 lineto
stroke
0.87866 0.78352 moveto
0.64346 0.49086 lineto
stroke
0.87866 0.78352 moveto
0.82251 0.37222 lineto
stroke
0.14751 0.23607 moveto
0.07934 0.66666 lineto
stroke
0.14751 0.23607 moveto
0.61735 0.03936 lineto
stroke
0.64346 0.49086 moveto
0.61735 0.03936 lineto
stroke
0.64346 0.49086 moveto
0.07934 0.66666 lineto
stroke
0.41308 0.50554 moveto
0.39954 0.89434 lineto
stroke
0.41308 0.50554 moveto
0.82251 0.37222 lineto
stroke
0.87866 0.78352 moveto
0.82251 0.37222 lineto
stroke
0.87866 0.78352 moveto
0.39954 0.89434 lineto
stroke
0.14751 0.23607 moveto
0.61735 0.03936 lineto
stroke
0.14751 0.23607 moveto
0.41308 0.50554 lineto
stroke
0.82251 0.37222 moveto
0.41308 0.50554 lineto
stroke
0.82251 0.37222 moveto
0.61735 0.03936 lineto
stroke
0.07934 0.66666 moveto
0.64346 0.49086 lineto
stroke
0.07934 0.66666 moveto
0.39954 0.89434 lineto
stroke
0.87866 0.78352 moveto
0.39954 0.89434 lineto
stroke
0.87866 0.78352 moveto
0.64346 0.49086 lineto
stroke
grestore
0.459 0.445 0.755 setrgbcolor
0.60863 0.54325 moveto
0.62106 0.55528 lineto
0.67414 0.24996 lineto
fill
0.459 0.445 0.755 setrgbcolor
0.67414 0.24996 moveto
0.62106 0.55528 lineto
0.68563 0.35541 lineto
fill
0.459 0.445 0.755 setrgbcolor
0.60863 0.54325 moveto
0.67414 0.24996 lineto
0.67364 0.25045 lineto
fill
0 0 0 setrgbcolor
0.002 setlinewidth
0.60863 0.54325 moveto
0.61233 0.5266 lineto
stroke
0 0 0.038 setrgbcolor
0.42599 0.57399 moveto
0.41662 0.60772 lineto
0.37289 0.70492 lineto
fill
0 0 0.038 setrgbcolor
0.40169 0.6615 moveto
0.37852 0.69644 lineto
0.41662 0.60772 lineto
fill
0 0 0.038 setrgbcolor
0.37289 0.70492 moveto
0.41662 0.60772 lineto
0.37852 0.69644 lineto
fill
0 0 0 setrgbcolor
0.37289 0.70492 moveto
0.38065 0.68577 lineto
stroke
0.684 0.413 0.507 setrgbcolor
0.41662 0.60772 moveto
0.52334 0.59891 lineto
0.463 0.63954 lineto
fill
0.684 0.413 0.507 setrgbcolor
0.41662 0.60772 moveto
0.43784 0.55833 lineto
0.59935 0.59263 lineto
fill
0.684 0.413 0.507 setrgbcolor
0.43846 0.55687 moveto
0.44109 0.55746 lineto
0.43784 0.55833 lineto
fill
0.684 0.413 0.507 setrgbcolor
0.59935 0.59263 moveto
0.43784 0.55833 lineto
0.44109 0.55746 lineto
fill
0 0 0 setrgbcolor
0.57117 0.52726 moveto
0.54247 0.53616 lineto
0.45994 0.55241 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.59935 0.59263 moveto
0.54922 0.58149 lineto
0.62176 0.51951 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.44109 0.55746 moveto
0.45521 0.55449 lineto
0.54922 0.58149 lineto
fill
0.192 0 0 setrgbcolor
0.47498 0.5458 moveto
0.45521 0.55449 lineto
0.44931 0.55456 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.63617 0.5085 moveto
0.54813 0.57419 lineto
0.67786 0.37947 lineto
fill
0 0 0 setrgbcolor
0.57117 0.52726 moveto
0.45994 0.55241 lineto
0.5095 0.53915 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.67786 0.37947 moveto
0.54813 0.57419 lineto
0.5424 0.53572 lineto
fill
0 0 0 setrgbcolor
0.45994 0.55241 moveto
0.54247 0.53616 lineto
0.46123 0.55323 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.54247 0.53616 moveto
0.54505 0.55352 lineto
0.45521 0.55449 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.54922 0.58149 moveto
0.45521 0.55449 lineto
0.54505 0.55352 lineto
fill
0 0 0 setrgbcolor
0.45994 0.55241 moveto
0.46991 0.55867 lineto
0.44628 0.55842 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.43846 0.55687 moveto
0.5424 0.53569 lineto
0.44109 0.55746 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.44109 0.55746 moveto
0.5424 0.53569 lineto
0.54247 0.53616 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.67786 0.37947 moveto
0.5424 0.53572 lineto
0.5409 0.52562 lineto
fill
0 0 0 setrgbcolor
0.47498 0.5458 moveto
0.5095 0.53915 lineto
0.45994 0.55241 lineto
fill
0 0 0 setrgbcolor
0.47498 0.5458 moveto
0.5095 0.53915 lineto
stroke
0.537 0.673 0.925 setrgbcolor
0.47386 0.52215 moveto
0.54021 0.52097 lineto
0.43846 0.55687 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.67786 0.37947 moveto
0.68006 0.37968 lineto
0.63617 0.5085 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.79388 0.39085 moveto
0.65341 0.49564 lineto
0.68006 0.37968 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.63617 0.5085 moveto
0.68006 0.37968 lineto
0.65341 0.49564 lineto
fill
0 0 0 setrgbcolor
0.71819 0.38342 moveto
0.79388 0.39085 lineto
stroke
0 0 0 setrgbcolor
0.69735 0.46286 moveto
0.79388 0.39085 lineto
stroke
0.302 0.323 0.716 setrgbcolor
0.82349 0.70437 moveto
0.69526 0.31353 lineto
0.71761 0.6488 lineto
fill
0 0 0 setrgbcolor
0.6852 0.23889 moveto
0.67414 0.24996 lineto
0.69128 0.23005 lineto
fill
0 0 0 setrgbcolor
0.63178 0.29233 moveto
0.66383 0.25878 lineto
0.67414 0.24996 lineto
fill
0 0 0 setrgbcolor
0.69128 0.23005 moveto
0.67414 0.24996 lineto
0.66383 0.25878 lineto
fill
0.302 0.323 0.716 setrgbcolor
0.69526 0.31353 moveto
0.67434 0.24978 lineto
0.68563 0.35541 lineto
fill
0.302 0.323 0.716 setrgbcolor
0.68563 0.35541 moveto
0.67434 0.24978 lineto
0.67414 0.24996 lineto
fill
0 0 0 setrgbcolor
0.59424 0.37126 moveto
0.63178 0.29233 lineto
0.6852 0.23889 lineto
fill
0 0 0 setrgbcolor
0.68254 0.24277 moveto
0.6852 0.23889 lineto
stroke
0.302 0.323 0.716 setrgbcolor
0.67401 0.24879 moveto
0.67414 0.24996 lineto
0.67434 0.24978 lineto
fill
0 0 0 setrgbcolor
0.67401 0.24879 moveto
0.67434 0.24978 lineto
stroke
0 0 0 setrgbcolor
0.67414 0.24996 moveto
0.67434 0.24978 lineto
stroke
0.302 0.323 0.716 setrgbcolor
0.71761 0.6488 moveto
0.69526 0.31353 lineto
0.68563 0.35541 lineto
fill
0 0 0 setrgbcolor
0.69526 0.31353 moveto
0.82349 0.70437 lineto
stroke
0 0 0 setrgbcolor
0.67543 0.25311 moveto
0.69526 0.31353 lineto
stroke
0 0 0 setrgbcolor
0.71761 0.6488 moveto
0.82349 0.70437 lineto
stroke
0.459 0.445 0.755 setrgbcolor
0.71761 0.6488 moveto
0.68563 0.35541 lineto
0.62106 0.55528 lineto
fill
0 0 0 setrgbcolor
0.62106 0.55528 moveto
0.71761 0.6488 lineto
stroke
0 0 0 setrgbcolor
0.63617 0.5085 moveto
0.63668 0.50694 lineto
stroke
0 0 0 setrgbcolor
0.68404 0.50551 moveto
0.66743 0.50992 lineto
0.57117 0.52726 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.43846 0.55687 moveto
0.54021 0.52097 lineto
0.5424 0.53569 lineto
fill
0 0 0 setrgbcolor
0.46991 0.55867 moveto
0.46123 0.55323 lineto
0.54247 0.53616 lineto
fill
0.723 0.356 0.354 setrgbcolor
0.463 0.63954 moveto
0.40169 0.6615 lineto
0.41662 0.60772 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.38481 0.6922 moveto
0.5409 0.52562 lineto
0.4375 0.65671 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.4375 0.65671 moveto
0.5409 0.52562 lineto
0.5424 0.53572 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.62176 0.51951 moveto
0.54922 0.58149 lineto
0.54247 0.53616 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.4375 0.65671 moveto
0.5424 0.53572 lineto
0.54813 0.57419 lineto
fill
0 0 0.038 setrgbcolor
0.43783 0.55833 moveto
0.44628 0.55842 lineto
0.40169 0.6615 lineto
fill
0 0 0.038 setrgbcolor
0.46991 0.55867 moveto
0.46268 0.56957 lineto
0.44628 0.55842 lineto
fill
0 0 0.038 setrgbcolor
0.40169 0.6615 moveto
0.44628 0.55842 lineto
0.46268 0.56957 lineto
fill
0.192 0 0 setrgbcolor
0.44931 0.55456 moveto
0.44412 0.55695 lineto
0.44351 0.55654 lineto
fill
0.192 0 0 setrgbcolor
0.45521 0.55449 moveto
0.44628 0.55842 lineto
0.44931 0.55456 lineto
fill
0.192 0 0 setrgbcolor
0.44931 0.55456 moveto
0.44628 0.55842 lineto
0.44412 0.55695 lineto
fill
0 0 0 setrgbcolor
0.57117 0.52726 moveto
0.66743 0.50992 lineto
0.54247 0.53616 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.67786 0.37947 moveto
0.5409 0.52562 lineto
0.59424 0.37126 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.47386 0.52215 moveto
0.534 0.47925 lineto
0.54021 0.52097 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.52634 0.54117 moveto
0.53863 0.51039 lineto
0.5409 0.52562 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.59424 0.37126 moveto
0.5409 0.52562 lineto
0.53863 0.51039 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.62176 0.51951 moveto
0.54021 0.52097 lineto
0.6621 0.38786 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.59424 0.37126 moveto
0.53863 0.51039 lineto
0.53191 0.46521 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.6621 0.38786 moveto
0.47386 0.52215 lineto
0.57887 0.41916 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.46991 0.55867 moveto
0.53191 0.46521 lineto
0.52634 0.54117 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.52634 0.54117 moveto
0.53191 0.46521 lineto
0.53863 0.51039 lineto
fill
0 0 0.038 setrgbcolor
0.47267 0.45886 moveto
0.47084 0.52512 lineto
0.44958 0.54597 lineto
fill
0 0 0.038 setrgbcolor
0.47267 0.45886 moveto
0.44628 0.55842 lineto
0.43943 0.55376 lineto
fill
0 0 0.038 setrgbcolor
0.59424 0.37126 moveto
0.53191 0.46521 lineto
0.47267 0.45886 lineto
fill
0 0 0.038 setrgbcolor
0.47267 0.45886 moveto
0.53191 0.46521 lineto
0.47084 0.52512 lineto
fill
0 0 0.038 setrgbcolor
0.42599 0.57399 moveto
0.43236 0.55827 lineto
0.40169 0.6615 lineto
fill
0 0 0.038 setrgbcolor
0.47267 0.45886 moveto
0.43783 0.55833 lineto
0.43236 0.55827 lineto
fill
0 0 0.038 setrgbcolor
0.40169 0.6615 moveto
0.43236 0.55827 lineto
0.43783 0.55833 lineto
fill
0 0 0 setrgbcolor
0.47257 0.45912 moveto
0.47267 0.45886 lineto
stroke
0.877 0.9 0.843 setrgbcolor
0.52634 0.54117 moveto
0.41957 0.6551 lineto
0.46991 0.55867 lineto
fill
0 0 0 setrgbcolor
0.66743 0.50992 moveto
0.48324 0.55882 lineto
0.54247 0.53616 lineto
fill
0 0 0.038 setrgbcolor
0.43783 0.55833 moveto
0.43943 0.55376 lineto
0.44628 0.55842 lineto
fill
0.684 0.413 0.507 setrgbcolor
0.43846 0.55687 moveto
0.43784 0.55833 lineto
0.2965 0.52532 lineto
fill
0.684 0.413 0.507 setrgbcolor
0.41662 0.60772 moveto
0.37078 0.57628 lineto
0.43784 0.55833 lineto
fill
0.684 0.413 0.507 setrgbcolor
0.2965 0.52532 moveto
0.43784 0.55833 lineto
0.37078 0.57628 lineto
fill
0 0 0 setrgbcolor
0.43784 0.55833 moveto
0.43846 0.55687 lineto
stroke
0.877 0.9 0.843 setrgbcolor
0.46991 0.55867 moveto
0.41957 0.6551 lineto
0.40169 0.6615 lineto
fill
0 0 0 setrgbcolor
0.38765 0.58419 moveto
0.46991 0.55867 lineto
0.48324 0.55882 lineto
fill
0 0 0 setrgbcolor
0.54247 0.53616 moveto
0.48324 0.55882 lineto
0.46991 0.55867 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.2965 0.52532 moveto
0.52791 0.43832 lineto
0.47386 0.52215 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.57887 0.41916 moveto
0.53191 0.46521 lineto
0.52791 0.43832 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.47386 0.52215 moveto
0.52791 0.43832 lineto
0.53191 0.46521 lineto
fill
0.537 0.673 0.925 setrgbcolor
0.6621 0.38786 moveto
0.54021 0.52097 lineto
0.534 0.47925 lineto
fill
0 0 0 setrgbcolor
0.52791 0.43832 moveto
0.55997 0.42626 lineto
stroke
0 0 0 setrgbcolor
0.55997 0.42626 moveto
0.57887 0.41916 lineto
stroke
0 0 0 setrgbcolor
0.53191 0.46521 moveto
0.534 0.47925 lineto
stroke
0 0 0 setrgbcolor
0.57887 0.41916 moveto
0.6621 0.38786 lineto
stroke
0 0 0 setrgbcolor
0.534 0.47925 moveto
0.53863 0.51039 lineto
stroke
0 0 0.038 setrgbcolor
0.44628 0.55842 moveto
0.44958 0.54597 lineto
0.46991 0.55867 lineto
fill
0 0 0.038 setrgbcolor
0.46991 0.55867 moveto
0.44958 0.54597 lineto
0.47084 0.52512 lineto
fill
0.723 0.356 0.354 setrgbcolor
0.2965 0.52532 moveto
0.41662 0.60772 lineto
0.30388 0.69654 lineto
fill
0.192 0 0 setrgbcolor
0.32933 0.60983 moveto
0.44412 0.55695 lineto
0.44628 0.55842 lineto
fill
0.192 0 0 setrgbcolor
0.34531 0.59004 moveto
0.44351 0.55654 lineto
0.32933 0.60983 lineto
fill
0.192 0 0 setrgbcolor
0.32933 0.60983 moveto
0.44351 0.55654 lineto
0.44412 0.55695 lineto
fill
0 0 0 setrgbcolor
0.44351 0.55654 moveto
0.44412 0.55695 lineto
stroke
0 0 0 setrgbcolor
0.32933 0.60983 moveto
0.34531 0.59004 lineto
stroke
0 0 0 setrgbcolor
0.34531 0.59004 moveto
0.44351 0.55654 lineto
stroke
0 0 0 setrgbcolor
0.44412 0.55695 moveto
0.44628 0.55842 lineto
stroke
0 0 0 setrgbcolor
0.54185 0.53636 moveto
0.54247 0.53616 lineto
stroke
0 0 0 setrgbcolor
0.52939 0.54022 moveto
0.54185 0.53636 lineto
stroke
0 0 0 setrgbcolor
0.52634 0.54117 moveto
0.52939 0.54022 lineto
stroke
0.537 0.673 0.925 setrgbcolor
0.62176 0.51951 moveto
0.5424 0.53569 lineto
0.54021 0.52097 lineto
fill
0 0 0 setrgbcolor
0.53863 0.51039 moveto
0.54021 0.52097 lineto
stroke
0 0 0 setrgbcolor
0.54021 0.52097 moveto
0.5409 0.52562 lineto
stroke
0.537 0.673 0.925 setrgbcolor
0.62176 0.51951 moveto
0.54247 0.53616 lineto
0.5424 0.53569 lineto
fill
0 0 0 setrgbcolor
0.5424 0.53569 moveto
0.5424 0.53572 lineto
stroke
0 0 0 setrgbcolor
0.5409 0.52562 moveto
0.5424 0.53569 lineto
stroke
0 0 0 setrgbcolor
0.54247 0.53616 moveto
0.62176 0.51951 lineto
stroke
0 0 0 setrgbcolor
0.62777 0.4999 moveto
0.6621 0.38786 lineto
stroke
0 0 0 setrgbcolor
0.62176 0.51951 moveto
0.62777 0.4999 lineto
stroke
0 0 0 setrgbcolor
0.5424 0.53572 moveto
0.54247 0.53616 lineto
stroke
0 0 0 setrgbcolor
0.54505 0.55352 moveto
0.54813 0.57419 lineto
stroke
0 0 0 setrgbcolor
0.54346 0.54283 moveto
0.54505 0.55352 lineto
stroke
0.537 0.673 0.925 setrgbcolor
0.2965 0.52532 moveto
0.47386 0.52215 lineto
0.43846 0.55687 lineto
fill
0 0 0 setrgbcolor
0.47011 0.55136 moveto
0.47551 0.55023 lineto
stroke
0 0 0 setrgbcolor
0.44073 0.55465 moveto
0.44958 0.54597 lineto
stroke
0 0 0 setrgbcolor
0.45413 0.46606 moveto
0.52791 0.43832 lineto
stroke
0 0 0 setrgbcolor
0.2965 0.52532 moveto
0.45413 0.46606 lineto
stroke
0 0 0 setrgbcolor
0.43846 0.55687 moveto
0.44073 0.55465 lineto
stroke
0 0 0.038 setrgbcolor
0.46991 0.55867 moveto
0.47084 0.52512 lineto
0.53191 0.46521 lineto
fill
0 0 0 setrgbcolor
0.47386 0.52215 moveto
0.53191 0.46521 lineto
stroke
0 0 0 setrgbcolor
0.44958 0.54597 moveto
0.47084 0.52512 lineto
stroke
0 0 0 setrgbcolor
0.44073 0.55465 moveto
0.47084 0.52512 lineto
stroke
0 0 0 setrgbcolor
0.47084 0.52512 moveto
0.47386 0.52215 lineto
stroke
0 0 0 setrgbcolor
0.59935 0.59263 moveto
0.62091 0.52227 lineto
stroke
0 0 0 setrgbcolor
0.54346 0.54283 moveto
0.54813 0.57419 lineto
stroke
0 0 0 setrgbcolor
0.52634 0.54117 moveto
0.54185 0.53636 lineto
stroke
0 0 0 setrgbcolor
0.43781 0.5584 moveto
0.43784 0.55833 lineto
stroke
0 0 0 setrgbcolor
0.38765 0.58419 moveto
0.44628 0.55842 lineto
0.46991 0.55867 lineto
fill
0 0 0 setrgbcolor
0.44628 0.55842 moveto
0.46991 0.55867 lineto
stroke
0 0 0 setrgbcolor
0.46991 0.55867 moveto
0.52634 0.54117 lineto
stroke
0 0 0 setrgbcolor
0.43781 0.5584 moveto
0.43846 0.55687 lineto
stroke
0 0 0 setrgbcolor
0.41662 0.60772 moveto
0.42002 0.59981 lineto
stroke
0 0 0 setrgbcolor
0.43777 0.55849 moveto
0.43781 0.5584 lineto
stroke
0 0 0 setrgbcolor
0.42002 0.59981 moveto
0.43176 0.57248 lineto
stroke
0 0 0 setrgbcolor
0.41662 0.60772 moveto
0.43176 0.57248 lineto
stroke
0.877 0.9 0.843 setrgbcolor
0.37289 0.70492 moveto
0.38481 0.6922 lineto
0.4375 0.65671 lineto
fill
0 0 0 setrgbcolor
0.45823 0.64125 moveto
0.54813 0.57419 lineto
stroke
0.684 0.413 0.507 setrgbcolor
0.48851 0.65705 moveto
0.463 0.63954 lineto
0.59935 0.59263 lineto
fill
0.684 0.413 0.507 setrgbcolor
0.59935 0.59263 moveto
0.463 0.63954 lineto
0.52334 0.59891 lineto
fill
0 0 0 setrgbcolor
0.48851 0.65705 moveto
0.59935 0.59263 lineto
stroke
0.723 0.356 0.354 setrgbcolor
0.30388 0.69654 moveto
0.41662 0.60772 lineto
0.40169 0.6615 lineto
fill
0.877 0.9 0.843 setrgbcolor
0.37289 0.70492 moveto
0.40169 0.6615 lineto
0.41957 0.6551 lineto
fill
0 0 0 setrgbcolor
0.37289 0.70492 moveto
0.4085 0.67835 lineto
stroke
0.723 0.356 0.354 setrgbcolor
0.3043 0.7061 moveto
0.30388 0.69654 lineto
0.48851 0.65705 lineto
fill
0.723 0.356 0.354 setrgbcolor
0.48851 0.65705 moveto
0.30388 0.69654 lineto
0.463 0.63954 lineto
fill
0 0 0 setrgbcolor
0.40169 0.6615 moveto
0.41662 0.60772 lineto
stroke
0 0 0 setrgbcolor
0.2965 0.52532 moveto
0.30388 0.69654 lineto
stroke
0 0 0 setrgbcolor
0.40169 0.6615 moveto
0.41957 0.6551 lineto
stroke
0 0 0 setrgbcolor
0.3043 0.7061 moveto
0.48851 0.65705 lineto
stroke
0 0 0 setrgbcolor
0.30388 0.69654 moveto
0.3043 0.7061 lineto
stroke
0 0 0 setrgbcolor
0.41957 0.6551 moveto
0.44634 0.64551 lineto
stroke
0 0 0 setrgbcolor
0.41957 0.6551 moveto
0.45823 0.64125 lineto
stroke
0 0 0 setrgbcolor
0.44634 0.64551 moveto
0.44761 0.64506 lineto
stroke
0 0 0 setrgbcolor
0.44761 0.64506 moveto
0.45823 0.64125 lineto
stroke
0 0 0 setrgbcolor
0.32933 0.60983 moveto
0.38765 0.58419 lineto
0.68404 0.50551 lineto
fill
0 0 0 setrgbcolor
0.62241 0.51739 moveto
0.68404 0.50551 lineto
stroke
0 0 0 setrgbcolor
0.63668 0.50694 moveto
0.67786 0.37947 lineto
stroke
0 0 0 setrgbcolor
0.59424 0.37126 moveto
0.67786 0.37947 lineto
stroke
0 0 0 setrgbcolor
0.62491 0.5169 moveto
0.63617 0.5085 lineto
stroke
0 0 0 setrgbcolor
0.6457 0.37631 moveto
0.67192 0.25822 lineto
stroke
0 0 0 setrgbcolor
0.61314 0.54762 moveto
0.62106 0.55528 lineto
stroke
0.459 0.445 0.755 setrgbcolor
0.67401 0.24879 moveto
0.67364 0.25045 lineto
0.67414 0.24996 lineto
fill
0 0 0 setrgbcolor
0.67401 0.24879 moveto
0.67364 0.25045 lineto
stroke
0 0 0 setrgbcolor
0.67364 0.25045 moveto
0.67414 0.24996 lineto
stroke
0 0 0 setrgbcolor
0.47267 0.45886 moveto
0.63178 0.29233 lineto
0.59424 0.37126 lineto
fill
0 0 0 setrgbcolor
0.47267 0.45886 moveto
0.63178 0.29233 lineto
stroke
0 0 0 setrgbcolor
0.59424 0.37126 moveto
0.68254 0.24277 lineto
stroke
0 0 0 setrgbcolor
0.63178 0.29233 moveto
0.66383 0.25878 lineto
stroke
0 0 0 setrgbcolor
0.6852 0.23889 moveto
0.69128 0.23005 lineto
stroke
0 0 0 setrgbcolor
0.66383 0.25878 moveto
0.69128 0.23005 lineto
stroke
0.636 0.227 0.252 setrgbcolor
0.32933 0.60983 moveto
0.68404 0.50551 lineto
0.62272 0.61561 lineto
fill
0 0 0 setrgbcolor
0.68404 0.50551 moveto
0.62272 0.61561 lineto
stroke
0 0 0 setrgbcolor
0.62272 0.61561 moveto
0.32933 0.60983 lineto
stroke
0 setgray
0.61735 0.03936 moveto
0.82251 0.37222 lineto
stroke
0.61735 0.03936 moveto
0.64346 0.49086 lineto
stroke
0.87866 0.78352 moveto
0.64346 0.49086 lineto
stroke
0.87866 0.78352 moveto
0.82251 0.37222 lineto
stroke
0.14751 0.23607 moveto
0.07934 0.66666 lineto
stroke
0.14751 0.23607 moveto
0.61735 0.03936 lineto
stroke
0.64346 0.49086 moveto
0.61735 0.03936 lineto
stroke
0.64346 0.49086 moveto
0.07934 0.66666 lineto
stroke
0.07934 0.66666 moveto
0.64346 0.49086 lineto
stroke
0.07934 0.66666 moveto
0.39954 0.89434 lineto
stroke
0.87866 0.78352 moveto
0.39954 0.89434 lineto
stroke
0.87866 0.78352 moveto
0.64346 0.49086 lineto
stroke
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; endGroup; endGroup; ]
The Unformatted text for this cell was not generated.
Use options in the Actions Settings dialog box to control
when Unformatted text is generated.
;[o]
-Graphics3D-
:[font = section; inactive; Cclosed; startGroup; ]
Using Graphics Primitives
:[font = text; inactive; ]
     As an example of using 2D graphics primitives, let's define a simple alternative to the Plot command.  Plot always draws one or more lines representing function values.  Let's make a function which fills in the area beneath a function instead.
     We start by making a function which simply produces a list of values from a function and range.
;[s]
5:0,0;93,1;97,2;108,3;112,4;350,-1;
5:1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;
:[font = input; ]
Clear[FillPlot];
FillPlot[f_, {x_, xmin_, xmax_}] := 
	Table[N[{x, f}], 
	  {x, xmin, xmax, (xmax-xmin)/15}]
:[font = text; inactive; ]
     Let's try it:
:[font = input; startGroup; ]
FillPlot[BesselJ[0, x], {x, 0, 8}]
:[font = output; output; inactive; endGroup; ]
{{0., 1.}, {0.533333, 0.930143}, 
   {1.06667, 0.735155}, 
   {1.6, 0.455402}, 
   {2.13333, 0.147724}, 
   {2.66667, -0.127561}, 
   {3.2, -0.320188}, 
   {3.73333, -0.400795}, 
   {4.26667, -0.366561}, 
   {4.8, -0.240425}, 
   {5.33333, -0.0642673}, 
   {5.86667, 0.112101}, 
   {6.4, 0.243311}, 
   {6.93333, 0.299097}, 
   {7.46667, 0.270709}, {8., 0.171651}}
;[o]
{{0., 1.}, {0.533333, 0.930143}, 
 
   {1.06667, 0.735155}, 
 
   {1.6, 0.455402}, 
 
   {2.13333, 0.147724}, 
 
   {2.66667, -0.127561}, 
 
   {3.2, -0.320188}, 
 
   {3.73333, -0.400795}, 
 
   {4.26667, -0.366561}, 
 
   {4.8, -0.240425}, 
 
   {5.33333, -0.0642673}, 
 
   {5.86667, 0.112101}, 
 
   {6.4, 0.243311}, 
 
   {6.93333, 0.299097}, 
 
   {7.46667, 0.270709}, {8., 0.171651}}
:[font = text; inactive; ]
     Now we can modify our function to actually draw the line defined by these points:
:[font = input; ]
Clear[FillPlot];
FillPlot[f_, {x_, xmin_, xmax_}] := 
	Show[Graphics[
		Line[
			Table[{x, f}, 
				  {x, xmin, xmax, 
				   (xmax-xmin)/15}]
			]
		], Axes->Automatic]
:[font = input; startGroup; ]
FillPlot[BesselJ[0, x], {x, 0, 8}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 46; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.11905 0.18313 0.42019 [
[(2.)] 0.2619 0.17063 0 1 Msboxa
[(4.)] 0.5 0.17063 0 1 Msboxa
[(6.)] 0.7381 0.17063 0 1 Msboxa
[(8.)] 0.97619 0.17063 0 1 Msboxa
[(-0.4)] 0.01131 0.01505 1 0 Msboxa
[(-0.2)] 0.01131 0.09909 1 0 Msboxa
[(0.2)] 0.01131 0.26716 1 0 Msboxa
[(0.4)] 0.01131 0.3512 1 0 Msboxa
[(0.6)] 0.01131 0.43524 1 0 Msboxa
[(0.8)] 0.01131 0.51928 1 0 Msboxa
[(1.)] 0.01131 0.60332 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.18313 moveto
1 0.18313 lineto
stroke
0.2619 0.17688 moveto
0.2619 0.18938 lineto
stroke
[(2.)] 0.2619 0.17063 0 1 Mshowa
0.5 0.17688 moveto
0.5 0.18938 lineto
stroke
[(4.)] 0.5 0.17063 0 1 Mshowa
0.7381 0.17688 moveto
0.7381 0.18938 lineto
stroke
[(6.)] 0.7381 0.17063 0 1 Mshowa
0.97619 0.17688 moveto
0.97619 0.18938 lineto
stroke
[(8.)] 0.97619 0.17063 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.01505 moveto
0.03006 0.01505 lineto
stroke
[(-0.4)] 0.01131 0.01505 1 0 Mshowa
0.01756 0.09909 moveto
0.03006 0.09909 lineto
stroke
[(-0.2)] 0.01131 0.09909 1 0 Mshowa
0.01756 0.26716 moveto
0.03006 0.26716 lineto
stroke
[(0.2)] 0.01131 0.26716 1 0 Mshowa
0.01756 0.3512 moveto
0.03006 0.3512 lineto
stroke
[(0.4)] 0.01131 0.3512 1 0 Mshowa
0.01756 0.43524 moveto
0.03006 0.43524 lineto
stroke
[(0.6)] 0.01131 0.43524 1 0 Mshowa
0.01756 0.51928 moveto
0.03006 0.51928 lineto
stroke
[(0.8)] 0.01131 0.51928 1 0 Mshowa
0.01756 0.60332 moveto
0.03006 0.60332 lineto
stroke
[(1.)] 0.01131 0.60332 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.004 setlinewidth
0.02381 0.60332 moveto
0.0873 0.57397 lineto
0.15079 0.49203 lineto
0.21429 0.37448 lineto
0.27778 0.2452 lineto
0.34127 0.12953 lineto
0.40476 0.04859 lineto
0.46825 0.01472 lineto
0.53175 0.0291 lineto
0.59524 0.0821 lineto
0.65873 0.15612 lineto
0.72222 0.23023 lineto
0.78571 0.28536 lineto
0.84921 0.3088 lineto
0.9127 0.29688 lineto
0.97619 0.25525 lineto
stroke
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; endGroup; ]
The Unformatted text for this cell was not generated.
Use options in the Actions Settings dialog box to control
when Unformatted text is generated.
;[o]
-Graphics-
:[font = text; inactive; ]
     We now have a simple version of Plot, but that's not what we really wanted.  To make a filled area instead of a line, we will use Polygon instead of Line:
;[s]
7:0,0;37,1;41,2;135,3;142,4;154,5;158,6;160,-1;
7:1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;
:[font = input; ]
Clear[FillPlot];
FillPlot[f_, {x_, xmin_, xmax_}] := 
	Show[Graphics[
		Polygon[
			   Table[{x, f}, 
					 {x, xmin, xmax, 
				 	  (xmax-xmin)/15}]
			   ]
		], Axes->Automatic]
:[font = input; startGroup; ]
FillPlot[BesselJ[0, x], {x, 0, 8}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 46; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.11905 0.18313 0.42019 [
[(2.)] 0.2619 0.17063 0 1 Msboxa
[(4.)] 0.5 0.17063 0 1 Msboxa
[(6.)] 0.7381 0.17063 0 1 Msboxa
[(8.)] 0.97619 0.17063 0 1 Msboxa
[(-0.4)] 0.01131 0.01505 1 0 Msboxa
[(-0.2)] 0.01131 0.09909 1 0 Msboxa
[(0.2)] 0.01131 0.26716 1 0 Msboxa
[(0.4)] 0.01131 0.3512 1 0 Msboxa
[(0.6)] 0.01131 0.43524 1 0 Msboxa
[(0.8)] 0.01131 0.51928 1 0 Msboxa
[(1.)] 0.01131 0.60332 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.18313 moveto
1 0.18313 lineto
stroke
0.2619 0.17688 moveto
0.2619 0.18938 lineto
stroke
[(2.)] 0.2619 0.17063 0 1 Mshowa
0.5 0.17688 moveto
0.5 0.18938 lineto
stroke
[(4.)] 0.5 0.17063 0 1 Mshowa
0.7381 0.17688 moveto
0.7381 0.18938 lineto
stroke
[(6.)] 0.7381 0.17063 0 1 Mshowa
0.97619 0.17688 moveto
0.97619 0.18938 lineto
stroke
[(8.)] 0.97619 0.17063 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.01505 moveto
0.03006 0.01505 lineto
stroke
[(-0.4)] 0.01131 0.01505 1 0 Mshowa
0.01756 0.09909 moveto
0.03006 0.09909 lineto
stroke
[(-0.2)] 0.01131 0.09909 1 0 Mshowa
0.01756 0.26716 moveto
0.03006 0.26716 lineto
stroke
[(0.2)] 0.01131 0.26716 1 0 Mshowa
0.01756 0.3512 moveto
0.03006 0.3512 lineto
stroke
[(0.4)] 0.01131 0.3512 1 0 Mshowa
0.01756 0.43524 moveto
0.03006 0.43524 lineto
stroke
[(0.6)] 0.01131 0.43524 1 0 Mshowa
0.01756 0.51928 moveto
0.03006 0.51928 lineto
stroke
[(0.8)] 0.01131 0.51928 1 0 Mshowa
0.01756 0.60332 moveto
0.03006 0.60332 lineto
stroke
[(1.)] 0.01131 0.60332 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.60332 moveto
0.0873 0.57397 lineto
0.15079 0.49203 lineto
0.21429 0.37448 lineto
0.27778 0.2452 lineto
0.34127 0.12953 lineto
0.40476 0.04859 lineto
0.46825 0.01472 lineto
0.53175 0.0291 lineto
0.59524 0.0821 lineto
0.65873 0.15612 lineto
0.72222 0.23023 lineto
0.78571 0.28536 lineto
0.84921 0.3088 lineto
0.9127 0.29688 lineto
0.97619 0.25525 lineto
fill
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; endGroup; ]
The Unformatted text for this cell was not generated.
Use options in the Actions Settings dialog box to control
when Unformatted text is generated.
;[o]
-Graphics-
:[font = text; inactive; ]
     Of course, this is not quite right.  We need to add two more points to define the baseline:
:[font = input; ]
Clear[FillPlot];
FillPlot[f_, {x_, xmin_, xmax_}] := 
	Show[Graphics[
		Polygon[Join[
			{{xmin, 0}},
			 Table[{x, f}, 
			 	   {x, xmin, xmax, 
					(xmax-xmin)/15}],
			{{xmax, 0}}]
			   ]
	], Axes->Automatic]
:[font = input; startGroup; ]
FillPlot[BesselJ[0, x], {x, 0, 8}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 46; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.11905 0.18313 0.42019 [
[(2.)] 0.2619 0.17063 0 1 Msboxa
[(4.)] 0.5 0.17063 0 1 Msboxa
[(6.)] 0.7381 0.17063 0 1 Msboxa
[(8.)] 0.97619 0.17063 0 1 Msboxa
[(-0.4)] 0.01131 0.01505 1 0 Msboxa
[(-0.2)] 0.01131 0.09909 1 0 Msboxa
[(0.2)] 0.01131 0.26716 1 0 Msboxa
[(0.4)] 0.01131 0.3512 1 0 Msboxa
[(0.6)] 0.01131 0.43524 1 0 Msboxa
[(0.8)] 0.01131 0.51928 1 0 Msboxa
[(1.)] 0.01131 0.60332 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.18313 moveto
1 0.18313 lineto
stroke
0.2619 0.17688 moveto
0.2619 0.18938 lineto
stroke
[(2.)] 0.2619 0.17063 0 1 Mshowa
0.5 0.17688 moveto
0.5 0.18938 lineto
stroke
[(4.)] 0.5 0.17063 0 1 Mshowa
0.7381 0.17688 moveto
0.7381 0.18938 lineto
stroke
[(6.)] 0.7381 0.17063 0 1 Mshowa
0.97619 0.17688 moveto
0.97619 0.18938 lineto
stroke
[(8.)] 0.97619 0.17063 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.01505 moveto
0.03006 0.01505 lineto
stroke
[(-0.4)] 0.01131 0.01505 1 0 Mshowa
0.01756 0.09909 moveto
0.03006 0.09909 lineto
stroke
[(-0.2)] 0.01131 0.09909 1 0 Mshowa
0.01756 0.26716 moveto
0.03006 0.26716 lineto
stroke
[(0.2)] 0.01131 0.26716 1 0 Mshowa
0.01756 0.3512 moveto
0.03006 0.3512 lineto
stroke
[(0.4)] 0.01131 0.3512 1 0 Mshowa
0.01756 0.43524 moveto
0.03006 0.43524 lineto
stroke
[(0.6)] 0.01131 0.43524 1 0 Mshowa
0.01756 0.51928 moveto
0.03006 0.51928 lineto
stroke
[(0.8)] 0.01131 0.51928 1 0 Mshowa
0.01756 0.60332 moveto
0.03006 0.60332 lineto
stroke
[(1.)] 0.01131 0.60332 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.18313 moveto
0.02381 0.60332 lineto
0.0873 0.57397 lineto
0.15079 0.49203 lineto
0.21429 0.37448 lineto
0.27778 0.2452 lineto
0.34127 0.12953 lineto
0.40476 0.04859 lineto
0.46825 0.01472 lineto
0.53175 0.0291 lineto
0.59524 0.0821 lineto
0.65873 0.15612 lineto
0.72222 0.23023 lineto
0.78571 0.28536 lineto
0.84921 0.3088 lineto
0.9127 0.29688 lineto
0.97619 0.25525 lineto
0.97619 0.18313 lineto
fill
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; endGroup; ]
The Unformatted text for this cell was not generated.
Use options in the Actions Settings dialog box to control
when Unformatted text is generated.
;[o]
-Graphics-
:[font = text; inactive; ]
     That's what we want.  This version has a number of drawbacks, most notably that the number of sample points is fixed at 15.  We could add an option to the function to allow you to choose the number of sample points, but this is not the best approach.
     The built-in Plot command uses a clever adaptive sampling method to give smooth plots for most functions.  We would like to use the same method for out FillPlot command.  We can do this by using the fact that the function result of Plot contains a list of all the points sampled.  We can use the following trick to get out this list:
;[s]
7:0,0;274,1;278,2;413,3;421,4;493,5;497,6;595,-1;
7:1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;
:[font = input; startGroup; ]
Plot[BesselJ[0, x], {x, 0, 8},
DisplayFunction->Identity][[1,2,1,1]]
:[font = output; output; inactive; endGroup; ]
{{0., 1.}, {0.0104167, 0.999973}, 
   {0.0208333, 0.999891}, 
   {0.03125, 0.999756}, 
   {0.0416667, 0.999566}, 
   {0.0625, 0.999024}, 
   {0.0833333, 0.998265}, 
   {0.104167, 0.997289}, 
   {0.125, 0.996098}, 
   {0.166667, 0.993068}, 
   {0.208333, 0.989179}, 
   {0.25, 0.984436}, 
   {0.333333, 0.972415}, 
   {0.5, 0.93847}, 
   {0.666667, 0.891937}, 
   {1., 0.765198}, 
   {1.33333, 0.602566}, 
   {1.66667, 0.417209}, 
   {2., 0.223891}, 
   {2.33333, 0.0376458}, 
   {2.66667, -0.127561}, 
   {2.83333, -0.198507}, 
   {3., -0.260052}, 
   {3.16667, -0.311254}, 
   {3.33333, -0.351423}, 
   {3.41667, -0.367225}, 
   {3.5, -0.380128}, 
   {3.58333, -0.39012}, 
   {3.625, -0.394025}, 
   {3.66667, -0.397205}, 
   {3.70833, -0.399664}, 
   {3.72917, -0.400625}, 
   {3.75, -0.401406}, 
   {3.77083, -0.402009}, 
   {3.78125, -0.402245}, 
   {3.79167, -0.402435}, 
   {3.80208, -0.402582}, 
   {3.8125, -0.402685}, 
   {3.82292, -0.402744}, 
   {3.83333, -0.402759}, 
   {3.84375, -0.40273}, 
   {3.85417, -0.402658}, 
   {3.86458, -0.402542}, 
   {3.875, -0.402383}, 
   {3.88542, -0.402181}, 
   {3.89583, -0.401936}, 
   {3.91667, -0.401317}, 
   {3.95833, -0.399569}, 
   {4., -0.39715}, 
   {4.08333, -0.39034}, 
   {4.16667, -0.380986}, 
   {4.33333, -0.355104}, 
   {4.5, -0.320543}, 
   {4.66667, -0.278515}, 
   {5., -0.177597}, 
   {5.33333, -0.0642673}, 
   {5.66667, 0.049052}, 
   {6., 0.150645}, 
   {6.16667, 0.193852}, 
   {6.33333, 0.230605}, 
   {6.5, 0.260095}, 
   {6.58333, 0.27192}, 
   {6.66667, 0.281721}, 
   {6.75, 0.289457}, 
   {6.83333, 0.295101}, 
   {6.875, 0.297135}, 
   {6.89583, 0.297954}, 
   {6.91667, 0.298642}, 
   {6.9375, 0.299198}, 
   {6.95833, 0.299623}, 
   {6.96875, 0.299786}, 
   {6.97917, 0.299916}, 
   {6.98958, 0.300014}, 
   {7., 0.300079}, 
   {7.01042, 0.300112}, 
   {7.02083, 0.300112}, 
   {7.03125, 0.300079}, 
   {7.04167, 0.300014}, 
   {7.05208, 0.299916}, 
   {7.0625, 0.299786}, 
   {7.07292, 0.299624}, 
   {7.08333, 0.29943}, 
   {7.125, 0.29833}, 
   {7.14583, 0.297589}, 
   {7.16667, 0.296721}, 
   {7.25, 0.291997}, 
   {7.33333, 0.285312}, 
   {7.5, 0.26634}, 
   {7.66667, 0.240484}, {8., 0.171651}}
;[o]
{{0., 1.}, {0.0104167, 0.999973}, 
 
   {0.0208333, 0.999891}, 
 
   {0.03125, 0.999756}, 
 
   {0.0416667, 0.999566}, 
 
   {0.0625, 0.999024}, 
 
   {0.0833333, 0.998265}, 
 
   {0.104167, 0.997289}, 
 
   {0.125, 0.996098}, 
 
   {0.166667, 0.993068}, 
 
   {0.208333, 0.989179}, 
 
   {0.25, 0.984436}, 
 
   {0.333333, 0.972415}, 
 
   {0.5, 0.93847}, 
 
   {0.666667, 0.891937}, 
 
   {1., 0.765198}, 
 
   {1.33333, 0.602566}, 
 
   {1.66667, 0.417209}, 
 
   {2., 0.223891}, 
 
   {2.33333, 0.0376458}, 
 
   {2.66667, -0.127561}, 
 
   {2.83333, -0.198507}, 
 
   {3., -0.260052}, 
 
   {3.16667, -0.311254}, 
 
   {3.33333, -0.351423}, 
 
   {3.41667, -0.367225}, 
 
   {3.5, -0.380128}, 
 
   {3.58333, -0.39012}, 
 
   {3.625, -0.394025}, 
 
   {3.66667, -0.397205}, 
 
   {3.70833, -0.399664}, 
 
   {3.72917, -0.400625}, 
 
   {3.75, -0.401406}, 
 
   {3.77083, -0.402009}, 
 
   {3.78125, -0.402245}, 
 
   {3.79167, -0.402435}, 
 
   {3.80208, -0.402582}, 
 
   {3.8125, -0.402685}, 
 
   {3.82292, -0.402744}, 
 
   {3.83333, -0.402759}, 
 
   {3.84375, -0.40273}, 
 
   {3.85417, -0.402658}, 
 
   {3.86458, -0.402542}, 
 
   {3.875, -0.402383}, 
 
   {3.88542, -0.402181}, 
 
   {3.89583, -0.401936}, 
 
   {3.91667, -0.401317}, 
 
   {3.95833, -0.399569}, 
 
   {4., -0.39715}, 
 
   {4.08333, -0.39034}, 
 
   {4.16667, -0.380986}, 
 
   {4.33333, -0.355104}, 
 
   {4.5, -0.320543}, 
 
   {4.66667, -0.278515}, 
 
   {5., -0.177597}, 
 
   {5.33333, -0.0642673}, 
 
   {5.66667, 0.049052}, 
 
   {6., 0.150645}, 
 
   {6.16667, 0.193852}, 
 
   {6.33333, 0.230605}, 
 
   {6.5, 0.260095}, 
 
   {6.58333, 0.27192}, 
 
   {6.66667, 0.281721}, 
 
   {6.75, 0.289457}, 
 
   {6.83333, 0.295101}, 
 
   {6.875, 0.297135}, 
 
   {6.89583, 0.297954}, 
 
   {6.91667, 0.298642}, 
 
   {6.9375, 0.299198}, 
 
   {6.95833, 0.299623}, 
 
   {6.96875, 0.299786}, 
 
   {6.97917, 0.299916}, 
 
   {6.98958, 0.300014}, 
 
   {7., 0.300079}, 
 
   {7.01042, 0.300112}, 
 
   {7.02083, 0.300112}, 
 
   {7.03125, 0.300079}, 
 
   {7.04167, 0.300014}, 
 
   {7.05208, 0.299916}, 
 
   {7.0625, 0.299786}, 
 
   {7.07292, 0.299624}, 
 
   {7.08333, 0.29943}, 
 
   {7.125, 0.29833}, 
 
   {7.14583, 0.297589}, 
 
   {7.16667, 0.296721}, 
 
   {7.25, 0.291997}, 
 
   {7.33333, 0.285312}, 
 
   {7.5, 0.26634}, 
 
   {7.66667, 0.240484}, {8., 0.171651}}
:[font = text; inactive; ]
     As you can see, Plot uses a lot more than 15 sample points to get a smooth curve.  Using this trick, we can make a new version of FillPlot:
;[s]
5:0,0;21,1;25,2;135,3;143,4;145,-1;
5:1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;
:[font = input; ]
Clear[FillPlot];
FillPlot[f_, {x_, xmin_, xmax_},
		 options___] := 
  Show[Graphics[
	Polygon[Join[
			{{xmin, 0}},
			Plot[f, {x, xmin, xmax},
			DisplayFunction->Identity
						][[1,2,1,1]],
			{{xmax, 0}}
				]
		   ]
	  ], Axes->Automatic, options]
:[font = input; startGroup; ]
FillPlot[BesselJ[0, x], {x, 0, 8}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 46; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.11905 0.18371 0.4196 [
[(2.)] 0.2619 0.17121 0 1 Msboxa
[(4.)] 0.5 0.17121 0 1 Msboxa
[(6.)] 0.7381 0.17121 0 1 Msboxa
[(8.)] 0.97619 0.17121 0 1 Msboxa
[(-0.4)] 0.01131 0.01587 1 0 Msboxa
[(-0.2)] 0.01131 0.09979 1 0 Msboxa
[(0.2)] 0.01131 0.26764 1 0 Msboxa
[(0.4)] 0.01131 0.35156 1 0 Msboxa
[(0.6)] 0.01131 0.43548 1 0 Msboxa
[(0.8)] 0.01131 0.5194 1 0 Msboxa
[(1.)] 0.01131 0.60332 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.18371 moveto
1 0.18371 lineto
stroke
0.2619 0.17746 moveto
0.2619 0.18996 lineto
stroke
[(2.)] 0.2619 0.17121 0 1 Mshowa
0.5 0.17746 moveto
0.5 0.18996 lineto
stroke
[(4.)] 0.5 0.17121 0 1 Mshowa
0.7381 0.17746 moveto
0.7381 0.18996 lineto
stroke
[(6.)] 0.7381 0.17121 0 1 Mshowa
0.97619 0.17746 moveto
0.97619 0.18996 lineto
stroke
[(8.)] 0.97619 0.17121 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.01587 moveto
0.03006 0.01587 lineto
stroke
[(-0.4)] 0.01131 0.01587 1 0 Mshowa
0.01756 0.09979 moveto
0.03006 0.09979 lineto
stroke
[(-0.2)] 0.01131 0.09979 1 0 Mshowa
0.01756 0.26764 moveto
0.03006 0.26764 lineto
stroke
[(0.2)] 0.01131 0.26764 1 0 Mshowa
0.01756 0.35156 moveto
0.03006 0.35156 lineto
stroke
[(0.4)] 0.01131 0.35156 1 0 Mshowa
0.01756 0.43548 moveto
0.03006 0.43548 lineto
stroke
[(0.6)] 0.01131 0.43548 1 0 Mshowa
0.01756 0.5194 moveto
0.03006 0.5194 lineto
stroke
[(0.8)] 0.01131 0.5194 1 0 Mshowa
0.01756 0.60332 moveto
0.03006 0.60332 lineto
stroke
[(1.)] 0.01131 0.60332 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.18371 moveto
0.02381 0.60332 lineto
0.02505 0.60331 lineto
0.02629 0.60327 lineto
0.02753 0.60322 lineto
0.02877 0.60314 lineto
0.03125 0.60291 lineto
0.03373 0.60259 lineto
0.03621 0.60218 lineto
0.03869 0.60168 lineto
0.04365 0.60041 lineto
0.04861 0.59878 lineto
0.05357 0.59679 lineto
0.06349 0.59174 lineto
0.08333 0.5775 lineto
0.10317 0.55798 lineto
0.14286 0.50479 lineto
0.18254 0.43655 lineto
0.22222 0.35878 lineto
0.2619 0.27766 lineto
0.30159 0.19951 lineto
0.34127 0.13019 lineto
0.36111 0.10042 lineto
0.38095 0.0746 lineto
0.40079 0.05311 lineto
0.42063 0.03626 lineto
0.43056 0.02963 lineto
0.44048 0.02421 lineto
0.4504 0.02002 lineto
0.45536 0.01838 lineto
0.46032 0.01705 lineto
0.46528 0.01601 lineto
0.46776 0.01561 lineto
0.47024 0.01528 lineto
0.47272 0.01503 lineto
0.47396 0.01493 lineto
0.4752 0.01485 lineto
0.47644 0.01479 lineto
0.47768 0.01475 lineto
0.47892 0.01472 lineto
0.48016 0.01472 lineto
0.4814 0.01473 lineto
0.48264 0.01476 lineto
0.48388 0.01481 lineto
0.48512 0.01487 lineto
0.48636 0.01496 lineto
0.4876 0.01506 lineto
0.49008 0.01532 lineto
0.49504 0.01605 lineto
0.5 0.01707 lineto
0.50992 0.01993 lineto
0.51984 0.02385 lineto
0.53968 0.03471 lineto
0.55952 0.04921 lineto
0.57937 0.06685 lineto
0.61905 0.10919 lineto
0.65873 0.15675 lineto
0.69841 0.2043 lineto
0.7381 0.24693 lineto
0.75794 0.26506 lineto
0.77778 0.28048 lineto
0.79762 0.29285 lineto
0.80754 0.29781 lineto
0.81746 0.30193 lineto
0.82738 0.30517 lineto
0.8373 0.30754 lineto
0.84226 0.30839 lineto
0.84474 0.30874 lineto
0.84722 0.30903 lineto
0.8497 0.30926 lineto
0.85218 0.30944 lineto
0.85342 0.30951 lineto
0.85466 0.30956 lineto
0.8559 0.3096 lineto
0.85714 0.30963 lineto
0.85838 0.30964 lineto
0.85962 0.30964 lineto
0.86086 0.30963 lineto
0.8621 0.3096 lineto
0.86334 0.30956 lineto
0.86458 0.30951 lineto
0.86582 0.30944 lineto
0.86706 0.30936 lineto
0.87202 0.3089 lineto
0.8745 0.30858 lineto
0.87698 0.30822 lineto
0.8869 0.30624 lineto
0.89683 0.30343 lineto
0.91667 0.29547 lineto
0.93651 0.28462 lineto
0.97619 0.25574 lineto
0.97619 0.18371 lineto
fill
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; endGroup; ]
The Unformatted text for this cell was not generated.
Use options in the Actions Settings dialog box to control
when Unformatted text is generated.
;[o]
-Graphics-
:[font = text; inactive; endGroup; ]
     This version is pretty good.  We have also allowed an options arbitrary number of extra arguments, which are simply passed on to Show.  This allows you to, for example, set the plot range manually.  We will use this feature in the next section.
;[s]
3:0,0;134,1;138,2;250,-1;
3:1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;
:[font = section; inactive; Cclosed; startGroup; ]
Adding Motion
:[font = text; inactive; ]
     Once you have defined a function which produces graphics, it is relatively easy to create animations using it.  For example, we can make an animation using the FillPlot function defined in the section above:
;[s]
3:0,0;165,1;173,2;213,-1;
3:1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;
:[font = input; startGroup; ]
Do[FillPlot[BesselJ[n, x], {x, 0, 20},
			PlotRange->{-0.4, 0.65}], 
   {n, 1, 10, 0.2}];
:[font = postscript; PostScript; formatAsPostScript; output; inactive; Cclosed; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; startGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.04365 0.35543 lineto
0.06349 0.46001 lineto
0.07341 0.50226 lineto
0.08333 0.536 lineto
0.08829 0.54934 lineto
0.09325 0.56021 lineto
0.09573 0.56469 lineto
0.09821 0.56853 lineto
0.10069 0.57171 lineto
0.10317 0.57424 lineto
0.10441 0.57526 lineto
0.10565 0.57612 lineto
0.10689 0.57681 lineto
0.10813 0.57733 lineto
0.10938 0.57769 lineto
0.11062 0.57789 lineto
0.11186 0.57792 lineto
0.1131 0.57779 lineto
0.11434 0.5775 lineto
0.11558 0.57704 lineto
0.11682 0.57642 lineto
0.11806 0.57564 lineto
0.12302 0.57093 lineto
0.1255 0.56763 lineto
0.12798 0.56371 lineto
0.13294 0.55408 lineto
0.14286 0.52803 lineto
0.15278 0.49386 lineto
0.1627 0.45293 lineto
0.18254 0.35723 lineto
0.22222 0.16064 lineto
0.24206 0.08682 lineto
0.24702 0.07273 lineto
0.25198 0.06062 lineto
0.25694 0.05057 lineto
0.2619 0.04263 lineto
0.26438 0.03946 lineto
0.26687 0.03683 lineto
0.26935 0.03475 lineto
0.27059 0.03391 lineto
0.27183 0.03321 lineto
0.27307 0.03264 lineto
0.27431 0.03221 lineto
0.27555 0.03191 lineto
0.27679 0.03175 lineto
0.27803 0.03172 lineto
0.27927 0.03182 lineto
0.28051 0.03205 lineto
0.28175 0.03242 lineto
0.28423 0.03355 lineto
0.28547 0.0343 lineto
0.28671 0.03519 lineto
0.29167 0.03998 lineto
0.29663 0.04673 lineto
0.30159 0.05531 lineto
0.31151 0.07753 lineto
0.32143 0.10552 lineto
0.34127 0.17347 lineto
0.36111 0.24734 lineto
0.38095 0.31505 lineto
0.39087 0.34319 lineto
0.40079 0.36607 lineto
0.41071 0.38286 lineto
0.41567 0.38879 lineto
0.41815 0.39112 lineto
0.42063 0.39302 lineto
0.42312 0.39449 lineto
0.42436 0.39507 lineto
0.4256 0.39553 lineto
0.42684 0.39589 lineto
0.42808 0.39613 lineto
0.42932 0.39627 lineto
0.43056 0.3963 lineto
0.4318 0.39623 lineto
0.43304 0.39605 lineto
0.43428 0.39576 lineto
0.43552 0.39536 lineto
0.438 0.39425 lineto
0.44048 0.39273 lineto
0.44296 0.39079 lineto
0.44544 0.38845 lineto
0.4504 0.3826 lineto
0.46032 0.36649 lineto
0.47024 0.34521 lineto
0.48016 0.31975 lineto
0.5 0.26103 lineto
0.51984 0.20046 lineto
0.52976 0.17267 lineto
0.53968 0.14809 lineto
0.5496 0.12768 lineto
0.55456 0.11929 lineto
0.55952 0.11223 lineto
0.56448 0.10655 lineto
0.56696 0.10425 lineto
0.56944 0.10231 lineto
0.57192 0.10073 lineto
0.57316 0.10008 lineto
0.5744 0.09952 lineto
0.57564 0.09906 lineto
0.57688 0.09869 lineto
0.57813 0.09841 lineto
0.57937 0.09822 lineto
0.58061 0.09813 lineto
0.58185 0.09813 lineto
0.58309 0.09822 lineto
0.58433 0.0984 lineto
0.58557 0.09868 lineto
0.58681 0.09905 lineto
0.58929 0.10005 lineto
0.59177 0.10142 lineto
0.59425 0.10313 lineto
0.59921 0.10761 lineto
0.60417 0.11342 lineto
0.60913 0.12048 lineto
0.61905 0.13804 lineto
0.65873 0.23668 lineto
0.67857 0.28777 lineto
0.68849 0.30991 lineto
0.69841 0.32855 lineto
0.70833 0.34294 lineto
0.71329 0.34836 lineto
0.71577 0.3506 lineto
0.71825 0.35253 lineto
0.72073 0.35413 lineto
0.72321 0.35541 lineto
0.72445 0.35592 lineto
0.72569 0.35636 lineto
0.72693 0.35671 lineto
0.72817 0.35698 lineto
0.72941 0.35716 lineto
0.73065 0.35727 lineto
0.73189 0.35729 lineto
0.73313 0.35723 lineto
0.73437 0.35708 lineto
0.73562 0.35686 lineto
0.73686 0.35655 lineto
0.7381 0.35617 lineto
0.74058 0.35515 lineto
0.74306 0.35382 lineto
0.74802 0.35021 lineto
0.75298 0.34539 lineto
0.75794 0.33942 lineto
0.77778 0.30564 lineto
0.81746 0.21305 lineto
0.8373 0.17013 lineto
0.84722 0.15282 lineto
0.85218 0.14553 lineto
0.85714 0.13925 lineto
0.8621 0.13405 lineto
0.86706 0.12997 lineto
0.86954 0.12836 lineto
0.87202 0.12705 lineto
0.8745 0.12603 lineto
0.87574 0.12564 lineto
0.87698 0.12531 lineto
0.87822 0.12507 lineto
0.87946 0.12489 lineto
0.8807 0.1248 lineto
0.88194 0.12478 lineto
0.88318 0.12483 lineto
0.88442 0.12496 lineto
0.88566 0.12516 lineto
0.8869 0.12543 lineto
0.88938 0.12621 lineto
0.89187 0.12727 lineto
0.89435 0.12863 lineto
0.89683 0.13027 lineto
0.90179 0.13438 lineto
0.90675 0.13956 lineto
0.91667 0.15285 lineto
0.93651 0.18888 lineto
0.97619 0.27478 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.06349 0.40793 lineto
0.07341 0.45079 lineto
0.08333 0.4886 lineto
0.09325 0.51979 lineto
0.09821 0.5325 lineto
0.10317 0.54311 lineto
0.10813 0.55152 lineto
0.11062 0.55487 lineto
0.1131 0.55764 lineto
0.11558 0.55983 lineto
0.11682 0.5607 lineto
0.11806 0.56143 lineto
0.1193 0.56201 lineto
0.12054 0.56244 lineto
0.12178 0.56272 lineto
0.12302 0.56285 lineto
0.12426 0.56283 lineto
0.1255 0.56266 lineto
0.12674 0.56234 lineto
0.12798 0.56188 lineto
0.12922 0.56127 lineto
0.13046 0.56051 lineto
0.13294 0.55854 lineto
0.13542 0.55599 lineto
0.1379 0.55287 lineto
0.14286 0.54491 lineto
0.15278 0.52248 lineto
0.1627 0.4921 lineto
0.18254 0.41231 lineto
0.22222 0.22018 lineto
0.24206 0.13479 lineto
0.25198 0.10008 lineto
0.2619 0.07223 lineto
0.26687 0.06113 lineto
0.27183 0.05202 lineto
0.27679 0.04496 lineto
0.27927 0.04221 lineto
0.28175 0.03998 lineto
0.28423 0.03827 lineto
0.28547 0.03762 lineto
0.28671 0.03709 lineto
0.28795 0.03669 lineto
0.28919 0.03643 lineto
0.29043 0.03629 lineto
0.29167 0.03628 lineto
0.29291 0.0364 lineto
0.29415 0.03665 lineto
0.29539 0.03703 lineto
0.29663 0.03753 lineto
0.29911 0.03891 lineto
0.30159 0.04079 lineto
0.30655 0.046 lineto
0.31151 0.05306 lineto
0.32143 0.07237 lineto
0.33135 0.09772 lineto
0.34127 0.12793 lineto
0.38095 0.26902 lineto
0.40079 0.33132 lineto
0.41071 0.35588 lineto
0.41567 0.36609 lineto
0.42063 0.37479 lineto
0.4256 0.38192 lineto
0.42808 0.38487 lineto
0.43056 0.38741 lineto
0.43304 0.38953 lineto
0.43552 0.39122 lineto
0.43676 0.39191 lineto
0.438 0.3925 lineto
0.43924 0.39298 lineto
0.44048 0.39335 lineto
0.44172 0.39362 lineto
0.44296 0.39378 lineto
0.4442 0.39383 lineto
0.44544 0.39378 lineto
0.44668 0.39363 lineto
0.44792 0.39336 lineto
0.44916 0.393 lineto
0.4504 0.39253 lineto
0.45536 0.38963 lineto
0.45784 0.38758 lineto
0.46032 0.38514 lineto
0.47024 0.37162 lineto
0.48016 0.35266 lineto
0.5 0.30224 lineto
0.51984 0.24284 lineto
0.53968 0.18455 lineto
0.5496 0.15886 lineto
0.55952 0.1369 lineto
0.56448 0.12759 lineto
0.56944 0.11951 lineto
0.5744 0.11275 lineto
0.57937 0.10735 lineto
0.58433 0.10338 lineto
0.58681 0.10193 lineto
0.58805 0.10134 lineto
0.58929 0.10084 lineto
0.59053 0.10044 lineto
0.59177 0.10012 lineto
0.59301 0.0999 lineto
0.59425 0.09977 lineto
0.59549 0.09973 lineto
0.59673 0.09978 lineto
0.59797 0.09992 lineto
0.59921 0.10016 lineto
0.60045 0.10048 lineto
0.60169 0.10089 lineto
0.60417 0.10199 lineto
0.60665 0.10343 lineto
0.60913 0.10523 lineto
0.61409 0.10983 lineto
0.61905 0.11574 lineto
0.62897 0.13117 lineto
0.63889 0.15078 lineto
0.65873 0.19884 lineto
0.67857 0.25154 lineto
0.69841 0.29997 lineto
0.70833 0.32003 lineto
0.71825 0.33619 lineto
0.72321 0.34261 lineto
0.72817 0.34783 lineto
0.73065 0.34998 lineto
0.73313 0.35181 lineto
0.73562 0.35332 lineto
0.7381 0.35451 lineto
0.73934 0.35498 lineto
0.74058 0.35537 lineto
0.74182 0.35569 lineto
0.74306 0.35591 lineto
0.7443 0.35606 lineto
0.74554 0.35613 lineto
0.74678 0.35611 lineto
0.74802 0.35602 lineto
0.74926 0.35584 lineto
0.7505 0.35558 lineto
0.75174 0.35524 lineto
0.75298 0.35482 lineto
0.75794 0.35235 lineto
0.76042 0.35065 lineto
0.7629 0.34865 lineto
0.76786 0.34375 lineto
0.77778 0.33063 lineto
0.79762 0.29349 lineto
0.81746 0.24753 lineto
0.8373 0.20068 lineto
0.84722 0.17941 lineto
0.85714 0.1608 lineto
0.86706 0.1456 lineto
0.87698 0.13443 lineto
0.88194 0.13049 lineto
0.88442 0.12895 lineto
0.8869 0.1277 lineto
0.88814 0.12719 lineto
0.88938 0.12675 lineto
0.89062 0.12638 lineto
0.89187 0.12609 lineto
0.89311 0.12588 lineto
0.89435 0.12573 lineto
0.89559 0.12566 lineto
0.89683 0.12567 lineto
0.89807 0.12575 lineto
0.89931 0.1259 lineto
0.90055 0.12613 lineto
0.90179 0.12643 lineto
0.90427 0.12725 lineto
0.90675 0.12836 lineto
0.91171 0.13143 lineto
0.91667 0.1356 lineto
0.92659 0.14705 lineto
0.93651 0.16215 lineto
0.97619 0.2439 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.06349 0.36474 lineto
0.08333 0.44313 lineto
0.09325 0.47756 lineto
0.10317 0.50662 lineto
0.10813 0.51871 lineto
0.1131 0.529 lineto
0.11806 0.53736 lineto
0.12302 0.54369 lineto
0.1255 0.54608 lineto
0.12798 0.54793 lineto
0.12922 0.54866 lineto
0.13046 0.54925 lineto
0.1317 0.5497 lineto
0.13294 0.55002 lineto
0.13418 0.5502 lineto
0.13542 0.55025 lineto
0.13666 0.55015 lineto
0.1379 0.54992 lineto
0.13914 0.54956 lineto
0.14038 0.54905 lineto
0.14162 0.54841 lineto
0.14286 0.54763 lineto
0.14782 0.54316 lineto
0.1503 0.54012 lineto
0.15278 0.53654 lineto
0.1627 0.51708 lineto
0.17262 0.48991 lineto
0.18254 0.45598 lineto
0.22222 0.27935 lineto
0.24206 0.18846 lineto
0.25198 0.14793 lineto
0.2619 0.11252 lineto
0.27183 0.08335 lineto
0.27679 0.07139 lineto
0.28175 0.06131 lineto
0.28671 0.05316 lineto
0.29167 0.047 lineto
0.29415 0.04467 lineto
0.29663 0.04285 lineto
0.29911 0.04154 lineto
0.30035 0.04107 lineto
0.30159 0.04072 lineto
0.30283 0.04051 lineto
0.30407 0.04041 lineto
0.30531 0.04045 lineto
0.30655 0.0406 lineto
0.30779 0.04088 lineto
0.30903 0.04129 lineto
0.31151 0.04246 lineto
0.31399 0.04412 lineto
0.31647 0.04625 lineto
0.32143 0.05191 lineto
0.32639 0.05934 lineto
0.33135 0.06846 lineto
0.34127 0.09126 lineto
0.38095 0.22101 lineto
0.40079 0.28944 lineto
0.41071 0.31966 lineto
0.42063 0.34563 lineto
0.43056 0.36638 lineto
0.43552 0.37456 lineto
0.44048 0.38119 lineto
0.44296 0.3839 lineto
0.44544 0.3862 lineto
0.44792 0.38809 lineto
0.4504 0.38957 lineto
0.45164 0.39016 lineto
0.45288 0.39064 lineto
0.45412 0.39101 lineto
0.45536 0.39129 lineto
0.4566 0.39145 lineto
0.45784 0.39152 lineto
0.45908 0.39148 lineto
0.46032 0.39134 lineto
0.46156 0.39109 lineto
0.4628 0.39075 lineto
0.46404 0.3903 lineto
0.46528 0.38975 lineto
0.47024 0.38655 lineto
0.47272 0.38437 lineto
0.4752 0.3818 lineto
0.48016 0.37555 lineto
0.49008 0.35892 lineto
0.5 0.33746 lineto
0.53968 0.22492 lineto
0.55952 0.16966 lineto
0.56944 0.14639 lineto
0.57937 0.12729 lineto
0.58433 0.11955 lineto
0.58929 0.1131 lineto
0.59425 0.10802 lineto
0.59921 0.10434 lineto
0.60169 0.10303 lineto
0.60293 0.10251 lineto
0.60417 0.10208 lineto
0.60541 0.10174 lineto
0.60665 0.10149 lineto
0.60789 0.10133 lineto
0.60913 0.10127 lineto
0.61037 0.10129 lineto
0.61161 0.1014 lineto
0.61285 0.1016 lineto
0.61409 0.10189 lineto
0.61533 0.10226 lineto
0.61657 0.10273 lineto
0.61905 0.10392 lineto
0.62153 0.10547 lineto
0.62401 0.10735 lineto
0.62897 0.11211 lineto
0.63889 0.12539 lineto
0.64881 0.14312 lineto
0.65873 0.16449 lineto
0.69841 0.26599 lineto
0.70833 0.28991 lineto
0.71825 0.31117 lineto
0.72817 0.3289 lineto
0.73313 0.33622 lineto
0.7381 0.34241 lineto
0.74306 0.34741 lineto
0.74554 0.34945 lineto
0.74802 0.35118 lineto
0.7505 0.35259 lineto
0.75298 0.35368 lineto
0.75422 0.3541 lineto
0.75546 0.35445 lineto
0.7567 0.35471 lineto
0.75794 0.35489 lineto
0.75918 0.355 lineto
0.76042 0.35502 lineto
0.76166 0.35496 lineto
0.7629 0.35482 lineto
0.76414 0.35461 lineto
0.76538 0.35431 lineto
0.76662 0.35393 lineto
0.76786 0.35347 lineto
0.77282 0.35087 lineto
0.7753 0.34911 lineto
0.77778 0.34704 lineto
0.7877 0.33594 lineto
0.79762 0.32069 lineto
0.81746 0.28071 lineto
0.8373 0.23412 lineto
0.85714 0.18887 lineto
0.87698 0.15252 lineto
0.88194 0.14556 lineto
0.8869 0.13961 lineto
0.89187 0.13472 lineto
0.89435 0.13269 lineto
0.89683 0.13094 lineto
0.89931 0.12948 lineto
0.90179 0.12831 lineto
0.90427 0.12743 lineto
0.90551 0.1271 lineto
0.90675 0.12684 lineto
0.90799 0.12666 lineto
0.90923 0.12655 lineto
0.91047 0.12651 lineto
0.91171 0.12655 lineto
0.91295 0.12666 lineto
0.91419 0.12684 lineto
0.91543 0.1271 lineto
0.91667 0.12743 lineto
0.91915 0.1283 lineto
0.92163 0.12946 lineto
0.92659 0.13263 lineto
0.93155 0.13688 lineto
0.93651 0.14217 lineto
0.94643 0.1556 lineto
0.95635 0.17231 lineto
0.97619 0.21244 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23584 lineto
0.02629 0.23664 lineto
0.02877 0.23908 lineto
0.03125 0.24239 lineto
0.03373 0.24644 lineto
0.04365 0.26835 lineto
0.06349 0.33028 lineto
0.10317 0.46838 lineto
0.1131 0.49563 lineto
0.11806 0.50716 lineto
0.12302 0.5171 lineto
0.12798 0.52533 lineto
0.13294 0.53176 lineto
0.13542 0.53426 lineto
0.1379 0.53629 lineto
0.14038 0.53782 lineto
0.14162 0.5384 lineto
0.14286 0.53885 lineto
0.1441 0.53918 lineto
0.14534 0.53938 lineto
0.14658 0.53946 lineto
0.14782 0.53941 lineto
0.14906 0.53923 lineto
0.1503 0.53893 lineto
0.15154 0.5385 lineto
0.15278 0.53794 lineto
0.15526 0.53643 lineto
0.15774 0.53442 lineto
0.1627 0.52889 lineto
0.16766 0.52136 lineto
0.17262 0.51189 lineto
0.18254 0.48746 lineto
0.20238 0.41967 lineto
0.22222 0.33463 lineto
0.24206 0.24396 lineto
0.2619 0.16001 lineto
0.27183 0.12414 lineto
0.28175 0.09396 lineto
0.29167 0.0704 lineto
0.29663 0.06133 lineto
0.30159 0.05414 lineto
0.30655 0.04889 lineto
0.30903 0.04699 lineto
0.31027 0.04623 lineto
0.31151 0.04558 lineto
0.31275 0.04506 lineto
0.31399 0.04466 lineto
0.31523 0.04439 lineto
0.31647 0.04423 lineto
0.31771 0.0442 lineto
0.31895 0.04428 lineto
0.32019 0.04449 lineto
0.32143 0.04482 lineto
0.32267 0.04527 lineto
0.32391 0.04583 lineto
0.32639 0.04731 lineto
0.32887 0.04926 lineto
0.33135 0.05166 lineto
0.33631 0.05779 lineto
0.34127 0.06563 lineto
0.35119 0.08598 lineto
0.36111 0.11175 lineto
0.38095 0.17475 lineto
0.40079 0.24399 lineto
0.42063 0.3083 lineto
0.43056 0.33541 lineto
0.44048 0.35775 lineto
0.44544 0.36686 lineto
0.4504 0.3745 lineto
0.45536 0.3806 lineto
0.45784 0.38306 lineto
0.46032 0.38512 lineto
0.4628 0.38677 lineto
0.46404 0.38744 lineto
0.46528 0.38802 lineto
0.46652 0.38849 lineto
0.46776 0.38885 lineto
0.469 0.38912 lineto
0.47024 0.38929 lineto
0.47148 0.38935 lineto
0.47272 0.38931 lineto
0.47396 0.38917 lineto
0.4752 0.38893 lineto
0.47768 0.38815 lineto
0.47892 0.38761 lineto
0.48016 0.38697 lineto
0.48512 0.38345 lineto
0.4876 0.38111 lineto
0.49008 0.37841 lineto
0.5 0.36407 lineto
0.50992 0.34466 lineto
0.51984 0.32108 lineto
0.53968 0.26575 lineto
0.55952 0.20753 lineto
0.57937 0.15603 lineto
0.58929 0.13545 lineto
0.59921 0.11943 lineto
0.60417 0.11334 lineto
0.60913 0.10858 lineto
0.61161 0.10673 lineto
0.61409 0.10522 lineto
0.61533 0.1046 lineto
0.61657 0.10406 lineto
0.61781 0.10362 lineto
0.61905 0.10326 lineto
0.62029 0.103 lineto
0.62153 0.10282 lineto
0.62277 0.10273 lineto
0.62401 0.10273 lineto
0.62525 0.10282 lineto
0.62649 0.10299 lineto
0.62773 0.10326 lineto
0.62897 0.10361 lineto
0.63021 0.10405 lineto
0.63145 0.10457 lineto
0.63393 0.10588 lineto
0.63889 0.10951 lineto
0.64385 0.11445 lineto
0.64881 0.12064 lineto
0.65873 0.13645 lineto
0.67857 0.179 lineto
0.69841 0.22967 lineto
0.71825 0.27982 lineto
0.72817 0.30207 lineto
0.7381 0.32117 lineto
0.74802 0.33637 lineto
0.75298 0.34231 lineto
0.75794 0.34707 lineto
0.76042 0.349 lineto
0.7629 0.35061 lineto
0.76538 0.35191 lineto
0.76662 0.35244 lineto
0.76786 0.35289 lineto
0.7691 0.35326 lineto
0.77034 0.35356 lineto
0.77158 0.35377 lineto
0.77282 0.3539 lineto
0.77406 0.35396 lineto
0.7753 0.35393 lineto
0.77654 0.35382 lineto
0.77778 0.35364 lineto
0.78026 0.35303 lineto
0.7815 0.35261 lineto
0.78274 0.35211 lineto
0.7877 0.34935 lineto
0.79018 0.34752 lineto
0.79266 0.34539 lineto
0.79762 0.34027 lineto
0.80754 0.32685 lineto
0.81746 0.3097 lineto
0.85714 0.22085 lineto
0.87698 0.1778 lineto
0.8869 0.15989 lineto
0.89683 0.14541 lineto
0.90179 0.13964 lineto
0.90675 0.13493 lineto
0.91171 0.13133 lineto
0.91419 0.12995 lineto
0.91667 0.12887 lineto
0.91915 0.12807 lineto
0.92039 0.12778 lineto
0.92163 0.12756 lineto
0.92287 0.12741 lineto
0.92411 0.12734 lineto
0.92535 0.12734 lineto
0.92659 0.12742 lineto
0.92783 0.12756 lineto
0.92907 0.12778 lineto
0.93031 0.12807 lineto
0.93155 0.12843 lineto
0.93403 0.12937 lineto
0.93651 0.1306 lineto
0.94147 0.13387 lineto
0.94643 0.13822 lineto
0.95635 0.14991 lineto
0.96627 0.16514 lineto
0.97619 0.18321 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23558 lineto
0.02629 0.23594 lineto
0.02877 0.23716 lineto
0.03001 0.23801 lineto
0.03125 0.239 lineto
0.03373 0.24141 lineto
0.03869 0.24776 lineto
0.04365 0.25597 lineto
0.05357 0.27722 lineto
0.06349 0.30366 lineto
0.10317 0.43106 lineto
0.12302 0.48628 lineto
0.13294 0.50689 lineto
0.1379 0.51496 lineto
0.14286 0.52139 lineto
0.14782 0.5261 lineto
0.1503 0.52779 lineto
0.15154 0.52846 lineto
0.15278 0.52901 lineto
0.15402 0.52945 lineto
0.15526 0.52978 lineto
0.1565 0.52998 lineto
0.15774 0.53007 lineto
0.15898 0.53004 lineto
0.16022 0.52989 lineto
0.16146 0.52963 lineto
0.1627 0.52924 lineto
0.16394 0.52873 lineto
0.16518 0.52811 lineto
0.16766 0.5265 lineto
0.17014 0.52441 lineto
0.17262 0.52185 lineto
0.17758 0.51531 lineto
0.18254 0.50693 lineto
0.19246 0.48484 lineto
0.20238 0.45625 lineto
0.22222 0.38337 lineto
0.2619 0.21121 lineto
0.28175 0.13501 lineto
0.29167 0.10406 lineto
0.30159 0.07925 lineto
0.30655 0.06939 lineto
0.31151 0.06132 lineto
0.31399 0.05797 lineto
0.31647 0.05509 lineto
0.31895 0.05268 lineto
0.32143 0.05074 lineto
0.32267 0.04994 lineto
0.32391 0.04927 lineto
0.32515 0.04872 lineto
0.32639 0.04828 lineto
0.32763 0.04796 lineto
0.32887 0.04776 lineto
0.33011 0.04768 lineto
0.33135 0.04771 lineto
0.33259 0.04787 lineto
0.33383 0.04813 lineto
0.33631 0.04902 lineto
0.33755 0.04963 lineto
0.33879 0.05036 lineto
0.34127 0.05216 lineto
0.34623 0.05708 lineto
0.35119 0.0637 lineto
0.36111 0.08172 lineto
0.37103 0.10534 lineto
0.38095 0.13351 lineto
0.42063 0.26599 lineto
0.44048 0.32531 lineto
0.4504 0.349 lineto
0.45536 0.35893 lineto
0.46032 0.36747 lineto
0.46528 0.37455 lineto
0.47024 0.38011 lineto
0.47272 0.3823 lineto
0.4752 0.3841 lineto
0.47768 0.3855 lineto
0.47892 0.38605 lineto
0.48016 0.3865 lineto
0.4814 0.38686 lineto
0.48264 0.38711 lineto
0.48388 0.38726 lineto
0.48512 0.38731 lineto
0.48636 0.38726 lineto
0.4876 0.38712 lineto
0.48884 0.38687 lineto
0.49008 0.38653 lineto
0.49256 0.38555 lineto
0.49504 0.38418 lineto
0.5 0.3803 lineto
0.50496 0.37495 lineto
0.50992 0.3682 lineto
0.51984 0.35084 lineto
0.53968 0.30375 lineto
0.55952 0.24729 lineto
0.57937 0.19093 lineto
0.59921 0.14387 lineto
0.60913 0.12623 lineto
0.61409 0.11921 lineto
0.61905 0.11347 lineto
0.62153 0.1111 lineto
0.62401 0.10907 lineto
0.62649 0.10739 lineto
0.62897 0.10605 lineto
0.63021 0.10551 lineto
0.63145 0.10506 lineto
0.63269 0.10469 lineto
0.63393 0.10442 lineto
0.63517 0.10423 lineto
0.63641 0.10412 lineto
0.63765 0.10411 lineto
0.63889 0.10418 lineto
0.64013 0.10434 lineto
0.64137 0.10459 lineto
0.64385 0.10534 lineto
0.64509 0.10585 lineto
0.64633 0.10644 lineto
0.64881 0.10787 lineto
0.65377 0.11173 lineto
0.65873 0.11687 lineto
0.66865 0.13073 lineto
0.67857 0.14879 lineto
0.69841 0.19411 lineto
0.71825 0.24497 lineto
0.7381 0.29282 lineto
0.74802 0.3131 lineto
0.75794 0.32981 lineto
0.7629 0.33662 lineto
0.76786 0.3423 lineto
0.77282 0.34681 lineto
0.7753 0.3486 lineto
0.77778 0.35009 lineto
0.78026 0.35127 lineto
0.7815 0.35174 lineto
0.78274 0.35214 lineto
0.78398 0.35245 lineto
0.78522 0.35269 lineto
0.78646 0.35285 lineto
0.7877 0.35292 lineto
0.78894 0.35292 lineto
0.79018 0.35284 lineto
0.79142 0.35269 lineto
0.79266 0.35245 lineto
0.79514 0.35175 lineto
0.79638 0.35128 lineto
0.79762 0.35073 lineto
0.80258 0.34779 lineto
0.80754 0.34367 lineto
0.81746 0.33211 lineto
0.82738 0.31658 lineto
0.8373 0.2978 lineto
0.85714 0.25389 lineto
0.87698 0.20792 lineto
0.8869 0.18661 lineto
0.89683 0.16763 lineto
0.90675 0.15174 lineto
0.91171 0.14517 lineto
0.91667 0.1396 lineto
0.92163 0.13509 lineto
0.92659 0.13168 lineto
0.92907 0.13039 lineto
0.93155 0.12939 lineto
0.93279 0.129 lineto
0.93403 0.12868 lineto
0.93527 0.12844 lineto
0.93651 0.12826 lineto
0.97619 0.15874 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23549 lineto
0.02629 0.23564 lineto
0.02753 0.23589 lineto
0.02877 0.23624 lineto
0.03001 0.23669 lineto
0.03125 0.23723 lineto
0.03373 0.23862 lineto
0.03869 0.24257 lineto
0.04365 0.24803 lineto
0.05357 0.26326 lineto
0.06349 0.28364 lineto
0.10317 0.39643 lineto
0.12302 0.45386 lineto
0.13294 0.47819 lineto
0.14286 0.49799 lineto
0.14782 0.50588 lineto
0.15278 0.51228 lineto
0.15526 0.51489 lineto
0.15774 0.5171 lineto
0.16022 0.51889 lineto
0.1627 0.52026 lineto
0.16394 0.52079 lineto
0.16518 0.5212 lineto
0.16642 0.52151 lineto
0.16766 0.52171 lineto
0.1689 0.52179 lineto
0.17014 0.52177 lineto
0.17138 0.52163 lineto
0.17262 0.52139 lineto
0.17386 0.52103 lineto
0.1751 0.52056 lineto
0.17758 0.51928 lineto
0.18006 0.51755 lineto
0.18254 0.51537 lineto
0.1875 0.50966 lineto
0.19246 0.5022 lineto
0.20238 0.48214 lineto
0.2123 0.45574 lineto
0.22222 0.42379 lineto
0.2619 0.26285 lineto
0.28175 0.18135 lineto
0.29167 0.14517 lineto
0.30159 0.11365 lineto
0.31151 0.08781 lineto
0.32143 0.06844 lineto
0.32639 0.06136 lineto
0.32887 0.0585 lineto
0.33135 0.05609 lineto
0.33383 0.05413 lineto
0.33631 0.05264 lineto
0.33755 0.05206 lineto
0.33879 0.0516 lineto
0.34003 0.05126 lineto
0.34127 0.05103 lineto
0.34251 0.05091 lineto
0.34375 0.05091 lineto
0.34499 0.05102 lineto
0.34623 0.05125 lineto
0.34747 0.05159 lineto
0.34871 0.05204 lineto
0.34995 0.0526 lineto
0.35119 0.05327 lineto
0.35615 0.05706 lineto
0.35863 0.0596 lineto
0.36111 0.06256 lineto
0.37103 0.07835 lineto
0.38095 0.0999 lineto
0.42063 0.22199 lineto
0.44048 0.28667 lineto
0.4504 0.31539 lineto
0.46032 0.34021 lineto
0.47024 0.3602 lineto
0.4752 0.36815 lineto
0.48016 0.37465 lineto
0.48512 0.37965 lineto
0.4876 0.38157 lineto
0.49008 0.3831 lineto
0.49256 0.38424 lineto
0.4938 0.38467 lineto
0.49504 0.38499 lineto
0.49628 0.38522 lineto
0.49752 0.38535 lineto
0.49876 0.38538 lineto
0.5 0.38532 lineto
0.50124 0.38516 lineto
0.50248 0.3849 lineto
0.50496 0.38409 lineto
0.5062 0.38354 lineto
0.50744 0.3829 lineto
0.50992 0.38133 lineto
0.51488 0.37708 lineto
0.51984 0.37141 lineto
0.52976 0.35608 lineto
0.53968 0.33607 lineto
0.57937 0.22905 lineto
0.59921 0.1754 lineto
0.60913 0.15248 lineto
0.61905 0.1334 lineto
0.62897 0.11891 lineto
0.63393 0.11355 lineto
0.63641 0.11137 lineto
0.63889 0.10952 lineto
0.64137 0.10802 lineto
0.64385 0.10685 lineto
0.64509 0.1064 lineto
0.64633 0.10603 lineto
0.64757 0.10575 lineto
0.64881 0.10556 lineto
0.65005 0.10545 lineto
0.65129 0.10543 lineto
0.65253 0.1055 lineto
0.65377 0.10565 lineto
0.65501 0.10589 lineto
0.65625 0.10621 lineto
0.65873 0.10711 lineto
0.66121 0.10834 lineto
0.66369 0.10991 lineto
0.66865 0.11401 lineto
0.67361 0.11937 lineto
0.67857 0.12591 lineto
0.69841 0.16223 lineto
0.7381 0.25991 lineto
0.75794 0.30479 lineto
0.76786 0.32283 lineto
0.77282 0.33042 lineto
0.77778 0.33695 lineto
0.78274 0.34236 lineto
0.7877 0.34659 lineto
0.79018 0.34825 lineto
0.79266 0.34961 lineto
0.79514 0.35066 lineto
0.79638 0.35107 lineto
0.79762 0.3514 lineto
0.79886 0.35165 lineto
0.8001 0.35183 lineto
0.80134 0.35193 lineto
0.80258 0.35195 lineto
0.80382 0.35189 lineto
0.80506 0.35175 lineto
0.8063 0.35154 lineto
0.80754 0.35125 lineto
0.81002 0.35043 lineto
0.8125 0.34932 lineto
0.81746 0.34619 lineto
0.82242 0.3419 lineto
0.82738 0.3365 lineto
0.8373 0.32265 lineto
0.85714 0.28514 lineto
0.87698 0.24021 lineto
0.89683 0.19552 lineto
0.90675 0.17564 lineto
0.91667 0.15851 lineto
0.92659 0.14485 lineto
0.93155 0.13949 lineto
0.93651 0.13519 lineto
0.94147 0.13199 lineto
0.94395 0.1308 lineto
0.94519 0.13032 lineto
0.94643 0.1299 lineto
0.94767 0.12956 lineto
0.94891 0.12929 lineto
0.95015 0.12909 lineto
0.95139 0.12896 lineto
0.95263 0.1289 lineto
0.95387 0.12892 lineto
0.95511 0.129 lineto
0.95635 0.12916 lineto
0.95759 0.12939 lineto
0.95883 0.12969 lineto
0.96131 0.1305 lineto
0.96379 0.13159 lineto
0.96627 0.13295 lineto
0.97123 0.13649 lineto
0.97619 0.14106 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23546 lineto
0.02629 0.23552 lineto
0.02753 0.23564 lineto
0.02877 0.23581 lineto
0.03001 0.23604 lineto
0.03125 0.23633 lineto
0.03373 0.23711 lineto
0.03621 0.23817 lineto
0.03869 0.2395 lineto
0.04365 0.24304 lineto
0.04861 0.24776 lineto
0.05357 0.25367 lineto
0.06349 0.26895 lineto
0.08333 0.31172 lineto
0.10317 0.36554 lineto
0.12302 0.42187 lineto
0.13294 0.44797 lineto
0.14286 0.4711 lineto
0.15278 0.49016 lineto
0.15774 0.49786 lineto
0.1627 0.50419 lineto
0.16518 0.50682 lineto
0.16766 0.50907 lineto
0.17014 0.51094 lineto
0.17262 0.51241 lineto
0.17386 0.513 lineto
0.1751 0.51348 lineto
0.17634 0.51387 lineto
0.17758 0.51415 lineto
0.17882 0.51433 lineto
0.18006 0.51441 lineto
0.1813 0.51438 lineto
0.18254 0.51424 lineto
0.18378 0.51401 lineto
0.18502 0.51366 lineto
0.18626 0.51321 lineto
0.1875 0.51265 lineto
0.19246 0.50936 lineto
0.19494 0.50708 lineto
0.19742 0.50437 lineto
0.20238 0.49769 lineto
0.2123 0.47941 lineto
0.22222 0.45496 lineto
0.24206 0.3905 lineto
0.2619 0.31214 lineto
0.28175 0.22994 lineto
0.30159 0.15465 lineto
0.31151 0.12274 lineto
0.32143 0.09607 lineto
0.32639 0.08497 lineto
0.33135 0.07547 lineto
0.33631 0.06765 lineto
0.34127 0.06155 lineto
0.34375 0.05916 lineto
0.34623 0.05722 lineto
0.34871 0.05572 lineto
0.34995 0.05513 lineto
0.35119 0.05466 lineto
0.35243 0.0543 lineto
0.35367 0.05405 lineto
0.35491 0.05392 lineto
0.35615 0.05389 lineto
0.35739 0.05398 lineto
0.35863 0.05417 lineto
0.35987 0.05448 lineto
0.36111 0.05489 lineto
0.36359 0.05605 lineto
0.36607 0.05763 lineto
0.37103 0.06207 lineto
0.37599 0.06814 lineto
0.38095 0.07577 lineto
0.39087 0.09532 lineto
0.40079 0.11984 lineto
0.42063 0.17944 lineto
0.44048 0.24483 lineto
0.46032 0.3057 lineto
0.47024 0.33145 lineto
0.48016 0.35276 lineto
0.48512 0.3615 lineto
0.49008 0.36885 lineto
0.49504 0.37476 lineto
0.49752 0.37716 lineto
0.5 0.37919 lineto
0.50248 0.38083 lineto
0.50496 0.38209 lineto
0.5062 0.38257 lineto
0.50744 0.38296 lineto
0.50868 0.38325 lineto
0.50992 0.38345 lineto
0.51116 0.38355 lineto
0.5124 0.38355 lineto
0.51364 0.38346 lineto
0.51488 0.38328 lineto
0.51612 0.38299 lineto
0.51736 0.38262 lineto
0.51984 0.38158 lineto
0.52232 0.38018 lineto
0.5248 0.3784 lineto
0.52976 0.37378 lineto
0.53472 0.36777 lineto
0.53968 0.36045 lineto
0.55952 0.31998 lineto
0.57937 0.26732 lineto
0.59921 0.21133 lineto
0.61905 0.16118 lineto
0.62897 0.14085 lineto
0.63393 0.13224 lineto
0.63889 0.12479 lineto
0.64385 0.11855 lineto
0.64881 0.11359 lineto
0.65129 0.1116 lineto
0.65377 0.10995 lineto
0.65625 0.10863 lineto
0.65749 0.1081 lineto
0.65873 0.10766 lineto
0.65997 0.10729 lineto
0.66121 0.10702 lineto
0.66245 0.10683 lineto
0.66369 0.10672 lineto
0.66493 0.1067 lineto
0.66617 0.10676 lineto
0.66741 0.10691 lineto
0.66865 0.10715 lineto
0.67113 0.10786 lineto
0.67237 0.10835 lineto
0.67361 0.10892 lineto
0.67857 0.112 lineto
0.68353 0.11637 lineto
0.68849 0.12195 lineto
0.69841 0.13651 lineto
0.71825 0.17658 lineto
0.7381 0.22524 lineto
0.75794 0.27424 lineto
0.76786 0.29631 lineto
0.77778 0.31552 lineto
0.7877 0.33111 lineto
0.79266 0.33734 lineto
0.79762 0.34246 lineto
0.80258 0.3464 lineto
0.80506 0.34793 lineto
0.80754 0.34915 lineto
0.81002 0.35006 lineto
0.81126 0.3504 lineto
0.8125 0.35067 lineto
0.81374 0.35086 lineto
0.81498 0.35097 lineto
0.81622 0.351 lineto
0.81746 0.35096 lineto
0.8187 0.35084 lineto
0.81994 0.35064 lineto
0.82118 0.35036 lineto
0.82242 0.35001 lineto
0.8249 0.34909 lineto
0.82738 0.34786 lineto
0.83234 0.34453 lineto
0.8373 0.34006 lineto
0.84722 0.32792 lineto
0.85714 0.31202 lineto
0.89683 0.22663 lineto
0.91667 0.18384 lineto
0.92659 0.16565 lineto
0.93651 0.15061 lineto
0.94147 0.14447 lineto
0.94643 0.13934 lineto
0.95139 0.13526 lineto
0.95635 0.13227 lineto
0.95883 0.13119 lineto
0.96007 0.13076 lineto
0.96131 0.1304 lineto
0.96255 0.13011 lineto
0.96379 0.12989 lineto
0.96503 0.12974 lineto
0.96627 0.12966 lineto
0.97619 0.13157 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23545 lineto
0.02629 0.23547 lineto
0.02753 0.23552 lineto
0.02877 0.23561 lineto
0.03001 0.23572 lineto
0.03125 0.23588 lineto
0.03373 0.23631 lineto
0.03621 0.23692 lineto
0.03869 0.23772 lineto
0.04365 0.23996 lineto
0.04861 0.2431 lineto
0.05357 0.24721 lineto
0.06349 0.25838 lineto
0.07341 0.27351 lineto
0.08333 0.29232 lineto
0.10317 0.33884 lineto
0.12302 0.39173 lineto
0.14286 0.44276 lineto
0.15278 0.46482 lineto
0.1627 0.48319 lineto
0.16766 0.4907 lineto
0.17262 0.49694 lineto
0.17758 0.50184 lineto
0.18006 0.50376 lineto
0.18254 0.50531 lineto
0.18502 0.50649 lineto
0.18626 0.50694 lineto
0.1875 0.50729 lineto
0.18874 0.50754 lineto
0.18998 0.5077 lineto
0.19122 0.50776 lineto
0.19246 0.50772 lineto
0.1937 0.50758 lineto
0.19494 0.50734 lineto
0.19618 0.507 lineto
0.19742 0.50656 lineto
0.1999 0.50538 lineto
0.20238 0.50379 lineto
0.20734 0.49941 lineto
0.2123 0.49341 lineto
0.22222 0.47668 lineto
0.23214 0.45396 lineto
0.24206 0.42585 lineto
0.2619 0.35683 lineto
0.30159 0.19947 lineto
0.32143 0.13134 lineto
0.33135 0.10401 lineto
0.34127 0.08237 lineto
0.34623 0.0739 lineto
0.35119 0.06708 lineto
0.35615 0.06195 lineto
0.35863 0.06003 lineto
0.36111 0.05854 lineto
0.36235 0.05796 lineto
0.36359 0.05749 lineto
0.36483 0.05712 lineto
0.36607 0.05687 lineto
0.36731 0.05672 lineto
0.36855 0.05668 lineto
0.36979 0.05675 lineto
0.37103 0.05693 lineto
0.37227 0.05721 lineto
0.37351 0.0576 lineto
0.37599 0.0587 lineto
0.37847 0.06022 lineto
0.38095 0.06215 lineto
0.38591 0.06723 lineto
0.39087 0.07386 lineto
0.40079 0.0915 lineto
0.42063 0.14115 lineto
0.46032 0.26667 lineto
0.48016 0.32279 lineto
0.49008 0.34523 lineto
0.49504 0.35466 lineto
0.5 0.36278 lineto
0.50496 0.36953 lineto
0.50992 0.37484 lineto
0.5124 0.37694 lineto
0.51488 0.37867 lineto
0.51736 0.38003 lineto
0.51984 0.38101 lineto
0.52108 0.38136 lineto
0.52232 0.38161 lineto
0.52356 0.38177 lineto
0.5248 0.38184 lineto
0.52604 0.38181 lineto
0.52728 0.38168 lineto
0.52852 0.38147 lineto
0.52976 0.38116 lineto
0.53224 0.38026 lineto
0.53472 0.37899 lineto
0.5372 0.37736 lineto
0.53968 0.37538 lineto
0.54464 0.37036 lineto
0.5496 0.36401 lineto
0.55952 0.3476 lineto
0.57937 0.30284 lineto
0.59921 0.24879 lineto
0.61905 0.19443 lineto
0.62897 0.16991 lineto
0.63889 0.1485 lineto
0.64881 0.13103 lineto
0.65377 0.124 lineto
0.65873 0.11818 lineto
0.66369 0.11363 lineto
0.66617 0.11184 lineto
0.66865 0.11039 lineto
0.67113 0.10926 lineto
0.67237 0.10883 lineto
0.67361 0.10848 lineto
0.67485 0.10821 lineto
0.67609 0.10803 lineto
0.67733 0.10793 lineto
0.67857 0.10791 lineto
0.67981 0.10798 lineto
0.68105 0.10814 lineto
0.68229 0.10837 lineto
0.68353 0.10869 lineto
0.68601 0.10957 lineto
0.68849 0.11079 lineto
0.69345 0.11418 lineto
0.69841 0.11881 lineto
0.70833 0.13158 lineto
0.71825 0.1485 lineto
0.7381 0.19163 lineto
0.75794 0.24079 lineto
0.77778 0.28775 lineto
0.7877 0.30795 lineto
0.79762 0.32485 lineto
0.80258 0.33185 lineto
0.80754 0.33778 lineto
0.8125 0.34259 lineto
0.81746 0.34623 lineto
0.81994 0.34761 lineto
0.82242 0.34869 lineto
0.8249 0.34946 lineto
0.82614 0.34973 lineto
0.82738 0.34992 lineto
0.82862 0.35004 lineto
0.82986 0.35008 lineto
0.8311 0.35005 lineto
0.83234 0.34994 lineto
0.83358 0.34976 lineto
0.83482 0.34949 lineto
0.8373 0.34875 lineto
0.83978 0.3477 lineto
0.84226 0.34636 lineto
0.84722 0.34281 lineto
0.85218 0.33814 lineto
0.85714 0.33241 lineto
0.87698 0.30037 lineto
0.89683 0.25828 lineto
0.91667 0.21334 lineto
0.93651 0.17306 lineto
0.94643 0.1568 lineto
0.95635 0.14405 lineto
0.96131 0.13915 lineto
0.96627 0.1353 lineto
0.96875 0.13378 lineto
0.97123 0.13254 lineto
0.97371 0.13158 lineto
0.97619 0.13089 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23545 lineto
0.02753 0.23548 lineto
0.02877 0.23551 lineto
0.03001 0.23557 lineto
0.03125 0.23565 lineto
0.03249 0.23575 lineto
0.03373 0.23588 lineto
0.03621 0.23623 lineto
0.03869 0.2367 lineto
0.04117 0.23732 lineto
0.04365 0.23809 lineto
0.04861 0.24014 lineto
0.05357 0.24293 lineto
0.05853 0.24651 lineto
0.06349 0.25093 lineto
0.07341 0.26236 lineto
0.08333 0.27725 lineto
0.10317 0.31638 lineto
0.14286 0.41456 lineto
0.1627 0.45921 lineto
0.17262 0.47694 lineto
0.17758 0.48425 lineto
0.18254 0.4904 lineto
0.1875 0.4953 lineto
0.19246 0.49886 lineto
0.19494 0.50012 lineto
0.19618 0.50061 lineto
0.19742 0.50102 lineto
0.19866 0.50133 lineto
0.1999 0.50155 lineto
0.20114 0.50168 lineto
0.20238 0.50172 lineto
0.20362 0.50166 lineto
0.20486 0.50151 lineto
0.2061 0.50126 lineto
0.20734 0.50092 lineto
0.20858 0.50049 lineto
0.20982 0.49995 lineto
0.2123 0.4986 lineto
0.21478 0.49686 lineto
0.21726 0.49474 lineto
0.22222 0.48933 lineto
0.23214 0.47397 lineto
0.24206 0.45281 lineto
0.2619 0.39532 lineto
0.30159 0.24549 lineto
0.32143 0.17179 lineto
0.33135 0.13948 lineto
0.34127 0.11163 lineto
0.35119 0.08911 lineto
0.35615 0.08007 lineto
0.36111 0.07261 lineto
0.36607 0.06677 lineto
0.36855 0.06447 lineto
0.37103 0.06259 lineto
0.37351 0.06113 lineto
0.37475 0.06056 lineto
0.37599 0.0601 lineto
0.37723 0.05974 lineto
0.37847 0.05948 lineto
0.37971 0.05934 lineto
0.38095 0.05929 lineto
0.38219 0.05936 lineto
0.38343 0.05952 lineto
0.38467 0.05979 lineto
0.38591 0.06017 lineto
0.38715 0.06065 lineto
0.38839 0.06123 lineto
0.39087 0.0627 lineto
0.39583 0.06685 lineto
0.40079 0.07255 lineto
0.41071 0.08835 lineto
0.42063 0.10939 lineto
0.46032 0.22595 lineto
0.48016 0.28713 lineto
0.49008 0.31425 lineto
0.5 0.33767 lineto
0.50992 0.35652 lineto
0.51488 0.36402 lineto
0.51984 0.37014 lineto
0.52232 0.37267 lineto
0.5248 0.37484 lineto
0.52728 0.37664 lineto
0.52976 0.37808 lineto
0.531 0.37866 lineto
0.53224 0.37915 lineto
0.53348 0.37954 lineto
0.53472 0.37984 lineto
0.53596 0.38005 lineto
0.5372 0.38017 lineto
0.53844 0.38019 lineto
0.53968 0.38012 lineto
0.54092 0.37996 lineto
0.54216 0.37971 lineto
0.5434 0.37937 lineto
0.54464 0.37893 lineto
0.5496 0.37629 lineto
0.55208 0.37443 lineto
0.55456 0.37223 lineto
0.55952 0.36682 lineto
0.56944 0.3522 lineto
0.57937 0.33309 lineto
0.61905 0.23048 lineto
0.63889 0.1786 lineto
0.64881 0.15628 lineto
0.65873 0.13757 lineto
0.66369 0.1298 lineto
0.66865 0.12319 lineto
0.67361 0.1178 lineto
0.67857 0.11368 lineto
0.68105 0.1121 lineto
0.68353 0.11085 lineto
0.68601 0.10993 lineto
0.68725 0.10959 lineto
0.68849 0.10934 lineto
0.68973 0.10917 lineto
0.69097 0.10909 lineto
0.69221 0.10908 lineto
0.69345 0.10916 lineto
0.69469 0.10932 lineto
0.69593 0.10957 lineto
0.69717 0.10989 lineto
0.69841 0.1103 lineto
0.70089 0.11136 lineto
0.70337 0.11273 lineto
0.70833 0.11643 lineto
0.71329 0.12135 lineto
0.71825 0.12742 lineto
0.7381 0.16171 lineto
0.77778 0.256 lineto
0.79762 0.3002 lineto
0.80754 0.31826 lineto
0.81746 0.33262 lineto
0.82242 0.33824 lineto
0.82738 0.34273 lineto
0.83234 0.34606 lineto
0.83482 0.34729 lineto
0.83606 0.34779 lineto
0.8373 0.34821 lineto
0.83854 0.34856 lineto
0.83978 0.34883 lineto
0.84102 0.34903 lineto
0.84226 0.34915 lineto
0.8435 0.3492 lineto
0.84474 0.34917 lineto
0.84598 0.34907 lineto
0.84722 0.34889 lineto
0.84846 0.34864 lineto
0.8497 0.34831 lineto
0.85218 0.34743 lineto
0.85466 0.34626 lineto
0.85714 0.34479 lineto
0.8621 0.34102 lineto
0.86706 0.33615 lineto
0.87698 0.32337 lineto
0.89683 0.28787 lineto
0.93651 0.20054 lineto
0.97619 0.13893 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23545 lineto
0.02753 0.23546 lineto
0.02877 0.23547 lineto
0.03001 0.2355 lineto
0.03125 0.23554 lineto
0.03249 0.23559 lineto
0.03373 0.23566 lineto
0.03621 0.23586 lineto
0.03745 0.23598 lineto
0.03869 0.23613 lineto
0.04117 0.2365 lineto
0.04365 0.23698 lineto
0.04861 0.23829 lineto
0.05357 0.24015 lineto
0.05853 0.24262 lineto
0.06349 0.24576 lineto
0.07341 0.25423 lineto
0.08333 0.26575 lineto
0.10317 0.2979 lineto
0.14286 0.38769 lineto
0.1627 0.43389 lineto
0.17262 0.45415 lineto
0.18254 0.47128 lineto
0.19246 0.48446 lineto
0.19742 0.48933 lineto
0.1999 0.4913 lineto
0.20238 0.49295 lineto
0.20486 0.49427 lineto
0.20734 0.49525 lineto
0.20858 0.49562 lineto
0.20982 0.49589 lineto
0.21106 0.49608 lineto
0.2123 0.49618 lineto
0.21354 0.49619 lineto
0.21478 0.49612 lineto
0.21602 0.49595 lineto
0.21726 0.49569 lineto
0.21974 0.49491 lineto
0.22098 0.49437 lineto
0.22222 0.49375 lineto
0.22718 0.49034 lineto
0.22966 0.48808 lineto
0.23214 0.48546 lineto
0.24206 0.47131 lineto
0.25198 0.45154 lineto
0.2619 0.42658 lineto
0.30159 0.29033 lineto
0.32143 0.21493 lineto
0.34127 0.14718 lineto
0.35119 0.11893 lineto
0.36111 0.09566 lineto
0.37103 0.07811 lineto
0.37599 0.07163 lineto
0.37847 0.069 lineto
0.38095 0.06676 lineto
0.38343 0.06494 lineto
0.38591 0.06353 lineto
0.38715 0.06297 lineto
0.38839 0.06252 lineto
0.38963 0.06217 lineto
0.39087 0.06193 lineto
0.39211 0.06179 lineto
0.39335 0.06175 lineto
0.39459 0.06181 lineto
0.39583 0.06198 lineto
0.39707 0.06225 lineto
0.39831 0.06261 lineto
0.40079 0.06365 lineto
0.40327 0.06509 lineto
0.40575 0.06693 lineto
0.41071 0.07175 lineto
0.41567 0.07807 lineto
0.42063 0.08581 lineto
0.44048 0.12907 lineto
0.46032 0.18628 lineto
0.48016 0.24841 lineto
0.5 0.30589 lineto
0.50992 0.33012 lineto
0.51984 0.35012 lineto
0.5248 0.35829 lineto
0.52976 0.36516 lineto
0.53472 0.37065 lineto
0.5372 0.37287 lineto
0.53968 0.37473 lineto
0.54216 0.37624 lineto
0.5434 0.37685 lineto
0.54464 0.37738 lineto
0.54588 0.37781 lineto
0.54712 0.37815 lineto
0.54836 0.3784 lineto
0.5496 0.37856 lineto
0.55084 0.37863 lineto
0.55208 0.37861 lineto
0.55332 0.37849 lineto
0.55456 0.37829 lineto
0.55704 0.37761 lineto
0.55828 0.37714 lineto
0.55952 0.37658 lineto
0.56448 0.37345 lineto
0.56696 0.37137 lineto
0.56944 0.36896 lineto
0.57937 0.35609 lineto
0.58929 0.33858 lineto
0.59921 0.31719 lineto
0.61905 0.26659 lineto
0.63889 0.21268 lineto
0.65873 0.16413 lineto
0.66865 0.14433 lineto
0.67857 0.12858 lineto
0.68353 0.12241 lineto
0.68849 0.11746 lineto
0.69345 0.11377 lineto
0.69593 0.1124 lineto
0.69717 0.11184 lineto
0.69841 0.11136 lineto
0.69965 0.11097 lineto
0.70089 0.11065 lineto
0.70213 0.11042 lineto
0.70337 0.11027 lineto
0.70461 0.1102 lineto
0.70585 0.11021 lineto
0.70709 0.1103 lineto
0.70833 0.11048 lineto
0.70957 0.11073 lineto
0.71081 0.11107 lineto
0.71329 0.11199 lineto
0.71577 0.11322 lineto
0.71825 0.11477 lineto
0.72321 0.11878 lineto
0.72817 0.12399 lineto
0.7381 0.13769 lineto
0.75794 0.17592 lineto
0.77778 0.22285 lineto
0.79762 0.27062 lineto
0.81746 0.31141 lineto
0.82738 0.32707 lineto
0.83234 0.33342 lineto
0.8373 0.3387 lineto
0.84226 0.34287 lineto
0.84722 0.34588 lineto
0.8497 0.34694 lineto
0.85094 0.34736 lineto
0.85218 0.34771 lineto
0.85342 0.34798 lineto
0.85466 0.34818 lineto
0.8559 0.3483 lineto
0.85714 0.34835 lineto
0.85838 0.34832 lineto
0.85962 0.34822 lineto
0.86086 0.34804 lineto
0.8621 0.34779 lineto
0.86334 0.34747 lineto
0.86458 0.34707 lineto
0.86706 0.34606 lineto
0.86954 0.34475 lineto
0.87202 0.34316 lineto
0.87698 0.33915 lineto
0.8869 0.32798 lineto
0.89683 0.31305 lineto
0.93651 0.2307 lineto
0.97619 0.15486 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23545 lineto
0.02877 0.23546 lineto
0.03001 0.23547 lineto
0.03125 0.23549 lineto
0.03249 0.23552 lineto
0.03373 0.23555 lineto
0.03621 0.23566 lineto
0.03745 0.23573 lineto
0.03869 0.23581 lineto
0.04117 0.23603 lineto
0.04365 0.23632 lineto
0.04613 0.23669 lineto
0.04861 0.23714 lineto
0.05357 0.23836 lineto
0.05853 0.24004 lineto
0.06349 0.24224 lineto
0.07341 0.24839 lineto
0.07837 0.25242 lineto
0.08333 0.25714 lineto
0.10317 0.28302 lineto
0.12302 0.31932 lineto
0.14286 0.36293 lineto
0.1627 0.40856 lineto
0.18254 0.44956 lineto
0.19246 0.46614 lineto
0.19742 0.47309 lineto
0.20238 0.47903 lineto
0.20734 0.48387 lineto
0.20982 0.48585 lineto
0.2123 0.48752 lineto
0.21478 0.48889 lineto
0.21602 0.48945 lineto
0.21726 0.48994 lineto
0.2185 0.49034 lineto
0.21974 0.49066 lineto
0.22098 0.4909 lineto
0.22222 0.49105 lineto
0.22346 0.49112 lineto
0.2247 0.49111 lineto
0.22594 0.49101 lineto
0.22718 0.49082 lineto
0.22842 0.49055 lineto
0.22966 0.49019 lineto
0.23214 0.48921 lineto
0.23462 0.48788 lineto
0.2371 0.4862 lineto
0.24206 0.48177 lineto
0.24702 0.47593 lineto
0.25198 0.4687 lineto
0.2619 0.45018 lineto
0.28175 0.39852 lineto
0.30159 0.33206 lineto
0.34127 0.18677 lineto
0.35119 0.15446 lineto
0.36111 0.12591 lineto
0.37103 0.10203 lineto
0.37599 0.09207 lineto
0.38095 0.08355 lineto
0.38591 0.07651 lineto
0.39087 0.07102 lineto
0.39335 0.06886 lineto
0.39583 0.0671 lineto
0.39831 0.06574 lineto
0.39955 0.06521 lineto
0.40079 0.06478 lineto
0.40203 0.06445 lineto
0.40327 0.06422 lineto
0.40451 0.06409 lineto
0.40575 0.06407 lineto
0.40699 0.06414 lineto
0.40823 0.06431 lineto
0.40947 0.06458 lineto
0.41071 0.06495 lineto
0.41195 0.06541 lineto
0.41319 0.06598 lineto
0.41567 0.0674 lineto
0.42063 0.0714 lineto
0.4256 0.07689 lineto
0.43056 0.0838 lineto
0.44048 0.10157 lineto
0.46032 0.15011 lineto
0.5 0.2698 lineto
0.51984 0.32263 lineto
0.52976 0.34363 lineto
0.53472 0.35242 lineto
0.53968 0.35995 lineto
0.54464 0.36618 lineto
0.5496 0.37104 lineto
0.55208 0.37294 lineto
0.55456 0.3745 lineto
0.55704 0.37569 lineto
0.55828 0.37616 lineto
0.55952 0.37653 lineto
0.56076 0.37682 lineto
0.562 0.37701 lineto
0.56324 0.37712 lineto
0.56448 0.37714 lineto
0.56572 0.37706 lineto
0.56696 0.3769 lineto
0.5682 0.37665 lineto
0.56944 0.37631 lineto
0.57192 0.37537 lineto
0.5744 0.37408 lineto
0.57937 0.37047 lineto
0.58433 0.36553 lineto
0.58929 0.35932 lineto
0.59921 0.3434 lineto
0.61905 0.30019 lineto
0.65873 0.1957 lineto
0.67857 0.15125 lineto
0.68849 0.13426 lineto
0.69345 0.12738 lineto
0.69841 0.12166 lineto
0.70337 0.11716 lineto
0.70833 0.11391 lineto
0.71081 0.11277 lineto
0.71205 0.11232 lineto
0.71329 0.11194 lineto
0.71453 0.11165 lineto
0.71577 0.11144 lineto
0.71701 0.11132 lineto
0.71825 0.11127 lineto
0.71949 0.1113 lineto
0.72073 0.11141 lineto
0.72197 0.11161 lineto
0.72321 0.11188 lineto
0.72445 0.11223 lineto
0.72569 0.11266 lineto
0.72817 0.11377 lineto
0.73065 0.11518 lineto
0.73313 0.1169 lineto
0.7381 0.12124 lineto
0.74802 0.13332 lineto
0.75794 0.14946 lineto
0.77778 0.19089 lineto
0.81746 0.28441 lineto
0.82738 0.30435 lineto
0.8373 0.32117 lineto
0.84722 0.33422 lineto
0.85218 0.33916 lineto
0.85466 0.34122 lineto
0.85714 0.34299 lineto
0.85962 0.34447 lineto
0.8621 0.34567 lineto
0.86334 0.34615 lineto
0.86458 0.34657 lineto
0.86582 0.34691 lineto
0.86706 0.34717 lineto
0.8683 0.34736 lineto
0.86954 0.34748 lineto
0.87078 0.34752 lineto
0.87202 0.34749 lineto
0.87326 0.34739 lineto
0.8745 0.34721 lineto
0.87698 0.34664 lineto
0.87822 0.34624 lineto
0.87946 0.34577 lineto
0.88194 0.34461 lineto
0.8869 0.34146 lineto
0.89187 0.33721 lineto
0.89683 0.33191 lineto
0.90675 0.31843 lineto
0.91667 0.30162 lineto
0.93651 0.26108 lineto
0.97619 0.17723 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23545 lineto
0.03001 0.23545 lineto
0.03125 0.23546 lineto
0.03249 0.23548 lineto
0.03373 0.2355 lineto
0.03621 0.23555 lineto
0.03745 0.23559 lineto
0.03869 0.23564 lineto
0.04117 0.23577 lineto
0.04365 0.23594 lineto
0.04613 0.23616 lineto
0.04861 0.23645 lineto
0.05109 0.2368 lineto
0.05357 0.23723 lineto
0.05853 0.23835 lineto
0.06349 0.23986 lineto
0.06845 0.24181 lineto
0.07341 0.24426 lineto
0.08333 0.25079 lineto
0.09325 0.25974 lineto
0.10317 0.27123 lineto
0.12302 0.30177 lineto
0.14286 0.34073 lineto
0.1627 0.38421 lineto
0.18254 0.4266 lineto
0.19246 0.44537 lineto
0.20238 0.46144 lineto
0.20734 0.46822 lineto
0.2123 0.47404 lineto
0.21726 0.47883 lineto
0.21974 0.48081 lineto
0.22222 0.48251 lineto
0.2247 0.48391 lineto
0.22718 0.48501 lineto
0.22842 0.48545 lineto
0.22966 0.48581 lineto
0.2309 0.48608 lineto
0.23214 0.48628 lineto
0.23338 0.4864 lineto
0.23462 0.48644 lineto
0.23586 0.4864 lineto
0.2371 0.48627 lineto
0.23834 0.48607 lineto
0.23958 0.48578 lineto
0.24206 0.48495 lineto
0.24454 0.48378 lineto
0.24702 0.48228 lineto
0.25198 0.47825 lineto
0.25694 0.47288 lineto
0.2619 0.46615 lineto
0.27183 0.44877 lineto
0.28175 0.42643 lineto
0.30159 0.36915 lineto
0.34127 0.22819 lineto
0.36111 0.16134 lineto
0.37103 0.13259 lineto
0.38095 0.10819 lineto
0.39087 0.0889 lineto
0.39583 0.08137 lineto
0.40079 0.07531 lineto
0.40327 0.07285 lineto
0.40575 0.07078 lineto
0.40823 0.06909 lineto
0.41071 0.0678 lineto
0.41195 0.0673 lineto
0.41319 0.06689 lineto
0.41443 0.06659 lineto
0.41567 0.06638 lineto
0.41691 0.06627 lineto
0.41815 0.06626 lineto
0.41939 0.06634 lineto
0.42063 0.06652 lineto
0.42188 0.0668 lineto
0.42312 0.06718 lineto
0.4256 0.06822 lineto
0.42808 0.06964 lineto
0.43056 0.07144 lineto
0.43552 0.07613 lineto
0.44048 0.08226 lineto
0.4504 0.09849 lineto
0.46032 0.11947 lineto
0.5 0.23189 lineto
0.51984 0.28977 lineto
0.52976 0.31524 lineto
0.53968 0.3371 lineto
0.5496 0.35458 lineto
0.55456 0.36147 lineto
0.55952 0.36705 lineto
0.56448 0.37127 lineto
0.56696 0.37286 lineto
0.56944 0.3741 lineto
0.57068 0.37459 lineto
0.57192 0.37499 lineto
0.57316 0.37531 lineto
0.5744 0.37553 lineto
0.57564 0.37567 lineto
0.57688 0.37572 lineto
0.57813 0.37568 lineto
0.57937 0.37555 lineto
0.58061 0.37533 lineto
0.58185 0.37503 lineto
0.58433 0.37417 lineto
0.58681 0.37296 lineto
0.58929 0.37142 lineto
0.59425 0.36732 lineto
0.59921 0.36195 lineto
0.60913 0.3476 lineto
0.61905 0.329 lineto
0.65873 0.22987 lineto
0.67857 0.17984 lineto
0.68849 0.15828 lineto
0.69841 0.14018 lineto
0.70833 0.12623 lineto
0.71329 0.12097 lineto
0.71577 0.1188 lineto
0.71825 0.11693 lineto
0.72073 0.11538 lineto
0.72321 0.11414 lineto
0.72445 0.11364 lineto
0.72569 0.11321 lineto
0.72693 0.11287 lineto
0.72817 0.11261 lineto
0.72941 0.11243 lineto
0.73065 0.11233 lineto
0.73189 0.1123 lineto
0.73313 0.11236 lineto
0.73437 0.1125 lineto
0.73562 0.11271 lineto
0.73686 0.11301 lineto
0.7381 0.11338 lineto
0.74058 0.11436 lineto
0.74306 0.11565 lineto
0.74802 0.11914 lineto
0.75298 0.12381 lineto
0.75794 0.1296 lineto
0.77778 0.1625 lineto
0.81746 0.25384 lineto
0.8373 0.29715 lineto
0.84722 0.315 lineto
0.85714 0.32934 lineto
0.8621 0.33501 lineto
0.86706 0.3396 lineto
0.86954 0.34148 lineto
0.87202 0.34308 lineto
0.8745 0.34439 lineto
0.87698 0.34541 lineto
0.87822 0.34581 lineto
0.87946 0.34614 lineto
0.8807 0.3464 lineto
0.88194 0.34658 lineto
0.88318 0.34669 lineto
0.88442 0.34672 lineto
0.88566 0.34669 lineto
0.8869 0.34658 lineto
0.88814 0.34639 lineto
0.88938 0.34614 lineto
0.89187 0.34541 lineto
0.89435 0.3444 lineto
0.89683 0.3431 lineto
0.90179 0.33967 lineto
0.90675 0.33517 lineto
0.91667 0.32317 lineto
0.93651 0.28926 lineto
0.97619 0.20413 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23545 lineto
0.03125 0.23545 lineto
0.03249 0.23546 lineto
0.03373 0.23547 lineto
0.03497 0.23548 lineto
0.03621 0.2355 lineto
0.03745 0.23552 lineto
0.03869 0.23555 lineto
0.04117 0.23562 lineto
0.04365 0.23572 lineto
0.04613 0.23585 lineto
0.04861 0.23603 lineto
0.05109 0.23625 lineto
0.05357 0.23653 lineto
0.05853 0.23727 lineto
0.06349 0.23829 lineto
0.06845 0.23964 lineto
0.07341 0.24138 lineto
0.08333 0.24618 lineto
0.09325 0.253 lineto
0.10317 0.26206 lineto
0.12302 0.28727 lineto
0.14286 0.32129 lineto
0.18254 0.40351 lineto
0.20238 0.44152 lineto
0.2123 0.45711 lineto
0.22222 0.46944 lineto
0.22718 0.47418 lineto
0.22966 0.47616 lineto
0.23214 0.47786 lineto
0.23462 0.47929 lineto
0.2371 0.48043 lineto
0.23834 0.48089 lineto
0.23958 0.48128 lineto
0.24082 0.48159 lineto
0.24206 0.48183 lineto
0.2433 0.48199 lineto
0.24454 0.48208 lineto
0.24578 0.48208 lineto
0.24702 0.48201 lineto
0.24826 0.48186 lineto
0.2495 0.48163 lineto
0.25074 0.48132 lineto
0.25198 0.48093 lineto
0.25694 0.47857 lineto
0.25942 0.4769 lineto
0.2619 0.4749 lineto
0.26687 0.46993 lineto
0.27183 0.46366 lineto
0.28175 0.44731 lineto
0.29167 0.42612 lineto
0.30159 0.40056 lineto
0.34127 0.26941 lineto
0.36111 0.19989 lineto
0.38095 0.13896 lineto
0.39087 0.11415 lineto
0.40079 0.09416 lineto
0.40575 0.08618 lineto
0.41071 0.07962 lineto
0.41567 0.07453 lineto
0.41815 0.07255 lineto
0.42063 0.07094 lineto
0.42188 0.07028 lineto
0.42312 0.06972 lineto
0.42436 0.06925 lineto
0.4256 0.06888 lineto
0.42684 0.0686 lineto
0.42808 0.06842 lineto
0.42932 0.06833 lineto
0.43056 0.06834 lineto
0.4318 0.06844 lineto
0.43304 0.06864 lineto
0.43428 0.06893 lineto
0.43552 0.06932 lineto
0.438 0.07038 lineto
0.44048 0.07181 lineto
0.44296 0.0736 lineto
0.44544 0.07576 lineto
0.4504 0.08113 lineto
0.46032 0.0959 lineto
0.47024 0.11547 lineto
0.48016 0.13908 lineto
0.5 0.19454 lineto
0.51984 0.2538 lineto
0.53968 0.30796 lineto
0.5496 0.33058 lineto
0.55952 0.34908 lineto
0.56448 0.35657 lineto
0.56944 0.36281 lineto
0.5744 0.36774 lineto
0.57688 0.3697 lineto
0.57937 0.37132 lineto
0.58185 0.3726 lineto
0.58433 0.37353 lineto
0.58557 0.37386 lineto
0.58681 0.37411 lineto
0.58805 0.37427 lineto
0.58929 0.37435 lineto
0.59053 0.37433 lineto
0.59177 0.37424 lineto
0.59301 0.37405 lineto
0.59425 0.37378 lineto
0.59549 0.37343 lineto
0.59673 0.37299 lineto
0.59921 0.37185 lineto
0.60169 0.37038 lineto
0.60417 0.36858 lineto
0.60913 0.36401 lineto
0.61905 0.35121 lineto
0.62897 0.33402 lineto
0.63889 0.31318 lineto
0.65873 0.26418 lineto
0.67857 0.21215 lineto
0.69841 0.16537 lineto
0.70833 0.14629 lineto
0.71825 0.1311 lineto
0.72321 0.12515 lineto
0.72817 0.12036 lineto
0.73065 0.11842 lineto
0.73313 0.11679 lineto
0.73562 0.11547 lineto
0.73686 0.11492 lineto
0.7381 0.11446 lineto
0.73934 0.11407 lineto
0.74058 0.11376 lineto
0.74182 0.11353 lineto
0.74306 0.11338 lineto
0.7443 0.11331 lineto
0.74554 0.11331 lineto
0.74678 0.1134 lineto
0.74802 0.11356 lineto
0.7505 0.11412 lineto
0.75174 0.11452 lineto
0.75298 0.11499 lineto
0.75794 0.11765 lineto
0.76042 0.11943 lineto
0.7629 0.12151 lineto
0.76786 0.1265 lineto
0.77778 0.1397 lineto
0.79762 0.1766 lineto
0.81746 0.22208 lineto
0.8373 0.2686 lineto
0.84722 0.28986 lineto
0.85714 0.30861 lineto
0.86706 0.32411 lineto
0.87698 0.33576 lineto
0.88194 0.34 lineto
0.88442 0.3417 lineto
0.8869 0.34312 lineto
0.88938 0.34425 lineto
0.89187 0.3451 lineto
0.89311 0.34541 lineto
0.89435 0.34566 lineto
0.89559 0.34583 lineto
0.89683 0.34592 lineto
0.89807 0.34595 lineto
0.89931 0.3459 lineto
0.90055 0.34578 lineto
0.90179 0.34559 lineto
0.90427 0.34499 lineto
0.90551 0.34459 lineto
0.90675 0.34411 lineto
0.91171 0.3415 lineto
0.91667 0.3378 lineto
0.92659 0.3273 lineto
0.93651 0.31309 lineto
0.97619 0.23335 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23545 lineto
0.03249 0.23545 lineto
0.03373 0.23545 lineto
0.03497 0.23546 lineto
0.03621 0.23547 lineto
0.03745 0.23548 lineto
0.03869 0.2355 lineto
0.04117 0.23554 lineto
0.04241 0.23556 lineto
0.04365 0.2356 lineto
0.04613 0.23568 lineto
0.04861 0.23578 lineto
0.05109 0.23592 lineto
0.05357 0.2361 lineto
0.05853 0.23657 lineto
0.06101 0.23688 lineto
0.06349 0.23725 lineto
0.06845 0.23818 lineto
0.07341 0.2394 lineto
0.07837 0.24095 lineto
0.08333 0.24288 lineto
0.09325 0.248 lineto
0.10317 0.25502 lineto
0.1131 0.26415 lineto
0.12302 0.27548 lineto
0.14286 0.3046 lineto
0.18254 0.38117 lineto
0.20238 0.42045 lineto
0.2123 0.43797 lineto
0.22222 0.45311 lineto
0.22718 0.45957 lineto
0.23214 0.46518 lineto
0.2371 0.46986 lineto
0.24206 0.47354 lineto
0.24454 0.47499 lineto
0.24702 0.47616 lineto
0.2495 0.47706 lineto
0.25074 0.4774 lineto
0.25198 0.47767 lineto
0.25322 0.47786 lineto
0.25446 0.47798 lineto
0.2557 0.47803 lineto
0.25694 0.47801 lineto
0.25818 0.4779 lineto
0.25942 0.47773 lineto
0.26066 0.47747 lineto
0.2619 0.47714 lineto
0.26438 0.47625 lineto
0.26687 0.47505 lineto
0.27183 0.47171 lineto
0.27679 0.4671 lineto
0.28175 0.46125 lineto
0.29167 0.44583 lineto
0.30159 0.42569 lineto
0.32143 0.3731 lineto
0.34127 0.30868 lineto
0.36111 0.2396 lineto
0.38095 0.174 lineto
0.40079 0.1199 lineto
0.41071 0.09931 lineto
0.41567 0.09093 lineto
0.42063 0.08392 lineto
0.4256 0.07833 lineto
0.42808 0.07607 lineto
0.43056 0.07418 lineto
0.43304 0.07266 lineto
0.43428 0.07204 lineto
0.43552 0.07152 lineto
0.43676 0.07109 lineto
0.438 0.07075 lineto
0.43924 0.0705 lineto
0.44048 0.07035 lineto
0.44172 0.07029 lineto
0.44296 0.07032 lineto
0.4442 0.07045 lineto
0.44544 0.07067 lineto
0.44792 0.07138 lineto
0.44916 0.07188 lineto
0.4504 0.07247 lineto
0.45536 0.07572 lineto
0.45784 0.07788 lineto
0.46032 0.08038 lineto
0.47024 0.09373 lineto
0.48016 0.11196 lineto
0.5 0.15997 lineto
0.53968 0.27458 lineto
0.5496 0.30083 lineto
0.55952 0.32408 lineto
0.56944 0.34349 lineto
0.5744 0.35154 lineto
0.57937 0.35838 lineto
0.58433 0.36396 lineto
0.58681 0.36627 lineto
0.58929 0.36824 lineto
0.59177 0.36987 lineto
0.59425 0.37117 lineto
0.59549 0.37169 lineto
0.59673 0.37213 lineto
0.59797 0.37248 lineto
0.59921 0.37275 lineto
0.60045 0.37293 lineto
0.60169 0.37303 lineto
0.60293 0.37304 lineto
0.60417 0.37296 lineto
0.60541 0.3728 lineto
0.60665 0.37256 lineto
0.60789 0.37223 lineto
0.60913 0.37182 lineto
0.61409 0.36934 lineto
0.61657 0.36761 lineto
0.61905 0.36555 lineto
0.62897 0.35427 lineto
0.63889 0.33849 lineto
0.65873 0.29626 lineto
0.69841 0.19528 lineto
0.70833 0.17248 lineto
0.71825 0.15254 lineto
0.72817 0.13623 lineto
0.73313 0.12963 lineto
0.7381 0.12416 lineto
0.74306 0.11985 lineto
0.74554 0.11815 lineto
0.74802 0.11675 lineto
0.7505 0.11566 lineto
0.75174 0.11524 lineto
0.75298 0.11489 lineto
0.75422 0.11461 lineto
0.75546 0.11442 lineto
0.7567 0.1143 lineto
0.75794 0.11426 lineto
0.75918 0.1143 lineto
0.76042 0.11442 lineto
0.76166 0.11461 lineto
0.7629 0.11488 lineto
0.76538 0.11565 lineto
0.76786 0.11673 lineto
0.77282 0.11978 lineto
0.77778 0.12399 lineto
0.7877 0.13571 lineto
0.79762 0.15134 lineto
0.81746 0.1915 lineto
0.8373 0.23776 lineto
0.85714 0.28253 lineto
0.87698 0.31861 lineto
0.88194 0.32556 lineto
0.8869 0.33153 lineto
0.89187 0.33648 lineto
0.89683 0.34035 lineto
0.89931 0.34186 lineto
0.90179 0.3431 lineto
0.90427 0.34405 lineto
0.90551 0.34442 lineto
0.90675 0.34472 lineto
0.90799 0.34495 lineto
0.90923 0.3451 lineto
0.91047 0.34518 lineto
0.91171 0.34519 lineto
0.91295 0.34513 lineto
0.91419 0.345 lineto
0.91543 0.3448 lineto
0.91667 0.34452 lineto
0.91915 0.34376 lineto
0.92163 0.34272 lineto
0.92659 0.33981 lineto
0.93155 0.33583 lineto
0.93651 0.33082 lineto
0.94643 0.31797 lineto
0.95635 0.30183 lineto
0.97619 0.26258 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23545 lineto
0.03373 0.23545 lineto
0.03497 0.23545 lineto
0.03621 0.23546 lineto
0.03745 0.23546 lineto
0.03869 0.23547 lineto
0.04117 0.23549 lineto
0.04241 0.23551 lineto
0.04365 0.23553 lineto
0.04613 0.23557 lineto
0.04861 0.23564 lineto
0.05109 0.23572 lineto
0.05357 0.23583 lineto
0.05853 0.23614 lineto
0.06101 0.23634 lineto
0.06349 0.23658 lineto
0.06845 0.23721 lineto
0.07341 0.23806 lineto
0.07837 0.23915 lineto
0.08333 0.24054 lineto
0.09325 0.24433 lineto
0.10317 0.2497 lineto
0.1131 0.25688 lineto
0.12302 0.26604 lineto
0.14286 0.29054 lineto
0.18254 0.36017 lineto
0.22222 0.43469 lineto
0.23214 0.44941 lineto
0.24206 0.46121 lineto
0.24702 0.46583 lineto
0.25198 0.4695 lineto
0.25446 0.47096 lineto
0.25694 0.47216 lineto
0.25942 0.47309 lineto
0.26066 0.47346 lineto
0.2619 0.47376 lineto
0.26314 0.47398 lineto
0.26438 0.47414 lineto
0.26563 0.47422 lineto
0.26687 0.47424 lineto
0.26811 0.47418 lineto
0.26935 0.47405 lineto
0.27059 0.47384 lineto
0.27183 0.47356 lineto
0.27431 0.47279 lineto
0.27679 0.47171 lineto
0.27927 0.47033 lineto
0.28175 0.46865 lineto
0.28671 0.46438 lineto
0.29167 0.45889 lineto
0.30159 0.44433 lineto
0.31151 0.42516 lineto
0.32143 0.40177 lineto
0.34127 0.34459 lineto
0.38095 0.21143 lineto
0.40079 0.15087 lineto
0.41071 0.12544 lineto
0.42063 0.10434 lineto
0.4256 0.09561 lineto
0.43056 0.08819 lineto
0.43552 0.08214 lineto
0.44048 0.07749 lineto
0.44296 0.0757 lineto
0.44544 0.07428 lineto
0.44792 0.07321 lineto
0.44916 0.07282 lineto
0.4504 0.07252 lineto
0.45164 0.07231 lineto
0.45288 0.07219 lineto
0.45412 0.07216 lineto
0.45536 0.07222 lineto
0.4566 0.07237 lineto
0.45784 0.07262 lineto
0.45908 0.07295 lineto
0.46032 0.07338 lineto
0.4628 0.07449 lineto
0.46528 0.07597 lineto
0.47024 0.07996 lineto
0.4752 0.08531 lineto
0.48016 0.09196 lineto
0.49008 0.10887 lineto
0.5 0.13003 lineto
0.53968 0.23913 lineto
0.55952 0.29385 lineto
0.56944 0.31764 lineto
0.57937 0.33786 lineto
0.58433 0.3464 lineto
0.58929 0.3538 lineto
0.59425 0.35998 lineto
0.59921 0.3649 lineto
0.60169 0.36687 lineto
0.60417 0.36852 lineto
0.60665 0.36983 lineto
0.60789 0.37036 lineto
0.60913 0.37081 lineto
0.61037 0.37117 lineto
0.61161 0.37145 lineto
0.61285 0.37165 lineto
0.61409 0.37176 lineto
0.61533 0.37179 lineto
0.61657 0.37173 lineto
0.61781 0.37159 lineto
0.61905 0.37137 lineto
0.62153 0.37067 lineto
0.62277 0.3702 lineto
0.62401 0.36965 lineto
0.62897 0.36662 lineto
0.63393 0.36233 lineto
0.63889 0.35683 lineto
0.64881 0.34244 lineto
0.65873 0.32406 lineto
0.69841 0.22773 lineto
0.71825 0.17957 lineto
0.72817 0.15889 lineto
0.7381 0.14157 lineto
0.74306 0.13438 lineto
0.74802 0.12826 lineto
0.75298 0.12327 lineto
0.75794 0.11945 lineto
0.76042 0.11799 lineto
0.7629 0.11683 lineto
0.76538 0.11598 lineto
0.76662 0.11567 lineto
0.76786 0.11544 lineto
0.7691 0.11528 lineto
0.77034 0.11521 lineto
0.77158 0.1152 lineto
0.77282 0.11528 lineto
0.77406 0.11543 lineto
0.7753 0.11565 lineto
0.77654 0.11596 lineto
0.77778 0.11634 lineto
0.78026 0.11732 lineto
0.78274 0.1186 lineto
0.7877 0.12204 lineto
0.79266 0.12662 lineto
0.79762 0.13227 lineto
0.81746 0.1643 lineto
0.85714 0.25313 lineto
0.87698 0.29538 lineto
0.8869 0.31286 lineto
0.89683 0.32696 lineto
0.90179 0.33257 lineto
0.90675 0.33714 lineto
0.91171 0.34063 lineto
0.91419 0.34196 lineto
0.91667 0.34301 lineto
0.91915 0.34378 lineto
0.92039 0.34406 lineto
0.92163 0.34426 lineto
0.92287 0.3444 lineto
0.92411 0.34446 lineto
0.92535 0.34446 lineto
0.92659 0.34438 lineto
0.92783 0.34423 lineto
0.92907 0.34401 lineto
0.93031 0.34373 lineto
0.93155 0.34337 lineto
0.93403 0.34244 lineto
0.93651 0.34124 lineto
0.94147 0.33802 lineto
0.94643 0.33376 lineto
0.95635 0.32229 lineto
0.96627 0.30734 lineto
0.97619 0.28958 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23545 lineto
0.03621 0.23545 lineto
0.03745 0.23545 lineto
0.03869 0.23546 lineto
0.04117 0.23547 lineto
0.04241 0.23548 lineto
0.04365 0.23549 lineto
0.04613 0.23551 lineto
0.04861 0.23555 lineto
0.05109 0.2356 lineto
0.05357 0.23567 lineto
0.05605 0.23576 lineto
0.05853 0.23586 lineto
0.06101 0.236 lineto
0.06349 0.23616 lineto
0.06845 0.23657 lineto
0.07341 0.23715 lineto
0.07837 0.23792 lineto
0.08333 0.2389 lineto
0.09325 0.24167 lineto
0.09821 0.24352 lineto
0.10317 0.24572 lineto
0.1131 0.25129 lineto
0.12302 0.25859 lineto
0.14286 0.27887 lineto
0.1627 0.30676 lineto
0.18254 0.34093 lineto
0.22222 0.41518 lineto
0.24206 0.44596 lineto
0.25198 0.45751 lineto
0.25694 0.46207 lineto
0.2619 0.46572 lineto
0.26438 0.46719 lineto
0.26687 0.46841 lineto
0.26935 0.46937 lineto
0.27059 0.46976 lineto
0.27183 0.47008 lineto
0.27307 0.47033 lineto
0.27431 0.47051 lineto
0.27555 0.47063 lineto
0.27679 0.47068 lineto
0.27803 0.47066 lineto
0.27927 0.47056 lineto
0.28051 0.4704 lineto
0.28175 0.47017 lineto
0.28423 0.46949 lineto
0.28547 0.46905 lineto
0.28671 0.46853 lineto
0.29167 0.46573 lineto
0.29663 0.46176 lineto
0.30159 0.45661 lineto
0.31151 0.44283 lineto
0.32143 0.42456 lineto
0.34127 0.37605 lineto
0.38095 0.24946 lineto
0.40079 0.18534 lineto
0.41071 0.15642 lineto
0.42063 0.13079 lineto
0.43056 0.10924 lineto
0.44048 0.09242 lineto
0.44544 0.08595 lineto
0.4504 0.08084 lineto
0.45536 0.07712 lineto
0.45784 0.07579 lineto
0.45908 0.07526 lineto
0.46032 0.07482 lineto
0.46156 0.07447 lineto
0.4628 0.07421 lineto
0.46404 0.07403 lineto
0.46528 0.07395 lineto
0.46652 0.07395 lineto
0.46776 0.07405 lineto
0.469 0.07423 lineto
0.47024 0.0745 lineto
0.47148 0.07486 lineto
0.47272 0.07531 lineto
0.4752 0.07647 lineto
0.47768 0.07798 lineto
0.48016 0.07982 lineto
0.48512 0.08453 lineto
0.49008 0.09053 lineto
0.5 0.10618 lineto
0.51984 0.14969 lineto
0.53968 0.20377 lineto
0.55952 0.2604 lineto
0.57937 0.31128 lineto
0.58929 0.3322 lineto
0.59921 0.34909 lineto
0.60417 0.35582 lineto
0.60913 0.36134 lineto
0.61409 0.3656 lineto
0.61657 0.36725 lineto
0.61905 0.36856 lineto
0.62153 0.36955 lineto
0.62277 0.36992 lineto
0.62401 0.37021 lineto
0.62525 0.37042 lineto
0.62649 0.37054 lineto
0.62773 0.37058 lineto
0.62897 0.37054 lineto
0.63021 0.37041 lineto
0.63145 0.37021 lineto
0.63269 0.36992 lineto
0.63393 0.36955 lineto
0.63641 0.36856 lineto
0.63889 0.36726 lineto
0.64385 0.3637 lineto
0.64881 0.35891 lineto
0.65873 0.34589 lineto
0.66865 0.32876 lineto
0.67857 0.30824 lineto
0.69841 0.26047 lineto
0.71825 0.2102 lineto
0.7381 0.16529 lineto
0.74802 0.14707 lineto
0.75794 0.13263 lineto
0.7629 0.127 lineto
0.76786 0.12251 lineto
0.77282 0.11918 lineto
0.7753 0.11797 lineto
0.77654 0.11747 lineto
0.77778 0.11705 lineto
0.77902 0.11671 lineto
0.78026 0.11644 lineto
0.7815 0.11625 lineto
0.78274 0.11613 lineto
0.78398 0.11609 lineto
0.78522 0.11613 lineto
0.78646 0.11624 lineto
0.7877 0.11643 lineto
0.78894 0.11669 lineto
0.79018 0.11703 lineto
0.79266 0.11793 lineto
0.79514 0.11913 lineto
0.79762 0.12061 lineto
0.80258 0.12444 lineto
0.80754 0.12938 lineto
0.81746 0.14232 lineto
0.8373 0.17834 lineto
0.85714 0.22262 lineto
0.87698 0.26791 lineto
0.8869 0.28862 lineto
0.89683 0.30693 lineto
0.90675 0.3221 lineto
0.91171 0.32832 lineto
0.91667 0.33355 lineto
0.92163 0.33773 lineto
0.92659 0.34084 lineto
0.92907 0.34198 lineto
0.93031 0.34244 lineto
0.93155 0.34284 lineto
0.93279 0.34316 lineto
0.93403 0.34342 lineto
0.93527 0.3436 lineto
0.93651 0.34372 lineto
0.97619 0.31235 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23545 lineto
0.03869 0.23545 lineto
0.04117 0.23546 lineto
0.04241 0.23546 lineto
0.04365 0.23547 lineto
0.04489 0.23547 lineto
0.04613 0.23548 lineto
0.04861 0.2355 lineto
0.05109 0.23553 lineto
0.05357 0.23558 lineto
0.05605 0.23563 lineto
0.05853 0.2357 lineto
0.06101 0.23578 lineto
0.06349 0.23588 lineto
0.06845 0.23616 lineto
0.07341 0.23655 lineto
0.07837 0.23708 lineto
0.08333 0.23777 lineto
0.08829 0.23866 lineto
0.09325 0.23977 lineto
0.10317 0.24278 lineto
0.1131 0.24705 lineto
0.12302 0.25279 lineto
0.13294 0.26017 lineto
0.14286 0.26933 lineto
0.1627 0.29313 lineto
0.18254 0.32366 lineto
0.22222 0.39542 lineto
0.24206 0.42878 lineto
0.25198 0.44274 lineto
0.2619 0.45405 lineto
0.26687 0.45855 lineto
0.27183 0.46217 lineto
0.27679 0.46488 lineto
0.27927 0.46587 lineto
0.28051 0.46627 lineto
0.28175 0.46661 lineto
0.28299 0.46688 lineto
0.28423 0.46709 lineto
0.28547 0.46723 lineto
0.28671 0.46731 lineto
0.28795 0.46732 lineto
0.28919 0.46727 lineto
0.29043 0.46714 lineto
0.29167 0.46695 lineto
0.29291 0.46669 lineto
0.29415 0.46637 lineto
0.29663 0.4655 lineto
0.29911 0.46436 lineto
0.30159 0.46293 lineto
0.30655 0.45923 lineto
0.31151 0.45439 lineto
0.32143 0.44133 lineto
0.33135 0.42388 lineto
0.34127 0.40236 lineto
0.38095 0.28652 lineto
0.40079 0.22159 lineto
0.42063 0.16171 lineto
0.44048 0.11401 lineto
0.4504 0.09659 lineto
0.45536 0.08975 lineto
0.46032 0.08422 lineto
0.4628 0.08195 lineto
0.46528 0.08003 lineto
0.46776 0.07846 lineto
0.47024 0.07723 lineto
0.47148 0.07675 lineto
0.47272 0.07635 lineto
0.47396 0.07604 lineto
0.4752 0.07582 lineto
0.47644 0.07569 lineto
0.47768 0.07564 lineto
0.47892 0.07568 lineto
0.48016 0.07581 lineto
0.4814 0.07603 lineto
0.48264 0.07633 lineto
0.48512 0.07719 lineto
0.4876 0.0784 lineto
0.49008 0.07994 lineto
0.49504 0.08404 lineto
0.5 0.08942 lineto
0.50992 0.10386 lineto
0.51984 0.12268 lineto
0.53968 0.17049 lineto
0.55952 0.22577 lineto
0.57937 0.28043 lineto
0.59921 0.32655 lineto
0.60913 0.34429 lineto
0.61409 0.35154 lineto
0.61905 0.35761 lineto
0.62401 0.36246 lineto
0.62897 0.36605 lineto
0.63145 0.36737 lineto
0.63269 0.36791 lineto
0.63393 0.36836 lineto
0.63517 0.36873 lineto
0.63641 0.36903 lineto
0.63765 0.36924 lineto
0.63889 0.36937 lineto
0.64013 0.36942 lineto
0.64137 0.36938 lineto
0.64261 0.36927 lineto
0.64385 0.36907 lineto
0.64509 0.3688 lineto
0.64633 0.36844 lineto
0.64881 0.36749 lineto
0.65129 0.36622 lineto
0.65377 0.36464 lineto
0.65873 0.36055 lineto
0.66369 0.35529 lineto
0.66865 0.34889 lineto
0.67857 0.333 lineto
0.69841 0.29134 lineto
0.71825 0.24229 lineto
0.7381 0.19356 lineto
0.75794 0.1527 lineto
0.76786 0.13723 lineto
0.77282 0.13101 lineto
0.77778 0.12588 lineto
0.78274 0.12188 lineto
0.78522 0.12032 lineto
0.7877 0.11905 lineto
0.78894 0.11853 lineto
0.79018 0.11808 lineto
0.79142 0.11771 lineto
0.79266 0.11741 lineto
0.7939 0.11719 lineto
0.79514 0.11705 lineto
0.79638 0.11697 lineto
0.79762 0.11698 lineto
0.79886 0.11705 lineto
0.8001 0.11721 lineto
0.80134 0.11743 lineto
0.80258 0.11773 lineto
0.80382 0.11811 lineto
0.80506 0.11856 lineto
0.80754 0.11968 lineto
0.8125 0.12277 lineto
0.81746 0.12699 lineto
0.82738 0.13859 lineto
0.8373 0.15394 lineto
0.85714 0.1932 lineto
0.87698 0.23826 lineto
0.89683 0.28184 lineto
0.90675 0.30085 lineto
0.91667 0.31698 lineto
0.92659 0.32961 lineto
0.93155 0.33445 lineto
0.93651 0.33824 lineto
0.93899 0.33974 lineto
0.94147 0.34096 lineto
0.94395 0.3419 lineto
0.94519 0.34227 lineto
0.94643 0.34257 lineto
0.94767 0.3428 lineto
0.94891 0.34296 lineto
0.95015 0.34305 lineto
0.95139 0.34307 lineto
0.95263 0.34302 lineto
0.95387 0.34291 lineto
0.95511 0.34272 lineto
0.95635 0.34246 lineto
0.95759 0.34214 lineto
0.95883 0.34174 lineto
0.96131 0.34075 lineto
0.96627 0.33796 lineto
0.97123 0.33413 lineto
0.97619 0.3293 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23545 lineto
0.03993 0.23545 lineto
0.04117 0.23545 lineto
0.04241 0.23545 lineto
0.04365 0.23545 lineto
0.04489 0.23546 lineto
0.04613 0.23546 lineto
0.04861 0.23548 lineto
0.05109 0.23549 lineto
0.05357 0.23552 lineto
0.05605 0.23555 lineto
0.05853 0.23559 lineto
0.06101 0.23565 lineto
0.06349 0.23571 lineto
0.06597 0.23579 lineto
0.06845 0.23589 lineto
0.07341 0.23615 lineto
0.07837 0.23651 lineto
0.08333 0.23699 lineto
0.08829 0.23762 lineto
0.09325 0.23842 lineto
0.09821 0.23942 lineto
0.10317 0.24064 lineto
0.1131 0.24387 lineto
0.12302 0.24832 lineto
0.13294 0.25419 lineto
0.14286 0.26164 lineto
0.1627 0.28165 lineto
0.18254 0.30844 lineto
0.22222 0.37609 lineto
0.24206 0.41058 lineto
0.25198 0.42612 lineto
0.2619 0.43972 lineto
0.27183 0.4508 lineto
0.27679 0.45523 lineto
0.28175 0.45883 lineto
0.28423 0.4603 lineto
0.28671 0.46155 lineto
0.28919 0.46256 lineto
0.29167 0.46333 lineto
0.29291 0.46362 lineto
0.29415 0.46385 lineto
0.29539 0.46402 lineto
0.29663 0.46412 lineto
0.29787 0.46416 lineto
0.29911 0.46414 lineto
0.30035 0.46405 lineto
0.30159 0.46389 lineto
0.30283 0.46367 lineto
0.30407 0.46339 lineto
0.30655 0.46261 lineto
0.30903 0.46157 lineto
0.31151 0.46025 lineto
0.31647 0.4568 lineto
0.32143 0.45224 lineto
0.33135 0.43984 lineto
0.34127 0.42316 lineto
0.36111 0.37822 lineto
0.38095 0.32126 lineto
0.42063 0.1955 lineto
0.44048 0.14089 lineto
0.4504 0.11864 lineto
0.46032 0.1007 lineto
0.47024 0.0876 lineto
0.4752 0.08299 lineto
0.47768 0.08119 lineto
0.48016 0.07972 lineto
0.4814 0.07912 lineto
0.48264 0.0786 lineto
0.48388 0.07816 lineto
0.48512 0.07782 lineto
0.48636 0.07755 lineto
0.4876 0.07738 lineto
0.48884 0.07728 lineto
0.49008 0.07728 lineto
0.49132 0.07736 lineto
0.49256 0.07752 lineto
0.4938 0.07777 lineto
0.49504 0.07811 lineto
0.49752 0.07903 lineto
0.5 0.08029 lineto
0.50496 0.0838 lineto
0.50992 0.0886 lineto
0.51984 0.10186 lineto
0.52976 0.11956 lineto
0.53968 0.14103 lineto
0.57937 0.24724 lineto
0.59921 0.29886 lineto
0.60913 0.32093 lineto
0.61905 0.33943 lineto
0.62897 0.35372 lineto
0.63393 0.35913 lineto
0.63641 0.36138 lineto
0.63889 0.36331 lineto
0.64137 0.36494 lineto
0.64385 0.36624 lineto
0.64509 0.36678 lineto
0.64633 0.36723 lineto
0.64757 0.3676 lineto
0.64881 0.3679 lineto
0.65005 0.36811 lineto
0.65129 0.36824 lineto
0.65253 0.3683 lineto
0.65377 0.36827 lineto
0.65501 0.36816 lineto
0.65625 0.36797 lineto
0.65749 0.36771 lineto
0.65873 0.36736 lineto
0.66121 0.36643 lineto
0.66369 0.36519 lineto
0.66865 0.36179 lineto
0.67361 0.35719 lineto
0.67857 0.35145 lineto
0.68849 0.3368 lineto
0.69841 0.31844 lineto
0.7381 0.2244 lineto
0.75794 0.17814 lineto
0.76786 0.15842 lineto
0.77778 0.14202 lineto
0.7877 0.12953 lineto
0.79266 0.1249 lineto
0.79514 0.12301 lineto
0.79762 0.12141 lineto
0.8001 0.1201 lineto
0.80258 0.11908 lineto
0.80382 0.11868 lineto
0.80506 0.11836 lineto
0.8063 0.11811 lineto
0.80754 0.11794 lineto
0.80878 0.11784 lineto
0.81002 0.11781 lineto
0.81126 0.11786 lineto
0.8125 0.11798 lineto
0.81374 0.11817 lineto
0.81498 0.11844 lineto
0.81746 0.1192 lineto
0.81994 0.12025 lineto
0.82242 0.12158 lineto
0.82738 0.12509 lineto
0.83234 0.1297 lineto
0.8373 0.13534 lineto
0.85714 0.1669 lineto
0.89683 0.25358 lineto
0.91667 0.29467 lineto
0.92659 0.31166 lineto
0.93651 0.32537 lineto
0.94147 0.33082 lineto
0.94643 0.33526 lineto
0.94891 0.33709 lineto
0.95139 0.33866 lineto
0.95387 0.33996 lineto
0.95635 0.34098 lineto
0.95759 0.34139 lineto
0.95883 0.34173 lineto
0.96007 0.342 lineto
0.96131 0.3422 lineto
0.96255 0.34233 lineto
0.96379 0.3424 lineto
0.96503 0.34239 lineto
0.96627 0.34232 lineto
0.97619 0.33928 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23545 lineto
0.04241 0.23545 lineto
0.04365 0.23545 lineto
0.04489 0.23545 lineto
0.04613 0.23545 lineto
0.04737 0.23546 lineto
0.04861 0.23546 lineto
0.05109 0.23547 lineto
0.05357 0.23549 lineto
0.05605 0.23551 lineto
0.05853 0.23553 lineto
0.06101 0.23556 lineto
0.06349 0.23561 lineto
0.06597 0.23566 lineto
0.06845 0.23572 lineto
0.07341 0.23589 lineto
0.07837 0.23614 lineto
0.08333 0.23647 lineto
0.08829 0.23691 lineto
0.09325 0.23747 lineto
0.09821 0.23819 lineto
0.10317 0.23909 lineto
0.1131 0.2415 lineto
0.12302 0.24492 lineto
0.13294 0.24953 lineto
0.14286 0.25551 lineto
0.1627 0.27211 lineto
0.18254 0.29525 lineto
0.22222 0.35768 lineto
0.24206 0.3921 lineto
0.2619 0.42362 lineto
0.27183 0.43689 lineto
0.28175 0.44775 lineto
0.28671 0.45211 lineto
0.29167 0.45568 lineto
0.29415 0.45715 lineto
0.29663 0.4584 lineto
0.29911 0.45943 lineto
0.30035 0.45985 lineto
0.30159 0.46022 lineto
0.30283 0.46053 lineto
0.30407 0.46078 lineto
0.30531 0.46097 lineto
0.30655 0.46109 lineto
0.30779 0.46116 lineto
0.30903 0.46116 lineto
0.31027 0.4611 lineto
0.31151 0.46098 lineto
0.31275 0.4608 lineto
0.31399 0.46055 lineto
0.31523 0.46023 lineto
0.31647 0.45985 lineto
0.32143 0.45768 lineto
0.32391 0.4562 lineto
0.32639 0.45445 lineto
0.33135 0.45015 lineto
0.34127 0.43836 lineto
0.35119 0.42239 lineto
0.36111 0.4025 lineto
0.38095 0.35261 lineto
0.42063 0.23058 lineto
0.44048 0.17159 lineto
0.4504 0.14565 lineto
0.46032 0.12314 lineto
0.47024 0.10473 lineto
0.4752 0.09724 lineto
0.48016 0.09098 lineto
0.48512 0.08598 lineto
0.4876 0.08396 lineto
0.49008 0.08228 lineto
0.49256 0.08093 lineto
0.4938 0.08038 lineto
0.49504 0.07991 lineto
0.49628 0.07952 lineto
0.49752 0.07922 lineto
0.49876 0.07901 lineto
0.5 0.07888 lineto
0.50124 0.07883 lineto
0.50248 0.07887 lineto
0.50372 0.07898 lineto
0.50496 0.07919 lineto
0.5062 0.07947 lineto
0.50744 0.07984 lineto
0.50992 0.08083 lineto
0.5124 0.08215 lineto
0.51488 0.08379 lineto
0.51984 0.08803 lineto
0.5248 0.0935 lineto
0.52976 0.10016 lineto
0.53968 0.11677 lineto
0.55952 0.16079 lineto
0.57937 0.21366 lineto
0.59921 0.26776 lineto
0.61905 0.31535 lineto
0.62897 0.33454 lineto
0.63393 0.34267 lineto
0.63889 0.34972 lineto
0.64385 0.35564 lineto
0.64881 0.36037 lineto
0.65129 0.36229 lineto
0.65377 0.36389 lineto
0.65625 0.36518 lineto
0.65749 0.36571 lineto
0.65873 0.36616 lineto
0.65997 0.36653 lineto
0.66121 0.36682 lineto
0.66245 0.36703 lineto
0.66369 0.36716 lineto
0.66493 0.36722 lineto
0.66617 0.36719 lineto
0.66741 0.36709 lineto
0.66865 0.3669 lineto
0.67113 0.3663 lineto
0.67237 0.36589 lineto
0.67361 0.36539 lineto
0.67857 0.36265 lineto
0.68105 0.36082 lineto
0.68353 0.3587 lineto
0.68849 0.35361 lineto
0.69841 0.34017 lineto
0.71825 0.30253 lineto
0.7381 0.25575 lineto
0.75794 0.20715 lineto
0.77778 0.16421 lineto
0.7877 0.14695 lineto
0.79266 0.13969 lineto
0.79762 0.13341 lineto
0.80258 0.1282 lineto
0.80754 0.12408 lineto
0.81002 0.12245 lineto
0.8125 0.1211 lineto
0.81498 0.12004 lineto
0.81746 0.11928 lineto
0.8187 0.11901 lineto
0.81994 0.11881 lineto
0.82118 0.11868 lineto
0.82242 0.11863 lineto
0.82366 0.11865 lineto
0.8249 0.11874 lineto
0.82614 0.11891 lineto
0.82738 0.11915 lineto
0.82986 0.11985 lineto
0.83234 0.12083 lineto
0.83482 0.1221 lineto
0.8373 0.12365 lineto
0.84226 0.12757 lineto
0.84722 0.13255 lineto
0.85714 0.14546 lineto
0.87698 0.18094 lineto
0.89683 0.22421 lineto
0.91667 0.26829 lineto
0.92659 0.28842 lineto
0.93651 0.30617 lineto
0.94643 0.32087 lineto
0.95635 0.33194 lineto
0.96131 0.33598 lineto
0.96379 0.33761 lineto
0.96627 0.33898 lineto
0.96875 0.34007 lineto
0.97123 0.34089 lineto
0.97247 0.3412 lineto
0.97371 0.34144 lineto
0.97619 0.34172 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23545 lineto
0.04489 0.23545 lineto
0.04613 0.23545 lineto
0.04737 0.23545 lineto
0.04861 0.23545 lineto
0.05109 0.23546 lineto
0.05357 0.23547 lineto
0.05605 0.23548 lineto
0.05853 0.23549 lineto
0.06101 0.23552 lineto
0.06349 0.23554 lineto
0.06597 0.23557 lineto
0.06845 0.23562 lineto
0.07093 0.23567 lineto
0.07341 0.23573 lineto
0.07837 0.23589 lineto
0.08333 0.23611 lineto
0.08829 0.23642 lineto
0.09325 0.23682 lineto
0.09821 0.23733 lineto
0.10317 0.23798 lineto
0.10813 0.23879 lineto
0.1131 0.23977 lineto
0.12302 0.24236 lineto
0.13294 0.24594 lineto
0.14286 0.25068 lineto
0.15278 0.25675 lineto
0.1627 0.26428 lineto
0.18254 0.28398 lineto
0.20238 0.30979 lineto
0.22222 0.34055 lineto
0.24206 0.37394 lineto
0.2619 0.40654 lineto
0.27183 0.42126 lineto
0.28175 0.43422 lineto
0.29167 0.44486 lineto
0.29663 0.44916 lineto
0.30159 0.4527 lineto
0.30655 0.45542 lineto
0.30903 0.45646 lineto
0.31151 0.45727 lineto
0.31399 0.45786 lineto
0.31523 0.45807 lineto
0.31647 0.45821 lineto
0.31771 0.4583 lineto
0.31895 0.45833 lineto
0.32019 0.4583 lineto
0.32143 0.45821 lineto
0.32267 0.45805 lineto
0.32391 0.45784 lineto
0.32639 0.45721 lineto
0.32887 0.45634 lineto
0.33135 0.45522 lineto
0.33631 0.45219 lineto
0.34127 0.44813 lineto
0.35119 0.43689 lineto
0.36111 0.42159 lineto
0.38095 0.37978 lineto
0.42063 0.26551 lineto
0.44048 0.20462 lineto
0.46032 0.15024 lineto
0.47024 0.1275 lineto
0.48016 0.10869 lineto
0.48512 0.10092 lineto
0.49008 0.09434 lineto
0.49504 0.08898 lineto
0.49752 0.08677 lineto
0.5 0.08488 lineto
0.50248 0.08332 lineto
0.50496 0.08208 lineto
0.5062 0.08159 lineto
0.50744 0.08117 lineto
0.50868 0.08084 lineto
0.50992 0.08059 lineto
0.51116 0.08042 lineto
0.5124 0.08034 lineto
0.51364 0.08033 lineto
0.51488 0.08041 lineto
0.51612 0.08057 lineto
0.51736 0.08082 lineto
0.51984 0.08155 lineto
0.52108 0.08204 lineto
0.52232 0.0826 lineto
0.5248 0.08398 lineto
0.52976 0.08768 lineto
0.53472 0.09262 lineto
0.53968 0.09874 lineto
0.5496 0.11429 lineto
0.55952 0.13377 lineto
0.57937 0.18151 lineto
0.59921 0.23511 lineto
0.61905 0.28693 lineto
0.62897 0.30984 lineto
0.63889 0.32963 lineto
0.64881 0.34562 lineto
0.65377 0.35202 lineto
0.65873 0.35727 lineto
0.66369 0.36133 lineto
0.66617 0.36291 lineto
0.66865 0.36418 lineto
0.67113 0.36514 lineto
0.67237 0.3655 lineto
0.67361 0.36578 lineto
0.67485 0.36599 lineto
0.67609 0.36612 lineto
0.67733 0.36617 lineto
0.67857 0.36615 lineto
0.67981 0.36604 lineto
0.68105 0.36586 lineto
0.68229 0.3656 lineto
0.68353 0.36527 lineto
0.68601 0.36437 lineto
0.68849 0.36316 lineto
0.69345 0.35985 lineto
0.69841 0.35538 lineto
0.70833 0.34316 lineto
0.71825 0.327 lineto
0.7381 0.28563 lineto
0.75794 0.23778 lineto
0.77778 0.19086 lineto
0.7877 0.17002 lineto
0.79762 0.15201 lineto
0.80754 0.13751 lineto
0.8125 0.13174 lineto
0.81746 0.12704 lineto
0.81994 0.12509 lineto
0.82242 0.12343 lineto
0.8249 0.12206 lineto
0.82738 0.12097 lineto
0.82862 0.12053 lineto
0.82986 0.12017 lineto
0.8311 0.11987 lineto
0.83234 0.11965 lineto
0.83358 0.11951 lineto
0.83482 0.11943 lineto
0.83606 0.11943 lineto
0.8373 0.1195 lineto
0.83854 0.11964 lineto
0.83978 0.11985 lineto
0.84102 0.12014 lineto
0.84226 0.1205 lineto
0.84722 0.12264 lineto
0.8497 0.12413 lineto
0.85218 0.12589 lineto
0.85714 0.13022 lineto
0.86706 0.14189 lineto
0.87698 0.15715 lineto
0.89683 0.19577 lineto
0.91667 0.23978 lineto
0.93651 0.28213 lineto
0.95635 0.31615 lineto
0.96131 0.32269 lineto
0.96627 0.32832 lineto
0.97619 0.3366 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23545 lineto
0.04861 0.23545 lineto
0.05109 0.23545 lineto
0.05233 0.23545 lineto
0.05357 0.23546 lineto
0.05605 0.23546 lineto
0.05853 0.23547 lineto
0.06101 0.23549 lineto
0.06349 0.2355 lineto
0.06597 0.23552 lineto
0.06845 0.23555 lineto
0.07093 0.23558 lineto
0.07341 0.23562 lineto
0.07837 0.23573 lineto
0.08333 0.23588 lineto
0.08829 0.23609 lineto
0.09325 0.23637 lineto
0.09821 0.23673 lineto
0.10317 0.2372 lineto
0.10813 0.23778 lineto
0.1131 0.2385 lineto
0.12302 0.24045 lineto
0.13294 0.2432 lineto
0.14286 0.24692 lineto
0.15278 0.25178 lineto
0.1627 0.25792 lineto
0.18254 0.27449 lineto
0.20238 0.29701 lineto
0.22222 0.32492 lineto
0.2619 0.38915 lineto
0.28175 0.41904 lineto
0.29167 0.4317 lineto
0.30159 0.44214 lineto
0.30655 0.44637 lineto
0.31151 0.44988 lineto
0.31399 0.45134 lineto
0.31647 0.45259 lineto
0.31895 0.45364 lineto
0.32143 0.45447 lineto
0.32267 0.45481 lineto
0.32391 0.45508 lineto
0.32515 0.45531 lineto
0.32639 0.45547 lineto
0.32763 0.45558 lineto
0.32887 0.45563 lineto
0.33011 0.45562 lineto
0.33135 0.45555 lineto
0.33259 0.45543 lineto
0.33383 0.45524 lineto
0.33631 0.45469 lineto
0.33755 0.45432 lineto
0.33879 0.45389 lineto
0.34127 0.45284 lineto
0.34623 0.45001 lineto
0.35119 0.44616 lineto
0.36111 0.43544 lineto
0.37103 0.42076 lineto
0.38095 0.4023 lineto
0.42063 0.29902 lineto
0.44048 0.23855 lineto
0.46032 0.1806 lineto
0.47024 0.15464 lineto
0.48016 0.13174 lineto
0.49008 0.11256 lineto
0.49504 0.10455 lineto
0.5 0.09767 lineto
0.50496 0.09198 lineto
0.50992 0.08752 lineto
0.5124 0.08576 lineto
0.51488 0.08432 lineto
0.51736 0.0832 lineto
0.5186 0.08276 lineto
0.51984 0.0824 lineto
0.52108 0.08212 lineto
0.52232 0.08192 lineto
0.52356 0.0818 lineto
0.5248 0.08176 lineto
0.52604 0.0818 lineto
0.52728 0.08193 lineto
0.52852 0.08213 lineto
0.52976 0.08242 lineto
0.53224 0.08323 lineto
0.53472 0.08435 lineto
0.5372 0.08579 lineto
0.53968 0.08755 lineto
0.54464 0.09196 lineto
0.5496 0.09756 lineto
0.55952 0.1121 lineto
0.57937 0.15241 lineto
0.61905 0.25589 lineto
0.63889 0.30439 lineto
0.64881 0.32472 lineto
0.65873 0.34145 lineto
0.66369 0.34828 lineto
0.66865 0.35401 lineto
0.67361 0.35859 lineto
0.67857 0.36198 lineto
0.68105 0.36323 lineto
0.68229 0.36373 lineto
0.68353 0.36416 lineto
0.68477 0.36452 lineto
0.68601 0.36479 lineto
0.68725 0.365 lineto
0.68849 0.36512 lineto
0.68973 0.36517 lineto
0.69097 0.36514 lineto
0.69221 0.36503 lineto
0.69345 0.36485 lineto
0.69469 0.36459 lineto
0.69593 0.36425 lineto
0.69841 0.36335 lineto
0.70089 0.36216 lineto
0.70337 0.36066 lineto
0.70833 0.3568 lineto
0.71329 0.35182 lineto
0.71825 0.34577 lineto
0.7381 0.31223 lineto
0.77778 0.22017 lineto
0.79762 0.17585 lineto
0.80754 0.15716 lineto
0.81746 0.14177 lineto
0.82242 0.13549 lineto
0.82738 0.13024 lineto
0.83234 0.12605 lineto
0.83482 0.12437 lineto
0.8373 0.12297 lineto
0.83978 0.12185 lineto
0.84102 0.1214 lineto
0.84226 0.12102 lineto
0.8435 0.12071 lineto
0.84474 0.12047 lineto
0.84598 0.12031 lineto
0.84722 0.12021 lineto
0.84846 0.12019 lineto
0.8497 0.12024 lineto
0.85094 0.12036 lineto
0.85218 0.12055 lineto
0.85466 0.12115 lineto
0.8559 0.12156 lineto
0.85714 0.12203 lineto
0.8621 0.12462 lineto
0.86706 0.1283 lineto
0.87698 0.13874 lineto
0.8869 0.1529 lineto
0.89683 0.17017 lineto
0.93651 0.25499 lineto
0.97619 0.32442 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.05109 0.23545 lineto
0.05233 0.23545 lineto
0.05357 0.23545 lineto
0.05605 0.23545 lineto
0.05853 0.23546 lineto
0.06101 0.23547 lineto
0.06349 0.23548 lineto
0.06597 0.23549 lineto
0.06845 0.23551 lineto
0.07093 0.23553 lineto
0.07341 0.23555 lineto
0.07837 0.23562 lineto
0.08085 0.23567 lineto
0.08333 0.23572 lineto
0.08829 0.23587 lineto
0.09325 0.23606 lineto
0.09821 0.23631 lineto
0.10317 0.23664 lineto
0.10813 0.23707 lineto
0.1131 0.23759 lineto
0.11806 0.23825 lineto
0.12302 0.23904 lineto
0.13294 0.24113 lineto
0.14286 0.24402 lineto
0.15278 0.24787 lineto
0.1627 0.25283 lineto
0.18254 0.26659 lineto
0.20238 0.28597 lineto
0.22222 0.31089 lineto
0.2619 0.372 lineto
0.28175 0.40293 lineto
0.29167 0.41694 lineto
0.30159 0.42932 lineto
0.31151 0.43956 lineto
0.32143 0.4472 lineto
0.32391 0.44865 lineto
0.32639 0.4499 lineto
0.32887 0.45096 lineto
0.33135 0.4518 lineto
0.33259 0.45215 lineto
0.33383 0.45244 lineto
0.33507 0.45267 lineto
0.33631 0.45286 lineto
0.33755 0.45298 lineto
0.33879 0.45305 lineto
0.34003 0.45306 lineto
0.34127 0.45302 lineto
0.34251 0.45292 lineto
0.34375 0.45276 lineto
0.34499 0.45254 lineto
0.34623 0.45226 lineto
0.34871 0.45153 lineto
0.35119 0.45056 lineto
0.35615 0.4479 lineto
0.36111 0.44425 lineto
0.37103 0.43402 lineto
0.38095 0.41991 lineto
0.40079 0.38088 lineto
0.42063 0.33004 lineto
0.46032 0.21284 lineto
0.48016 0.15888 lineto
0.49008 0.13584 lineto
0.5 0.11634 lineto
0.50496 0.10811 lineto
0.50992 0.10097 lineto
0.51488 0.09498 lineto
0.51984 0.09018 lineto
0.52232 0.08824 lineto
0.5248 0.08661 lineto
0.52728 0.08529 lineto
0.52852 0.08474 lineto
0.52976 0.08428 lineto
0.531 0.0839 lineto
0.53224 0.08359 lineto
0.53348 0.08336 lineto
0.53472 0.08322 lineto
0.53596 0.08315 lineto
0.5372 0.08316 lineto
0.53844 0.08325 lineto
0.53968 0.08342 lineto
0.54216 0.08399 lineto
0.5434 0.0844 lineto
0.54464 0.08488 lineto
0.5496 0.08759 lineto
0.55208 0.0894 lineto
0.55456 0.09152 lineto
0.55952 0.09662 lineto
0.56944 0.11016 lineto
0.57937 0.12772 lineto
0.61905 0.22398 lineto
0.63889 0.27557 lineto
0.64881 0.29904 lineto
0.65873 0.31983 lineto
0.66865 0.33723 lineto
0.67857 0.35064 lineto
0.68353 0.3557 lineto
0.68601 0.3578 lineto
0.68849 0.35961 lineto
0.69097 0.36112 lineto
0.69345 0.36233 lineto
0.69469 0.36282 lineto
0.69593 0.36324 lineto
0.69717 0.36358 lineto
0.69841 0.36385 lineto
0.69965 0.36404 lineto
0.70089 0.36415 lineto
0.70213 0.36419 lineto
0.70337 0.36415 lineto
0.70461 0.36404 lineto
0.70585 0.36385 lineto
0.70833 0.36325 lineto
0.70957 0.36284 lineto
0.71081 0.36235 lineto
0.71329 0.36116 lineto
0.71825 0.3579 lineto
0.72321 0.3535 lineto
0.72817 0.34802 lineto
0.7381 0.33405 lineto
0.75794 0.2962 lineto
0.77778 0.25025 lineto
0.79762 0.20328 lineto
0.81746 0.16238 lineto
0.82738 0.14619 lineto
0.83234 0.13943 lineto
0.8373 0.13366 lineto
0.84226 0.12892 lineto
0.84722 0.12526 lineto
0.8497 0.12384 lineto
0.85218 0.1227 lineto
0.85466 0.12184 lineto
0.8559 0.12152 lineto
0.85714 0.12127 lineto
0.85838 0.12109 lineto
0.85962 0.12098 lineto
0.86086 0.12094 lineto
0.8621 0.12097 lineto
0.86334 0.12107 lineto
0.86458 0.12125 lineto
0.86582 0.12149 lineto
0.86706 0.1218 lineto
0.86954 0.12264 lineto
0.87202 0.12375 lineto
0.87698 0.12679 lineto
0.88194 0.1309 lineto
0.8869 0.13601 lineto
0.89683 0.14904 lineto
0.91667 0.18424 lineto
0.93651 0.22668 lineto
0.97619 0.30618 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23545 lineto
0.05357 0.23545 lineto
0.05605 0.23545 lineto
0.05853 0.23545 lineto
0.06101 0.23546 lineto
0.06349 0.23546 lineto
0.06597 0.23547 lineto
0.06845 0.23548 lineto
0.07093 0.23549 lineto
0.07341 0.23551 lineto
0.07837 0.23556 lineto
0.08085 0.23559 lineto
0.08333 0.23562 lineto
0.08829 0.23572 lineto
0.09325 0.23585 lineto
0.09821 0.23603 lineto
0.10317 0.23626 lineto
0.10813 0.23656 lineto
0.1131 0.23694 lineto
0.11806 0.23742 lineto
0.12302 0.23801 lineto
0.13294 0.23958 lineto
0.14286 0.2418 lineto
0.15278 0.24482 lineto
0.1627 0.24878 lineto
0.17262 0.25383 lineto
0.18254 0.26008 lineto
0.20238 0.27656 lineto
0.22222 0.29849 lineto
0.2619 0.35551 lineto
0.28175 0.3865 lineto
0.30159 0.41496 lineto
0.31151 0.42706 lineto
0.32143 0.43711 lineto
0.32639 0.44122 lineto
0.33135 0.44465 lineto
0.33631 0.44734 lineto
0.33879 0.4484 lineto
0.34127 0.44926 lineto
0.34251 0.44961 lineto
0.34375 0.44991 lineto
0.34499 0.45016 lineto
0.34623 0.45036 lineto
0.34747 0.4505 lineto
0.34871 0.45058 lineto
0.34995 0.45062 lineto
0.35119 0.45059 lineto
0.35243 0.45051 lineto
0.35367 0.45038 lineto
0.35615 0.44994 lineto
0.35739 0.44963 lineto
0.35863 0.44927 lineto
0.36111 0.44837 lineto
0.36607 0.44586 lineto
0.37103 0.4424 lineto
0.38095 0.43261 lineto
0.39087 0.41904 lineto
0.40079 0.40184 lineto
0.42063 0.35776 lineto
0.46032 0.24563 lineto
0.48016 0.18881 lineto
0.5 0.13981 lineto
0.50992 0.12004 lineto
0.51984 0.10423 lineto
0.5248 0.09796 lineto
0.52976 0.09285 lineto
0.53472 0.08893 lineto
0.5372 0.08743 lineto
0.53968 0.08623 lineto
0.54216 0.08534 lineto
0.5434 0.08501 lineto
0.54464 0.08476 lineto
0.54588 0.08459 lineto
0.54712 0.08449 lineto
0.54836 0.08448 lineto
0.5496 0.08454 lineto
0.55084 0.08468 lineto
0.55208 0.08489 lineto
0.55332 0.08519 lineto
0.55456 0.08556 lineto
0.55704 0.08653 lineto
0.55952 0.0878 lineto
0.56448 0.09125 lineto
0.56944 0.09588 lineto
0.57937 0.10847 lineto
0.58929 0.12511 lineto
0.59921 0.14522 lineto
0.61905 0.19289 lineto
0.63889 0.24482 lineto
0.65873 0.29377 lineto
0.67857 0.33298 lineto
0.68353 0.34058 lineto
0.68849 0.34717 lineto
0.69345 0.35268 lineto
0.69841 0.35707 lineto
0.70089 0.35883 lineto
0.70337 0.3603 lineto
0.70585 0.36148 lineto
0.70833 0.36235 lineto
0.70957 0.36268 lineto
0.71081 0.36294 lineto
0.71205 0.36311 lineto
0.71329 0.36322 lineto
0.71453 0.36325 lineto
0.71577 0.3632 lineto
0.71701 0.36308 lineto
0.71825 0.36288 lineto
0.71949 0.36262 lineto
0.72073 0.36227 lineto
0.72321 0.36137 lineto
0.72569 0.36017 lineto
0.72817 0.35868 lineto
0.73313 0.35486 lineto
0.7381 0.34995 lineto
0.74802 0.33706 lineto
0.75794 0.32052 lineto
0.77778 0.27926 lineto
0.81746 0.18742 lineto
0.82738 0.16764 lineto
0.8373 0.15071 lineto
0.84722 0.13727 lineto
0.85218 0.13202 lineto
0.85714 0.12781 lineto
0.8621 0.12467 lineto
0.86458 0.12351 lineto
0.86582 0.12304 lineto
0.86706 0.12264 lineto
0.8683 0.1223 lineto
0.86954 0.12204 lineto
0.87078 0.12185 lineto
0.87202 0.12172 lineto
0.87326 0.12167 lineto
0.8745 0.12169 lineto
0.87574 0.12177 lineto
0.87698 0.12193 lineto
0.87822 0.12216 lineto
0.87946 0.12245 lineto
0.88194 0.12325 lineto
0.88442 0.12432 lineto
0.8869 0.12567 lineto
0.89187 0.12915 lineto
0.89683 0.13367 lineto
0.90675 0.14557 lineto
0.91667 0.16088 lineto
0.93651 0.19908 lineto
0.97619 0.28322 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05605 0.23545 lineto
0.05853 0.23545 lineto
0.06101 0.23545 lineto
0.06349 0.23545 lineto
0.06597 0.23546 lineto
0.06845 0.23547 lineto
0.07093 0.23547 lineto
0.07341 0.23548 lineto
0.07837 0.23551 lineto
0.08085 0.23553 lineto
0.08333 0.23556 lineto
0.08829 0.23562 lineto
0.09325 0.23571 lineto
0.09821 0.23583 lineto
0.10317 0.23599 lineto
0.10813 0.23621 lineto
0.1131 0.23648 lineto
0.11806 0.23683 lineto
0.12302 0.23726 lineto
0.13294 0.23843 lineto
0.1379 0.23921 lineto
0.14286 0.24013 lineto
0.15278 0.24247 lineto
0.1627 0.2456 lineto
0.17262 0.24966 lineto
0.18254 0.25478 lineto
0.20238 0.26863 lineto
0.22222 0.28768 lineto
0.2619 0.33998 lineto
0.30159 0.3997 lineto
0.32143 0.42492 lineto
0.33135 0.43478 lineto
0.33631 0.43883 lineto
0.34127 0.44222 lineto
0.34623 0.4449 lineto
0.34871 0.44596 lineto
0.35119 0.44683 lineto
0.35243 0.44719 lineto
0.35367 0.4475 lineto
0.35491 0.44776 lineto
0.35615 0.44796 lineto
0.35739 0.44812 lineto
0.35863 0.44822 lineto
0.35987 0.44827 lineto
0.36111 0.44827 lineto
0.36235 0.44821 lineto
0.36359 0.4481 lineto
0.36483 0.44793 lineto
0.36607 0.44771 lineto
0.36855 0.44709 lineto
0.37103 0.44625 lineto
0.37351 0.44519 lineto
0.37599 0.44389 lineto
0.38095 0.4406 lineto
0.38591 0.43639 lineto
0.39087 0.43123 lineto
0.40079 0.41816 lineto
0.42063 0.38159 lineto
0.46032 0.27779 lineto
0.48016 0.22024 lineto
0.5 0.16687 lineto
0.51984 0.12364 lineto
0.52976 0.10745 lineto
0.53472 0.10093 lineto
0.53968 0.09552 lineto
0.54464 0.09128 lineto
0.5496 0.08823 lineto
0.55208 0.08715 lineto
0.55332 0.08673 lineto
0.55456 0.08638 lineto
0.5558 0.08611 lineto
0.55704 0.08592 lineto
0.55828 0.0858 lineto
0.55952 0.08576 lineto
0.56076 0.08579 lineto
0.562 0.0859 lineto
0.56324 0.08609 lineto
0.56448 0.08635 lineto
0.56572 0.08669 lineto
0.56696 0.0871 lineto
0.56944 0.08816 lineto
0.57192 0.08951 lineto
0.5744 0.09116 lineto
0.57937 0.09533 lineto
0.58929 0.10699 lineto
0.59921 0.12274 lineto
0.61905 0.16414 lineto
0.65873 0.26481 lineto
0.67857 0.31016 lineto
0.68849 0.32871 lineto
0.69841 0.34362 lineto
0.70337 0.34954 lineto
0.70833 0.35439 lineto
0.71081 0.35639 lineto
0.71329 0.3581 lineto
0.71577 0.35953 lineto
0.71825 0.36067 lineto
0.71949 0.36112 lineto
0.72073 0.36151 lineto
0.72197 0.36182 lineto
0.72321 0.36206 lineto
0.72445 0.36222 lineto
0.72569 0.36231 lineto
0.72693 0.36233 lineto
0.72817 0.36227 lineto
0.72941 0.36214 lineto
0.73065 0.36194 lineto
0.73189 0.36166 lineto
0.73313 0.36131 lineto
0.73562 0.36039 lineto
0.7381 0.35918 lineto
0.74306 0.35593 lineto
0.74802 0.35157 lineto
0.75794 0.33974 lineto
0.76786 0.32418 lineto
0.77778 0.3055 lineto
0.81746 0.21526 lineto
0.8373 0.17292 lineto
0.84722 0.15534 lineto
0.85714 0.14105 lineto
0.8621 0.13531 lineto
0.86706 0.13058 lineto
0.87202 0.1269 lineto
0.8745 0.12546 lineto
0.87698 0.12429 lineto
0.87822 0.12381 lineto
0.87946 0.1234 lineto
0.8807 0.12306 lineto
0.88194 0.12278 lineto
0.88318 0.12258 lineto
0.88442 0.12245 lineto
0.88566 0.12238 lineto
0.8869 0.12239 lineto
0.88814 0.12246 lineto
0.88938 0.1226 lineto
0.89187 0.1231 lineto
0.89311 0.12344 lineto
0.89435 0.12386 lineto
0.89683 0.1249 lineto
0.90179 0.12778 lineto
0.90675 0.1317 lineto
0.91667 0.14248 lineto
0.92659 0.15678 lineto
0.93651 0.17402 lineto
0.97619 0.25719 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05853 0.23544 lineto
0.06101 0.23545 lineto
0.06349 0.23545 lineto
0.06597 0.23545 lineto
0.06845 0.23546 lineto
0.07093 0.23546 lineto
0.07341 0.23547 lineto
0.07589 0.23548 lineto
0.07837 0.23549 lineto
0.08085 0.2355 lineto
0.08333 0.23551 lineto
0.08581 0.23553 lineto
0.08829 0.23556 lineto
0.09325 0.23562 lineto
0.09821 0.2357 lineto
0.10317 0.23581 lineto
0.10813 0.23596 lineto
0.1131 0.23616 lineto
0.11806 0.23641 lineto
0.12302 0.23672 lineto
0.13294 0.23759 lineto
0.1379 0.23817 lineto
0.14286 0.23887 lineto
0.15278 0.24067 lineto
0.1627 0.24312 lineto
0.17262 0.24636 lineto
0.18254 0.25051 lineto
0.19246 0.2557 lineto
0.20238 0.26202 lineto
0.22222 0.27838 lineto
0.24206 0.29977 lineto
0.2619 0.32563 lineto
0.30159 0.3841 lineto
0.32143 0.41128 lineto
0.33135 0.42288 lineto
0.34127 0.43257 lineto
0.34623 0.43655 lineto
0.35119 0.4399 lineto
0.35615 0.44257 lineto
0.35863 0.44363 lineto
0.36111 0.44451 lineto
0.36359 0.44519 lineto
0.36483 0.44546 lineto
0.36607 0.44567 lineto
0.36731 0.44584 lineto
0.36855 0.44596 lineto
0.36979 0.44602 lineto
0.37103 0.44603 lineto
0.37227 0.44599 lineto
0.37351 0.4459 lineto
0.37475 0.44576 lineto
0.37599 0.44556 lineto
0.37847 0.44499 lineto
0.38095 0.44421 lineto
0.38343 0.44321 lineto
0.38591 0.44199 lineto
0.39087 0.43886 lineto
0.39583 0.43482 lineto
0.40079 0.42987 lineto
0.41071 0.41728 lineto
0.42063 0.40118 lineto
0.44048 0.35958 lineto
0.46032 0.30827 lineto
0.5 0.19632 lineto
0.51984 0.14737 lineto
0.52976 0.12716 lineto
0.53968 0.11061 lineto
0.5496 0.09819 lineto
0.55456 0.09365 lineto
0.55704 0.09181 lineto
0.55952 0.09027 lineto
0.562 0.08902 lineto
0.56448 0.08807 lineto
0.56572 0.0877 lineto
0.56696 0.08741 lineto
0.5682 0.0872 lineto
0.56944 0.08706 lineto
0.57068 0.087 lineto
0.57192 0.08701 lineto
0.57316 0.0871 lineto
0.5744 0.08726 lineto
0.57564 0.08749 lineto
0.57688 0.0878 lineto
0.57937 0.08865 lineto
0.58185 0.08979 lineto
0.58433 0.09122 lineto
0.58929 0.09495 lineto
0.59425 0.0998 lineto
0.59921 0.10572 lineto
0.61905 0.13906 lineto
0.63889 0.18406 lineto
0.65873 0.23453 lineto
0.67857 0.28356 lineto
0.68849 0.3054 lineto
0.69841 0.32443 lineto
0.70833 0.34 lineto
0.71329 0.34632 lineto
0.71825 0.35158 lineto
0.72321 0.35576 lineto
0.72569 0.35742 lineto
0.72817 0.3588 lineto
0.73065 0.3599 lineto
0.73189 0.36033 lineto
0.73313 0.3607 lineto
0.73437 0.36099 lineto
0.73562 0.36121 lineto
0.73686 0.36136 lineto
0.7381 0.36143 lineto
0.73934 0.36144 lineto
0.74058 0.36136 lineto
0.74182 0.36122 lineto
0.74306 0.36101 lineto
0.7443 0.36072 lineto
0.74554 0.36036 lineto
0.74802 0.35942 lineto
0.7505 0.35821 lineto
0.75298 0.35671 lineto
0.75794 0.35289 lineto
0.76786 0.34211 lineto
0.77778 0.32752 lineto
0.79762 0.28932 lineto
0.81746 0.24414 lineto
0.8373 0.19879 lineto
0.84722 0.1782 lineto
0.85714 0.16003 lineto
0.86706 0.14497 lineto
0.87698 0.13356 lineto
0.88194 0.12935 lineto
0.88442 0.12765 lineto
0.8869 0.1262 lineto
0.88938 0.12503 lineto
0.89187 0.12413 lineto
0.89311 0.12378 lineto
0.89435 0.1235 lineto
0.89559 0.12329 lineto
0.89683 0.12315 lineto
0.89807 0.12307 lineto
0.89931 0.12307 lineto
0.90055 0.12313 lineto
0.90179 0.12327 lineto
0.90303 0.12347 lineto
0.90427 0.12373 lineto
0.90551 0.12407 lineto
0.90675 0.12447 lineto
0.91171 0.12676 lineto
0.91419 0.1283 lineto
0.91667 0.13009 lineto
0.92659 0.13975 lineto
0.93651 0.15303 lineto
0.95635 0.18816 lineto
0.97619 0.22986 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06349 0.23545 lineto
0.06597 0.23545 lineto
0.06845 0.23545 lineto
0.07093 0.23545 lineto
0.07341 0.23546 lineto
0.07589 0.23546 lineto
0.07837 0.23547 lineto
0.08085 0.23548 lineto
0.08333 0.23549 lineto
0.08581 0.2355 lineto
0.08829 0.23552 lineto
0.09325 0.23556 lineto
0.09821 0.23561 lineto
0.10317 0.23569 lineto
0.10813 0.23579 lineto
0.1131 0.23593 lineto
0.11806 0.23611 lineto
0.12302 0.23633 lineto
0.13294 0.23697 lineto
0.1379 0.2374 lineto
0.14286 0.23793 lineto
0.15278 0.2393 lineto
0.1627 0.24121 lineto
0.17262 0.24377 lineto
0.18254 0.2471 lineto
0.19246 0.25133 lineto
0.20238 0.25657 lineto
0.22222 0.27046 lineto
0.24206 0.28918 lineto
0.2619 0.31258 lineto
0.30159 0.36861 lineto
0.32143 0.39677 lineto
0.33135 0.40957 lineto
0.34127 0.42094 lineto
0.35119 0.43045 lineto
0.35615 0.43438 lineto
0.36111 0.43769 lineto
0.36607 0.44034 lineto
0.37103 0.44228 lineto
0.37351 0.44298 lineto
0.37475 0.44325 lineto
0.37599 0.44348 lineto
0.37723 0.44366 lineto
0.37847 0.44378 lineto
0.37971 0.44386 lineto
0.38095 0.44389 lineto
0.38219 0.44387 lineto
0.38343 0.44379 lineto
0.38467 0.44367 lineto
0.38591 0.44349 lineto
0.38715 0.44326 lineto
0.38839 0.44297 lineto
0.39087 0.44225 lineto
0.39335 0.4413 lineto
0.39583 0.44014 lineto
0.40079 0.43716 lineto
0.40575 0.4333 lineto
0.41071 0.42854 lineto
0.42063 0.41638 lineto
0.44048 0.38201 lineto
0.46032 0.33623 lineto
0.5 0.22693 lineto
0.51984 0.17426 lineto
0.52976 0.15097 lineto
0.53968 0.13059 lineto
0.5496 0.11372 lineto
0.55456 0.10676 lineto
0.55952 0.10085 lineto
0.56448 0.09603 lineto
0.56696 0.09404 lineto
0.56944 0.09234 lineto
0.57192 0.09093 lineto
0.5744 0.0898 lineto
0.57564 0.08935 lineto
0.57688 0.08898 lineto
0.57813 0.08867 lineto
0.57937 0.08844 lineto
0.58061 0.08829 lineto
0.58185 0.0882 lineto
0.58309 0.08819 lineto
0.58433 0.08826 lineto
0.58557 0.0884 lineto
0.58681 0.08861 lineto
0.58805 0.08889 lineto
0.58929 0.08925 lineto
0.59177 0.09019 lineto
0.59425 0.09141 lineto
0.59921 0.09472 lineto
0.60417 0.09914 lineto
0.60913 0.10464 lineto
0.61905 0.11868 lineto
0.63889 0.15701 lineto
0.65873 0.2045 lineto
0.67857 0.25468 lineto
0.69841 0.30071 lineto
0.70833 0.32017 lineto
0.71825 0.33634 lineto
0.72321 0.34302 lineto
0.72817 0.34868 lineto
0.73313 0.35328 lineto
0.73562 0.35517 lineto
0.7381 0.35678 lineto
0.74058 0.35811 lineto
0.74306 0.35916 lineto
0.7443 0.35957 lineto
0.74554 0.35992 lineto
0.74678 0.36019 lineto
0.74802 0.36039 lineto
0.74926 0.36052 lineto
0.7505 0.36058 lineto
0.75174 0.36056 lineto
0.75298 0.36048 lineto
0.75422 0.36032 lineto
0.75546 0.36009 lineto
0.75794 0.35942 lineto
0.75918 0.35898 lineto
0.76042 0.35847 lineto
0.7629 0.35723 lineto
0.76786 0.35394 lineto
0.77282 0.34958 lineto
0.77778 0.34419 lineto
0.79762 0.3136 lineto
0.81746 0.27236 lineto
0.8373 0.22671 lineto
0.85714 0.18346 lineto
0.87698 0.14901 lineto
0.88194 0.1424 lineto
0.8869 0.13672 lineto
0.89187 0.13202 lineto
0.89683 0.12835 lineto
0.89931 0.12691 lineto
0.90179 0.12574 lineto
0.90427 0.12483 lineto
0.90551 0.12448 lineto
0.90675 0.12419 lineto
0.90799 0.12398 lineto
0.90923 0.12383 lineto
0.91047 0.12375 lineto
0.91171 0.12374 lineto
0.91295 0.12379 lineto
0.91419 0.12392 lineto
0.91543 0.12411 lineto
0.91667 0.12437 lineto
0.91915 0.12509 lineto
0.92163 0.12607 lineto
0.92659 0.12883 lineto
0.93155 0.13261 lineto
0.93651 0.13737 lineto
0.94643 0.14962 lineto
0.95635 0.16508 lineto
0.97619 0.20302 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23545 lineto
0.06845 0.23545 lineto
0.07093 0.23545 lineto
0.07341 0.23545 lineto
0.07589 0.23545 lineto
0.07837 0.23546 lineto
0.08085 0.23546 lineto
0.08333 0.23547 lineto
0.08581 0.23548 lineto
0.08829 0.23549 lineto
0.09325 0.23551 lineto
0.09573 0.23553 lineto
0.09821 0.23555 lineto
0.10317 0.23561 lineto
0.10813 0.23568 lineto
0.1131 0.23577 lineto
0.11806 0.2359 lineto
0.12302 0.23606 lineto
0.12798 0.23627 lineto
0.13294 0.23653 lineto
0.1379 0.23684 lineto
0.14286 0.23724 lineto
0.15278 0.23828 lineto
0.1627 0.23974 lineto
0.17262 0.24175 lineto
0.18254 0.2444 lineto
0.19246 0.24782 lineto
0.20238 0.25212 lineto
0.22222 0.26378 lineto
0.24206 0.27999 lineto
0.2619 0.30087 lineto
0.30159 0.3536 lineto
0.32143 0.38192 lineto
0.34127 0.40794 lineto
0.35119 0.41909 lineto
0.36111 0.42843 lineto
0.37103 0.43558 lineto
0.37599 0.43821 lineto
0.37847 0.43927 lineto
0.38095 0.44015 lineto
0.38343 0.44085 lineto
0.38591 0.44137 lineto
0.38715 0.44156 lineto
0.38839 0.4417 lineto
0.38963 0.44179 lineto
0.39087 0.44183 lineto
0.39211 0.44182 lineto
0.39335 0.44176 lineto
0.39459 0.44165 lineto
0.39583 0.4415 lineto
0.39707 0.44129 lineto
0.39831 0.44102 lineto
0.40079 0.44035 lineto
0.40327 0.43946 lineto
0.40575 0.43836 lineto
0.41071 0.43551 lineto
0.41567 0.43181 lineto
0.42063 0.42723 lineto
0.43056 0.41549 lineto
0.44048 0.40039 lineto
0.46032 0.36102 lineto
0.5 0.2576 lineto
0.51984 0.20318 lineto
0.53968 0.15445 lineto
0.5496 0.13393 lineto
0.55952 0.11677 lineto
0.56448 0.10962 lineto
0.56944 0.10348 lineto
0.5744 0.09841 lineto
0.57937 0.09443 lineto
0.58185 0.09287 lineto
0.58433 0.09159 lineto
0.58681 0.09059 lineto
0.58805 0.0902 lineto
0.58929 0.08989 lineto
0.59053 0.08964 lineto
0.59177 0.08947 lineto
0.59301 0.08937 lineto
0.59425 0.08934 lineto
0.59549 0.08939 lineto
0.59673 0.08951 lineto
0.59797 0.0897 lineto
0.59921 0.08996 lineto
0.60045 0.0903 lineto
0.60169 0.0907 lineto
0.60417 0.09173 lineto
0.60913 0.09464 lineto
0.61409 0.09865 lineto
0.61905 0.10374 lineto
0.62897 0.11695 lineto
0.63889 0.13382 lineto
0.65873 0.17615 lineto
0.69841 0.2738 lineto
0.71825 0.31592 lineto
0.72817 0.33264 lineto
0.73313 0.33966 lineto
0.7381 0.34569 lineto
0.74306 0.35069 lineto
0.74802 0.35462 lineto
0.7505 0.35618 lineto
0.75298 0.35746 lineto
0.75546 0.35845 lineto
0.7567 0.35885 lineto
0.75794 0.35917 lineto
0.75918 0.35942 lineto
0.76042 0.3596 lineto
0.76166 0.35971 lineto
0.7629 0.35975 lineto
0.76414 0.35971 lineto
0.76538 0.35961 lineto
0.76662 0.35944 lineto
0.76786 0.35919 lineto
0.77034 0.35849 lineto
0.77282 0.35751 lineto
0.7753 0.35626 lineto
0.77778 0.35473 lineto
0.78274 0.35088 lineto
0.7877 0.34599 lineto
0.79762 0.33332 lineto
0.81746 0.2983 lineto
0.85714 0.20984 lineto
0.87698 0.16956 lineto
0.8869 0.15314 lineto
0.89683 0.14003 lineto
0.90179 0.13488 lineto
0.90675 0.13071 lineto
0.91171 0.12758 lineto
0.91419 0.12641 lineto
0.91667 0.1255 lineto
0.91791 0.12515 lineto
0.91915 0.12486 lineto
0.92039 0.12464 lineto
0.92163 0.12449 lineto
0.92287 0.12441 lineto
0.92411 0.12439 lineto
0.92535 0.12444 lineto
0.92659 0.12456 lineto
0.92783 0.12474 lineto
0.92907 0.12499 lineto
0.93155 0.12569 lineto
0.93403 0.12666 lineto
0.93651 0.12788 lineto
0.94147 0.13111 lineto
0.94643 0.13532 lineto
0.95635 0.14654 lineto
0.97619 0.17837 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06845 0.23544 lineto
0.07093 0.23545 lineto
0.07341 0.23545 lineto
0.07589 0.23545 lineto
0.07837 0.23545 lineto
0.08085 0.23546 lineto
0.08333 0.23546 lineto
0.08581 0.23546 lineto
0.08829 0.23547 lineto
0.09325 0.23549 lineto
0.09573 0.2355 lineto
0.09821 0.23551 lineto
0.10317 0.23555 lineto
0.10813 0.2356 lineto
0.1131 0.23567 lineto
0.11806 0.23575 lineto
0.12302 0.23587 lineto
0.12798 0.23602 lineto
0.13294 0.2362 lineto
0.1379 0.23644 lineto
0.14286 0.23673 lineto
0.14782 0.23708 lineto
0.15278 0.23751 lineto
0.1627 0.23863 lineto
0.17262 0.24019 lineto
0.18254 0.24228 lineto
0.19246 0.24502 lineto
0.20238 0.24852 lineto
0.2123 0.25289 lineto
0.22222 0.25822 lineto
0.24206 0.2721 lineto
0.2619 0.29051 lineto
0.30159 0.33935 lineto
0.34127 0.39411 lineto
0.35119 0.40639 lineto
0.36111 0.41732 lineto
0.37103 0.4265 lineto
0.37599 0.43032 lineto
0.38095 0.43355 lineto
0.38591 0.43616 lineto
0.38839 0.43722 lineto
0.39087 0.4381 lineto
0.39335 0.43881 lineto
0.39459 0.4391 lineto
0.39583 0.43934 lineto
0.39707 0.43954 lineto
0.39831 0.43969 lineto
0.39955 0.43979 lineto
0.40079 0.43984 lineto
0.40203 0.43985 lineto
0.40327 0.43981 lineto
0.40451 0.43971 lineto
0.40575 0.43957 lineto
0.40699 0.43938 lineto
0.40823 0.43914 lineto
0.41071 0.43851 lineto
0.41319 0.43767 lineto
0.41567 0.43663 lineto
0.42063 0.43391 lineto
0.4256 0.43035 lineto
0.43056 0.42594 lineto
0.44048 0.41459 lineto
0.4504 0.39995 lineto
0.46032 0.38219 lineto
0.5 0.28731 lineto
0.53968 0.1811 lineto
0.55952 0.13718 lineto
0.56944 0.11977 lineto
0.5744 0.11244 lineto
0.57937 0.1061 lineto
0.58433 0.10078 lineto
0.58929 0.09654 lineto
0.59177 0.09483 lineto
0.59425 0.0934 lineto
0.59673 0.09225 lineto
0.59921 0.09138 lineto
0.60045 0.09106 lineto
0.60169 0.0908 lineto
0.60293 0.09062 lineto
0.60417 0.0905 lineto
0.60541 0.09046 lineto
0.60665 0.09049 lineto
0.60789 0.09059 lineto
0.60913 0.09076 lineto
0.61037 0.09101 lineto
0.61161 0.09132 lineto
0.61409 0.09216 lineto
0.61657 0.09328 lineto
0.61905 0.09468 lineto
0.62401 0.0983 lineto
0.62897 0.10299 lineto
0.63889 0.11541 lineto
0.64881 0.13152 lineto
0.65873 0.15077 lineto
0.69841 0.24516 lineto
0.71825 0.29154 lineto
0.72817 0.3117 lineto
0.7381 0.32893 lineto
0.74802 0.34262 lineto
0.75298 0.348 lineto
0.75794 0.35234 lineto
0.76042 0.35411 lineto
0.7629 0.35561 lineto
0.76538 0.35683 lineto
0.76786 0.35777 lineto
0.7691 0.35814 lineto
0.77034 0.35844 lineto
0.77158 0.35867 lineto
0.77282 0.35883 lineto
0.77406 0.35891 lineto
0.7753 0.35893 lineto
0.77654 0.35888 lineto
0.77778 0.35876 lineto
0.77902 0.35856 lineto
0.78026 0.3583 lineto
0.7815 0.35797 lineto
0.78274 0.35757 lineto
0.7877 0.35529 lineto
0.79018 0.35374 lineto
0.79266 0.35193 lineto
0.79762 0.34754 lineto
0.80754 0.33581 lineto
0.81746 0.32057 lineto
0.85714 0.23756 lineto
0.87698 0.19387 lineto
0.8869 0.17435 lineto
0.89683 0.15735 lineto
0.90675 0.14349 lineto
0.91171 0.1379 lineto
0.91667 0.13327 lineto
0.92163 0.12964 lineto
0.92411 0.12822 lineto
0.92659 0.12705 lineto
0.92907 0.12614 lineto
0.93031 0.12579 lineto
0.93155 0.12551 lineto
0.93279 0.12529 lineto
0.93403 0.12513 lineto
0.93527 0.12505 lineto
0.93651 0.12503 lineto
0.97619 0.15741 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06845 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07589 0.23545 lineto
0.07837 0.23545 lineto
0.08085 0.23545 lineto
0.08333 0.23545 lineto
0.08581 0.23546 lineto
0.08829 0.23546 lineto
0.09325 0.23547 lineto
0.09573 0.23548 lineto
0.09821 0.23549 lineto
0.10317 0.23551 lineto
0.10813 0.23555 lineto
0.1131 0.23559 lineto
0.11806 0.23565 lineto
0.12302 0.23573 lineto
0.12798 0.23584 lineto
0.13294 0.23598 lineto
0.1379 0.23615 lineto
0.14286 0.23636 lineto
0.14782 0.23662 lineto
0.15278 0.23694 lineto
0.1627 0.23779 lineto
0.17262 0.23899 lineto
0.18254 0.24063 lineto
0.19246 0.2428 lineto
0.20238 0.24563 lineto
0.2123 0.2492 lineto
0.22222 0.25362 lineto
0.24206 0.26539 lineto
0.2619 0.28144 lineto
0.30159 0.32604 lineto
0.34127 0.37992 lineto
0.36111 0.4049 lineto
0.37103 0.41562 lineto
0.38095 0.42465 lineto
0.38591 0.42841 lineto
0.39087 0.43161 lineto
0.39583 0.4342 lineto
0.40079 0.43614 lineto
0.40327 0.43685 lineto
0.40451 0.43715 lineto
0.40575 0.43739 lineto
0.40699 0.4376 lineto
0.40823 0.43775 lineto
0.40947 0.43787 lineto
0.41071 0.43793 lineto
0.41195 0.43795 lineto
0.41319 0.43792 lineto
0.41443 0.43784 lineto
0.41567 0.43772 lineto
0.41815 0.43732 lineto
0.41939 0.43705 lineto
0.42063 0.43673 lineto
0.4256 0.43495 lineto
0.42808 0.43375 lineto
0.43056 0.43235 lineto
0.44048 0.42468 lineto
0.44544 0.4196 lineto
0.4504 0.4137 lineto
0.46032 0.39949 lineto
0.48016 0.36214 lineto
0.5 0.31521 lineto
0.53968 0.20946 lineto
0.55952 0.16107 lineto
0.56944 0.14034 lineto
0.57937 0.12271 lineto
0.58929 0.10868 lineto
0.59425 0.10315 lineto
0.59921 0.09866 lineto
0.60169 0.09682 lineto
0.60417 0.09525 lineto
0.60665 0.09395 lineto
0.60913 0.09293 lineto
0.61037 0.09252 lineto
0.61161 0.09219 lineto
0.61285 0.09192 lineto
0.61409 0.09173 lineto
0.61533 0.0916 lineto
0.61657 0.09155 lineto
0.61781 0.09156 lineto
0.61905 0.09165 lineto
0.62029 0.0918 lineto
0.62153 0.09203 lineto
0.62277 0.09232 lineto
0.62401 0.09269 lineto
0.62897 0.09484 lineto
0.63145 0.09633 lineto
0.63393 0.09808 lineto
0.63889 0.10239 lineto
0.64881 0.11404 lineto
0.65873 0.1294 lineto
0.69841 0.21623 lineto
0.71825 0.26452 lineto
0.7381 0.30753 lineto
0.74802 0.3252 lineto
0.75794 0.3395 lineto
0.7629 0.34524 lineto
0.76786 0.34996 lineto
0.77282 0.35363 lineto
0.7753 0.35507 lineto
0.77778 0.35623 lineto
0.78026 0.35712 lineto
0.7815 0.35746 lineto
0.78274 0.35773 lineto
0.78398 0.35794 lineto
0.78522 0.35807 lineto
0.78646 0.35814 lineto
0.7877 0.35813 lineto
0.78894 0.35806 lineto
0.79018 0.35792 lineto
0.79142 0.3577 lineto
0.79266 0.35742 lineto
0.79514 0.35666 lineto
0.79762 0.35563 lineto
0.80258 0.35275 lineto
0.80754 0.34884 lineto
0.81746 0.33804 lineto
0.82738 0.32366 lineto
0.8373 0.30624 lineto
0.85714 0.26501 lineto
0.87698 0.22046 lineto
0.89683 0.17914 lineto
0.90675 0.16162 lineto
0.91667 0.14706 lineto
0.92659 0.136 lineto
0.93155 0.1319 lineto
0.93403 0.13023 lineto
0.93651 0.12882 lineto
0.93899 0.12766 lineto
0.94147 0.12676 lineto
0.94271 0.12641 lineto
0.94395 0.12613 lineto
0.94519 0.12591 lineto
0.94643 0.12576 lineto
0.94767 0.12567 lineto
0.94891 0.12565 lineto
0.95015 0.12569 lineto
0.95139 0.1258 lineto
0.95263 0.12598 lineto
0.95387 0.12622 lineto
0.95635 0.1269 lineto
0.95883 0.12784 lineto
0.96131 0.12903 lineto
0.96627 0.13218 lineto
0.97123 0.13629 lineto
0.97619 0.14134 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06845 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23545 lineto
0.08085 0.23545 lineto
0.08333 0.23545 lineto
0.08581 0.23545 lineto
0.08829 0.23545 lineto
0.09325 0.23546 lineto
0.09573 0.23547 lineto
0.09821 0.23547 lineto
0.10317 0.23549 lineto
0.10813 0.23551 lineto
0.1131 0.23554 lineto
0.11806 0.23558 lineto
0.12302 0.23564 lineto
0.12798 0.23572 lineto
0.13294 0.23581 lineto
0.1379 0.23594 lineto
0.14286 0.23609 lineto
0.14782 0.23628 lineto
0.15278 0.23652 lineto
0.1627 0.23716 lineto
0.16766 0.23758 lineto
0.17262 0.23808 lineto
0.18254 0.23935 lineto
0.19246 0.24107 lineto
0.20238 0.24332 lineto
0.2123 0.24622 lineto
0.22222 0.24986 lineto
0.24206 0.25974 lineto
0.2619 0.27359 lineto
0.28175 0.29169 lineto
0.30159 0.3138 lineto
0.34127 0.36575 lineto
0.36111 0.39167 lineto
0.38095 0.414 lineto
0.39087 0.42288 lineto
0.39583 0.42659 lineto
0.40079 0.42974 lineto
0.40575 0.43231 lineto
0.41071 0.43425 lineto
0.41319 0.43497 lineto
0.41443 0.43526 lineto
0.41567 0.43552 lineto
0.41691 0.43573 lineto
0.41815 0.43589 lineto
0.41939 0.43601 lineto
0.42063 0.43609 lineto
0.42188 0.43612 lineto
0.42312 0.4361 lineto
0.42436 0.43604 lineto
0.4256 0.43593 lineto
0.42684 0.43577 lineto
0.42808 0.43557 lineto
0.43056 0.43501 lineto
0.43304 0.43426 lineto
0.43552 0.43332 lineto
0.44048 0.43083 lineto
0.44544 0.42754 lineto
0.4504 0.42344 lineto
0.46032 0.41281 lineto
0.47024 0.399 lineto
0.48016 0.38218 lineto
0.5 0.34061 lineto
0.53968 0.23848 lineto
0.55952 0.18743 lineto
0.57937 0.14342 lineto
0.58929 0.12559 lineto
0.59921 0.11124 lineto
0.60417 0.1055 lineto
0.60913 0.10078 lineto
0.61409 0.09711 lineto
0.61657 0.09567 lineto
0.61905 0.09451 lineto
0.62153 0.09362 lineto
0.62277 0.09328 lineto
0.62401 0.09301 lineto
0.62525 0.0928 lineto
0.62649 0.09267 lineto
0.62773 0.0926 lineto
0.62897 0.0926 lineto
0.63021 0.09268 lineto
0.63145 0.09282 lineto
0.63269 0.09303 lineto
0.63393 0.09331 lineto
0.63641 0.09407 lineto
0.63889 0.09511 lineto
0.64385 0.09799 lineto
0.64881 0.10192 lineto
0.65873 0.11283 lineto
0.66865 0.12746 lineto
0.67857 0.14533 lineto
0.69841 0.18837 lineto
0.71825 0.23627 lineto
0.7381 0.28269 lineto
0.75794 0.32147 lineto
0.76786 0.33633 lineto
0.77282 0.3424 lineto
0.77778 0.34748 lineto
0.78274 0.35154 lineto
0.7877 0.35455 lineto
0.79018 0.35565 lineto
0.79142 0.3561 lineto
0.79266 0.35649 lineto
0.7939 0.3568 lineto
0.79514 0.35705 lineto
0.79638 0.35722 lineto
0.79762 0.35733 lineto
0.79886 0.35737 lineto
0.8001 0.35735 lineto
0.80134 0.35725 lineto
0.80258 0.35709 lineto
0.80382 0.35685 lineto
0.80506 0.35655 lineto
0.80754 0.35575 lineto
0.81002 0.35468 lineto
0.8125 0.35335 lineto
0.81746 0.3499 lineto
0.82242 0.34545 lineto
0.82738 0.34002 lineto
0.8373 0.3265 lineto
0.85714 0.29068 lineto
0.89683 0.20406 lineto
0.91667 0.16593 lineto
0.92659 0.15073 lineto
0.93155 0.14436 lineto
0.93651 0.13888 lineto
0.94147 0.13434 lineto
0.94643 0.13078 lineto
0.94891 0.12938 lineto
0.95139 0.12824 lineto
0.95387 0.12735 lineto
0.95511 0.12701 lineto
0.95635 0.12673 lineto
0.95759 0.12651 lineto
0.95883 0.12636 lineto
0.96007 0.12628 lineto
0.96131 0.12626 lineto
0.96255 0.1263 lineto
0.96379 0.12641 lineto
0.96503 0.12659 lineto
0.96627 0.12683 lineto
0.97619 0.13105 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06845 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.08085 0.23544 lineto
0.08333 0.23545 lineto
0.08581 0.23545 lineto
0.08829 0.23545 lineto
0.09325 0.23545 lineto
0.09573 0.23546 lineto
0.09821 0.23546 lineto
0.10069 0.23547 lineto
0.10317 0.23547 lineto
0.10813 0.23549 lineto
0.1131 0.23551 lineto
0.11806 0.23554 lineto
0.12302 0.23558 lineto
0.12798 0.23563 lineto
0.13294 0.2357 lineto
0.1379 0.23579 lineto
0.14286 0.2359 lineto
0.14782 0.23604 lineto
0.15278 0.23621 lineto
0.1627 0.23669 lineto
0.16766 0.23701 lineto
0.17262 0.23739 lineto
0.18254 0.23837 lineto
0.19246 0.23971 lineto
0.20238 0.2415 lineto
0.2123 0.24383 lineto
0.22222 0.2468 lineto
0.24206 0.25503 lineto
0.25198 0.26046 lineto
0.2619 0.26686 lineto
0.30159 0.3027 lineto
0.34127 0.35193 lineto
0.36111 0.37808 lineto
0.38095 0.40211 lineto
0.40079 0.42118 lineto
0.41071 0.42795 lineto
0.41567 0.43049 lineto
0.41815 0.43154 lineto
0.42063 0.43242 lineto
0.42312 0.43315 lineto
0.4256 0.43371 lineto
0.42684 0.43392 lineto
0.42808 0.43409 lineto
0.42932 0.43422 lineto
0.43056 0.43431 lineto
0.4318 0.43435 lineto
0.43304 0.43434 lineto
0.43428 0.43429 lineto
0.43552 0.43419 lineto
0.43676 0.43405 lineto
0.438 0.43386 lineto
0.44048 0.43335 lineto
0.44296 0.43264 lineto
0.44544 0.43174 lineto
0.4504 0.42936 lineto
0.45536 0.42619 lineto
0.46032 0.42223 lineto
0.47024 0.41193 lineto
0.48016 0.3985 lineto
0.5 0.363 lineto
0.53968 0.26719 lineto
0.55952 0.21522 lineto
0.57937 0.16727 lineto
0.59921 0.12841 lineto
0.60913 0.11376 lineto
0.61409 0.10784 lineto
0.61905 0.1029 lineto
0.62401 0.09899 lineto
0.62897 0.09612 lineto
0.63145 0.09509 lineto
0.63269 0.09468 lineto
0.63393 0.09433 lineto
0.63517 0.09405 lineto
0.63641 0.09384 lineto
0.63765 0.0937 lineto
0.63889 0.09362 lineto
0.64013 0.09362 lineto
0.64137 0.09368 lineto
0.64261 0.09381 lineto
0.64385 0.094 lineto
0.64509 0.09427 lineto
0.64633 0.0946 lineto
0.64881 0.09547 lineto
0.65129 0.0966 lineto
0.65377 0.098 lineto
0.65873 0.10158 lineto
0.66369 0.10618 lineto
0.66865 0.11176 lineto
0.67857 0.12569 lineto
0.69841 0.16281 lineto
0.7381 0.25573 lineto
0.75794 0.29931 lineto
0.76786 0.31775 lineto
0.77778 0.33313 lineto
0.7877 0.34492 lineto
0.79266 0.34935 lineto
0.79514 0.35118 lineto
0.79762 0.35275 lineto
0.8001 0.35406 lineto
0.80258 0.3551 lineto
0.80382 0.35552 lineto
0.80506 0.35587 lineto
0.8063 0.35616 lineto
0.80754 0.35637 lineto
0.80878 0.35652 lineto
0.81002 0.35661 lineto
0.81126 0.35662 lineto
0.8125 0.35657 lineto
0.81374 0.35645 lineto
0.81498 0.35626 lineto
0.81746 0.35569 lineto
0.8187 0.3553 lineto
0.81994 0.35485 lineto
0.82242 0.35374 lineto
0.82738 0.35076 lineto
0.83234 0.34675 lineto
0.8373 0.34178 lineto
0.84722 0.3291 lineto
0.85714 0.31321 lineto
0.89683 0.23062 lineto
0.91667 0.18867 lineto
0.92659 0.17027 lineto
0.93651 0.15449 lineto
0.94643 0.14189 lineto
0.95139 0.13694 lineto
0.95635 0.13294 lineto
0.95883 0.1313 lineto
0.96131 0.12992 lineto
0.96379 0.12879 lineto
0.96627 0.12792 lineto
0.96751 0.12758 lineto
0.96875 0.12731 lineto
0.96999 0.12709 lineto
0.97123 0.12695 lineto
0.97247 0.12687 lineto
0.97371 0.12685 lineto
0.97619 0.12701 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.08085 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23545 lineto
0.09325 0.23545 lineto
0.09573 0.23545 lineto
0.09821 0.23545 lineto
0.10069 0.23546 lineto
0.10317 0.23546 lineto
0.10813 0.23547 lineto
0.1131 0.23549 lineto
0.11806 0.23551 lineto
0.12302 0.23553 lineto
0.12798 0.23557 lineto
0.13294 0.23562 lineto
0.1379 0.23568 lineto
0.14286 0.23576 lineto
0.14782 0.23586 lineto
0.15278 0.23599 lineto
0.1627 0.23635 lineto
0.16766 0.23658 lineto
0.17262 0.23687 lineto
0.18254 0.23762 lineto
0.19246 0.23867 lineto
0.20238 0.24008 lineto
0.2123 0.24194 lineto
0.22222 0.24434 lineto
0.24206 0.25113 lineto
0.25198 0.25569 lineto
0.2619 0.26115 lineto
0.28175 0.27494 lineto
0.30159 0.29275 lineto
0.34127 0.33871 lineto
0.38095 0.38943 lineto
0.40079 0.41095 lineto
0.41071 0.41954 lineto
0.41567 0.42314 lineto
0.42063 0.42622 lineto
0.4256 0.42875 lineto
0.42808 0.42978 lineto
0.43056 0.43067 lineto
0.43304 0.4314 lineto
0.43552 0.43196 lineto
0.43676 0.43218 lineto
0.438 0.43236 lineto
0.43924 0.43249 lineto
0.44048 0.43259 lineto
0.44172 0.43264 lineto
0.44296 0.43264 lineto
0.4442 0.4326 lineto
0.44544 0.43252 lineto
0.44668 0.43239 lineto
0.44792 0.43222 lineto
0.44916 0.432 lineto
0.4504 0.43173 lineto
0.45536 0.43021 lineto
0.45784 0.42916 lineto
0.46032 0.42792 lineto
0.47024 0.42104 lineto
0.4752 0.41643 lineto
0.48016 0.41105 lineto
0.5 0.38201 lineto
0.51984 0.34229 lineto
0.53968 0.29476 lineto
0.57937 0.19329 lineto
0.59921 0.14932 lineto
0.60913 0.13116 lineto
0.61905 0.11625 lineto
0.62897 0.10501 lineto
0.63393 0.10087 lineto
0.63641 0.09919 lineto
0.63889 0.09776 lineto
0.64137 0.0966 lineto
0.64385 0.0957 lineto
0.64509 0.09535 lineto
0.64633 0.09507 lineto
0.64757 0.09485 lineto
0.64881 0.0947 lineto
0.65005 0.09462 lineto
0.65129 0.0946 lineto
0.65253 0.09465 lineto
0.65377 0.09477 lineto
0.65501 0.09496 lineto
0.65625 0.09521 lineto
0.65873 0.09591 lineto
0.66121 0.09688 lineto
0.66369 0.09811 lineto
0.66865 0.10135 lineto
0.67361 0.10561 lineto
0.67857 0.11084 lineto
0.69841 0.14062 lineto
0.71825 0.18142 lineto
0.7381 0.22797 lineto
0.75794 0.2742 lineto
0.77778 0.31405 lineto
0.7877 0.3299 lineto
0.79266 0.33656 lineto
0.79762 0.3423 lineto
0.80258 0.34707 lineto
0.80754 0.35084 lineto
0.81002 0.35234 lineto
0.8125 0.35358 lineto
0.81498 0.35456 lineto
0.81746 0.35527 lineto
0.8187 0.35552 lineto
0.81994 0.35571 lineto
0.82118 0.35583 lineto
0.82242 0.35589 lineto
0.82366 0.35588 lineto
0.8249 0.3558 lineto
0.82614 0.35566 lineto
0.82738 0.35545 lineto
0.82862 0.35517 lineto
0.82986 0.35483 lineto
0.83234 0.35395 lineto
0.83482 0.3528 lineto
0.8373 0.3514 lineto
0.84226 0.34784 lineto
0.84722 0.3433 lineto
0.85714 0.33147 lineto
0.87698 0.29849 lineto
0.89683 0.25731 lineto
0.91667 0.21393 lineto
0.93651 0.17462 lineto
0.94643 0.15831 lineto
0.95635 0.14503 lineto
0.96131 0.13968 lineto
0.96627 0.13525 lineto
0.97123 0.13179 lineto
0.97619 0.12932 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.08085 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23545 lineto
0.09325 0.23545 lineto
0.09573 0.23545 lineto
0.09821 0.23545 lineto
0.10069 0.23545 lineto
0.10317 0.23545 lineto
0.10813 0.23546 lineto
0.11062 0.23547 lineto
0.1131 0.23547 lineto
0.11806 0.23548 lineto
0.12302 0.2355 lineto
0.12798 0.23553 lineto
0.13294 0.23556 lineto
0.1379 0.23561 lineto
0.14286 0.23566 lineto
0.14782 0.23574 lineto
0.15278 0.23583 lineto
0.1627 0.23609 lineto
0.16766 0.23627 lineto
0.17262 0.23649 lineto
0.18254 0.23706 lineto
0.19246 0.23786 lineto
0.20238 0.23896 lineto
0.2123 0.24044 lineto
0.22222 0.24237 lineto
0.23214 0.24483 lineto
0.24206 0.24793 lineto
0.2619 0.25634 lineto
0.28175 0.26821 lineto
0.30159 0.28393 lineto
0.34127 0.32627 lineto
0.38095 0.37637 lineto
0.40079 0.39953 lineto
0.41071 0.40951 lineto
0.42063 0.41797 lineto
0.4256 0.42152 lineto
0.43056 0.42456 lineto
0.43552 0.42706 lineto
0.44048 0.42898 lineto
0.44296 0.42971 lineto
0.44544 0.43027 lineto
0.44668 0.4305 lineto
0.44792 0.43068 lineto
0.44916 0.43082 lineto
0.4504 0.43092 lineto
0.45164 0.43098 lineto
0.45288 0.431 lineto
0.45412 0.43097 lineto
0.45536 0.4309 lineto
0.4566 0.43078 lineto
0.45784 0.43062 lineto
0.46032 0.43017 lineto
0.4628 0.42953 lineto
0.46528 0.42871 lineto
0.47024 0.42652 lineto
0.4752 0.42358 lineto
0.48016 0.41987 lineto
0.49008 0.41017 lineto
0.5 0.39747 lineto
0.51984 0.36363 lineto
0.53968 0.32045 lineto
0.57937 0.22051 lineto
0.59921 0.17307 lineto
0.60913 0.15214 lineto
0.61905 0.13386 lineto
0.62897 0.11871 lineto
0.63393 0.11244 lineto
0.63889 0.10712 lineto
0.64385 0.10277 lineto
0.64633 0.10096 lineto
0.64881 0.09942 lineto
0.65129 0.09813 lineto
0.65377 0.0971 lineto
0.65501 0.09668 lineto
0.65625 0.09633 lineto
0.65749 0.09604 lineto
0.65873 0.09582 lineto
0.65997 0.09567 lineto
0.66121 0.09558 lineto
0.66245 0.09556 lineto
0.66369 0.0956 lineto
0.66493 0.09571 lineto
0.66617 0.09589 lineto
0.66741 0.09613 lineto
0.66865 0.09644 lineto
0.67113 0.09725 lineto
0.67361 0.09832 lineto
0.67857 0.10123 lineto
0.68353 0.10515 lineto
0.68849 0.11004 lineto
0.69841 0.1226 lineto
0.71825 0.15723 lineto
0.7381 0.20071 lineto
0.75794 0.24742 lineto
0.77778 0.29131 lineto
0.7877 0.31037 lineto
0.79762 0.32665 lineto
0.80754 0.33961 lineto
0.8125 0.34471 lineto
0.81746 0.34884 lineto
0.81994 0.35052 lineto
0.82242 0.35195 lineto
0.8249 0.35312 lineto
0.82738 0.35403 lineto
0.82862 0.35439 lineto
0.82986 0.35468 lineto
0.8311 0.3549 lineto
0.83234 0.35506 lineto
0.83358 0.35516 lineto
0.83482 0.35518 lineto
0.83606 0.35514 lineto
0.8373 0.35504 lineto
0.83854 0.35487 lineto
0.83978 0.35463 lineto
0.84102 0.35433 lineto
0.84226 0.35397 lineto
0.84722 0.35186 lineto
0.8497 0.35042 lineto
0.85218 0.34873 lineto
0.85714 0.34462 lineto
0.86706 0.33362 lineto
0.87698 0.31926 lineto
0.89683 0.28269 lineto
0.93651 0.19806 lineto
0.97619 0.13772 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.08085 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23544 lineto
0.09325 0.23544 lineto
0.09573 0.23545 lineto
0.09821 0.23545 lineto
0.10069 0.23545 lineto
0.10317 0.23545 lineto
0.10813 0.23545 lineto
0.11062 0.23546 lineto
0.1131 0.23546 lineto
0.11806 0.23547 lineto
0.12302 0.23548 lineto
0.12798 0.2355 lineto
0.13294 0.23552 lineto
0.1379 0.23556 lineto
0.14286 0.2356 lineto
0.14782 0.23565 lineto
0.15278 0.23572 lineto
0.1627 0.23591 lineto
0.16766 0.23604 lineto
0.17262 0.2362 lineto
0.17758 0.2364 lineto
0.18254 0.23663 lineto
0.19246 0.23725 lineto
0.20238 0.2381 lineto
0.2123 0.23927 lineto
0.22222 0.2408 lineto
0.23214 0.24279 lineto
0.24206 0.24532 lineto
0.25198 0.24847 lineto
0.2619 0.25233 lineto
0.28175 0.26246 lineto
0.30159 0.27619 lineto
0.34127 0.31472 lineto
0.38095 0.36329 lineto
0.40079 0.38735 lineto
0.42063 0.40813 lineto
0.43056 0.41646 lineto
0.44048 0.42296 lineto
0.44544 0.42544 lineto
0.44792 0.42646 lineto
0.4504 0.42734 lineto
0.45288 0.42807 lineto
0.45536 0.42865 lineto
0.4566 0.42887 lineto
0.45784 0.42906 lineto
0.45908 0.42921 lineto
0.46032 0.42932 lineto
0.46156 0.42938 lineto
0.4628 0.42941 lineto
0.46404 0.42939 lineto
0.46528 0.42933 lineto
0.46652 0.42922 lineto
0.46776 0.42907 lineto
0.47024 0.42865 lineto
0.47272 0.42805 lineto
0.4752 0.42727 lineto
0.48016 0.42516 lineto
0.48512 0.42231 lineto
0.49008 0.41872 lineto
0.5 0.4093 lineto
0.50992 0.39693 lineto
0.51984 0.38172 lineto
0.53968 0.3437 lineto
0.57937 0.24801 lineto
0.59921 0.19872 lineto
0.61905 0.15489 lineto
0.62897 0.13649 lineto
0.63889 0.12112 lineto
0.64385 0.11471 lineto
0.64881 0.10921 lineto
0.65377 0.10466 lineto
0.65873 0.10109 lineto
0.66121 0.09968 lineto
0.66369 0.09853 lineto
0.66617 0.09763 lineto
0.66741 0.09728 lineto
0.66865 0.09699 lineto
0.66989 0.09677 lineto
0.67113 0.09661 lineto
0.67237 0.09652 lineto
0.67361 0.09649 lineto
0.67485 0.09653 lineto
0.67609 0.09663 lineto
0.67733 0.0968 lineto
0.67857 0.09703 lineto
0.67981 0.09733 lineto
0.68105 0.09769 lineto
0.68353 0.0986 lineto
0.68849 0.1012 lineto
0.69345 0.1048 lineto
0.69841 0.10937 lineto
0.70833 0.12127 lineto
0.71825 0.13654 lineto
0.7381 0.17513 lineto
0.77778 0.26609 lineto
0.79762 0.30672 lineto
0.80754 0.3234 lineto
0.81746 0.33688 lineto
0.82242 0.34229 lineto
0.82738 0.34675 lineto
0.83234 0.35022 lineto
0.83482 0.35157 lineto
0.8373 0.35267 lineto
0.83978 0.35351 lineto
0.84102 0.35384 lineto
0.84226 0.3541 lineto
0.8435 0.35429 lineto
0.84474 0.35442 lineto
0.84598 0.35448 lineto
0.84722 0.35448 lineto
0.84846 0.35441 lineto
0.8497 0.35428 lineto
0.85094 0.35409 lineto
0.85218 0.35382 lineto
0.85466 0.35311 lineto
0.85714 0.35214 lineto
0.8621 0.34943 lineto
0.86706 0.34575 lineto
0.87698 0.33556 lineto
0.8869 0.32196 lineto
0.89683 0.30545 lineto
0.93651 0.22343 lineto
0.97619 0.15159 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05729 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.06969 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.08085 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23544 lineto
0.09325 0.23544 lineto
0.09573 0.23544 lineto
0.09821 0.23544 lineto
0.10069 0.23545 lineto
0.10317 0.23545 lineto
0.10813 0.23545 lineto
0.11062 0.23545 lineto
0.1131 0.23545 lineto
0.11806 0.23546 lineto
0.12302 0.23547 lineto
0.12798 0.23548 lineto
0.13294 0.2355 lineto
0.1379 0.23552 lineto
0.14286 0.23555 lineto
0.14782 0.23559 lineto
0.15278 0.23563 lineto
0.15774 0.2357 lineto
0.1627 0.23577 lineto
0.16766 0.23587 lineto
0.17262 0.23599 lineto
0.17758 0.23614 lineto
0.18254 0.23631 lineto
0.19246 0.23678 lineto
0.20238 0.23744 lineto
0.2123 0.23835 lineto
0.22222 0.23957 lineto
0.23214 0.24116 lineto
0.24206 0.24322 lineto
0.25198 0.2458 lineto
0.2619 0.24901 lineto
0.28175 0.25758 lineto
0.30159 0.26947 lineto
0.32143 0.28501 lineto
0.34127 0.30415 lineto
0.38095 0.35046 lineto
0.40079 0.3748 lineto
0.42063 0.39715 lineto
0.44048 0.415 lineto
0.44544 0.41845 lineto
0.4504 0.42142 lineto
0.45536 0.42387 lineto
0.45784 0.42489 lineto
0.46032 0.42576 lineto
0.4628 0.42649 lineto
0.46528 0.42707 lineto
0.46652 0.4273 lineto
0.46776 0.42749 lineto
0.469 0.42765 lineto
0.47024 0.42776 lineto
0.47148 0.42783 lineto
0.47272 0.42786 lineto
0.47396 0.42785 lineto
0.4752 0.4278 lineto
0.47644 0.42771 lineto
0.47768 0.42757 lineto
0.47892 0.4274 lineto
0.48016 0.42717 lineto
0.48512 0.42586 lineto
0.4876 0.42493 lineto
0.49008 0.42383 lineto
0.49504 0.42108 lineto
0.5 0.4176 lineto
0.50992 0.40844 lineto
0.51984 0.39639 lineto
0.53968 0.36409 lineto
0.57937 0.27496 lineto
0.59921 0.22537 lineto
0.61905 0.17849 lineto
0.63889 0.13907 lineto
0.64881 0.1235 lineto
0.65377 0.11695 lineto
0.65873 0.11128 lineto
0.66369 0.10655 lineto
0.66865 0.10277 lineto
0.67113 0.10125 lineto
0.67361 0.09998 lineto
0.67609 0.09896 lineto
0.67857 0.09819 lineto
0.67981 0.09791 lineto
0.68105 0.09768 lineto
0.68229 0.09752 lineto
0.68353 0.09743 lineto
0.68477 0.0974 lineto
0.68601 0.09743 lineto
0.68725 0.09753 lineto
0.68849 0.09769 lineto
0.68973 0.09791 lineto
0.69097 0.0982 lineto
0.69345 0.09897 lineto
0.69593 0.09999 lineto
0.69841 0.10126 lineto
0.70337 0.10455 lineto
0.70833 0.1088 lineto
0.71825 0.12007 lineto
0.72817 0.13472 lineto
0.7381 0.15229 lineto
0.77778 0.2396 lineto
0.79762 0.28357 lineto
0.81746 0.32014 lineto
0.82738 0.33412 lineto
0.83234 0.33981 lineto
0.8373 0.34458 lineto
0.84226 0.34839 lineto
0.84722 0.3512 lineto
0.8497 0.35223 lineto
0.85094 0.35265 lineto
0.85218 0.35301 lineto
0.85342 0.3533 lineto
0.85466 0.35352 lineto
0.8559 0.35368 lineto
0.85714 0.35378 lineto
0.85838 0.35381 lineto
0.85962 0.35378 lineto
0.86086 0.35369 lineto
0.8621 0.35353 lineto
0.86334 0.3533 lineto
0.86458 0.35301 lineto
0.86706 0.35225 lineto
0.86954 0.35123 lineto
0.87202 0.34996 lineto
0.87698 0.34668 lineto
0.88194 0.34245 lineto
0.8869 0.3373 lineto
0.89683 0.32445 lineto
0.91667 0.29037 lineto
0.93651 0.24933 lineto
0.97619 0.17004 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05729 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.06969 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.08085 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23544 lineto
0.09325 0.23544 lineto
0.09573 0.23544 lineto
0.09821 0.23544 lineto
0.10069 0.23544 lineto
0.10317 0.23544 lineto
0.10813 0.23545 lineto
0.11062 0.23545 lineto
0.1131 0.23545 lineto
0.11558 0.23545 lineto
0.11806 0.23545 lineto
0.12302 0.23546 lineto
0.12798 0.23547 lineto
0.13294 0.23548 lineto
0.1379 0.23549 lineto
0.14286 0.23551 lineto
0.14782 0.23554 lineto
0.15278 0.23558 lineto
0.15774 0.23562 lineto
0.1627 0.23568 lineto
0.16766 0.23575 lineto
0.17262 0.23584 lineto
0.17758 0.23594 lineto
0.18254 0.23608 lineto
0.19246 0.23643 lineto
0.19742 0.23666 lineto
0.20238 0.23694 lineto
0.2123 0.23764 lineto
0.22222 0.2386 lineto
0.23214 0.23987 lineto
0.24206 0.24152 lineto
0.25198 0.24363 lineto
0.2619 0.24627 lineto
0.28175 0.25347 lineto
0.30159 0.26368 lineto
0.32143 0.27734 lineto
0.34127 0.29458 lineto
0.38095 0.3381 lineto
0.42063 0.38543 lineto
0.44048 0.40552 lineto
0.4504 0.41359 lineto
0.45536 0.41699 lineto
0.46032 0.41993 lineto
0.46528 0.42235 lineto
0.47024 0.42424 lineto
0.47272 0.42497 lineto
0.4752 0.42555 lineto
0.47768 0.42598 lineto
0.47892 0.42613 lineto
0.48016 0.42625 lineto
0.4814 0.42633 lineto
0.48264 0.42637 lineto
0.48388 0.42637 lineto
0.48512 0.42633 lineto
0.48636 0.42624 lineto
0.4876 0.42612 lineto
0.48884 0.42595 lineto
0.49008 0.42574 lineto
0.49256 0.4252 lineto
0.49504 0.42448 lineto
0.5 0.42253 lineto
0.50496 0.41987 lineto
0.50992 0.4165 lineto
0.51984 0.40759 lineto
0.52976 0.39583 lineto
0.53968 0.38133 lineto
0.57937 0.30063 lineto
0.61905 0.20376 lineto
0.63889 0.16016 lineto
0.64881 0.14158 lineto
0.65873 0.12583 lineto
0.66865 0.11334 lineto
0.67361 0.10843 lineto
0.67857 0.10446 lineto
0.68105 0.10283 lineto
0.68353 0.10145 lineto
0.68601 0.10031 lineto
0.68849 0.09943 lineto
0.68973 0.09908 lineto
0.69097 0.09879 lineto
0.69221 0.09857 lineto
0.69345 0.09841 lineto
0.69469 0.09831 lineto
0.69593 0.09828 lineto
0.69717 0.09831 lineto
0.69841 0.0984 lineto
0.69965 0.09856 lineto
0.70089 0.09878 lineto
0.70213 0.09906 lineto
0.70337 0.0994 lineto
0.70833 0.1014 lineto
0.71081 0.10277 lineto
0.71329 0.10439 lineto
0.71825 0.10833 lineto
0.72817 0.11899 lineto
0.7381 0.13303 lineto
0.75794 0.16946 lineto
0.77778 0.21307 lineto
0.81746 0.29953 lineto
0.82738 0.31689 lineto
0.8373 0.33132 lineto
0.84722 0.34235 lineto
0.85218 0.34648 lineto
0.85466 0.34818 lineto
0.85714 0.34964 lineto
0.85962 0.35084 lineto
0.8621 0.3518 lineto
0.86334 0.35218 lineto
0.86458 0.3525 lineto
0.86582 0.35276 lineto
0.86706 0.35295 lineto
0.8683 0.35308 lineto
0.86954 0.35314 lineto
0.87078 0.35315 lineto
0.87202 0.35308 lineto
0.87326 0.35296 lineto
0.8745 0.35277 lineto
0.87698 0.3522 lineto
0.87822 0.35182 lineto
0.87946 0.35138 lineto
0.88194 0.35031 lineto
0.8869 0.34744 lineto
0.89187 0.3436 lineto
0.89683 0.33885 lineto
0.90675 0.32675 lineto
0.91667 0.3116 lineto
0.93651 0.27438 lineto
0.97619 0.19196 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05729 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.06969 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07465 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.08085 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23544 lineto
0.09325 0.23544 lineto
0.09573 0.23544 lineto
0.09821 0.23544 lineto
0.10069 0.23544 lineto
0.10317 0.23544 lineto
0.10813 0.23544 lineto
0.11062 0.23545 lineto
0.1131 0.23545 lineto
0.11558 0.23545 lineto
0.11806 0.23545 lineto
0.12302 0.23545 lineto
0.12798 0.23546 lineto
0.13294 0.23547 lineto
0.1379 0.23548 lineto
0.14286 0.23549 lineto
0.14782 0.23551 lineto
0.15278 0.23553 lineto
0.15774 0.23557 lineto
0.1627 0.23561 lineto
0.16766 0.23566 lineto
0.17262 0.23572 lineto
0.17758 0.2358 lineto
0.18254 0.2359 lineto
0.19246 0.23617 lineto
0.19742 0.23634 lineto
0.20238 0.23656 lineto
0.2123 0.2371 lineto
0.22222 0.23785 lineto
0.23214 0.23885 lineto
0.24206 0.24018 lineto
0.25198 0.24188 lineto
0.2619 0.24405 lineto
0.27183 0.24674 lineto
0.28175 0.25004 lineto
0.30159 0.25874 lineto
0.32143 0.27064 lineto
0.34127 0.28601 lineto
0.38095 0.32639 lineto
0.42063 0.37333 lineto
0.44048 0.39494 lineto
0.4504 0.40428 lineto
0.46032 0.41223 lineto
0.47024 0.41849 lineto
0.4752 0.42089 lineto
0.47768 0.42189 lineto
0.48016 0.42276 lineto
0.48264 0.42349 lineto
0.48512 0.42407 lineto
0.48636 0.42431 lineto
0.4876 0.42451 lineto
0.48884 0.42467 lineto
0.49008 0.42479 lineto
0.49132 0.42487 lineto
0.49256 0.42492 lineto
0.4938 0.42493 lineto
0.49504 0.42489 lineto
0.49628 0.42482 lineto
0.49752 0.4247 lineto
0.49876 0.42455 lineto
0.5 0.42435 lineto
0.50248 0.42383 lineto
0.50496 0.42315 lineto
0.50992 0.42127 lineto
0.51488 0.41869 lineto
0.51984 0.41542 lineto
0.52976 0.40675 lineto
0.53968 0.39528 lineto
0.55952 0.36438 lineto
0.57937 0.32442 lineto
0.61905 0.22984 lineto
0.63889 0.18357 lineto
0.65873 0.14404 lineto
0.66865 0.12813 lineto
0.67857 0.11538 lineto
0.68353 0.1103 lineto
0.68849 0.10615 lineto
0.69345 0.10293 lineto
0.69593 0.10169 lineto
0.69841 0.10069 lineto
0.70089 0.09994 lineto
0.70213 0.09965 lineto
0.70337 0.09943 lineto
0.70461 0.09927 lineto
0.70585 0.09917 lineto
0.70709 0.09914 lineto
0.70833 0.09917 lineto
0.70957 0.09926 lineto
0.71081 0.09941 lineto
0.71205 0.09962 lineto
0.71329 0.0999 lineto
0.71577 0.10063 lineto
0.71825 0.10162 lineto
0.72321 0.10431 lineto
0.72817 0.10797 lineto
0.7381 0.11802 lineto
0.74802 0.13148 lineto
0.75794 0.14792 lineto
0.77778 0.18764 lineto
0.81746 0.27611 lineto
0.82738 0.296 lineto
0.8373 0.31365 lineto
0.84722 0.3285 lineto
0.85218 0.33472 lineto
0.85714 0.34007 lineto
0.8621 0.3445 lineto
0.86706 0.34798 lineto
0.86954 0.34936 lineto
0.87202 0.35049 lineto
0.8745 0.35137 lineto
0.87574 0.35172 lineto
0.87698 0.352 lineto
0.87822 0.35222 lineto
0.87946 0.35238 lineto
0.8807 0.35248 lineto
0.88194 0.35251 lineto
0.88318 0.35248 lineto
0.88442 0.35238 lineto
0.88566 0.35223 lineto
0.8869 0.35201 lineto
0.88938 0.35138 lineto
0.89187 0.35051 lineto
0.89435 0.34939 lineto
0.89683 0.34803 lineto
0.90179 0.34458 lineto
0.90675 0.34021 lineto
0.91667 0.32886 lineto
0.93651 0.29731 lineto
0.97619 0.21611 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05729 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.06969 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07465 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.08085 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23544 lineto
0.09325 0.23544 lineto
0.09573 0.23544 lineto
0.09821 0.23544 lineto
0.10069 0.23544 lineto
0.10317 0.23544 lineto
0.10813 0.23544 lineto
0.11062 0.23544 lineto
0.1131 0.23544 lineto
0.11558 0.23545 lineto
0.11806 0.23545 lineto
0.12302 0.23545 lineto
0.1255 0.23545 lineto
0.12798 0.23545 lineto
0.13294 0.23546 lineto
0.1379 0.23547 lineto
0.14286 0.23548 lineto
0.14782 0.23549 lineto
0.15278 0.23551 lineto
0.15774 0.23553 lineto
0.1627 0.23556 lineto
0.16766 0.2356 lineto
0.17262 0.23564 lineto
0.17758 0.2357 lineto
0.18254 0.23577 lineto
0.19246 0.23597 lineto
0.19742 0.23611 lineto
0.20238 0.23627 lineto
0.2123 0.23668 lineto
0.22222 0.23726 lineto
0.23214 0.23805 lineto
0.24206 0.23911 lineto
0.25198 0.24048 lineto
0.2619 0.24224 lineto
0.27183 0.24445 lineto
0.28175 0.2472 lineto
0.30159 0.25455 lineto
0.32143 0.26483 lineto
0.34127 0.27841 lineto
0.38095 0.31544 lineto
0.42063 0.36114 lineto
0.44048 0.38364 lineto
0.46032 0.40308 lineto
0.47024 0.41092 lineto
0.4752 0.41423 lineto
0.48016 0.41709 lineto
0.48512 0.41947 lineto
0.49008 0.42133 lineto
0.49256 0.42206 lineto
0.49504 0.42264 lineto
0.49628 0.42288 lineto
0.49752 0.42308 lineto
0.49876 0.42324 lineto
0.5 0.42337 lineto
0.50124 0.42346 lineto
0.50248 0.42351 lineto
0.50372 0.42352 lineto
0.50496 0.4235 lineto
0.5062 0.42343 lineto
0.50744 0.42333 lineto
0.50868 0.42318 lineto
0.50992 0.423 lineto
0.5124 0.42251 lineto
0.51488 0.42185 lineto
0.51984 0.42003 lineto
0.5248 0.41754 lineto
0.52976 0.41436 lineto
0.53968 0.40592 lineto
0.5496 0.39472 lineto
0.55952 0.38085 lineto
0.57937 0.34584 lineto
0.61905 0.25593 lineto
0.63889 0.20844 lineto
0.65873 0.16514 lineto
0.67857 0.13038 lineto
0.68849 0.11739 lineto
0.69345 0.11217 lineto
0.69841 0.10783 lineto
0.70337 0.10443 lineto
0.70833 0.10197 lineto
0.71081 0.10111 lineto
0.71205 0.10077 lineto
0.71329 0.10049 lineto
0.71453 0.10027 lineto
0.71577 0.10011 lineto
0.71701 0.10001 lineto
0.71825 0.09998 lineto
0.71949 0.1 lineto
0.72073 0.10009 lineto
0.72197 0.10024 lineto
0.72321 0.10045 lineto
0.72445 0.10072 lineto
0.72569 0.10105 lineto
0.72817 0.1019 lineto
0.73065 0.10299 lineto
0.73313 0.10432 lineto
0.7381 0.10768 lineto
0.74802 0.11716 lineto
0.75794 0.13004 lineto
0.77778 0.16435 lineto
0.81746 0.25101 lineto
0.8373 0.29251 lineto
0.84722 0.31043 lineto
0.85714 0.32566 lineto
0.86706 0.33773 lineto
0.87202 0.34245 lineto
0.87698 0.34625 lineto
0.87946 0.34778 lineto
0.88194 0.34908 lineto
0.88442 0.35013 lineto
0.88566 0.35057 lineto
0.8869 0.35094 lineto
0.88814 0.35125 lineto
0.88938 0.3515 lineto
0.89062 0.35169 lineto
0.89187 0.35181 lineto
0.89311 0.35187 lineto
0.89435 0.35187 lineto
0.89559 0.35181 lineto
0.89683 0.35168 lineto
0.89807 0.35149 lineto
0.89931 0.35124 lineto
0.90179 0.35056 lineto
0.90427 0.34963 lineto
0.90675 0.34846 lineto
0.91171 0.3454 lineto
0.91667 0.34141 lineto
0.92659 0.33079 lineto
0.93651 0.31699 lineto
0.97619 0.24116 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05729 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.06969 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07465 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.08085 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23544 lineto
0.09325 0.23544 lineto
0.09573 0.23544 lineto
0.09821 0.23544 lineto
0.10069 0.23544 lineto
0.10317 0.23544 lineto
0.10813 0.23544 lineto
0.11062 0.23544 lineto
0.1131 0.23544 lineto
0.11558 0.23544 lineto
0.11806 0.23544 lineto
0.12302 0.23545 lineto
0.1255 0.23545 lineto
0.12798 0.23545 lineto
0.13294 0.23545 lineto
0.1379 0.23546 lineto
0.14286 0.23546 lineto
0.14782 0.23547 lineto
0.15278 0.23549 lineto
0.15774 0.2355 lineto
0.1627 0.23552 lineto
0.16766 0.23555 lineto
0.17262 0.23558 lineto
0.17758 0.23563 lineto
0.18254 0.23568 lineto
0.19246 0.23583 lineto
0.19742 0.23593 lineto
0.20238 0.23605 lineto
0.2123 0.23637 lineto
0.22222 0.23682 lineto
0.23214 0.23743 lineto
0.24206 0.23826 lineto
0.25198 0.23936 lineto
0.2619 0.24078 lineto
0.27183 0.24259 lineto
0.28175 0.24486 lineto
0.29167 0.24764 lineto
0.30159 0.25103 lineto
0.32143 0.25984 lineto
0.34127 0.27173 lineto
0.38095 0.30534 lineto
0.42063 0.34914 lineto
0.44048 0.37195 lineto
0.46032 0.39288 lineto
0.47024 0.40193 lineto
0.48016 0.40965 lineto
0.48512 0.41292 lineto
0.49008 0.41574 lineto
0.49504 0.4181 lineto
0.5 0.41994 lineto
0.50248 0.42067 lineto
0.50496 0.42125 lineto
0.5062 0.42149 lineto
0.50744 0.4217 lineto
0.50868 0.42186 lineto
0.50992 0.42199 lineto
0.51116 0.42209 lineto
0.5124 0.42215 lineto
0.51364 0.42216 lineto
0.51488 0.42215 lineto
0.51612 0.42209 lineto
0.51736 0.42199 lineto
0.51984 0.42168 lineto
0.52108 0.42147 lineto
0.52232 0.42121 lineto
0.5248 0.42058 lineto
0.52976 0.41883 lineto
0.53472 0.41641 lineto
0.53968 0.41332 lineto
0.5496 0.40509 lineto
0.55952 0.39415 lineto
0.57937 0.36455 lineto
0.61905 0.28129 lineto
0.65873 0.18832 lineto
0.67857 0.14878 lineto
0.68849 0.13259 lineto
0.69841 0.11938 lineto
0.70833 0.10952 lineto
0.71329 0.10593 lineto
0.71577 0.10449 lineto
0.71825 0.10328 lineto
0.72073 0.1023 lineto
0.72321 0.10157 lineto
0.72445 0.10129 lineto
0.72569 0.10108 lineto
0.72693 0.10092 lineto
0.72817 0.10083 lineto
0.72941 0.10079 lineto
0.73065 0.10082 lineto
0.73189 0.10091 lineto
0.73313 0.10105 lineto
0.73437 0.10126 lineto
0.73562 0.10153 lineto
0.7381 0.10224 lineto
0.74058 0.1032 lineto
0.74306 0.10439 lineto
0.74802 0.10749 lineto
0.75298 0.1115 lineto
0.75794 0.1164 lineto
0.77778 0.14407 lineto
0.79762 0.18193 lineto
0.81746 0.22536 lineto
0.8373 0.26895 lineto
0.85714 0.30723 lineto
0.86706 0.32282 lineto
0.87698 0.33536 lineto
0.88194 0.34035 lineto
0.8869 0.34444 lineto
0.89187 0.34759 lineto
0.89435 0.34881 lineto
0.89683 0.34978 lineto
0.89807 0.35018 lineto
0.89931 0.35051 lineto
0.90055 0.35078 lineto
0.90179 0.351 lineto
0.90303 0.35115 lineto
0.90427 0.35123 lineto
0.90551 0.35126 lineto
0.90675 0.35123 lineto
0.90799 0.35113 lineto
0.90923 0.35097 lineto
0.91171 0.35047 lineto
0.91295 0.35013 lineto
0.91419 0.34973 lineto
0.91667 0.34874 lineto
0.92163 0.34606 lineto
0.92659 0.34244 lineto
0.93651 0.33255 lineto
0.94643 0.31942 lineto
0.95635 0.30353 lineto
0.97619 0.26581 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05729 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.06969 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07465 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.08085 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23544 lineto
0.09325 0.23544 lineto
0.09573 0.23544 lineto
0.09821 0.23544 lineto
0.10069 0.23544 lineto
0.10317 0.23544 lineto
0.10565 0.23544 lineto
0.10813 0.23544 lineto
0.11062 0.23544 lineto
0.1131 0.23544 lineto
0.11558 0.23544 lineto
0.11806 0.23544 lineto
0.12302 0.23544 lineto
0.1255 0.23545 lineto
0.12798 0.23545 lineto
0.13294 0.23545 lineto
0.1379 0.23545 lineto
0.14286 0.23546 lineto
0.14782 0.23546 lineto
0.15278 0.23547 lineto
0.15774 0.23548 lineto
0.1627 0.2355 lineto
0.16766 0.23552 lineto
0.17262 0.23554 lineto
0.17758 0.23557 lineto
0.18254 0.23561 lineto
0.19246 0.23572 lineto
0.19742 0.2358 lineto
0.20238 0.23589 lineto
0.20734 0.236 lineto
0.2123 0.23613 lineto
0.22222 0.23647 lineto
0.23214 0.23695 lineto
0.24206 0.23761 lineto
0.25198 0.23848 lineto
0.2619 0.23962 lineto
0.27183 0.24109 lineto
0.28175 0.24294 lineto
0.29167 0.24525 lineto
0.30159 0.24809 lineto
0.32143 0.25558 lineto
0.34127 0.26591 lineto
0.36111 0.2794 lineto
0.38095 0.29611 lineto
0.42063 0.33752 lineto
0.46032 0.38197 lineto
0.48016 0.40081 lineto
0.49008 0.40842 lineto
0.49504 0.41164 lineto
0.5 0.41444 lineto
0.50496 0.41677 lineto
0.50992 0.4186 lineto
0.5124 0.41932 lineto
0.51488 0.41991 lineto
0.51612 0.42015 lineto
0.51736 0.42035 lineto
0.5186 0.42052 lineto
0.51984 0.42066 lineto
0.52108 0.42076 lineto
0.52232 0.42082 lineto
0.52356 0.42084 lineto
0.5248 0.42083 lineto
0.52604 0.42078 lineto
0.52728 0.42069 lineto
0.52852 0.42056 lineto
0.52976 0.4204 lineto
0.53224 0.41995 lineto
0.53472 0.41935 lineto
0.5372 0.41858 lineto
0.53968 0.41765 lineto
0.54464 0.41531 lineto
0.5496 0.4123 lineto
0.55952 0.40428 lineto
0.56944 0.39359 lineto
0.57937 0.38031 lineto
0.61905 0.3053 lineto
0.65873 0.21279 lineto
0.67857 0.16984 lineto
0.68849 0.15106 lineto
0.69841 0.13476 lineto
0.70833 0.12135 lineto
0.71329 0.11585 lineto
0.71825 0.1112 lineto
0.72321 0.10744 lineto
0.72569 0.1059 lineto
0.72817 0.10459 lineto
0.73065 0.10352 lineto
0.73313 0.10268 lineto
0.73437 0.10235 lineto
0.73562 0.10208 lineto
0.73686 0.10187 lineto
0.7381 0.10171 lineto
0.73934 0.10162 lineto
0.74058 0.10159 lineto
0.74182 0.10162 lineto
0.74306 0.1017 lineto
0.7443 0.10185 lineto
0.74554 0.10205 lineto
0.74802 0.10264 lineto
0.7505 0.10347 lineto
0.75298 0.10454 lineto
0.75794 0.10736 lineto
0.7629 0.1111 lineto
0.76786 0.11573 lineto
0.77778 0.1275 lineto
0.79762 0.15976 lineto
0.81746 0.20026 lineto
0.8373 0.24405 lineto
0.85714 0.28569 lineto
0.87698 0.31997 lineto
0.8869 0.33295 lineto
0.89187 0.3382 lineto
0.89683 0.34257 lineto
0.90179 0.34602 lineto
0.90427 0.34739 lineto
0.90675 0.34853 lineto
0.90923 0.34943 lineto
0.91171 0.35008 lineto
0.91295 0.35031 lineto
0.91419 0.35049 lineto
0.91543 0.3506 lineto
0.91667 0.35065 lineto
0.91791 0.35065 lineto
0.91915 0.35058 lineto
0.92039 0.35045 lineto
0.92163 0.35026 lineto
0.92287 0.35001 lineto
0.92411 0.34969 lineto
0.92659 0.34889 lineto
0.92907 0.34785 lineto
0.93155 0.34657 lineto
0.93651 0.34331 lineto
0.94643 0.33413 lineto
0.95635 0.32168 lineto
0.97619 0.28882 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05729 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.06969 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07465 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.07961 0.23544 lineto
0.08085 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23544 lineto
0.09325 0.23544 lineto
0.09573 0.23544 lineto
0.09821 0.23544 lineto
0.10069 0.23544 lineto
0.10317 0.23544 lineto
0.10565 0.23544 lineto
0.10813 0.23544 lineto
0.11062 0.23544 lineto
0.1131 0.23544 lineto
0.11558 0.23544 lineto
0.11806 0.23544 lineto
0.12302 0.23544 lineto
0.1255 0.23544 lineto
0.12798 0.23544 lineto
0.13294 0.23545 lineto
0.1379 0.23545 lineto
0.14286 0.23545 lineto
0.14782 0.23546 lineto
0.15278 0.23546 lineto
0.15774 0.23547 lineto
0.1627 0.23548 lineto
0.16766 0.23549 lineto
0.17262 0.23551 lineto
0.17758 0.23553 lineto
0.18254 0.23556 lineto
0.19246 0.23564 lineto
0.19742 0.2357 lineto
0.20238 0.23577 lineto
0.20734 0.23585 lineto
0.2123 0.23595 lineto
0.22222 0.23621 lineto
0.23214 0.23658 lineto
0.24206 0.23709 lineto
0.25198 0.23778 lineto
0.2619 0.23869 lineto
0.27183 0.23987 lineto
0.28175 0.24139 lineto
0.29167 0.24329 lineto
0.30159 0.24565 lineto
0.32143 0.25198 lineto
0.34127 0.26088 lineto
0.36111 0.27275 lineto
0.38095 0.28778 lineto
0.42063 0.32644 lineto
0.46032 0.37067 lineto
0.48016 0.39095 lineto
0.49008 0.39973 lineto
0.5 0.40723 lineto
0.50496 0.41041 lineto
0.50992 0.41317 lineto
0.51488 0.41548 lineto
0.51984 0.4173 lineto
0.52232 0.41801 lineto
0.5248 0.4186 lineto
0.52728 0.41905 lineto
0.52852 0.41922 lineto
0.52976 0.41936 lineto
0.531 0.41946 lineto
0.53224 0.41953 lineto
0.53348 0.41956 lineto
0.53472 0.41955 lineto
0.53596 0.41951 lineto
0.5372 0.41943 lineto
0.53844 0.41931 lineto
0.53968 0.41915 lineto
0.54216 0.41872 lineto
0.54464 0.41814 lineto
0.5496 0.4165 lineto
0.55456 0.41423 lineto
0.55952 0.4113 lineto
0.56944 0.40347 lineto
0.57937 0.39302 lineto
0.59921 0.3646 lineto
0.61905 0.32743 lineto
0.65873 0.23777 lineto
0.67857 0.19278 lineto
0.69841 0.15329 lineto
0.70833 0.13688 lineto
0.71825 0.12329 lineto
0.72321 0.11766 lineto
0.72817 0.11287 lineto
0.73313 0.10895 lineto
0.73562 0.10732 lineto
0.7381 0.10592 lineto
0.74058 0.10475 lineto
0.74306 0.10381 lineto
0.7443 0.10343 lineto
0.74554 0.1031 lineto
0.74678 0.10284 lineto
0.74802 0.10263 lineto
0.74926 0.10248 lineto
0.7505 0.10239 lineto
0.75174 0.10236 lineto
0.75298 0.10239 lineto
0.75422 0.10248 lineto
0.75546 0.10263 lineto
0.75794 0.1031 lineto
0.75918 0.10342 lineto
0.76042 0.1038 lineto
0.7629 0.10474 lineto
0.76786 0.10731 lineto
0.77282 0.11079 lineto
0.77778 0.11515 lineto
0.7877 0.12639 lineto
0.79762 0.14069 lineto
0.81746 0.17672 lineto
0.85714 0.26208 lineto
0.87698 0.3009 lineto
0.8869 0.31712 lineto
0.89683 0.33051 lineto
0.90179 0.336 lineto
0.90675 0.34064 lineto
0.91171 0.34438 lineto
0.91419 0.3459 lineto
0.91667 0.34719 lineto
0.91915 0.34825 lineto
0.92163 0.34906 lineto
0.92287 0.34938 lineto
0.92411 0.34964 lineto
0.92535 0.34984 lineto
0.92659 0.34997 lineto
0.92783 0.35005 lineto
0.92907 0.35007 lineto
0.93031 0.35002 lineto
0.93155 0.34992 lineto
0.93279 0.34976 lineto
0.93403 0.34953 lineto
0.93527 0.34925 lineto
0.93651 0.34891 lineto
0.97619 0.30909 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05729 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06473 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.06969 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07465 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.07961 0.23544 lineto
0.08085 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23544 lineto
0.09325 0.23544 lineto
0.09573 0.23544 lineto
0.09821 0.23544 lineto
0.10069 0.23544 lineto
0.10317 0.23544 lineto
0.10565 0.23544 lineto
0.10813 0.23544 lineto
0.11062 0.23544 lineto
0.1131 0.23544 lineto
0.11558 0.23544 lineto
0.11806 0.23544 lineto
0.12302 0.23544 lineto
0.1255 0.23544 lineto
0.12798 0.23544 lineto
0.13294 0.23544 lineto
0.13542 0.23545 lineto
0.1379 0.23545 lineto
0.14286 0.23545 lineto
0.14782 0.23545 lineto
0.15278 0.23546 lineto
0.15774 0.23546 lineto
0.1627 0.23547 lineto
0.16766 0.23548 lineto
0.17262 0.23549 lineto
0.17758 0.23551 lineto
0.18254 0.23553 lineto
0.1875 0.23555 lineto
0.19246 0.23559 lineto
0.19742 0.23563 lineto
0.20238 0.23568 lineto
0.20734 0.23574 lineto
0.2123 0.23581 lineto
0.22222 0.23601 lineto
0.22718 0.23614 lineto
0.23214 0.2363 lineto
0.24206 0.23669 lineto
0.25198 0.23723 lineto
0.2619 0.23796 lineto
0.27183 0.23891 lineto
0.28175 0.24013 lineto
0.29167 0.24169 lineto
0.30159 0.24363 lineto
0.32143 0.24895 lineto
0.33135 0.25244 lineto
0.34127 0.25656 lineto
0.36111 0.26692 lineto
0.38095 0.28032 lineto
0.42063 0.31602 lineto
0.46032 0.35925 lineto
0.48016 0.3804 lineto
0.5 0.39868 lineto
0.50992 0.40608 lineto
0.51984 0.41194 lineto
0.5248 0.41423 lineto
0.52976 0.41603 lineto
0.53224 0.41674 lineto
0.53472 0.41733 lineto
0.53596 0.41757 lineto
0.5372 0.41778 lineto
0.53844 0.41796 lineto
0.53968 0.4181 lineto
0.54092 0.4182 lineto
0.54216 0.41827 lineto
0.5434 0.41831 lineto
0.54464 0.4183 lineto
0.54588 0.41827 lineto
0.54712 0.41819 lineto
0.54836 0.41808 lineto
0.5496 0.41793 lineto
0.55084 0.41775 lineto
0.55208 0.41753 lineto
0.55456 0.41697 lineto
0.55952 0.41538 lineto
0.56448 0.41317 lineto
0.56944 0.41032 lineto
0.57937 0.40267 lineto
0.58929 0.39245 lineto
0.59921 0.37971 lineto
0.61905 0.34728 lineto
0.65873 0.26255 lineto
0.67857 0.21684 lineto
0.69841 0.17427 lineto
0.70833 0.15547 lineto
0.71825 0.13897 lineto
0.72817 0.1252 lineto
0.73313 0.11946 lineto
0.7381 0.11453 lineto
0.74306 0.11046 lineto
0.74802 0.10726 lineto
0.7505 0.106 lineto
0.75298 0.10496 lineto
0.75546 0.10415 lineto
0.7567 0.10384 lineto
0.75794 0.10358 lineto
0.75918 0.10338 lineto
0.76042 0.10323 lineto
0.76166 0.10315 lineto
0.7629 0.10312 lineto
0.76414 0.10315 lineto
0.76538 0.10324 lineto
0.76662 0.10339 lineto
0.76786 0.1036 lineto
0.77034 0.10418 lineto
0.77282 0.105 lineto
0.7753 0.10605 lineto
0.77778 0.10732 lineto
0.78274 0.11055 lineto
0.7877 0.11465 lineto
0.79762 0.12537 lineto
0.81746 0.15564 lineto
0.85714 0.23746 lineto
0.87698 0.27909 lineto
0.8869 0.29779 lineto
0.89683 0.31428 lineto
0.90675 0.32805 lineto
0.91171 0.33378 lineto
0.91667 0.33866 lineto
0.92163 0.34268 lineto
0.92659 0.34578 lineto
0.92907 0.34699 lineto
0.93155 0.34796 lineto
0.93403 0.3487 lineto
0.93527 0.34897 lineto
0.93651 0.34919 lineto
0.97619 0.32571 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05729 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06473 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.06969 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07465 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.07961 0.23544 lineto
0.08085 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23544 lineto
0.09325 0.23544 lineto
0.09573 0.23544 lineto
0.09821 0.23544 lineto
0.10069 0.23544 lineto
0.10317 0.23544 lineto
0.10565 0.23544 lineto
0.10813 0.23544 lineto
0.11062 0.23544 lineto
0.1131 0.23544 lineto
0.11558 0.23544 lineto
0.11806 0.23544 lineto
0.12302 0.23544 lineto
0.1255 0.23544 lineto
0.12798 0.23544 lineto
0.13294 0.23544 lineto
0.13542 0.23544 lineto
0.1379 0.23544 lineto
0.14286 0.23545 lineto
0.14782 0.23545 lineto
0.15278 0.23545 lineto
0.15774 0.23545 lineto
0.1627 0.23546 lineto
0.16766 0.23547 lineto
0.17262 0.23548 lineto
0.17758 0.23549 lineto
0.18254 0.2355 lineto
0.1875 0.23552 lineto
0.19246 0.23555 lineto
0.19742 0.23558 lineto
0.20238 0.23561 lineto
0.20734 0.23566 lineto
0.2123 0.23571 lineto
0.22222 0.23587 lineto
0.22718 0.23596 lineto
0.23214 0.23608 lineto
0.24206 0.23639 lineto
0.25198 0.23681 lineto
0.2619 0.23738 lineto
0.27183 0.23814 lineto
0.28175 0.23912 lineto
0.29167 0.24039 lineto
0.30159 0.24199 lineto
0.32143 0.24641 lineto
0.33135 0.24936 lineto
0.34127 0.25289 lineto
0.36111 0.26186 lineto
0.38095 0.27371 lineto
0.42063 0.30633 lineto
0.46032 0.34796 lineto
0.48016 0.36946 lineto
0.5 0.38914 lineto
0.51984 0.40496 lineto
0.5248 0.40806 lineto
0.52976 0.41075 lineto
0.53472 0.41301 lineto
0.53968 0.4148 lineto
0.54216 0.41551 lineto
0.54464 0.41609 lineto
0.54712 0.41655 lineto
0.54836 0.41672 lineto
0.5496 0.41687 lineto
0.55084 0.41698 lineto
0.55208 0.41705 lineto
0.55332 0.41709 lineto
0.55456 0.41709 lineto
0.5558 0.41706 lineto
0.55704 0.41699 lineto
0.55828 0.41689 lineto
0.55952 0.41675 lineto
0.562 0.41636 lineto
0.56448 0.41582 lineto
0.56696 0.41513 lineto
0.56944 0.41428 lineto
0.5744 0.41213 lineto
0.57937 0.40935 lineto
0.58929 0.40189 lineto
0.59921 0.39188 lineto
0.61905 0.36456 lineto
0.63889 0.32865 lineto
0.65873 0.28648 lineto
0.69841 0.19695 lineto
0.71825 0.15759 lineto
0.72817 0.14101 lineto
0.7381 0.12709 lineto
0.74306 0.12124 lineto
0.74802 0.11619 lineto
0.75298 0.11196 lineto
0.75794 0.1086 lineto
0.76042 0.10725 lineto
0.7629 0.10612 lineto
0.76538 0.10522 lineto
0.76662 0.10486 lineto
0.76786 0.10455 lineto
0.7691 0.1043 lineto
0.77034 0.1041 lineto
0.77158 0.10396 lineto
0.77282 0.10388 lineto
0.77406 0.10386 lineto
0.7753 0.1039 lineto
0.77654 0.10399 lineto
0.77778 0.10414 lineto
0.78026 0.10461 lineto
0.7815 0.10493 lineto
0.78274 0.10531 lineto
0.7877 0.1074 lineto
0.79018 0.10877 lineto
0.79266 0.11037 lineto
0.79762 0.11422 lineto
0.80754 0.12444 lineto
0.81746 0.13774 lineto
0.85714 0.21287 lineto
0.87698 0.25552 lineto
0.89683 0.29471 lineto
0.90675 0.31145 lineto
0.91667 0.32558 lineto
0.92659 0.33664 lineto
0.93155 0.34092 lineto
0.93651 0.3443 lineto
0.94147 0.34678 lineto
0.94395 0.34766 lineto
0.94519 0.34802 lineto
0.94643 0.34832 lineto
0.94767 0.34856 lineto
0.94891 0.34874 lineto
0.95015 0.34886 lineto
0.95139 0.34892 lineto
0.95263 0.34892 lineto
0.95387 0.34887 lineto
0.95511 0.34875 lineto
0.95635 0.34858 lineto
0.95759 0.34834 lineto
0.95883 0.34805 lineto
0.96131 0.34729 lineto
0.96379 0.3463 lineto
0.96627 0.34508 lineto
0.97123 0.34197 lineto
0.97619 0.33797 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05729 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06473 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.06969 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07465 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.07961 0.23544 lineto
0.08085 0.23544 lineto
0.08209 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23544 lineto
0.09325 0.23544 lineto
0.09573 0.23544 lineto
0.09821 0.23544 lineto
0.10069 0.23544 lineto
0.10317 0.23544 lineto
0.10565 0.23544 lineto
0.10813 0.23544 lineto
0.11062 0.23544 lineto
0.1131 0.23544 lineto
0.11558 0.23544 lineto
0.11806 0.23544 lineto
0.12302 0.23544 lineto
0.1255 0.23544 lineto
0.12798 0.23544 lineto
0.13294 0.23544 lineto
0.13542 0.23544 lineto
0.1379 0.23544 lineto
0.14286 0.23544 lineto
0.14782 0.23545 lineto
0.15278 0.23545 lineto
0.15774 0.23545 lineto
0.1627 0.23545 lineto
0.16766 0.23546 lineto
0.17262 0.23547 lineto
0.17758 0.23547 lineto
0.18254 0.23548 lineto
0.1875 0.2355 lineto
0.19246 0.23552 lineto
0.19742 0.23554 lineto
0.20238 0.23556 lineto
0.20734 0.2356 lineto
0.2123 0.23564 lineto
0.22222 0.23575 lineto
0.22718 0.23583 lineto
0.23214 0.23592 lineto
0.24206 0.23615 lineto
0.25198 0.23648 lineto
0.2619 0.23693 lineto
0.27183 0.23753 lineto
0.28175 0.23832 lineto
0.29167 0.23934 lineto
0.30159 0.24065 lineto
0.32143 0.24431 lineto
0.33135 0.24679 lineto
0.34127 0.24978 lineto
0.36111 0.2575 lineto
0.38095 0.26788 lineto
0.40079 0.28119 lineto
0.42063 0.29742 lineto
0.46032 0.33697 lineto
0.5 0.37892 lineto
0.51984 0.39668 lineto
0.52976 0.40387 lineto
0.53472 0.40693 lineto
0.53968 0.4096 lineto
0.54464 0.41183 lineto
0.5496 0.41361 lineto
0.55208 0.41431 lineto
0.55456 0.41489 lineto
0.55704 0.41535 lineto
0.55828 0.41553 lineto
0.55952 0.41567 lineto
0.56076 0.41578 lineto
0.562 0.41586 lineto
0.56324 0.4159 lineto
0.56448 0.41591 lineto
0.56572 0.41588 lineto
0.56696 0.41582 lineto
0.5682 0.41573 lineto
0.56944 0.41559 lineto
0.57192 0.41522 lineto
0.5744 0.4147 lineto
0.57688 0.41403 lineto
0.57937 0.41321 lineto
0.58433 0.41112 lineto
0.58929 0.40841 lineto
0.59921 0.40111 lineto
0.60913 0.39132 lineto
0.61905 0.37908 lineto
0.63889 0.3478 lineto
0.65873 0.30901 lineto
0.69841 0.22061 lineto
0.71825 0.17846 lineto
0.7381 0.14302 lineto
0.74802 0.12895 lineto
0.75794 0.11782 lineto
0.7629 0.11347 lineto
0.76786 0.10995 lineto
0.77282 0.1073 lineto
0.7753 0.10631 lineto
0.77778 0.10554 lineto
0.77902 0.10524 lineto
0.78026 0.105 lineto
0.7815 0.10481 lineto
0.78274 0.10468 lineto
0.78398 0.1046 lineto
0.78522 0.10459 lineto
0.78646 0.10463 lineto
0.7877 0.10472 lineto
0.78894 0.10487 lineto
0.79018 0.10508 lineto
0.79266 0.10567 lineto
0.79514 0.10649 lineto
0.79762 0.10752 lineto
0.80258 0.11026 lineto
0.80754 0.11387 lineto
0.81746 0.12359 lineto
0.82738 0.13641 lineto
0.8373 0.15195 lineto
0.85714 0.1893 lineto
0.89683 0.27271 lineto
0.91667 0.30864 lineto
0.92659 0.32309 lineto
0.93651 0.33459 lineto
0.94147 0.33911 lineto
0.94643 0.34276 lineto
0.94891 0.34425 lineto
0.95139 0.34552 lineto
0.95387 0.34655 lineto
0.95635 0.34736 lineto
0.95759 0.34767 lineto
0.95883 0.34793 lineto
0.96007 0.34813 lineto
0.96131 0.34827 lineto
0.96255 0.34835 lineto
0.96379 0.34838 lineto
0.96503 0.34834 lineto
0.96627 0.34825 lineto
0.97619 0.34541 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05729 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06473 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.06969 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07465 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.07961 0.23544 lineto
0.08085 0.23544 lineto
0.08209 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23544 lineto
0.09325 0.23544 lineto
0.09573 0.23544 lineto
0.09821 0.23544 lineto
0.10069 0.23544 lineto
0.10317 0.23544 lineto
0.10565 0.23544 lineto
0.10813 0.23544 lineto
0.11062 0.23544 lineto
0.1131 0.23544 lineto
0.11558 0.23544 lineto
0.11806 0.23544 lineto
0.12302 0.23544 lineto
0.1255 0.23544 lineto
0.12798 0.23544 lineto
0.13294 0.23544 lineto
0.13542 0.23544 lineto
0.1379 0.23544 lineto
0.14038 0.23544 lineto
0.14286 0.23544 lineto
0.14782 0.23544 lineto
0.15278 0.23545 lineto
0.15774 0.23545 lineto
0.1627 0.23545 lineto
0.16766 0.23545 lineto
0.17262 0.23546 lineto
0.17758 0.23546 lineto
0.18254 0.23547 lineto
0.1875 0.23548 lineto
0.19246 0.23549 lineto
0.19742 0.23551 lineto
0.20238 0.23553 lineto
0.20734 0.23555 lineto
0.2123 0.23559 lineto
0.22222 0.23567 lineto
0.22718 0.23573 lineto
0.23214 0.2358 lineto
0.24206 0.23598 lineto
0.25198 0.23623 lineto
0.2619 0.23658 lineto
0.27183 0.23705 lineto
0.28175 0.23768 lineto
0.29167 0.2385 lineto
0.30159 0.23956 lineto
0.31151 0.2409 lineto
0.32143 0.24258 lineto
0.33135 0.24465 lineto
0.34127 0.24716 lineto
0.36111 0.25376 lineto
0.38095 0.2628 lineto
0.40079 0.27461 lineto
0.42063 0.28932 lineto
0.46032 0.32645 lineto
0.5 0.36832 lineto
0.51984 0.38744 lineto
0.52976 0.39572 lineto
0.53968 0.40282 lineto
0.5496 0.40847 lineto
0.55456 0.41068 lineto
0.55952 0.41244 lineto
0.56448 0.41373 lineto
0.56696 0.41418 lineto
0.5682 0.41436 lineto
0.56944 0.41451 lineto
0.57068 0.41462 lineto
0.57192 0.4147 lineto
0.57316 0.41475 lineto
0.5744 0.41476 lineto
0.57564 0.41474 lineto
0.57688 0.41468 lineto
0.57813 0.41459 lineto
0.57937 0.41447 lineto
0.58185 0.41411 lineto
0.58433 0.41361 lineto
0.58681 0.41296 lineto
0.58929 0.41216 lineto
0.59425 0.41012 lineto
0.59921 0.40748 lineto
0.60913 0.40034 lineto
0.61905 0.39075 lineto
0.63889 0.36444 lineto
0.65873 0.3297 lineto
0.69841 0.24454 lineto
0.71825 0.20087 lineto
0.7381 0.16169 lineto
0.75794 0.13078 lineto
0.76786 0.11945 lineto
0.77282 0.11496 lineto
0.77778 0.1113 lineto
0.78026 0.10979 lineto
0.78274 0.10849 lineto
0.78522 0.10741 lineto
0.7877 0.10655 lineto
0.78894 0.1062 lineto
0.79018 0.10591 lineto
0.79142 0.10568 lineto
0.79266 0.1055 lineto
0.7939 0.10537 lineto
0.79514 0.10531 lineto
0.79638 0.10529 lineto
0.79762 0.10534 lineto
0.79886 0.10544 lineto
0.8001 0.1056 lineto
0.80258 0.10608 lineto
0.80382 0.1064 lineto
0.80506 0.10678 lineto
0.80754 0.1077 lineto
0.8125 0.11021 lineto
0.81746 0.11359 lineto
0.82738 0.12283 lineto
0.8373 0.13517 lineto
0.85714 0.16764 lineto
0.89683 0.24927 lineto
0.91667 0.28866 lineto
0.92659 0.30584 lineto
0.93651 0.3206 lineto
0.94643 0.3325 lineto
0.95139 0.33726 lineto
0.95635 0.34116 lineto
0.95883 0.34279 lineto
0.96131 0.34419 lineto
0.96379 0.34537 lineto
0.96627 0.34632 lineto
0.96751 0.34671 lineto
0.96875 0.34704 lineto
0.96999 0.34731 lineto
0.97123 0.34753 lineto
0.97247 0.34769 lineto
0.97371 0.34779 lineto
0.97619 0.34782 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 23; pictureWidth = 367; pictureHeight = 227; endGroup; endGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.23544 0.5886 [
[(5.)] 0.2619 0.22294 0 1 Msboxa
[(10.)] 0.5 0.22294 0 1 Msboxa
[(15.)] 0.7381 0.22294 0 1 Msboxa
[(20.)] 0.97619 0.22294 0 1 Msboxa
[(-0.4)] 0.01131 0 1 0 Msboxa
[(-0.2)] 0.01131 0.11772 1 0 Msboxa
[(0.2)] 0.01131 0.35316 1 0 Msboxa
[(0.4)] 0.01131 0.47088 1 0 Msboxa
[(0.6)] 0.01131 0.5886 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.23544 moveto
1 0.23544 lineto
stroke
0.2619 0.22919 moveto
0.2619 0.24169 lineto
stroke
[(5.)] 0.2619 0.22294 0 1 Mshowa
0.5 0.22919 moveto
0.5 0.24169 lineto
stroke
[(10.)] 0.5 0.22294 0 1 Mshowa
0.7381 0.22919 moveto
0.7381 0.24169 lineto
stroke
[(15.)] 0.7381 0.22294 0 1 Mshowa
0.97619 0.22919 moveto
0.97619 0.24169 lineto
stroke
[(20.)] 0.97619 0.22294 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0 moveto
0.03006 0 lineto
stroke
[(-0.4)] 0.01131 0 1 0 Mshowa
0.01756 0.11772 moveto
0.03006 0.11772 lineto
stroke
[(-0.2)] 0.01131 0.11772 1 0 Mshowa
0.01756 0.35316 moveto
0.03006 0.35316 lineto
stroke
[(0.2)] 0.01131 0.35316 1 0 Mshowa
0.01756 0.47088 moveto
0.03006 0.47088 lineto
stroke
[(0.4)] 0.01131 0.47088 1 0 Mshowa
0.01756 0.5886 moveto
0.03006 0.5886 lineto
stroke
[(0.6)] 0.01131 0.5886 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02381 0.23544 moveto
0.02381 0.23544 lineto
0.02505 0.23544 lineto
0.02629 0.23544 lineto
0.02753 0.23544 lineto
0.02877 0.23544 lineto
0.03001 0.23544 lineto
0.03125 0.23544 lineto
0.03249 0.23544 lineto
0.03373 0.23544 lineto
0.03497 0.23544 lineto
0.03621 0.23544 lineto
0.03745 0.23544 lineto
0.03869 0.23544 lineto
0.03993 0.23544 lineto
0.04117 0.23544 lineto
0.04241 0.23544 lineto
0.04365 0.23544 lineto
0.04489 0.23544 lineto
0.04613 0.23544 lineto
0.04737 0.23544 lineto
0.04861 0.23544 lineto
0.04985 0.23544 lineto
0.05109 0.23544 lineto
0.05233 0.23544 lineto
0.05357 0.23544 lineto
0.05481 0.23544 lineto
0.05605 0.23544 lineto
0.05729 0.23544 lineto
0.05853 0.23544 lineto
0.05977 0.23544 lineto
0.06101 0.23544 lineto
0.06225 0.23544 lineto
0.06349 0.23544 lineto
0.06473 0.23544 lineto
0.06597 0.23544 lineto
0.06721 0.23544 lineto
0.06845 0.23544 lineto
0.06969 0.23544 lineto
0.07093 0.23544 lineto
0.07341 0.23544 lineto
0.07465 0.23544 lineto
0.07589 0.23544 lineto
0.07837 0.23544 lineto
0.07961 0.23544 lineto
0.08085 0.23544 lineto
0.08209 0.23544 lineto
0.08333 0.23544 lineto
0.08581 0.23544 lineto
0.08705 0.23544 lineto
0.08829 0.23544 lineto
0.09077 0.23544 lineto
0.09325 0.23544 lineto
0.09573 0.23544 lineto
0.09821 0.23544 lineto
0.10069 0.23544 lineto
0.10317 0.23544 lineto
0.10565 0.23544 lineto
0.10813 0.23544 lineto
0.11062 0.23544 lineto
0.1131 0.23544 lineto
0.11558 0.23544 lineto
0.11806 0.23544 lineto
0.12302 0.23544 lineto
0.1255 0.23544 lineto
0.12798 0.23544 lineto
0.13294 0.23544 lineto
0.13542 0.23544 lineto
0.1379 0.23544 lineto
0.14038 0.23544 lineto
0.14286 0.23544 lineto
0.14782 0.23544 lineto
0.15278 0.23544 lineto
0.15774 0.23545 lineto
0.1627 0.23545 lineto
0.16766 0.23545 lineto
0.17262 0.23545 lineto
0.17758 0.23546 lineto
0.18254 0.23546 lineto
0.1875 0.23547 lineto
0.19246 0.23548 lineto
0.19742 0.23549 lineto
0.20238 0.2355 lineto
0.20734 0.23552 lineto
0.2123 0.23555 lineto
0.22222 0.23561 lineto
0.22718 0.23565 lineto
0.23214 0.2357 lineto
0.24206 0.23584 lineto
0.24702 0.23593 lineto
0.25198 0.23603 lineto
0.2619 0.23631 lineto
0.27183 0.23668 lineto
0.28175 0.23717 lineto
0.29167 0.23783 lineto
0.30159 0.23869 lineto
0.31151 0.23978 lineto
0.32143 0.24116 lineto
0.33135 0.24287 lineto
0.34127 0.24498 lineto
0.36111 0.25058 lineto
0.38095 0.2584 lineto
0.40079 0.2688 lineto
0.42063 0.282 lineto
0.46032 0.31649 lineto
0.5 0.35757 lineto
0.51984 0.37753 lineto
0.53968 0.3948 lineto
0.5496 0.4018 lineto
0.55456 0.40478 lineto
0.55952 0.40738 lineto
0.56448 0.40957 lineto
0.56944 0.41131 lineto
0.57192 0.41201 lineto
0.5744 0.41259 lineto
0.57688 0.41304 lineto
0.57813 0.41322 lineto
0.57937 0.41337 lineto
0.58061 0.41349 lineto
0.58185 0.41357 lineto
0.58309 0.41362 lineto
0.58433 0.41364 lineto
0.58557 0.41362 lineto
0.58681 0.41357 lineto
0.58805 0.41348 lineto
0.58929 0.41337 lineto
0.59177 0.41302 lineto
0.59425 0.41254 lineto
0.59673 0.41191 lineto
0.59921 0.41114 lineto
0.60417 0.40915 lineto
0.60913 0.40657 lineto
0.61905 0.39959 lineto
0.62897 0.39018 lineto
0.63889 0.3784 lineto
0.65873 0.3482 lineto
0.69841 0.26811 lineto
0.7381 0.18242 lineto
0.75794 0.1469 lineto
0.76786 0.13258 lineto
0.77778 0.12106 lineto
0.7877 0.11265 lineto
0.79266 0.10968 lineto
0.79514 0.10852 lineto
0.79762 0.10758 lineto
0.79886 0.10718 lineto
0.8001 0.10685 lineto
0.80134 0.10657 lineto
0.80258 0.10634 lineto
0.80382 0.10617 lineto
0.80506 0.10605 lineto
0.8063 0.10599 lineto
0.80754 0.10599 lineto
0.80878 0.10604 lineto
0.81002 0.10614 lineto
0.81126 0.1063 lineto
0.8125 0.10652 lineto
0.81498 0.10712 lineto
0.81746 0.10793 lineto
0.81994 0.10897 lineto
0.82242 0.11022 lineto
0.82738 0.11337 lineto
0.8373 0.12214 lineto
0.84722 0.13401 lineto
0.85714 0.14865 lineto
0.89683 0.22538 lineto
0.91667 0.26657 lineto
0.93651 0.30306 lineto
0.94643 0.31811 lineto
0.95635 0.33039 lineto
0.96131 0.33536 lineto
0.96627 0.33951 lineto
0.97123 0.3428 lineto
0.97619 0.34521 lineto
0.97619 0.23544 lineto
fill
% End of Graphics
MathPictureEnd
:[font = text; inactive; ]
     As a final example, we will define a function which automatically produces an animation.  We will call it SpinFillPlot.
;[s]
3:0,0;111,1;123,2;125,-1;
3:1,13,10,Times,0,14,0,0,0;1,12,9,Times,1,14,0,0,0;1,13,10,Times,0,14,0,0,0;
:[font = input; ]
Clear[SpinFillPlot];
SpinFillPlot[function_, 
			 range_,
			 options__] :=
	Do[FillPlot[n function, 
				range, options],
	   {n, 1, -1, -2/15}]
:[font = input; startGroup; ]
SpinFillPlot[BesselJ[1, x], 
			 {x, 0.001, 20},
			 PlotRange->{-0.65, 0.65}];
:[font = postscript; PostScript; formatAsPostScript; output; inactive; Cclosed; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; startGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30925 lineto
0.0437 0.40614 lineto
0.06354 0.49057 lineto
0.07346 0.52467 lineto
0.08338 0.55188 lineto
0.08834 0.56264 lineto
0.0933 0.5714 lineto
0.09578 0.57501 lineto
0.09826 0.5781 lineto
0.10074 0.58066 lineto
0.10322 0.58269 lineto
0.10446 0.58351 lineto
0.1057 0.5842 lineto
0.10694 0.58475 lineto
0.10818 0.58517 lineto
0.10942 0.58546 lineto
0.11066 0.58561 lineto
0.1119 0.58563 lineto
0.11314 0.58552 lineto
0.11438 0.58528 lineto
0.11562 0.58491 lineto
0.11686 0.58441 lineto
0.1181 0.58377 lineto
0.12058 0.58211 lineto
0.12306 0.57995 lineto
0.12802 0.5741 lineto
0.13298 0.56631 lineto
0.1429 0.54524 lineto
0.15282 0.51762 lineto
0.16274 0.48454 lineto
0.18258 0.40722 lineto
0.20242 0.32466 lineto
0.22226 0.24847 lineto
0.23218 0.21606 lineto
0.2421 0.18888 lineto
0.24706 0.17752 lineto
0.25202 0.16775 lineto
0.25698 0.15964 lineto
0.26194 0.15324 lineto
0.26442 0.15069 lineto
0.2669 0.14858 lineto
0.26938 0.1469 lineto
0.27062 0.14623 lineto
0.27186 0.14566 lineto
0.2731 0.14521 lineto
0.27434 0.14486 lineto
0.27558 0.14462 lineto
0.27682 0.14449 lineto
0.27806 0.14447 lineto
0.2793 0.14456 lineto
0.28054 0.14475 lineto
0.28178 0.14505 lineto
0.28302 0.14545 lineto
0.28426 0.14596 lineto
0.28674 0.14729 lineto
0.28922 0.14904 lineto
0.2917 0.15118 lineto
0.29666 0.15663 lineto
0.30162 0.16358 lineto
0.31154 0.18154 lineto
0.32146 0.20417 lineto
0.3413 0.25906 lineto
0.38098 0.37339 lineto
0.3909 0.39611 lineto
0.40082 0.41457 lineto
0.40578 0.42199 lineto
0.41074 0.42812 lineto
0.4157 0.4329 lineto
0.41818 0.43478 lineto
0.42066 0.43631 lineto
0.42314 0.43749 lineto
0.42438 0.43795 lineto
0.42562 0.43833 lineto
0.42686 0.43861 lineto
0.4281 0.43881 lineto
0.42934 0.43892 lineto
0.43058 0.43894 lineto
0.43182 0.43888 lineto
0.43306 0.43873 lineto
0.4343 0.4385 lineto
0.43554 0.43817 lineto
0.43802 0.43728 lineto
0.4405 0.43604 lineto
0.44546 0.43258 lineto
0.45042 0.42785 lineto
0.46034 0.41482 lineto
0.47026 0.39763 lineto
0.48018 0.37706 lineto
0.50002 0.32962 lineto
0.51986 0.28071 lineto
0.52978 0.25827 lineto
0.5397 0.23842 lineto
0.54962 0.22195 lineto
0.55458 0.21518 lineto
0.55954 0.20948 lineto
0.5645 0.2049 lineto
0.56698 0.20304 lineto
0.56946 0.20147 lineto
0.57194 0.2002 lineto
0.57318 0.19968 lineto
0.57442 0.19923 lineto
0.57566 0.19886 lineto
0.5769 0.19856 lineto
0.57814 0.19833 lineto
0.57938 0.19819 lineto
0.58062 0.19811 lineto
0.58186 0.19811 lineto
0.5831 0.19819 lineto
0.58434 0.19834 lineto
0.58559 0.19856 lineto
0.58683 0.19886 lineto
0.58931 0.19967 lineto
0.59179 0.20077 lineto
0.59427 0.20217 lineto
0.59923 0.20578 lineto
0.60419 0.21048 lineto
0.60915 0.21619 lineto
0.61907 0.23037 lineto
0.65875 0.31005 lineto
0.67859 0.35131 lineto
0.68851 0.36919 lineto
0.69843 0.38424 lineto
0.70339 0.39051 lineto
0.70835 0.39586 lineto
0.71331 0.40023 lineto
0.71579 0.40204 lineto
0.71827 0.40359 lineto
0.72075 0.40489 lineto
0.72323 0.40592 lineto
0.72447 0.40633 lineto
0.72571 0.40668 lineto
0.72695 0.40696 lineto
0.72819 0.40718 lineto
0.72943 0.40733 lineto
0.73067 0.40741 lineto
0.73191 0.40743 lineto
0.73315 0.40738 lineto
0.73439 0.40727 lineto
0.73563 0.40708 lineto
0.73687 0.40684 lineto
0.73811 0.40652 lineto
0.74059 0.4057 lineto
0.74307 0.40462 lineto
0.74803 0.4017 lineto
0.75299 0.39781 lineto
0.75795 0.39299 lineto
0.77779 0.3657 lineto
0.81747 0.29092 lineto
0.83731 0.25626 lineto
0.84723 0.24227 lineto
0.85219 0.23639 lineto
0.85715 0.23132 lineto
0.86211 0.22712 lineto
0.86707 0.22382 lineto
0.86955 0.22253 lineto
0.87203 0.22147 lineto
0.87451 0.22065 lineto
0.87575 0.22033 lineto
0.87699 0.22007 lineto
0.87823 0.21987 lineto
0.87947 0.21973 lineto
0.88071 0.21965 lineto
0.88195 0.21963 lineto
0.88319 0.21968 lineto
0.88443 0.21978 lineto
0.88567 0.21994 lineto
0.88691 0.22016 lineto
0.88939 0.22079 lineto
0.89187 0.22165 lineto
0.89683 0.22407 lineto
0.90179 0.22739 lineto
0.90675 0.23157 lineto
0.91667 0.24231 lineto
0.93651 0.27141 lineto
0.97619 0.34079 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30922 lineto
0.0437 0.39319 lineto
0.06354 0.46636 lineto
0.07346 0.49591 lineto
0.08338 0.5195 lineto
0.08834 0.52882 lineto
0.0933 0.53641 lineto
0.09578 0.53954 lineto
0.09826 0.54222 lineto
0.10074 0.54444 lineto
0.10322 0.5462 lineto
0.10446 0.54691 lineto
0.1057 0.54751 lineto
0.10694 0.54799 lineto
0.10818 0.54835 lineto
0.10942 0.5486 lineto
0.11066 0.54873 lineto
0.1119 0.54875 lineto
0.11314 0.54866 lineto
0.11438 0.54845 lineto
0.11562 0.54812 lineto
0.11686 0.54769 lineto
0.1181 0.54714 lineto
0.12058 0.5457 lineto
0.12306 0.54382 lineto
0.12802 0.53876 lineto
0.13298 0.532 lineto
0.1429 0.51374 lineto
0.15282 0.4898 lineto
0.16274 0.46113 lineto
0.18258 0.39413 lineto
0.20242 0.32257 lineto
0.22226 0.25654 lineto
0.23218 0.22846 lineto
0.2421 0.2049 lineto
0.24706 0.19505 lineto
0.25202 0.18659 lineto
0.25698 0.17956 lineto
0.26194 0.17401 lineto
0.26442 0.1718 lineto
0.2669 0.16997 lineto
0.26938 0.16852 lineto
0.27062 0.16793 lineto
0.27186 0.16744 lineto
0.2731 0.16705 lineto
0.27434 0.16675 lineto
0.27558 0.16654 lineto
0.27682 0.16643 lineto
0.27806 0.16641 lineto
0.2793 0.16648 lineto
0.28054 0.16665 lineto
0.28178 0.16691 lineto
0.28302 0.16726 lineto
0.28426 0.1677 lineto
0.28674 0.16886 lineto
0.28922 0.17037 lineto
0.2917 0.17222 lineto
0.29666 0.17695 lineto
0.30162 0.18297 lineto
0.31154 0.19854 lineto
0.32146 0.21815 lineto
0.3413 0.26572 lineto
0.38098 0.36481 lineto
0.3909 0.3845 lineto
0.40082 0.40049 lineto
0.40578 0.40693 lineto
0.41074 0.41224 lineto
0.4157 0.41638 lineto
0.41818 0.41801 lineto
0.42066 0.41934 lineto
0.42314 0.42036 lineto
0.42438 0.42076 lineto
0.42562 0.42109 lineto
0.42686 0.42133 lineto
0.4281 0.4215 lineto
0.42934 0.4216 lineto
0.43058 0.42162 lineto
0.43182 0.42157 lineto
0.43306 0.42144 lineto
0.4343 0.42123 lineto
0.43554 0.42095 lineto
0.43802 0.42017 lineto
0.4405 0.4191 lineto
0.44546 0.41611 lineto
0.45042 0.412 lineto
0.46034 0.40072 lineto
0.47026 0.38581 lineto
0.48018 0.36799 lineto
0.50002 0.32688 lineto
0.51986 0.28448 lineto
0.52978 0.26504 lineto
0.5397 0.24783 lineto
0.54962 0.23356 lineto
0.55458 0.22769 lineto
0.55954 0.22275 lineto
0.5645 0.21878 lineto
0.56698 0.21717 lineto
0.56946 0.21581 lineto
0.57194 0.21471 lineto
0.57318 0.21426 lineto
0.57442 0.21387 lineto
0.57566 0.21355 lineto
0.5769 0.21329 lineto
0.57814 0.21309 lineto
0.57938 0.21296 lineto
0.58062 0.2129 lineto
0.58186 0.2129 lineto
0.5831 0.21296 lineto
0.58434 0.21309 lineto
0.58559 0.21329 lineto
0.58683 0.21354 lineto
0.58931 0.21425 lineto
0.59179 0.21521 lineto
0.59427 0.21641 lineto
0.59923 0.21955 lineto
0.60419 0.22362 lineto
0.60915 0.22857 lineto
0.61907 0.24086 lineto
0.65875 0.30991 lineto
0.67859 0.34567 lineto
0.68851 0.36117 lineto
0.69843 0.37421 lineto
0.70339 0.37964 lineto
0.70835 0.38428 lineto
0.71331 0.38807 lineto
0.71579 0.38964 lineto
0.71827 0.39098 lineto
0.72075 0.3921 lineto
0.72323 0.393 lineto
0.72447 0.39336 lineto
0.72571 0.39366 lineto
0.72695 0.39391 lineto
0.72819 0.39409 lineto
0.72943 0.39422 lineto
0.73067 0.39429 lineto
0.73191 0.39431 lineto
0.73315 0.39427 lineto
0.73439 0.39417 lineto
0.73563 0.39401 lineto
0.73687 0.39379 lineto
0.73811 0.39352 lineto
0.74059 0.39281 lineto
0.74307 0.39187 lineto
0.74803 0.38935 lineto
0.75299 0.38597 lineto
0.75795 0.38179 lineto
0.77779 0.35814 lineto
0.81747 0.29333 lineto
0.83731 0.26329 lineto
0.84723 0.25117 lineto
0.85219 0.24607 lineto
0.85715 0.24168 lineto
0.86211 0.23804 lineto
0.86707 0.23518 lineto
0.86955 0.23406 lineto
0.87203 0.23314 lineto
0.87451 0.23243 lineto
0.87575 0.23215 lineto
0.87699 0.23193 lineto
0.87823 0.23175 lineto
0.87947 0.23163 lineto
0.88071 0.23157 lineto
0.88195 0.23155 lineto
0.88319 0.23159 lineto
0.88443 0.23168 lineto
0.88567 0.23182 lineto
0.88691 0.23201 lineto
0.88939 0.23255 lineto
0.89187 0.2333 lineto
0.89683 0.2354 lineto
0.90179 0.23828 lineto
0.90675 0.2419 lineto
0.91667 0.25121 lineto
0.93651 0.27643 lineto
0.97619 0.33655 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30919 lineto
0.0437 0.38024 lineto
0.06354 0.44216 lineto
0.07346 0.46716 lineto
0.08338 0.48712 lineto
0.08834 0.49501 lineto
0.0933 0.50143 lineto
0.09578 0.50408 lineto
0.09826 0.50634 lineto
0.10074 0.50822 lineto
0.10322 0.50971 lineto
0.10446 0.51031 lineto
0.1057 0.51082 lineto
0.10694 0.51122 lineto
0.10818 0.51153 lineto
0.10942 0.51174 lineto
0.11066 0.51185 lineto
0.1119 0.51187 lineto
0.11314 0.51179 lineto
0.11438 0.51161 lineto
0.11562 0.51134 lineto
0.11686 0.51097 lineto
0.1181 0.5105 lineto
0.12058 0.50929 lineto
0.12306 0.5077 lineto
0.12802 0.50341 lineto
0.13298 0.4977 lineto
0.1429 0.48225 lineto
0.15282 0.46199 lineto
0.16274 0.43773 lineto
0.18258 0.38104 lineto
0.20242 0.32049 lineto
0.22226 0.26462 lineto
0.23218 0.24085 lineto
0.2421 0.22092 lineto
0.24706 0.21259 lineto
0.25202 0.20542 lineto
0.25698 0.19948 lineto
0.26194 0.19478 lineto
0.26442 0.19291 lineto
0.2669 0.19136 lineto
0.26938 0.19013 lineto
0.27062 0.18964 lineto
0.27186 0.18922 lineto
0.2731 0.18889 lineto
0.27434 0.18863 lineto
0.27558 0.18846 lineto
0.27682 0.18836 lineto
0.27806 0.18835 lineto
0.2793 0.18841 lineto
0.28054 0.18855 lineto
0.28178 0.18877 lineto
0.28302 0.18907 lineto
0.28426 0.18944 lineto
0.28674 0.19042 lineto
0.28922 0.1917 lineto
0.2917 0.19327 lineto
0.29666 0.19727 lineto
0.30162 0.20236 lineto
0.31154 0.21553 lineto
0.32146 0.23213 lineto
0.3413 0.27238 lineto
0.38098 0.35622 lineto
0.3909 0.37288 lineto
0.40082 0.38642 lineto
0.40578 0.39186 lineto
0.41074 0.39636 lineto
0.4157 0.39986 lineto
0.41818 0.40124 lineto
0.42066 0.40237 lineto
0.42314 0.40323 lineto
0.42438 0.40357 lineto
0.42562 0.40384 lineto
0.42686 0.40405 lineto
0.4281 0.4042 lineto
0.42934 0.40428 lineto
0.43058 0.4043 lineto
0.43182 0.40425 lineto
0.43306 0.40414 lineto
0.4343 0.40397 lineto
0.43554 0.40373 lineto
0.43802 0.40307 lineto
0.4405 0.40217 lineto
0.44546 0.39963 lineto
0.45042 0.39616 lineto
0.46034 0.38661 lineto
0.47026 0.374 lineto
0.48018 0.35891 lineto
0.50002 0.32413 lineto
0.51986 0.28826 lineto
0.52978 0.2718 lineto
0.5397 0.25725 lineto
0.54962 0.24517 lineto
0.55458 0.2402 lineto
0.55954 0.23602 lineto
0.5645 0.23266 lineto
0.56698 0.2313 lineto
0.56946 0.23015 lineto
0.57194 0.22922 lineto
0.57318 0.22884 lineto
0.57442 0.22851 lineto
0.57566 0.22823 lineto
0.5769 0.22801 lineto
0.57814 0.22785 lineto
0.57938 0.22774 lineto
0.58062 0.22769 lineto
0.58186 0.22769 lineto
0.5831 0.22774 lineto
0.58434 0.22785 lineto
0.58559 0.22801 lineto
0.58683 0.22823 lineto
0.58931 0.22883 lineto
0.59179 0.22964 lineto
0.59427 0.23066 lineto
0.59923 0.23331 lineto
0.60419 0.23676 lineto
0.60915 0.24094 lineto
0.61907 0.25134 lineto
0.65875 0.30978 lineto
0.67859 0.34003 lineto
0.68851 0.35314 lineto
0.69843 0.36418 lineto
0.70339 0.36878 lineto
0.70835 0.3727 lineto
0.71331 0.37591 lineto
0.71579 0.37723 lineto
0.71827 0.37837 lineto
0.72075 0.37932 lineto
0.72323 0.38008 lineto
0.72447 0.38038 lineto
0.72571 0.38064 lineto
0.72695 0.38085 lineto
0.72819 0.381 lineto
0.72943 0.38111 lineto
0.73067 0.38117 lineto
0.73191 0.38119 lineto
0.73315 0.38115 lineto
0.73439 0.38107 lineto
0.73563 0.38093 lineto
0.73687 0.38075 lineto
0.73811 0.38052 lineto
0.74059 0.37992 lineto
0.74307 0.37913 lineto
0.74803 0.37699 lineto
0.75299 0.37413 lineto
0.75795 0.3706 lineto
0.77779 0.35058 lineto
0.81747 0.29574 lineto
0.83731 0.27033 lineto
0.84723 0.26007 lineto
0.85219 0.25576 lineto
0.85715 0.25204 lineto
0.86211 0.24896 lineto
0.86707 0.24654 lineto
0.86955 0.24559 lineto
0.87203 0.24481 lineto
0.87451 0.24421 lineto
0.87575 0.24398 lineto
0.87699 0.24379 lineto
0.87823 0.24364 lineto
0.87947 0.24354 lineto
0.88071 0.24348 lineto
0.88195 0.24347 lineto
0.88319 0.2435 lineto
0.88443 0.24358 lineto
0.88567 0.2437 lineto
0.88691 0.24386 lineto
0.88939 0.24432 lineto
0.89187 0.24495 lineto
0.89683 0.24672 lineto
0.90179 0.24916 lineto
0.90675 0.25223 lineto
0.91667 0.2601 lineto
0.93651 0.28144 lineto
0.97619 0.33232 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30916 lineto
0.0437 0.36729 lineto
0.06354 0.41795 lineto
0.07346 0.43841 lineto
0.08338 0.45473 lineto
0.08834 0.46119 lineto
0.0933 0.46645 lineto
0.09578 0.46861 lineto
0.09826 0.47046 lineto
0.10074 0.472 lineto
0.10322 0.47322 lineto
0.10446 0.47371 lineto
0.1057 0.47413 lineto
0.10694 0.47446 lineto
0.10818 0.47471 lineto
0.10942 0.47488 lineto
0.11066 0.47497 lineto
0.1119 0.47499 lineto
0.11314 0.47492 lineto
0.11438 0.47478 lineto
0.11562 0.47455 lineto
0.11686 0.47425 lineto
0.1181 0.47387 lineto
0.12058 0.47288 lineto
0.12306 0.47157 lineto
0.12802 0.46807 lineto
0.13298 0.46339 lineto
0.1429 0.45075 lineto
0.15282 0.43418 lineto
0.16274 0.41433 lineto
0.18258 0.36794 lineto
0.20242 0.3184 lineto
0.22226 0.27269 lineto
0.23218 0.25324 lineto
0.2421 0.23694 lineto
0.24706 0.23012 lineto
0.25202 0.22426 lineto
0.25698 0.21939 lineto
0.26194 0.21555 lineto
0.26442 0.21402 lineto
0.2669 0.21275 lineto
0.26938 0.21175 lineto
0.27062 0.21134 lineto
0.27186 0.211 lineto
0.2731 0.21073 lineto
0.27434 0.21052 lineto
0.27558 0.21038 lineto
0.27682 0.2103 lineto
0.27806 0.21029 lineto
0.2793 0.21034 lineto
0.28054 0.21046 lineto
0.28178 0.21064 lineto
0.28302 0.21088 lineto
0.28426 0.21118 lineto
0.28674 0.21198 lineto
0.28922 0.21303 lineto
0.2917 0.21431 lineto
0.29666 0.21759 lineto
0.30162 0.22175 lineto
0.31154 0.23253 lineto
0.32146 0.24611 lineto
0.3413 0.27904 lineto
0.38098 0.34764 lineto
0.3909 0.36127 lineto
0.40082 0.37235 lineto
0.40578 0.3768 lineto
0.41074 0.38048 lineto
0.4157 0.38335 lineto
0.41818 0.38447 lineto
0.42066 0.38539 lineto
0.42314 0.3861 lineto
0.42438 0.38638 lineto
0.42562 0.3866 lineto
0.42686 0.38677 lineto
0.4281 0.38689 lineto
0.42934 0.38696 lineto
0.43058 0.38697 lineto
0.43182 0.38694 lineto
0.43306 0.38685 lineto
0.4343 0.3867 lineto
0.43554 0.38651 lineto
0.43802 0.38597 lineto
0.4405 0.38523 lineto
0.44546 0.38316 lineto
0.45042 0.38031 lineto
0.46034 0.3725 lineto
0.47026 0.36218 lineto
0.48018 0.34984 lineto
0.50002 0.32138 lineto
0.51986 0.29203 lineto
0.52978 0.27857 lineto
0.5397 0.26666 lineto
0.54962 0.25677 lineto
0.55458 0.25271 lineto
0.55954 0.24929 lineto
0.5645 0.24655 lineto
0.56698 0.24543 lineto
0.56946 0.24449 lineto
0.57194 0.24373 lineto
0.57318 0.24341 lineto
0.57442 0.24315 lineto
0.57566 0.24292 lineto
0.5769 0.24274 lineto
0.57814 0.24261 lineto
0.57938 0.24252 lineto
0.58062 0.24247 lineto
0.58186 0.24247 lineto
0.5831 0.24252 lineto
0.58434 0.24261 lineto
0.58559 0.24274 lineto
0.58683 0.24292 lineto
0.58931 0.24341 lineto
0.59179 0.24407 lineto
0.59427 0.24491 lineto
0.59923 0.24708 lineto
0.60419 0.24989 lineto
0.60915 0.25332 lineto
0.61907 0.26183 lineto
0.65875 0.30964 lineto
0.67859 0.33439 lineto
0.68851 0.34512 lineto
0.69843 0.35415 lineto
0.70339 0.35791 lineto
0.70835 0.36112 lineto
0.71331 0.36375 lineto
0.71579 0.36483 lineto
0.71827 0.36576 lineto
0.72075 0.36654 lineto
0.72323 0.36716 lineto
0.72447 0.36741 lineto
0.72571 0.36762 lineto
0.72695 0.36779 lineto
0.72819 0.36792 lineto
0.72943 0.36801 lineto
0.73067 0.36806 lineto
0.73191 0.36807 lineto
0.73315 0.36804 lineto
0.73439 0.36797 lineto
0.73563 0.36786 lineto
0.73687 0.36771 lineto
0.73811 0.36752 lineto
0.74059 0.36703 lineto
0.74307 0.36638 lineto
0.74803 0.36463 lineto
0.75299 0.36229 lineto
0.75795 0.3594 lineto
0.77779 0.34302 lineto
0.81747 0.29816 lineto
0.83731 0.27736 lineto
0.84723 0.26897 lineto
0.85219 0.26544 lineto
0.85715 0.2624 lineto
0.86211 0.25988 lineto
0.86707 0.2579 lineto
0.86955 0.25712 lineto
0.87203 0.25649 lineto
0.87451 0.25599 lineto
0.87575 0.2558 lineto
0.87699 0.25565 lineto
0.87823 0.25553 lineto
0.87947 0.25544 lineto
0.88071 0.2554 lineto
0.88195 0.25539 lineto
0.88319 0.25541 lineto
0.88443 0.25547 lineto
0.88567 0.25557 lineto
0.88691 0.25571 lineto
0.88939 0.25608 lineto
0.89187 0.2566 lineto
0.89683 0.25805 lineto
0.90179 0.26004 lineto
0.90675 0.26255 lineto
0.91667 0.269 lineto
0.93651 0.28645 lineto
0.97619 0.32808 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30913 lineto
0.0437 0.35434 lineto
0.06354 0.39374 lineto
0.07346 0.40965 lineto
0.08338 0.42235 lineto
0.08834 0.42737 lineto
0.0933 0.43146 lineto
0.09578 0.43315 lineto
0.09826 0.43459 lineto
0.10074 0.43578 lineto
0.10322 0.43673 lineto
0.10446 0.43711 lineto
0.1057 0.43743 lineto
0.10694 0.43769 lineto
0.10818 0.43789 lineto
0.10942 0.43802 lineto
0.11066 0.43809 lineto
0.1119 0.43811 lineto
0.11314 0.43805 lineto
0.11438 0.43794 lineto
0.11562 0.43777 lineto
0.11686 0.43753 lineto
0.1181 0.43724 lineto
0.12058 0.43646 lineto
0.12306 0.43545 lineto
0.12802 0.43272 lineto
0.13298 0.42909 lineto
0.1429 0.41925 lineto
0.15282 0.40636 lineto
0.16274 0.39093 lineto
0.18258 0.35485 lineto
0.20242 0.31632 lineto
0.22226 0.28076 lineto
0.23218 0.26564 lineto
0.2421 0.25295 lineto
0.24706 0.24765 lineto
0.25202 0.24309 lineto
0.25698 0.23931 lineto
0.26194 0.23632 lineto
0.26442 0.23513 lineto
0.2669 0.23414 lineto
0.26938 0.23336 lineto
0.27062 0.23305 lineto
0.27186 0.23278 lineto
0.2731 0.23257 lineto
0.27434 0.23241 lineto
0.27558 0.2323 lineto
0.27682 0.23224 lineto
0.27806 0.23223 lineto
0.2793 0.23227 lineto
0.28054 0.23236 lineto
0.28178 0.2325 lineto
0.28302 0.23269 lineto
0.28426 0.23293 lineto
0.28674 0.23355 lineto
0.28922 0.23436 lineto
0.2917 0.23536 lineto
0.29666 0.23791 lineto
0.30162 0.24115 lineto
0.31154 0.24953 lineto
0.32146 0.26009 lineto
0.3413 0.2857 lineto
0.38098 0.33906 lineto
0.3909 0.34966 lineto
0.40082 0.35827 lineto
0.40578 0.36174 lineto
0.41074 0.3646 lineto
0.4157 0.36683 lineto
0.41818 0.36771 lineto
0.42066 0.36842 lineto
0.42314 0.36897 lineto
0.42438 0.36919 lineto
0.42562 0.36936 lineto
0.42686 0.36949 lineto
0.4281 0.36959 lineto
0.42934 0.36964 lineto
0.43058 0.36965 lineto
0.43182 0.36962 lineto
0.43306 0.36955 lineto
0.4343 0.36944 lineto
0.43554 0.36929 lineto
0.43802 0.36887 lineto
0.4405 0.36829 lineto
0.44546 0.36668 lineto
0.45042 0.36447 lineto
0.46034 0.35839 lineto
0.47026 0.35037 lineto
0.48018 0.34077 lineto
0.50002 0.31863 lineto
0.51986 0.29581 lineto
0.52978 0.28534 lineto
0.5397 0.27607 lineto
0.54962 0.26838 lineto
0.55458 0.26523 lineto
0.55954 0.26257 lineto
0.5645 0.26043 lineto
0.56698 0.25956 lineto
0.56946 0.25883 lineto
0.57194 0.25824 lineto
0.57318 0.25799 lineto
0.57442 0.25778 lineto
0.57566 0.25761 lineto
0.5769 0.25747 lineto
0.57814 0.25737 lineto
0.57938 0.2573 lineto
0.58062 0.25726 lineto
0.58186 0.25726 lineto
0.5831 0.2573 lineto
0.58434 0.25737 lineto
0.58559 0.25747 lineto
0.58683 0.25761 lineto
0.58931 0.25799 lineto
0.59179 0.2585 lineto
0.59427 0.25915 lineto
0.59923 0.26084 lineto
0.60419 0.26303 lineto
0.60915 0.2657 lineto
0.61907 0.27232 lineto
0.65875 0.3095 lineto
0.67859 0.32875 lineto
0.68851 0.3371 lineto
0.69843 0.34412 lineto
0.70339 0.34705 lineto
0.70835 0.34954 lineto
0.71331 0.35158 lineto
0.71579 0.35243 lineto
0.71827 0.35315 lineto
0.72075 0.35376 lineto
0.72323 0.35424 lineto
0.72447 0.35443 lineto
0.72571 0.35459 lineto
0.72695 0.35473 lineto
0.72819 0.35483 lineto
0.72943 0.3549 lineto
0.73067 0.35494 lineto
0.73191 0.35494 lineto
0.73315 0.35492 lineto
0.73439 0.35487 lineto
0.73563 0.35478 lineto
0.73687 0.35467 lineto
0.73811 0.35452 lineto
0.74059 0.35414 lineto
0.74307 0.35363 lineto
0.74803 0.35227 lineto
0.75299 0.35045 lineto
0.75795 0.3482 lineto
0.77779 0.33547 lineto
0.81747 0.30057 lineto
0.83731 0.2844 lineto
0.84723 0.27787 lineto
0.85219 0.27512 lineto
0.85715 0.27276 lineto
0.86211 0.2708 lineto
0.86707 0.26926 lineto
0.86955 0.26865 lineto
0.87203 0.26816 lineto
0.87451 0.26778 lineto
0.87575 0.26763 lineto
0.87699 0.26751 lineto
0.87823 0.26741 lineto
0.87947 0.26735 lineto
0.88071 0.26731 lineto
0.88195 0.2673 lineto
0.88319 0.26732 lineto
0.88443 0.26737 lineto
0.88567 0.26745 lineto
0.88691 0.26755 lineto
0.88939 0.26784 lineto
0.89187 0.26825 lineto
0.89683 0.26938 lineto
0.90179 0.27093 lineto
0.90675 0.27288 lineto
0.91667 0.27789 lineto
0.93651 0.29147 lineto
0.97619 0.32384 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.3091 lineto
0.0437 0.34139 lineto
0.06354 0.36954 lineto
0.07346 0.3809 lineto
0.08338 0.38997 lineto
0.08834 0.39356 lineto
0.0933 0.39648 lineto
0.09578 0.39768 lineto
0.09826 0.39871 lineto
0.10074 0.39956 lineto
0.10322 0.40024 lineto
0.10446 0.40052 lineto
0.1057 0.40074 lineto
0.10694 0.40093 lineto
0.10818 0.40107 lineto
0.10942 0.40116 lineto
0.11066 0.40122 lineto
0.1119 0.40122 lineto
0.11314 0.40119 lineto
0.11438 0.40111 lineto
0.11562 0.40098 lineto
0.11686 0.40081 lineto
0.1181 0.4006 lineto
0.12058 0.40005 lineto
0.12306 0.39933 lineto
0.12802 0.39738 lineto
0.13298 0.39478 lineto
0.1429 0.38776 lineto
0.15282 0.37855 lineto
0.16274 0.36752 lineto
0.18258 0.34175 lineto
0.20242 0.31423 lineto
0.22226 0.28883 lineto
0.23218 0.27803 lineto
0.2421 0.26897 lineto
0.24706 0.26518 lineto
0.25202 0.26193 lineto
0.25698 0.25923 lineto
0.26194 0.25709 lineto
0.26442 0.25624 lineto
0.2669 0.25554 lineto
0.26938 0.25498 lineto
0.27062 0.25475 lineto
0.27186 0.25456 lineto
0.2731 0.25441 lineto
0.27434 0.2543 lineto
0.27558 0.25422 lineto
0.27682 0.25418 lineto
0.27806 0.25417 lineto
0.2793 0.2542 lineto
0.28054 0.25426 lineto
0.28178 0.25436 lineto
0.28302 0.2545 lineto
0.28426 0.25467 lineto
0.28674 0.25511 lineto
0.28922 0.25569 lineto
0.2917 0.2564 lineto
0.29666 0.25822 lineto
0.30162 0.26054 lineto
0.31154 0.26652 lineto
0.32146 0.27407 lineto
0.3413 0.29236 lineto
0.38098 0.33047 lineto
0.3909 0.33805 lineto
0.40082 0.3442 lineto
0.40578 0.34667 lineto
0.41074 0.34872 lineto
0.4157 0.35031 lineto
0.41818 0.35094 lineto
0.42066 0.35145 lineto
0.42314 0.35184 lineto
0.42438 0.352 lineto
0.42562 0.35212 lineto
0.42686 0.35222 lineto
0.4281 0.35228 lineto
0.42934 0.35232 lineto
0.43058 0.35233 lineto
0.43182 0.35231 lineto
0.43306 0.35226 lineto
0.4343 0.35218 lineto
0.43554 0.35207 lineto
0.43802 0.35177 lineto
0.4405 0.35136 lineto
0.44546 0.3502 lineto
0.45042 0.34863 lineto
0.46034 0.34429 lineto
0.47026 0.33855 lineto
0.48018 0.3317 lineto
0.50002 0.31589 lineto
0.51986 0.29958 lineto
0.52978 0.2921 lineto
0.5397 0.28548 lineto
0.54962 0.27999 lineto
0.55458 0.27774 lineto
0.55954 0.27584 lineto
0.5645 0.27431 lineto
0.56698 0.27369 lineto
0.56946 0.27317 lineto
0.57194 0.27275 lineto
0.57318 0.27257 lineto
0.57442 0.27242 lineto
0.57566 0.2723 lineto
0.5769 0.2722 lineto
0.57814 0.27212 lineto
0.57938 0.27207 lineto
0.58062 0.27205 lineto
0.58186 0.27205 lineto
0.5831 0.27207 lineto
0.58434 0.27212 lineto
0.58559 0.2722 lineto
0.58683 0.2723 lineto
0.58931 0.27257 lineto
0.59179 0.27294 lineto
0.59427 0.2734 lineto
0.59923 0.27461 lineto
0.60419 0.27617 lineto
0.60915 0.27807 lineto
0.61907 0.2828 lineto
0.65875 0.30936 lineto
0.67859 0.32311 lineto
0.68851 0.32907 lineto
0.69843 0.33409 lineto
0.70339 0.33618 lineto
0.70835 0.33796 lineto
0.71331 0.33942 lineto
0.71579 0.34002 lineto
0.71827 0.34054 lineto
0.72075 0.34097 lineto
0.72323 0.34132 lineto
0.72447 0.34146 lineto
0.72571 0.34157 lineto
0.72695 0.34167 lineto
0.72819 0.34174 lineto
0.72943 0.34179 lineto
0.73067 0.34182 lineto
0.73191 0.34182 lineto
0.73315 0.34181 lineto
0.73439 0.34177 lineto
0.73563 0.34171 lineto
0.73687 0.34162 lineto
0.73811 0.34152 lineto
0.74059 0.34124 lineto
0.74307 0.34088 lineto
0.74803 0.33991 lineto
0.75299 0.33861 lineto
0.75795 0.33701 lineto
0.77779 0.32791 lineto
0.81747 0.30298 lineto
0.83731 0.29143 lineto
0.84723 0.28677 lineto
0.85219 0.28481 lineto
0.85715 0.28312 lineto
0.86211 0.28172 lineto
0.86707 0.28062 lineto
0.86955 0.28019 lineto
0.87203 0.27983 lineto
0.87451 0.27956 lineto
0.87575 0.27945 lineto
0.87699 0.27937 lineto
0.87823 0.2793 lineto
0.87947 0.27925 lineto
0.88071 0.27923 lineto
0.88195 0.27922 lineto
0.88319 0.27924 lineto
0.88443 0.27927 lineto
0.88567 0.27933 lineto
0.88691 0.2794 lineto
0.88939 0.27961 lineto
0.89187 0.2799 lineto
0.89683 0.2807 lineto
0.90179 0.28181 lineto
0.90675 0.2832 lineto
0.91667 0.28678 lineto
0.93651 0.29648 lineto
0.97619 0.31961 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30906 lineto
0.0437 0.32844 lineto
0.06354 0.34533 lineto
0.07346 0.35215 lineto
0.08338 0.35759 lineto
0.08834 0.35974 lineto
0.0933 0.36149 lineto
0.09578 0.36222 lineto
0.09826 0.36283 lineto
0.10074 0.36335 lineto
0.10322 0.36375 lineto
0.10446 0.36392 lineto
0.1057 0.36405 lineto
0.10694 0.36416 lineto
0.10818 0.36425 lineto
0.10942 0.36431 lineto
0.11066 0.36434 lineto
0.1119 0.36434 lineto
0.11314 0.36432 lineto
0.11438 0.36427 lineto
0.11562 0.3642 lineto
0.11686 0.36409 lineto
0.1181 0.36397 lineto
0.12058 0.36364 lineto
0.12306 0.3632 lineto
0.12802 0.36203 lineto
0.13298 0.36048 lineto
0.1429 0.35626 lineto
0.15282 0.35074 lineto
0.16274 0.34412 lineto
0.18258 0.32866 lineto
0.20242 0.31214 lineto
0.22226 0.29691 lineto
0.23218 0.29043 lineto
0.2421 0.28499 lineto
0.24706 0.28272 lineto
0.25202 0.28076 lineto
0.25698 0.27914 lineto
0.26194 0.27786 lineto
0.26442 0.27735 lineto
0.2669 0.27693 lineto
0.26938 0.27659 lineto
0.27062 0.27646 lineto
0.27186 0.27635 lineto
0.2731 0.27625 lineto
0.27434 0.27619 lineto
0.27558 0.27614 lineto
0.27682 0.27611 lineto
0.27806 0.27611 lineto
0.2793 0.27612 lineto
0.28054 0.27616 lineto
0.28178 0.27622 lineto
0.28302 0.2763 lineto
0.28426 0.27641 lineto
0.28674 0.27667 lineto
0.28922 0.27702 lineto
0.2917 0.27745 lineto
0.29666 0.27854 lineto
0.30162 0.27993 lineto
0.31154 0.28352 lineto
0.32146 0.28805 lineto
0.3413 0.29902 lineto
0.38098 0.32189 lineto
0.3909 0.32644 lineto
0.40082 0.33013 lineto
0.40578 0.33161 lineto
0.41074 0.33284 lineto
0.4157 0.33379 lineto
0.41818 0.33417 lineto
0.42066 0.33448 lineto
0.42314 0.33471 lineto
0.42438 0.3348 lineto
0.42562 0.33488 lineto
0.42686 0.33494 lineto
0.4281 0.33498 lineto
0.42934 0.335 lineto
0.43058 0.335 lineto
0.43182 0.33499 lineto
0.43306 0.33496 lineto
0.4343 0.33491 lineto
0.43554 0.33485 lineto
0.43802 0.33467 lineto
0.4405 0.33442 lineto
0.44546 0.33373 lineto
0.45042 0.33278 lineto
0.46034 0.33018 lineto
0.47026 0.32674 lineto
0.48018 0.32263 lineto
0.50002 0.31314 lineto
0.51986 0.30336 lineto
0.52978 0.29887 lineto
0.5397 0.2949 lineto
0.54962 0.2916 lineto
0.55458 0.29025 lineto
0.55954 0.28911 lineto
0.5645 0.28819 lineto
0.56698 0.28782 lineto
0.56946 0.28751 lineto
0.57194 0.28725 lineto
0.57318 0.28715 lineto
0.57442 0.28706 lineto
0.57566 0.28699 lineto
0.5769 0.28693 lineto
0.57814 0.28688 lineto
0.57938 0.28685 lineto
0.58062 0.28684 lineto
0.58186 0.28684 lineto
0.5831 0.28685 lineto
0.58434 0.28688 lineto
0.58559 0.28693 lineto
0.58683 0.28698 lineto
0.58931 0.28715 lineto
0.59179 0.28737 lineto
0.59427 0.28765 lineto
0.59923 0.28837 lineto
0.60419 0.28931 lineto
0.60915 0.29045 lineto
0.61907 0.29329 lineto
0.65875 0.30922 lineto
0.67859 0.31748 lineto
0.68851 0.32105 lineto
0.69843 0.32406 lineto
0.70339 0.32532 lineto
0.70835 0.32638 lineto
0.71331 0.32726 lineto
0.71579 0.32762 lineto
0.71827 0.32793 lineto
0.72075 0.32819 lineto
0.72323 0.3284 lineto
0.72447 0.32848 lineto
0.72571 0.32855 lineto
0.72695 0.32861 lineto
0.72819 0.32865 lineto
0.72943 0.32868 lineto
0.73067 0.3287 lineto
0.73191 0.3287 lineto
0.73315 0.32869 lineto
0.73439 0.32867 lineto
0.73563 0.32863 lineto
0.73687 0.32858 lineto
0.73811 0.32852 lineto
0.74059 0.32835 lineto
0.74307 0.32814 lineto
0.74803 0.32755 lineto
0.75299 0.32678 lineto
0.75795 0.32581 lineto
0.77779 0.32035 lineto
0.81747 0.3054 lineto
0.83731 0.29846 lineto
0.84723 0.29567 lineto
0.85219 0.29449 lineto
0.85715 0.29348 lineto
0.86211 0.29264 lineto
0.86707 0.29198 lineto
0.86955 0.29172 lineto
0.87203 0.29151 lineto
0.87451 0.29134 lineto
0.87575 0.29128 lineto
0.87699 0.29123 lineto
0.87823 0.29119 lineto
0.87947 0.29116 lineto
0.88071 0.29114 lineto
0.88195 0.29114 lineto
0.88319 0.29115 lineto
0.88443 0.29117 lineto
0.88567 0.2912 lineto
0.88691 0.29125 lineto
0.88939 0.29137 lineto
0.89187 0.29154 lineto
0.89683 0.29203 lineto
0.90179 0.29269 lineto
0.90675 0.29353 lineto
0.91667 0.29568 lineto
0.93651 0.3015 lineto
0.97619 0.31537 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30903 lineto
0.0437 0.31549 lineto
0.06354 0.32112 lineto
0.07346 0.32339 lineto
0.08338 0.32521 lineto
0.08834 0.32593 lineto
0.0933 0.32651 lineto
0.09578 0.32675 lineto
0.09826 0.32696 lineto
0.10074 0.32713 lineto
0.10322 0.32726 lineto
0.10446 0.32732 lineto
0.1057 0.32736 lineto
0.10694 0.3274 lineto
0.10818 0.32743 lineto
0.10942 0.32745 lineto
0.11066 0.32746 lineto
0.1119 0.32746 lineto
0.11314 0.32745 lineto
0.11438 0.32743 lineto
0.11562 0.32741 lineto
0.11686 0.32738 lineto
0.1181 0.32733 lineto
0.12058 0.32722 lineto
0.12306 0.32708 lineto
0.12802 0.32669 lineto
0.13298 0.32617 lineto
0.1429 0.32477 lineto
0.15282 0.32292 lineto
0.16274 0.32072 lineto
0.18258 0.31556 lineto
0.20242 0.31006 lineto
0.22226 0.30498 lineto
0.23218 0.30282 lineto
0.2421 0.30101 lineto
0.24706 0.30025 lineto
0.25202 0.2996 lineto
0.25698 0.29906 lineto
0.26194 0.29863 lineto
0.26442 0.29846 lineto
0.2669 0.29832 lineto
0.26938 0.29821 lineto
0.27062 0.29816 lineto
0.27186 0.29813 lineto
0.2731 0.2981 lineto
0.27434 0.29807 lineto
0.27558 0.29806 lineto
0.27682 0.29805 lineto
0.27806 0.29805 lineto
0.2793 0.29805 lineto
0.28054 0.29807 lineto
0.28178 0.29809 lineto
0.28302 0.29811 lineto
0.28426 0.29815 lineto
0.28674 0.29824 lineto
0.28922 0.29835 lineto
0.2917 0.29849 lineto
0.29666 0.29886 lineto
0.30162 0.29932 lineto
0.31154 0.30052 lineto
0.32146 0.30203 lineto
0.3413 0.30569 lineto
0.38098 0.31331 lineto
0.3909 0.31482 lineto
0.40082 0.31605 lineto
0.40578 0.31655 lineto
0.41074 0.31696 lineto
0.4157 0.31728 lineto
0.41818 0.3174 lineto
0.42066 0.3175 lineto
0.42314 0.31758 lineto
0.42438 0.31761 lineto
0.42562 0.31764 lineto
0.42686 0.31766 lineto
0.4281 0.31767 lineto
0.42934 0.31768 lineto
0.43058 0.31768 lineto
0.43182 0.31767 lineto
0.43306 0.31766 lineto
0.4343 0.31765 lineto
0.43554 0.31763 lineto
0.43802 0.31757 lineto
0.4405 0.31749 lineto
0.44546 0.31725 lineto
0.45042 0.31694 lineto
0.46034 0.31607 lineto
0.47026 0.31492 lineto
0.48018 0.31355 lineto
0.50002 0.31039 lineto
0.51986 0.30713 lineto
0.52978 0.30563 lineto
0.5397 0.30431 lineto
0.54962 0.30321 lineto
0.55458 0.30276 lineto
0.55954 0.30238 lineto
0.5645 0.30208 lineto
0.56698 0.30195 lineto
0.56946 0.30185 lineto
0.57194 0.30176 lineto
0.57318 0.30173 lineto
0.57442 0.3017 lineto
0.57566 0.30167 lineto
0.5769 0.30165 lineto
0.57814 0.30164 lineto
0.57938 0.30163 lineto
0.58062 0.30162 lineto
0.58186 0.30162 lineto
0.5831 0.30163 lineto
0.58434 0.30164 lineto
0.58559 0.30165 lineto
0.58683 0.30167 lineto
0.58931 0.30173 lineto
0.59179 0.3018 lineto
0.59427 0.30189 lineto
0.59923 0.30213 lineto
0.60419 0.30245 lineto
0.60915 0.30283 lineto
0.61907 0.30377 lineto
0.65875 0.30909 lineto
0.67859 0.31184 lineto
0.68851 0.31303 lineto
0.69843 0.31403 lineto
0.70339 0.31445 lineto
0.70835 0.31481 lineto
0.71331 0.3151 lineto
0.71579 0.31522 lineto
0.71827 0.31532 lineto
0.72075 0.31541 lineto
0.72323 0.31548 lineto
0.72447 0.3155 lineto
0.72571 0.31553 lineto
0.72695 0.31555 lineto
0.72819 0.31556 lineto
0.72943 0.31557 lineto
0.73067 0.31558 lineto
0.73191 0.31558 lineto
0.73315 0.31557 lineto
0.73439 0.31557 lineto
0.73563 0.31555 lineto
0.73687 0.31554 lineto
0.73811 0.31552 lineto
0.74059 0.31546 lineto
0.74307 0.31539 lineto
0.74803 0.3152 lineto
0.75299 0.31494 lineto
0.75795 0.31462 lineto
0.77779 0.3128 lineto
0.81747 0.30781 lineto
0.83731 0.3055 lineto
0.84723 0.30457 lineto
0.85219 0.30418 lineto
0.85715 0.30384 lineto
0.86211 0.30356 lineto
0.86707 0.30334 lineto
0.86955 0.30325 lineto
0.87203 0.30318 lineto
0.87451 0.30313 lineto
0.87575 0.3031 lineto
0.87699 0.30309 lineto
0.87823 0.30307 lineto
0.87947 0.30306 lineto
0.88071 0.30306 lineto
0.88195 0.30306 lineto
0.88319 0.30306 lineto
0.88443 0.30307 lineto
0.88567 0.30308 lineto
0.88691 0.30309 lineto
0.88939 0.30314 lineto
0.89187 0.30319 lineto
0.89683 0.30335 lineto
0.90179 0.30358 lineto
0.90675 0.30385 lineto
0.91667 0.30457 lineto
0.93651 0.30651 lineto
0.97619 0.31114 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.309 lineto
0.0437 0.30254 lineto
0.06354 0.29691 lineto
0.07346 0.29464 lineto
0.08338 0.29283 lineto
0.08834 0.29211 lineto
0.0933 0.29152 lineto
0.09578 0.29128 lineto
0.09826 0.29108 lineto
0.10074 0.29091 lineto
0.10322 0.29077 lineto
0.10446 0.29072 lineto
0.1057 0.29067 lineto
0.10694 0.29063 lineto
0.10818 0.29061 lineto
0.10942 0.29059 lineto
0.11066 0.29058 lineto
0.1119 0.29058 lineto
0.11314 0.29058 lineto
0.11438 0.2906 lineto
0.11562 0.29062 lineto
0.11686 0.29066 lineto
0.1181 0.2907 lineto
0.12058 0.29081 lineto
0.12306 0.29096 lineto
0.12802 0.29134 lineto
0.13298 0.29186 lineto
0.1429 0.29327 lineto
0.15282 0.29511 lineto
0.16274 0.29732 lineto
0.18258 0.30247 lineto
0.20242 0.30797 lineto
0.22226 0.31305 lineto
0.23218 0.31521 lineto
0.2421 0.31703 lineto
0.24706 0.31778 lineto
0.25202 0.31843 lineto
0.25698 0.31898 lineto
0.26194 0.3194 lineto
0.26442 0.31957 lineto
0.2669 0.31971 lineto
0.26938 0.31982 lineto
0.27062 0.31987 lineto
0.27186 0.31991 lineto
0.2731 0.31994 lineto
0.27434 0.31996 lineto
0.27558 0.31998 lineto
0.27682 0.31999 lineto
0.27806 0.31999 lineto
0.2793 0.31998 lineto
0.28054 0.31997 lineto
0.28178 0.31995 lineto
0.28302 0.31992 lineto
0.28426 0.31989 lineto
0.28674 0.3198 lineto
0.28922 0.31968 lineto
0.2917 0.31954 lineto
0.29666 0.31918 lineto
0.30162 0.31871 lineto
0.31154 0.31752 lineto
0.32146 0.31601 lineto
0.3413 0.31235 lineto
0.38098 0.30473 lineto
0.3909 0.30321 lineto
0.40082 0.30198 lineto
0.40578 0.30149 lineto
0.41074 0.30108 lineto
0.4157 0.30076 lineto
0.41818 0.30063 lineto
0.42066 0.30053 lineto
0.42314 0.30045 lineto
0.42438 0.30042 lineto
0.42562 0.3004 lineto
0.42686 0.30038 lineto
0.4281 0.30036 lineto
0.42934 0.30036 lineto
0.43058 0.30036 lineto
0.43182 0.30036 lineto
0.43306 0.30037 lineto
0.4343 0.30039 lineto
0.43554 0.30041 lineto
0.43802 0.30047 lineto
0.4405 0.30055 lineto
0.44546 0.30078 lineto
0.45042 0.3011 lineto
0.46034 0.30196 lineto
0.47026 0.30311 lineto
0.48018 0.30448 lineto
0.50002 0.30764 lineto
0.51986 0.3109 lineto
0.52978 0.3124 lineto
0.5397 0.31372 lineto
0.54962 0.31482 lineto
0.55458 0.31527 lineto
0.55954 0.31565 lineto
0.5645 0.31596 lineto
0.56698 0.31608 lineto
0.56946 0.31619 lineto
0.57194 0.31627 lineto
0.57318 0.31631 lineto
0.57442 0.31634 lineto
0.57566 0.31636 lineto
0.5769 0.31638 lineto
0.57814 0.3164 lineto
0.57938 0.31641 lineto
0.58062 0.31641 lineto
0.58186 0.31641 lineto
0.5831 0.31641 lineto
0.58434 0.3164 lineto
0.58559 0.31638 lineto
0.58683 0.31636 lineto
0.58931 0.31631 lineto
0.59179 0.31623 lineto
0.59427 0.31614 lineto
0.59923 0.3159 lineto
0.60419 0.31559 lineto
0.60915 0.31521 lineto
0.61907 0.31426 lineto
0.65875 0.30895 lineto
0.67859 0.3062 lineto
0.68851 0.30501 lineto
0.69843 0.304 lineto
0.70339 0.30358 lineto
0.70835 0.30323 lineto
0.71331 0.30294 lineto
0.71579 0.30282 lineto
0.71827 0.30271 lineto
0.72075 0.30263 lineto
0.72323 0.30256 lineto
0.72447 0.30253 lineto
0.72571 0.30251 lineto
0.72695 0.30249 lineto
0.72819 0.30247 lineto
0.72943 0.30246 lineto
0.73067 0.30246 lineto
0.73191 0.30246 lineto
0.73315 0.30246 lineto
0.73439 0.30247 lineto
0.73563 0.30248 lineto
0.73687 0.3025 lineto
0.73811 0.30252 lineto
0.74059 0.30257 lineto
0.74307 0.30264 lineto
0.74803 0.30284 lineto
0.75299 0.3031 lineto
0.75795 0.30342 lineto
0.77779 0.30524 lineto
0.81747 0.31022 lineto
0.83731 0.31253 lineto
0.84723 0.31347 lineto
0.85219 0.31386 lineto
0.85715 0.3142 lineto
0.86211 0.31448 lineto
0.86707 0.3147 lineto
0.86955 0.31478 lineto
0.87203 0.31485 lineto
0.87451 0.31491 lineto
0.87575 0.31493 lineto
0.87699 0.31495 lineto
0.87823 0.31496 lineto
0.87947 0.31497 lineto
0.88071 0.31497 lineto
0.88195 0.31498 lineto
0.88319 0.31497 lineto
0.88443 0.31497 lineto
0.88567 0.31496 lineto
0.88691 0.31494 lineto
0.88939 0.3149 lineto
0.89187 0.31484 lineto
0.89683 0.31468 lineto
0.90179 0.31446 lineto
0.90675 0.31418 lineto
0.91667 0.31346 lineto
0.93651 0.31152 lineto
0.97619 0.3069 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30897 lineto
0.0437 0.28959 lineto
0.06354 0.27271 lineto
0.07346 0.26589 lineto
0.08338 0.26044 lineto
0.08834 0.25829 lineto
0.0933 0.25654 lineto
0.09578 0.25582 lineto
0.09826 0.2552 lineto
0.10074 0.25469 lineto
0.10322 0.25428 lineto
0.10446 0.25412 lineto
0.1057 0.25398 lineto
0.10694 0.25387 lineto
0.10818 0.25379 lineto
0.10942 0.25373 lineto
0.11066 0.2537 lineto
0.1119 0.25369 lineto
0.11314 0.25372 lineto
0.11438 0.25376 lineto
0.11562 0.25384 lineto
0.11686 0.25394 lineto
0.1181 0.25407 lineto
0.12058 0.2544 lineto
0.12306 0.25483 lineto
0.12802 0.256 lineto
0.13298 0.25756 lineto
0.1429 0.26177 lineto
0.15282 0.2673 lineto
0.16274 0.27391 lineto
0.18258 0.28938 lineto
0.20242 0.30589 lineto
0.22226 0.32113 lineto
0.23218 0.32761 lineto
0.2421 0.33304 lineto
0.24706 0.33532 lineto
0.25202 0.33727 lineto
0.25698 0.33889 lineto
0.26194 0.34017 lineto
0.26442 0.34068 lineto
0.2669 0.34111 lineto
0.26938 0.34144 lineto
0.27062 0.34158 lineto
0.27186 0.34169 lineto
0.2731 0.34178 lineto
0.27434 0.34185 lineto
0.27558 0.3419 lineto
0.27682 0.34192 lineto
0.27806 0.34193 lineto
0.2793 0.34191 lineto
0.28054 0.34187 lineto
0.28178 0.34181 lineto
0.28302 0.34173 lineto
0.28426 0.34163 lineto
0.28674 0.34136 lineto
0.28922 0.34101 lineto
0.2917 0.34058 lineto
0.29666 0.33949 lineto
0.30162 0.3381 lineto
0.31154 0.33451 lineto
0.32146 0.32999 lineto
0.3413 0.31901 lineto
0.38098 0.29614 lineto
0.3909 0.2916 lineto
0.40082 0.28791 lineto
0.40578 0.28642 lineto
0.41074 0.2852 lineto
0.4157 0.28424 lineto
0.41818 0.28386 lineto
0.42066 0.28356 lineto
0.42314 0.28332 lineto
0.42438 0.28323 lineto
0.42562 0.28316 lineto
0.42686 0.2831 lineto
0.4281 0.28306 lineto
0.42934 0.28304 lineto
0.43058 0.28303 lineto
0.43182 0.28304 lineto
0.43306 0.28307 lineto
0.4343 0.28312 lineto
0.43554 0.28319 lineto
0.43802 0.28337 lineto
0.4405 0.28361 lineto
0.44546 0.2843 lineto
0.45042 0.28525 lineto
0.46034 0.28786 lineto
0.47026 0.2913 lineto
0.48018 0.29541 lineto
0.50002 0.3049 lineto
0.51986 0.31468 lineto
0.52978 0.31917 lineto
0.5397 0.32314 lineto
0.54962 0.32643 lineto
0.55458 0.32778 lineto
0.55954 0.32892 lineto
0.5645 0.32984 lineto
0.56698 0.33021 lineto
0.56946 0.33053 lineto
0.57194 0.33078 lineto
0.57318 0.33088 lineto
0.57442 0.33097 lineto
0.57566 0.33105 lineto
0.5769 0.33111 lineto
0.57814 0.33115 lineto
0.57938 0.33118 lineto
0.58062 0.3312 lineto
0.58186 0.3312 lineto
0.5831 0.33118 lineto
0.58434 0.33115 lineto
0.58559 0.33111 lineto
0.58683 0.33105 lineto
0.58931 0.33089 lineto
0.59179 0.33067 lineto
0.59427 0.33039 lineto
0.59923 0.32966 lineto
0.60419 0.32872 lineto
0.60915 0.32758 lineto
0.61907 0.32475 lineto
0.65875 0.30881 lineto
0.67859 0.30056 lineto
0.68851 0.29698 lineto
0.69843 0.29397 lineto
0.70339 0.29272 lineto
0.70835 0.29165 lineto
0.71331 0.29077 lineto
0.71579 0.29041 lineto
0.71827 0.2901 lineto
0.72075 0.28984 lineto
0.72323 0.28964 lineto
0.72447 0.28955 lineto
0.72571 0.28948 lineto
0.72695 0.28943 lineto
0.72819 0.28938 lineto
0.72943 0.28935 lineto
0.73067 0.28934 lineto
0.73191 0.28933 lineto
0.73315 0.28934 lineto
0.73439 0.28937 lineto
0.73563 0.2894 lineto
0.73687 0.28945 lineto
0.73811 0.28952 lineto
0.74059 0.28968 lineto
0.74307 0.2899 lineto
0.74803 0.29048 lineto
0.75299 0.29126 lineto
0.75795 0.29222 lineto
0.77779 0.29768 lineto
0.81747 0.31264 lineto
0.83731 0.31957 lineto
0.84723 0.32237 lineto
0.85219 0.32354 lineto
0.85715 0.32456 lineto
0.86211 0.3254 lineto
0.86707 0.32606 lineto
0.86955 0.32632 lineto
0.87203 0.32653 lineto
0.87451 0.32669 lineto
0.87575 0.32676 lineto
0.87699 0.32681 lineto
0.87823 0.32685 lineto
0.87947 0.32687 lineto
0.88071 0.32689 lineto
0.88195 0.32689 lineto
0.88319 0.32689 lineto
0.88443 0.32686 lineto
0.88567 0.32683 lineto
0.88691 0.32679 lineto
0.88939 0.32666 lineto
0.89187 0.32649 lineto
0.89683 0.32601 lineto
0.90179 0.32534 lineto
0.90675 0.32451 lineto
0.91667 0.32236 lineto
0.93651 0.31654 lineto
0.97619 0.30266 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30894 lineto
0.0437 0.27664 lineto
0.06354 0.2485 lineto
0.07346 0.23713 lineto
0.08338 0.22806 lineto
0.08834 0.22448 lineto
0.0933 0.22156 lineto
0.09578 0.22035 lineto
0.09826 0.21932 lineto
0.10074 0.21847 lineto
0.10322 0.21779 lineto
0.10446 0.21752 lineto
0.1057 0.21729 lineto
0.10694 0.21711 lineto
0.10818 0.21697 lineto
0.10942 0.21687 lineto
0.11066 0.21682 lineto
0.1119 0.21681 lineto
0.11314 0.21685 lineto
0.11438 0.21693 lineto
0.11562 0.21705 lineto
0.11686 0.21722 lineto
0.1181 0.21743 lineto
0.12058 0.21798 lineto
0.12306 0.21871 lineto
0.12802 0.22066 lineto
0.13298 0.22325 lineto
0.1429 0.23028 lineto
0.15282 0.23948 lineto
0.16274 0.25051 lineto
0.18258 0.27628 lineto
0.20242 0.3038 lineto
0.22226 0.3292 lineto
0.23218 0.34 lineto
0.2421 0.34906 lineto
0.24706 0.35285 lineto
0.25202 0.3561 lineto
0.25698 0.35881 lineto
0.26194 0.36094 lineto
0.26442 0.36179 lineto
0.2669 0.3625 lineto
0.26938 0.36306 lineto
0.27062 0.36328 lineto
0.27186 0.36347 lineto
0.2731 0.36362 lineto
0.27434 0.36374 lineto
0.27558 0.36382 lineto
0.27682 0.36386 lineto
0.27806 0.36387 lineto
0.2793 0.36384 lineto
0.28054 0.36377 lineto
0.28178 0.36367 lineto
0.28302 0.36354 lineto
0.28426 0.36337 lineto
0.28674 0.36292 lineto
0.28922 0.36234 lineto
0.2917 0.36163 lineto
0.29666 0.35981 lineto
0.30162 0.3575 lineto
0.31154 0.35151 lineto
0.32146 0.34397 lineto
0.3413 0.32567 lineto
0.38098 0.28756 lineto
0.3909 0.27999 lineto
0.40082 0.27383 lineto
0.40578 0.27136 lineto
0.41074 0.26932 lineto
0.4157 0.26772 lineto
0.41818 0.2671 lineto
0.42066 0.26659 lineto
0.42314 0.26619 lineto
0.42438 0.26604 lineto
0.42562 0.26591 lineto
0.42686 0.26582 lineto
0.4281 0.26575 lineto
0.42934 0.26572 lineto
0.43058 0.26571 lineto
0.43182 0.26573 lineto
0.43306 0.26578 lineto
0.4343 0.26586 lineto
0.43554 0.26596 lineto
0.43802 0.26626 lineto
0.4405 0.26668 lineto
0.44546 0.26783 lineto
0.45042 0.26941 lineto
0.46034 0.27375 lineto
0.47026 0.27948 lineto
0.48018 0.28634 lineto
0.50002 0.30215 lineto
0.51986 0.31845 lineto
0.52978 0.32593 lineto
0.5397 0.33255 lineto
0.54962 0.33804 lineto
0.55458 0.3403 lineto
0.55954 0.3422 lineto
0.5645 0.34372 lineto
0.56698 0.34434 lineto
0.56946 0.34486 lineto
0.57194 0.34529 lineto
0.57318 0.34546 lineto
0.57442 0.34561 lineto
0.57566 0.34574 lineto
0.5769 0.34584 lineto
0.57814 0.34591 lineto
0.57938 0.34596 lineto
0.58062 0.34599 lineto
0.58186 0.34599 lineto
0.5831 0.34596 lineto
0.58434 0.34591 lineto
0.58559 0.34584 lineto
0.58683 0.34574 lineto
0.58931 0.34547 lineto
0.59179 0.3451 lineto
0.59427 0.34463 lineto
0.59923 0.34343 lineto
0.60419 0.34186 lineto
0.60915 0.33996 lineto
0.61907 0.33523 lineto
0.65875 0.30867 lineto
0.67859 0.29492 lineto
0.68851 0.28896 lineto
0.69843 0.28394 lineto
0.70339 0.28185 lineto
0.70835 0.28007 lineto
0.71331 0.27861 lineto
0.71579 0.27801 lineto
0.71827 0.27749 lineto
0.72075 0.27706 lineto
0.72323 0.27672 lineto
0.72447 0.27658 lineto
0.72571 0.27646 lineto
0.72695 0.27637 lineto
0.72819 0.2763 lineto
0.72943 0.27625 lineto
0.73067 0.27622 lineto
0.73191 0.27621 lineto
0.73315 0.27623 lineto
0.73439 0.27627 lineto
0.73563 0.27633 lineto
0.73687 0.27641 lineto
0.73811 0.27652 lineto
0.74059 0.27679 lineto
0.74307 0.27715 lineto
0.74803 0.27812 lineto
0.75299 0.27942 lineto
0.75795 0.28103 lineto
0.77779 0.29012 lineto
0.81747 0.31505 lineto
0.83731 0.3266 lineto
0.84723 0.33126 lineto
0.85219 0.33323 lineto
0.85715 0.33492 lineto
0.86211 0.33632 lineto
0.86707 0.33741 lineto
0.86955 0.33785 lineto
0.87203 0.3382 lineto
0.87451 0.33847 lineto
0.87575 0.33858 lineto
0.87699 0.33867 lineto
0.87823 0.33873 lineto
0.87947 0.33878 lineto
0.88071 0.33881 lineto
0.88195 0.33881 lineto
0.88319 0.3388 lineto
0.88443 0.33876 lineto
0.88567 0.33871 lineto
0.88691 0.33863 lineto
0.88939 0.33843 lineto
0.89187 0.33814 lineto
0.89683 0.33733 lineto
0.90179 0.33623 lineto
0.90675 0.33483 lineto
0.91667 0.33125 lineto
0.93651 0.32155 lineto
0.97619 0.29843 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30891 lineto
0.0437 0.26369 lineto
0.06354 0.22429 lineto
0.07346 0.20838 lineto
0.08338 0.19568 lineto
0.08834 0.19066 lineto
0.0933 0.18657 lineto
0.09578 0.18489 lineto
0.09826 0.18345 lineto
0.10074 0.18225 lineto
0.10322 0.1813 lineto
0.10446 0.18092 lineto
0.1057 0.1806 lineto
0.10694 0.18034 lineto
0.10818 0.18015 lineto
0.10942 0.18001 lineto
0.11066 0.17994 lineto
0.1119 0.17993 lineto
0.11314 0.17998 lineto
0.11438 0.18009 lineto
0.11562 0.18027 lineto
0.11686 0.1805 lineto
0.1181 0.1808 lineto
0.12058 0.18157 lineto
0.12306 0.18258 lineto
0.12802 0.18531 lineto
0.13298 0.18895 lineto
0.1429 0.19878 lineto
0.15282 0.21167 lineto
0.16274 0.22711 lineto
0.18258 0.26319 lineto
0.20242 0.30172 lineto
0.22226 0.33727 lineto
0.23218 0.3524 lineto
0.2421 0.36508 lineto
0.24706 0.37038 lineto
0.25202 0.37494 lineto
0.25698 0.37872 lineto
0.26194 0.38171 lineto
0.26442 0.3829 lineto
0.2669 0.38389 lineto
0.26938 0.38467 lineto
0.27062 0.38499 lineto
0.27186 0.38525 lineto
0.2731 0.38546 lineto
0.27434 0.38562 lineto
0.27558 0.38574 lineto
0.27682 0.3858 lineto
0.27806 0.38581 lineto
0.2793 0.38577 lineto
0.28054 0.38568 lineto
0.28178 0.38554 lineto
0.28302 0.38535 lineto
0.28426 0.38511 lineto
0.28674 0.38449 lineto
0.28922 0.38367 lineto
0.2917 0.38267 lineto
0.29666 0.38013 lineto
0.30162 0.37689 lineto
0.31154 0.36851 lineto
0.32146 0.35795 lineto
0.3413 0.33233 lineto
0.38098 0.27898 lineto
0.3909 0.26837 lineto
0.40082 0.25976 lineto
0.40578 0.2563 lineto
0.41074 0.25344 lineto
0.4157 0.2512 lineto
0.41818 0.25033 lineto
0.42066 0.24961 lineto
0.42314 0.24906 lineto
0.42438 0.24885 lineto
0.42562 0.24867 lineto
0.42686 0.24854 lineto
0.4281 0.24845 lineto
0.42934 0.2484 lineto
0.43058 0.24838 lineto
0.43182 0.24841 lineto
0.43306 0.24848 lineto
0.4343 0.24859 lineto
0.43554 0.24874 lineto
0.43802 0.24916 lineto
0.4405 0.24974 lineto
0.44546 0.25135 lineto
0.45042 0.25356 lineto
0.46034 0.25964 lineto
0.47026 0.26767 lineto
0.48018 0.27726 lineto
0.50002 0.2994 lineto
0.51986 0.32223 lineto
0.52978 0.3327 lineto
0.5397 0.34196 lineto
0.54962 0.34965 lineto
0.55458 0.35281 lineto
0.55954 0.35547 lineto
0.5645 0.35761 lineto
0.56698 0.35847 lineto
0.56946 0.3592 lineto
0.57194 0.3598 lineto
0.57318 0.36004 lineto
0.57442 0.36025 lineto
0.57566 0.36042 lineto
0.5769 0.36056 lineto
0.57814 0.36067 lineto
0.57938 0.36074 lineto
0.58062 0.36077 lineto
0.58186 0.36077 lineto
0.5831 0.36074 lineto
0.58434 0.36067 lineto
0.58559 0.36056 lineto
0.58683 0.36043 lineto
0.58931 0.36005 lineto
0.59179 0.35953 lineto
0.59427 0.35888 lineto
0.59923 0.35719 lineto
0.60419 0.355 lineto
0.60915 0.35234 lineto
0.61907 0.34572 lineto
0.65875 0.30853 lineto
0.67859 0.28928 lineto
0.68851 0.28094 lineto
0.69843 0.27391 lineto
0.70339 0.27099 lineto
0.70835 0.26849 lineto
0.71331 0.26645 lineto
0.71579 0.26561 lineto
0.71827 0.26488 lineto
0.72075 0.26428 lineto
0.72323 0.2638 lineto
0.72447 0.2636 lineto
0.72571 0.26344 lineto
0.72695 0.26331 lineto
0.72819 0.26321 lineto
0.72943 0.26314 lineto
0.73067 0.2631 lineto
0.73191 0.26309 lineto
0.73315 0.26311 lineto
0.73439 0.26317 lineto
0.73563 0.26325 lineto
0.73687 0.26337 lineto
0.73811 0.26351 lineto
0.74059 0.2639 lineto
0.74307 0.2644 lineto
0.74803 0.26576 lineto
0.75299 0.26758 lineto
0.75795 0.26983 lineto
0.77779 0.28257 lineto
0.81747 0.31746 lineto
0.83731 0.33364 lineto
0.84723 0.34016 lineto
0.85219 0.34291 lineto
0.85715 0.34528 lineto
0.86211 0.34724 lineto
0.86707 0.34877 lineto
0.86955 0.34938 lineto
0.87203 0.34987 lineto
0.87451 0.35026 lineto
0.87575 0.35041 lineto
0.87699 0.35053 lineto
0.87823 0.35062 lineto
0.87947 0.35068 lineto
0.88071 0.35072 lineto
0.88195 0.35073 lineto
0.88319 0.35071 lineto
0.88443 0.35066 lineto
0.88567 0.35059 lineto
0.88691 0.35048 lineto
0.88939 0.35019 lineto
0.89187 0.34979 lineto
0.89683 0.34866 lineto
0.90179 0.34711 lineto
0.90675 0.34516 lineto
0.91667 0.34015 lineto
0.93651 0.32657 lineto
0.97619 0.29419 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30887 lineto
0.0437 0.25074 lineto
0.06354 0.20008 lineto
0.07346 0.17963 lineto
0.08338 0.1633 lineto
0.08834 0.15684 lineto
0.0933 0.15159 lineto
0.09578 0.14942 lineto
0.09826 0.14757 lineto
0.10074 0.14603 lineto
0.10322 0.14481 lineto
0.10446 0.14432 lineto
0.1057 0.14391 lineto
0.10694 0.14358 lineto
0.10818 0.14332 lineto
0.10942 0.14315 lineto
0.11066 0.14306 lineto
0.1119 0.14305 lineto
0.11314 0.14311 lineto
0.11438 0.14326 lineto
0.11562 0.14348 lineto
0.11686 0.14378 lineto
0.1181 0.14416 lineto
0.12058 0.14516 lineto
0.12306 0.14646 lineto
0.12802 0.14997 lineto
0.13298 0.15464 lineto
0.1429 0.16728 lineto
0.15282 0.18386 lineto
0.16274 0.2037 lineto
0.18258 0.25009 lineto
0.20242 0.29963 lineto
0.22226 0.34534 lineto
0.23218 0.36479 lineto
0.2421 0.3811 lineto
0.24706 0.38791 lineto
0.25202 0.39378 lineto
0.25698 0.39864 lineto
0.26194 0.40248 lineto
0.26442 0.40401 lineto
0.2669 0.40528 lineto
0.26938 0.40629 lineto
0.27062 0.40669 lineto
0.27186 0.40703 lineto
0.2731 0.4073 lineto
0.27434 0.40751 lineto
0.27558 0.40765 lineto
0.27682 0.40773 lineto
0.27806 0.40775 lineto
0.2793 0.40769 lineto
0.28054 0.40758 lineto
0.28178 0.4074 lineto
0.28302 0.40716 lineto
0.28426 0.40685 lineto
0.28674 0.40605 lineto
0.28922 0.40501 lineto
0.2917 0.40372 lineto
0.29666 0.40045 lineto
0.30162 0.39628 lineto
0.31154 0.3855 lineto
0.32146 0.37193 lineto
0.3413 0.33899 lineto
0.38098 0.27039 lineto
0.3909 0.25676 lineto
0.40082 0.24569 lineto
0.40578 0.24123 lineto
0.41074 0.23756 lineto
0.4157 0.23469 lineto
0.41818 0.23356 lineto
0.42066 0.23264 lineto
0.42314 0.23193 lineto
0.42438 0.23166 lineto
0.42562 0.23143 lineto
0.42686 0.23126 lineto
0.4281 0.23114 lineto
0.42934 0.23107 lineto
0.43058 0.23106 lineto
0.43182 0.2311 lineto
0.43306 0.23119 lineto
0.4343 0.23133 lineto
0.43554 0.23152 lineto
0.43802 0.23206 lineto
0.4405 0.2328 lineto
0.44546 0.23488 lineto
0.45042 0.23772 lineto
0.46034 0.24553 lineto
0.47026 0.25585 lineto
0.48018 0.26819 lineto
0.50002 0.29665 lineto
0.51986 0.326 lineto
0.52978 0.33947 lineto
0.5397 0.35138 lineto
0.54962 0.36126 lineto
0.55458 0.36532 lineto
0.55954 0.36874 lineto
0.5645 0.37149 lineto
0.56698 0.3726 lineto
0.56946 0.37354 lineto
0.57194 0.37431 lineto
0.57318 0.37462 lineto
0.57442 0.37489 lineto
0.57566 0.37511 lineto
0.5769 0.37529 lineto
0.57814 0.37543 lineto
0.57938 0.37552 lineto
0.58062 0.37556 lineto
0.58186 0.37556 lineto
0.5831 0.37552 lineto
0.58434 0.37543 lineto
0.58559 0.37529 lineto
0.58683 0.37511 lineto
0.58931 0.37463 lineto
0.59179 0.37396 lineto
0.59427 0.37313 lineto
0.59923 0.37096 lineto
0.60419 0.36814 lineto
0.60915 0.36471 lineto
0.61907 0.3562 lineto
0.65875 0.3084 lineto
0.67859 0.28364 lineto
0.68851 0.27291 lineto
0.69843 0.26388 lineto
0.70339 0.26012 lineto
0.70835 0.25691 lineto
0.71331 0.25429 lineto
0.71579 0.2532 lineto
0.71827 0.25227 lineto
0.72075 0.2515 lineto
0.72323 0.25088 lineto
0.72447 0.25063 lineto
0.72571 0.25042 lineto
0.72695 0.25025 lineto
0.72819 0.25012 lineto
0.72943 0.25003 lineto
0.73067 0.24998 lineto
0.73191 0.24997 lineto
0.73315 0.25 lineto
0.73439 0.25007 lineto
0.73563 0.25018 lineto
0.73687 0.25033 lineto
0.73811 0.25051 lineto
0.74059 0.25101 lineto
0.74307 0.25165 lineto
0.74803 0.2534 lineto
0.75299 0.25574 lineto
0.75795 0.25863 lineto
0.77779 0.27501 lineto
0.81747 0.31988 lineto
0.83731 0.34067 lineto
0.84723 0.34906 lineto
0.85219 0.35259 lineto
0.85715 0.35564 lineto
0.86211 0.35816 lineto
0.86707 0.36013 lineto
0.86955 0.36091 lineto
0.87203 0.36155 lineto
0.87451 0.36204 lineto
0.87575 0.36223 lineto
0.87699 0.36239 lineto
0.87823 0.36251 lineto
0.87947 0.36259 lineto
0.88071 0.36264 lineto
0.88195 0.36265 lineto
0.88319 0.36262 lineto
0.88443 0.36256 lineto
0.88567 0.36246 lineto
0.88691 0.36233 lineto
0.88939 0.36195 lineto
0.89187 0.36144 lineto
0.89683 0.35998 lineto
0.90179 0.35799 lineto
0.90675 0.35548 lineto
0.91667 0.34904 lineto
0.93651 0.33158 lineto
0.97619 0.28995 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30884 lineto
0.0437 0.23779 lineto
0.06354 0.17588 lineto
0.07346 0.15087 lineto
0.08338 0.13092 lineto
0.08834 0.12303 lineto
0.0933 0.1166 lineto
0.09578 0.11396 lineto
0.09826 0.11169 lineto
0.10074 0.10981 lineto
0.10322 0.10832 lineto
0.10446 0.10772 lineto
0.1057 0.10722 lineto
0.10694 0.10681 lineto
0.10818 0.1065 lineto
0.10942 0.10629 lineto
0.11066 0.10618 lineto
0.1119 0.10616 lineto
0.11314 0.10624 lineto
0.11438 0.10642 lineto
0.11562 0.1067 lineto
0.11686 0.10707 lineto
0.1181 0.10753 lineto
0.12058 0.10875 lineto
0.12306 0.11034 lineto
0.12802 0.11462 lineto
0.13298 0.12034 lineto
0.1429 0.13579 lineto
0.15282 0.15604 lineto
0.16274 0.1803 lineto
0.18258 0.237 lineto
0.20242 0.29755 lineto
0.22226 0.35342 lineto
0.23218 0.37718 lineto
0.2421 0.39712 lineto
0.24706 0.40545 lineto
0.25202 0.41261 lineto
0.25698 0.41856 lineto
0.26194 0.42325 lineto
0.26442 0.42512 lineto
0.2669 0.42667 lineto
0.26938 0.4279 lineto
0.27062 0.4284 lineto
0.27186 0.42881 lineto
0.2731 0.42915 lineto
0.27434 0.4294 lineto
0.27558 0.42957 lineto
0.27682 0.42967 lineto
0.27806 0.42968 lineto
0.2793 0.42962 lineto
0.28054 0.42948 lineto
0.28178 0.42926 lineto
0.28302 0.42896 lineto
0.28426 0.42859 lineto
0.28674 0.42761 lineto
0.28922 0.42634 lineto
0.2917 0.42476 lineto
0.29666 0.42076 lineto
0.30162 0.41567 lineto
0.31154 0.4025 lineto
0.32146 0.38591 lineto
0.3413 0.34566 lineto
0.38098 0.26181 lineto
0.3909 0.24515 lineto
0.40082 0.23161 lineto
0.40578 0.22617 lineto
0.41074 0.22168 lineto
0.4157 0.21817 lineto
0.41818 0.21679 lineto
0.42066 0.21567 lineto
0.42314 0.2148 lineto
0.42438 0.21446 lineto
0.42562 0.21419 lineto
0.42686 0.21398 lineto
0.4281 0.21384 lineto
0.42934 0.21375 lineto
0.43058 0.21374 lineto
0.43182 0.21378 lineto
0.43306 0.21389 lineto
0.4343 0.21407 lineto
0.43554 0.2143 lineto
0.43802 0.21496 lineto
0.4405 0.21587 lineto
0.44546 0.2184 lineto
0.45042 0.22188 lineto
0.46034 0.23142 lineto
0.47026 0.24404 lineto
0.48018 0.25912 lineto
0.50002 0.2939 lineto
0.51986 0.32978 lineto
0.52978 0.34623 lineto
0.5397 0.36079 lineto
0.54962 0.37287 lineto
0.55458 0.37783 lineto
0.55954 0.38201 lineto
0.5645 0.38537 lineto
0.56698 0.38673 lineto
0.56946 0.38788 lineto
0.57194 0.38881 lineto
0.57318 0.3892 lineto
0.57442 0.38953 lineto
0.57566 0.3898 lineto
0.5769 0.39002 lineto
0.57814 0.39018 lineto
0.57938 0.39029 lineto
0.58062 0.39035 lineto
0.58186 0.39035 lineto
0.5831 0.39029 lineto
0.58434 0.39018 lineto
0.58559 0.39002 lineto
0.58683 0.3898 lineto
0.58931 0.3892 lineto
0.59179 0.38839 lineto
0.59427 0.38737 lineto
0.59923 0.38472 lineto
0.60419 0.38128 lineto
0.60915 0.37709 lineto
0.61907 0.36669 lineto
0.65875 0.30826 lineto
0.67859 0.278 lineto
0.68851 0.26489 lineto
0.69843 0.25385 lineto
0.70339 0.24926 lineto
0.70835 0.24534 lineto
0.71331 0.24213 lineto
0.71579 0.2408 lineto
0.71827 0.23966 lineto
0.72075 0.23871 lineto
0.72323 0.23796 lineto
0.72447 0.23765 lineto
0.72571 0.2374 lineto
0.72695 0.23719 lineto
0.72819 0.23703 lineto
0.72943 0.23692 lineto
0.73067 0.23686 lineto
0.73191 0.23685 lineto
0.73315 0.23688 lineto
0.73439 0.23697 lineto
0.73563 0.2371 lineto
0.73687 0.23728 lineto
0.73811 0.23751 lineto
0.74059 0.23812 lineto
0.74307 0.23891 lineto
0.74803 0.24105 lineto
0.75299 0.2439 lineto
0.75795 0.24744 lineto
0.77779 0.26745 lineto
0.81747 0.32229 lineto
0.83731 0.34771 lineto
0.84723 0.35796 lineto
0.85219 0.36228 lineto
0.85715 0.36599 lineto
0.86211 0.36908 lineto
0.86707 0.37149 lineto
0.86955 0.37244 lineto
0.87203 0.37322 lineto
0.87451 0.37382 lineto
0.87575 0.37406 lineto
0.87699 0.37425 lineto
0.87823 0.37439 lineto
0.87947 0.3745 lineto
0.88071 0.37455 lineto
0.88195 0.37457 lineto
0.88319 0.37453 lineto
0.88443 0.37446 lineto
0.88567 0.37434 lineto
0.88691 0.37418 lineto
0.88939 0.37372 lineto
0.89187 0.37309 lineto
0.89683 0.37131 lineto
0.90179 0.36888 lineto
0.90675 0.36581 lineto
0.91667 0.35793 lineto
0.93651 0.33659 lineto
0.97619 0.28572 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30881 lineto
0.0437 0.22484 lineto
0.06354 0.15167 lineto
0.07346 0.12212 lineto
0.08338 0.09854 lineto
0.08834 0.08921 lineto
0.0933 0.08162 lineto
0.09578 0.07849 lineto
0.09826 0.07581 lineto
0.10074 0.07359 lineto
0.10322 0.07183 lineto
0.10446 0.07112 lineto
0.1057 0.07053 lineto
0.10694 0.07005 lineto
0.10818 0.06968 lineto
0.10942 0.06943 lineto
0.11066 0.0693 lineto
0.1119 0.06928 lineto
0.11314 0.06938 lineto
0.11438 0.06959 lineto
0.11562 0.06991 lineto
0.11686 0.07035 lineto
0.1181 0.0709 lineto
0.12058 0.07233 lineto
0.12306 0.07421 lineto
0.12802 0.07928 lineto
0.13298 0.08603 lineto
0.1429 0.10429 lineto
0.15282 0.12823 lineto
0.16274 0.1569 lineto
0.18258 0.2239 lineto
0.20242 0.29546 lineto
0.22226 0.36149 lineto
0.23218 0.38958 lineto
0.2421 0.41313 lineto
0.24706 0.42298 lineto
0.25202 0.43145 lineto
0.25698 0.43847 lineto
0.26194 0.44402 lineto
0.26442 0.44623 lineto
0.2669 0.44807 lineto
0.26938 0.44952 lineto
0.27062 0.4501 lineto
0.27186 0.45059 lineto
0.2731 0.45099 lineto
0.27434 0.45129 lineto
0.27558 0.45149 lineto
0.27682 0.45161 lineto
0.27806 0.45162 lineto
0.2793 0.45155 lineto
0.28054 0.45138 lineto
0.28178 0.45112 lineto
0.28302 0.45077 lineto
0.28426 0.45033 lineto
0.28674 0.44918 lineto
0.28922 0.44767 lineto
0.2917 0.44581 lineto
0.29666 0.44108 lineto
0.30162 0.43506 lineto
0.31154 0.4195 lineto
0.32146 0.39989 lineto
0.3413 0.35232 lineto
0.38098 0.25323 lineto
0.3909 0.23354 lineto
0.40082 0.21754 lineto
0.40578 0.21111 lineto
0.41074 0.2058 lineto
0.4157 0.20165 lineto
0.41818 0.20002 lineto
0.42066 0.1987 lineto
0.42314 0.19767 lineto
0.42438 0.19727 lineto
0.42562 0.19695 lineto
0.42686 0.1967 lineto
0.4281 0.19653 lineto
0.42934 0.19643 lineto
0.43058 0.19641 lineto
0.43182 0.19647 lineto
0.43306 0.1966 lineto
0.4343 0.1968 lineto
0.43554 0.19708 lineto
0.43802 0.19786 lineto
0.4405 0.19893 lineto
0.44546 0.20193 lineto
0.45042 0.20603 lineto
0.46034 0.21732 lineto
0.47026 0.23222 lineto
0.48018 0.25005 lineto
0.50002 0.29116 lineto
0.51986 0.33355 lineto
0.52978 0.353 lineto
0.5397 0.3702 lineto
0.54962 0.38448 lineto
0.55458 0.39034 lineto
0.55954 0.39528 lineto
0.5645 0.39925 lineto
0.56698 0.40086 lineto
0.56946 0.40222 lineto
0.57194 0.40332 lineto
0.57318 0.40378 lineto
0.57442 0.40416 lineto
0.57566 0.40449 lineto
0.5769 0.40475 lineto
0.57814 0.40494 lineto
0.57938 0.40507 lineto
0.58062 0.40514 lineto
0.58186 0.40514 lineto
0.5831 0.40507 lineto
0.58434 0.40494 lineto
0.58559 0.40475 lineto
0.58683 0.40449 lineto
0.58931 0.40378 lineto
0.59179 0.40283 lineto
0.59427 0.40162 lineto
0.59923 0.39849 lineto
0.60419 0.39442 lineto
0.60915 0.38947 lineto
0.61907 0.37718 lineto
0.65875 0.30812 lineto
0.67859 0.27237 lineto
0.68851 0.25687 lineto
0.69843 0.24382 lineto
0.70339 0.23839 lineto
0.70835 0.23376 lineto
0.71331 0.22997 lineto
0.71579 0.2284 lineto
0.71827 0.22705 lineto
0.72075 0.22593 lineto
0.72323 0.22504 lineto
0.72447 0.22468 lineto
0.72571 0.22437 lineto
0.72695 0.22413 lineto
0.72819 0.22394 lineto
0.72943 0.22381 lineto
0.73067 0.22374 lineto
0.73191 0.22372 lineto
0.73315 0.22377 lineto
0.73439 0.22387 lineto
0.73563 0.22403 lineto
0.73687 0.22424 lineto
0.73811 0.22451 lineto
0.74059 0.22522 lineto
0.74307 0.22616 lineto
0.74803 0.22869 lineto
0.75299 0.23206 lineto
0.75795 0.23624 lineto
0.77779 0.2599 lineto
0.81747 0.3247 lineto
0.83731 0.35474 lineto
0.84723 0.36686 lineto
0.85219 0.37196 lineto
0.85715 0.37635 lineto
0.86211 0.38 lineto
0.86707 0.38285 lineto
0.86955 0.38398 lineto
0.87203 0.38489 lineto
0.87451 0.38561 lineto
0.87575 0.38588 lineto
0.87699 0.38611 lineto
0.87823 0.38628 lineto
0.87947 0.3864 lineto
0.88071 0.38647 lineto
0.88195 0.38648 lineto
0.88319 0.38645 lineto
0.88443 0.38636 lineto
0.88567 0.38622 lineto
0.88691 0.38602 lineto
0.88939 0.38548 lineto
0.89187 0.38473 lineto
0.89683 0.38264 lineto
0.90179 0.37976 lineto
0.90675 0.37613 lineto
0.91667 0.36683 lineto
0.93651 0.34161 lineto
0.97619 0.28148 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 27; pictureWidth = 372; pictureHeight = 230; endGroup; endGroup; endGroup; endGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
% Scaling calculations
0.02381 0.04762 0.30902 0.47541 [
[(5.)] 0.2619 0.29652 0 1 Msboxa
[(10.)] 0.5 0.29652 0 1 Msboxa
[(15.)] 0.7381 0.29652 0 1 Msboxa
[(20.)] 0.97619 0.29652 0 1 Msboxa
[(-0.6)] 0.01131 0.02377 1 0 Msboxa
[(-0.4)] 0.01131 0.11885 1 0 Msboxa
[(-0.2)] 0.01131 0.21393 1 0 Msboxa
[(0.2)] 0.01131 0.4041 1 0 Msboxa
[(0.4)] 0.01131 0.49918 1 0 Msboxa
[(0.6)] 0.01131 0.59426 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
0.002 setlinewidth
0 0.30902 moveto
1 0.30902 lineto
stroke
0.2619 0.30277 moveto
0.2619 0.31527 lineto
stroke
[(5.)] 0.2619 0.29652 0 1 Mshowa
0.5 0.30277 moveto
0.5 0.31527 lineto
stroke
[(10.)] 0.5 0.29652 0 1 Mshowa
0.7381 0.30277 moveto
0.7381 0.31527 lineto
stroke
[(15.)] 0.7381 0.29652 0 1 Mshowa
0.97619 0.30277 moveto
0.97619 0.31527 lineto
stroke
[(20.)] 0.97619 0.29652 0 1 Mshowa
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
0.01756 0.02377 moveto
0.03006 0.02377 lineto
stroke
[(-0.6)] 0.01131 0.02377 1 0 Mshowa
0.01756 0.11885 moveto
0.03006 0.11885 lineto
stroke
[(-0.4)] 0.01131 0.11885 1 0 Mshowa
0.01756 0.21393 moveto
0.03006 0.21393 lineto
stroke
[(-0.2)] 0.01131 0.21393 1 0 Mshowa
0.01756 0.4041 moveto
0.03006 0.4041 lineto
stroke
[(0.2)] 0.01131 0.4041 1 0 Mshowa
0.01756 0.49918 moveto
0.03006 0.49918 lineto
stroke
[(0.4)] 0.01131 0.49918 1 0 Mshowa
0.01756 0.59426 moveto
0.03006 0.59426 lineto
stroke
[(0.6)] 0.01131 0.59426 1 0 Mshowa
grestore
0 0 moveto
1 0 lineto
1 0.618034 lineto
0 0.618034 lineto
closepath
clip
newpath
0.02386 0.30902 moveto
0.02386 0.30878 lineto
0.0437 0.21189 lineto
0.06354 0.12746 lineto
0.07346 0.09337 lineto
0.08338 0.06616 lineto
0.08834 0.05539 lineto
0.0933 0.04664 lineto
0.09578 0.04303 lineto
0.09826 0.03994 lineto
0.10074 0.03737 lineto
0.10322 0.03534 lineto
0.10446 0.03452 lineto
0.1057 0.03384 lineto
0.10694 0.03328 lineto
0.10818 0.03286 lineto
0.10942 0.03258 lineto
0.11066 0.03242 lineto
0.1119 0.0324 lineto
0.11314 0.03251 lineto
0.11438 0.03275 lineto
0.11562 0.03312 lineto
0.11686 0.03363 lineto
0.1181 0.03426 lineto
0.12058 0.03592 lineto
0.12306 0.03809 lineto
0.12802 0.04393 lineto
0.13298 0.05173 lineto
0.1429 0.0728 lineto
0.15282 0.10042 lineto
0.16274 0.1335 lineto
0.18258 0.21081 lineto
0.20242 0.29338 lineto
0.22226 0.36956 lineto
0.23218 0.40197 lineto
0.2421 0.42915 lineto
0.24706 0.44051 lineto
0.25202 0.45028 lineto
0.25698 0.45839 lineto
0.26194 0.46479 lineto
0.26442 0.46734 lineto
0.2669 0.46946 lineto
0.26938 0.47113 lineto
0.27062 0.47181 lineto
0.27186 0.47237 lineto
0.2731 0.47283 lineto
0.27434 0.47318 lineto
0.27558 0.47341 lineto
0.27682 0.47354 lineto
0.27806 0.47356 lineto
0.2793 0.47348 lineto
0.28054 0.47329 lineto
0.28178 0.47299 lineto
0.28302 0.47258 lineto
0.28426 0.47207 lineto
0.28674 0.47074 lineto
0.28922 0.469 lineto
0.2917 0.46685 lineto
0.29666 0.4614 lineto
0.30162 0.45446 lineto
0.31154 0.43649 lineto
0.32146 0.41387 lineto
0.3413 0.35898 lineto
0.38098 0.24464 lineto
0.3909 0.22193 lineto
0.40082 0.20347 lineto
0.40578 0.19605 lineto
0.41074 0.18992 lineto
0.4157 0.18513 lineto
0.41818 0.18326 lineto
0.42066 0.18172 lineto
0.42314 0.18054 lineto
0.42438 0.18008 lineto
0.42562 0.17971 lineto
0.42686 0.17942 lineto
0.4281 0.17922 lineto
0.42934 0.17911 lineto
0.43058 0.17909 lineto
0.43182 0.17915 lineto
0.43306 0.1793 lineto
0.4343 0.17954 lineto
0.43554 0.17986 lineto
0.43802 0.18076 lineto
0.4405 0.18199 lineto
0.44546 0.18545 lineto
0.45042 0.19019 lineto
0.46034 0.20321 lineto
0.47026 0.22041 lineto
0.48018 0.24098 lineto
0.50002 0.28841 lineto
0.51986 0.33732 lineto
0.52978 0.35976 lineto
0.5397 0.37961 lineto
0.54962 0.39609 lineto
0.55458 0.40285 lineto
0.55954 0.40855 lineto
0.5645 0.41314 lineto
0.56698 0.41499 lineto
0.56946 0.41656 lineto
0.57194 0.41783 lineto
0.57318 0.41835 lineto
0.57442 0.4188 lineto
0.57566 0.41918 lineto
0.5769 0.41948 lineto
0.57814 0.4197 lineto
0.57938 0.41985 lineto
0.58062 0.41992 lineto
0.58186 0.41992 lineto
0.5831 0.41985 lineto
0.58434 0.4197 lineto
0.58559 0.41948 lineto
0.58683 0.41918 lineto
0.58931 0.41836 lineto
0.59179 0.41726 lineto
0.59427 0.41587 lineto
0.59923 0.41225 lineto
0.60419 0.40756 lineto
0.60915 0.40185 lineto
0.61907 0.38766 lineto
0.65875 0.30798 lineto
0.67859 0.26673 lineto
0.68851 0.24884 lineto
0.69843 0.23379 lineto
0.70339 0.22753 lineto
0.70835 0.22218 lineto
0.71331 0.2178 lineto
0.71579 0.21599 lineto
0.71827 0.21444 lineto
0.72075 0.21315 lineto
0.72323 0.21212 lineto
0.72447 0.2117 lineto
0.72571 0.21135 lineto
0.72695 0.21107 lineto
0.72819 0.21085 lineto
0.72943 0.2107 lineto
0.73067 0.21062 lineto
0.73191 0.2106 lineto
0.73315 0.21065 lineto
0.73439 0.21077 lineto
0.73563 0.21095 lineto
0.73687 0.2112 lineto
0.73811 0.21151 lineto
0.74059 0.21233 lineto
0.74307 0.21341 lineto
0.74803 0.21633 lineto
0.75299 0.22022 lineto
0.75795 0.22505 lineto
0.77779 0.25234 lineto
0.81747 0.32712 lineto
0.83731 0.36178 lineto
0.84723 0.37576 lineto
0.85219 0.38165 lineto
0.85715 0.38671 lineto
0.86211 0.39092 lineto
0.86707 0.39421 lineto
0.86955 0.39551 lineto
0.87203 0.39657 lineto
0.87451 0.39739 lineto
0.87575 0.39771 lineto
0.87699 0.39797 lineto
0.87823 0.39817 lineto
0.87947 0.39831 lineto
0.88071 0.39838 lineto
0.88195 0.3984 lineto
0.88319 0.39836 lineto
0.88443 0.39826 lineto
0.88567 0.39809 lineto
0.88691 0.39787 lineto
0.88939 0.39724 lineto
0.89187 0.39638 lineto
0.89683 0.39396 lineto
0.90179 0.39064 lineto
0.90675 0.38646 lineto
0.91667 0.37572 lineto
0.93651 0.34662 lineto
0.97619 0.27724 lineto
0.97619 0.30902 lineto
fill
% End of Graphics
MathPictureEnd
^*)