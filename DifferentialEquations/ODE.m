(* :Title: ODE *)

(* :Authors: Alfred Gray and Michael Mezzino *)

(* :Copyright: Copyright 1994-1999 by Springer-Verlag. All rights reserved. *)

(* :Package Version: 1.5 *)

(* :Mathematica Versions: 2.2 - 4.2 *)

(* :Summary: 
	This package provides functions for solving various ordinary
	differential equations.
*)

(* :Recent History:
	020197 - Added tests for expressions containing Root (Mma 3.0) 
	020197 - Added FullSimplify in verify solution code (Mma 3.0) 
	020197 - Removed the need for Algebra`Trigonometry`
	040797 - Modified tests for trivial solutions
	041097 - Added tests required for solve (Mma 3.0)
	041197 - Removed requirement on initconds for exact
	041397 - Added solveeqs to test
	041397 - Added Simplify to FixForm
	041497 - Removed all conflicts with user variable ScaleFunction
	041497 - Added conditional Simplify
	041597 - Added FreeQ[exp,False] to following test
	041697 - Replaced !clean[Union[eqs,tmp]] by (!clean[eqs] || !clean[tmp])
	041697 - Added test for False
	041797 - Added allexact in the following test
	042097 - Added digits as global variable
	050997 - Added Exponent[mult,t] < degree && to following test
	051597 - Normalize forcing function in ParticularSolution
	051697 - Changed ComplexExpand to ComplexToTrig
	052397 - Improved singular solution code
	070897 - Added TrigReduce to Exactness test
	080897 - Added partial trace to Automatic and AllSymbolic
	103097 - Added Animation with Play Button for v3.0
	121397 - Added test for no solution
	121697 - Added capability for solving tensorial systems
	032498 - Added ExchangeVariables for higher-order equations
	062198 - Improved recursive transformation code
	092598 - Fixed problem caused by bug in Simplify (ver 3.0)
	101298 - Added ShowEquilibriumPoints, EquilibriumPointColor,
	 	     ShowEigenspaces,EigenspaceColor
	021899 - Another fix to the problem caused by bug in Simplify (ver 3.0) 
	041299 - Added Sort to dependent variable list  
	041499 - Modification for equations with approximate numbers
	041899 - Modification to Lagrange (ver 3.0)
	050199 - Added ordering to numerical solutions
	072099 - Enhanced PostSolution options for numerical solutions
	102299 - Fixed autoload of LaplaceTransform for version 4.0
	111199 - Another patch to Simplify 
	042103 - Reinstated Method -> SecondOrderLinear
*)

Print["To get more information type ?ODE"]

$Messages = Null

BeginPackage["ODE`","Algebra`ReIm`","Calculus`DiracDelta`","Graphics`Colors`"]

(*****************************************************************************)

NewMethodQ::usage = 
"NewMethodQ[eq,y,t] yields True if eq is of type NewMethod and False otherwise."

NewMethod::usage = 
"NewMethod is a value for the Method option for ODE. ODE with Method->NewMethod attempts to find the solution to a differential equation considering the equation to be of type NewMethod.\n\n NewMethod[eq,y,t,const] is the solution to the equation eq with constant of integration equal to const."

(*****************************************************************************)

If[$VersionNumber < 3.0,
	Needs["Algebra`Trigonometry`"];
	TrigSimplify[expr_] := Factor[expr,Trig->True];
	`ComplexToTrig = Algebra`Trigonometry`ComplexToTrig;
	mu = "mu",
	TrigSimplify[expr_] := TrigReduce[expr];
	`ComplexToTrig = Map[ExpToTrig,#,Infinity]&;   (* Changed from Sequence for 4.0*)
	mu = "\[Mu]"
]

$Messages = $Output

(* An internal variable used to control testing of new code *)
ODEDebug = False;
ODESingular = False;

(* ODE` global constants and variables*)
$ODEVersion = "Version 1.5 - 04/21/03"
$ODEPlotNumber = 0;

$ODEVersion::usage = 
"ODE package version."

$ODEPlotNumber::usage = 
"This global variable controls the value of the argument to Graph as plots are labeled. Setting it to the value s will reset the naming of subsequent graphs to Graph[s], Graph[s+1] and so forth."

(* Global variables used in transformations *)
ODEA::usage = 
"A temporary constant of integration."

ODEB::usage = 
"A temporary constant of integration."

ODEC::usage = 
"A temporary constant of integration."

ODEp::usage = 
"A global temporary variable used in transformations."

ODEq::usage = 
"A global temporary variable used in transformations."

ODEr::usage = 
"A global temporary variable used in transformations."

ODEs::usage = 
"A global temporary variable used in transformations."

ODEu::usage = 
"A global temporary variable used in transformations."

ODEv::usage = 
"A global temporary variable used in transformations."

ODEw::usage = 
"A global temporary variable used in transformations."

(*
Unprotect[Parse,ODE,FirstOrderHomogeneous,IntegratingFactor,
FirstOrderExact,FirstOrderLinear,Bernoulli,Riccati,Separable,NumericalMethods,
ExchangeVariables,ApproximateNthOrderLinear,BulirschStoer,
Clairaut,ClairautQ,Lowset,Highset,DEOrder,SeriesForm,NonSingular,Frobenius,
SecondOrderLinear,VariationOfParameters,Euler,Heun,SeriesFormCauchy,
RungeKutta4,AdamsBashforth,Milne,Laplace,BernoulliQ,
HomogeneousSecondOrderLinear,Wronskian,ReductionOfOrder,LinearSystem,
HomogeneousLinearSystem,Picard,FactorEquation,RiccatiQ,
EquationFromSolutions,GetCoefficients,RungeKutta45,ConvertToSystem,
Polynomial,PowerSeries,FrobeniusSeries,CauchyEuler,LinearFractional,
TaylorSeries,LinearQ,FirstOrderHomogeneousQ,FirstOrderExactQ,SeparableQ,
CauchyEulerQ,SecondOrderExactQ,SecondOrderExact,LinearSystem,
SecondOrderLinearToConstantsQ,Transformation,EquidimensionalInIndependentQ,
EquidimensionalInDependentQ,SecondOrderLinearToConstants,Adjoint,
EquidimensionalInDependent,EquidimensionalInIndependent,NthOrderLinear,
ImplicitRungeKutta,AlmostLinearQ,AlmostLinear,ImposeInitialValues,
GeneralizedHomogeneousQ,GeneralizedHomogeneous,SecondOrderLinearToRiccati,
FirstOrderLinearQ,SolvableForIndependentQ,SolvableForDependentQ,
SolvableForIndependent,NthOrderLinearComplex,NthOrderCauchyEulerComplex,
SolvableForDependent,AutonomousQ,Autonomous,Trivial,SecondOrderEuler,
Lagrange,LagrangeQ,GetMatrices,GetSemiNumericalMatrices,LinearFractionalQ,
RiccatiToSecondOrderLinear,NthOrderCauchyEuler,ApproximateNthOrderCauchyEuler,
ApproximateLinearSystem,TableLookup,Trajectory,DependentMissingQ,
DependentMissing,ImplicitEuler,LinearizeAt,CriticalPoints,Numerov,
ApproximateSecondOrderLinear,ApproximateSecondOrderCauchyEuler, MultiplyByDerivative]
*)

ODE::usage = "ODE[eq,depvar,indepvar,options] attempts to solve an ordinary differential equation or system of differential equations by means of an option of the form\n\nMethod -> name,\n\nwhere name is a solution method.  Some of the symbolic methods are:\n\nAutomatic, AllSymbolic, DSolve, Laplace, IntegratingFactor, Bernoulli, NthOrderLinear and  LinearSystem.\n\nSome of the numerical and seminumerical methods are:\n\nNDSolve, Euler, RungeKutta4, AdamsBashforth and ApproximateNthOrderLinear.\n\nFor the next page of information about
ODE type ?ODEpage2."

ODEpage2::usage = "For example, to solve the differential equation\n\ty'[t] + y[t]/t == Sin[t], enter either\n\n\tODE[y'[t] + y[t]/t == Sin[t],y[t],t,\n\t\tMethod ->  FirstOrderLinear]\n\nor more simply\n\n\tODE[y' + y/t == Sin[t],y,t,\n\t\tMethod ->  FirstOrderLinear]\n\n
To solve the same differential equation with the initial condition y[1] == 1 and plot the solution over the interval 1 < t < 4 enter\n\n
ODE[{y'[t] + y[t]/t == Sin[t],y[1] == 1},y[t],t,\n\t\tMethod -> FirstOrderLinear,\n\t\tPlotSolution -> {{t,1,4}}]\n\nFor a numerical solution using the Runge-Kutta method enter\n\n
ODE[{y'[t] + y[t]/t == Sin[t],y[1] == 1},y[t],{t,1,4},\n\t\tMethod -> RungeKutta4]\n\nFor the next page of information about ODE type ?ODEpage3."

ODEpage3::usage = "With no method option ODE defaults to DSolve or NDSolve depending on whether the requested method is symbolic or numerical.\n\nTo see a list of Methods for ODE type ?Method, and to get more specific help on a particular Method type ?name.\n\nIn particular Method -> Automatic asks ODE to choose the method of solution, and Method -> AllSymbolic asks ODE to try to solve a differential equation by all methods that are appropriate.\n\nSeveral output forms including Rule, Equation, LogEquation and Explicit are possible; for details type ?Form.\n\n"

Method::usage = 
"Method specifies the method of solution of a differential equation or equations. It is used in the form\n\nMethod -> name.\n\nFor symbolic solutions Method can have any one of the following values:\n\nAllSymbolic, AlmostLinear, Automatic, Bernoulli, Clairaut, DSolve (default), FirstOrderExact,  FirstOrderHomogeneous, FirstOrderLinear, GeneralizedHomogeneous, IntegratingFactor, Lagrange, Laplace, LinearFractional, LinearSystem, None, NthOrderCauchyEuler, NthOrderCauchyEulerComplex, NthOrderLinear, NthOrderLinearComplex, ReductionOfOrder, Riccati, SecondOrderLinear, SecondOrderLinearToConstants, Separable and TableLookup.\n\n

For numerical solutions Method can have any one of the following values:\n\nAllNumerical, AdamsBashforth, BulirschStoer, Euler, Heun, ImplicitRungeKutta, Milne, NDSolve, Numerov, RungeKutta4, RungeKutta45 and SecondOrderEuler.\n\n
For seminumerical solutions Method can have any one of the following values:\n\n
AllSemiNumerical, ApproximateLinearSystem, ApproximateSecondOrderCauchyEuler, ApproximateNthOrderCauchyEuler, ApproximateNthOrderLinear, 
ApproximateSecondOrderLinear, Picard, SeriesForm, SeriesFormCauchy and TaylorSeries."

AllSymbolic::usage =
"AllSymbolic is a value for the Method option for ODE (type ?Method). With Method->AllSymbolic, ODE attempts to solve a differential equation or system of differential equations by successively trying all appropriate symbolic methods known to ODE. It does not terminate until it has tried all methods."

ReallyAll::usage =
"ReallyAll is a value for the Method option for ODE (type ?Method). With Method->ReallyAll, ODE attempts to solve a differential equation or system of differential equations by successively trying all appropriate symbolic methods known to ODE as well as all transformations appropriate for the equation. It does not terminate until it has tried all methods and all transformations."

AllNumerical::usage =
"AllNumerical is a value for the Method option for ODE (type ?NumericalMethods). With Method->AllNumerical, ODE attempts to solve a differential equation or system of differential equations by successively trying all numerical methods known to ODE."

AllSemiNumerical::usage =
"AllSemiNumerical is a value for the Method option for ODE (type ?NumericalMethods). With Method->AllSemiNumerical, ODE attempts to solve a differential equation or system of differential equations by successively trying all seminumerical methods known to ODE."

Automatic::usage =
"Automatic is a value for the Method option for ODE (type ?Method). With Method->Automatic, ODE attempts to solve a differential equation or system of differential equations by successively trying all appropriate symbolic methods known to ODE. It terminates the first time it successfully finds a solution."

Animation::usage =
"Animation is an option for ODE (default = None). Setting Animation -> {{sym,start,end,inc}} generates a sequence of plots defined by the value of sym from start to end in steps of inc."

Graph::usage = 
"Graph is the name given for future reference to any plot produced by ODE. For example, Graph[1] is the first plot, Graph[2] is the second plot and so forth. This array makes it convenient to redisplay a plot or superimpose two or more plots using the Show command. For example, to superimpose two, say Graph[1] and Graph[3], use Show[{Graph[1],Graph[3]},options]."

SetAttributes[Graph,Listable]

CheckSolution::usage = 
"CheckSolution (default = Yes) forces ODE to verify that the solutions it has obtained are actually solutions to the differential equation. CheckSolution->ReallyYes forces a check of all solutions. CheckSolution->Yes forces a check of all solutions to a nonlinear equation. CheckSolution->No turns off checking. This may be necessary to prevent ODE from hanging up on a long verification. CheckSolution is automatically set to No with Method -> AllSymbolic."

Constants::usage = 
"Constants (default = C) specifies the constants of integration in a solution.  They are outputted in the form C[1],C[2],.... The  name of the constant should not be a
reserved Mathematica word, such as D or N."

LoopMode::usage =
"LoopMode is an internal value for the Method option for ODE. LoopMode attempts to solve a differential equation or system of differential equations by successively trying all appropriate symbolic methods known to ODE, but it does not terminate the first time it successfully finds a solution."

Transform::usage =
"Transform is an internal value for the Method option for ODE. Transform attempts to solve a differential equation or system of differential equations by applying a specific transformation to the equation."

Degree::usage = 
"Degree (default = 5) specifies the explicit degree of the Taylor polynomial for series solutions."

DSolvePackage::usage = 
"DSolvePackage (default = False) specifies whether the package Calculus`DSolve.m is called when is used to solve the differential equation. Once the option DSolvePackage->True has been used, DSolve uses the routines of Calculus`DSolve.m for the remainder of the Mathematica session."

ExpansionPoint::usage = 
"ExpansionPoint (default = 0) specifies the point about which series solutions are to be expanded."

Form::usage = 
"Form (default = Rule) specifies the form of the solution. It is used in the form\n\nForm -> name\n\nThe possible values for Form are\n\nExplicit, Equation, LogEquation, ExpEquation, Function, Implicit, Rule and FundamentalSet.\n\nFor example to get the solution to y'' + y == Sin[t] in the form of an equation enter ODE[y'' + y == Sin[t],y,t,Method -> SecondOrderLinear,Form -> Equation]"

Plotting::usage = 
"The following plotting options are available in ODE: PlotSolution, PlotPhase, PlotEvolvePhase, PlotSingularSolution, StackPlotSolution and PlotField."

Iterations::usage = 
"Iterations (default = 5) specifies the number of iterations for the Method -> Picard."

ODEDigits::usage = 
"ODEDigits (default = Automatic) controls the number of digits displayed for approximate solutions. With ODEDigits->Automatic, the number of digits is determined from the global variable $ODEDigits. Setting ODEDigits->n causes approximate solutions to be displayed using at most n significant digits."

LinearizeAt::usage = 
"LinearizeAt is an option for ODE (default = None). If the input system admits
a critical point equal to the value of this option, the linear system associated with this critical point replaces the original system. If a Method is specified, ODE will use that method to solve the system;  otherwise, it defaults to DSolve. LinearizeAt[sys,y,t,criticalpt] first determines the critical points of the system of equations sys. Then if one of the critical points matches criticalpt, the corresponding linear system is returned."

GraphLabel::usage = 
"GraphLabel (default = None) specifies the label assigned to a graph. This allows the user to refer to a graph using the Mathematica notation Graph[label], where label is either an automatically generated index with GraphLabel->Automatic or a user label assigned with the option GraphLabel->label. GraphLabel->None suppresses the label."

KnownSolution::usage = 
"KnownSolution (default = None) specifies a known solution to a differential equation. It is used with Method->Riccati, Method->ReductionOfOrder and Method->ProposedSet."

ProposedSolution::usage = 
"ProposedSolution (default = None) specifies the solution to a differential equation. It can be used when guessing a solution is an option."

ODEMaxStepSize::usage = 
"ODEMaxStepSize (default = Automatic) specifies the maximum step size used when the VariableStepSize option is chosen for the numerical integration routines."

NumericalOutput::usage = 
"NumericalOutput (default = True) controls the printing of a numerical solution to a differential equation."

ODEDialog::usage = 
"ODEDialog is an option for ODE (default = True). Setting ODEDialog -> False disables the display of several informative messages during the solution of a differential equation."

ODEMaxSteps::usage = 
"ODEMaxSteps (default = 500) specifies the maximum number of iterations allowed in the ImplicitRungeKutta numerical routine."

ODETiming::usage = 
"ODETiming (default = False) allows a timing estimate to be computed during the solution phase. This estimate attempts to eliminate all overhead not directly connected with the solution of the equation, including plotting and post solution operations. It is primarily intended to allow relative comparisons between the various numerical methods."

ODETrace::usage = 
"ODETrace is an option for ODE (default = None except when used with Method -> Automatic, Method -> AllSymbolic, Method -> AllNumerical and Method -> AllNumerical). ODETrace -> All forces a display of all of ODE's internal logic as it searches for a method to solve the differential equation. ODETrace -> None turns off the display. ODETrace -> Partial generates output only when a method is successful."

Parameters::usage = 
"Parameters is an option for ODE (default = None). Parameters -> {{p1,a1,b1,c1},{p2,a2,b2,c2},...} makes a table of solutions expressed in terms of the parameters p1, p2.... The parameters can occur anywhere in the equations, including the initial conditions, or they can be the constants of integration introduced by the solver. Parameters uses Mathematica's command Table with the expressions {p1,a1,b1,c1}, {p2,a2,b2,c2},... serving as iterators."

PlotSingularSolution::usage = 
"PlotSingularSolution is an option for ODE (default = None). PlotSingularSolution -> {{t,a,b},plotoptions} requests a plot of a singular solution to a differential equation on the interval a < t < b. PlotSingularSolution -> {{{t,a,b},{y,c,d}},plotoptions} requests a plot of an explicit or implicit singular solution on the rectangle a < t < b, c < y < d."

PlotSolution::usage = 
"PlotSolution is an option for ODE (default = False). PlotSolution -> {{t,a,b},plotoptions} requests a plot of an explicit solution on the interval a < t < b. PlotSolution -> {{{t,a,b},{y,c,d}},plotoptions} requests a plot of an explicit or implicit solution on the rectangle a < t < b, c < y < d."

PlotField::usage = 
"PlotField is an option for ODE (default = None). PlotField -> {{{t,a,b},{y,c,d}},plotoptions} requests a plot of the vector field generated by a first order differential equation on the rectangle a < t < b, c < y < d. Initial and boundary conditions are ignored. PlotField does not depend on the method of solution."

PlotPhase::usage = 
"PlotPhase is an option for ODE (default = None). PlotPhase -> {{t,a,b},plotoptions} requests a parametric plot of an explicit solution to a system of differential equations on the interval a < t < b. The result is a phase plane plot when there are two dependent variables, or a phase space plot when there are three dependent variables."

PlotEvolvePhase::usage = 
"PlotEvolvePhase is an option for ODE (default = None). PlotEvolvePhase -> {{t,a,b},plotoptions} requests a 3-dimensional parametric plot consisting of an evolved phase portrait of a 2-dimensional system of differential equations. The independent variable is used as the third coordiante. The option EvolveRate -> rate can be used to adjust the rate of procession of the phase orbit."

EvolveRate::usage = 
"EvolveRate is an option for ODE (default = 1). It specifies a factor mutltiplying the third variable when using PlotEvolvePhase."

PostSolution::usage = 
"PostSolution is an option for ODE (default = None). PostSolution -> {f,g,...} causes the pure functions f,g,.... to be applied to the solution before it is returned. A typical function is PowerExpand, which is not always desired or correct.  It may be necessary to use the option Form -> Explicit with PostSolution."

ODEPrecision::usage = 
"ODEPrecision (default = Automatic) specifies an arbitrary precision to be used in a numerical and seminumerical procedures."

SavePlots::usage = 
"SavePlots is an option for ODE (default = False). SavePlots -> True requests that all plots produced by the current command be saved in the current directory. The files containing the plots are named ODEplot#.mma, where # is the number generated by ODE when the plot is created."

StackPlotSolution::usage = 
"StackPlotSolution is an option for ODE (default = False). StackPlotSolution -> {{t,a,b},plotoptions} plots solutions to an initial value problem over the interval a < t < b by calling StackPlot. The result is a 3-dimensional representation in which the solutions are stacked one after the other."

StepSize::usage = 
"StepSize (default = 0.1) specifies the step size used in the numerical integration routines. When the option VariableStepSize->True is employed, the value set by StepSize is used as the initial step size."

SuperimposePlots::usage = 
"SuperimposePlots is an option for ODE (default = False). SuperimposePlots -> True requests that all plots produced by the current command be superimposed on a single plot."

Tolerance::usage = 
"Tolerance (default = 10^-5) specifies the convergence criteria used with Method->ImplicitRungeKutta and when VariableStepSize -> True."

VariableStepSize::usage = 
"VariableStepSize is an option for ODE (default = False). VariableStepSize -> True requests that the single-step accuracy of the numerical solution be determined by the Tolerance, adjusting the StepSize if necessary."

(********************** First Order functions **********************)

Parse::usage = "Parse[eq,y,t] returns the list {F,a,b,c,d,e,n} of components belonging to an equation eq of the form a[t] + b[t]y[t] + c[t]y'[t] + d[t]y''[t] + e[t]y[t]^n = 0 or of the form a[t,y] dt + b[t,y] dy = 0. In addition, for the first case, F represents the expression obtained by solving the equation for its highest derivative, if possible. If the equation is not of this form, the error condition {0,0,0,0,0,0,0} is returned."

GetMatrices::usage = 
"GetMatrices[sys,y,t] computes the matrices a and b from the linear system of equations sys, where the system is assumed to have the form y' = a y + b."

GetSemiNumericalMatrices::usage = 
"GetSemiNumericalMatrices[sys,y,t] numerically approximates the matrices a and b from the linear system of equations sys, where the system is assumed to have the form y' = a y + b."

Trivial::usage = 
"Trivial is a value for the Method option for ODE. This method returns the trivial solution y == constant, if it exists."

Adjoint::usage = 
"Adjoint is a value for the Transformation option for ODE.
Adjoint[eq,y,t] computes the adjoint of the linear nth order differential equation eq."

AutonomousQ::usage = 
"AutonomousQ[eq,y,t] returns True if eq does not contain t and False otherwise."

Autonomous::usage = 
"Autonomous is a value for the Transformation option for ODE. Autonomous[eq,y,t,p] returns an equation of lower order using the transformation y'[t] -> p[y] if eq is an autonomous equation."

AlmostLinearQ::usage = 
"AlmostLinearQ[r,b][t,y] returns True if D[b[y],y]/r[t,y] does not contain y, which implies that  r[t,y]y'[t] + p[x]b[y] = q[x] is almost linear."

AlmostLinear::usage = 
"AlmostLinear[r,b,p,q,expr][t,y] is the solution to the first order linear differential equation r[t,y]y'[t] + p[t]b[y] = q[t], if D[b[y],y]/r[t,y] does not contain y. If expr is a symbol representing the constant of integration, then the general solution is returned."

LinearFractionalQ::usage = 
"LinearFractionalQ[f][t,y] yields True if f(t,y) = p(t,y)/q(t,y) with p and q polynomials of degree one and False otherwise."

LinearFractional::usage = 
"LinearFractional is a value for the Method option for ODE. ODE with Method->LinearFractional attempts to solve a first order differential equation of the form y' = p(t,y)/q(t,y) with p and q polynomials of degree one.\n\n LinearFractional[f,const][t,y] is the solution to the first order linear differential equation y'[t] == p[t,y]/q[t,y] with p and q polynomials of degree one and with constant of integration equal to const."

FirstOrderHomogeneousQ::usage = 
"FirstOrderHomogeneousQ[f][t,y] yields True if f(s t,s y) = f(t,y) and False otherwise. FirstOrderHomogeneousQ[m,n][t,y] yields True if m(s t,s y)/n(s t,s y) = m(t,y)/n(t,y) and False otherwise."

FirstOrderHomogeneous::usage = 
"FirstOrderHomogeneous is a value for the Method option for ODE. ODE with Method->FirstOrderHomgeneous attempts to solve a first order differential equation considered as a first order homogeneous equation.\n\nFirstOrderHomogeneous[f,const][t,y] is the solution to the first order linear differential equation y'[t] == f[t,y] with f[t,y] homogeneous of degree zero and FirstOrderHomogeneous[m,n,const][t,y] is the solution to the first order linear differential equation m[t,y]dt + n[t,y]dy == 0 with m[t,y] and n[t,y] homogeneous of the same degree. In each case, the constant of integration is equal to const."

GeneralizedHomogeneousQ::usage = 
"GeneralizedHomogeneousQ[f][t,y] yields True if t D[t f[t,y]/y,t]/(y D[t f[t,y]/y,y]) is a constant and False otherwise."

GeneralizedHomogeneous::usage = 
"GeneralizedHomogeneous is a value for the Method option for ODE. ODE with Method->GeneralHomgeneous attempts to find the solution to a first order differential equation considered as a general homogeneous equation.\n\nGeneralizedHomogeneous[f,const][t,y] is the solution to the first order linear differential equation y'[t] == f[t,y] whenever t D[t f[t,y]/y,t]/(y D[t f[t,y]/y,y]) is a constant. The constant of integration is equal to const."

(*
MultiplyByDerivative::usage = 
"MultiplyByDerivative is a value for the Method option for ODE. ODE with Method->MultiplyByDerivative attempts to find the solution to a second order differential equation by multiplying the equation by y'[t] and then checking for exactness."
*)

IntegratingFactor::usage = 
"IntegratingFactor is a value for the Method option for ODE. ODE with Method->IntegratingFactor attempts to find an integrating factor for and then solve a first order differential equation. It may be necessary to use CheckSolution->False with this option in order for ODE to complete its task in a reasonable length of time.\n\nIntegratingFactor[m,n,const][t,y] is the solution to the first order linear differential equation m[t,y]dt + n[t,y]dy == 0 when m[t,y] and n[t,y] admit an integrating factor and with constant of integration equal to const."

FirstOrderExactQ::usage =
"FirstOrderExactQ[m,n][t,y] yields True if D[m[t,y],y] = D[n[t,y],t] and False otherwise."

FirstOrderExact::usage = 
"FirstOrderExact is a value for the Method option for ODE. ODE with Method->FirstOrderExact attempts to find the solution to a first order differential equation considering the equation to be an exact equation.\n\nFirstOrderExact[m,n,const][t,y] is the solution to the first order linear differential equation m[t,y]dt + n[t,y]dy == 0 when D[m[t,y],y] == D[n[t,y],t] and with constant of integration equal to const."

SecondOrderExactQ::usage = 
"SecondOrderExactQ[eq,y,t] yields True if eq is exact and False otherwise."

SecondOrderExact::usage = 
"SecondOrderExact is a value for the Transformation option for ODE.\n\nSecondOrderExact[eq,y,t,const] reduces the order of eq, if it is an exact second order differential equation. The  constant of integration is developed in terms of const. Occasionally, the resulting first order equation can be solve in closed form, producing the complete solution."

FirstOrderLinearQ::usage = 
"FirstOrderLinearQ[eq,y,t] yields True if eq is a first order linear equation and False otherwise."

FirstOrderLinear::usage = 
"FirstOrderLinear is a value for the Method option for ODE. ODE with Method->FirstOrderLinear solves a first order differential equation considered as a first order linear differential equation.\n\nFirstOrderLinear[a,b,c,const][t] is the solution to the first order linear differential equation a[t]y'[t] + b[t]y[t] == c[t] with constant of integration equal to const."

HomogeneousSecondOrderLinear::usage = 
"HomogeneousSecondOrderLinear[a,b,c,const][t] is the solution to the second order linear differential equation a y''[t] + b y'[t] + c y[t] == 0 with constant(s) of integration developed in terms of const."

Wronskian::usage =
"Wronskian[y1,y2][t] computes the Wronskian of the pair of functions denoted by y1 and y2. Wronskian[ls][t] computes the Wronskian of the functions in the List denoted by ls."

EquationFromSolutions::usage =
"EquationFromSolutions[y1,y2][t,y] creates a homogeneous second order linear differential equation from a pair of linearly independent solutions denoted by y1 and y2. EquationFromSolutions[sols][t,y] creates an nth order homogeneous linear differential equation from a set of n linearly independent solutions in the List denoted by sols."

ParticularSolution::usage =
"ParticularSolution[eq,y,t,fundset] produces the particular solution to the general nth order linear differential equation eq, where fundset is a fundamental set of solutions to the homogeneous equation. After decomposing the forcing function into simple terms, it first attempts to use the method of undetermined coefficients. If unsuccessful, it switches to the variation of parameters method using fundset to construct the particular solution."

UndeterminedCoefficients::usage =
"UndeterminedCoefficients[eq,y,t,f] attempts to find the particular solution to the nth order linear differential equation eq = f using the method of undetermined coefficients, where f[t] is the forcing function."

VariationOfParameters::usage =
"VariationOfParameters[ls,f][t] produces the particular solution to the general nth order linear differential equation with forcing function f[t] using variation of parameters. The argument ls is a List of linearly independent solutions to the homogeneous equation."

SecondOrderLinear::usage = 
"SecondOrderLinear is a value for the Method option for ODE.\n\nSecondOrderLinear[a,b,c,f,const][t] is the solution of the second order linear differential equation a y''[t] + b y'[t] + c y[t] == f[t] with constant(s) of integration developed in terms of const."

BernoulliQ::usage = 
"BernoulliQ[eq,y,t] returns True if eq is a Bernoulli equation and False otherwise."

Bernoulli::usage = 
"Bernoulli is a value for the Method option for ODE. ODE with Method->Bernoulli attempts to solve a first order differential equation considered as a Bernoulli equation.\n\nBernoulli[a,b,c,n,const][t] is the solution to the Bernoulli first order differential equation a[t]y'[t] + b[t]y[t] == c[t]y[t]^n with constant of integration equal to const."

RiccatiQ::usage = 
"RiccatiQ[eq,y,t] yields True if eq is a Riccati equation and False otherwise."

Riccati::usage = 
"Riccati is a value for the Method option for ODE. ODE with Method->Riccati attempts to solve a first order differential equation considered as a Riccati equation. A known solution, say yk, must be defined using the option KnownSolution -> yk.\n\nRiccati[a,b,c,d,yk,const][t] is the solution to the Riccati first order differential equation a[t]y'[t] == b[t] + c[t]y[t] + d[t]y[t]^2 with yk a known solution and with constant of integration equal to const. The known solution, say yk, must be defined using the option KnownSolution -> yk."

SeparableQ::usage = 
"SeparableQ[f][t,y] yields True if f[t,y] == g[t] h[y] and False otherwise."

Separable::usage = 
"Separable is a value for the Method option for ODE. ODE with Method->Separable attempts to solve a first order differential equation considered as a separable equation.\n\nSeparable[f,const][t,y] determines whether f[t,y] == g[t] h[y]. If possible, the solution is returned with constant of integration equal to const; otherwise the return is True or False according as the differential equation is separable or not."

FactorEquation::usage = 
"FactorEquation is a value for the Transformation option for ODE.\n\nFactorEquation[eq,y,t] determines whether eq can be factored into equations of lower degree. If so, it returns the factors and their multiplicities in a list of the form {{f1,m1},{f2,m2},...,{fk,mk}}."

CriticalPoints::usage = 
"CriticalPoints[sys,y,t] determines the critical points of the system of equations sys."

ExchangeVariables::usage = 
"ExchangeVariables is a value for the Transformation option for ODE.
ExchangeVariables yields the equation t'[y] == 1/f[y,t] derived from y'[t] = f[t,y] by interchanging the variables t and y. It can also be used with higher-order equations."

Clairaut::usage = 
"Clairaut is a value for the Method option for ODE. ODE with Method->Clairaut attempts to solve a first order differential equation considered as a Clairaut equation.\n\nClairaut[f,const][t,y] is the solution to the Clairaut equation y[t] == t y'[t] + f[y'[t]] with constant of integration equal to const. If detected, singular solutions are also reported."

ClairautQ::usage = 
"ClairautQ[eq,y,t] yields True if eq is a Clairaut equation and False otherwise."

Lagrange::usage = 
"Lagrange is a value for the Method option for ODE. ODE with Method->Lagrange attempts to solve a first order differential equation considered as a Lagrange equation.\n\nLagrange[f,g,const][t,y] is the solution to Lagrange's equation y[t] == t f[y'[t]] + g[y'[t]] with constant of integration equal to const. If detected, singular solutions are also reported."

LagrangeQ::usage = 
"LagrangeQ[eq,y,t] yields True if eq is a Lagrange equation and False otherwise."

Laplace::usage = 
"Laplace is a value for the Method option for ODE. ODE with Method->Laplace attempts to solve a constant coefficient linear differential equation or first order system of linear differential equations using Laplace transforms.\n\nThe command form is Laplace[eqs,depvar,indepvar]. If initial conditions are not given, the solution is returned with the constants of integration expressed in terms of the initial conditions."

SetAttributes[Laplace,HoldAll]

ReductionOfOrder::usage = 
"ReductionOfOrder is a value for the Method option for ODE.\n\nReductionOfOrder[a,b,yk][t] uses a known solution yk to produce a second linearly independent solution to the second order homogeneous linear differential equation a[t] y''[t] + b[t] y'[t] + c[t] y[t] == 0.\n ReductionOfOrder[a,b,yk,const][t] uses a known solution yk to produce a second linearly independent solution, hence the general solution, to a second order homogeneous linear differential equation with constants of integration equal to const.\n\n

ReductionOfOrder is also a value for the Transformation option for ODE.\n\nReductionOfOrder[eq,y,t,yk,newvar] reduces the order of a differential equation eq if a known solution, say yk, is known. The new dependent variable is defined by newvar. The known solution, say yk, must be defined using the option KnownSolution -> yk."

Trajectory::usage =
"Trajectory is a value for the Transformation option for ODE.\n\nTrajectory[eq,y,t,theta] converts the first order differential equation F[t,y,y'] = 0 into F[t,y,(y' - Tan[theta])/(1 + Tan[theta] y')] = 0, where theta specifies the angle at which solutions to the new equation are to intersect solutions to the original equation. The familiar orthogonal trajectory is obtained with theta = Pi/2. The angle of intersection must be defined by TransformationVariable -> theta, where -Pi/2 <= theta <= Pi/2."

HomogeneousLinearSystem::usage = 
"HomogeneousLinearSystem[sys,y,t,const] is the solution to the constant coefficient linear system of differential equations sys with constant(s) of integration developed in terms of const. HomogeneousLinearSystem[a,const][t] is the solution to the linear system of differential equations y'[t] = a y[t] with constant(s) of integration developed in terms of const. Here a is a matrix and y is a list of dependent variables."

LinearSystem::usage = 
"LinearSystem is a value for the Method option for ODE. ODE with Method->LinearSystem attempts to solve a constant coefficient linear system of differential equations.\n\nLinearSystem[sys,y,t,const] is the solution to the constant coefficient linear system of differential equations sys with constant(s) of integration developed in terms of const. LinearSystem[a,b,const][t] is the solution to the linear system of differential equations y'[t] = a y[t] + b with constant(s) of integration developed in terms of const."

VariationOfParametersLinearSystem::usage =
"VariationOfParametersLinearSystem[a,f][t] produces the particular solution to a constant coefficient linear system of differential equations with forcing function f using variation of parameters. The argument a is a List of linearly independent solutions to the homogeneous system."

ApproximateLinearSystem::usage = 
"ApproximateLinearSystem is a value for the Method option for ODE. ODE with Method->ApproximateLinearSystem approximates the solution to a constant coefficient linear system of differential equations by using NSolve to approximate the spectrum of the coefficient matrix.\n\nApproximateLinearSystem[sys,y,t,const] is the solution to the constant coefficient linear system of differential equations sys obtained from NSolve by approximating the spectrum of the coefficient matrix. The constant(s) of integration are developed in terms of const."

LinearQ::usage = 
"LinearQ[eq,y,t] yields True if eq is a linear differential equation and False otherwise."

CauchyEulerQ::usage = 
"CauchyEulerQ[eq,y,t] yields True if eq is a Cauchy-Euler differential equation and False otherwise."

CauchyEuler::usage = 
"CauchyEuler is a value for the Transformation option for ODE.
CauchyEuler[eq,y,t] yields a constant coefficient linear equation if eq is a Cauchy-Euler differential equation. The corresponding ODE Methods are called NthOrderCauchyEuler, NthOrderCauchyEulerComplex and ApproximateNthOrderCauchyEuler."

GetCoefficients::usage = 
"GetCoefficients[eq,y,t] returns the list of coefficients {f[t],a0(t),...,an(t)} for a linear equation of the form an(t) y^(n)[t] + ... + a2(t) y''[t] + a1(t) y'[t] + a0(t) y[t] == f[t]."

ConvertToSystem::usage = 
"ConvertToSystem[eq,y,t,z] returns a system of first order differential equations equivalent to eqs. The new dependent variables for the system are defined as z1, z2,..."

DependentMissing::usage = 
"DependentMissing is a value for the Transformation option for ODE. DependentMissing[eq,y,t,p] returns an equation of lower order using the transformation y'[t] -> p[t] if eq does not contain y[t]."

SecondOrderLinearToConstantsQ::usage = 
"SecondOrderLinearToConstantsQ[a,b,c][t] yields True if the second order linear differential equation a[t]y''[t] + b[t]y'[t] + c[t]y[t] = 0 can be transformed into one with constant coefficients."

SecondOrderLinearToConstants::usage =
"SecondOrderLinearToConstants is a value for the Method option for ODE.\n\nSecondOrderLinearToConstants[a,b,c,const][t] attempts to find a solution to the second order linear differential equation a[t]y''[t] + b[t]y'[t] + c[t]y[t] = 0 with constant(s) of integration developed in terms of const."

EquidimensionalInIndependentQ::usage = 
"EquidimensionalInIndependentQ[eq,y,t] yields True if the equation remains invariant under the transformation  t -> a t, where a is a constant. If so, it can be transformed into one of lower order using the mapping t -> Exp[x]."

EquidimensionalInIndependent::usage = 
"EquidimensionalInIndependent is a value for the Transformation option for ODE. EquidimensionalInIndependent[eq,y,t] yields an equation of lower order using the transformation t -> Exp[x] if eq is equidimensional in the independent variable."

EquidimensionalInDependentQ::usage = 
"EquidimensionalInDependentQ[eq,y,t] yields True if the equation remains invariant under the transformation  y -> a y, where a is a constant. If so, it can be transformed into one of lower order using the mapping y[t] -> Exp[u[t]]."

EquidimensionalInDependent::usage = 
"EquidimensionalInDependent is a value for the Transformation option for ODE. EquidimensionalInDependent[eq,y,t,u] yields an equation of lower order using the transformation y[t] -> Exp[u[t]] if eq is equidimensional in the dependent variable."

ImposeInitialValues::usage =
"ImposeInitialValues[sol,const,initvals_List][t,y] imposes a set of initial conditions, denoted by initvals expressed in terms of the constant const on the expression sol. Typically, sol is the solution of a differential equation with constants of integration developed in terms of const. Also, initvals must be a list of the form {t0,y[t0],y'[t0],...}. For example, ImposeInitialValues[y[t] == C1 E^t + C2 E^(2t),C,{0,1,3}][t,y[t]] imposes the initial conditions y[0] = 1, y'[0] = 3 on the equation, producing the specific solution."

Transformation::usage = 
"Transformation is an option for ODE (default = None). Transformation[eq,{newindepvar,t->indepvarfn,y[t]->depvarfn}] applies the transformation defined by the rules to the equation.\n\nFor example, the following command transforms the independent variable t to Exp[a x]:\n\nODE[eq,Transformation -> {x,t -> Exp[a x],y[t] -> y[x]}].\n\nSimilarly, transformation of the dependent variable y[t] to u[y[t]] is accomplished by\n\nODE[eq,Transformation -> {t,t -> t,y[t] -> u[y[t]]}].\n\nA transformation to polar coordinates could be performed with\n\nODE[eq,Transformation -> {s,t -> r[s]Cos[s],y[t] -> r[s]Sin[s]}].\n\nFor a complete list of predefined transformations type ?Transformationpage2."

Transformationpage2::usage = 
"In addition to an arbitrary rule, Transformation can have the following specific values:\n\nAdjoint, Autonomous, CauchyEuler, ConvertToSystem, DependentMissing, EquidimensionalInDependent, EquidimensionalInIndependent, ExchangeVariables, FactorEquation, ReductionOfOrder, RiccatiToSecondOrderLinear, SecondOrderExact,  SecondOrderLinearToRiccati, SolvableForDependent, SolvableForIndependent and Trajectory."

TransformationVariable::usage = 
"TransformationVariable is an option for ODE (default = None). This option specifies a new variable needed by some transformations."

TransformationDepth::usage = 
"TransformationDepth is an option for ODE (default = 0). This option specifies the maximum number of consecutive transformations applied to an equation during Method->Automatic."

RiccatiToSecondOrderLinear::usage =
"RiccatiToSecondOrderLinear[eq,y,t] converts the Riccati equation a[t]y'[t] == b[t] + c[t]y[t] + d[t]y[t]^2 into a second order linear homogeneous equation."

SecondOrderLinearToRiccati::usage =
"SecondOrderLinearToRiccati[eq,y,t] converts the second order linear homogeneous equation y''[t] + p[t]y'[t] + q[t]y[t] == 0 into the Riccati equation w'[t] == -q[t] - p[t]w[t] - w[t]^2."

SolvableForIndependentQ::usage = 
"SolvableForIndependentQ[eq,y,t] yields True if the first order equation can be written t = f[y,y'] and False otherwise."

SolvableForIndependent::usage = 
"SolvableForIndependent is a value for the Transformation option for ODE.
SolvableForIndependent[eq,y,t,p] attempts to solve an equation which can be written t = f[y,y']. We use the transformation dt/dy = 1/p[t]."

SolvableForDependentQ::usage = 
"SolvableForDependentQ[eq,y,t] yields True if the first order equation can be written y = f[t,y'] and False otherwise."

SolvableForDependent::usage = 
"SolvableForDependent is a value for the Transformation option for ODE. 
SolvableForDependent[eq,y,t,p] attempts to solve a differential equation which can be written y = f[t,y']. The transformation dy/dt = p[t] is used."

ProposedSet::usage = 
"ProposedSet is a value for the Method option for ODE.\n\n ProposedSet[eq,y,t,fundset,f,const] checks whether the functions defined in the list fundset form a fundamental set of solutions for the linear differential equation eq. If so, variation of parameters is used with the forcing function f to produce the general solution expressed with constant(s) of integration developed in terms of const."


(************************* Series functions ************************)

Polynomial::usage = 
"Polynomial[var,coef,degree] constructs a polynomial of specified degree in the variable var with coefficients coef."

PowerSeries::usage = 
"PowerSeries[var,coef,degree] constructs a power series with explicit terms through degree in the variable var with coefficients coef."

FrobeniusSeries::usage = 
"FrobeniusSeries[var,coef,param,degree] constructs a Frobenius series with explicit terms through degree in the variable var with coefficients coef using param as the Frobenius parameter."

Lowset::usage = 
"Lowset[expr,coef,exporder,expmax] returns the list of coefficients in expr expressed by coef indexed from 0 to exporder - 1. Lowset is a convenience function when working with series, a typical expr."

Highset::usage = 
"Highset[expr,coef,exporder,expmax] returns the list of coefficients in expr expressed by coef indexed from exporder through expmax. Highset is a convenience function for working with series, a typical expr."

DEOrder::usage = 
"DEOrder[eq,y,t] determines the order of the differential equation eq expressed in terms of independent variable t and dependent variable y. The equation is assumed to be of the form F(t,y(t),y'(t),...,y^(n)(t)) = 0."

SeriesForm::usage = 
"SeriesForm is a value for the Method option for ODE.\n\nSeriesForm[eq,y,t,const,degree] attempts to find either a power series solution or a Frobenius series solution to a differential equation with maximum degree through which the solution is developed with constant(s) of integration equal to const. The degree of the series expansions may be defined using the option Degree -> degree."

SetAttributes[SeriesForm,HoldFirst]

SeriesFormCauchy::usage = 
"SeriesFormCauchy is a value for the Method option for ODE.\n\n SeriesFormCauchy[eq,y,t,const,degree] attempts to find either a power series solution or a Frobenius series solution to a second order linear differential equation with maximum degree through which the solution is developed and with constant(s) of integration equal to const. The degree of the series expansions may be defined using the option Degree -> degree."

SetAttributes[SeriesFormCauchy,HoldFirst]

(************************* Numerical routines ************************)

NumericalMethods::usage =
"The complete list of numerical methods is given by:\n\n
\tAdamsBashforth\n
\tBulirschStoer\n
\tEuler\n
\tHeun\n
\tImplicitRungeKutta\n
\tMilne\n
\tNDSolve\n
\tNumerov\n
\tRungeKutta4\n
\tRungeKutta45\n
\tSecondOrderEuler\n\n

The complete list of seminumerical methods is given by:\n\n
\tApproximateLinearSystem\n
\tApproximateNthOrderCauchyEuler\n
\tApproximateNthOrderLinear\n
\tPicard\n
\tSeriesForm\n
\tSeriesFormCauchy\n
\tTaylorSeries\n\n

Each can be called using ODE in the following form:\n\n

ODE[{\ty1'[t] == f1[t,y1,y2,...,yn],y1[t0] == Y1,\n
\ty2'[t] == f2[t,y1,y2,...,yn],y2[t0] == Y2,...},{t0,a,b},\n
\tMethod -> method]\n\n

where\n\n

\ty1'[t] = f1[t,y1,y2,...,yn], y1[t0] = Y1,\n
\ty2'[t] = f2[t,y1,y2,...,yn], y2[t0] = Y2,\n
\t  :               :                 :\n
\tyn'[t] = fn[t,y1,y2,...,yn], yn[t0] = Yn,\n\n

and\n\n

\t[a,b] is the interval of integration. In addition, one may define a particular step size with the option StepSize -> h. Since the Bulirsch-Stoer algorithm is developed for an arbitrary order (default = 4), one may also define the order of the method using BulirschStoerOrder -> n."

TaylorSeries::usage = 
"TaylorSeries is a value for the Method option for ODE.\n\nTaylorSeries[f,{t0,Y0},degree][t,y] is the numerical solution to the first order linear differential equation y'[t] == f[t,y] with initial condition y(t0) = Y0 implementing the Taylor series method. Here, degree defines the degree of the approximating Taylor polynomial." 
 
Picard::usage = 
"Picard is a value for the Method option for ODE. The number of iterations
(default = 5) can be specified with the option Iterations.\n\nPicard[f,{t0,Y0},iter][t] is the numerical solution to the first order linear differential equation y'[t] == f[t,y] with initial condition y(t0) = Y0 implementing the Picard method. The option iter produces the sequence of iterations from 0 to iter while {iter} will only produce the last term." 
 
Euler::usage = 
"Euler is a value for the Method option for ODE (type ?NumericalMethods).\n\nEuler[f,{t0,Y0},h,steps][t,y] is the numerical solution to the first order linear differential equation y'[t] == f[t,y] with initial condition y(t0) = Y0 implementing the Euler method. Euler assumes a constant step size equal to h and number of steps equal to steps." 
 
Heun::usage = 
"Heun is a value for the Method option for ODE (type ?NumericalMethods).\n\nHeun[f,{t0,Y0},h,steps][t,y] is the numerical solution to the first order linear differential equation y'[t] == f[t,y] with initial condition y(t0) = Y0 implementing the improved Euler method. Heun assumes a constant step size equal to h and number of steps equal to steps" 

SecondOrderEuler::usage = 
"SecondOrderEuler is a value for the Method option for ODE (type ?NumericalMethods).\n\nSecondOrderEuler[f,{t0,Y0},h,steps][t,y] is the numerical solution to the first order linear differential equation y'[t] == f[t,y] with initial condition y(t0) = Y0 implementing the Euler method incorporating the second order term in the Taylor series approximation. SecondOrderEuler assumes a constant step size equal to h and number of steps equal to steps." 
  
RungeKutta4::usage = 
"RungeKutta4 is a value for the Method option for ODE (type ?NumericalMethods).\n\nRungeKutta4[f,{t0,Y0},h,steps][t,y] is the numerical solution to the first order linear differential equation y'[t] == f[t,y] with initial condition y(t0) = Y0 implementing the 4th order Runge-Kutta algorithm. RungeKutta4 assumes a constant step size equal to h and number of steps equal to steps." 
 
RungeKutta45::usage = 
"RungeKutta45 is a value for the Method option for ODE (type ?NumericalMethods).\n\nRungeKutta45[f,{t0,Y0},h,steps][t,y] is the numerical solution to the first order linear differential equation y'[t] == f[t,y] with initial condition y(t0) = Y0 implementing the Runge-Kutta-Fehlberg (4)5 algorithm. RungeKutta45 assumes a constant step size equal to h and number of steps equal to steps." 
 
ImplicitEuler::usage = 
"ImplicitEuler is a value for the Method option for ODE (type ?NumericalMethods).\n\nImplicitEuler[f,{t0,Y0},h,steps][t,y] is the numerical solution to the first order linear differential equation y'[t] == f[t,y] with initial condition y(t0) = Y0 implementing the 1st order Implicit Euler algorithm. ImplicitEuler assumes a constant step size equal to h and number of steps equal to steps." 
 
ImplicitRungeKutta::usage = 
"ImplicitRungeKutta is a value for the Method option for ODE (type ?NumericalMethods).\n\nImplicitRungeKutta[f,{t0,Y0},h,steps][t,y] is the numerical solution to the first order linear differential equation y'[t] == f[t,y] with initial condition y(t0) = Y0 implementing the 3rd order Implicit Runge-Kutta algorithm. ImplicitRungeKutta assumes a constant step size equal to h and number of steps equal to steps." 
 
Milne::usage = 
"Milne is a value for the Method option for ODE (type ?NumericalMethods).\n\nMilne[f,{t0,Y0},h,steps][t,y] is the numerical solution to the first order linear differential equation y'[t] == f[t,y] with initial condition y(t0) = Y0 implementing the Milne predictor-corrector algorithm. Milne assumes a constant step size equal to h and number of steps equal to steps." 
 
AdamsBashforth::usage = 
"AdamsBashforth is a value for the Method option for ODE (type ?NumericalMethods).\n\nAdamsBashforth[f,{t0,Y0},h,steps][t,y] is the numerical solution to the first order linear differential equation y'[t] == f[t,y] with initial condition y(t0) = Y0 implementing the Adams-Bashforth predictor-corrector algorithm. AdamsBashforth assumes a constant step size equal to h and number of steps equal to steps." 

BulirschStoerOrder::usage = 
"BulirschStoerOrder (default = 4) specifies an arbitrary order to be used in the Bulirsch-Stoer numerical integration procedure."

BulirschStoer::usage = 
"BulirschStoer is a value for the Method option for ODE (type ?NumericalMethods). BulirschStoer[f,{t0,Y0},h,steps,n][t,y] is the numerical solution to the first order linear differential equation y'[t] == f[t,y] with initial condition y(t0) = Y0 implementing the nth order Bulirsch-Stoer algorithm. BulirschStoer assumes a constant step size equal to h and number of steps equal to steps." 

Numerov::usage = 
"Numerov is a value for the Method option for ODE (type ?NumericalMethods). Numerov[f,g,{t0,Y0,Y1},h,steps][t,y] is the numerical solution to the second order differential equation y''[t] == f[t] y + g[t] with initial condition y(t0) = Y0, y'(t0) = Y1 implementing the Numerov algorithm. Numerov assumes a constant step size equal to h and number of steps equal to steps." 

(************************* High-order routines ************************)

TableLookup::usage = 
"TableLookup is a value for the Method option for ODE. ODE with Method->TableLookup attempts to find the solution to eq using an internal table of known solutions.\n\nTo see a list of the equations supported by Method->TableLookup type ?*Equation, and to get more specific help on a particular Equation type ?nameEquation.\n\nTableLookup[eq,y,t,const] checks an internal table for a known solution to eq. If found, the solution is returned with the constant of integration equal to const."

ApproximateNthOrderLinear::usage = 
"ApproximateNthOrderLinear is a value for the Method option for ODE.\n\nApproximateNthOrderLinear[eq,y,t,const] approximates the roots of the characteristic equation to produce the solution to the nth order linear differential equation an y^(n)[t] + ... + a2 y''[t] + a1 y'[t] + a0 y[t] == f[t] with constant(s) of integration developed in terms of const."

NthOrderLinear::usage = 
"NthOrderLinear is a value for the Method option for ODE.\n\nNthOrderLinear[eq,y,t,const] attempts to find an exact solution to the nth order linear differential equation an y^(n)[t] + ... + a2 y''[t] + a1 y'[t] + a0 y[t] == f[t]. If the roots of the characteristic equation cannot be symbolically computed with Solve, then they are approximated using NSolve. In either case, the constant(s) of integration are developed in terms of const."

NthOrderLinearComplex::usage = 
"NthOrderLinearComplex is a value for the Method option for ODE.\n\nNthOrderLinearComplex[eq,y,t,const] attempts to find an exact solution to the nth order linear differential equation an y^(n)[t] + ... + a2 y''[t] + a1 y'[t] + a0 y[t] == f[t], expressing the solution in terms of complex exponentials. If the roots of the characteristic equation cannot be symbolically computed with Solve, then they are approximated using NSolve. In either case, the constant(s) of integration are developed in terms of const."

NthOrderCauchyEuler::usage = 
"NthOrderCauchyEuler is a value for the Method option for ODE.\n\nNthOrderCauchyEuler[eq,y,t,const] attempts to find an exact solution to the nth order Cauchy-Euler differential equation an t^n y^(n)[t] + ... + a2 t^2 y''[t] + a1 t y'[t] + a0 y[t] == f[t]. If the roots of the characteristic equation cannot be symbolically computed with Solve, then they are approximated using NSolve. In either case, the constant(s) of integration are developed in terms of const."

NthOrderCauchyEulerComplex::usage = 
"NthOrderCauchyEulerComplex is a value for the Method option for ODE.\n\nNthOrderCauchyEulerComplex[eq,y,t,const] attempts to find an exact solution to the nth order Cauchy-Euler differential equation an t^n y^(n)[t] + ... + a2 t^2 y''[t] + a1 t y'[t] + a0 y[t] == f[t], expressing the solution in terms of complex exponentials. If the roots of the characteristic equation cannot be symbolically computed with Solve, then they are approximated using NSolve. In either case, the constant(s) of integration are developed in terms of const."

ApproximateNthOrderCauchyEuler::usage = 
"ApproximateNthOrderCauchyEuler is a value for the Method option for ODE.\n\nApproximateNthOrderCauchyEuler[eq,y,t,const] approximates the roots of the characteristic equation to produce the solution to the nth order Cauchy-Euler differential equation an t^n y^(n)[t] + ... + a2 t^2 y''[t] + a1 t y'[t] + a0 y[t] == f[t] with constant(s) of integration developed in terms of const."

AmplitudePhaseAngle::usage =
"AmplitudePhaseAngle[expr] attempts to converts an expression of the form\n
c1 Cos[w] + c2 Sin[w] to the form R Cos[w - alpha], where R is the amplitude and alpha is the phase."

SuppressAsymptotes::usage = 
"SuppressAsymptotes is an option for ODE (default = False). SuppressAsymptotes -> True requests that asymptotes not be drawn on a plot."

SubstituteQ::usage = 
"SubstituteQ[eqn,y,t,sol] yields True if sol is a solution of the differential equation eqn and False otherwise."

ShowEquilibriumPoints::usage = 
"ShowEquilibriumPoints is an option for ODE (default = False). ShowEquilibriumPoints -> True requests that the equilibrium points be drawn on a phase plot."

EquilibriumPointColor::usage = 
"EquilibriumPointColor is an option for ODE (default = Red). EquilibriumPointColor -> color requests that the equilibrium points be drawn in the desired color."

ShowEigenspaces::usage = 
"ShowEigenspaces is an option for ODE (default = False). ShowEigenspaces -> True requests that the eigenspaces be drawn on a phase plot."

EigenspaceColor::usage = 
"EigenspaceColor is an option for ODE (default = Blue). EigenspaceColor -> color requests that the eigenspaces be drawn in the desired color."

(************************* TableLookup routines ************************)

AiryEquation::usage = "y'' == a t y"
BesselEquation::usage = "t^2 y'' + t y' + (k^2 t^2 - n^2) y == 0"
ModifiedBesselEquation::usage = "t^2 y'' + t y' - (k^2 t^2 + n^2) y == 0"
ChebyshevEquation::usage = "(1 - t^2) y'' - t y' + n^2 y == 0"
ErrorFunctionEquation::usage = "y'' + 2t y' - 2n y == 0"
HermiteEquation::usage = "y'' - 2t y' + 2n y == 0"
HypergeometricEquation::usage = "t(1 - t) y'' + (c - (a + b + 1)t) y' - a b y == 0"
KummerEquation::usage = "t y'' + (c - t) y' - a y == 0"
LaguerreEquation::usage = "t y'' (a + 1 - t) y' + n y == 0"
LegendreEquation::usage = "(1 - t^2) y'' - 2t y' + (n(n + 1) - m^2/(1 - t^2)) y == 0"
LegendreEquaton::usage = "(1 - t^2) y'' - 2t y' + (n(n + 1) - m^2/(1 - t^2)) y == 0"
PendulumEquation::usage = "y'' + a Sin[y] == 0"

(************************* General Runtime messages ************************)

ODE::notmethod =
"`1` is an unknown Method option for ODE. Enter ?Method to see a list of available Methods."

ODE::nottransform =
"`1` is an unknown Transformation option for ODE. Enter ?Transformation to see a list of available Transformations."

ODE::notform =
"`1` is an unknown Form option for ODE. Enter ?Form to see a list of available Forms."

ODE::notype =
"`1` is not of type `2`."

ODE::wrongnumargs =
"ODE requires at least 3 arguments."

ODE::wrongargs =
"Wrong number of arguments for ODE."

ODE::notde =
"Not a differential equation or system of differential equations."

ODE::notfo =
"Not a first order differential equation."

ODE::notsup =
"Method not supported for a system of differential equations."

ODE::notfos =
"Not a system of first order differential equations."

ODE::not1lin =
"Not a first order linear differential equation."

ODE::notlin =
"Not a linear system of differential equations."

ODE::notfols =
"Not a first order linear system of differential equations."

ODE::notconcoeff =
"Not a constant coefficient system of differential equations."

ODE::notalin =
"This differential equation is not almost linear."

ODE::not1exact =
"This differential equation is not first order exact."

ODE::notsep =
"This differential equation is not separable."

ODE::hairy =
"This differential equation is separable but too complicated for me now. 
Try Method -> IntegratingFactor."

ODE::thairy =
"This differential equation cannot be solved by TableLookup."

ODE::notlaplace =
"This differential equation is too complicated for Method -> Laplace."

ODE::notatzero =
"Method -> Laplace requires that the initial conditions be at zero."

ODE::notgenhom =
"This differential equation is not a generalized homogeneous differential equation."

ODE::nosol = 
"No known solution given for this differential equation. To use ReductionOfOrder or Riccati, one must define a known solution by KnownSolution -> f[t]."

ODE::nosolp = 
"No known solutions given for this differential equation. To use ProposetSet one must define a set of known solutions by KnownSolution -> {f[t],g[t]...}."

ODE::toofewsol = 
"Not enough known solutions given for this differential equation. The number of known solutions must be equal to `1`, the order of the equation."

ODE::notzero = 
"ReductionOfOrder requires a non-zero known solution."

ODE::norule = 
"No transformation rules given for this differential equation."

ODE::notsoltc = 
"This differential equation cannot be transformed into one with constant coefficients."

ODE::notriccati = 
"This differential equation is not a Riccati equation."

ODE::notce = 
"This differential equation is not a Cauchy-Euler equation."

ODE::notbernoulli = 
"This differential equation is not a Bernoulli equation."

ODE::notclairaut = 
"This differential equation is not a Clairaut equation."

ODE::notlagrange = 
"This differential equation is not a Lagrange equation."

ODE::multsol =
"Multiple solutions found. Choosing: `1` = `2`"

ODE::nothomo = 
"This differential equation is not homogeneous."

ODE::notlinfract = 
"This differential equation is not in linear fractional form."

ODE::baddegree =
"Degree must be a non-negative integer."

ODE::notseclin =
"This differential equation is not second order linear."

ODE::notconcoef =
"This differential equation does not have constant coefficients."

ODE::notsecord =
"This differential equation is not second order."

ODE::notsol =
"The indicated known solution is not a solution to this differential equation."

ODE::noinit =
"Initial condition required for numerical approximation."

ODE::notvar =
"A TransformationVariable is required for this transformation."

ODE::errics =
"Incorrect number of initial conditions."

ODE::nointerval =
"An interval, say {t,a,b}, is required for a numerical integration on the interval [a,b]."

ODE::badinterval =
"Interval for numerical integration improperly defined."

ODE::badstepsize =
"StepSize must be greater than zero."

ODE::badrange =
"Plotting region improperly defined."

ODE::arbitrary =
"Solution contains arbitrary constants and cannot be plotted."

ODE::explicit =
"An explicit solution cannot be found."

ODE::noconds =
"Initial/boundary conditions cannot be applied to this solution." 

ODE::notable =
"Table lookup only supported for second order equations."

ODE::ieunstable =
"Implicit Euler failed to converge - reduce StepSize or increase Tolerance."

ODE::iefail =
"Implicit Euler failed to converge - check ODEMaxSteps and Tolerance."

ODE::irkunstable =
"Implicit Runge-Kutta failed to converge - reduce StepSize or increase Tolerance."

ODE::irkfail =
"Implicit Runge-Kutta failed to converge - check ODEMaxSteps and Tolerance."

ODE::notcritpt =
"Input point `1` is not a valid critical point for this system."

ODE::notbal =
"Number or order of initial conditions does not agree with order of equation."

ODE::nosing =
"No singular solution found for this equation."

ODE::wrongord =
"The Numerov method requires a system of second order equations."

ODE::ambigeqs =
"Ambiguous system of equations."

ODE::ambigconds =
"Ambiguous initial conditions."

ODE`No;
ODE`Yes;

Begin["`Private`"]

knownmethods = {AdamsBashforth, AllSymbolic, AllNumerical, AllSemiNumerical, AlmostLinear, ApproximateLinearSystem, ApproximateNthOrderLinear, ApproximateNthOrderCauchyEuler, ApproximateSecondOrderCauchyEuler, ApproximateSecondOrderLinear, Automatic, Bernoulli, BulirschStoer, CauchyEuler, Clairaut, DSolve, Euler, FirstOrderExact,  FirstOrderHomogeneous, FirstOrderLinear, GeneralizedHomogeneous, ImplicitRungeKutta, Heun, ImplicitEuler, IntegratingFactor, Lagrange, Laplace, LinearFractional, LinearSystem, Milne, NDSolve, None, NthOrderCauchyEuler, ProposedSet, NthOrderCauchyEulerComplex, NthOrderLinear, NthOrderLinearComplex, Numerov, Picard, ReallyAll, ReductionOfOrder, Riccati, RungeKutta4, RungeKutta45, SecondOrderEuler, SecondOrderLinear, SecondOrderLinearToConstants, Separable, SeriesForm, SeriesFormCauchy, TableLookup,  TaylorSeries, Trivial};

singleeqset = {AlmostLinear, ApproximateNthOrderLinear, ApproximateNthOrderCauchyEuler, ApproximateSecondOrderCauchyEuler, ApproximateSecondOrderLinear, Bernoulli, CauchyEuler, Clairaut, FirstOrderExact,  FirstOrderHomogeneous, FirstOrderLinear, GeneralizedHomogeneous, IntegratingFactor, Lagrange, LinearFractional, NthOrderCauchyEuler, ProposedSet, NthOrderCauchyEulerComplex, NthOrderLinear, NthOrderLinearComplex, Picard, ReductionOfOrder, Riccati, SecondOrderLinear, SecondOrderLinearToConstants, Separable, SeriesForm, SeriesFormCauchy, TableLookup, TaylorSeries};

(* Add NewMethod to the appropriate list *)

NewFirstOrderMethods 	= {};	(* {NewFirstMethod,etc}; *)
NewHighOrderMethods 	= {};	(* {NewSecondMethod,etc}; *)
NewSemiNumericalMethods = {};	(* {NewSemiMethod,etc}; *)
NewNumericalMethods 	= {};	(* {NewNumericalMethod,etc}; *)

knowntransformations = {Adjoint, Autonomous, CauchyEuler, ConvertToSystem, DependentMissing, EquidimensionalInDependent, EquidimensionalInIndependent, ExchangeVariables, FactorEquation, None, ReductionOfOrder, RiccatiToSecondOrderLinear,
SecondOrderExact, SecondOrderLinearToRiccati, SolvableForDependent, SolvableForIndependent, Trajectory};

knownforms = {"Equation", "LogEquation", "ExpEquation", "Implicit", "Explicit", "Rule", "Function", "FundamentalSet"};

If[$VersionNumber < 4.0,
	`LaplaceTransform = Calculus`LaplaceTransform`LaplaceTransform;
	`InverseLaplaceTransform = Calculus`LaplaceTransform`InverseLaplaceTransform,
	`LaplaceTransform = System`LaplaceTransform;
	`InverseLaplaceTransform = System`InverseLaplaceTransform
];

InternalPVFPlot = Graphics`PlotField`PlotVectorField;
InternalImpPlot = Graphics`ImplicitPlot`ImplicitPlot;
InternalStackPlot = Graphics`Graphics3D`StackGraphics;

(* ODE`Private` global variables *)
$ODEDigits = 3;
$ODETracex = True;
$ODEPartialx = True;
$ODEDialogx = True;
$ODECheckSolution = Automatic;

usermethod = False;
varstepsize = False;
timeused=0;
equationform = True;
solvedform = False;
expansionpt=0;
dsolve = False;
laplace = False;
multlistplot = False;
implicitplot = False;
plotvectorfield = False;
stackplot = False;
singularsolution = 0;
exception = False;
trivial = False;
riccati = False;
xchanging = False;
polar = False;
factoring = False;
solvabledependent = False;		
solvableindependent = False;		
equidimdependent = False;
equidimindependent = False;
dependentmissing = False;
autonomous = False;
transformationdepth = 0;
transformationlevel = 0;
tfset[st_] := ToExpression[StringReplace[ToString[InputForm[st]]/.
{ODEA->"A_constant",ODEB->"B_constant",ODEC->"C_constant"},"ODE"->""]];

tolerance = 10^(-5);
maxsteps = 500;
precision = Precision[N[1]];
bulirschstoerorder = 4;
yhat = 0;

ParseError = {0,0,0,0,0,0,0};
ODEFail    = False;

two  	= 2;
three  	= 3;
four 	= 4;
five	= 5;
six  	= 6;
eight  	= 8;
twelve  = 12;
mc1 	= {8/3,-4/3,8/3};
mc2 	= {1/3,4/3,1/3};	
ac1 	= {55/24,-59/24,37/24,-9/24};
ac2 	= {9/24,19/24,-5/24,1/24};

(* Low level ODE`Private` global variables *)
stak;				(* Internal stack frame for ODE *)
stakndx;			(* Index for internal stack frame *)
systemyt;			(* System of equations explicit in t *)
systemy;			(* System of equations implicit in t *)
initconds;			(* Initial conds as vector; boundary conds as matrix *)
initeqs;			(* Initial/boundary conditions as equations *)
initrules;			(* Initial/boundary conditions as rules *)
ordering;			(* Numerical solution output ordering *)
yvars;				(* Original set of dependent variables *)
ytset;				(* Set of dependent variables explicit in t *)
yset;				(* Set of dependent variables implicit in t *)
tset;				(* Set of independent variables *)
delt;				(* Differential of independent variable *)
dely;				(* Differential of dependent variable *)
numberofeqs;		(* Single equation (1) or system of equations (>1) *)
order;				(* Differential order of equation *)
exact;				(* No approximate numbers in equation *)
linear;				(* Linear equation or linear system of equations *)
constcoeffs;		(* Constant coefficient equations *)

trivialsol;			(* Trivial solution if it exists *)
constant;			(* Symbol used for constant of integration *)
eqform;				(* Original form of solution of equation *)
expeqform;			(* Explicit solution of equation if possible*)
slform;				(* Solution in user form *)
plotok;				(* Plotting allowed for this Method *)
numsol;				(* Numerical solution generated *)
seriessol;			(* Series solution generated *)
parasol;			(* Parametric solution generated *)
digits;				(* Number of digits displayed in numerical solutions *)
degree;				(* Degree of approximating series *)
sysconvert;			(* Equation converted to system *)
solveeqs;			(* Equations must be solved for y *)
noresolve;			(* Initial/boundary conditions completely resolved *)
functionlist;		(* List of solutions as pure functions *)

	Off[General::spell];
	Off[General::spell1];
	Off[General::ivar];
	Off[Syntax::newl];
	Off[Integrate::gener];
	Off[Integrate::ilim];
	Off[NIntegrate::nlim];
	Off[Solve::tdep];
	Off[Solve::ifun];
	Off[Solve::dinv];
	Off[DSolve::dnim];
	Off[DSolve::dinv];
	Off[Eliminate::ifun];
	Off[InterpolatingFunction::dmwarn];
	Off[Factor::facle];
	Off[Graphics::gpt];
	Off[On::none];
	Off[InverseFunction::ifun];
	Off[Pattern::nodef];

Options[ODE] = {
				Animation ->None,
				BulirschStoerOrder -> 4,
				CheckSolution -> Yes,
				Constants -> C, 
				Degree -> 5,
				DSolvePackage -> False,
				EigenspaceColor -> Blue,
				EquilibriumPointColor -> Red,
				EvolveRate -> 1,
				ExpansionPoint -> 0,
				Form -> Rule,
				GraphLabel -> None,
				Iterations -> 5,
				KnownSolution -> None,
				LinearizeAt -> None,
				Method -> DSolve, 
				NumericalOutput -> True, 
				ODEDialog -> True, 
				ODEDigits -> 3, 
				ODEMaxSteps -> 500,
				ODEMaxStepSize -> Automatic, 
				ODEPrecision -> Automatic,
				ODETiming -> False, 
				ODETrace -> True, 
				Parameters -> None,
				PlotEvolvePhase -> None,
				PlotField -> None,
				PlotPhase -> None,
				PlotSingularSolution -> None,
				PlotSolution -> None,
				PostSolution -> None,
				ProposedSolution -> None,
				SavePlots -> False,
				ShowEigenspaces -> False,
				ShowEquilibriumPoints -> False,
				StackPlotSolution -> None,
				StepSize -> 0.1,
				SuperimposePlots -> False,
				SuppressAsymptotes -> False,
				Tolerance -> 0.00001,
				Transformation -> None,
				TransformationDepth -> 0,
				TransformationVariable -> None,
				VariableStepSize -> False
				};

SetAttributes[ODE,HoldFirst]

ODE[_] := Message[ODE::wrongnumargs]

ODE[_,_] := Message[ODE::wrongnumargs]

ODE[heqs_,tdepvar_,indepvar_,options___] :=
	Module[{eqs,a,b,c,d,tmp,rhs,eqpts,error=False,usertransform,
			opts=options,sol,checksolt=$ODECheckSolution,dialog,
			depvar = tdepvar},

		If[!FreeQ[Hold[heqs],Set],Message[ODE::notde];Return[]];
		Off[Solve::tdep];

		eqs = ReleaseHold[Hold[heqs] /. 
			Literal[If[a_,b_,c___,d___]] -> ODEif[a,b,c,d]];

		If[Head[eqs] =!= List,eqs = {eqs}];
		eqs = Flatten[{Map[LogicalExpand,eqs] /. And -> Sequence}];
		If[Head[depvar] === List,
			depvar = Flatten[depvar];
			If[Length[depvar] == 1,depvar = First[depvar]]
		];

		If[!FreeQ[eqs,Rule] || !FreeQ[depvar,Rule] || !FreeQ[indepvar,Rule],
			Message[ODE::wrongargs];Return[]];
		If[Head[indepvar] === List && Length[indepvar] < 3,
			Message[ODE::badinterval];error=True];
		If[Head[indepvar] === List && Length[indepvar] == 3,
			If[indepvar[[2]] >= indepvar[[3]],
				Message[ODE::badinterval];error=True]];
		usermethod = Method /. {options} /. Options[ODE];
		usertransform = Transformation /. {options} /. Options[ODE];
		varstepsize = getTF[VariableStepSize/.{options}/.Options[ODE]];
		expansionpt = ExpansionPoint/.{options}/.Options[ODE];
		transformationdepth = TransformationDepth/.{options}/.Options[ODE];

		dialog = getTF[ODEDialog /. {options} /. Options[ODE]];
		If[dialog,$ODEDialogx = True,$ODEDialogx = False];

		If[FreeQ[knownmethods,usermethod] 			&&
       	   FreeQ[NewFirstOrderMethods,usermethod] 	&&
		   FreeQ[NewHighOrderMethods,usermethod] 	&&
		   FreeQ[NewNumericalMethods,usermethod] 	&&
		   FreeQ[NewSemiNumericalMethods,usermethod],
			Message[ODE::notmethod,usermethod];error=True];
		If[FreeQ[usertransform,Rule] && 
		   FreeQ[knowntransformations,usertransform],
			Message[ODE::nottransform,usertransform];error=True];
		tmp = ToString[Form /. {options} /. Options[ODE]];
		If[FreeQ[knownforms,tmp],
			Message[ODE::notform,tmp];error=True];
		If[error,Return[]];
(*
		If[usermethod === Automatic || usermethod === AllSymbolic || 
			usermethod === ReallyAll,
			Print["WARNING: Solutions will not be verified for this Method\n"]
		];
*)
		ODEClear[];
		trivialsol = Null;
		singularsolution = Null;
		exception = False;
		transformationlevel = 0;
		tmp = ODEPrecision /. {options} /. Options[ODE];
		If[tmp === Automatic,precision = Precision[N[1]]];
		If[tmp =!= Automatic && NumberQ[N[tmp]],precision = tmp];
		tmp = ODEDigits /. {options} /. Options[ODE];
		If[tmp === Automatic || !NumberQ[N[tmp]],
			digits = $ODEDigits,
			digits = tmp
		];
		precision = Max[precision,digits];
		stakndx = 0;
		two  =   N[2,2 precision];
		three  = N[3,2 precision];
		four =   N[4,2 precision];
		five  =  N[5,2 precision];
		six  =   N[6,2 precision];
		eight  = N[8,2 precision];
		twelve = N[12,2 precision];
		mc1 = N[{8/3,-4/3,8/3},2 precision];
		mc2 = N[{1/3,4/3,1/3},2 precision];
		ac1 = N[{55/24,-59/24,37/24,-9/24},2 precision];
		ac2 = N[{9/24,19/24,-5/24,1/24},2 precision];
		tmp = LinearizeAt /. {options} /. Options[ODE];
		If[tmp =!= None,
			setsysteminfo[eqs,depvar,indepvar];
       		rhs = Map[First[#] - Last[#]&,systemyt] /. 
				Thread[Rule[D[ytset,tset],Table[0,
				{Length[Flatten[{ytset}]]}]]];
        	eqpts = Thread[Rule[ytset,tmp]];
			If[Union[Simplify[rhs /. eqpts]] =!= {0},
				Message[ODE::notcritpt,tmp];Return[],
				eqs = Union[Flatten[LinearizeAt[systemyt,ytset,tset,tmp]],
						initeqs]
			]
		];
		sol = odeloop[eqs,depvar,indepvar,opts];
		$ODECheckSolution = checksolt;
		sol
	]

odeloop[eqs_,depvar_,indepvar_,options___] :=
	Module[{sol,method,smethod,opts=options,trace,oldcoef,eqtmp,
			sform,n,neweq,eqt,y,t=tt=indepvar,x,F,numout,
			yy,aa,bb,cc,dd,ee,pow,var=depvar,a,b,c,d,e,traceop,
			knownsol,tsol={},sol1,sol2,C,trule,newm,tmp,propsol,
			params,msg},

		If[!FreeQ[eqs,Null],Return[]];

		trace = getTF[ODETrace /. {options} /. Options[ODE]];
		propsol = ProposedSolution /. {options} /. Options[ODE];
		If[trace,
			$ODETracex = True  ; $ODEPartialx = True,
			$ODETracex = False ; $ODEPartialx = False,
			$ODETracex = False ; 
			If[!FreeQ[ODETrace /. {options} /.Options[ODE],Partial],
				$ODEPartialx = True]
		];

		method = Method /. {options} /. Options[ODE];
		sform = ToString[Form /. {options} /. Options[ODE]];
		constant = Constants /. {options} /. Options[ODE];
		knownsol = KnownSolution /. {options} /. Options[ODE];
		numout = getTF[NumericalOutput /. {options} /. Options[ODE]];
		trule = Transformation /. {options} /. Options[ODE];
		params = Parameters /. {options} /. Options[ODE];
		If[params =!= None,params = Variables[params],params = {}];
		If[FreeQ[{options},Method] && trule =!= None,
			method = Transform
		];
		smethod = ToString[method];
		msg = setsysteminfo[eqs,depvar,indepvar];
		If[(method === Automatic || method === AllSymbolic || 
			method === ReallyAll || method === LoopMode    ||
			method === AllNumerical || method === AllSemiNumerical),
			ODETracePrint[msg <> "\n"]
		];
		t = tset;
		y = yset;
		eq = First[systemy];
		eqt = First[systemyt];
(*
		tmp = Flatten[{eqs}] /. Derivative[a_][b_][t] -> Derivative[a][b];
		If[FreeQ[eqs,Integrate] && FreeQ[eqs,delt] && FreeQ[eqs,dely] && 
		   Union[Flatten[{y}],params] =!= 
			Union[Cases[tmp,Derivative[a_][b_] -> b,Infinity],params],
			Message[ODE::ambigeqs];Return[]];
		If[initeqs =!= {} && Union[Flatten[{y}],params] =!= 
			Union[Cases[initeqs,a_[b_]/; 
			(FreeQ[a,Derivative] && FreeQ[b,t]) -> a,Infinity],params],
				Message[ODE::ambigconds];Return[]];
*)
		If[Length[Union[initeqs /. {x_[a_] == b_ -> a, 			
			Derivative[i_][x_][a_] == c_ -> a}]] > 1,
				Message[ODE::ambigconds];Return[]];	
		If[numberofeqs == 0,
			Message[ODE::notde];Return[]];

(* Go into (Automatic || AllSymbolic) mode *)

		If[usermethod === Automatic || usermethod === AllSymbolic || 
			usermethod === ReallyAll,
				$ODECheckSolution = No
		];

		timeused = AbsoluteTime[];

		If[(method === Automatic || method === AllSymbolic || 
			method === ReallyAll || method === LoopMode) &&
			!trivial,
			trivial = True;
			ODETracePrint["Checking for Trivial solutions:"];
				sol = CallMethod[eqs,depvar,indepvar,Trivial,options];
				If[sol =!= False,
					If[!$ODETracex,ODEPartialPrint["Solving for trivial solutions:"]];
					If[!$ODETracex,ODEPartialPrint[""]];
					If[!$ODETracex,ODEPartialPrint[sol]];
					If[!$ODETracex,ODEPartialPrint[""]];
					If[$ODETracex, ODETracePrint[sol]],
					ODETracePrint["\tNo Trivial solutions"]
				]
		];
		If[(method === Automatic || method === AllSymbolic || 
			method === ReallyAll || method === LoopMode)  && 
			numberofeqs == 1 && order == 1,
			ODETracePrint["Checking FirstOrderLinear:"];
			If[linear,
				sol = CallMethod[eqs,depvar,indepvar,FirstOrderLinear,options];
				exitloop[method,sol,"FirstOrderLinear "],
				ODETracePrint["\tNot FirstOrderLinear"]
			];
			ODETracePrint["Checking Bernoulli:"];
			If[BernoulliQ[eq,y,t],
				sol = CallMethod[eqs,depvar,indepvar,Bernoulli,options];
				exitloop[method,sol,"Bernoulli "],
				ODETracePrint["\tNot Bernoulli"]
			];
			Clear[F];
			tmp = getmeq[eq,t,y,y'];
			If[tmp =!= False,
				F[tt_,yy_] = Last[tmp] /. {t -> tt,y -> yy}
			];
			ODETracePrint["Checking Separable:"];
			If[SeparableQ[F][t,y],
				sol = CallMethod[eqs,depvar,indepvar,Separable,options];
				exitloop[method,sol,"Separable "],
				ODETracePrint["\tNot Separable"];
			];
			ODETracePrint["Checking FirstOrderExact:"];
			If[FirstOrderExactQ[eq,y,t],
				sol = CallMethod[eqs,depvar,indepvar,FirstOrderExact,options];
				exitloop[method,sol,"FirstOrderExact "],
				ODETracePrint["\tNot FirstOrderExact"];
			];
			ODETracePrint["Checking IntegratingFactor:"];
			sol = CallMethod[eqs,depvar,indepvar,IntegratingFactor,options];
			exitloop[method,sol,"IntegratingFactor "];
			ODETracePrint["Checking FirstOrderHomogeneous:"];
			If[FirstOrderHomogeneousQ[F][t,y],
				sol =
				 CallMethod[eqs,depvar,indepvar,FirstOrderHomogeneous,options];
				exitloop[method,sol,"FirstOrderHomogeneous "],
				ODETracePrint["\tNot FirstOrderHomogeneous"];
			];
			ODETracePrint["Checking GeneralizedHomogeneous:"];
			If[GeneralizedHomogeneousQ[F][t,y],
				sol =
				 CallMethod[eqs,depvar,indepvar,
					GeneralizedHomogeneous,options];
				exitloop[method,sol,"GeneralizedHomogeneous "],
				ODETracePrint["\tNot GeneralizedHomogeneous"];
			];
			ODETracePrint["Checking AlmostLinear:"];
			If[AlmostLinearQ[eq,y,t],
				sol = CallMethod[eqs,depvar,indepvar,AlmostLinear,options];
				exitloop[method,sol,"AlmostLinear "],
				ODETracePrint["\tNot AlmostLinear"];
			];
			ODETracePrint["Checking LinearFractional:"];
			If[LinearFractionalQ[F][t,y],
				sol = CallMethod[eqs,depvar,indepvar,LinearFractional,options];
				exitloop[method,sol,"LinearFractional "],
				ODETracePrint["\tNot LinearFractional"];
			];
			ODETracePrint["Checking Clairaut:"];
			If[ClairautQ[eqt,y[t],t],
				sol = CallMethod[eqs,depvar,indepvar,Clairaut,options];
				exitloop[method,sol,"Clairaut "],
				ODETracePrint["\tNot Clairaut"];
			];
			ODETracePrint["Checking Lagrange:"];
			If[LagrangeQ[eqt,y[t],t],
				sol = CallMethod[eqs,depvar,indepvar,Lagrange,options];
				exitloop[method,sol,"Lagrange "],
				ODETracePrint["\tNot Lagrange"];
			];
			ODETracePrint["Checking Riccati:"];
			If[!riccati && RiccatiQ[eq,y,t],
				riccati = True;
				If[knownsol =!= None,
				If[!$ODETracex,ODEPartialPrint["Solving Riccati equation:"]];
					sol = CallMethod[eqs,depvar,indepvar,Riccati,options],
					{F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
            		If[ee === 0 ||
						transformationlevel >= transformationdepth,
						sol = False,
						ODETracePrint[
					"Checking transformation RiccatiToSecondOrderLinear:"];
						transformationlevel++;
						neweq = Transformation[eqt,{x,t->x,
							y[t]->y'[x]/((ee/.t->x) y[x])}] /. 
							y -> ODEu /. x -> t;
						oldcoef = ee;	
						Perform["RiccatiToSecondOrderLinear",neweq];
						push[];
						sol = odeloop[neweq,ODEu,t,
							Form->Return,Method->LoopMode,opts];
						pop[];
						transformationlevel--;
					];
					t = tset;
					y = yset;
					eq = First[systemy];
					eqt = First[systemyt];
					ee = oldcoef;
					Pullback["RiccatiToSecondOrderLinear",sol];
					If[sol =!= Null && sol =!= False && sol =!= 0 && 
						FreeQ[sol,Solve] && FreeQ[sol,DSolve],
						sol = Last[First[Flatten[{sol}]]];
						sol = eqform = y[t] == Simplify[D[sol,t]/(sol ee)];
						AddConditions[sol,smethod,sform,
							y[t],t,var,constant,opts];
						sol = FinalOptions[options]
					]
				];			
				exitloop[method,sol,"Riccati "],
				ODETracePrint["\tNot Riccati"]
			];
			If[Length[NewFirstOrderMethods] > 0,
				Do[
					smethod = ToString[NewFirstOrderMethods[[newm]]];
					ODETracePrint["Checking "<>smethod<>":"];
					If[ToExpression[smethod<>"Q"] @@ Sequence[{eqt,y[t],t}],
						sol = CallMethod[eqs,depvar,indepvar,
							ToExpression[smethod],options];
						exitloop[method,sol,smethod<>" "],
						ODETracePrint["\tNot "<>smethod];
					],
				{newm,1,Length[NewFirstOrderMethods]}
				]
			];
			If[!xchanging ,
				xchanging = True;
				ODETracePrint["Checking transformation ExchangeVariables:"];
				F = getmeq[eq,t,y,y'];
				If[F =!= False,
					G = Function[{t,y},Last[F]]
				];
				If[F =!= False && G[t,y] =!= 0,
					transformationlevel++;
					neweq = ExchangeVariables[G][t,y];
					Perform["ExchangeVariables",neweq];
					push[];
					sol = odeloop[neweq,t,y,
						Method->LoopMode,Form->Return,opts];
					pop[];
					transformationlevel--;
					t = tset;
					y = yset;
					eq = First[systemy];
					eqt = First[systemyt];
					sol = sol /. {t[y] -> t , y -> y[t]}; 
					Pullback["ExchangeVariables",sol];
					eqform = eqform /. {t[y] -> t , y -> y[t]}; 
					slform = slform /. {t[y] -> t , y -> y[t]}; 
					solveeqs = True;
					AddConditions[sol,smethod,sform,y[t],t,var,constant,opts];
					sol = FinalOptions[options];
					exitloop[method,sol,""],
					ODETracePrint["\tExchangeVariables"]
				]
			];
			If[!factoring,
				factoring = True;
				sol = False;
				ODETracePrint["Checking transformation FactorEquation:"];
				neweq = FactorEquation[eqt,y[t],t];
				If[Length[neweq] > 1,
					Perform["FactorEquation",neweq];
					Do[
					 push[];
					 sol = odeloop[neweq[[n]],depvar,t,Method->LoopMode,opts];
					 pop[];
						AppendTo[tsol,sol],
						{n,1,Length[neweq]}
					];
					t = tset;
					y = yset;
					eq = First[systemy];
					eqt = First[systemyt];
					sol = tsol
				];
				exitloop[method,sol,"Factored "]
			];
			If[!polar && !FreeQ[eqt,t^2] && !FreeQ[eqt,y[t]^2] &&
				transformationlevel < transformationdepth,
				transformationlevel++;
				polar = True;
				Clear[ODEs,ODEr];
				ODETracePrint["Checking for polar transformation:"];
				neweq = Transformation[eqt,
					{ODEs,t->ODEr[ODEs] Cos[ODEs],
						y[t]-> ODEr[ODEs] Sin[ODEs]}];
				Perform["Polar",neweq];
				push[];
				sol = odeloop[neweq,ODEr,ODEs,
					Method->LoopMode,Form->Return,opts];
				pop[];
				transformationlevel--;
				t = tset;
				y = yset;
				eq = First[systemy];
				eqt = First[systemyt];
				Pullback["Polar",sol];
				If[sol =!= Null,
					sol = eqform = slform = Transformation[sol,
					{t,ODEs->ArcTan[y[t]/t],
						ODEr[ODEs] -> Sqrt[t^2+y[t]^2]}];
					solveeqs = True;
					AddConditions[sol,smethod,sform,y[t],t,var,constant,opts];
					sol = FinalOptions[options]
				];
				exitloop[method,sol,""]
			];
			If[!polar && !solvableindependent &&
				SolvableForIndependentQ[eqt,y[t],t] &&
				transformationlevel < transformationdepth,
				ODETracePrint[
					"Checking transformation SolvableForIndependent:"];
				transformationlevel++;
				solvableindependent = True;		
				solvabledependent = True;
				Clear[ODEp];
				sol1 = eqt /. Derivative[n_][y][t] -> Derivative[n-1][ODEp] /.
						y[t] -> y;
				sol = SolvableForIndependent[eqt,y[t],t,ODEp];
				eqtmp = First[First[ConvertToYofT[sol,ODEp,y]]];
				Perform["SolvableForIndependent",eqtmp];
				push[];
				sol2 = odeloop[eqtmp,ODEp,y,
					Method->LoopMode,Form->Return,opts] /. ODEp[y] -> ODEp;
				pop[];
				transformationlevel--;
				t = tset;
				y = yset;
				eq = First[systemy];
				eqt = First[systemyt];
				Pullback["SolvableForIndependent",sol2];
				If[sol1 =!= Null && sol2 =!= Null,
				  sol = slform = eqform = Union[Eliminate[{sol1,sol2},ODEp]];
				  solveeqs = True;
				  If[!FreeQ[sol,Eliminate] || !FreeQ[sol,ODEp],
					ODEDialoguePrint["Parametric solution detected"];
					parasol = True;
					sol = {sol1,sol2},
					AddConditions[sol,smethod,sform,y[t],t,var,constant,opts];
				 	sol = FinalOptions[options]
				  ],
				  sol = False
				];
				exitloop[method,sol,""]
			];
			If[!polar && !solvabledependent &&
				SolvableForDependentQ[eqt,y[t],t] &&	
				transformationlevel < transformationdepth,
				ODETracePrint[
					"Checking transformation SolvableForDependent:"];
				transformationlevel++;
				solvabledependent = True;
				Clear[ODEq];
				sol1 = eqt /. Derivative[n_][y][t] -> Derivative[n-1][ODEq];
				sol = SolvableForDependent[eqt,y[t],t,ODEq];
				eqtmp = First[First[ConvertToYofT[sol,ODEq,t]]];
				Perform["SolvableForDependent",eqtmp];
				push[];
				sol2 = odeloop[eqtmp,ODEq,t,
					Method->LoopMode,Form->Return,opts] /. ODEq[t] -> ODEq;
				pop[];
				transformationlevel--;
				t = tset;
				y = yset;
				eq = First[systemy];
				eqt = First[systemyt];
				Pullback["SolvableForDependent",sol];
				If[sol1 =!= Null && sol2 =!= Null,
				  sol = slform = eqform = Union[Eliminate[{sol1,sol2},ODEq]];
				  solveeqs = True;
				  If[!FreeQ[sol,Eliminate] || !FreeQ[sol,ODEq],
					ODEDialoguePrint["Parametric solution detected"];
					parasol = True;
					sol = {sol1,sol2},
					AddConditions[sol,smethod,sform,y[t],t,var,constant,opts];
				  	sol = FinalOptions[options]
				  ],
				  sol = False
				];
				exitloop[method,sol,""]
			]
		];
		If[(method === Automatic || method === AllSymbolic ||
			method === ReallyAll || method === LoopMode)  && 
			 numberofeqs == 1 && order == 2,
			ODETracePrint["Checking SecondOrderLinear:"];
			If[linear && constcoeffs,
				sol =
				 CallMethod[eqs,depvar,indepvar,SecondOrderLinear,options];
				exitloop[method,sol,"SecondOrderLinear "],
				ODETracePrint["\tNot SecondOrderLinear"]
			];
			ODETracePrint["Checking SecondOrderCauchyEuler:"];
			If[linear && CauchyEulerQ[eqt,y,t],
					sol =
				 CallMethod[eqs,depvar,indepvar,NthOrderCauchyEuler,options];
				exitloop[method,sol,"SecondOrderCauchyEuler "],
				ODETracePrint["\tNot SecondOrderCauchyEuler"]
			];
			If[order == 2,
			  ODETracePrint["Checking TableLookup:"];
			  sol = CallMethod[eqs,depvar,indepvar,TableLookup,options];
			  If[sol === Null, sol = False];
			  exitloop[method,sol,"TableLookup "]
			];
			{F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
			a =  Function[t,dd  /. t -> tt];
			b =  Function[t,cc  /. t -> tt];
			c =  Function[t,bb  /. t -> tt];
			ODETracePrint["Checking SecondOrderLinearToConstants:"];
			If[linear && SecondOrderLinearToConstantsQ[a,b,c][t],
				sol = CallMethod[eqs,depvar,indepvar, 
					SecondOrderLinearToConstants,options];
					If[FreeQ[eqs,I] && !FreeQ[sol,I],
						sol = False
					];
			  	exitloop[method,sol,"SecondOrderLinearToConstants "],
				ODETracePrint["\tNot SecondOrderLinearToConstants"]
			];
			If[SecondOrderExactQ[eqt,y,t] &&
				transformationlevel < transformationdepth,
				ODETracePrint["Checking transformation SecondOrderExact:"];
				transformationlevel++;
				sol = SecondOrderExact[eqt,y,t,constant] /. 
					constant[1] -> ODEA;
				eqtmp = First[First[ConvertToYofT[sol,y,t]]];
				Perform["SecondOrderExact",eqtmp];
				push[];
				sol = odeloop[eqtmp,y[t],t,
					Method->LoopMode,Form->Return,opts];
				pop[];
				transformationlevel--;
				sol = sol /. ODEA -> constant[2];
				Pullback["SecondOrderExact",sol];
				eqform = eqform /. ODEA -> constant[2];
				slform = slform /. ODEA -> constant[2];
				t = tset;
				y = yset;
				eq = First[systemy];
				eqt = First[systemyt];
				AddConditions[sol,smethod,sform,y[t],t,var,constant,opts];
				sol = FinalOptions[options];
			  	exitloop[method,sol,""]
			];
			If[transformationlevel < transformationdepth,
				ODETracePrint["Checking transformation MultiplyByDerivative:"];
				sol =
				CallMethod[eqs,depvar,indepvar,MultiplyByDerivative,options];
				exitloop[method,sol,"MultiplyByDerivative "]
			];
		If[Length[NewHighOrderMethods] > 0,
				Do[
					smethod = ToString[NewHighOrderMethods[[newm]]];
					ODETracePrint["Checking "<>smethod<>":"];
					If[ToExpression[smethod<>"Q"] @@ Sequence[{eqt,y[t],t}],
						sol = CallMethod[eqs,depvar,indepvar,
							ToExpression[smethod],options];
						exitloop[method,sol,smethod<>" "],
						ODETracePrint["\tNot "<>smethod];
					],
				{newm,1,Length[NewHighOrderMethods]}
				]
			]
		];
		If[(method === Automatic || method === AllSymbolic ||
			method === ReallyAll || method === LoopMode)  && 
			 numberofeqs == 1 && order >= 2,
			If[order > 2,
				ODETracePrint["Checking NthOrderLinear:"];
				If[linear && constcoeffs,
					sol =
				 	CallMethod[eqs,depvar,indepvar,NthOrderLinear,options];
					exitloop[method,sol,"NthOrderLinear "],
					ODETracePrint["\tNot NthOrderLinear"]
				];
				ODETracePrint["Checking NthOrderCauchyEuler:"];
				If[linear && CauchyEulerQ[eqt,y,t],
					sol =
				 	CallMethod[eqs,depvar,indepvar,NthOrderCauchyEuler,options];
					exitloop[method,sol,"NthOrderCauchyEuler "],
					ODETracePrint["\tNot NthOrderCauchyEuler"]
				];
			];
			If[!polar && !autonomous && AutonomousQ[eqt,y,t] &&
				transformationlevel < transformationdepth,
				ODETracePrint["Checking transformation Autonomous:"];
				transformationlevel++;
				autonomous = True;
				Clear[ODEw];
				sol = Autonomous[eqt,y[t],t,ODEw] /. y[t] -> y;
				eqtmp = First[First[ConvertToYofT[sol,ODEw,y]]];
				Perform["Autonomous",eqtmp];
				push[];
				sol = odeloop[eqtmp,ODEw,y,
					Method->LoopMode,Form->Return,opts] /. 
					ODEw[y] -> y'[t] /. constant[1] -> ODEB;
				pop[];
				transformationlevel--;
				t = tset;
				y = yset;
				eq = First[systemy];
				eqt = First[systemyt];
				sol = First[First[ConvertToYofT[sol,y,t]]];
				push[];
				sol = odeloop[sol,y[t],t,Method->LoopMode,Form->Return,opts];
				pop[];
				sol = sol /. ODEB -> constant[2];
				Pullback["Autonomous",sol];
				eqform = eqform /. ODEB -> constant[2];
				slform = slform /. ODEB -> constant[2];
				t = tset;
				y = yset;
				eq = First[systemy];
				eqt = First[systemyt];
				Clear[ODEw];
				AddConditions[sol,smethod,sform,y[t],t,var,constant,opts];
				sol = FinalOptions[options];
			  	exitloop[method,sol,""]
			];
			If[!polar && !dependentmissing && DependentMissingQ[eqt,y,t] &&	
				transformationlevel < transformationdepth,
				ODETracePrint[
					"Checking transformation DependentMissing:"];
				transformationlevel++;
				dependentmissing = True;
				Clear[ODEv];
				sol = DependentMissing[eqt,y[t],t,ODEv];
				eqtmp = First[First[ConvertToYofT[sol,ODEv,t]]];
				Perform["DependentMissing",eqtmp];
				push[];
				sol = odeloop[eqtmp,ODEv,t,
					Method->LoopMode,Form->Return,opts] /.
					 ODEv[t] -> y'[t] /. constant[1] -> ODEC;
				pop[];
				transformationlevel--;
				t = tset;
				y = yset;
				eq = First[systemy];
				eqt = First[systemyt];
				sol = First[First[ConvertToYofT[sol,y,t]]];
				push[];
				sol = odeloop[sol,y[t],t,Method->LoopMode,Form->Return,opts];
				pop[];
				sol = sol /. ODEC -> constant[2];
				Pullback["DependentMissing",sol];
				eqform = eqform /. ODEC -> constant[2];
				slform = slform /. ODEC -> constant[2];
				t = tset;
				y = yset;
				eq = First[systemy];
				eqt = First[systemyt];
				AddConditions[sol,smethod,sform,y[t],t,var,constant,opts];
				sol = FinalOptions[options];
			  	exitloop[method,sol,""]
			];
			If[!polar && !equidimindependent &&
				EquidimensionalInIndependentQ[eqt,y,t] &&
				transformationlevel < transformationdepth,
				ODETracePrint[
					"Checking transformation EquidimensionalInIndependent:"];
				transformationlevel++;
				equidimindependent = True;
				sol = EquidimensionalInIndependent[eqt,y,t];
				eqtmp = First[First[ConvertToYofT[sol,y,t]]];
				Perform["EquidimensionalInIndependent",eqtmp];
				push[];
				sol = odeloop[eqtmp,y[t],t,
					Method->LoopMode,Form->Return,opts];
				pop[];
				transformationlevel--;
				t = tset;
				y = yset;
				eq = First[systemy];
				eqt = First[systemyt];
				Clear[aa];
				sol = sol /. y[t] -> aa /. t -> Log[t] /. aa -> y[t];
				Pullback["EquidimensionalInIndependent",sol];
				eqform = eqform /. y[t] -> aa /. t -> Log[t] /. aa -> y[t];
				slform = slform /. y[t] -> aa /. t -> Log[t] /. aa -> y[t];
				AddConditions[sol,smethod,sform,y[t],t,var,constant,opts];
				sol = FinalOptions[options];
			  	exitloop[method,sol,""]
			];
			If[!polar && !equidimdependent &&
				EquidimensionalInDependentQ[eqt,y,t] &&
				transformationlevel < transformationdepth,
				ODETracePrint[
					"Checking transformation EquidimensionalInDependent:"];
				transformationlevel++;
				equidimdependent = True;
				Clear[ODEr];
				sol = EquidimensionalInDependent[eqt,y,t,ODEr];
				eqtmp = First[First[ConvertToYofT[sol,ODEr,t]]];
				Perform["EquidimensionalInDependent",eqtmp];
				push[];
				sol = odeloop[eqtmp,ODEr,t,
					Method->LoopMode,Form->Return,opts];
				pop[];
				transformationlevel--;
				t = tset;
				y = yset;
				eq = First[systemy];
				eqt = First[systemyt];
				sol = sol /. ODEr[t] -> Log[y[t]];
				Pullback["EquidimensionalInDependent",sol];
				eqform = eqform /.ODEr[t] -> Log[y[t]];
				slform = slform /. ODEr[t] -> Log[y[t]];
				AddConditions[sol,smethod,sform,y[t],t,var,constant,opts];
				sol = FinalOptions[options];
			  	exitloop[method,sol,""]
			];
			If[!polar && !FreeQ[eqt,t^2] && !FreeQ[eqt,y[t]^2] &&
				transformationlevel < transformationdepth,
				transformationlevel++;
				polar = True;
				Clear[ODEs,ODEr];
				ODETracePrint["Checking for polar transformation:"];
				neweq = Transformation[eqt,
					{ODEs,t->ODEr[ODEs] Cos[ODEs],
						y[t]-> ODEr[ODEs] Sin[ODEs]}];
				Perform["Polar",neweq];
				push[];
				sol = odeloop[neweq,ODEr,ODEs,
					Method->LoopMode,Form->Return,opts];
				pop[];
				transformationlevel--;
				t = tset;
				y = yset;
				eq = First[systemy];
				eqt = First[systemyt];
				Pullback["Polar",sol];
				If[sol =!= Null,
					sol = eqform = slform = Transformation[sol,
					{t,ODEs->ArcTan[y[t]/t],
						ODEr[ODEs] -> Sqrt[t^2+y[t]^2]}];
					solveeqs = True;
					AddConditions[sol,smethod,sform,y[t],t,var,constant,opts];
					sol = FinalOptions[options]
				];
				exitloop[method,sol,""]
			];
			If[!xchanging ,
				xchanging = True;
				ODETracePrint["Checking transformation ExchangeVariables:"];
					transformationlevel++;
					neweq = ExchangeVariables[eqt,y[t],t];
					Perform["ExchangeVariables",neweq];
					push[];
					sol = odeloop[neweq,t,y,
						Method->LoopMode,Form->Return,opts];
					pop[];
					transformationlevel--;
					t = tset;
					y = yset;
					eq = First[systemy];
					eqt = First[systemyt];
					sol = sol /. {t[y] -> t , y -> y[t]}; 
					Pullback["ExchangeVariables",sol];
					eqform = eqform /. {t[y] -> t , y -> y[t]}; 
					slform = slform /. {t[y] -> t , y -> y[t]}; 
					solveeqs = True;
					AddConditions[sol,smethod,sform,y[t],t,var,constant,opts];
					sol = FinalOptions[options];
					exitloop[method,sol,""]
			];
			If[!factoring,
				factoring = True;
				sol = False;
				ODETracePrint["Checking transformation FactorEquation:"];
				neweq = FactorEquation[eqt,y[t],t];
				If[Length[neweq] > 1,
				Perform["FactorEquation",neweq];
					Do[
					  push[];
					  sol = odeloop[neweq[[n]],depvar,t,Method->LoopMode,opts];
					  pop[];
						AppendTo[tsol,sol],
						{n,1,Length[neweq]}
					];
					t = tset;
					y = yset;
					eq = First[systemy];
					eqt = First[systemyt];
					sol = tsol
				];
			  	exitloop[method,sol,"Factored "]
			]
		];
		If[(method === Automatic || method === AllSymbolic ||
			method === ReallyAll || method === LoopMode)  && 
			 numberofeqs > 1 && linear,
			ODETracePrint["Checking LinearSystem:"];
			sol = CallMethod[eqs,depvar,indepvar,LinearSystem,options];
			exitloop[method,sol,""]
		];
		If[(method === Automatic || method === AllSymbolic ||
			method === ReallyAll || method === LoopMode)  && 
			linear && constcoeffs,
			ODETracePrint["Checking Laplace:"];
			sol = CallMethod[eqs,depvar,indepvar,Laplace,options];
			exitloop[method,sol,""]
		];

		If[method === Automatic || method === AllSymbolic ||
		   method === ReallyAll || method === LoopMode, 
			ODETracePrint["Checking DSolve:"];
			sol = CallMethod[eqs,depvar,indepvar,DSolve,options];
			exitloop[method,sol,""]
		];

		If[method === AllNumerical,
			ODETracePrint["Computing solution from Euler:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,Euler,options];
			If[numout,ODEAllPrint[sol]];

			ODETracePrint["Computing solution from Heun:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,Heun,options];
			If[numout,ODEAllPrint[sol]];

			ODETracePrint["Computing solution from RungeKutta4:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,RungeKutta4,options];
			If[numout,ODEAllPrint[sol]];

			ODETracePrint["Computing solution from RungeKutta45:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,RungeKutta45,options];
			If[numout,ODEAllPrint[sol]];

		    ODETracePrint["Computing solution from ImplicitRungeKutta:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,ImplicitRungeKutta,options];
			If[numout,ODEAllPrint[sol]];

			ODETracePrint["Computing solution from SecondOrderEuler:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,SecondOrderEuler,options];
			If[numout,ODEAllPrint[sol]];

			ODETracePrint["Computing solution from Milne:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,Milne,options];
			If[numout,ODEAllPrint[sol]];

			ODETracePrint["Computing solution from AdamsBashforth:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,AdamsBashforth,options];
			If[numout,ODEAllPrint[sol]];

			ODETracePrint["Computing solution from BulirschStoer:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,BulirschStoer,options];
			If[numout,ODEAllPrint[sol]];

			ODETracePrint["Computing solution from NDSolve:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,NDSolve,options];
			If[numout,ODEAllPrint[sol]];

			If[Length[NewNumericalMethods] > 0,
				Do[
					smethod = ToString[NewNumericalMethods[[newm]]];
					ODETracePrint["Checking "<>smethod<>":"];
					If[ToExpression[smethod<>"Q"] @@ Sequence[{eqt,y[t],t}],
						sol = CallMethod[eqs,depvar,indepvar,
							ToExpression[smethod],options];
						exitloop[method,sol,smethod<>" "],
						ODETracePrint["\tNot "<>smethod];
					],
				{newm,1,Length[NewNumericalMethods]}
				]
			]
		];

		If[method === AllSemiNumerical,
		  If[linear && numberofeqs == 1,
		  	ODETracePrint["Checking ApproximateNthOrderLinear:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,ApproximateNthOrderLinear,options];
			exitloop[method,sol,"ApproximateNthOrderLinear "],
			ODETracePrint["\tNot a linear equation"]
		  ];
		  If[linear && CauchyEulerQ[eqt,y,t],
		  	ODETracePrint["Checking ApproximateNthOrderCauchyEuler:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,ApproximateNthOrderCauchyEuler,
				options];
			exitloop[method,sol,"ApproximateNthOrderCauchyEuler "],
			ODETracePrint["\tNot CauchyEuler"]
		  ];

		  If[linear && numberofeqs > 1,
		 	 ODETracePrint["Checking ApproximateLinearSystem:"];
			sol = CallMethod[eqs,depvar,indepvar,
				ApproximateLinearSystem,options];
			exitloop[method,sol,""],
			ODETracePrint["\tNot a linear system"]
		  ];

		  If[order == 1 && numberofeqs == 1,
			ODETracePrint["Checking Picard:"];
			sol = 
			  CallMethod[eqs,depvar,indepvar,Picard,options];
			exitloop[method,sol,""];

			ODETracePrint["Checking TaylorSeries:"];
			sol = 
			  CallMethod[eqs,depvar,indepvar,TaylorSeries,options];
			exitloop[method,sol,""]
		];

		If[linear && numberofeqs == 1,
		    ODETracePrint["Checking SeriesForm:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,SeriesForm,options];
			exitloop[method,sol,""]
		];
		If[linear && numberofeqs == 1,
		    ODETracePrint["Checking SeriesFormCauchy:"];
			sol = 
			CallMethod[eqs,depvar,indepvar,SeriesFormCauchy,options];
			exitloop[method,sol,""]
		];

		If[Length[NewSemiNumericalMethods] > 0,
			Do[
				smethod = ToString[NewSemiNumericalMethods[[newm]]];
				ODETracePrint["Checking "<>smethod<>":"];
				If[ToExpression[smethod<>"Q"] @@ Sequence[{eqt,y[t],t}],
					sol = CallMethod[eqs,depvar,indepvar,
						ToExpression[smethod],options];
					exitloop[method,sol,smethod<>" "],
					ODETracePrint["\tNot "<>smethod];
				],
				{newm,1,Length[NewSemiNumericalMethods]}
			]
		]
	  ];

(* Try user Method *)

		If[method =!= Automatic && method =!= AllSymbolic && 
		   method =!= ReallyAll && method =!= LoopMode    &&
		   method =!= AllNumerical && method =!= AllSemiNumerical,
			sol = odetrial[eqs,depvar,indepvar,Method->method,options];
			If[sol === "error",
				Return[],
				sol = FinalOptions[Method->method,options]
			];
			If[sol =!= False,
				Return[sol],
				If[method =!= None || propsol =!= None,
					If[trivialsol === False,
						Print["No solution found"];
						Return[],
						Return[trivialsol]
					]
				]
			]
		]
	]

exitloop[method_,sol_,msg_] :=
	Module[{tsol=sol},
	  noresolve = False;
	  If[!FreeQ[tsol,Null],tsol = False];
	  Which[tsol =!= False && (method === AllSymbolic || method === ReallyAll),
			If[!$ODETracex,ODEPartialPrint["Solving "<>msg<>"equation:"]];
			If[!$ODETracex,
				ODEPartialPrint[""];
				ODEPartialPrint[tfset[tsol]];
				ODEPartialPrint[""],
				ODEAllPrint[tfset[tsol]]],
		tsol =!= False && method === LoopMode,
			If[msg != "" || transformationlevel == 0,
				If[!$ODETracex,
					ODEPartialPrint[sps,"Solving "<>msg<>"equation:"]];
				ODEPartialPrint[""];
				ODEPartialPrint[sps,tfset[tsol]];
				ODEPartialPrint[""]
			];
			Return[Return[tsol]],
		tsol =!= False && !$ODETracex,
			ODEPartialPrint["Solving "<>msg<>"equation:"];
			If[transformationlevel > 0,
				ODEPartialPrint[""];
				ODEPartialPrint[tfset[tsol]];
				ODEPartialPrint[""]
			];
			ODEClear[];
			Return[Return[tsol]],
		tsol =!= False,
			If[method === AllSemiNumerical,
				ODEAllPrint[tfset[tsol]],
				ODEClear[];
				Return[Return[tsol]]
			],
		noresolve,
			ODEClear[];ODETracePrint["\t"<>msg<>" - failed"];
			Return[Return[]],
		True,
			ODETracePrint["\t"<>msg<>" - failed"]
	  ]
	];

getTF[expr_] := 
	Module[{},
		If[MemberQ[{True,All,Yes,On,T,Y,1},expr],Return[True]];
		If[MemberQ[{False,None,No,Off,F,N,0},expr],Return[False]];
		Return[]
	]

push[] :=
	Module[{},
		stak[stakndx] 			= systemyt;
		stak[stakndx=stakndx+1] = systemy;
		stak[stakndx=stakndx+1] = delt;
		stak[stakndx=stakndx+1] = dely;
		stak[stakndx=stakndx+1] = initconds;
		stak[stakndx=stakndx+1] = initeqs;
		stak[stakndx=stakndx+1] = initrules;
		stak[stakndx=stakndx+1] = yvars;
		stak[stakndx=stakndx+1] = ytset;
		stak[stakndx=stakndx+1] = yset;
		stak[stakndx=stakndx+1] = tset;
		stak[stakndx=stakndx+1] = numberofeqs;
		stak[stakndx=stakndx+1] = order;
		stak[stakndx=stakndx+1] = exact;
		stak[stakndx=stakndx+1] = linear;
		stak[stakndx=stakndx+1] = constcoeffs;
		stak[stakndx=stakndx+1] = trivialsol;		
		stakndx++;
	]

pop[] :=
	Module[{},
		stakndx 			= stakndx - 17;
		systemyt 			= stak[stakndx];
		systemy 			= stak[stakndx=stakndx+1];
		delt 				= stak[stakndx=stakndx+1];
		dely 				= stak[stakndx=stakndx+1];
		initconds 			= stak[stakndx=stakndx+1];
		initeqs 			= stak[stakndx=stakndx+1];
		initrules 			= stak[stakndx=stakndx+1];
		yvars 				= stak[stakndx=stakndx+1];
		ytset 				= stak[stakndx=stakndx+1];
		yset 				= stak[stakndx=stakndx+1];
		tset 				= stak[stakndx=stakndx+1];
		numberofeqs 		= stak[stakndx=stakndx+1];
		order 				= stak[stakndx=stakndx+1];
		exact 				= stak[stakndx=stakndx+1];
		linear 				= stak[stakndx=stakndx+1];
		constcoeffs 		= stak[stakndx=stakndx+1];
		trivialsol  		= stak[stakndx=stakndx+1];		
		stakndx 			= stakndx - 16;
	]

printstack[] :=
	Module[{},
		Print["============================================================="];
		Print["stakndx     			= ",stakndx];
		Print["systemyt   			= ",systemyt];
		Print["systemy    			= ",systemy];
		Print["initconds  			= ",initconds];
		Print["initeqs    			= ",initeqs];
		Print["initrules  			= ",initrules];
		Print["yvars      			= ",yvars];
		Print["ytset     			= ",ytset];
		Print["yset       			= ",yset];
		Print["tset      			= ",tset];
		Print["delt       			= ",delt];
		Print["dely       			= ",dely];
		Print["numberofeqs  		= ",numberofeqs];
		Print["order     			= ",order];
		Print["exact      			= ",exact];
		Print["linear     			= ",linear];
		Print["constcoef  			= ",constcoeffs];
		Print["trivialsol  			= ",trivialsol];
		Print["============================================================="];
	]

AddConditions[equation_,smethod_,sform_,y_,t_,var_,constant_,options___] :=
	Module[{tmp,sol,eqs,aa,bb,yy=y,yt,tt=t,checksol,postops},

		timeused = AbsoluteTime[];
		equationform=True;
		tmp = ToString[Form /. {options} /. Options[ODE]];
		checksol = getTF[CheckSolution /. {options} /. Options[ODE]];
		If[equation === Null || seriessol || parasol || tmp === "Return",
			slform = eqform = expeqform = equation;
			Return[]
		];

		If[slform === False,
			Return[]
		];

		Off[Solve::svars];
		Off[Power::infy];
		postops = PostSolution /. {options} /. Options[ODE];
		yy = y /. aa_[tt_] -> aa;
		If[Head[y] === List,
			yt = Through[yy[t]],
			yt = yy[t]
		];
		eqs = Flatten[{equation}] /.
			nrules[Flatten[{yt}],Flatten[{yy}]] /. 
			nrules[Flatten[{yy}],Flatten[{yt}]] /. N[E] -> E;
		If[(!FreeQ[eqs,constant] || !FreeQ[eqs,yt[0]]) && 
			Length[initconds] > 0,
			If[!exception && !FreeQ[equation,Derivative],
				Message[ODE::noconds];Return[equation]];
			If[exception,
				eqs = eqform = slform = eqs /. 
					yt[0] -> First[Drop[Flatten[initconds],1]],	
				If[Length[eqs] == 1,
					eqs = eqform = slform = 
						ImposeInitialValues[eqs,constant,initconds][t,yt],
					If[numberofeqs > 1,
					   eqs = eqform = slform = 
					   ImposeInitialValuesSystem[eqs,constant,initrules][t,yt],
					   eqs = eqform = slform = 
			   				Map[ImposeInitialValues[#,constant,initconds]
								[t,yt]&,eqs]
					]
				]
			];
			If[!noresolve,
				eqs = Union[Flatten[Map[If[!FreeQ[#,constant],
					Delete[eqs,Flatten[Position[eqs,#]]],#]&,eqs]]]
			];
			If[!FreeQ[eqs,False],
				Return[slform = sol = Complement[eqs,{False}]]
			]
		];
		If[FreeQ[Cases[Flatten[{eqs}],Integrate[aa__,bb_]],yy] && 
		   FreeQ[eqs,ODEif] && FreeQ[eqs,Solve] && 
			FreeQ[eqs,ToRules] && FreeQ[eqs,Root],
(* Removed solveeqs from the following test 021899 *)
		  If[(* solveeqs && *)
			(sform == "Rule" || sform == "Function" || sform == "Explicit"),
			Off[Solve::verif];
(* Added Check (v3.0) 041097 *)
			sol = Check[Simplify[Flatten[Map[Solve[#,yt]&,
				Flatten[{eqs}]]]],"verify"];
			On[Solve::verif];
(* Added the following (v3.0) test 041097 *)
			If[sol =!= "verify",
		  		If[FreeQ[sol,Solve] && FreeQ[sol,ToRules] && FreeQ[sol,Root],
					solvedform = Flatten[sol] /. 
						(aa_[tt_] -> bb_) ->  aa -> Function[tt,bb]
		  		],
(* Added equationform = False; 041097 *)
				equationform = False;
				sol = expeqform = eqs
			],
			sol = expeqform = eqs
		  ];
		  tmp = Flatten[{eqs}];
		  If[(sform == "Rule" || sform == "Function" || sform == "Explicit") &&
			 (!FreeQ[sol,Solve] || !FreeQ[sol,ToRules] || !FreeQ[sol,Root]) &&
		   	  Length[tmp] == 1 && First[First[tmp]][[0]] === Power && 
			  First[First[tmp]][[1]] === E,
			Off[Solve::verif];
(* Added Check (v3.0) 041097 *)
			sol = Check[Simplify[Flatten[Map[Solve[#,yt]&,
				{PowerExpand[Log[First[tmp][[1]]]] == 
				Log[First[tmp][[2]]]}]]],"verify"];
			On[Solve::verif];
(* Added the following (v3.0) test 041097 *)
			If[sol =!= "verify",
		  		If[FreeQ[sol,Solve] && FreeQ[sol,ToRules] && FreeQ[sol,Root],
					solvedform = Flatten[sol] /. 
						(aa_[tt_] -> bb_) ->  aa -> Function[tt,bb]
		  		],
(* Added equationform = False; 041097 *)
				equationform = False;
				sol = expeqform = eqs
			]
		  ];
		  If[(!FreeQ[sol,Solve] || !FreeQ[sol,ToRules] || !FreeQ[sol,Root]) &&
		   (sform == "Rule" || sform == "Function" || sform == "Explicit"),
			sol = eqs = slform = Flatten[{eqs}];
			expeqform = 0;
			equationform = False,
			sol = expeqform = eqs = slform = Flatten[{sol}] /. 
				(aa_ -> bb_) ->  aa == bb
		  ];
		  If[!FreeQ[postops,AmplitudePhaseAngle] && equationform,
			 sol = expeqform = sol /. (aa_ == bb_) ->  
				aa == AmplitudePhaseAngle[bb]
		  ];
		  If[sform != "Function",
		 	 slform = FixForm[sol,yt,t,constant,sform,equationform]
		  ]
	  ];
      If[getTF[ODETiming/.{options}/.Options[ODE]],
		timeused = Floor[(AbsoluteTime[]-timeused)*10]/10.0;
		 Print["Phase 3 (Initial Conditions) : ",timeused," seconds , sol = ",sol];
		  timeused = AbsoluteTime[]
      ];
	  On[Solve::svars];
	  On[Power::infy]
	]

ODEClear[] :=
	Module[{},
		stakndx = 0;
		trivial = False;
		riccati = False;
		xchanging = False;
		polar = False;
		factoring = False;
		solvabledependent = False;		
		solvableindependent = False;		
		equidimdependent = False;
		equidimindependent = False;
		dependentmissing = False;
		autonomous = False
	]

CallMethod[eqs_,depvar_,indepvar_,name_,options___] := 
	Module[{sol},
		push[];
		sol = odetrial[eqs,depvar,indepvar,Method->name,options];
		If[sol === "error",pop[];Return[]];
		sol = FinalOptions[Method->name,options];
		pop[];
		sol
	]

FilterOptions[command_Symbol,opts___] :=
   Module[{keywords = First /@ Options[command]},
     Sequence @@ Select[ Flatten[{opts}],MemberQ[keywords,First[#]]& ]
   ]

sps := If[!$ODETracex,FromCharacterCode[Table[32,{10*transformationlevel}]],""]
sps1 := FromCharacterCode[Table[32,{10*(transformationlevel-1)}]]
Perform[msg___,eq_] := Module[{},
	If[!$ODETracex,ODEPartialPrint[sps1,"Performing ",msg," transformation:"]];
	ODEPartialPrint[""];
	ODEPartialPrint[sps,tfset[eq]];
	ODEPartialPrint[""]
]
Pullback[msg___,sol_] := 
	If[!$ODETracex,ODEPartialPrint[sps,"Returning from ",msg,
		" transformation:"];
		ODEPartialPrint[""];
		ODEPartialPrint[sps,tfset[sol]];
		ODEPartialPrint[""]
]
ODEDialoguePrint[msg___] := If[$ODEDialogx, Print[msg]]
ODETracePrint[msg___] := If[$ODETracex,Print[sps,msg]]
ODEPartialPrint[msg___] := If[{msg} =!= {""} && $ODEPartialx,Print[msg]]
ODEDebugPrint[msg___] := If[ODEDebug, Print[msg]]
ODEAllPrint[msg___] := 
	Module[{},
	Print["\n-----------------------------------------------------"];
	Print[msg];
	Print["-----------------------------------------------------\n"]
]

setsysteminfo[eqs_,depvar_,indepvar_] :=
	Module[{t=indepvar,y=yy=depvar,tmp,aa,bb,cc,dd,
			n,eq,eqt,msg="",a,b,oneform=False,ylist=Flatten[{depvar}]},
		tset = indepvar;
		If[Head[indepvar] === List &&
		   Length[indepvar] == 3,
				t = tset = indepvar[[1]]
		];
(* Added ordering 050199 *)
		If[Length[ylist] > 1,
			ordering = Map[Last,Sort[Transpose[{Map[Last,
					Sort[Transpose[{ylist,Range[Length[ylist]]}]]],
					IdentityMatrix[Length[ylist]]}]]],
			ordering = {}
		];
(* Added Sort to dependent variable list 041299 *)
		If[Head[depvar] === List,
			yvars = Sort[depvar];
			yy = yset = Sort[depvar] /. aa_[t] -> aa;
			y = ytset = Through[yy[t]],
			yvars = depvar;
			yy = yset = depvar /. aa_[t] -> aa;
			y = ytset = yy[t]
		];
      	delt = ToExpression[StringJoin["d",ToString[t]]];
      	dely = ToExpression[StringJoin["d",ToString[yy]]];
		tmp = Flatten[{eqs}];
		Do[	
			If[FreeQ[tmp[[n]],Equal],
				tmp[[n]] = tmp[[n]] == 0
			],
			{n,1,Length[tmp]}
		];
		If[!FreeQ[tmp,delt] || !FreeQ[tmp,dely],oneform=True];
		tmp = tmp  /. {delt -> 1 , dely -> yy'[indepvar]};
		tmp = tmp /. 
			nrules[Flatten[{y}],Flatten[{yy}]] /.
			Derivative[n_][aa_][t] -> Derivative[n][aa];
		tmp = tmp /.
			Derivative[n_][aa_] -> bb[aa,n] /. 
			nrules[Flatten[{yy}],Flatten[{y}]] /.
			bb[cc_[dd_],n_] -> Derivative[n][cc][dd];
		tmp = Flatten[tmp /. And[aa_,bb_] -> {aa,bb}];
		tmp = tmp /. a_[t][b_] /; FreeQ[b,yy] -> a[b];
		tmp = tmp /. Derivative[n_][a_[t]][b_] -> Derivative[n][a][b];
		initconds = Cases[tmp,aa_[bb_] == cc__ /; FreeQ[bb,t]];
		tmp = Map[Factor[#]&,Complement[tmp,initconds],Infinity];    
		tmp = Map[ExpandAll[#]&,tmp,Infinity];
		exact = tmp === Rationalize[tmp,0];
		systemyt = tmp = Rationalize[Complement[tmp,initconds],0];
		If[!oneform && Length[Flatten[{tmp}]] > 1,
			order = Max[Map[DEOrder[#,y,t]&,Flatten[{tmp}]]];
			Off[Solve::svars];
			aa = Solve[systemyt,D[ytset,{t,order}]];
			On[Solve::svars];
			If[!FreeQ[aa,Rule] && 
				Length[Flatten[{aa}]] == Length[Flatten[{systemyt}]],
			  systemyt = tmp = Simplify[Flatten[{aa} /. (a_ -> b_) -> a == b]]
			] 
		];
		eq = systemy = First[ConvertToY[tmp,yy,t]];
(* Replaced exact with new variable allexact 041197 *)
		allexact = exact && (initconds === Rationalize[initconds,0]);
		initconds = initeqs = Rationalize[initconds,0];
		initrules = Flatten[Map[ToRules,initconds]];
		If[Length[GetCoefficients[First[tmp],yy,t]] > 1,
		  constcoeffs = FreeQ[Rest[GetCoefficients[First[tmp],yy,t]],t] &&
			FreeQ[Rest[GetCoefficients[First[tmp],yy,t]],yy],
			aa = GetMatrices[systemyt,y,t];
			If[aa =!= {},
		  		constcoeffs = FreeQ[First[aa],yy] && FreeQ[First[aa],t]
			]
		];
		eqt = Flatten[Union[{eq},{initconds}]];
		initconds = Sort[Select[Flatten[{initconds}],D[#,t]&]] /. 
					{yy[a_] == b_ -> {a,b}, 
					Derivative[i_][yy][a_] == c_ -> c};
		If[!MatrixQ[initconds],
			initconds = Flatten[initconds]
		];
		If[MatrixQ[initconds] && Length[initconds] == 1,
			initconds = Flatten[initconds]
		];
		numberofeqs = Length[tmp];
		order = Max[Map[DEOrder[#,y,t]&,Flatten[{tmp}]]];
		If[numberofeqs == 1,
			linear = FreeQ[Map[LinearQ[#,y,t]&,Flatten[{tmp}]],False],
			linear = Max[0,Cases[Flatten[{tmp}],
				Derivative[_][_][_]^(n_.) -> n,Infinity]] === 1;
			cc = GetMatrices[tmp,y,t];
			If[cc =!= {},
				aa = First[cc];
				bb = Last[cc];
				linear = linear && Length[aa] == 1 && 
				(Simplify[Together[D[y,t] - Flatten[aa.y]-bb]] ===
				  Simplify[Together[Flatten[Map[First[#]-Last[#]&,tmp]]]])		
			];
		];
		If[Min[Map[DEOrder[#,y,t]&,Flatten[{tmp}]]] == 0 &&
		   FreeQ[tmp,Integrate],
			numberofeqs = 0;
			order = 0
		];
		If[numberofeqs == 0,
			msg = StringJoin[msg,
			"Not a differential equation or system of differential equations"]
		];
		If[order == 1,
			msg = StringJoin[msg,"First order "]
		];
		If[order == 2,
			msg = StringJoin[msg,"Second order "]
		];
		If[order == 3,
			msg = StringJoin[msg,"Third order "]
		];
		If[order == 4,
			msg = StringJoin[msg,"Fourth order "]
		];
		If[order > 4,
			msg = StringJoin[msg,"High order "]
		];
		If[order > 0 && linear,
			msg = StringJoin[msg,"linear "]
		];
		If[order > 0 && !linear,
			msg = StringJoin[msg,"nonlinear "]
		];
		If[order > 0 && numberofeqs == 1,
			msg = StringJoin[msg,"differential equation."]
		];
		If[order > 0 && numberofeqs > 1,
			msg = StringJoin[msg,"system of differential equations."]
		];
		msg
	]

getmeq[eqs_,indepvar_,depvar_,yp_] :=
   Module[{tmp,var,y=depvar,n,m,z},
	  If[yp === 0,
		tmp = eqs /. Derivative[n_][y]^m_. -> z[n,m];
	  	tmp = Flatten[Solve[tmp,depvar]] /. z[n_,m_] -> Derivative[n][y]^m;
		var = depvar,
	  	tmp = Flatten[Solve[eqs,yp]];
(* Modification for equations with approximate numbers 041499 *)
		If[!exact,tmp=N[tmp]];
	  	var = yp	  	
	  ];
	  If[Length[tmp] >= 1 && Head[tmp] =!= Solve,
		If[!(usermethod === Automatic  || usermethod === AllSymbolic ||
		   usermethod === AllNumerical || usermethod === AllSemiNumerical),
		  	If[Length[tmp] > 1,
	  	  		Message[ODE::multsol,var,Last[First[tmp]]]
		  	]
		];
		If[exact,
			Return[var == ExpandAll[Last[First[tmp]]]],
			Return[var == Last[First[tmp]]]
		]	  
	  ];
	  Return[False]
	]

getrhs[eqs_,indepvar_,depvar_,yp_] :=
   Module[{tmp,var,y=depvar,n,m,z},
	  If[yp === 0,
		tmp = eqs /. Derivative[n_][y]^m_. -> z[n,m];
	  	tmp = Flatten[Solve[tmp,depvar]] /. z[n_,m_] -> Derivative[n][y]^m;
		var = depvar,
	  	tmp = Flatten[Solve[eqs,yp]];
	  	var = yp	  	
	  ];
	  If[Length[tmp] >= 1 && clean[tmp],
		If[exact,
			Return[Map[ExpandAll[Last[#]]&,tmp]],
			Return[Map[Last,tmp]]
	  	]
	  ];
	  Return[False]
	]

Parse[eqs_,depvar_,indepvar_] :=
   Module[{F=0,y0c=0,y1c=0,ypc=0,yppc=0,ypow=0,pow=0,mm,nn,expr,
			tmp,n,t=indepvar,y=depvar,aeq=eqs,order},		 		

	  If[Head[eqs] === List && Length[eqs] > 1,
			Return[ParseError]
	  ];

	  {aeq,y,t} = ConvertToY[eqs,depvar,indepvar];

	  If[Head[aeq] === List,aeq = First[aeq]];
	  expr = ExpandAll[Numerator[Together[First[aeq] - Last[aeq]]]];
	  Off[Power::infy];
	  Off[Power::infty];
	  If[FreeQ[expr,delt] && FreeQ[expr,dely],
		order = Max[0,Cases[{expr},Derivative[n_][y] -> n,Infinity]];
	  	If[ order == Null || order == 0,
	 	 	On[Power::infy];
	  	 	On[Power::infty];
			Message[ODE::notde];Return[]];

		 aeq = getmeq[expr==0,indepvar,depvar,Derivative[order][y]];
	 	 If[ !aeq, 
	 	 	On[Power::infy];
	  	 	On[Power::infty];
			Return[ParseError]
		 ];
	 	 F = Last[aeq];

		 expr = Derivative[order][y] - Rationalize[ExpandAll[F],0];
		 yppc = Coefficient[expr,y''];
		 expr = ExpandAll[expr - yppc y''];
		 ypc = Coefficient[expr,y'];
		 expr = ExpandAll[expr - ypc y'];
		 pow = Union[Cases[{expr},y^n_ -> n,Infinity]];
		 If[pow == {}, pow = {0}];
		 If[Length[pow] == 1,
			pow = First[pow];
			If[pow =!= 0,
		 		ypow = Coefficient[expr,y^pow],
				ypow = 0
			];
		 	expr = ExpandAll[expr - ypow y^pow],
		 	ypow = Map[Coefficient[expr,y^#]&,pow];
		 	expr = ExpandAll[expr - ypow.(y^pow)]
		 ];
		 y1c = Coefficient[expr,y];
		 expr = ExpandAll[expr - y1c y];
		 If[FreeQ[expr,y],
			y0c = expr;
		 	expr = ExpandAll[expr - y0c]
		 ];
		 On[Power::infy];
		 On[Power::infty];
		 If[expr =!= 0,
			Return[ParseError],
			Return[{F,y0c,y1c,ypc,yppc,ypow,pow}]
		 ]
      ];

	  expr = ExpandAll[First[Rationalize[aeq,0]] - Last[Rationalize[aeq,0]]];
	  On[Power::infy];
	  On[Power::infty];
      If[!FreeQ[expr,delt] || !FreeQ[expr,dely],
		 mm = Coefficient[expr,delt];
		 nn = Coefficient[expr,dely];
		 Return[{F,mm,nn,0,0,0,0}]
      ];
      Return[ParseError]
   ] 
			       
odetrial[eqs_,depvar_,indepvar_,options___] :=
    Module[{method,smethod,sform,tmp,opts,constant,t=indepvar,i,var=depvar,
	y=dep=depvar,F,G,hc,C,eq,eqt,yt,yy=depvar,ainit,s,a,b,c,d,e,rs,n,system,z,
	aa,bb,cc,dd,ee,expr,orgeq,pow,stepsize,pt,x,iter,leftend=0,rightend=0,
	steps,t0,crule={},sol=False,csol,skip=False,psol,dsolvepackage,
	params=False,trivialval=0,trivialonly,maxstepsize},

		timeused = AbsoluteTime[];

		eqform = False;
		slform = False;
		equationform = True;
		solvedform = False;

		tolerance = 10^(-5);
		maxsteps = 10;
		bulirschstoerorder = 4;
		plotok = True;
		numsol = False;
		parasol = False;
		seriessol = False;
		sysconvert = False;
		solveeqs = False;
		noresolve = False;
		csol = {};
		functionlist = {};

		trivialsol = False;
		trivialonly = {};
		singularsolution = 0;

		If[Head[indepvar] === List &&
		   Length[indepvar] == 3,
				t = indepvar[[1]];
				leftend = indepvar[[2]];
				rightend = indepvar[[3]];
				If[leftend >= rightend,
					Message[ODE::badinterval];Return["error"]]
		];
		t = tset;
		y = ytset;
		yy = yset;
		system = Rationalize[systemyt,0];
		orgeq = First[system];
		eqt = Flatten[Union[{system},{initeqs}]];
		If[Length[initconds] > 0,
			t0 = First[Flatten[initconds /. aa_[bb_] == cc_ -> bb]],
			t0 = 0
		];
		If[Length[initeqs] > 0  && numberofeqs == 1 && 
			(order =!= Length[initeqs] || order =!= DEOrder[initeqs,y,t]+1),
			Message[ODE::notbal];Return["error"]];
		method = Method /. {options} /. Options[ODE];
		opts = FilterOptions[method,options];
		opts = Sequence @@ Delete[{opts},Position[{opts},Method -> NDSolve]];
		opts = Sequence @@ Delete[{opts},Position[{opts},Method -> AllNumerical]];
		aa = Transformation /. {options} /. Options[ODE];
		If[FreeQ[{options},Method] && aa =!= None,
			method = Transform
		];
		aa = ProposedSolution /. {options} /. Options[ODE];
		If[aa =!= None,
			sol = aa;
			If[Head[sol] =!= Equal,
				sol = y == sol
			];
			Return[slform = eqform = First[ConvertToYofT[sol,y,t]]]
		];
		smethod = ToString[method];
		sform = ToString[Form /. {options} /. Options[ODE]];
		constant = Constants /. {options} /. Options[ODE];
		dsolvepackage = getTF[DSolvePackage /. {options} /. Options[ODE]];
		params = Parameters /. {options} /. Options[ODE];
		crule := Flatten[Table[{constant[i] -> ToExpression[StringJoin[
			ToString[constant],ToString[i]]]},{i,1,order}]];
		If[params === None,
			iter = {{i,1,1}},
			iter = params
		];

        If[sform == "FundamentalSet",
			If[numberofeqs == 1 && linear && constcoeffs,
				tmp = GetCoefficients[First[system],yy,t];
				system = Rest[tmp].Table[D[yy[t],{t,n}],{n,0,order}]==0;
				sol = NthOrderLinear[system,yy,t,C];
				sol = Complement[Union[Flatten[CoefficientList[sol,
					Table[C[i],{i,1,2*order}]]]],{0}]
			];
			If[numberofeqs > 1 && linear && constcoeffs,
				tmp = Map[First[#] - Last[#]&,system];
				bb = tmp /. Flatten[Map[{# -> 0 , 
					D[#,{t,n_}] :> 0}&,Flatten[{y}]]];
       			tmp = Map[First[#] - Last[#]&,system] /. 
          			Thread[Rule[D[y,t],Table[0,{Length[Flatten[{y}]]}]]] - bb;
        		tmp = -Outer[D,tmp,y];
        		sol = Map[Together,ComplexExpand[
					Transpose[Normal[MatrixExp[tmp t]]]],Infinity]
			];
			Return[slform = sol]
	   ];

(* Removed !linear && from following test 040797 *)
       If[(smethod == "Trivial" ||
		   (smethod != "DSolve" && smethod != "NDSolve" && 
			smethod != "None" &&
		    smethod != "Lagrange" && smethod != "Clairaut" && 
		    smethod != "Transform" && usermethod =!= Automatic)),
			Off[Power::infy];
			Off[Power::infty];
			Off[Infinity::indet];
			Off[RowReduce::indet];
			If[numberofeqs > 1,
				tmp =  system /. 
				 nrules[Flatten[{y}],Table[0,{Length[Flatten[{y}]]}]];
				tmp = tmp /. 
				 nrules[Flatten[{D[y,t]}],Table[0,{Length[Flatten[{y}]]}]];
				If[Union[Flatten[tmp]] === {True},
					sol =  
				    nrules[Flatten[{y}],Table[0,{Length[Flatten[{y}]]}]] /.
					(a_ -> b_) ->  a == b
				],
				Clear[yt];
				expr = {First[First[system]]-Last[First[system]]} /. yy -> yt ;
				If[initconds === {},
    				trivialval = 0,
    				trivialval = initconds[[2]]
				];
				yt[x_] := trivialval;
				If[Length[Union[Simplify[expr]]] == 1 &&
			   		First[Union[Simplify[expr]]] === 0,
						sol = trivialsol = trivialonly = {y == trivialval},
						eqform = Null;
						sol = slform = False
				];
If[ODESingular,

				F = getmeq[systemy,t,yy,yy'];
            	If[F =!= False && order == 1,
					F = Last[F];
					aa = Select[FactorList[
						Numerator[Together[F]]],FreeQ[#,t]&];
					tmp = Flatten[Position[aa,{yy,n_}]];
					If[tmp =!= {},
						aa = Delete[aa,tmp]
					];
					If[aa =!= {},
					  If[sol =!= False,
						tmp = Join[sol,Flatten[Map[
							Solve[First[#]==0,yy]&,aa]]];
						sol = trivialsol = tmp /. (aa_ -> bb_) -> aa == bb,
						tmp = Flatten[Map[Solve[First[#]==0,yy]&,aa]];
						sol = trivialsol = tmp /. (aa_ -> bb_) -> aa == bb
					  ]
					];
					If[sol === {},sol = trivialsol = False]
				];

				If[numberofeqs == 1 && order == 1,
					aa = First[Flatten[{systemy}]];
					aa = First[aa] - Last[aa] /. yy' -> s;
					bb = D[aa,s];
					If[!FreeQ[aa,s] && !FreeQ[bb,s],
					   aa = Eliminate[{aa==0,bb==0},s];
						If[trivialonly =!= {},
							If[Length[trivialonly] == 1,
								ODEDialoguePrint[First[trivialonly] /. 
									nrules[Flatten[{y}],Flatten[{yy}]] /.
									nrules[Flatten[{yy}],Flatten[{var}]]],
								ODEDialoguePrint[trivialonly /. 
									nrules[Flatten[{y}],Flatten[{yy}]] /.
									nrules[Flatten[{yy}],Flatten[{var}]]];
							];
							ODEDialoguePrint[]
						];
					   ODEDialogPrint["The p-discriminant: ",aa];
					   aa = Solve[aa,yy];
					   If[aa =!= {} && FreeQ[aa,Solve] && 
						  FreeQ[aa,ToRules] && FreeQ[aa,Root],
					     If[sol =!= False,
						   tmp = Join[sol,Flatten[aa]];
						   sol = trivialsol = tmp /. (aa_ -> bb_) -> aa == bb,
						   tmp = Flatten[aa];
						   sol = trivialsol = tmp /. (aa_ -> bb_) -> aa == bb
					     ]
					   ]
					]
				];
];

				trivialsol = trivialsol /. 
					nrules[Flatten[{y}],Flatten[{yy}]] /.
					nrules[Flatten[{yy}],Flatten[{var}]];
				If[Head[trivialsol] === List,
					trivialsol = Union[trivialsol]
				] 
			];
			On[Power::infy];
			On[Power::infty];
			On[Infinity::indet];
			On[RowReduce::indet]
		];

        If[smethod == "LinearSystem",
			If[!linear,
				Message[ODE::notfols];Return["error"]];
			If[!constcoeffs,
				Message[ODE::notconcoeff];Return["error"]];
			If[order > 1,
				Message[ODE::notfos];Return["error"]];
			trivialsol = False;
			sol = LinearSystem[system,y,t,constant]
		];
        If[smethod == "ApproximateLinearSystem",
			If[!linear,
				Message[ODE::notfols];Return["error"]];
			If[!constcoeffs,
				Message[ODE::notconcoeff];Return["error"]];
			If[order > 1,
				Message[ODE::notfos];Return["error"]];
			exact = False;
			trivialsol = False;
			sol = ApproximateLinearSystem[system,y,t,constant]
		];
        If[smethod == "Laplace",
			If[(!linear || !constcoeffs) && FreeQ[eqt,Integrate],
				Message[ODE::notlaplace];Return["error"]];
			If[FreeQ[initconds,Equal],
				If[initconds =!= {} && First[initconds] =!= 0,
					Message[ODE::notatzero];Return["error"]],
				If[Union[initconds /. a_[b_] == c_ -> b] =!= {0},
					Message[ODE::notatzero];Return["error"]]
			];
			If[!laplace,
				laplace = True;
				If[$VersionNumber < 4.0,
					Needs["Calculus`LaplaceTransform`"]
				]
			];
			sol = Laplace[Map[Factor,eqt,Infinity],y,t];
			If[FreeQ[sol,Solve] && FreeQ[sol,DSolve],
				sol = sol /. (a_ -> b_) -> a == b
			];
			If[!FreeQ[sol,DSolve],
				Return[sol]
			];
			trivialsol = False;
			initconds = {}
		];
        If[smethod == "DSolve",
			If[$VersionNumber <= 2.2 && !dsolve && dsolvepackage,
				dsolve = True;
				Needs["Calculus`DSolve`"]
			];
            If[!FreeQ[{options},Constants],
        		constant = Constants /. {options} /. Options[ODE];
				opts = DSolveConstants -> constant
			];
            If[!FreeQ[{options},DSolveConstants],
				constant = DSolveConstants /. {options} /. Options[DSolve];
				opts = DSolveConstants -> constant
			];
            sol = (method @@ Sequence[{eqt,y,t,opts}])/. {} -> False;
			If[FreeQ[sol,Solve] && FreeQ[sol,DSolve],
					sol = sol /. (a_ -> b_) -> a == b
			];
			If[!FreeQ[sol,DSolve],
				Return[sol]
			];
			initconds = {}
        ];
        If[smethod == "NDSolve",
			If[initconds === {},
				Message[ODE::noinit];Return["error"]
        	];
        	If[Head[indepvar] =!= List ||
               Length[indepvar] != 3,
				Message[ODE::badinterval];Return["error"]
        	];
			numsol = True;
			Do[
        		If[smethod == "NDSolve"     &&
            		Head[indepvar] === List &&
            		Length[indepvar] == 3   &&
					initconds =!= {},
            		sol = method @@ 
					  Sequence[{eqt/.ODEif[a_,b_,c___,d___]:>If[a,b,c,d],
					   y,indepvar,opts}];
					AppendTo[functionlist,(Flatten[sol] /. aa_[t] -> aa)];
					sol = expeqform = sol  /. (aa_ -> bb_) -> aa == bb
        		],
	  			Evaluate[Apply[Sequence,(iter /.crule)]]
			];
    		initconds = {};
			sol = MakeForm[sol,y,t,constant,sform]
		];

       If[!FreeQ[NewFirstOrderMethods,method] 	||
		  !FreeQ[NewHighOrderMethods,method] 	||
		  !FreeQ[NewSemiNumericalMethods,method],
			If[!ToExpression[smethod<>"Q"] @@ Sequence[{eqt,y,t}],
				Message[ODE::notype,eqt,smethod];Return["error"]];
			solveeqs = True;
			sol = method @@ Sequence[{eqt,y,t,constant}] /.
				nrules[Flatten[{y}],Flatten[{yy}]]
        ];

(***********************************************************************)

	y = dep = yset;
	eq = systemy;

	If[MemberQ[singleeqset,ToExpression[smethod]],

	  If[numberofeqs == 1,

        If[smethod == "MultiplyByDerivative",
			tmp = Simplify[(First[orgeq]-Last[orgeq]) D[yy[t],t]] == 0;
 			If[SecondOrderExactQ[tmp,y,t],
				tmp = SecondOrderExact[tmp,y,t,constant];
        		F = getrhs[First[First[ConvertToY[tmp,y,t]]],t,y,y'] /.
					constant[1] -> ODEA;
            	If[F =!= False,
					linear = False;
					solveeqs = True;
               		sol = multsolve[F,Separable[#,constant][t,y]&][t,y] /.
						constant -> constant[2] /. ODEA -> constant[1];
					If[sol === {},
						Message[ODE::hairy];Return["error"]
					],
					Message[ODE::notsep];Return["error"]
				]
			]
       ];
        If[smethod == "TableLookup",
			If[order != 2,
				Message[ODE::notable];Return["error"]];
            sol = TableLookup[eq,y,t,constant];
			If[sol === Null,
				trivialsol = False;
				If[usermethod =!= Automatic && 
				   usermethod =!= ReallyAll && usermethod =!= AllSymbolic,
					Message[ODE::thairy]
				];
				Return["error"]
			]
        ];
	    If[smethod == "ProposedSet",
			If[!linear,
				Message[ODE::notlin];Return["error"]];
            bb = Flatten[{KnownSolution/.{options}/.Options[ODE]}];
            If[bb === None,
				Message[ODE::nosolp];Return["error"]];
            If[Length[bb] != order,
				Message[ODE::toofewsol,order];Return["error"]];
			bb = Map[Function[t,#]&,bb];
			pow = GetCoefficients[First[eqt],y[t],t];
			aa = First[pow];
			ee = Last[pow];
			dd = Function[t,Simplify[-aa/ee] /. {indepvar -> t, dep -> y}];
			cc = Simplify[First[eqt[[1]]]-Last[eqt[[1]]] - aa] == 0;
            sol = ProposedSet[cc,y,t,bb,dd,constant]
        ];
	    If[smethod == "FirstOrderLinear",
           {F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
			If[!exact,{F,aa,bb,cc,dd,ee,pow}=N[{F,aa,bb,cc,dd,ee,pow}]];
			If[Rationalize[pow] =!= 0 || !FreeQ[{aa,bb,cc},y] || 
			  order != 1 || !linear,
				Message[ODE::not1lin];Return["error"]];
			c = Function[t,-aa /. {indepvar -> t, dep -> y}];
			b = Function[t, bb /. {indepvar -> t, dep -> y}];
			a = Function[t, cc /. {indepvar -> t, dep -> y}];
            sol = FirstOrderLinear[a,b,c,constant][t]
        ];
        If[smethod == "AlmostLinear",
           {F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
			If[dd === 0 && ee === 0 && FreeQ[{aa,bb,cc},y] && 
			  order === 1 && linear,
				c = Function[t,-aa /. {indepvar -> t, dep -> y}];
				b = Function[t, bb /. {indepvar -> t, dep -> y}];
				a = Function[t, cc /. {indepvar -> t, dep -> y}];
            	sol = FirstOrderLinear[a,b,c,constant][t],
 				solveeqs = True;
           		If[order === 1 && AlmostLinearQ[orgeq,y[t],t],
					sol = AlmostLinear[orgeq,y[t],t,constant],
					Message[ODE::notalin];Return["error"]
				]
			]
        ];
        If[smethod == "Bernoulli",
            {F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
            If[pow === {} || pow === 1 || aa =!= 0 || 
				(Head[pow] === List && Length[pow] > 1) ||
				!FreeQ[{bb,cc,ee},y] || order != 1 || F === 0,
				Message[ODE::notbernoulli];Return["error"]];
			c = Function[t,-ee /. {indepvar -> t, dep -> y}];
			b = Function[t, bb /. {indepvar -> t, dep -> y}];
			a = Function[t, cc /. {indepvar -> t, dep -> y}];
			solveeqs = True;
            sol = Bernoulli[a,b,c,pow,constant][t]
        ];
        If[smethod == "Riccati",
            aa = KnownSolution/.{options}/.Options[ODE];
            If[aa === None,
				Message[ODE::nosol];Return["error"]];
            rs[t_] := KnownSolution/.{options}/.Options[ODE];
			If[Simplify[First[orgeq]-Last[orgeq]/. 
				{D[yy[t],{t,n_}] -> D[rs[t],{t,n}],yy -> rs}] =!= 0,
				Message[ODE::notsol];Return["error"]];			
            {F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
            If[F === 0 || order != 1 ||
				(Head[pow] === List && Length[pow] > 1) ||
				(ee =!= 0 && pow =!= 2),
				Message[ODE::notriccati];Return["error"]];
			d = Function[t,-ee /. {indepvar -> t, dep -> y}];
			c = Function[t,-bb /. {indepvar -> t, dep -> y}];
			b = Function[t,-aa /. {indepvar -> t, dep -> y}];
			a = Function[t, cc /. {indepvar -> t, dep -> y}];
			solveeqs = True;
            sol = Riccati[a,b,c,d,rs,constant][t]
        ];
        If[smethod == "FirstOrderExact",
			If[order === 1,
				tmp = eq;
				eq = First[First[eq]] - Last[First[eq]] /. y' -> 
					ToExpression[StringJoin["d",ToString[y],"/d",ToString[t]]];
				If[!FreeQ[eq,ToExpression[StringJoin["d",ToString[y]]]^_],
       				eq = {getmeq[tmp,t,y,y']};
					If[eq =!= {False},
						eq = First[First[eq]] - Last[First[eq]] /. y' -> 
						ToExpression[StringJoin["d",
						ToString[y],"/d",ToString[t]]]
					]
				];
				eq = Expand[ToExpression[StringJoin["d",ToString[t]]] eq];
            	{F,aa,bb,cc,dd,ee,pow} = Parse[{eq == 0},y,t];
				a = Function[{t,y},aa /. {indepvar -> t, dep -> y}];
				b = Function[{t,y},bb /. {indepvar -> t, dep -> y}];
				If[FirstOrderExactQ[a,b][t,y],
					solveeqs = True;
                	sol = FirstOrderExact[a,b,constant][t,y],
					Message[ODE::not1exact];Return["error"]
				],
            	{F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
				If[ aa =!= 0 && bb =!= 0,
					a = Function[{t,y},aa /. {indepvar -> t, dep -> y}];
					b = Function[{t,y},bb /. {indepvar -> t, dep -> y}];
					If[FirstOrderExactQ[a,b][t,y],
						solveeqs = True;
                		sol = FirstOrderExact[a,b,constant][t,y],
						Message[ODE::not1exact];Return["error"]
					],
					Message[ODE::not1exact];Return["error"]
				]
			]
        ];
        If[smethod == "IntegratingFactor",
				If[order === 1,
					tmp = eq;
					eq = First[First[eq]] - Last[First[eq]] /. y' -> 
					 	ToExpression[StringJoin["d",ToString[y],
							"/d",ToString[t]]];
					If[!FreeQ[eq,ToExpression[StringJoin["d",ToString[y]]]^_],
       					eq = {getmeq[tmp,t,y,y']};
						If[eq =!= {False},
							eq = First[First[eq]] - Last[First[eq]] /. y' -> 
							ToExpression[StringJoin["d",ToString[y],
								"/d",ToString[t]]]
						]
					];
					eq = Expand[ToExpression[StringJoin["d",ToString[t]]] eq];
            		{F,aa,bb,cc,dd,ee,pow} = Parse[{eq == 0},y,t];
					If[Flatten[{aa}] =!= {0} && Flatten[{bb}] =!= {0},
						a = Function[{t,y},aa /. {indepvar -> t, dep -> y}];
						b = Function[{t,y},bb /. {indepvar -> t, dep -> y}];
						solveeqs = True;
                		sol = IntegratingFactor[a,b,constant][t,y]
					],
            		{F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
					If[Flatten[{aa}] =!= {0} && Flatten[{bb}] =!= {0},
						a = Function[{t,y},aa /. {indepvar -> t, dep -> y}];
						b = Function[{t,y},bb /. {indepvar -> t, dep -> y}];
						solveeqs = True;
                		sol = IntegratingFactor[a,b,constant][t,y],
						Message[ODE::notfo];Return["error"]
					]
				]
        ];
        If[smethod == "FirstOrderHomogeneous",
			F = getmeq[eq,t,y,y'];
            If[F =!= False && order == 1,
				F = Last[F];
				cc = 1,
            	{F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t]
			];
			If[ cc =!= 0,
           		G = Function[{t,y},F /. {indepvar -> t, dep -> y}];
				solveeqs = True;
                sol = FirstOrderHomogeneous[G,constant][t,y],
				If[ aa =!= 0 || bb =!= 0,
					a = Function[{t,y},aa /. {indepvar -> t, dep -> y}];
					b = Function[{t,y},bb /. {indepvar -> t, dep -> y}];
					solveeqs = True;
                	sol = FirstOrderHomogeneous[a,b,constant][t,y],
					Message[ODE::nothomo];Return["error"]
				]
			]
        ];
        If[smethod == "Separable",
        	F = getmeq[eq,t,y,y'];
            If[F =!= False && order == 1,
 				G = Function[{t,y},Last[F] /. {indepvar -> t, dep -> y}];
				solveeqs = True;
                sol = Separable[G,constant][t,y];
				If[sol === Null && SeparableQ[G][t,y],
					Message[ODE::hairy];Return["error"]
				],
				Message[ODE::notsep];Return["error"]
			]
        ];
        If[smethod == "GeneralizedHomogeneous",
        	F = getmeq[eq,t,y,y'];
            If[F =!= False  && order == 1 && D[t Last[F]/y,y] =!= 0,
 				G = Function[{t,y},Last[F] /. {indepvar -> t, dep -> y}];
				solveeqs = True;
                sol = GeneralizedHomogeneous[G,constant][t,y],
				Message[ODE::notgenhom];Return["error"]
			]
        ];
        If[smethod == "Clairaut",
        	F = getmeq[eq,t,y,0];
            If[F =!= False,
 				F = Last[F];
				If[!FreeQ[F,t y'],
					F = (F - t y') /. y' -> s;
					If [FreeQ[F,t] && FreeQ[F,y],
            			G[t_] = F /. s -> t;
 						solveeqs = True;
               			sol = Clairaut[G,constant][t,y],
						Message[ODE::notclairaut];Return["error"]
					],
					Message[ODE::notclairaut];Return["error"]
				],
				Message[ODE::notclairaut];Return["error"]
			]
        ];
        If[smethod == "Lagrange",
            If[LagrangeQ[orgeq,y[t],t],
				solveeqs = True;
				sol = Lagrange[orgeq,y[t],t,constant],
				Message[ODE::notlagrange];Return["error"]
			]
        ];
        If[smethod == "LinearFractional",
        	F = Together[Last[getmeq[eq,t,y,y']]];
			G = Function[{t,y},F /. {indepvar -> t, dep -> y}];
            If[LinearFractionalQ[G][t,y],
				solveeqs = True;
                sol = LinearFractional[G,constant][t,y],
				Message[ODE::notlinfract];Return["error"]
			]
        ];
        If[smethod == "SecondOrderLinearToConstants",
            {F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
		If[!FreeQ[{bb,cc,dd},t],
			If[order == 1,
				a = Function[t,cc /. {indepvar -> t, dep -> y}];
				b = Function[t,bb /. {indepvar -> t, dep -> y}];
				c = Function[t,-aa /. {indepvar -> t, dep -> y}];
				sol = FirstOrderLinear[a,b,c,constant][t],
				a =  Function[t,dd /. {indepvar -> t, dep -> y}];
				b =  Function[t,cc /. {indepvar -> t, dep -> y}];
				c =  Function[t,bb /. {indepvar -> t, dep -> y}];
				d = Function[t,-aa /. {indepvar -> t, dep -> y}];
				If[!SecondOrderLinearToConstantsQ[a,b,c][t] || !linear,
					Message[ODE::notsoltc];Return["error"]];
				sol = SecondOrderLinearToConstants[a,b,c,d,constant][t]
			];
		];
        ];
        If[smethod == "ApproximateNthOrderLinear"   ||
           smethod == "ApproximateFirstOrderLinear" ||
           smethod == "ApproximateSecondOrderLinear",
            If[!linear,
				Message[ODE::notlin];Return["error"]];
			If[!constcoeffs, 
				Message[ODE::notconcoef];Return["error"]];
			exact = False;
            sol = ApproximateNthOrderLinear[orgeq,y,t,constant]
        ];
        If[smethod == "SecondOrderLinear" || smethod == "NthOrderLinear",
            If[!linear,
				Message[ODE::notlin];Return["error"]];
			If[!constcoeffs, 
				Message[ODE::notconcoef];Return["error"]];
			If[!exact,
				sol = ApproximateNthOrderLinear[orgeq,y,t,constant],
				sol = NthOrderLinear[orgeq,y,t,constant]
			]
        ];
        If[smethod == "NthOrderLinearComplex",
            If[!linear,
				Message[ODE::notlin];Return["error"]];
			If[!constcoeffs, 
				Message[ODE::notconcoef];Return["error"]];
			sol = NthOrderLinearComplex[orgeq,y,t,constant]
        ];
        If[smethod == "CauchyEuler" ||
		   smethod == "NthOrderCauchyEuler",
			If[!CauchyEulerQ[orgeq,y[t],t],
				Message[ODE::notce];Return["error"]];
			If[!exact,
				sol = ApproximateNthOrderCauchyEuler[orgeq,y,t,constant],
				sol = NthOrderCauchyEuler[orgeq,y,t,constant]
			]
        ];
        If[smethod == "NthOrderCauchyEulerComplex",
			If[!CauchyEulerQ[orgeq,y[t],t],
				Message[ODE::notce];Return["error"]];
			sol = NthOrderCauchyEulerComplex[orgeq,y[t],t,constant]
        ];
        If[smethod == "ApproximateSecondOrderCauchyEuler" ||
           smethod == "ApproximateNthOrderCauchyEuler",
			If[!CauchyEulerQ[orgeq,y[t],t],
				Message[ODE::notce];Return["error"]];
			exact = False;
			sol = ApproximateNthOrderCauchyEuler[orgeq,y[t],t,constant]
        ];
        If[smethod == "ReductionOfOrder",
            aa = KnownSolution/.{options}/.Options[ODE];
            If[aa === None,
				Message[ODE::nosol];Return["error"]];
			If[aa === 0,
				Message[ODE::notzero];Return["error"]];
            rs[t_] := KnownSolution/.{options}/.Options[ODE];
			If[Simplify[First[orgeq]-Last[orgeq]/. 
				{D[yy[t],{t,n_}] -> D[rs[t],{t,n}],yy -> rs}] =!= 0,
				Message[ODE::notsol];Return["error"]];			
            {F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
			If[ dd === 0 || pow =!= 0 || 
				!FreeQ[{aa,bb,cc,dd},y] || order != 2, 
				Message[ODE::notsecord];Return["error"]];
			a =  Function[t,dd /. {indepvar -> t, dep -> y}];
			b =  Function[t,cc /. {indepvar -> t, dep -> y}];
			sol = ReductionOfOrder[a,b,rs,constant][t]
        ];

	Do[
        If[smethod == "SeriesForm" || smethod == "SeriesFormCauchy",
            degree = Degree/.{options}/.Options[ODE];
            If[NumberQ[degree] && degree < 0,
				Message[ODE::baddegree];Return["error"]
			];
            If[!NumberQ[degree] && FreeQ[degree,params],
				Message[ODE::baddegree];Return["error"]
			];
			seriessol = True;
			orgeq = 
				Transformation[orgeq,{x,t -> x + expansionpt,y[t]->y[x]}] /. 
				x -> t;
			If[smethod == "SeriesForm",
            	sol = SeriesForm[orgeq,y,t,constant,degree] /. 
					t -> t - expansionpt,
            	sol = SeriesFormCauchy[orgeq,y,t,constant,degree] /. 
					t -> t - expansionpt
			];
			If[sol =!= Null,
				If[degree === 0,
            		If[Length[initconds] > 0,
						psol = yy[t] == initconds[[2]],
						psol = yy[t] == sol
					],
            		If[Length[initconds] > 0,
						psol = ImposeInitialValues[yy[t] ==
							sol,constant,initconds][t,yy];
(* Another patch to Simplify  111199 *)
						psol = 
						 Equal @@ First[Flatten[Solve[psol,yy[t]]]],
						psol = yy[t] == sol
					]
				];
				AppendTo[functionlist,{yy -> 
					Function[Evaluate[t],Evaluate[psol[[2]]]]}];
				AppendTo[csol,{psol}]
			]
        ];
        If[smethod == "TaylorSeries",
            If[order != 1,Message[ODE::notfo];Return["error"]];
            {F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
			If[F === 0 && Length[eq] == 1,
				F = getmeq[eq,t,y,y'];
				If[F =!= False,
					F = Last[F]
				]
			];
			G = Function[{t,y},F /. {indepvar -> t, dep -> y}];
            steps = degree = Degree/.{options}/.Options[ODE];
            If[NumberQ[steps] && steps < 0,
				Message[ODE::baddegree];Return["error"]
			];
            If[!NumberQ[steps] && FreeQ[steps,params],
				Message[ODE::baddegree];Return["error"]
			];
			seriessol = True;
			If[steps === 0,
            	If[Length[initconds] > 0,
					sol = initconds[[2]],
					sol = constant[1]
				],
            	If[Length[initconds] > 0,
			   		sol = TaylorSeries[G,initconds,steps,params][t,y],
			   		sol =
					 TaylorSeries[G,{expansionpt,constant[1]},
						steps,params][t,y]
				]
			];
			sol = yy[t] == sol;
			AppendTo[functionlist,{yy -> 
				Function[Evaluate[t],Evaluate[sol[[2]]]]}];
			AppendTo[csol,{sol}]
        ];
        If[smethod == "Picard",
            If[order != 1,Message[ODE::notfo];Return["error"]];
            {F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
			If[F === 0 && Length[eq] == 1,
				F = getmeq[eq,t,y,y'];
				If[F =!= False,
					F = Last[F]
				]
			];
			G = Function[{t,y},F /. {indepvar -> t, dep -> y}];
            steps = Iterations/.{options}/.Options[ODE];
            If[NumberQ[steps] && steps < 0,
				Message[ODE::baddegree];Return["error"]
			];
            If[!NumberQ[steps] && FreeQ[steps,params],
				Message[ODE::baddegree];Return["error"]
			];
			seriessol = True;
			If[steps === 0,
            	If[Length[initconds] > 0,
					sol = initconds[[2]],
					sol = constant[1]
				],
            	If[Length[initconds] > 0,
			   		sol = Picard[G,initconds,{steps}][t],
			   		sol = Picard[G,{expansionpt,constant[1]},{steps}][t]
				]
			];
			sol = yy[t] == sol;
			AppendTo[functionlist,{yy -> 
				Function[Evaluate[t],Evaluate[sol[[2]]]]}];
			AppendTo[csol,{sol}]
         ],
	  Evaluate[Apply[Sequence,(iter /. crule)]]
	  ],

	  Message[ODE::notsup];Return["error"]
	 ]

	]; (* End of First Order Set *)

	Do[
		 If[smethod == "Euler" 		 		||
		    smethod == "Heun"  				||
		    smethod == "SecondOrderEuler" 	||
		    smethod == "RungeKutta4" 	 	||
		    smethod == "RungeKutta45" 	 	||
		    smethod == "Milne"              ||
		    smethod == "AdamsBashforth" 	||
		    smethod == "BulirschStoer" 		||
		    smethod == "ImplicitEuler"      ||
		    smethod == "ImplicitRungeKutta" ||
		    smethod == "Numerov"            ||
		    !FreeQ[NewNumericalMethods,ToExpression[smethod]],
			If[Length[indepvar] =!= 3,
				Message[ODE::nointerval];Return["error"]];
			If[smethod == "Numerov" && order =!= 2,
				Message[ODE::wrongord];Return["error"]];
			If[smethod == "Numerov" && !linear,
				Message[ODE::notlin];Return["error"]];
			If[order =!= 1 && smethod != "Numerov",
				sysconvert = True;
				numberofeqs = 2;
				t = tset;
				y = yset;
				{eq,yt,t} = ConvertToYofT[eqs,y,t];
				eq = ConvertToSystem[Union[eq,initeqs],ytset,t,ODEv];
				initconds = Cases[eq,aa_[bb_] == dd_ /; FreeQ[bb,t]];
				eq = Complement[eq,initconds];
				order = Plus @@ Map[DEOrder[#,y,t]&,Flatten[{eq}]];
				y = yy = var = 
				Table[ToExpression[ToString[ODEv]<>ToString[i]],{i,1,order}]
			];
            {F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
			If[F === 0 && !sysconvert && Length[eq] == 1,
				F = getmeq[eq,t,y,y'];
				If[F =!= False,
					F = Last[F]
				]
			];
			If[Length[eq] > 1,
				F = eq /. nrules[Through[yy[t]],yy];
				F = -Map[First[#]-Last[#]&,F] /. 
					Derivative[_][aa_][t] -> 0 /. Derivative[_][aa_] -> 0;
				tmp = initconds /. crule;
				t0 = First[Cases[tmp,aa_[bb_] == cc_ -> bb]];
				ainit = {t0,tmp /. aa_[bb_] == cc_ -> cc},
				ainit = initconds /. crule
			];
			F = N[F /. crule,precision];						
			If[smethod == "Numerov",
				F = -bb
			];
            stepsize = N[StepSize/.{options}/.Options[ODE],precision];
            tolerance = Tolerance/.{options}/.Options[ODE];
            maxsteps = ODEMaxSteps/.{options}/.Options[ODE];
            initstepsize = stepsize;
            maxstepsize = ODEMaxStepSize/.{options}/.Options[ODE];
			bulirschstoerorder = BulirschStoerOrder/.{options}/.Options[ODE];
            If[stepsize =!= Automatic,
				If[!NumberQ[stepsize] || stepsize <= 0,
				 	 Message[ODE::badstepsize];Return["error"],
				  	steps = Rationalize[Ceiling[
						N[(rightend-leftend)/stepsize]],1]
				]
			];
            If[Length[initconds] == 0,
			   Message[ODE::noinit];Return["error"]
			];
			sol = {};
			If[N[leftend] < N[t0],
				steps = Rationalize[Ceiling[N[(t0-leftend)/stepsize]],1];
				If[varstepsize === True,
					sol = VariableStepSize[F,-aa,N[ainit,precision],
					N[leftend,precision],method,bulirschstoerorder,
					N[-stepsize,precision],N[maxstepsize,precision],steps][t,y]
				];
            	If[varstepsize =!= True && 
				   (smethod =!= "BulirschStoer" && smethod =!= "Numerov"),
			   		tmp = ToExpression[smethod] @@
				 	Sequence[{F,N[ainit,precision],N[-stepsize,precision],
						steps}];
               		sol = Union[sol,tmp @@ Sequence[{t,y}]]
				];
            	If[varstepsize =!= True && smethod == "BulirschStoer",
			   		tmp = BulirschStoer[F,
						N[ainit,precision],N[-stepsize,precision],
						steps,bulirschstoerorder];
               		sol = Union[sol,tmp @@ Sequence[{t,y}]]
				];
            	If[varstepsize =!= True && smethod == "Numerov",
			   		tmp = Numerov[-bb,-aa,
						N[ainit,precision],N[-stepsize,precision],steps][t,y];
               		sol = Union[sol,tmp]
				];
				steps = Rationalize[Ceiling[N[(rightend-t0)/stepsize]],1]
			];
			If[varstepsize === True,
				sol = Union[sol,VariableStepSize[F,-aa,N[ainit,precision],
					N[rightend,precision],method,bulirschstoerorder,
					N[stepsize,precision],N[maxstepsize,precision],steps][t,y]]
			];
            If[varstepsize =!= True && 
				(smethod =!= "BulirschStoer" && smethod =!= "Numerov"),
			   tmp = ToExpression[smethod] @@
				 Sequence[{F,N[ainit,precision],N[stepsize,precision],steps}];
               sol = Union[sol,tmp @@ Sequence[{t,y}]]
			];
            If[varstepsize =!= True && smethod == "BulirschStoer",
			   tmp = ToExpression[smethod] @@
				 Sequence[{F,N[ainit,precision],N[stepsize,precision],
					steps,bulirschstoerorder}];
               sol = Union[sol,tmp @@ Sequence[{t,y}]]
			];
			If[varstepsize =!= True && smethod == "Numerov",
				tmp = Numerov[-bb,-aa,
					N[ainit,precision],N[stepsize,precision],steps][t,y];
				sol = Union[sol,tmp]
			];
			numsol = True;
			If[Length[Union[Map[NumberQ,Flatten[sol]]]] == 1,
			  If[sol =!= {} &&
			   If[numberofeqs == 1,
				AppendTo[functionlist,{yy -> 
					Interpolation[sol,InterpolationOrder->1]}],
				psol = Transpose[Map[Transpose,
					Map[{Table[First[#],{Length[Last[#]]}],Last[#]}&,sol]]];
				psol = nrules[Flatten[{yy}],
					Map[Interpolation[#,InterpolationOrder->1]&,psol]];

(* Added ordering 050199 *)
				If[MatrixQ[ordering],
				    sol = Transpose[Join[{Transpose[sol][[1]]},
				    {Transpose[ordering.Transpose[Transpose[sol][[2]]]]}]];
				    psol = ordering.psol;
				];

				AppendTo[functionlist,psol]
			   ],
			   sol = Null
			  ]
			]
],
	  	Evaluate[Apply[Sequence,(iter /. crule)]]

	]; (* End of Numerical Set *)

		If[!numsol && csol =!= {},
			sol = csol
		];
		aa = Transformation/.{options}/.Options[ODE];
		If[aa =!= None || smethod == "Transform",
			If[numberofeqs == 1 && sol =!= False,
				solveeqs = True;
				If[Head[sol] =!= Equal,
					sol = y == sol
				];
				eqt = {sol};
				orgeq = eq = sol,
				slform = eqform = sol = False
			];
            If[aa === None,
				Message[ODE::norule];Return["error"]];
            bb = TransformationVariable/.{options}/.Options[ODE];
			If[ ToString[aa] === "SecondOrderExact",
				sol = aa @@Sequence[{First[eqt],depvar,t,constant}];
				skip = True
			];
       		If[ToString[aa] == "FactorEquation", 
				sol = FactorEquation[orgeq,y,t];
				skip = True
			];
       		If[ToString[aa] == "RiccatiToSecondOrderLinear", 
				If[RiccatiQ[eq,y,t],
					skip = True;
					sol = RiccatiToSecondOrderLinear[First[eqt],y,t],
					Message[ODE::notriccati];Return["error"]
				]
			];
       		If[ToString[aa] == "SecondOrderLinearToRiccati", 
				If[order == 2 && linear,
					skip = True;
					sol = SecondOrderLinearToRiccati[First[eqt],y,t],
					Message[ODE::notseclin];Return["error"]
				]
			];
(* Added ExchangeVariables for higher-order equations 032498 *)
			If[ToString[aa] === "ExchangeVariables",
				sol = ExchangeVariables[First[eqt],y,t];
				skip = True
(*
        		F = getmeq[eq,t,y,y'];
            	If[F =!= False,
 					G = Function[{t,y},Last[F] /. {indepvar -> t, dep -> y}];
                	sol = ExchangeVariables[G][t,y];
					skip = True
            	]
*)
			];
			If[ ToString[aa] === "CauchyEuler"                   ||
				ToString[aa] === "EquidimensionalInIndependent",
					sol = aa @@ Sequence[{First[eqt],ytset,t}];
					skip = True
			];
			If[ ToString[aa] === "ConvertToSystem",
				skip = True;
				If[bb =!= None,
					sol = aa @@ Sequence[{eqt,ytset,t,bb}],
					Message[ODE::notvar];Return["error"]
				]
			];
			If[ ToString[aa] === "ReductionOfOrder",
            	If[Length[eqt] > 1,
					Message[ODE::notsingle];Return["error"]];
            	If[!linear,
					Message[ODE::notlin];Return["error"]];
            	cc = KnownSolution/.{options}/.Options[ODE];
            	If[cc === None,
					Message[ODE::nosol];Return["error"]];
           		rs[t_] = KnownSolution/.{options}/.Options[ODE];
				skip = True;
				If[bb =!= None,
					sol = aa @@ Sequence[{orgeq,y,t,rs,bb}],
					sol = aa @@ Sequence[{orgeq,y,t,rs,w}]
				]
			];
			If[ ToString[aa] === "Adjoint"                  ||
				ToString[aa] === "Autonomous"     			||
				ToString[aa] === "DependentMissing"     	||
				ToString[aa] === "SolvableForDependent"     ||
				ToString[aa] === "SolvableForIndependent"   ||
				ToString[aa] === "Trajectory"      			||
				ToString[aa] === "EquidimensionalInDependent",
					skip = True;
					If[bb =!= None,
						sol = aa @@ Sequence[{First[eqt],ytset,t,bb}],
						Message[ODE::notvar];Return["error"]
					]
			];
			If[!skip && !FreeQ[aa,Rule],
				sol = Transformation[First[eqt],aa];
				skip = True
			];
			If[sol =!= False && sol =!= {Null},
				sol = sol /. {t -> indepvar , y -> dep},
				sol = ""
			];
			plotok = False

        ];	(* End of Transformation Set *)

		If[smethod != "Transform",
			skip = False
		];
		If[Head[sol] === String || sol === Null,
			sol = False
		];

	If[getTF[ODETiming/.{options}/.Options[ODE]],
		timeused = Floor[(AbsoluteTime[]-timeused)*10]/10.0;
		Print["Phase 1 (General Solution)   : ",timeused," seconds , sol = ",sol];
		timeused = AbsoluteTime[]
	];

	If[exact,
		If[sol =!= False && !numsol && skip === False && Head[sol] =!= List,
			sol = sol /. {y -> y[t] , Derivative[n_][y] :> D[y[t],{t,n}]};
			F = sol;
			If[FreeQ[F,ToExpression[StringJoin[ToString[constant],"[_]"]]],
				F = F /. constant ->
				 ToExpression[StringJoin[ToString[constant],"[1]"]]
			];
			If[F =!= Null && smethod != "Transform",
				If[FreeQ[F,Solve] && Head[F] =!= Equal,F = var == F];
  				If[First[F] =!= var && !FreeQ[First[F],Log,3] &&
					FreeQ[F,Complex],
					F = ExpandAll[Exp[First[F]]] == ExpandAll[Exp[Last[F]]]
				];
				sol = F = Simplify[F]
			]
		],
		If[sol =!= False && !numsol && skip === False && Head[sol] =!= List,
			sol = sol /. {y -> y[t] , Derivative[n_][y] :> D[y[t],{t,n}]};
			F = sol /. N[E] -> E;
			If[FreeQ[F,ToExpression[StringJoin[ToString[constant],"[_]"]]],
				F = F /. constant ->
				 ToExpression[StringJoin[ToString[constant],"[1]"]]
			];
			If[F =!= Null && smethod != "Transform",
				If[FreeQ[F,Solve] && Head[F] =!= Equal,sol = F = var == F];
	 				If[First[F] =!= var && !FreeQ[First[F],Log,3] &&
					FreeQ[F,Complex],
					F = ExpandAll[Exp[First[F]]] == ExpandAll[Exp[Last[F]]]
				];
				sol = F = Simplify[F]
			]
		]
	];

		If[!sysconvert,
			If[Head[depvar] === List,
				y  = Through[yy[t]],
				y = yy[t]
			],
			y  = Through[yy[t]]
		];
		If[var === indepvar,
			sol = sol /. {y -> yy , t -> t[yy]}
		];
		ytset = y;
		yset = yy;
		tset = t;

		If[sol =!= False && smethod != "Clairaut" && smethod != "Lagrange" &&
			!numsol && !parasol && !seriessol &&
			Length[Cases[First[Flatten[{sol}]],constant[n_]->n,Infinity]] <= 1,
			  If[Length[Flatten[{sol}]] == 1,
			  		aa = First[First[Flatten[{sol}]]];
					If[Head[aa] === Times && Head[Numerator[aa]] === Power &&
					   Head[Denominator[aa]] === Power,
						bb = Last[Denominator[aa]];
						aa = Last[Numerator[aa]];
						If[Head[aa] === Rational && Head[bb] === Rational,
							cc = LCM[Denominator[aa],Denominator[bb]];
							sol = ExpandAll[PowerExpand[First[First[
								Flatten[{sol}]]]^cc] == 
							  	PowerExpand[Last[First[Flatten[{sol}]]]^cc]];
						]
					];
			  		aa = First[First[Flatten[{sol}]]];
					bb = Last[First[Flatten[{sol}]]];
					If[Head[aa] === Power && Head[Last[aa]] === Rational,
						cc = Sign[Numerator[Last[aa]]] Denominator[Last[aa]];
						sol = ExpandAll[PowerExpand[aa^cc] == 
							  PowerExpand[bb^cc]]
					]
			  ];
			  sol = Simplify[sol /. Exp[c_. constant[a_] + b_.] -> 
				constant[a] Exp[b] /.
				Power[constant[a_],b_] -> constant[a] /.
				bb_?(NumberQ && Positive) constant[aa_] -> constant[aa] /.
				bb_?(NumberQ && Negative) constant[aa_] -> -constant[aa]]
		];

		If[!exact,trivialsol=N[trivialsol]];
		If[smethod != "" && sform != "Return" && !numsol &&
		   smethod != "Transform" && trivialsol =!= False,
			If[sol === False,
				sol = trivialsol,
				tmp = sol /. Exp[constant[a_] + b_.] -> constant[a] Exp[b] /.
				  	Power[constant[a_],b_] -> constant[a] /.
				  	bb_?(NumberQ && Positive) constant[aa_] -> constant[aa] /.
				  	bb_?(NumberQ && Negative) constant[aa_] -> -constant[aa];
				Off[Power::infy];
				Off[Power::infty];
				Off[Infinity::indet];
				Off[RowReduce::indet];
				Off[Solve::verif];
				tmp = tmp /. Table[constant[i] -> 0,{i,1,order}] /.
					nrules[Flatten[{y}],Flatten[{yy}]];
				tmp = Flatten[Solve[Flatten[{tmp}],yy]] /. 
						(aa_ -> bb_) -> aa - bb == 0;
				If[!FreeQ[tmp,Solve] || 
				   !FreeQ[tmp,ToRules] || !FreeQ[tmp,Root],
					tmp == {};
					trivialsol = {}
				];
				On[Power::infy];
				On[Power::infty];
				On[Infinity::indet];
				On[RowReduce::indet];
				On[Solve::verif];
				aa = Flatten[{trivialsol}] /. 
					nrules[Flatten[{y}],Flatten[{yy}]] /.
					(bb_ == cc_ -> bb - cc == 0);
				If[!FreeQ[aa,False],
					tmp = {};
					trivialsol = {}
				];
				If[tmp =!= {},
					bb = Position[aa,First[Flatten[{tmp}]]];
					If[bb =!= {},
						trivialsol = Delete[Flatten[{trivialsol}],bb]
					]
				];
				If[singularsolution =!= 0,
					If[Head[singularsolution] === List,
						singularsolution =
							 Join[singularsolution,{Flatten[{trivialsol}]}],
						singularsolution = {singularsolution,trivialsol}
					],
					singularsolution = trivialsol
				]
			  ]
			];

			singularequation = singularsolution;
			If[!sysconvert && 
				singularsolution =!= 0 && singularsolution =!= {},
				singularsolution = Union[Flatten[{singularsolution}]];

If[(ODESingular || smethod == "Clairaut" || smethod == "Lagrange") &&
		FreeQ[singularsolution,Infinity] && FreeQ[singularsolution,Indeterminant], 
			ODEDialoguePrint["Singular solution detected: ",
					Complement[singularsolution /.
						nrules[Flatten[{y}],Flatten[{yy}]] /.
						nrules[Flatten[{yy}],Flatten[{var}]],
								trivialonly /.
						nrules[Flatten[{y}],Flatten[{yy}]] /.
						nrules[Flatten[{yy}],Flatten[{var}]]]];
						ODEDialoguePrint[]

];
				If[Head[sol] === List,
					sol = Join[sol,singularsolution],
					sol = {sol,Sequence @@ singularsolution}
				];
				sol = Union[Flatten[sol] /. 
						nrules[Flatten[{y}],Flatten[{yy}]]]	
		];

		slform = eqform = sol;
		If[smethod != "Laplace" && smethod != "NDSolve", 
			If[smethod != "Transform",
				slform = eqform = sol = sol /. 
					nrules[Flatten[{y}],Flatten[{yy}]] /.
					nrules[Flatten[{yy}],Flatten[{y}]],
				slform = eqform = sol = sol /. 
					nrules[Flatten[{y}],Flatten[{yy}]] /.
					Derivative[n_][yy][t] -> Derivative[n][yy];
					If[!FreeQ[var,t],
						slform = eqform = sol = sol /.
						Derivative[n_][yy] -> Derivative[n][z][t] /.
						nrules[Flatten[{yy}],Flatten[{var}]] /.
						Derivative[n_][z][t] -> Derivative[n][yy][t]
					]
			]
		];
	If[getTF[ODETiming/.{options}/.Options[ODE]],
		timeused = Floor[(AbsoluteTime[]-timeused)*10]/10.0;
		Print["Phase 2 (Singular Solutions) : ",timeused," seconds , sol = ",sol];
		timeused = AbsoluteTime[]
	];

		If[sform === "Return" || smethod == "Transform",
			Return[sol]
		];
		If[sol =!= False && !numsol && skip === False,
			sol = AddConditions[sol,smethod,sform,y,t,var,constant,options]
		]
  ]

FinalOptions[options___] :=
	Module[{eqn,equation,sol,solution,postops,cop,constant,checksol,t,pltopt,
			y,yy,i,j,tmp,a,b,c,d,n,solfun,psol,aeq,F,smethod,sform,tsol,params,
			plotsol,plotsingsol,plotphase,plotfield,plotnum,
			ax,ay,bx,by,superimpose,ytmp,aa,animate,iter,orgfunctionlist,
			externalplots={},crule,tplot,plotstack,suppress,verified=False,
			options0={},options1={},options2={},options3={},options4={},
			numout,guess,degree,plotevolve,evolverate=1,equilibriumpoints,
			equilibriumpointcolor,eigenspaces,eigenspacecolor,crtpts,
			linsys,vect1,vect2,linearizept,eigenplot},

		linearizept = LinearizeAt /. {options} /. Options[ODE];
		eigenspaces = getTF[ShowEigenspaces /. {options} /. Options[ODE]];
		equilibriumpoints = getTF[ShowEquilibriumPoints /. {options} /. Options[ODE]];
		equilibriumpointcolor = EquilibriumPointColor /. {options} /. Options[ODE];
		eigenspacecolor = EigenspaceColor /. {options} /. Options[ODE];

		timeused = AbsoluteTime[];
		tmp = ToString[Form /. {options} /. Options[ODE]];
		smethod = ToString[Method /. {options} /. Options[ODE]];
		If[eqform === Null || tmp === "Return",
			Return[eqform]
		];
		y = ytset;
		yy = yset;
		t = tset;
		equation = eqn = eqform;
		solution = sol = slform;

		sform = ToString[Form /. {options} /. Options[ODE]];
		constant = Constants /. {options} /. Options[ODE];
		postops = PostSolution /. {options} /. Options[ODE];
		numout = getTF[NumericalOutput /. {options} /. Options[ODE]];
		checksol = ToString[CheckSolution /. {options} /. Options[ODE]];
		crule := Flatten[Table[{constant[i] -> ToExpression[StringJoin[
			ToString[constant],ToString[i]]]},{i,1,order}]];
		params = Parameters /. {options} /. Options[ODE];
		guess = ProposedSolution /. {options} /. Options[ODE];
		degree = Degree/.{options}/.Options[ODE];

		If[	guess =!= None ||
			((ToString[$ODECheckSolution] == "ReallyYes" || 
			(ToString[$ODECheckSolution] == "Automatic" &&
			(checksol == "ReallyYes" || 
			 checksol == "ODE`Private`ReallyYes"))) && 
			FreeQ[Cases[{eqn},Integrate[a__,b_]],yy] &&
			smethod != "NDSolve" && exact && FreeQ[{options},Transformation] &&
			!numsol && eqn =!= Null && eqn =!= False && equationform &&
			params === None &&
			FreeQ[eqn,ODEif] && FreeQ[eqn,Solve] && 
			FreeQ[eqn,ToRules] && FreeQ[eqn,Root]) ||
			((ToString[$ODECheckSolution] == "Yes" || 
			(ToString[$ODECheckSolution] == "Automatic" &&
			getTF[CheckSolution /. {options} /. Options[ODE]] === True)) && 
			FreeQ[Cases[{eqn},Integrate[a__,b_]],yy] && equationform &&
			solveeqs && slform =!= False && FreeQ[{options},Transformation] &&
			smethod != "NDSolve" && initconds =!= {} && exact &&
			!seriessol && !numsol && eqn =!= Null && eqn =!= False &&
			params === None &&
			FreeQ[eqn,ODEif] && FreeQ[eqn,Solve] && 
			FreeQ[eqn,ToRules] && FreeQ[eqn,Root]),

			Off[Power::infty];
			Off[Infinity::indet];
			Off[RowReduce::indet];
			tmp = Flatten[{eqn}];
			If[solvedform =!= False,
				solfun = solvedform,
				solfun = Map[MakeForm[#,y,t,constant,"Function"]&,tmp];
		  		If[(!FreeQ[solfun,Solve] || 
					!FreeQ[solfun,ToRules] || !FreeQ[solfun,Root]) && 
				   Length[tmp] == 1 && First[First[tmp]][[0]] === Power &&
				   First[First[tmp]][[1]] === E, 
					solfun = Map[MakeForm[#,y,t,constant,"Function"]&,
						{PowerExpand[Log[First[tmp][[1]]]] == 
						Log[First[tmp][[2]]]}]
				]
			];
			If[solfun =!= {} && Head[solfun] =!= Symbol && 
				FreeQ[solfun,Solve] && 
				FreeQ[solfun,ToRules] && FreeQ[solfun,Root],
				tmp = Map[First[#]-Last[#]&,
					Flatten[Union[{systemyt},{initeqs}]]];
				solfun = Reverse[Union[Flatten[{solfun}]]];
				Off[Power::infy];
				If[numberofeqs == 1,
					tmp =Simplify[Map[Chop,Map[ReplaceAll[tmp,#]&,
						solfun],Infinity]],
					tmp =Simplify[Map[Chop,
						{ReplaceAll[tmp,solfun]},Infinity]]
				];
				tmp = ExpandAll[Map[PowerExpand,tmp,Infinity],
						Trig->True]/.inversetrig;
				If[$VersionNumber <= 2.2,
					tmp = Simplify[tmp],
					tmp = FullSimplify[tmp]
				];
				If[seriessol,
					tmp = Together[tmp /. t^a_ /; a >= degree-1 -> 0]
				];
				On[Power::infy];

				If[MemberQ[Map[Union, tmp],{0}] ||
				   MemberQ[Map[Union, tmp],{0,Indeterminate}],
				 verified = True;
				 ODEDialoguePrint["Solution verified"],
				 ODEDialoguePrint["Solution checked but cannot be completely verified"];
				 ODEDialoguePrint[solfun];
				 ODEDebugPrint[""];
				 ODEDebugPrint["Unresolved conditions are as follows:"];
				 ODEDebugPrint[Select[Map[Union,tmp],!MemberQ[#,{0}]&]];
				 ODEDebugPrint[""];
				 ODEDebugPrint["Corresponding solutions are as follows:"];
				 	tsol = {};
				 	Do[
						If[numberofeqs == 1,
							 ax = (bx == y /. Flatten[solfun][[n]] /. bx -> y),
							 ax = Flatten[nrules[y,(y /. Flatten[solfun])]] /. 
								(a__ -> b_) -> a == b
						];
						AppendTo[tsol,ax],
					    {n,1,Length[tmp]}
					];
					ODEDebugPrint[tsol];
				 	ODEDebugPrint[""]
				];
				tsol = {};
				Do[
					If[Union[tmp[[n]]] === {0} ||
					   Union[tmp[[n]]] === {0,Indeterminate},
						If[numberofeqs == 1,
							ax = (bx == y /. Flatten[solfun][[n]] /. bx -> y),
							ax = Flatten[nrules[y,(y /. Flatten[solfun])]] /. 
								(a__ -> b_) -> a == b
						];
						AppendTo[tsol,ax]
					],
					{n,1,Length[tmp]}
				];
				If[Length[solfun] == Length[tsol],
					If[!(sform == "Equation"    || sform == "LogEquation" ||
		    	   	     sform == "ExpEquation" || sform == "Implicit"),
						eqn = expeqform = sol = Flatten[tsol],
						equationform = False
					],
					eqn = expeqform = sol = Flatten[tsol]
				];
				If[verified && !noresolve && singularsolution === 0 &&
				   (sform == "Equation"    || sform == "Implicit" ||
					sform == "LogEquation" || sform == "ExpEquation"),
					sol = eqn = Flatten[{eqform}]
				];
				If[sform != "Function",
					sol = FixForm[sol,yt,t,constant,sform,equationform]
				]
			];
			If[Flatten[{sol}] === {},sol = trivialsol = slform = False];

			On[Power::infty];
			On[Infinity::indet];
			On[RowReduce::indet]
		];

	If[getTF[ODETiming/.{options}/.Options[ODE]],
		timeused = Floor[(AbsoluteTime[]-timeused)*10]/10.0;
		Print["Phase 4 (Verify Solution)    : ",timeused," seconds , sol = ",sol];
		timeused = AbsoluteTime[]
	];

		If[Head[postops] =!= List,
			postops = {postops}
		];
		Do[
			cop = postops[[i]];
			If[!FreeQ[cop,PowerExpand],
				eqn = Map[PowerExpand,eqn,Infinity] /. 
					Exp[constant[a_]] -> constant[a] /. 
					Power[constant[a_],b_] -> constant[a] /.
					-constant[a_] -> constant[a];
				eqn = Simplify[eqn];
				sol = Map[PowerExpand,sol,Infinity] /. 
					Exp[constant[a_]] -> constant[a] /.
					Power[constant[a_],b_] -> constant[a] /.
					-constant[a_] -> constant[a];
				sol = Map[Simplify,sol,Infinity]
			];
			If[cop =!= None && cop =!= AmplitudePhaseAngle,
				If[!FreeQ[eqn,Equal] && FreeQ[cop,Part],
					eqn = eqn /. Equal[a_,b_] :> Equal[a,cop[b]]
				];
				If[!FreeQ[sol,Equal] && FreeQ[cop,Part],
					sol = sol /. Equal[a_,b_] :> Equal[a,cop[b]]
				];
				If[!FreeQ[sol,Rule] && FreeQ[cop,Part],
					sol = sol /. Rule[a_,b_] :> Rule[a,cop[b]]
				];
				If[FreeQ[sol,Equal] && FreeQ[sol,Rule] && !numsol,
					sol = cop[sol]
				];
(* Enhanced PostSolution options to numerical solutions 072099 *)
				If[numsol,
					sol = Map[cop,sol];
					functionlist = {};
			  		If[sol =!= {} &&
			   			If[numberofeqs == 1,
							AppendTo[functionlist,{yy -> 
							Interpolation[sol,InterpolationOrder->1]}],
							psol = Transpose[Map[Transpose,
							Map[{Table[First[#],
							{Length[Last[#]]}],Last[#]}&,sol]]];
							psol = nrules[Flatten[{yy}],
							Map[Interpolation[#,InterpolationOrder->1]&,psol]];
							AppendTo[functionlist,psol]
			   			],
			  			 sol = Null
			  		],
					eqn = Map[cop,eqn,{2}]
				]
			],
			{i,1,Length[postops]}
		];
(* Added allexact in the following test 041797 *)
		If[(!exact || !allexact || numsol) && smethod != "NDSolve" &&
			FreeQ[postops,Rationalize],								
			sol = Map[N[#,digits]&,sol,Infinity] /. 
				N[E, precision] -> E /. N[Pi,precision] -> Pi;
			sol = sol /. Power[a_,0.5] -> Sqrt[a] /. 
				Power[a_,-0.5] -> 1/Sqrt[a]
		];

		Off[Power::infy];
		Off[Plot::plnr];
		Off[ContourGraphics::ctpnt];
		Off[Infinity::indet];
		Off[RowReduce::indet];
		saveplots = getTF[SavePlots /. {options} /. Options[ODE]];
		superimpose = getTF[SuperimposePlots /. {options} /. Options[ODE]];
		If[superimpose,saveplots=True];
		plotnum = GraphLabel /. {options} /. Options[ODE];
		plotfield = PlotField /. {options} /. Options[ODE];
		plotsol = PlotSolution /. {options} /. Options[ODE];
		plotstack = StackPlotSolution /. {options} /. Options[ODE];
		plotphase = PlotPhase /. {options} /. Options[ODE];
		plotsingsol = PlotSingularSolution /. {options} /. Options[ODE];
		plotevolve = PlotEvolvePhase /. {options} /. Options[ODE];
		evolverate = EvolveRate /. {options} /. Options[ODE];
		suppress = getTF[SuppressAsymptotes /. {options} /. Options[ODE]];
		animate = Animation /. {options} /. Options[ODE];
		If[animate === None,
			iter = {{j,1,1}},
			iter = {Flatten[{animate}]}
		];

		If[plotevolve =!= None,
			plotphase=plotevolve;
			plotevolve=True,
			plotevolve=False
		];
		If[saveplots,$ODEPlotNumber=0];
		If[plotfield =!= None,
			options0 = Rest[plotfield];
			plotfield = First[plotfield];
			If[!MatrixQ[plotfield],
				Message[ODE::badrange];Return[sol]]
		];
		If[plotsol =!= None,
			options1 = Rest[plotsol];
			plotsol = First[plotsol];
			If[!VectorQ[plotsol] && !MatrixQ[plotsol],
				Message[ODE::badrange];Return[sol]];
			If[!FreeQ[eqn,constant && FreeQ[params,constant]],
				Message[ODE::arbitrary];Return[sol]]
		];
		If[plotphase =!= None,
			options2 = Rest[plotphase];
			plotphase = First[plotphase];
			If[!VectorQ[plotphase],
				Message[ODE::badrange];Return[sol]];
			If[!FreeQ[eqn,constant && FreeQ[params,constant]],
				Message[ODE::arbitrary];Return[sol]]
		];
		If[plotsingsol =!= None,
			options3 = Rest[plotsingsol];
			plotsingsol = First[plotsingsol];
			If[!VectorQ[plotsingsol] && !MatrixQ[plotsingsol],
				Message[ODE::badrange];Return[sol]];
			If[!FreeQ[singularequation,constant && FreeQ[params,constant]],
				Message[ODE::arbitrary];Return[sol]]
		];
		If[plotstack =!= None,
			options4 = Rest[plotstack];
			plotstack = First[plotstack];
			If[!VectorQ[plotstack],
				Message[ODE::badrange];Return[sol]];
			If[!FreeQ[eqn,constant && FreeQ[params,constant]],
				Message[ODE::arbitrary];Return[sol]]
		];
	orgfunctionlist = functionlist;
	Do[
		functionlist = Union[orgfunctionlist];
		If[plotok && plotfield =!= None,	
	  		{aeq,yy,t} = ConvertToY[systemyt,y,t];
        	F = getmeq[aeq,t,yy,yy'];
			If[F === False,
				Message[ODE::notfo];Return[sol],
 				F = Last[F]
			];
			$ODEPlotNumber = $ODEPlotNumber + 1;
			If[!saveplots && plotnum =!= None,
				If[plotnum === Automatic,
					ODEDialoguePrint[
						"Plot name = Graph[",$ODEPlotNumber,"]\n"],
					ODEDialoguePrint["Plot name = Graph[", plotnum,"]\n"]
				]
			];
			opts = Join[options0,{options},
				{PlotLabel->"Direction Field"},{DisplayFunction->Identity},
				{Graphics`PlotField`ScaleFunction->(0.2&)}];
(* Removed all conflicts with user variable ScaleFunction 041497 *)
			If[!plotvectorfield,
				plotvectorfield = True;
				Needs["Graphics`PlotField`"]
			];
			If[MatrixQ[plotfield],
				tplot = InternalPVFPlot[{1,Evaluate[Chop[F]]},
				  Evaluate[First[plotfield]],
				  Evaluate[Last[plotfield]/.yy[t] -> yy],
				  Evaluate[FilterOptions[InternalPVFPlot,opts]]]
			];
			If[saveplots,
				Graph[$ODEPlotNumber] = tplot,
				Graph[$ODEPlotNumber] =
					 Show[tplot,DisplayFunction->$DisplayFunction]
			];
			AppendTo[externalplots,$ODEPlotNumber]
		];
		If[sol =!= False && plotok && plotsol =!= None && smethod != "Trivial", 
			If[!numsol && !seriessol && functionlist === {},
				If[params =!= None,	
					psol = Table[eqn /. crule,
						Evaluate[Apply[Sequence,(params /.crule)]]],
					psol = eqn
				];
				Off[Solve::svars];
				psol = psol /. nrules[Flatten[{y}],Flatten[{yy}]];
				psol = psol /. nrules[Flatten[{yy}],Flatten[{y}]];
				functionlist = Map[Solve[#,y]&,Flatten[{psol}]];

				If[functionlist == {{}} && !FreeQ[psol,Derivative],
					psol = psol /. Derivative[a_][b_][c_] -> b;
					functionlist = Map[Solve[#,y]&,Flatten[{psol}]]
				];
				On[Solve::svars];
				If[FreeQ[functionlist,Solve] && 
					FreeQ[functionlist,ToRules] && FreeQ[functionlist,Root],
					functionlist = functionlist /. (a_[t_] -> b_) -> 
						a -> Function[t,b],
					functionlist = eqn
				]
			];
			$ODEPlotNumber = $ODEPlotNumber + 1;
			If[!saveplots && plotnum =!= None,
				If[plotnum === Automatic,
					ODEDialoguePrint[
						"Plot name = Graph[",$ODEPlotNumber,"]\n"],
					ODEDialoguePrint["Plot name = Graph[", plotnum,"]\n"]
				]
			];
			opts = Join[options1,{options},
					{PlotLabel->StringJoin["Solution by ",smethod]},
					{DisplayFunction->Identity}];
			If[!numsol && !seriessol && MatrixQ[plotsol],
				If[!implicitplot,
					implicitplot = True;
					Needs["Graphics`ImplicitPlot`"]
				];
			 	tplot = InternalImpPlot[Evaluate[Chop[
					ExpandAll[Flatten[psol /. yy[t] -> yy]]]],
				  Evaluate[First[plotsol]],Evaluate[Last[plotsol]],
				  AspectRatio->Automatic,
				  Evaluate[FilterOptions[InternalImpPlot,opts]]]
			];
			If[Head[functionlist] =!= Equal && VectorQ[plotsol] &&
			   !FreeQ[functionlist,Rule],
(* Added ordering 050199 *)
				  If[MatrixQ[ordering] && Last[Dimensions[ordering]] == First[Dimensions[Flatten[{y}]]],
						y = ordering.Flatten[{y}]
				  ];
				  If[!sysconvert,
					tplot = Plot[Evaluate[Chop[ExpandAll[Flatten[{y} /.
						functionlist]]] /. ODEif[a_,b_,c___,d___] ->
						 If[a,b,c,d] /. Integrate -> NIntegrate],
						Evaluate[plotsol],Evaluate[FilterOptions[Plot,opts]]],
				  	tplot = Plot[Evaluate[Chop[ExpandAll[Flatten[{First[y]} /.
						functionlist]]] /. ODEif[a_,b_,c___,d___] ->
						 If[a,b,c,d] /. Integrate -> NIntegrate],
						Evaluate[plotsol],Evaluate[FilterOptions[Plot,opts]]]
				  ]
(* Added ordering 050199 *)
				  If[MatrixQ[ordering] && Last[Dimensions[ordering]] == First[Dimensions[Flatten[{y}]]],
						y = ordering.Flatten[{y}]
				  ];
			];
(*
			If[Head[functionlist] === List && VectorQ[plotsol] &&
				FreeQ[functionlist,Solve] && !FreeQ[functionlist,Equal],
				  tplot = Plot[Evaluate[Chop[ExpandAll[Flatten[
					Map[Apply[Subtract,#]&,functionlist]]]] /.
					 ODEif[a_,b_,c___,d___] ->
					If[a,b,c,d] /. Integrate -> NIntegrate],
					Evaluate[plotsol],Evaluate[FilterOptions[Plot,opts]]]
			];
*)
			If[suppress,
				tplot = tplot //. {ax___,{a_,b_},{c_,d_},ay___} /; 
					Negative[Chop[b] Chop[d]] &&
					 Abs[(d-b)/(c-a)] > 2(MaxBend /. Options[Plot]) -> 
						{ax,Null,Null,ay}
			];
			If[saveplots,
				Graph[$ODEPlotNumber] = tplot,
				Graph[$ODEPlotNumber] =
					 Show[tplot,DisplayFunction->$DisplayFunction]
			];
			AppendTo[externalplots,$ODEPlotNumber]
		];
		If[sol =!= False && plotok && 
			plotstack =!= None && smethod != "Trivial", 
			If[!numsol && !seriessol && functionlist === {},
				If[params =!= None,	
					psol = Table[eqn/.crule,
						Evaluate[Apply[Sequence,(params /.crule)]]],
					psol = eqn
				];
				Off[Solve::svars];
				psol = psol /. nrules[Flatten[{y}],Flatten[{yy}]];
				psol = psol /. nrules[Flatten[{yy}],Flatten[{y}]];
				functionlist = Map[Solve[#,y]&,Flatten[{psol}]];
				If[functionlist == {{}} && !FreeQ[psol,Derivative],
					psol = psol /. Derivative[a_][b_][c_] -> b;
					functionlist = Map[Solve[#,y]&,Flatten[{psol}]]
				];
				On[Solve::svars];
				If[FreeQ[functionlist,Solve] && 
					FreeQ[functionlist,ToRules] && FreeQ[functionlist,Root],
					functionlist = functionlist /. (a_[t_] -> b_) -> 
						a -> Function[t,b],
					functionlist = eqn
				]
			];	
			$ODEPlotNumber = $ODEPlotNumber + 1;
			If[!saveplots && plotnum =!= None,
				If[plotnum === Automatic,
					ODEDialoguePrint[
						"Plot name = Graph[",$ODEPlotNumber,"]\n"],
					ODEDialoguePrint["Plot name = Graph[", plotnum,"]\n"]
				]
			];
			opts = Join[options4,{options},
					{PlotLabel->StringJoin["Solution by ",smethod]},
					{DisplayFunction->Identity}];
			If[Head[functionlist] =!= Equal && VectorQ[plotstack] &&
				!FreeQ[functionlist,Rule],
				If[!stackplot,
					stackplot = True;
					Needs["Graphics`Graphics3D`"]
				];
				If[!sysconvert,
					tplot = Map[Plot[#,Evaluate[plotstack],
						Evaluate[FilterOptions[Plot,opts]],
							DisplayFunction->Identity]&,
							Evaluate[Chop[ExpandAll[Flatten[{y} /.
								 functionlist]]] /. 
							ODEif[a_,b_,c___,d___] -> If[a,b,c,d] /. 
								Integrate -> NIntegrate]],
					tplot = Map[Plot[#,Evaluate[plotstack],
						Evaluate[FilterOptions[Plot,opts]],
							DisplayFunction->Identity]&,
							Evaluate[Chop[ExpandAll[Flatten[{First[y]} /. 
								functionlist]]] /.
							 ODEif[a_,b_,c___,d___] -> If[a,b,c,d] /. 
								Integrate -> NIntegrate]]
				];
				If[suppress,
					tplot = tplot //. {ax___,{a_,b_},{c_,d_},ay___} /; 
						Negative[Chop[b] Chop[d]] &&
					 	Abs[(d-b)/(c-a)] > 2(MaxBend /. Options[Plot]) -> 
						{ax,Null,Null,ay}
				];
				opts = Join[options4,{options},
					{PlotLabel->StringJoin["Solution by ",smethod]},
					{DisplayFunction->$DisplayFunction}];
				If[saveplots,
					Graph[$ODEPlotNumber] = InternalStackPlot[tplot,
						Evaluate[FilterOptions[Graphics3D,opts]]],
					Graph[$ODEPlotNumber] = Show[InternalStackPlot[tplot],
						Evaluate[FilterOptions[Graphics3D,opts]]]
				]
			];
			AppendTo[externalplots,$ODEPlotNumber]
		];
		If[singularsolution =!= 0 && singularsolution =!= {} &&
			plotok && plotsingsol =!= None,	
			If[!numsol && !seriessol,
				If[params =!= None,	
					psol = Table[singularequation/.crule,
						Evaluate[Apply[Sequence,(params /.crule)]]],
					psol = singularequation
				];
				Off[Solve::svars];
				psol = psol /. nrules[Flatten[{y}],Flatten[{yy}]];
				psol = psol /. nrules[Flatten[{yy}],Flatten[{y}]];
				functionlist = Map[Solve[#,y]&,Flatten[{psol}]];
				On[Solve::svars];
				If[FreeQ[functionlist,Solve] && 
					FreeQ[functionlist,ToRules] && FreeQ[functionlist,Root],
					functionlist = functionlist /. 
						(a_[t_] -> b_) ->  a -> Function[t,b],
					functionlist = singularequation
				]
			];
			$ODEPlotNumber = $ODEPlotNumber + 1;
			If[!saveplots && plotnum =!= None,
				If[plotnum === Automatic,
					ODEDialoguePrint[
						"Plot name = Graph[",$ODEPlotNumber,"]\n"],
					ODEDialoguePrint["Plot name = Graph[", plotnum,"]\n"]
				]
			];
			opts = Join[options3,{options},
						{PlotLabel->"Singular Solution"},
						{DisplayFunction->Identity}];
			If[numsol,
				tplot = ListPlot[sol,
					Evaluate[FilterOptions[ListPlot,opts]],PlotJoined->True]
			];
			If[!numsol && MatrixQ[plotsingsol],
				If[!implicitplot,
					implicitplot = True;
					Needs["Graphics`ImplicitPlot`"]
				];
				tplot = InternalImpPlot[Evaluate[Flatten[psol
				  /. yy[t] -> yy]],
				  Evaluate[First[plotsingsol]],Evaluate[Last[plotsingsol]],
				  AspectRatio->Automatic,
				  Evaluate[FilterOptions[InternalImpPlot,opts]]]
			];
			If[!numsol && Head[functionlist] =!= Equal && 
				VectorQ[plotsingsol] && !FreeQ[functionlist,Rule],
					tplot = Plot[Evaluate[Chop[ExpandAll[Flatten[{y} /.
						functionlist]]] /. ODEif[a_,b_,c___,d___] ->
						 If[a,b,c,d] /. Integrate -> NIntegrate],
						Evaluate[plotsingsol],
						Evaluate[FilterOptions[Plot,opts]]]
			];
			If[suppress,
				tplot = tplot //. {ax___,{a_,b_},{c_,d_},ay___} /; 
					Negative[Chop[b] Chop[d]] &&
					 Abs[(d-b)/(c-a)] > 2(MaxBend /. Options[Plot]) -> 
						{ax,Null,Null,ay}
			];
			If[saveplots,
				Graph[$ODEPlotNumber] = tplot,   	
				Graph[$ODEPlotNumber] = 
					Show[tplot,DisplayFunction->$DisplayFunction]
			];
			AppendTo[externalplots,$ODEPlotNumber]
		];
		If[(singularsolution === 0 || singularsolution === {}) && 
			plotsingsol =!= None,	
			Message[ODE::nosing]
		];
		If[sol =!= False && plotok && plotphase =!= None,	
			If[!numsol && !seriessol,
				If[params =!= None,	
					psol = Table[Evaluate[Flatten[eqn/.crule]],
						Evaluate[Apply[Sequence,(params /.crule)]]],
					psol = eqn
				];
				Off[Solve::svars];
				psol = psol /. nrules[Flatten[{y}],Flatten[{yy}]];
				psol = psol /. nrules[Flatten[{yy}],Flatten[{y}]];
				functionlist = Map[Solve[#,y]&,Flatten[{psol}]];
				On[Solve::svars];
				If[FreeQ[functionlist,Solve] && 
					FreeQ[functionlist,ToRules] && FreeQ[functionlist,Root],
					functionlist = Flatten[functionlist /. 
						(a_[t_] -> b_) ->  a -> Function[t,b]];
					functionlist = Partition[functionlist,Length[y]],
					functionlist = eqn
				]
			];
			$ODEPlotNumber = $ODEPlotNumber + 1;
			If[!saveplots && plotnum =!= None,
				If[plotnum === Automatic,
					ODEDialoguePrint[
						"Plot name = Graph[",$ODEPlotNumber,"]\n"],
					ODEDialoguePrint["Plot name = Graph[", plotnum,"]\n"]
				]
			];
			opts = Join[options2,{options},
					{AspectRatio->Automatic},
					{PlotLabel->StringJoin["Phase Portrait by ",smethod]},
					{DisplayFunction->Identity}];

(* Added equilibrium points and eigenspace options 101298 *)
			If[equilibriumpoints && !eigenspaces,
				crtpts = CriticalPoints[systemyt,ytset,t];
				opts = Join[opts,{Epilog->{AbsolutePointSize[10],
						equilibriumpointcolor,Point/@crtpts}}]
			];
			If[eigenspaces,
				Off[ParametricPlot::ppcom];
				If[linearizept =!= None,
					crtpts = {linearizept},
 					crtpts = CriticalPoints[systemyt,ytset,t]
				];
				linsys = LinearizeAt[systemyt, ytset,t,crtpts[[1]]];
				{vect1,vect2} = 
					Eigenvectors[GetMatrices[systemyt,ytset,t][[1,1]]];
				If[FreeQ[vect1,I],
					eigenplot = ParametricPlot[{t vect1,t vect2},
						{t,-1000,1000},
						DisplayFunction->Identity,Axes->False,
						AspectRatio->1,
						PlotStyle->{{AbsoluteThickness[2],eigenspacecolor}}];
					If[equilibriumpoints,
						opts = Join[opts,{Axes->False,
								Epilog->{{AbsolutePointSize[10],
								equilibriumpointcolor,Point[{0,0}]},
								{First[eigenplot]}}}],
						opts = Join[opts,{Axes->False,
								Epilog->{First[eigenplot]}}]
					],
					If[equilibriumpoints,
						opts = Join[opts,{Axes->False,
								Epilog->{AbsolutePointSize[10],
								equilibriumpointcolor,Point[{0,0}]}}]
					];
					eigenplot = {}
				]
			];

			If[Head[functionlist] =!= Equal && VectorQ[plotphase] &&
				!FreeQ[functionlist,Rule],
				If[Length[Flatten[{y}]] == 1,ytmp = {y,D[y,t]},ytmp=y];
				If[Length[ytmp] == 2,
					If[plotevolve,
					   tplot = ParametricPlot3D[Evaluate[Chop[
					    ExpandAll[Flatten[{ytmp,t evolverate}] /.
						functionlist]] /. ODEif[a_,b_,c___,d___] -> 
						If[a,b,c,d] /. Integrate -> NIntegrate],
					 	Evaluate[plotphase],
					 	Evaluate[FilterOptions[ParametricPlot3D,opts]]],
					    tplot = ParametricPlot[Evaluate[Chop[ExpandAll[ytmp /. 
					    functionlist]]/.ODEif[a_,b_,c___,d___]->If[a,b,c,d] /. 
						Integrate -> NIntegrate],
					 	Evaluate[plotphase],
					 	Evaluate[FilterOptions[ParametricPlot,opts]]]
					]
				];
				If[Length[ytmp] == 3,
					tplot = ParametricPlot3D[Evaluate[Chop[ExpandAll[ytmp /.
					 functionlist]]/. ODEif[a_,b_,c___,d___] -> If[a,b,c,d] /. 
						Integrate -> NIntegrate],
					 Evaluate[plotphase],
					 Evaluate[FilterOptions[ParametricPlot3D,opts]]]
				]
			];
			If[saveplots,
				Graph[$ODEPlotNumber] = tplot,
				Graph[$ODEPlotNumber] =
					 Show[tplot,DisplayFunction->$DisplayFunction]
			];
			AppendTo[externalplots,$ODEPlotNumber]
		];

		If[saveplots && !superimpose &&  externalplots =!= {},
			Map[Display[StringJoin["ODEplot",ToString[#],".mma"],
				Graph[#]]&,externalplots]
		];
		If[superimpose && externalplots =!= {},
			Show[Map[Graph[#]&,externalplots],
				DisplayFunction->$DisplayFunction];
		];

		On[Plot::plnr];
		On[Power::infy];
		On[ContourGraphics::ctpnt];
		On[Infinity::indet];
		On[RowReduce::indet];
		If[plotnum =!= Automatic,
			Graph[plotnum] = Graph[$ODEPlotNumber]
		],
		Evaluate[Apply[Sequence,(iter /.crule)]]
	];

		If[iter =!= {{j,1,1}},
			BuildButton["tag"<>ToString[$ModuleNumber]]
		];	
		If[slform === False,
			Return[False]
		];
		If[numsol && !numout,
			Return[Null]
		];

		If[getTF[ODETiming/.{options}/.Options[ODE]],
			timeused = Floor[(AbsoluteTime[]-timeused)*10]/10.0;
			Print["Phase 5 (Plotting)           : ",timeused," seconds , sol = ",sol];
			timeused = AbsoluteTime[]
		];

		If[!sysconvert && FreeQ[{options},Transformation] ,
			sol = sol /. nrules[Flatten[{y}],Flatten[{yy}]] /.
				nrules[Flatten[{yy}],Flatten[{yvars}]];
			eqn = eqn /. nrules[Flatten[{y}],Flatten[{yy}]] /.
				nrules[Flatten[{yy}],Flatten[{yvars}]]
		];
		If[sform == "LogEquation" && FreeQ[sol,Integrate],
			sol = Flatten[{eqn}][[1]];
			sol = Simplify[PowerExpand[Log[First[sol]]] ==
				PowerExpand[Log[Last[sol]]]]
		];
		If[sform == "ExpEquation" && FreeQ[sol,Integrate],
			sol = Flatten[{eqn}][[1]];
			sol = PowerExpand[Simplify[ExpandAll[Exp[First[sol]]] ==
				ExpandAll[Exp[Last[sol]]]]]
		];
		If[linear && exact && !numsol && !seriessol &&
			smethod =!= "TableLookup"      && 
			FreeQ[sol,Integrate] 	       && 
		    First[postops] === None,
			sol = ExpandAll[sol];
			If[!FreeQ[sol,constant],
				sol = Map[Collect[#,
				Flatten[Table[ToExpression[StringJoin[
				ToString[constant],"[",ToString[i],"]"]],
				{i,1,order numberofeqs}]]]&,sol,Infinity]
			]
		];
		If[seriessol,
			If[expansionpt != 0 && First[postops] === None,
				sol = Map[{yvars ==
					Normal[Series[Last[First[#]],{t,expansionpt,
					Exponent[Last[First[#]],t]}]]}&,{Flatten[{sol}]}]
			];
			sol = FixForm[sol,yvars,t,constant,sform,True]
		];
		sol = sol /. constant[a_] -> constant[Floor[a]];
		sol = sol /. {0. -> 0 , 1. -> 1, -1. -> -1};
		sol = sol /. Complex[0.,a_] -> Complex[0,a];
		sol = sol /. Complex[b_,0.] -> b;
		sol = sol /. Complex[0,1.] -> Complex[0,1];
		If[sol =!= False && smethod != "Clairaut" && 
			smethod != "Lagrange" && !numsol && !parasol && !seriessol && 
			Length[Cases[First[Flatten[{sol}]],constant[n_]->n,Infinity]] == 1,
			  sol = Simplify[sol /. Exp[c_. constant[a_] + b_.] -> 
				constant[a] Exp[b] /.
				Power[constant[a_],b_] -> constant[a] /.
				bb_?(NumberQ[N[#]]&) constant[aa_] -> constant[aa]]
		];
		If[FreeQ[sol,Solve] && FreeQ[sol,ToRules] && FreeQ[sol,Root] &&
			FreeQ[sol,DSolve] && (smethod == "NDSolve" || !numsol) && 
			sform == "Function" && expeqform =!= 0,
			sol = Partition[Flatten[{expeqform}],Length[Flatten[{yset}]]] /.
				nrules[Flatten[{y}],Flatten[{yy}]];
			sol = sol /. nrules[Flatten[{yy}],Flatten[{y}]];
			sol = sol /. (a_[t_] == b_) ->  a -> Function[t,b]
		];
		If[!numsol,
			sol = sol /. a_[t][b_] /; FreeQ[b,yy] -> a[b];
			sol = sol /. a_[b_][c_] /; NumberQ[b] -> a[Floor[b]][c];
			sol = sol /. Derivative[n_][a_[b_]][c_] /; 
				NumberQ[b] -> Derivative[n][a[Floor[b]]][c];
			sol = sol /. Derivative[n_][a_[t]][b_] -> Derivative[n][a][b];
   			sol = sol /. Log[Rational[1,a_?(FreeQ[#,I]&)]] -> -Log[a];
			sol = sol /. ODEif[a_,b_,c___,d___] -> HoldForm[If[a,b,c,d]]
		];
		If[getTF[ODETiming/.{options}/.Options[ODE]],
			timeused = Floor[(AbsoluteTime[]-timeused)*10]/10.0;
			Print["Phase 6 (Generate Final Form): ",timeused," seconds , sol = ",sol];
			timeused = AbsoluteTime[]
		];
 (* Added ordering 050199 *)
	  	If[(sform == "Rule" || sform == "Function") && MatrixQ[ordering] && MatrixQ[sol[[1]]] && FreeQ[{options},Transformation] && 
			Last[Dimensions[ordering]] == First[Dimensions[sol[[1]]]],
				sol = {ordering.sol[[1]]},
				If[MatrixQ[ordering] && MatrixQ[sol] && Last[Dimensions[ordering]] == First[Dimensions[sol]],
					sol = ordering.sol
				]
	  	];
		sol
	]

ConvertToY[eqs_,y_,t_] :=
	Module[{yy,yt,aa,bb,cc,dd,n,tmp,aeq,eq},
		yy = y /. aa_[t] -> aa;
		If[Head[y] === List,
			yt  = Through[yy[t]],
			yt = yy[t]
		];
      	delt = ToExpression[StringJoin["d",ToString[t]]];
      	dely = ToExpression[StringJoin["d",ToString[yy]]];
		dels = !FreeQ[eqs,delt] || !FreeQ[eqs,dely];
		If[Head[eqs] =!= Equal && Head[eqs] =!= List, 
			tmp = Flatten[{eqs == 0}],
			tmp = Flatten[{eqs}]
		];
		tmp = tmp /. {delt -> 1 , dely -> yy'[t]};
		aeq = Cases[tmp,aa_[bb_] == cc_ /; NumberQ[N[bb]]];
		eq = Complement[tmp,aeq] /.
			nrules[Flatten[{yt}],Flatten[{yy}]] /.
			Derivative[n_][aa_][t] -> Derivative[n][aa];
		If[dels,
			eq = First[First[eq]]-Last[First[eq]] /. y' ->dely/delt;
			eq = {Expand[delt eq] == 0};
		];
		{eq,yy,t}
	]

ConvertToYofT[eqs_,y_,t_] :=
	Module[{yy,yt,aa,bb,cc,dd,n,eq},
		{eq,yy,t} = ConvertToY[eqs,y,t];
		If[Head[yy] === List,
			yt  = Through[yy[t]],
			yt = yy[t]
		];
		eq = eq /.
			Derivative[n_][aa_] -> bb[aa,n] /. 
			nrules[Flatten[{yy}],Flatten[{yt}]] /.
			bb[cc_[dd_],n_] -> Derivative[n][cc][dd];
		{eq,yt,t}
	]

FixForm[eqn_,var_,t_,const_,sform_,equationform_] :=
	Module[{sol,eqs,a,b,tt=t,tmp},
		sol = eqs = Flatten[{eqn /. And -> List}];
		If[linear && !numsol && !seriessol && FreeQ[sol,Integrate],
			sol = eqs = ExpandAll[sol]
		];
		If[linear && !numsol && !FreeQ[sol,const] && 
			FreeQ[sol,Integrate],
			sol = eqs = Map[Collect[#,
			Flatten[Union[{Log[t-expansionpt]},Table[ToExpression[StringJoin[
			ToString[const],"[",ToString[i],"]"]],
			{i,1,order numberofeqs}]]]]&,sol,Infinity]
		];
(* Added conditional Simplify 041497 *)
		If[equationform && sform == "Rule",
			sol = Partition[eqs,Length[Flatten[{var}]]] /. 
				(a_ == b_) ->  a -> b
		];
		If[equationform && sform == "Explicit",
			sol = eqs /. (a_ == b_) -> b
		];
		If[equationform && sform == "Function",
			sol = eqs /. (a_[tt_] == b_) -> a -> Function[tt,b]
		];
		If[sform == "Implicit" && !FreeQ[eqs,const] && initconds === {},
			If[Length[eqs] == 1,
				sol = Flatten[Map[Solve[#,const[1]]&,eqs]];
				If[FreeQ[sol,Solve] && FreeQ[sol,ToRules] && FreeQ[sol,Root],
					sol = Flatten[{sol}] /. (a_ -> b_) ->  b == a,
					sol = eqs /. (a_ -> b_) ->  a - b == 0
				],
				sol = eqs /. (a_ -> b_) ->  a - b == 0
			]	
		];
		If[sform == "Implicit" && (FreeQ[eqs,const] || initconds =!= {}),
			sol = eqs /. (a_ == b_) -> a - b == 0
		];
		If[!numsol && !seriessol && FreeQ[sol,Integrate],
			sol = eqs = Simplify[sol];
		];
		If[(sform == "Explicit"    || sform == "Implicit"    || 
			sform == "Equation"    || sform == "LogEquation" ||
		    sform == "ExpEquation" || !equationform) && 
			Length[sol] == 1,
	  			sol = First[sol]
		];
		sol /. N[E, precision] -> E /. N[Pi,precision] -> Pi
	]

MakeForm[eqn_,var_,t_,const_,sform_] :=
	Module[{sol,eqs,a,b,tt=t},
		Off[Power::infy];
		Off[Solve::svars];
		If[sform == "Implicit" && !FreeQ[eqn,const],
			sol = Simplify[Map[Solve[#,const[1]]&,Flatten[{eqn}]]],
			sol = Simplify[Map[Solve[#,var]&,Flatten[{eqn}]]]
		];
		On[Power::infy];
		On[Solve::svars];
		If[FreeQ[sol,Solve] && FreeQ[sol,ToRules] && FreeQ[sol,Root],
			eqs = Flatten[Union[sol]] /. (a_ -> b_) ->  a == b,
			Return[sol]
		];
		sol = FixForm[eqs,var,t,const,sform,True]
	]

multsolve[F_,solver_][t_,y_] :=
	Module[{Gs},
		Gs = Map[solver,Map[Function[{t,y},#]&,F]];
		Union[Flatten[Map[If[!FreeQ[#,Null],
			Delete[Gs,Flatten[Position[Gs,#]]],#]&,Gs]]]
	]

(*****************************************************************************)

NewMethodQ[eq_,y_,t_] := False
NewMethod[eq_,y_,t_,C_] := False
NewNumericalMethod[f_,{t0_,Y0_},h_,steps_][t_,y_] := {}

(*****************************************************************************)

Adjoint[eq_,y_,t_,w_] :=
	Module[{c,d},
		If[LinearQ[eq,y,t],
			c = w[t] Rest[GetCoefficients[eq,y,t]];
			d = Simplify[Apply[Plus,MapThread[((-1)^#2 D[#1,{t,#2}])&,
				{c,Range[0,Length[c]-1]}]]];
			c = Rest[GetCoefficients[d == 0,w[t],t]];
			d = Table[D[w[t],{t,n}],{n,0,Length[c]-1}];
			c.d		
		]
	]

AlmostLinearQ[r_,b_][t_,y_] :=
		If[D[b[y],y] =!= 0 && r[t,y] =!= 0,
			FreeQ[D[b[y],y]/r[t,y],y],
			False
		]

AlmostLinear[r_,b_,p_,q_,const_Symbol][t_,y_] :=
	Module[{f,g},
		If[AlmostLinearQ[r,b][t,y],
			f = Function[t,p[t] D[b[y],y]/r[t,y]];
			g = Function[t,q[t] D[b[y],y]/r[t,y]];
			b[y] == FirstOrderLinear[1&,f,g, const][t],
			Print["This equation is not almost linear."]
		]
	]

AlmostLinear[eq_,y_,t_,const_Symbol] :=
	Module[{eqt,yy,tt,r,p,q,F,f,b,u,v},
		{eqt,yy,tt} = ConvertToY[ExpandAll[eq],y,t];
		r[u_,v_] = Coefficient[First[First[eqt]]-Last[First[eqt]],yy'] /.
			{u -> tt , v -> yy};
		F = getmeq[eqt,tt,yy,yy'];
		If[F =!= False,
			F = Last[F]
		];
		F = ExpandAll[F r[tt,yy]];
		If[Head[F] === Plus,
			q[u_] = Select[F,FreeQ[#,yy]&] /. {u -> tt , v -> yy};
			F = F - Select[F,FreeQ[#,yy]&],
			q[u_] = 0
		];
		eqt = Separate[Function[{tt,yy},-F]][tt,yy];
		If[Head[eqt] === List,
			{p[u_],b[v_]} = eqt /. {u -> tt , v -> yy};
			Return[AlmostLinear[r,b,p,q,const][tt,yy]]
		]
	]

AlmostLinearQ[eq_,y_,t_] :=
	Module[{rhs,eqt,yy,tt,r,p,F,f,b,u,v},
		{eqt,yy,tt} = ConvertToY[ExpandAll[eq],y,t];
		r[u_,v_] = Coefficient[First[First[eqt]]-Last[First[eqt]],yy'] /.
			{u -> tt , v -> yy};
		F = getmeq[eqt,tt,yy,yy'];
		If[F =!= False,
			F = Last[F]
		];
		F = ExpandAll[F r[tt,yy]];
		If[Head[F] === Plus,
			F = F - Select[F,FreeQ[#,yy]&]
		];
		eqt = Separate[Function[{tt,yy},-F]][tt,yy];
		If[Head[eqt] === List,
			{p[u_],b[v_]} = eqt /. {u -> tt , v -> yy};
			Return[AlmostLinearQ[r,b][t,yy]]
		];
		False
	]

FirstOrderHomogeneousQ[f_][t_,y_] :=
    Module[{s,tmp1,tmp2},
		tmp1 = PowerExpand[Map[Factor,f[t,y],Infinity]];
		tmp2 = PowerExpand[Map[Factor,f[s t,s y],Infinity]];
        Simplify[tmp1] === Simplify[tmp2]
    ]

FirstOrderHomogeneousQ[m_,n_][t_,y_] :=
    Module[{s,tmp1,tmp2},
		tmp1 = PowerExpand[Map[Factor,m[s t,s y],Infinity]];
		tmp2 = PowerExpand[Map[Factor,n[s t,s y],Infinity]];
        Simplify[ExpandAll[(tmp1 n[t,y])/(tmp2 m[t,y])]] === 1
    ]

FirstOrderHomogeneous[f_,const_Symbol][t_,y_] :=
	Module[{z,tmp},
		If[FirstOrderHomogeneousQ[f][t,y],
			tmp = Together[f[t,y] /. y -> z t];
			tmp = PowerExpand[Map[Factor,tmp,Infinity]];
			Factor[PowerExpand[Exp[Integrate[1/(tmp - z),z] /.
			  z -> y/t]]] == t const,
			Print[y,"'[",t,"] = ",f[t,y],
				" is not homogeneous."]
		]
	]

FirstOrderHomogeneous[m_,n_,const_Symbol][t_,y_] :=
	Module[{z,tmp},
		If[FirstOrderHomogeneousQ[m,n][t,y],
			tmp = Together[-n[t,y]/(m[t,y] + z n[t,y]) /.
			  y -> z t ];
			tmp = PowerExpand[Map[Factor,tmp,Infinity]];
			Factor[PowerExpand[Exp[Integrate[tmp,z] /. z -> y/t]]] == 
			  t const,
			Print["(",m[t,y],") d",t," + (",n[t,y],") d",y,
			  " = 0 is not homogeneous."]
		]
]

GeneralizedHomogeneous[f_,const_Symbol][t_,y_] :=
        Module[{k,tmp},
			If[D[t f[t,y]/y,y] === 0,Return[]];	
            k = Simplify[t D[t f[t,y]/y,t]/(y D[t f[t,y]/y,y])];
            If[!FreeQ[k,t] || !FreeQ[k,y],
               Print[y,"'[",t,"] = ",f[t,y]," is not a homogeneous equation."],
			   tmp = PowerExpand[Map[Factor,(y (k + t f[t,y]/y /. 
					y -> y/t^k)),Infinity]];
               tmp = Integrate[1/tmp,y];
               Factor[PowerExpand[Exp[tmp /. y -> y t^k]]] == t const
            ]
        ]

GeneralizedHomogeneousQ[f_][t_,y_] :=
	Module[{k},
		If[D[t f[t,y]/y,y] === 0,Return[False]];	
		k = Simplify[t D[t f[t,y]/y,t]/(y D[t f[t,y]/y,y])];
		FreeQ[k,t] && FreeQ[k,y]
	]

IntegratingFactor[m_,n_,const_Symbol][t_,y_] :=
    Module[{sol},
		sol = IntegratingFactor1[m,n,const][t,y];
		If[sol === Null,
			sol = IntegratingFactor2[m,n,const][t,y]
		];
		If[sol === Null,
			sol = IntegratingFactor3[m,n,const][t,y]
		];
		If[sol === Null,
			sol = IntegratingFactor4[m,n,const][t,y]
		];
		If[sol === Null,
			sol = IntegratingFactor5[m,n,const][t,y]
		];
		If[sol === Null,
			sol = IntegratingFactor6[m,n,const][t,y]
		];
		If[sol === Null,
			sol = IntegratingFactor7[m,n,const][t,y]
		];
		If[sol === Null              &&
		   PolynomialQ[m[t,y],{t,y}] &&
		   PolynomialQ[n[t,y],{t,y}],
				sol = IntegratingFactor8[m,n,const][t,y]
		];
		If[!(usermethod === Automatic || usermethod === ALLSymbolic ||
			usermethod === ReallyAll) && 
			$ODETracex && $ODEDialogx && sol === Null,
       		Print["No integrating factor found for (",m[t,y],") d",t,
                " + (",n[t,y],") d",y," = 0."]
		];
		sol
    ]

IntegratingFactor1[m_,n_,const_Symbol][t_,y_] :=
    Module[{s,u,mm,nn,tt=t,yy=y},
        If[Together[ExpandAll[D[(D[m[t,y],y] - D[n[t,y],t])/n[t,y],y]]] === 0,
            u = Simplify[Exp[Integrate[
				Simplify[(D[m[t,y],y] - D[n[t,y],t])/n[t,y]],t]]];
            mm[tt_,yy_] = ExpandAll[u m[t,y]];
            nn[tt_,yy_] = ExpandAll[u n[t,y]];
			If[FirstOrderExactQ[mm,nn][t,y],
				ODEDialoguePrint["Integrating factor ",mu," = ",mu,"[",t,"] = ",u];
           		Return[FirstOrderExact[mm,nn,const][t,y]]
			]
        ]
	]

IntegratingFactor2[m_,n_,const_Symbol][t_,y_] :=
    Module[{s,u,mm,nn,tt=t,yy=y},
        If[Together[ExpandAll[D[(D[n[t,y],t] - D[m[t,y],y])/m[t,y],t]]] === 0,
            u = Simplify[Exp[Integrate[
				Simplify[(D[n[t,y],t] - D[m[t,y],y])/m[t,y]],y]]];
            mm[tt_,yy_] = ExpandAll[u m[t,y]];
            nn[tt_,yy_] = ExpandAll[u n[t,y]];
			If[FirstOrderExactQ[mm,nn][t,y],
				ODEDialoguePrint["Integrating factor ",mu," = ",mu,"[",y,"] = ",u];
           		Return[FirstOrderExact[mm,nn,const][t,y]]
			]
        ]
	]

IntegratingFactor3[m_,n_,const_Symbol][t_,y_] :=
    Module[{s,u,mm,nn,tt=t,yy=y,tmp1,tmp2},
		tmp1 = PowerExpand[Map[Factor,m[s t,s y],Infinity]];
		tmp2 = PowerExpand[Map[Factor,n[s t,s y],Infinity]];
        If[Together[ExpandAll[(tmp1 n[t,y])/(tmp2 m[t,y])]] === 1 &&
            Simplify[t m[t,y] + y n[t,y]] =!= 0,
            u = Simplify[ExpandAll[1/(t m[t,y] + y n[t,y])]];
            mm[tt_,yy_] = ExpandAll[u m[t,y]];
            nn[tt_,yy_] = ExpandAll[u n[t,y]];
			If[FirstOrderExactQ[mm,nn][t,y],
				ODEDialoguePrint["Integrating factor ",mu," = ",mu,"[",t,",",y,"] = ",u];
           		Return[FirstOrderExact[mm,nn,const][t,y]]
			]
        ]
	]

IntegratingFactor4[m_,n_,const_Symbol][t_,y_] :=
    Module[{tt=t,yy=y,m1,m2,n1,n2,u,mm,nn,s},
        If[SeparableQ[m][t,y] && SeparableQ[n][t,y],
			{m1[tt_],m2[yy_]} = Separate[m][t,y];
 			{n1[tt_],n2[yy_]} = Separate[n][t,y];
            u = Together[1/(m2[y] n1[t])];
            mm[tt_,yy_] = ExpandAll[u m[t,y]];
            nn[tt_,yy_] = ExpandAll[u n[t,y]];	
			If[FirstOrderExactQ[mm,nn][t,y],
				ODEDialoguePrint["Integrating factor ",mu," = ",mu,"[",t,",",y,"] = ",u];
           		Return[FirstOrderExact[mm,nn,const][t,y]]
			]
        ]
	]

IntegratingFactor5[m_,n_,const_Symbol][t_,y_] :=
    Module[{tt=t,yy=y,m1,m2,n1,n2,u,mm,nn,s},
		m1 = Simplify[m[t,y]/y] /. t y -> s;
		n1 = Simplify[n[t,y]/t] /. t y -> s;
		If[FreeQ[m1,t] && FreeQ[m1,y] && FreeQ[n1,t] && FreeQ[n1,y],
			u = Together[1/(t m[t,y] - y n[t,y])];
            mm[tt_,yy_] = ExpandAll[u m[t,y]];
            nn[tt_,yy_] = ExpandAll[u n[t,y]];	
			If[FirstOrderExactQ[mm,nn][t,y],
				ODEDialoguePrint["Integrating factor ",mu," = ",mu,"[",t,",",y,"] = ",u];
           		Return[FirstOrderExact[mm,nn,const][t,y]]
			]
		]
	]

IntegratingFactor6[m_,n_,const_Symbol][t_,y_] :=
    Module[{tt=t,yy=y,tmp,u,mm,nn,z},
		tmp = Simplify[(D[m[t,y],y]-D[n[t,y],t])/(n[t,y]-m[t,y])] /. t+y -> z;
		If[FreeQ[tmp,t] && FreeQ[tmp,y],
			u = Simplify[Exp[Integrate[tmp,z] /. z -> t + y]];
            mm[tt_,yy_] = ExpandAll[u m[t,y]];
            nn[tt_,yy_] = ExpandAll[u n[t,y]];	
			If[FirstOrderExactQ[mm,nn][t,y],
				ODEDialoguePrint["Integrating factor ",mu," = ",mu,"[",t,",",y,"] = ",u];
           		Return[FirstOrderExact[mm,nn,const][t,y]]
			]
		]
	]

IntegratingFactor7[m_,n_,const_Symbol][t_,y_] :=
    Module[{tt=t,yy=y,tmp,k,u,mm,nn,z},
		tmp = Simplify[(D[m[t,y],y]-D[n[t,y],t])/(y n[t,y] - t m[t,y])] /. 
			{(t y)^k_. -> z^k , t^k_. y^k_. -> z^k} ;
		If[FreeQ[tmp,t] && FreeQ[tmp,y],
			u = Simplify[Exp[Integrate[tmp,z] /. 
				z^k_. -> (t y)^k]];
            mm[tt_,yy_] = ExpandAll[u m[t,y]];
            nn[tt_,yy_] = ExpandAll[u n[t,y]];	
			If[FirstOrderExactQ[mm,nn][t,y],
				ODEDialoguePrint["Integrating factor ",mu," = ",mu,"[",t,",",y,"] = ",u];
           		Return[FirstOrderExact[mm,nn,const][t,y]]
			]
		]
	]

IntegratingFactor8[m_,n_,const_Symbol][t_,y_] :=
    Module[{tt=t,yy=y,r,r1,r2,e,u,mm,nn},
		r = {y n[t,y],-t m[t,y],t y (D[m[t,y],y]-D[n[t,y],t])};
		r1 = r /.  {y -> 5 , t -> 2};
		r2 = r /.  {y -> 3 , t -> 7};
		e = Last[Transpose[RowReduce[{r1,r2}]]];
		u = t^e[[1]] y^e[[2]];
        mm[tt_,yy_] = ExpandAll[u m[t,y]];
        nn[tt_,yy_] = ExpandAll[u n[t,y]];	
		If[FirstOrderExactQ[mm,nn][t,y],
			ODEDialoguePrint["Integrating factor ",mu," = ",mu,"[",t,",",y,"] = ",u];
           	Return[FirstOrderExact[mm,nn,const][t,y]]
		]
	]

(* Added TrigSimplify - 070897 *)
FirstOrderExactQ[m_,n_][t_,y_] :=
	Together[TrigSimplify[D[m[t,y],y]]] === Together[TrigSimplify[D[n[t,y],t]]]

(* Added Simplify of integrand to avoid divide by zero 111199 *)
FirstOrderExact[m_,n_,const_Symbol][t_,y_] :=
		If[FirstOrderExactQ[m,n][t,y],
			Simplify[Integrate[m[t,y],t] + 
			  Integrate[Simplify[n[t,y] -
			D[Integrate[m[t,y],t],y]],y]] == const,
			If[$ODEDialogx && $ODETracex, 
				Print["(",m[t,y],") d",t," + (",n[t,y],") d",y,
			  	" = 0 is not exact."]
			]
		]

FirstOrderExactQ[eq_,y_,t_] :=
	Module[{F,aa,bb,cc,dd,ee,pow,eqt,yy,tt,a,b},
		{eqt,yy,tt} = ConvertToY[eq,y,t];
		If[!FreeQ[eqt,yy'],
			eqt = First[First[eqt]] - Last[First[eqt]] /. 
			yy' -> ToExpression[StringJoin["d",ToString[yy],"/d",ToString[t]]];
			eqt = Expand[ToExpression[StringJoin["d",ToString[t]]] eqt] == 0;
		];
		{F,aa,bb,cc,dd,ee,pow} = Parse[eqt,yy,t];
		a = Function[{t,yy},aa];
		b = Function[{t,yy},bb];
		FirstOrderExactQ[a,b][t,yy]
	]
	
FirstOrderLinear[a_,b_,c_,const_Symbol][t_] :=
    Module[{p,q,intfac},
        p = b[t]/a[t];
        q = c[t]/a[t];
        intfac = Exp[Integrate[p,t]];
        Simplify[(Integrate[intfac q,t] + const)/intfac]
    ]

FirstOrderLinearQ[eq_,y_,t_] :=
	Module [{F,order},
		F = ExpandAll[First[eq] - Last[eq]];
		order = DEOrder[eq,y,t];
		order == 1 && LinearQ[eq,y,t]
	]

Bernoulli[a_,b_,c_,n_,const_Symbol][t_] :=
    Module[{p,q,intfac},
        p = b[t]/a[t];
        q = c[t]/a[t];
        If[ n === 1,
           const Exp[Integrate[q-p,t]],
           Simplify[intfac = Exp[(1-n) Integrate[p,t]];
           	 ((Integrate[(1-n)q intfac,t] + const)/intfac)^(1/(1-n))]
        ]
    ]

BernoulliQ[eq_,y_,t_] :=
	Module[{F,aa,bb,cc,dd,ee,pow,yy=y},
		If[Head[y] =!= Symbol,yy = Head[y]];
		{F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
		If[pow === {} || pow === 1 || aa =!= 0  || 
		(Head[pow] === List && Length[pow] > 1) ||
		  !FreeQ[{bb,cc,ee},yy] || F === 0,
		   False,True
		]
	]

Riccati[a_,b_,c_,d_,yk_,const_Symbol][t_] :=
    Module[{intfac,p,q,r},
        p = b[t]/a[t];
        q = c[t]/a[t];
        r = d[t]/a[t];
        intfac = Exp[Integrate[q + 2yk[t] r,t]];
        Simplify[yk[t] - intfac/(Integrate[r intfac,t] + const)]
    ]

RiccatiQ[eq_,y_,t_] :=
	Module[{F,aa,bb,cc,dd,ee,pow},
		{F,aa,bb,cc,dd,ee,pow} = Parse[eq,y,t];
		If[F === 0 || (ee =!= 0 && pow =!= 2) ||
		(Head[pow] === List && Length[pow] > 1),
		   False,True
		]
	]

ExchangeVariables[f_][t_,y_] :=
    Module[{F},
		If[f[t,y] =!= 0,
			F = Function[{t,y}, Apart[1/f[t,y]]];
			t'[y] == (F[t,y] /. t -> t[y])
		]
    ]

ExchangeVariables[eq_,y_,t_] :=
    Module[{tmp=ExpandAll[First[eq] - Last[eq]],yy=y},
		If[Head[y] =!= Symbol, yy = Head[y]];
		Numerator[Together[tmp/.{yy'[t] -> 1/t'[yy],
			yy''[t]->-t''[yy]/t'[yy]^3,t->yy,
			yy[t]->yy}]] == 0
    ]

SeparableQ[f_][t_,y_] :=
	Simplify[D[D[f[t,y],t],y] f[t,y] - D[f[t,y],t] D[f[t,y],y]] === 0

Separable[f_,const_Symbol][t_,y_] :=
	Module[{tmp,s,f1,f2,yy=y,tt=t},
			tmp = Factor[f[t,y],Trig->True];
			If[Head[tmp] === Times,
				tmp = s tmp;
				Unprotect[Power];
				Power[a_,b_ + c_] := a[{b}] a[{c}];
				f1 = Times @@ Select[List @@ tmp,FreeQ[#,y]&];
				f2 = Times @@ Select[Select[List @@
					 tmp,FreeQ[#,t]&],!FreeQ[#,y]&];
				Clear[Power];
				Protect[Power];
				f1 = f1  /. a_[{b_}] -> a^b;
				f2 = f2  /. a_[{b_}] -> a^b;
				If[ f1 f2 === tmp && f2 =!= 0,
					f1 = f1 /. s -> 1;
            		Return[Simplify[Integrate[1/f2,yy] /. yy -> y] == 
						   Simplify[Integrate[f1,tt] /. tt -> t] + const]
				];
			];
	    	tmp = f[t,y] /. y -> s;
	    	If[ FreeQ[tmp,s], 
            	Return[Simplify[Integrate[f[t,y],t] + const]]
        	];
	    	tmp = f[t,y] /. t -> s;
	    	If[f[t,y] =!= 0 && FreeQ[tmp,s], 
            	Return[Simplify[(Integrate[1/f[t,y],yy] /. 
					yy -> y)] == t + const]
        	];
			If[!SeparableQ[f][t,y],
				Print[y,"'[",t,"] = ",f[t,y]," is not separable."]
			]
	]

Separate[f_][t_,y_] :=
	Module[{tmp,s,f1,f2,yy=y,tt=t},
	    	tmp = f[t,y] /. y -> s;
	    	If[FreeQ[tmp,s], 
            	Return[{f[t,y],1}]
        	];
	    	tmp = f[t,y] /. t -> s;
	    	If[FreeQ[tmp,s], 
            	Return[{1,f[t,y]}]
        	];
			tmp = Factor[f[t,y],Trig->True];
			If[Head[tmp] === Times,
				tmp = s tmp;
				f1 = Times @@ Select[List @@ tmp,FreeQ[#,y]&];
				f2 = Times @@ Select[Select[List @@
					 tmp,FreeQ[#,t]&],!FreeQ[#,y]&];
				If[ f1 f2 === tmp,
					f1 = f1 /. s -> 1;
            		Return[{f1,f2}]
				]
			]
	]

separate[f_][t_,y_] := 
	Module[{a},
		If[!Simplify[D[D[f[t,y],t],y] f[t,y] - 
			D[f[t,y],t] D[f[t,y],y]] == 0,
			Print[f[t,y]," is not separable"],
			a = Exp[Integrate[D[Log[f[t,y]],t],t]];
			Simplify[{a,f[t,y]/a}]
		]
	]

ClairautQ[eq_,y_,t_] :=
	Module [{F,tmp,v,vp},
		F = ExpandAll[First[eq] - Last[eq]];
		tmp = F /. {y :> v , D[y,t] :> vp};
		If[ FreeQ[tmp,t] && FreeQ[tmp,v],
			False,
			Simplify[Expand[D[tmp,t] + vp D[tmp,v]]] === 0
		]
	]

Clairaut[f_,const_Symbol][t_,y_] :=
	Module[{sol,sing,s,xs,ys},
        sol = Simplify[t const + f[const]];
		If[f''[t] =!= 0,
			singularsolution = 
				Eliminate[{xs == -f'[s],ys == f[s] - s f'[s]},s];
			If[Head[singularsolution] === Equal && 
				FreeQ[singularsolution,DirectedInfinity],
				singularsolution = singularsolution /. {xs -> t, ys -> y},
			    singularsolution = 0
			]
		];
		Simplify[sol]
	]
			
Clairaut[eq_,y_,t_,const_Symbol] :=
    Module[{F,u,v,w},
            If[ClairautQ[eq,y,t],
                F = ExpandAll[First[eq] - Last[eq]];
                v = F /. {y :> u + t D[y,t]} ;
                v = Simplify[Expand[v]];
                v = v /. {D[y,t] :> const} ;
                w = Solve[v == 0,u];
                If [ MatchQ[w,{__}],
                    First[Flatten[w /. (u -> r_) :> 
                      (const t + r)]]
                ],
                Print[eq," is not a Clairaut equation."]
            ]
    ]

LagrangeQ[eq_,y_,t_] :=
	Module [{F,tmp,v,vp,f,g,sgn},
		F = ExpandAll[First[eq] - Last[eq]];
		tmp = F /. {y :> v , D[y,t] :> vp};
		If[ FreeQ[tmp,t] && FreeQ[tmp,v],
			False,
			f = D[tmp,t];
			sgn = D[tmp,v];
			g = tmp - t f - sgn v;
			If[FreeQ[g,v],
				Simplify[tmp - t f - sgn v - g] === 0,
				False
			]
		]
	]

Lagrange[f_,g_,const_Symbol][t_,y_] :=
	Module[{yy=y,z,sol,p,q,tmp,xs,ys},
		If[Head[y] =!= Symbol, yy = Head[y]];
		If[f[z] === z,
			Return[Clairaut[g,const][t,y]]
		];
		p[z_] = Simplify[-f'[z]/(z-f[z])];
		q[z_] = Simplify[g'[z]/(z-f[z])];
        tmp = FirstOrderLinear[1&,p,q,const][yy] /. yy -> z;
		xs = t == tmp;
		ys = yy == Simplify[tmp f[z] + g[z]];
        sol = Eliminate[{xs,ys},z];
		If[!FreeQ[sol,Eliminate] || !FreeQ[sol,z],
			ODEDialoguePrint["Parametric solution detected"];
			parasol = True;
			sol = {xs,ys} /. z -> ODEs
		];
		tmp = Solve[f[z] == z,z];
		If[tmp =!= {} && FreeQ[tmp,Solve] && 
			FreeQ[tmp,ToRules] && FreeQ[tmp,Root],
			singularsolution = yy == t f[z] + g[z] /. tmp;
			If[!FreeQ[singularsolution,DirectedInfinity],
				singularsolution = 0
			]
		];
		Simplify[sol]
	]

Lagrange[eq_,y_,t_,const_Symbol] :=
    Module[{yy=y,F,v,vp,f,g,z,sgn},
            If[LagrangeQ[eq,y,t],
				If[Head[y] =!= Symbol, yy = Head[y]];
                F = ExpandAll[First[eq] - Last[eq]];
				tmp = F /. {y :> v , D[y,t] :> vp};
				If[Coefficient[tmp,v] == -1,tmp = -tmp];
				f[z_] = -D[tmp,t] /. vp -> z;
				g[z_] = -(tmp - t D[tmp,t] - D[tmp,v]v) /. vp -> z;
				Lagrange[f,g,const][t,yy],
                Print[eq," is not a Lagrange equation."]
            ]
    ]

LinearFractionalQ[f_][t_,y_] := 
	Module[{n,d,ff=Simplify[Together[f[t,y]]]},
		n = Numerator[ff];
		d = Denominator[ff];
		PolynomialQ[n,{t,y}] && PolynomialQ[d,{t,y}] &&
		Union[Exponent[n,{t,y}]] === {1} 		     &&
		Union[Exponent[d,{t,y}]] === {1}
	]

LinearFractional[f_,const_Symbol][t_,y_] :=
	Module[{tt=t,yy=y,n,d,h,k,
		ff=Simplify[Together[f[t,y]]],fff,eq1,eq2,sol},
		If[LinearFractionalQ[f][t,y],
			n = Expand[Numerator[ff] /. t -> tt + h /. y -> yy + k];
			d = Expand[Denominator[ff] /. t -> tt + h /. y -> yy + k];
			eq1 = Select[n,(FreeQ[#,tt] && FreeQ[#,yy])&];
			eq2 = Select[d,(FreeQ[#,tt] && FreeQ[#,yy])&];
			sol = Flatten[Solve[{eq1 == 0,eq2 == 0},{h,k}]];
			If[sol =!= {},
				fff[tt_,yy_] = (n/d) /. sol;
				Return[FirstOrderHomogeneous[fff,const][tt,yy] /. 
					tt -> t - k /. yy -> y - h /.sol]
			],
			If[$ODEDialogx && $ODETracex, 
				Print["y' = ",f[t,y]," is not in linear fractional form."]
			]
		]
	]

explicit[eq_] :=
	Module[{},
		If[Length[eq] > 1, 
			Print["Multiple solutions found - Choosing first one."]
		];
		Last[First[Flatten[eq]]]
	]

FactorEquation[eq_,y_,t_] :=
	Module[{yy=y,tmp,ord,F,G,n,a,b},
		If[Head[y] =!= Symbol, yy = Head[y]];
		tmp = First[eq] - Last[eq];
		ord = DEOrder[tmp,yy,t];
		If[ord === 1,
			tmp = Numerator[Together[ExpandAll[tmp /. 
				yy[t]^n_. -> F^n /.
				Table[Derivative[n][yy][t] -> G^n,{n,0,ord}]]]];
			tmp = FactorList[tmp];
			If[FreeQ[First[tmp],G],
				tmp = Rest[tmp]
			];
			tmp = Map[First[#]==0&,tmp] /. 
				a___ + b_?(NumberQ[#] && # =!= 0&) -> a + b yy[t] /. 
				F^n_. -> yy[t]^n /. 
				Table[G^n -> Derivative[n][yy][t],{n,1,ord}];
			If[!FreeQ[Map[FreeQ[#,Derivative]&,tmp],True],
				{eq},
				tmp
			]
		]
	]

GetMatrices[sys_,y_,t_] :=
    Module[{rhs,eqpts,a,b,n,tmp,order},
		Off[Power::infy];
		Off[Infinity::indet];
		order = Length[Flatten[{y}]];
		tmp = Map[First[#] - Last[#]&,sys];
		b = -tmp /. Flatten[Map[{# -> 0 , D[#,{t,n_}] :> 0}&,Flatten[{y}]]];
        rhs = (tmp /.
          Thread[Rule[D[y,t],Table[0,{order}]]]) + b;
		Off[Solve::svars];
		Off[Solve::cfail];
        eqpts = Union[Solve[N[rhs] == 0,y]];
		On[Solve::svars];
		On[Solve::cfail];
		If[FreeQ[eqpts,Solve] && FreeQ[eqpts,ToRules] && FreeQ[eqpts,Root],
			If[Length[rhs] == 1,
				b = First[b];
				a = Flatten[-D[rhs,y] /. eqpts],
        		a = -Outer[D,rhs,y] /. eqpts
			];
			tmp = {a,b},
			tmp = {}
		];
		On[Power::infy];
		On[Infinity::indet];
		Rationalize[tmp,0]
	]

GetSemiNumericalMatrices[sys_,y_,t_] :=
    Module[{rhs,eqpts,a,b,n,tmp,order},
		order = Length[Flatten[{y}]];
		tmp = Map[First[#] - Last[#]&,sys];
		b = -tmp /. Flatten[Map[{# -> 0 , D[#,{t,n_}] :> 0}&,Flatten[{y}]]];
        rhs = (tmp /. 
          Thread[Rule[D[y,t],Table[0,{order}]]]) + b;
		Off[Solve::eqf];
		Off[Solve::svars];
        eqpts = Union[NSolve[rhs == 0,y,precision]];
		On[Solve::eqf];
		On[Solve::svars];
		If[!FreeQ[eqpts,NSolve],
			Return[{0,0}]
		];
		If[Length[rhs] == 1,
			b = First[b];
			a = Flatten[-D[rhs,y] /. eqpts],
        	a = -Outer[D,rhs,y] /. eqpts
		];
		{a,b}
	]

HomogeneousLinearSystem[sys_,y_,t_,const_Symbol] :=
    Module[{a,b,aa,bb},
		aa = GetMatrices[sys,y,t];
		If[aa =!= {},
			a = {First[First[aa]]};
			b = Last[aa];
			If[FreeQ[a,t] &&
			  (Simplify[Together[D[y,t] - Flatten[a.y]-b]] ===
			   Simplify[Together[Flatten[Map[First[#]-Last[#]&,sys]]]]),
				Return[HomogeneousLinearSystem[First[a],const][t]]
			]
		];
		Print["Not a constant coefficient linear system."]
    ]

LinearSystem[sys_,y_,t_,const_Symbol] :=
    Module[{a,b,sol,aa},
		aa = GetMatrices[sys,y,t];
		If[aa =!= {},
			{a,b} = aa;
			If[!VectorQ[b],		
				sol = {y == FirstOrderLinear[
					1&,-First[a]&,Function[t,b],const][t] /. 
						const -> const[1]},
				sol = HomogeneousLinearSystem[sys,y,t,const];
				a = Table[sol /. Table[const[i] -> If[i==j,1,0],
					{i,Length[b]}],{j,Length[b]}];
				sol = LogicalExpand[y == sol + 
					VariationOfParametersLinearSystem[a,b][t]];
				sol = Flatten[{sol} //. And[aa_,bb_] -> {aa,bb}]
			];
			sol
		]
    ]

ApproximateLinearSystem[sys_,y_,t_,const_Symbol] :=
    Module[{rhs,eqpts,a,b,n,tmp,sol={},cv,ea,order,count,
		roots,ff={},finv,r,aa,bb,realeq=FreeQ[sys,Complex]},
		order = Length[Flatten[{y}]];
		{a,b} = GetSemiNumericalMatrices[sys,y,t];
		If[!VectorQ[b],		
			sol = {y == N[FirstOrderLinear[
			  	1&,-First[a]&,Function[t,b],const][t],precision] /. 
						const -> const[1]},
			cv = Table[const[i],{i,1,order}];
			Table[r[i] = 
				Table[const[j] -> If[i==j,1,0],{j,1,order}],{i,1,order}];
			roots = Chop[Eigenvalues[N[First[a],precision]]];
			count = Map[Count[roots,#]&,Union[roots]];
			roots = Union[roots];
			For[i=1, i <= Length[roots], i++,
				For[j=count[[i]]-1, j >=0 , j--,
					AppendTo[sol,t^j/j! Exp[roots[[i]] t]]
				]
			];
			For[i=0 , i < order , i++,
				AppendTo[ff,D[sol,{t,i}]]
			];
			finv = Inverse[Transpose[ff] /. t -> 0.];
			tmp =
			 Transpose[Table[MatrixPower[First[a],i-1].cv,{i,1,order}]];
(* Changed ComplexExpand to ComplexToTrig - 051697 *)
			sol = Simplify[ComplexToTrig[tmp.finv.ff[[1]]]];
			ea = Expand[Table[sol/.r[i],{i,1,order}]];
			sol = sol + VariationOfParametersLinearSystem[ea,b][t];
			sol = LogicalExpand[y == Simplify[sol]];
			sol = Flatten[{sol} //. And[aa_,bb_] -> {aa,bb}]
		];
		Expand[sol]
    ]

CriticalPoints[sys_,y_,t_] :=
    Module[{rhs,eqpts},
        rhs = Map[First[#] - Last[#]&,sys] /. 
          Thread[Rule[D[y,t],Table[0,{Length[Flatten[{y}]]}]]];
		Off[Solve::svars];
        eqpts = Union[Solve[rhs == 0,y]];
		On[Solve::svars];
		y /. eqpts
    ]

LinearizeAt[sys_,y_,t_,criticalpt_] :=
        Module[{rhs,eqpts,linsys,tmp,aa,bb},
        rhs = Map[First[#] - Last[#]&,sys] /. 
			Thread[Rule[D[y,t],Table[0,
			{Length[Flatten[{y}]]}]]];
        eqpts = Thread[Rule[y,criticalpt]];
		If[Union[Simplify[rhs /. eqpts]] == {0},
        	If[Length[rhs] == 1,
            	linsys = -D[First[rhs],y] /. eqpts,
            	linsys = -Outer[D,rhs,y] /. eqpts
        	];
			If[Length[rhs] == 1,		
				tmp = D[y,t] == linsys y;
				ODEDialoguePrint["Associated system: ",tmp],
				tmp = LogicalExpand[D[y,t] == Simplify[linsys.y]];
				ODEDialoguePrint["Original system:   ",ColumnForm[sys]];
				ODEDialoguePrint["Equilibrium Point: ",criticalpt];
				ODEDialoguePrint["Linearized system: ",
					ColumnForm[LogicalExpand[tmp]]];
				ODEDialoguePrint["Eigenvectors:      ",Eigenvectors[linsys]]
			];
			Return[Flatten[{tmp} //. And[aa_,bb_] -> {aa,bb}]]
        ]
    ]

HomogeneousSecondOrderLinear[a_,b_,c_,const_Symbol][t_] :=
	Module[{m1,m2,sol},
		If[a === 0,
			Print["Equation is not second-order."],
			m1 = PowerExpand[(-b - Sqrt[b^2 - 4a c])/(2a)];
			m2 = PowerExpand[(-b + Sqrt[b^2 - 4a c])/(2a)];
			If[m1 === m2,
				sol = const[1] Exp[m1 t] + const[2] t Exp[m1 t],
				If[FreeQ[m1,Complex] && FreeQ[m2,Complex],
					sol = const[1] Exp[m1 t] + const[2] Exp[m2 t],
					If[!FreeQ[{a,b,c},Complex],
						sol = const[1] Exp[m1 t] + const[2] Exp[m2 t],
						sol = Exp[Re[m2] t]*(const[1] Sin[Im[m2] t] + 
					  	  const[2] Cos[Im[m2] t])
					]
				]
			];
			sol
		]
	]

SecondOrderLinear[a_,b_,c_,f_,const_Symbol][t_] :=
    Module[{sol,ls,w,y},
        sol = HomogeneousSecondOrderLinear[a,b,c,const][t];
        r = Function[t,Evaluate[Simplify[f[t]] /. 
			Power[x_,Rational[y_,z_]] /; FreeQ[{x,y,z},t] -> w[x,y,z]]]; 
		ls = (CoefficientList[sol,{const[1],const[2]}].{1,1}) /. 
			Power[x_,Rational[y_,z_]] /; FreeQ[{x,y,z},t] -> w[x,y,z];
		sol + ParticularSolution[a y''[t] + b y'[t] + c y[t] == 
			r[t],y,t,Map[Function[t,#]&,ls],w] /. 
			w[x_,y_,z_] -> Power[x,Rational[y,z]]
   ]

Wronskian[y1_,y2_][t_] := Simplify[y1[t]y2'[t] - y2[t]y1'[t]]

Wronskian[ls_List][t_] :=
	Module[{y},
		y=Through[ls[t]];
		Simplify[Det[FoldList[D,y,Table[t,{Length[y]-1}]]]]
	]

VariationOfParameters[y1_,y2_,f_][t_] := 
	Module[{w,u1,u2},
		w = Wronskian[y1,y2][t];
		If[w =!= 0,
			u1 = Simplify[Integrate[-y2[t]f[t]/w,t]];
			u2 = Simplify[Integrate[y1[t]f[t]/w,t]];
			Simplify[y1[t]u1 + y2[t]u2]
		]
	]

VariationOfParameters[ls_List,f_][t_] := 
	Module[{y,a,w,r,s,u,n},
		If[f[t] === 0, Return[0]];
			y = Through[ls[t]];
			a = FoldList[D,y,Table[t,{Length[y] - 1}]];
			w = Simplify[Det[a]];
			If[w =!= 0,
                r = u = Append[Table[0,{Length[y] - 1}],f[t]];
                Do[
                    s = Transpose[a];
                    s[[n]] = r;
				    u[[n]] = ExpandAll[Integrate[
						Evaluate[Chop[ExpandAll[Det[s]/w]]],t]],
                    {n,1,Length[y]}
                ];
                Simplify[y.u]
            ]
	]

VariationOfParametersLinearSystem[a_List,f_List][t_] := 
	Module[{w,s,u,n},
		If[f === Table[0,{Length[a]}],Return[Table[0,{Length[a]}]]];
			w = Simplify[Det[a]];
			If[w =!= 0,
                u = Table[0,{Length[a]}];
                Do[
                    s = a;
                    s[[n]] = f;
		            u[[n]] = ExpandAll[Integrate[
						Evaluate[Chop[ExpandAll[Det[s]/w]]],t]],	
                    {n,1,Length[a]}
                ];
                Simplify[Transpose[a].u]
            ]
	]

UndeterminedCoefficients[eq_,y_,t_,f_] :=
	Module[{neq = eq,yy=y,yz,tt = t,f1,f2,f3,deg=0,
			p,q,expq,a,form=False,tform,mult=1/t,sol={},sys},
		If[Head[y] =!= Symbol, yy = Head[y]];
		f1[x_] := If[PolynomialQ[x,t],
					deg = Exponent[x,t];
					Sum[a[i] t^i,{i,0,deg}]
				  ];
		f2[x_] := If[MatchQ[x,Exp[z_]],expq = x[[2]];x];
		f3[x_] := Module[{td},
					If[MatchQ[x,Sin[z_] | Cos[z_]],
						td = deg ; deg = 2 deg+1;
						q = x /. (Sin[z_] | Cos[z_]) :> z;		
						Sum[a[i] t^i,{i,0,td}] Sin[q] +
							Sum[a[i+td+1] t^i,{i,0,td}] Cos[q]
					]
				  ];
		neq = Numerator[Together[First[eq]-Last[eq] - f]] /. yy -> yz;
		If[(p = DeleteCases[f /. a_. b_. c_. d_. :> 
			{a,b,c,d},1]) == {}, p = {1},p];
		While[Length[p] > 1 && FreeQ[First[p],t],p=Drop[p,1]];
		If[FreeQ[f,(Sin | Cos)],
			tform = DeleteCases[Union[Map[f1,p],Map[f2,p]],Null],
			Map[f1,p];
			tform = DeleteCases[Union[Map[f2,p],Map[f3,p]],Null]
		];
		Off[Solve::svars];
		If[FreeQ[f,t] || !FreeQ[tform,t],
			form = Times @@ tform;
			If[FreeQ[form,a],form = a[0] form];
(* Added Exponent[mult,t] < degree && to following test 050997 *) 
			While[Exponent[mult,t] < order && sol == {},
				mult = mult t;
				yz[tt_] = mult form /. t -> tt;
				sys = Map[#==0&,Union[CoefficientList[neq,t] /. 
						{Exp[expq] -> 1 , Exp[-expq] -> 1 , 
							Sin[q]->1 , Cos[q]->0},
				   		CoefficientList[neq,t] /. 
				   		{Exp[expq] -> 1 , Exp[-expq] -> 1 ,
							 Sin[q]->0 , Cos[q]->1}]];
				sol = Flatten[Solve[sys,Table[a[i],{i,0,deg}]]]
			];		
			form = mult form /. sol
		];
		On[Solve::svars];
		If[FreeQ[form,a],form,False]
	]	

ParticularSolution[eq_,y_,t_,ls_,w___] :=
	Module[{neq,yy=y,tt=t,f,ff,fff,z,n,yp={},
		polytrm,exptrm,sintrm,costrm},
		If[Head[y] =!= Symbol, yy = Head[y]];
		neq = First[eq] - Last[eq];
		f = GetCoefficients[eq,y,t];
(* Normalize forcing function 051597 *)
		f = -First[f]/Last[f];
		If[f === 0 || -f === neq,Return[0]];
		neq = (neq + f) /. w[xw_,yw_,zw_] -> Power[xw,Rational[yw,zw]];
		If[Head[f] === Plus,
			f = List @@ f,
			f = {f}
		];
		ff = f /. w[xw_,yw_,zw_] -> Power[xw,Rational[yw,zw]];
		Do[
			tmp = False;
			polytrm = ff[[n]] //. {Exp[a_. t]->1,Sin[a_. t]->1,Cos[a_. t]->1};
			If[polytrm =!= 0 && PolynomialQ[polytrm,t],
				fff = ff[[n]] //. 
					{Exp[a_. t]->Exp[a z],Sin[a_. t]->Sin[a z],Cos[a_. t]->Cos[a z]};
				exptrm = fff //. polytrm->1 //. {
					Exp[a_. z]->Exp[a t],Sin[a_. z]->1,Cos[a_. z]->1};
				sintrm = fff //. polytrm->1 //. 
					{Exp[a_. z]->1,Sin[a_. z]->Sin[a t],Cos[a_. z]->1};
				costrm = fff //. polytrm->1 //. 
					{Exp[a_. z]->1,Sin[a_. z]->1,Cos[a_. z]->Cos[a t]};
				If[ff[[n]] === polytrm exptrm sintrm || 
				   ff[[n]] === polytrm exptrm costrm,
					tmp = UndeterminedCoefficients[neq == 0,yy,t,ff[[n]]]
				]
			];
			If[tmp === False,
				tmp = VariationOfParameters[ls,Function[t,f[[n]]]][t]
			];
			AppendTo[yp,tmp],
			{n,1,Length[f]}
		];
		Simplify[Plus @@ yp]
	]	

Laplace[sys_,y_,t_] :=           
	Module[{s,g,diffeq,altdeorder = 0,sol,
	  altdiffeq,initconds,algeq,algsol,i,realeq=FreeQ[sys,Complex]},
            initconds = Flatten[Sort[Select[Flatten[{sys}],D[#,t]&]]];
            diffeq = Expand[Complement[Flatten[{sys}],initconds],
				Trig->True];
            initconds = Flatten[Map[ToRules,initconds]];
            algeq = LaplaceTransform[diffeq,t,s];
	 		altdeorder = Max[0,Cases[algeq,
			  Derivative[0,0,n_][LaplaceTransform][y,t,s] -> n,Infinity]];
            If[altdeorder > 0,
                altdiffeq = algeq //. 
					Table[Derivative[0,0,i][LaplaceTransform][y,t,s] -> 
                  Derivative[i][g][s],{i,0,altdeorder}];
                algeq = DSolve[Flatten[altdiffeq],g[s],s] /. g[s] -> 
                  LaplaceTransform[y,t,s];	
                algsol = Simplify[algeq /. initconds],
                algeq = algeq /. initconds;
                algsol =
				 Simplify[Solve[algeq,
				 Flatten[Map[LaplaceTransform[#,t,s]&,{y}]]]]
            ]; 
			sol = Map[ComplexExpand,{Flatten[Map[
				InverseLaplaceTransform[#,s,t]&,algsol,{3}]]} /. 
				{s -> "s" , g -> "g"},Infinity];
			If[realeq,sol = sol //. Re[aa_]->aa //. Im[aa_]->0];
			Simplify[sol]
	]

ReductionOfOrder[a_,b_,yk_][t_] :=
	Module[{intfac},
		intfac = Exp[-Integrate[b[t]/a[t],t]];
		Together[yk[t] Integrate[intfac/yk[t]^2,t]]
	]

ReductionOfOrder[a_,b_,yk_,const_Symbol][t_] :=
    Module[{intfac},
        intfac = Exp[-Integrate[b[t]/a[t],t]];
        const[1] yk[t] + const[2] Together[yk[t] Integrate[intfac/yk[t]^2,t]]
    ]

ReductionOfOrder[eq_,y_,t_,yk_,nv_] :=
    Module[{yy=y,yt,n,tmp,x},
		If[Head[y] =!= Symbol, yy = Head[y]];
		yt[x_] = nv[x] yk[x];
		tmp = Simplify[eq /. 
			{D[yy[t],{t,n_}] :> D[yt[t],{t,n}] , yy[t] -> yt[t]}];
		tmp /. Derivative[n_][nv][t] :> Derivative[n-1][nv][t]
    ]

HomogeneousLinearSystem[a_?MatrixQ,const_Symbol][t_] :=
	Module[{cv,sol,realeq=FreeQ[a,Complex]},
		If[FreeQ[a,t],
			cv = Table[const[i],{i,1,First[Dimensions[a]]}];		
(* Changed ComplexExpand to ComplexToTrig - 051697 *)
			Simplify[ComplexToTrig[Normal[MatrixExp[a t].cv]]],
			Print["Not a constant-coefficient linear system."]
		]
	]

LinearSystem[a_?MatrixQ,b_?VectorQ,const_Symbol][t_] :=
	Module[{cv,ea,sol,realeq=FreeQ[a,Complex]},
		If[FreeQ[a,t],
			cv = Table[const[i],{i,1,First[Dimensions[a]]}];		
(* Changed ComplexExpand to ComplexToTrig - 051697 *)
	    	ea = Simplify[ComplexToTrig[Normal[MatrixExp[a t]]]];
	    	Simplify[ea.(cv + Integrate[ExpandAll[Inverse[ea].b],t])],
			Print["Not a constant coefficient linear system."]
		]
	]

LinearQ[eq_,y_,t_] :=
	Module[{F,tmp,coeffs,yy=y,order,n,ypvect,G},
		F = ExpandAll[First[eq] - Last[eq]];
		If[Head[y] =!= Symbol,yy = Head[y]];
		order = DEOrder[F,yy,t];
		tmp = F /. {Derivative[n_][yy][t] -> G^(n+1),yy[t] -> G};
		If[!PolynomialQ[tmp,G],Return[False]];
		coeffs = CoefficientList[tmp,G];
		ypvect = Join[{1},Table[Derivative[n][yy][t],{n,0,order}]];
		If[Length[coeffs] === Length[ypvect],
			F === ExpandAll[coeffs.ypvect],
			False
		]
	]

GetCoefficients[eq_,y_,t_] :=
	Module[{F,yy=y,order,n,G,tmp},
		F = ExpandAll[First[eq] - Last[eq]];
		If[Head[y] =!= Symbol,yy = Head[y]];
		order = DEOrder[F,yy,t];
		tmp = F /. {Derivative[n_][yy][t] -> G^(n+1),yy[t] -> G};
		If[!PolynomialQ[tmp,G],Return[{}]];
		CoefficientList[tmp,G]
	]

ConvertToSystem[eq_,y_,t_,w_] :=
	Module[{initconds,tmp,order,k,n,a,b,yy=y,
 	  sys,sol={},rules={},offset=0},
		initconds = Cases[eq,aa_[bb_] == cc_ /; FreeQ[bb,t]];
		sys = Complement[Flatten[{eq}],initconds];
		order = Map[DEOrder[#,y,t]&,sys];
		If[Head[y] =!= List,yy = {y}];
		For[k=1,k<=Length[sys],k++,
			For[n=1,n<=Length[yy],n++,
				tmp = Flatten[Solve[sys[[k]],D[yy[[n]],{t,order[[k]]}]]];
				If[tmp =!= {},Break[]]
			];
			AppendTo[sol,tmp /. (a_ -> b_) -> 
			  ToExpression[ToString[w]<>ToString[order[[k]]+offset]]'[t] == b];
			If[order[[k]] > 1,
				AppendTo[sol,Flatten[
				Table[ToExpression[ToString[w]<>ToString[i+offset]]'[t] ==
				ToExpression[ToString[w]<>ToString[i+offset+1]][t],
				{i,1,order[[k]]-1}]]]
			];
			AppendTo[rules,Table[D[yy[[n]],{t,i}] -> 
				ToExpression[ToString[w]<>ToString[i+offset+1]][t],
				{i,0,order[[k]]-1}]];
			offset += order[[k]]
		];
		sol = Flatten[sol /. Flatten[rules]];
		Union[sol,initconds] /. (Flatten[rules] /.
			(a__[t] -> b__[t]) -> a -> b)
	]

EquationFromSolutions[y1_,y2_][t_,y_] :=
	Module[{w,p1,p0},
		w = Wronskian[y1,y2][t];
		If[w === 0,
			Print["The two functions are not",
			 "linearly independent."],
			p1 = Simplify[(y1''[t]y2[t] - y1[t]y2''[t])/w];
			p0 = Simplify[(-y1''[t]y2'[t] + y1'[t]y2''[t])/w];
			y''[t] + p1 y'[t] + p0 y[t] == 0
		]
	]

EquationFromSolutions[sols_List][t_,y_] := 
        Module[{z,a,b,w,s,p,n},
            z = Through[sols[t]];
            a = FoldList[D,z,Table[t,{Length[z] - 1}]];
			a = Transpose[Map[Reverse,Transpose[a]]];
            w = Simplify[Det[a]];
            If[w === 0,
                Print["The set of functions is not ",
                  "a linearly independent set."],
                b = -D[z,{t,Length[z]}];
                p = Join[{1},b];
                Do[
                    s = a;
                    s[[n]] = b;
                    p[[n+1]] = Simplify[Det[s]/w],
                    {n,1,Length[z]}
                ];
            	p.Table[Derivative[n][y][t],
              	  {n,Length[z],0,-1}] == 0
            ]
	]

CauchyEulerQ[eq_,y_,t_] :=
	Module[{tmp,F,yy=y,z,x,m},
		tmp = GetCoefficients[eq,y,t];
		F = Numerator[Together[ExpandAll[First[eq] - Last[eq] - First[tmp]]]];
		If[Head[y] =!= Symbol,yy = Head[y]];
		F = F /. yy -> z;
		z[x_] := x^m;
		FreeQ[Factor[F]/t^m,t]
	]

CauchyEuler[eq_,y_,t_] :=
	Module[{x,yy=y},
		If[CauchyEulerQ[eq,y,t],
			If[Head[y] =!= Symbol,yy = Head[y]];
			Transformation[eq,{x,t->Exp[x],yy[t]->yy[x]}] /. x -> t,
			Print[eq," is not a Cauchy-Euler equation."]
		]
	]

NthOrderCauchyEuler[eq_,y_,t_,const_Symbol] :=
	Module[{tt=t,tmp,m,cpoly,roots,count,i,j,sol={},z,
			order=DEOrder[eq,y,t],realeq=FreeQ[eq,Complex],F},
		tmp = GetCoefficients[eq,y,t];
		F = Rest[tmp].Table[D[z[t],{t,n}],{n,0,order}];
		z[x_] := x^m;
		roots = Solve[Factor[F]/t^m == 0,m];
		If[!FreeQ[roots,ToRules] || !FreeQ[roots,Root],
			Print["Approximating the roots of the characteristic equation"];
			exact = False;
			roots = NSolve[cpoly==0,m,precision]
		];
		roots = Sort[Flatten[roots]] /. 
			(m -> a_) /; !NumberQ[N[a]] -> {a} /. 
			(m -> a_) /; NumberQ[N[a]] -> {Re[a],Im[a]} /. 
			{a_,b_} /; b == 0 -> {a};
		If[realeq,
			roots = roots /. {a_,b_} /; Negative[N[b]] -> Null
		];

		(* NthOrderCauchyEuler - Part 2 *)
		count = Map[Count[roots,#]&,Union[roots]];
		roots = Union[roots];
		For[i=1, i <= Length[roots], i++,
			For[j=0, j < count[[i]], j++,
				If[Length[roots[[i]]] === 1, 
					AppendTo[sol,Log[t]^j t^roots[[i,1]]]
				];
				If[Length[roots[[i]]] === 2, 
					If[realeq, 
						AppendTo[sol,Log[t]^j t^roots[[i,1]] 
							Cos[roots[[i,2]] Log[t]]];
						AppendTo[sol,Log[t]^j t^roots[[i,1]] 
							Sin[roots[[i,2]] Log[t]]],
						AppendTo[sol,Log[t]^j t^(roots[[i,1]] + 
						  roots[[i,2]] I)]
					]
				]
			]
		];
		Table[const[i],{i,1,Length[sol]}].sol +
			ParticularSolution[eq,y,t,Map[Function[t,#]&,sol]]
	]

NthOrderCauchyEulerComplex[eq_,y_,t_,const_Symbol] :=
	Module[{tt=t,tmp,m,cpoly,roots,count,i,j,sol={},z,
		order=DEOrder[eq,y,t],realeq=FreeQ[eq,Complex],F},
		tmp = GetCoefficients[eq,y,t];
		F = Rest[tmp].
			Table[D[z[t],{t,n}],{n,0,order}];
		z[x_] := x^m;
		roots = Solve[Factor[F]/t^m == 0,m];
		If[!FreeQ[roots,ToRules] || !FreeQ[roots,Root],
			Print["Approximating the roots of the characteristic equation"];
			exact = False;
			roots = NSolve[cpoly==0,m,precision]
		];
		roots = Sort[Flatten[roots]] /. 
			(m -> a_) -> {a};
		count = Map[Count[roots,#]&,Union[roots]];
		roots = Union[roots];
		For[i=1, i <= Length[roots], i++,
			For[j=0, j < count[[i]], j++,
				If[Length[roots[[i]]] === 1, 
					AppendTo[sol,Log[t]^j t^roots[[i,1]]]
				]
			]
		];
		Table[const[i],{i,1,Length[sol]}].sol +
			ParticularSolution[eq,y,t,Map[Function[t,#]&,sol]]
	]

ApproximateNthOrderCauchyEuler[eq_,y_,t_,const_Symbol] :=
	Module[{tt=t,tmp,m,cpoly,roots,count,i,j,sol={},F,
			order=DEOrder[eq,y,t],realeq=FreeQ[eq,Complex],z},
		tmp = GetCoefficients[eq,y,t];
		F = Rest[tmp].
			Table[D[z[t],{t,n}],{n,0,order}];
		z[x_] := x^m;
		roots = Chop[Sort[Flatten[N[Solve[Factor[F]/t^m==0,m],precision]]]] /. 
			(m -> a_ /; FreeQ[a,I]) -> {a} /.
			{Complex[a_,b_]} -> {a,b};
		If[realeq,
			roots = roots /. {a_,b_} /; Negative[b] -> Null
		];
		count = Map[Count[roots,#]&,Union[roots]];
		roots = Union[roots];

		(* ApproximateNthOrderCauchyEuler - Part 2 *)
		For[i=1, i <= Length[roots], i++,
			For[j=0, j < count[[i]], j++,
				If[Length[roots[[i]]] === 1, 
					AppendTo[sol,Log[t]^j t^roots[[i,1]]]
				];
				If[Length[roots[[i]]] === 2, 
					If[realeq, 
						AppendTo[sol,Log[t]^j t^roots[[i,1]]* 
							Cos[roots[[i,2]] Log[t]]];
						AppendTo[sol,Log[t]^j t^roots[[i,1]]* 
							Sin[roots[[i,2]] Log[t]]],
						AppendTo[sol,Log[t]^j t^(roots[[i,1]] + 
						  roots[[i,2]] I)]
					]
				]
			]
		];
		Table[const[i],{i,1,Length[sol]}].sol +
			ParticularSolution[eq,y,t,Map[Function[t,#]&,sol]]
	]

SecondOrderExactQ[eq_,y_,t_] :=
	Module[{F,Fp,yy=y,tt=t,p,pp,n,f,g,
			ftt,fty,fyy,ftp,fyp,fy,
			gtp,gyp,gpp,gy},
	F = ExpandAll[First[eq] - Last[eq]];
	If[Head[y] =!= Symbol,yy = Head[y]];
	Fp = F /. D[yy[t],{t,n_}] :> D[p[t],{t,n-1}];
	f = Coefficient[Fp,p'[t]];
	g = Fp - f p'[t];
	f = f /. {yy[t] -> yy, p[t] -> pp};
	g = g /. {yy[t] -> yy, p[t] -> pp};	
	ftt = D[f,{tt,2}];
	fty = D[f,tt,yy];
	fyy = D[f,{yy,2}];
	ftp = D[f,tt,pp];
	fyp = D[f,yy,pp];
	fy  = D[f,yy];
	gtp = D[g,tt,pp];
	gyp = D[g,yy,pp];
	gpp = D[g,{pp,2}];
	gy  = D[g,yy];
	(Simplify[ftt + 2pp fty + pp^2 fyy] ===
	  Simplify[gtp + pp gyp - gy])         &&
	(Simplify[ftp + pp fyp + 2 fy]      ===
	  Simplify[gpp])
]

SecondOrderExact[eq_,y_,t_,const_Symbol] :=
	Module[{F,Fp,yy=y,tt=t,p,pp,n,f,g,r,u,tmp},
		If[SecondOrderExactQ[eq,y,t],
			F = ExpandAll[First[eq] - Last[eq]];
			If[Head[y] =!= Symbol,yy = Head[y]];
			Fp = F /. D[yy[t],{t,n_}] :> D[p[t],{t,n-1}];
			f = Coefficient[Fp,p'[t]];
			g = Fp - f p'[t];
			f = f /. {yy[t] -> yy, p[t] -> pp};
			g = g /. {yy[t] -> yy, p[t] -> pp};
			tmp = Integrate[f,pp];
			r = g - D[tmp,t] - pp D[tmp,yy];
			u = r /. pp -> 0;
			r = Integrate[D[r,pp],y];
			tmp = tmp + r + Integrate[u - D[r,t],t] == 
			  const[1] /. {yy -> yy[t] , pp -> yy'[t]};
			If[FreeQ[tmp,Derivative],
				y == Last[tmp] - First[tmp],
				tmp
			],
			Print[eq," is not Second-Order Exact."]
		]
	]

Transformation[eq_,{newiv_,t_ -> newivfun_,y_[t_] -> newdvfun_}] :=
	Module[{tmp},
		If[FreeQ[y,Derivative],
			If[D[newivfun,newiv] === 0,
				tmp = Simplify[eq /. y[t] -> (newdvfun /. t -> newivfun) /. 
					Derivative[i_][y][t] :> Nest[(D[#,newiv]&),
						(newdvfun /. t -> newivfun),i] /. t -> newivfun],
				tmp = Simplify[eq /. y[t] -> (newdvfun /. t -> newivfun) /. 
					Derivative[i_][y][t] :> 
						Nest[(1/D[newivfun,newiv] D[#,newiv]&),
						(newdvfun /. t -> newivfun),i] /. t -> newivfun]
			],
			tmp = Simplify[eq /. y[t] -> (newdvfun /. t -> newivfun) /. 
				Derivative[i_][First[y]][t] :> 
					Nest[D[#,newiv]&,(newdvfun /. t -> newivfun),i-1] /. 
					y[t] -> (newdvfun /. t -> newivfun)]
		];
		reduce[First[tmp]-Last[tmp]] == 0
	]

(* Example using the polar transformation

eqt = Transformation[y'[t] == -2t y[t]/((t^2+y[t]^2)^2+y[t]^2-t^2),
	{s,t->r[s] Cos[s],y[t]-> r[s] Sin[s]}]

Transformation[eqt,{t,s->ArcTan[y[t]/t],r[s] -> Sqrt[t^2+y[t]^2]}]

*)

reduce[expr_] :=
	Module[{F=expr},
		F = Factor[Together[Simplify[PowerExpand[F/.inversetrig]]]];
		If[Head[F] === Times,
			F = Map[If[FreeQ[#,Derivative[_][_],Infinity],1,#]&,F]
		];
		If[F =!= 1,
			F,
			expr
		]
	]

inversetrig = {
		Cos[ArcSin[wz_]]^mz_. :> (1-wz^2)^(mz/2),
		Cos[ArcTan[wz_]]^mz_. :> 1/(1+wz^2)^(mz/2),
		Sec[ArcCos[wz_]]^mz_. :> wz^(-mz),
		Sec[ArcSin[wz_]]^mz_. :> (1-wz^2)^(-mz/2),
		Sec[ArcTan[wz_]]^mz_. :> (1+wz^2)^(mz/2),
		Sin[ArcCos[wz_]]^mz_. :> (1-wz^2)^(mz/2),
		Sin[ArcTan[wz_]]^mz_. :> wz^mz/(1+wz^2)^(mz/2),
		Csc[ArcSin[wz_]]^mz_. :> wz^(-mz),
		Csc[ArcCos[wz_]]^mz_. :> (1-wz^2)^(-mz/2),
		Csc[ArcTan[wz_]]^mz_. :> (1+wz^2)^(mz/2)/wz^mz,
		Tan[ArcSin[wz_]]^mz_. :> wz^mz/(1-wz^2)^(mz/2),
		Tan[ArcCos[wz_]]^mz_. :> (1-wz^2)^(mz/2)/wz^mz,
		Cot[ArcCos[wz_]]^mz_. :> wz^mz/(1-wz^2)^(mz/2),
		Cot[ArcSin[wz_]]^mz_. :> (1-wz^2)^(mz/2)/wz^mz,
		ArcTan[Tan[wz_]]^mz_. :> wz^mz
	}

SecondOrderLinearToConstantsQ[a_,b_,c_][t_] :=
	Module[{p,q},
	    p = b[t]/a[t];
        q = c[t]/a[t];
		If[q === 0,
			False,
			FreeQ[PowerExpand[Simplify[(Dt[q,t] + 2p q)/q^(3/2)]],t]
		] 
	]

SecondOrderLinearToConstants[a_,b_,c_,d_,const_Symbol][t_] :=
    Module[{p,q,r,nu,y1,y2,tmp,ls,sol,y},
    	p = b[t]/a[t];
    	q = c[t]/a[t];
		If[q === 0,
			Print["This equation cannot be taken to",
				" one with constant coefficients."];
			Return[]
		];
		nu = Simplify[((D[q,t] + 2p q)/(4 q^(3/2)))^2-1];
		tmp = Simplify[Integrate[Sqrt[q],t]];
		If[nu === 0,
			y1 = Exp[tmp];
			y2 = y1 Integrate[Exp[-Integrate[p,t]]/y1^2,t],
			If[nu > 0,
				y1 = Exp[(Sqrt[1+nu] + Sqrt[nu])tmp];
				y2 = Exp[(Sqrt[1+nu] - Sqrt[nu])tmp],
				If[!FreeQ[{a,b,c},Complex],
					y1 = Exp[(Sqrt[1+nu] + Sqrt[nu])tmp];
					y2 = Exp[(Sqrt[1+nu] - Sqrt[nu])tmp],
					y1 = Exp[-Sqrt[1+nu]tmp]Sin[Sqrt[-nu]tmp];
					y2 = Exp[-Sqrt[1+nu]tmp]Cos[Sqrt[-nu]tmp]
				]
			]
		];
        r = Function[t,Evaluate[d[t]/a[t] /. 
			Power[x_,Rational[y_,z_]] /; FreeQ[{x,y,z},t] -> w[x,y,z]]];
		ls = {y1,y2} /. Power[x_,Rational[y_,z_]] /; 
			FreeQ[{x,y,z},t] -> w[x,y,z];
		const[1] y1 + const[2] y2 + 
			ParticularSolution[y''[t] + p y'[t] + q y[t] == 
			r[t],y,t,Map[Function[t,#]&,ls],w] /.
			w[x_,y_,z_] -> Power[x,Rational[y,z]]
   ]

RiccatiToSecondOrderLinear[eq_,y_,t_] :=
	Module[{F,aa,bb,cc,dd,ee,pow,yy=y,x},
		If[Head[y] =!= Symbol,yy = Head[y]];
		{F,aa,bb,cc,dd,ee,pow} = Parse[eq,yy,t];
		If[ee === 0 ,
			sol = False,
			Transformation[eq,{x,t->x,yy[t]->yy'[x]/
 				((ee /. t->x) yy[x])}] /. x -> t
		]	
	]

SecondOrderLinearToRiccati[eq_,y_,t_] :=
	Module[{yy=y,F,w},
		If[Head[y] =!= Symbol,yy = Head[y]];
		F = ExpandAll[First[eq] - Last[eq]];
		(Simplify[(F /. yy''[t] :> D[yy[t] w[t],t] /. 
			yy'[t] :> yy[t] w[t])/w[t]] /. w -> yy) == 0
	]

EquidimensionalInIndependentQ[eq_,y_,t_] :=
	Module[{F,G,yy=y,a,x},
		If[Head[y] =!= Symbol,yy = Head[y]];
		F = ExpandAll[First[eq] - Last[eq]];
		G = ExpandAll[First[Transformation[eq,{x,t->a x,yy[t]->yy[x]}]]] /. 
			x -> t;
		F === G || F === -G
	]

EquidimensionalInIndependent[eq_,y_,t_] :=
	Module[{x,yy=y},
		If[EquidimensionalInIndependentQ[eq,y,t],
			If[Head[y] =!= Symbol,yy = Head[y]];
			Transformation[eq,{x,t->Exp[x],yy[t]->yy[x]}] /. x -> t,
			Print[eq," is not equidimensional in ",t]
		]
	]

EquidimensionalInDependentQ[eq_,y_,t_] :=
	Module[{F,G,yy=y,a},
		If[Head[y] =!= Symbol,yy = Head[y]];
		F = ExpandAll[First[eq] - Last[eq]];
		G = First[Transformation[eq,{x,t->x,yy[t]->a yy[x]}]] /. x -> t;
		F ===  Together[G/a^Exponent[G,a]] ||
		F === -Together[G/a^Exponent[G,a]]
	]

EquidimensionalInDependent[eq_,y_,t_,u_] :=
	Module[{yy=y},
		If[EquidimensionalInDependentQ[eq,y,t],
			If[Head[y] =!= Symbol,yy = Head[y]];
			Transformation[eq,{t,t->t,yy[t]->Exp[u[t]]}],
			Print[eq," is not equidimensional in ",y]
		]
	]

ImposeInitialValues[sol_,const_Symbol,conds_List][t_,y_] :=
	Module[{yy=y,tsol=sol,i,n,a,b,cset,acset,yset,eqs,tmp,
			t0=First[conds],ys=Rest[conds]},
		Off[General::dbyz];
		Off[Infinity::indet];
		Off[SeriesData::csa];
		Off[RowReduce::indet];
		If[Head[yy] === Symbol,yy=yy[t]];
		If[Head[tsol] =!= Equal && Head[tsol] =!= List,tsol = yy == tsol];
		cset = acset = Flatten[Table[const[i],{i,1,Length[conds]-1}]];
		yset = Table[D[yy,{t,n}] -> ys[[n+1]],{n,0,Length[ys]-1}];
		eqs = Flatten[Table[D[tsol,{t,n}] /. yset,{n,0,Length[ys]-1}]];
		tmp = Check[eqs /. t -> t0,"error"];
		If[tmp === "error",
			tmp = Check[Map[Limit[#,t -> t0]&,eqs,{2}],"error"]
		];
		If[FreeQ[tmp,Limit] && !FreeQ[tmp,Indeterminate],
			tsol = Flatten[Solve[sol,yy]] /. (a__ -> b_) -> a == b;
			If[FreeQ[tsol,Solve] && FreeQ[tsol,ToRules] && FreeQ[tsol,Root],
				yset = Join[yset,{t -> t0}];
				eqs = Flatten[Table[D[tsol,{t,n}] /. yset,{n,0,Length[ys]-1}]]
			],
		 	If[tmp === "error" || !FreeQ[tmp,Limit],
				eqs = eqs /. t -> t0 /. C[n_] DirectedInfinity[_] -> 0 C[n];
				tmp = Cases[eqs,C[n_] -> C[n],Infinity];
				acset = Complement[acset,tmp];
				If[acset =!= {},
					eqs = Union[eqs,
						Thread[Equal[Apply[Sequence,Map[Flatten,
							{acset,Table[0,{Length[acset]}]}]]]]]
				],
				eqs = tmp
			]
		];

		(* ImposeInitialValues - Part 2 *)
		If[clean[eqs] && clean[tmp],
			tmp = Flatten[Solve[eqs,cset]] /. 
					Integrate[_,a_] /; NumberQ[a] -> 0
		];

(* Replaced !clean[Union[eqs,tmp]] by (!clean[eqs] || !clean[tmp]) 041697 *)
		If[eqs =!= {True} && (!clean[eqs] || !clean[tmp]),
			noresolve = True;
			tsol = sol;
(* Added test for no solution 121397 *)
			If[FreeQ[tsol,const],Return[False]];
			ODEDialoguePrint["Can't resolve initial",
              " condition(s). ",eqs],
(* Fix to Simplify (ver3.0 ) bug 092598 & 021899 *)

			tsol = Simplify[sol /. Flatten[tmp]] /. 
				Integrate[a_,b_] :> Integrate[a /. t -> ODEs,{ODEs,t0,t}];

(*
			tsol = MapAt[Simplify[# /. Flatten[tmp]]&,Flatten[{sol}],{1,2}] /. 
				Integrate[a_,b_] :> Integrate[a /. t -> ODEs,{ODEs,t0,t}]
*)
		];
		On[General::dbyz];
		On[Infinity::indet];
		On[SeriesData::csa];
		On[RowReduce::indet];
		tsol
	]

(* Added FreeQ[exp,False] to following test 041597 *)
clean[exp_] := FreeQ[exp,Solve] && FreeQ[exp,ToRules] && FreeQ[exp,False] &&
		   	   FreeQ[exp,DirectedInfinity] && FreeQ[exp,ComplexInfinity] && 
		   	   FreeQ[exp,Indeterminate] && FreeQ[exp,Root]

ImposeInitialValuesSystem[sol_,const_Symbol,conds_List][t_,y_] :=
	Module[{yy=y,tsol=sol,i,n,a,b,cset,eqs,tmp,t0,aa,bb,cc},
		If[Head[yy] === Symbol,yy=yy[t]];
		If[Head[tsol] =!= Equal && Head[tsol] =!= List,tsol = yy == tsol];
		t0 = First[Flatten[conds /. (aa_[bb_] -> cc_) -> bb]];
		cset = Flatten[Table[const[i],{i,1,Length[conds]}]];
		eqs = Flatten[{sol}] /. t -> t0  /. Flatten[conds];
		tmp = Flatten[Solve[eqs,cset]] /. Integrate[_,a_] /; NumberQ[a] -> 0;
(* Replaced !clean[Union[eqs,tmp]] by (!clean[eqs] || !clean[tmp]) 041697 *)
		If[eqs =!= {True} && (!clean[eqs] || !clean[tmp]),
			noresolve = True;
			tsol = sol;
			ODEDialoguePrint["Can't resolve initial condition(s). ",eqs],
			tsol = Simplify[sol /. Flatten[tmp]] /. Integrate[a_,b_] :> 
					Integrate[a /. t -> ODEs,{ODEs,t0,t}]
		];
		tsol
	]

SolvableForIndependentQ[eq_,y_,t_] :=
	Module[{F,sol,yy=y,n},
		F = ExpandAll[First[eq] - Last[eq]];
		If[Head[y] =!= Symbol,yy = Head[y]];
		F = F /. 
			{yy[t] -> yy, D[yy[t],{t,n_}] :> Derivative[n][yy]};
		sol = Flatten[Solve[F == 0,t] /. 
			{yy -> yy[t], Derivative[n][yy] :> D[yy[t],{t,n_}]}];
		If[sol =!= {},
			First[First[sol]] === t,
			False
		]
	]

SolvableForIndependent[eq_,y_,t_,p_] :=
	Module[{aeq,tmp,yy=y,n},
		If[SolvableForIndependentQ[eq,y,t],
			If[Head[y] =!= Symbol,yy = Head[y]];
			aeq = eq /. D[yy[t],{t,n_}] :> Derivative[n][yy] /. y -> yy;
			tmp = Solve[aeq,t] /. Derivative[n_][yy] :> Derivative[n-1][p][yy];
			tmp = Simplify[1/p[yy] - D[Last[First[Flatten[tmp]]],yy]];
			reduce[tmp]==0,
			Print[eq," is not solvable for ",t]
		]
	]

SolvableForDependentQ[eq_,y_,t_] :=
	Module[{F,sol},
		F = ExpandAll[First[eq] - Last[eq]];
		sol = Flatten[Solve[F == 0,y]];
		If[sol =!= {},
			First[First[sol]] === y,
			False
		]
	]

SolvableForDependent[eq_,y_,t_,p_] :=
	Module[{aeq,tmp,yy=y,n},
		If[SolvableForDependentQ[eq,y,t],
			If[Head[y] =!= Symbol,yy = Head[y]];
			aeq = eq /. D[yy[t],{t,n_}] :> Derivative[n-1][p][t] /. y -> yy;
			tmp = Solve[aeq,yy];
			tmp = Simplify[p[t] - D[Last[First[Flatten[tmp]]],t]];
			reduce[tmp]==0,
			Print[eq," is not solvable for ",y]
		]
	]

AutonomousQ[eq_,y_,t_] :=
	Module[{tmp,x,yy=y},
		If[Head[y] =!= Symbol,yy = Head[y]];
		tmp  = Transformation[eq,{x,t->t,yy[t]->yy[x]}];
		FreeQ[tmp,t]
	]

Autonomous[eq_,y_,t_,p_] :=
	Module[{tmp,yy=y},
		If[AutonomousQ[eq,y,t],
			If[Head[y] =!= Symbol,yy = Head[y]];
			Transformation[eq,{t,t->t,yy'[t]->p[yy[t]]}] /. yy[t] -> yy,
			Print[eq," is not autonomous."]
		]
	]

DependentMissingQ[eq_,y_,t_] :=
	Module[{tmp,x,yy=y},
		If[Head[y] =!= Symbol,yy = Head[y]];
		FreeQ[eq,yy[t]]
	]

DependentMissing[eq_,y_,t_,p_] :=
	Module[{tmp,yy=y},
		If[Head[y] =!= Symbol,yy = Head[y]];
		If[DependentMissingQ[eq,yy,t],
			eq /. D[yy[t],{t,n_}] :> Derivative[n-1][p][t],
			Print[eq," is not free of ",y]
		]
	]

Trajectory[eq_,y_,t_,theta_] :=
	Module[{eqt,yy,tt,F},
		{eqt,yy,tt} = ConvertToY[eq,y,t];
		F = getmeq[eqt,tt,yy,yy'];
		If[F =!= False,
			F = Last[F]
		];
		y' == (F/Tan[theta] - 1)/(1/Tan[theta] + F)
	]

(************************* Series functions ************************)

Polynomial[t_,coef_,n_Integer?Positive] := 
		Sum[coef[i] t^i,{i,0,n}]

PowerSeries[t_,coef_,n_Integer?Positive] := 
		Polynomial[t,coef,n] + O[t]^(n+1)

FrobeniusSeries[t_,coef_,param_,n_Integer?Positive] := 
		t^param PowerSeries[t,coef,n]

Lowset[expr_,coef_,exporder_Integer,expmax_Integer] :=
  Module[{tx,i,sx={},found = -1}, 
    tx = Expand[Normal[expr]];  
    For[i = 0, i <= expmax, i++,
       If[FreeQ[tx,coef[i]],Null, found++];
       If[found >= exporder, Break[], AppendTo[sx,coef[i]]]
    ];
    sx
  ]

Highset[expr_,coef_,exporder_Integer,expmax_Integer] :=   
     Complement[Table[coef[i],{i,0,expmax}],
                Lowset[expr,coef,exporder,expmax]]
   
DEOrder[eq_,y_,t_] := 
	Max[0,Cases[Flatten[{eq}],Derivative[n_][_][_] -> n,Infinity]]

SeriesForm[eq_,y_,t_,const_Symbol,
							degree_Integer?Positive] :=           
  Module[{F,heq,yy=y,exporder,coeff,lims},
	If[Head[y] =!= Symbol, yy = Head[y]];
	F = ExpandAll[First[eq] - Last[eq]];
	heq = F - (F /. yy[t] -> 0 /. Derivative[_][yy][t] -> 0);
    If[(exporder = DEOrder[F,yy,t]) == 0, Return[0]]; 
    coeff = Coefficient[F,Derivative[exporder][yy][t]]; 
    If[coeff =!= 1 || !FreeQ[coeff,t], 
          F = ExpandAll[Apart[F/coeff]]
    ];
    coeff = Series[Table[Coefficient[F,Derivative[n][yy][t]],
		{n,exporder-1,0,-1}],{t,0,degree}];							
	lims = Map[Abs[Limit[#,t->0]]&,coeff];
    If[FreeQ[lims,Infinity] && FreeQ[lims,Indeterminate],
        Return[NonSingular[F == 0,yy,t,const,degree]]
    ] ;
	lims = Map[Abs[Limit[#,t->0]]&,coeff Table[t^n,{n,1,exporder}]];
	If[FreeQ[lims,Infinity] && FreeQ[lims,Indeterminate],
	     Return[Frobenius[coeff Table[t^n,{n,1,exporder}],
			heq == 0,yy,t,const,degree]],
		 Print["Nonremovable singularity."]
	] 
  ]
 
NonSingular[eq_,y_,t_,const_Symbol,
					expdegree_Integer?Positive] :=
  Module[{iexpr,expr,exporder,i,z,sol,yt,tt=t}, 
	iexpr = ExpandAll[First[eq] - Last[eq]];
    exporder = DEOrder[iexpr,y,t]; 
	expr = iexpr /. y -> yt;
    yt[tt_] = Sum[const[i] tt^i,{i,0,expdegree}] + O[tt]^(expdegree+1);
    z = yt[tt];
	sol = ExpandAll[Normal[First[z/.Solve[expr == 0,
          Highset[z,const,exporder,expdegree]]]]];
	If[!FreeQ[sol,const],
		expr = Select[sol,FreeQ[#,const]&],
		expr = 0
	];
	If[expr === {},expr = 0];
    sol = Collect[sol,Lowset[z,const,exporder,expdegree]];
    Sum[Collect[Coefficient[sol,const[i]],tt] const[i+1], 
           {i,0,(exporder-1)}] + expr
  ]

Frobenius[coeffs:{p_,q_:0,___},eq_,y_,t_,const_Symbol,
							expdegree_Integer?Positive]:=
  Module[{me,m1,m2,vals,expr,iexpr,orgexpr,temp,a,b,tsol,
			expr1,w,y1,y2,y2t,pp,ff,sol,yt,tt=t},
	 If[Length[coeffs] > 2,
			Print["Only second-order equations supported."];Return[]
	 ];
	 Off[Solve::svars];
	 Off[Series::sbyc];
	 Off[Power::infy];
	 Off[Infinity::indet];
	 vals = Flatten[Solve[me(me-1)+me 
		(Simplify[p]/.t->0)+(Simplify[q]/.t->0)==0,me]];
	 iexpr = ExpandAll[First[eq] - Last[eq]];
	 orgexpr = iexpr /. {y->w} ;
	 expr = Numerator[Together[iexpr]] /. y -> yt;
	 If[FreeQ[vals,Complex],
     	If[vals[[1,2]] > vals[[2,2]], 
       		temp = vals[[1]];
       		vals[[1]] = vals[[2]];
       		vals[[2]] = temp
     	] 
	 ];
	 m1 = Last[vals[[1]]];
	 m2 = Last[vals[[2]]];
	 If[Length[coeffs] == 1,
  	 	ODEDialoguePrint["Indicial root: ",vals[[1]] /. {me -> "m"}],
  	 	ODEDialoguePrint["Indicial roots: ",vals /. {me -> "m"}]
	 ];
     If[IntegerQ[m2 - m1] && Positive[m2 - m1] && expdegree <= m2-m1,
  	 	ODEDialoguePrint["Degree may not be sufficient to see true structure"]
	 ];

    (* Frobenius - Part 2 *)
	 If[!FreeQ[vals,Complex] && CauchyEulerQ[eq,y,t],
		a = Re[m2];
		b = Im[m2];
	 	On[Solve::svars];
	 	On[Series::sbyc];
	 	On[Power::infy];
	 	On[Infinity::indet];
		Return[const[1] t^a Cos[b Log[t]] + const[2] t^a Sin[b Log[t]]]
	 ];
	 	
    (* Frobenius - Part 3 *)
	 FrobSol[m_] := Block[{me,yt}, 
	 	If[Variables[m] =!= {},
	 		yt[tt_] = Sum[const[i] tt^(me+i),{i,0,expdegree}] + 
     		  O[tt]^(expdegree+1),
	 		yt[tt_] = Sum[const[i] tt^(me+i),{i,0,expdegree}] + 
     		  O[tt]^(expdegree+1) /. me -> m
	 	];
	 	tsol = Factor[Numerator[Together[Normal[ExpandAll[expr]]]]]; 
	 	If[Head[tsol] === Times,
			tsol = Drop[tsol,1]
	 	];
	 	tsol = Solve[Series[tsol,{tt,0,expdegree}] == 0,
			Highset[yt[tt],const,1,expdegree]];
		If[tsol === {},
	 		tsol = Solve[Series[tsol,{tt,0,expdegree-1}] == 0,
			  Highset[yt[tt],const,1,expdegree]]
		];
	 	If[!FreeQ[tsol,Solve],
			tsol = {}
	 	];
	 	y1 = Map[Factor,Normal[First[yt[tt] /. tsol]]];
	 	If[tsol =!= {},
			If[!FreeQ[y1,const],
	 			expr1 = Select[y1,FreeQ[#,const]&],
				expr1 = 0
			];
	 		If[expr1 === {},expr1 = 0];
     		y1 = (Coefficient[y1,const[0]]/.{const[0]->1}) + expr1
	 	];
	 	If[Variables[m] =!= {},
			y1 = y1 /. me -> m
	 	];
		y1
	 ];															
	
    (* Frobenius - Part 4 *)
	 y2 = FrobSol[m2];
	 On[Solve::svars];
	 On[Series::sbyc];
	 On[Power::infy];
	 On[Infinity::indet];
     If[!IntegerQ[m2 - m1],										
	    const[1] FrobSol[m1] +  const[2] y2,
		pp[tt_] = p/t /. t -> tt;
		ff[tt_] = Series[(y2 /. t -> tt),{tt,0,expdegree}];
		y2t = Collect[Normal[ReductionOfOrder[1&,pp,ff][t]],Log[t]];
		If[Length[coeffs] == 1, y2t = 0];
		const[1] y2 +  const[2] Collect[ExpandAll[y2t],Log[t]]
     ]
  ]

SeriesFormCauchy[eq_,y_,t_,const_Symbol,
					degree_Integer?Positive] :=           
	Module[{r,F,yy=y,exporder,coeff,scoeff,lims},
		If[Head[y] =!= Symbol, yy = Head[y]];
		F = ExpandAll[First[eq] - Last[eq]];
		r = -F /. yy[t] -> 0 /. Derivative[_][yy][t] -> 0;
		If[(exporder = DEOrder[F,yy,t]) == 0, Return[0]]; 
		coeff = Coefficient[F,Derivative[exporder][yy][t]]; 
		If[coeff =!= 1 || !FreeQ[coeff,t], 
			F = ExpandAll[Apart[F/coeff]]
		];
    	coeff = Table[Coefficient[F,Derivative[n][yy][t]],
			{n,exporder-1,0,-1}];					
    	scoeff = Series[Table[Coefficient[F,Derivative[n][yy][t]],
			{n,exporder-1,0,-1}],{t,0,degree}];							
		lims = Map[Abs[Limit[#,t->0]]&,scoeff];
		If[FreeQ[lims,Infinity] && FreeQ[lims,Indeterminate],
			Return[NonSingularCauchy[coeff,r,yy,t,const,degree]]
		] ;
		lims = Map[Abs[Limit[#,t->0]]&,scoeff Table[t^n,{n,1,exporder}]];
		If[FreeQ[lims,Infinity] && FreeQ[lims,Indeterminate],
			Return[SingularCauchy[coeff 
				Table[t^n,{n,1,exporder}],r,yy,t,const,degree]],
			Print["Nonremovable singularity."]
		] 
	]

NonSingularCauchy[coeffs:{__},r_,y_,t_,const_Symbol,
						expdegree_Integer?Positive] :=
	Module[{ps,rs,sc,cy,s,n=Length[coeffs],k},
		Evaluate[Table[ps[k],{k,n-1,0,-1}]] = 
			Map[Series[#,{t,0,expdegree}]&,coeffs];
		rs = Series[r,{t,0,expdegree}];
		sc[s_,n_] := sc[s,n] = n! Coefficient[s,t,n];
		Table[cy[n,k-n] = cy[k] = const[k+1],{k,0,n-1}];
		cy[n_,s_] := cy[n+s] = sc[rs,s] - Sum[Sum[Binomial[s,k]sc[ps[n-1-m],k] 
			cy[n-1-m-k+s],{k,0,s}],{m,0,n-1}];
		Collect[Table[cy[n,k],{k,-n,expdegree-n}].
			Table[t^k/k!,{k,0,expdegree}],Table[const[k+1],{k,0,n-1}]]
	]

SingularCauchy[coeffs:{p_,q_:0,___},r_,y_,t_,
			const_Symbol,expdegree_Integer?Positive] :=
	Module[{eq,yt,ps,qs,rs,sc,cz,cd,me,tmp,a,b,
		vals,m1,m2,y1,y2,s,k,pp,ff,tt=t,maxdeg},
		If[Length[coeffs] > 2,
			Print["Only second-order equations supported."];Return[]
		];
		Off[Solve::svars];
		Off[Series::sbyc];
		Off[Power::infy];
		Off[Infinity::indet];
	 	vals = Flatten[Solve[me(me-1)+me 
			(Simplify[p]/.t->0)+(Simplify[q]/.t->0)==0,me]];
	 	If[FreeQ[vals,Complex],
     		If[vals[[1,2]] > vals[[2,2]], 
       			tmp = vals[[1]];
       			vals[[1]] = vals[[2]];
       			vals[[2]] = tmp
     		] 
	 	];
		m1 = Last[vals[[1]]];
		m2 = Last[vals[[2]]];
		If[Length[coeffs] == 1,
			ODEDialoguePrint["Indicial root: ",vals[[1]] /. {me -> "m"}],
			ODEDialoguePrint["Indicial roots: ",vals /. {me -> "m"}]
		];
     	If[IntegerQ[m2 - m1] && Positive[m2 - m1] && expdegree <= m2-m1,
  	 	 ODEDialoguePrint["Degree may not be sufficient to see true structure"]
	 	];
		If[!FreeQ[vals,Complex] && 
			CauchyEulerQ[y''[t] + p/t y'[t] + q/t^2 y[t] == 0,y,t],
			a = Re[m2];
			b = Im[m2];
	 		On[Solve::svars];
	 		On[Series::sbyc];
	 		On[Power::infy];
	 		On[Infinity::indet];
			Return[const[1] t^a Cos[b Log[t]] + const[2] t^a Sin[b Log[t]]]
		];

    	(* SingularCauchy - Part 2 *)
		ps = Series[p,{t,0,expdegree}];
		qs = Series[q,{t,0,expdegree}];
		rs = Series[r,{t,0,expdegree}];
		sc[s_,n_] := sc[s,n] = n! Coefficient[s,t,n];
		CauchyFrobSol[m_] := Block[{cz},
			If[m >= 0, maxdeg = Ceiling[expdegree - m], 
				maxdeg = expdegree,maxdeg = expdegree]; 
			cz[0] = 1;
			cz[1] = -(m sc[ps,1] + sc[qs,1])cz[0]/(2 m + sc[ps,0]);
			cz[n_] := cz[n] = -Sum[Binomial[n,k]
				((n-k)sc[ps,k] + m sc[ps,k] + sc[qs,k]) cz[n-k],
				{k,1,n}]/(n(n-1+2 m+sc[ps,0]));
			Table[cz[k],{k,0,maxdeg}].Table[t^(k+m)/k!,
				{k,0,maxdeg}]
		];															

    	(* SingularCauchy - Part 3 *)
		If[m1 === m2 || Length[coeffs] == 1,
			y1 = CauchyFrobSol[m1];
			Clear[cz,cd];
			If[m1 >= 0, maxdeg = Ceiling[expdegree - m1], 
				maxdeg = expdegree,maxdeg = expdegree]; 
			cz[0] = 1;
			cz[1] = -(m1 sc[ps,1] + sc[qs,1])cz[0]/(2 m1 + sc[ps,0]);
			cz[n_] := cz[n] = -Sum[Binomial[n,k]
				((n-k)sc[ps,k] + m1 sc[ps,k] + sc[qs,k]) cz[n-k],
				{k,1,n}]/(n(n-1+2 m1+sc[ps,0]));
			cd[0] = 0;
			cd[1] = -2cz[1] - sc[ps,1] cz[0];
			cd[n_] := cd[n] = (-(2n-1) cz[n] -
				Sum[Binomial[n,k] If[k==0,1,sc[ps,k]] cz[n-k],{k,0,n}] -
				Sum[Binomial[n,k] (n-k+1) sc[ps,k-1] cd[n-k+1],{k,2,n}] -
				Sum[Binomial[n,k] sc[qs,k] cd[n-k],{k,1,n-1}])/n^2;
			If[Length[coeffs] == 1, 
				y2 = 0,
				y2 = Log[t] Table[cz[k],{k,0,maxdeg}].Table[t^(k+m1)/k!,
				{k,0,maxdeg}] +
				Table[cd[k],{k,1,maxdeg}].Table[t^(k+m1)/k!,{k,1,maxdeg}]
			]
		];
		If[!IntegerQ[m2 - m1],
			y1 = CauchyFrobSol[m1];
			y2 = CauchyFrobSol[m2]
		];
		If[IntegerQ[m2 - m1] && Positive[m2 - m1],
			y1 = CauchyFrobSol[m2];
			pp[tt_] = p/t /. t -> tt;
			ff[tt_] = Series[(y1 /. t -> tt),{tt,0,expdegree}];
			y2 = Collect[Normal[
				ReductionOfOrder[1&,pp,ff][t]],Log[t]]
		];
	 	On[Solve::svars];
	 	On[Series::sbyc];
	 	On[Power::infy];
	 	On[Infinity::indet];
		const[1] y1 + const[2] y2
	]

(************************* Numerical routines ************************)

nrules[x_List,y_List] :=
	Apply[Rule,#]& /@ Thread[List[Sequence @@ Flatten /@ {x,y}]]

TaylorSeries[f_,{t0_,Y0_},terms_,params_][t_,y_] :=
	Module[{c,v,n},
		If[params =!= None,
			SetAttributes[Evaluate[Variables[params]],Constant]
		];
		c = Join[{Y0},NestList[Dt[#,t] /. 
		  Dt[y,t] -> f[t,y]&,f[t,y],terms-1] /. 
		  nrules[{t,y},{t0,Y0}]];
		v = Table[(t-t0)^n/n!,{n,0,terms}];
		If[!NumberQ[Y0],
			Collect[c.v,Y0],
			c.v
		]
	]

Picard[f_,{t0_,Y0_},iterations_][t_] :=
	Module[{s,y,nn,tt,i,sol},
		y[0,s_] := Y0;
		y[nn_Integer?Positive,tt_] := Y0 + 
			Integrate[f[s,y[nn-1,s]],{s,t0,tt}];
		If[Head[iterations] =!= List,
			sol = Table[y[i,t],{i,0,iterations}],
			sol = y[First[iterations],t]
		];
		If[!NumberQ[Y0],
			Collect[sol,Y0],
			sol
		]
	]

Euler[f_,{t0_,Y0_},h_,steps_][t_,y_] :=
        NestList[emstep[f,{t,y},#,h]&,{t0,Y0},steps]

emstep[f_,{t_,y_},{tn_,yn_},h_] := 
        Module[{fn},
            fn = f /. nrules[{t,y},{tn,yn}];
            {tn + h,yn + h fn}
    ]

Heun[f_,{t0_,Y0_},h_,steps_][t_,y_] :=
        NestList[hmstep[f,{t,y},#,h]&,{t0,Y0},steps]

hmstep[f_,{t_,y_},{tn_,yn_},h_] :=
        Module[{ypn,ysnp1},
            ypn   = f /. nrules[{t,y},{tn,yn}];
            ysnp1 = f /. nrules[{t,y},{tn + h,yn + h ypn}];
            {tn + h,yn + h(ypn + ysnp1)/two}
        ]

SecondOrderEuler[f_,{t0_,Y0_},h_,steps_][t_,y_] :=
	Module[{yy=Flatten[{y}],d,ft=D[f,t],fy},
		fy = Map[Function[Evaluate[MapThread[d,
		  {Table[#,{Length[yy]}],yy}]]] /. d -> D,f];
        NestList[soemstep[f,ft,fy,{t,y},#,h]&,{t0,Y0},steps]
	]

soemstep[f_,ft_,fy_,{t_,y_},{tn_,yn_},h_] :=
        Module[{ypn,yppn},
            ypn  = f /. nrules[{t,y},{tn,yn}];
            yppn = ft + First[Map[Apply[Plus,#]&,
				fy Table[ypn,{Length[Flatten[{y}]]}]]] /.
				nrules[{t,y},{tn,yn}];
            {tn + h,yn + h ypn + h^2 yppn/two}
        ]

RungeKutta4[f_,{t0_,Y0_},h_,steps_][t_,y_] :=
        NestList[rkmstep[f,{t,y},#,h]&,{t0,Y0},steps]

rkmstep[f_,{t_,y_},{tn_,yn_},h_] :=
        Module[{k1,k2,k3,k4},
            k1 = f /. nrules[{t,y},{tn,yn}];
            k2 = f /. nrules[{t,y},{tn + h/two,yn + h/two*k1}];
            k3 = f /. nrules[{t,y},{tn + h/two,yn + h/two*k2}];
            k4 = f /. nrules[{t,y},{tn + h,yn + h*k3}];
            {tn + h,yn + h(k1 + two k2 + two k3 + k4)/six}
    ]

RungeKutta45[f_,{t0_,Y0_},h_,steps_][t_,y_] :=
        NestList[rk45mstep[f,{t,y},#,h]&,{t0,Y0},steps]

rk45mstep[f_,{t_,y_},{tn_,yn_},h_] :=
        Module[{k1,k2,k3,k4,k5,k6,k7},
            k1 = f /. nrules[{t,y},{tn,yn}];
            k2 = f /. nrules[{t,y},{tn + (1/5)*h,yn + h*(1/5)*k1}];
            k3 = f /. nrules[{t,y},{tn + (3/10)*h,yn +
				 h*((3/40)*k1+(9/40)*k2)}];
            k4 = f /. nrules[{t,y},{tn + (4/5)*h,yn +
				 h*((44/45)*k1-(56/15)*k2+(32/9)*k3)}];
            k5 = f /. nrules[{t,y},{tn + (8/9)*h,yn +
		 		h*((19372/6561)*k1-(25360/2187)*k2 +
				(64448/6561)*k3-(212/729)*k4)}];
            k6 = f /. nrules[{t,y},{tn + h,yn +
		 		h*((9017/3168)*k1-(355/33)*k2+(46732/5247)*k3 +
				(49/176)*k4-(5103/18656)*k5)}];
            k7 = f /. nrules[{t,y},{tn + h,yn +
	 			h*((35/384)*k1+(500/1113)*k3+(125/192)*k4 -
				(2187/6784)*k5+(11/84)*k6)}];
			yhat = {{tn,{tn,tn}},{tn + h,yn + h*((35/384)*k1+(500/1113)*k3+
				(125/192)*k4 - (2187/6784)*k5+(11/84)*k6)}};
            {tn + h,yn + h((5179/57600)*k1 + (7571/16695)*k3 + 
				(393/640)*k4 - (92097/339200)*k5 + (187/2100)*k6 + k7/40)}
    ]

AdamsBashforth[f_,{t0_,Y0_},h_,steps_][t_,y_] :=
        Module[{y1,y2,y3,yy1,yy2,yy3,tmp,sol},
            tmp = RungeKutta4[f,{t0,Y0},h,3][t,y];
            yy1 = Last[First[Drop[tmp,1]]];
            yy2 = Last[First[Drop[tmp,2]]];
            yy3 = Last[First[Drop[tmp,3]]];
            sol = {{t0,Y0},{t0 + h,yy1},{t0 + two h,yy2}};
            tmp = NestList[abmstep[f,{t,y,y1,y2,y3},#,h]&,
              {t0 + three h,Y0,yy1,yy2,yy3},steps - 3];
            tmp = Union[sol,Map[{First[#],Last[#]}&,tmp]];
			If[Length[Flatten[{f}]] == 1,
				tmp = Map[Flatten,tmp]
			];
			tmp
        ]

abmstep[f_,{t_,y_,y1_,y2_,y3_},{tn_,ynm3_,ynm2_,ynm1_,yn_},h_] :=
        Module[{ypn,ypnm1,ypnm2,ypnm3,ysnp1,ypnp1},
            ypn   = f /. nrules[{t,y},{tn,yn}];
            ypnm1 = f /. nrules[{t,y},{tn - h,ynm1}];
            ypnm2 = f /. nrules[{t,y},{tn - two h,ynm2}];
            ypnm3 = f /. nrules[{t,y},{tn - three h,ynm3}];
			ysnp1 = yn + h ac1.{ypn,ypnm1,ypnm2,ypnm3};
            ypnp1 = f /. nrules[{t,y},{tn + h,ysnp1}];
            {tn + h,ynm2,ynm1,yn,yn + 
              h ac2.{ypnp1,ypn,ypnm1,ypnm2}}
        ]

Milne[f_,{t0_,Y0_},h_,steps_][t_,y_] :=
        Module[{y1,y2,y3,yy1,yy2,yy3,tmp,sol},
            tmp = RungeKutta4[f,{t0,Y0},h,3][t,y];
            yy1 = Last[First[Drop[tmp,1]]];
            yy2 = Last[First[Drop[tmp,2]]];
            yy3 = Last[First[Drop[tmp,3]]];
            sol = {{t0,Y0},{t0 + h,yy1},{t0 + two h,yy2}};
            tmp = NestList[mmstep[f,{t,y,y1,y2,y3},#,h]&,
              {t0 + three h,Y0,yy1,yy2,yy3},steps - 3];
            tmp = Union[sol,Map[{First[#],Last[#]}&,tmp]];
			If[Length[Flatten[{f}]] == 1,
				tmp = Map[Flatten,tmp]
			];
			tmp
        ]

mmstep[f_,{t_,y_,y1_,y2_,y3_},{tn_,ynm3_,ynm2_,ynm1_,yn_},h_] :=
		Module[{ypn,ypnm1,ypnm2,ysnp1,ypnp1},
            ypn   = f /. nrules[{t,y},{tn,yn}];
            ypnm1 = f /. nrules[{t,y},{tn - h,ynm1}];
            ypnm2 = f /. nrules[{t,y},{tn - two h,ynm2}];
			ysnp1 = ynm3 + h mc1.{ypn,ypnm1,ypnm2};
            ypnp1 = f /. nrules[{t,y},{tn + h,ysnp1}];
            {tn + h,ynm2,ynm1,yn,ynm1 + 
              h mc2.{ypnp1,ypn,ypnm1}}
        ]

ImplicitEuler[f_,{t0_,Y0_},h_,steps_][t_,y_] :=
   NestList[iestep[f,{t,y},#,h]&,{t0,Y0},steps]

iestep[f_,{t_,y_},{tn_,yn_},h_] :=
	Module[{k1,k2,iter,oldk,change,oldchange},
        k1 = f /. nrules[{t,y},{tn,yn}];
        k2 = oldk = yn + h k1;
		change = 10 tolerance;
		iter = 0;
		While[(change > tolerance) && (iter < maxsteps),
			k2 = yn + h/two (k1 + f /. nrules[{t,y},{tn + h,k2}]);
			change = L2norm[Flatten[{yn}],Flatten[{k2}],Flatten[{oldk}]];
			If[change > oldchange && iter > 1,
				If[varstepsize,
					k2 = Table[Indeterminate,{Length[Flatten[{yn}]]}],
					Message[ODE::ieunstable]
				];
				Break[]
			];
			oldk = k2;
			oldchange = change;
			iter = iter + 1;
		];
		If[iter >= maxsteps,
			Message[ODE::iefail];Return[]];
		{tn + h,k2}
    ]

ImplicitRungeKutta[f_,{t0_,Y0_},h_,steps_][t_,y_] :=
   NestList[irkmstep[f,{t,y},#,h]&,{t0,Y0},steps]

irkmstep[f_,{t_,y_},{tn_,yn_},h_] :=
	Module[{k1,k2,k3,iter,oldk,change,oldchange,ynew},
		k1 = f /. nrules[{t,y},{tn,yn}];
		k2 = (k1 + f /. nrules[{t,y},{tn + h/two,yn + h/two*k1}])/two;
		k3 = f /. nrules[{t,y},{tn + h,yn + h*k2}];
		ynew = oldk = yn + h(k1 + four k2 + k3)/six;
		change = 10 tolerance;
		iter = 0;
		While[(change > tolerance) && (iter < maxsteps),
			k2 = f /. nrules[{t,y},{tn + h/two,yn + (h/four)*(k1 + k2)}];
			k3 = f /. nrules[{t,y},{tn + h,yn + h*k2}];
			ynew = yn + h(k1 + four k2 + k3)/six;
			change = L2norm[Flatten[{yn}], Flatten[{ynew}],Flatten[{oldk}]];
			If[change > oldchange && iter > 1,
				If[varstepsize,
					ynew = Table[Indeterminate,{Length[Flatten[{yn}]]}],
					Message[ODE::irkunstable]
				];
				Break[]
			];
			oldk = ynew;
			oldchange = change;
			iter = iter + 1
		];
		If[iter >= maxsteps,
			Message[ODE::irkfail];Return[]];
		{tn + h,ynew}
    ]

L2norm[y_, y1_, y2_] := 
   Sqrt[Sum[((y2[[i]]-y1[[i]])/Max[Abs[y[[i]]],Abs[y1[[i]]],1])^2, {i,Length[y]}]/Length[y]]

BulirschStoer[f_,{t0_,Y0_},h_,steps_,m_][t_,y_] :=
	Module[{c},
		c[i_] := If[i == 1 || i == m + 1,1,2];
        NestList[bsmstep[f,{t,y},#,h,m,c]&,{t0,Y0},steps]
	]

bsmstep[f_,{t_,y_},{tn_,yn_},h_,m_,c_] :=
    Module[{k=h/m,z,i},
			z[-1] = z[0] = yn;
			Do[
            	z[i]  = z[i-2] + c[i] k f /. 
					nrules[{t,y},{tn + (i-1) k,z[i-1]}],
				{i,1,m+1}
			];
            {tn + h,(z[m] + z[m+1])/two}
	]

Numerov[f_,g_,{t0_,Y0_,Y1_},h_,steps_][t_,y_]:=
	Module[{tt,ff,gg,z0,z1,tmp,z,zsol},
        ff[tt_,n_] := f /. t -> tt + n h;
        gg[tt_,n_] := g /. t -> tt + n h;
        z0 = Y0(1 - (h^2/12)ff[t0,0]);
        z1 = (1 - (h^2/12)ff[t0,1])(Y0 + h Y1);
        tmp = Table[{1,1/((1 - (h^2/12)ff[t0,k]))},
           {k,0,steps}];
        zsol = NestList[nmstep[ff,gg,{t,z},#,h]&,
           {t0,z0,z1},steps];
        Simplify[Map[Drop[#,{3}]&,zsol] tmp]]

nmstep[f_,g_,{t_,z_},{tn_,zn_,znp1_},h_]:= 
        Module[{wnp1},
            wnp1 = h^2 f[tn,1]/(1 - (h^2/12)f[tn,1]);
            {tn + h,znp1,(2+wnp1)znp1 - zn +
			  (h^2/12)(g[tn,2] + 10g[tn,1] + g[tn,0])}]

VariableStepSize[f_,g_,{t0_,Y0_,Y1_:0},final_,method_,order_,
	initialstepsize_,maxstepsize_,steps_][t_,y_] :=
		Module[{h,hnew,hmax,y1,y2,sol,err,sgn=1,test,ym,bsndx=1,
			tt,yy1,yy2,yy3,yy4,ypn,ypnm1,ypnm2,ysnp1,ypnp1,
			tnm1,tnm2,tnm3,yn,ynm1,ynm2,ynm3,stepchange=True,
			bsorder = {2,4,6,8,12,16,24,32,48,64,96},
			x = N[t0,precision],
			z = z1 = N[Y0,precision],
			z2 = N[Y1,precision],
			xn = tn = N[final,precision],
	    	tenth = N[1/10,precision], 
	    	ninetenth = N[9/10,precision]},
			If[maxstepsize === Automatic,
				hmax = xn - x,
				hmax = N[maxstepsize,precision]
			];
			If[initialstepsize < 0 ,
				sgn = -1
			];
			If[initialstepsize === Automatic || method === BulirschStoer,
				h = hmax,
				h = N[initialstepsize,precision]
			];
			If[method === Milne || method === AdamsBashforth,
				sol = {},
				sol = {{x,z}}
			];
			If[sgn > 0 , test = x < xn , test = x > xn];
			While[test,
				If[Abs[h] < 10^(10-precision),
	    			Print["Step size too small: h = ",h];
					Break[]
				];
				If[sgn > 0,
	  				If[x + h - xn > 0, h = xn - x],
	  				If[x + h - xn < 0, h = xn - x]
				];
				Switch[method,
					Euler,
						y1 = Euler[f,{x,z},h,1][t,y];
						y2 = Euler[f,{x,z},h/2,2][t,y],
					Heun,
						y1 = Heun[f,{x,z},h,1][t,y];
						y2 = Heun[f,{x,z},h/2,2][t,y],
					RungeKutta4,
						y1 = RungeKutta4[f,{x,z},h,1][t,y];
						y2 = RungeKutta4[f,{x,z},h/2,2][t,y],
					RungeKutta45,
						y1 = RungeKutta45[f,{x,z},h,1][t,y];
						y2 = yhat,
					SecondOrderEuler,
						y1 = SecondOrderEuler[f,{x,z},h,1][t,y];
						If[y1 === {}, Return[{}]];
						y2 = SecondOrderEuler[f,{x,z},h/2,2][t,y],
					Milne,
						If[stepchange,
							If[sgn > 0,
	  							If[x + 4h - xn > 0, h = (xn - x)/4],
	  							If[x + 4h - xn < 0, h = (xn - x)/4]
							];
							y1 = ym = Milne[f,{x,z},h,4][t,y];
							If[x != N[t0,precision],
								ym = Drop[ym,sgn]
							];
							If[sgn > 0 ,
								tn   = x + 4h;
								yn   = y1[[5,2]];
								tnm1 = x + 3h;
								ynm1 = y1[[4,2]];
								tnm2 = x + 2h;
								ynm2 = y1[[3,2]];
								tnm3 = x + h;
								ynm3 = y1[[2,2]],
								tn   = x + 4h;
								yn   = y1[[1,2]];
								tnm1 = x + 3h;
								ynm1 = y1[[2,2]];
								tnm2 = x + 2h;
								ynm2 = y1[[3,2]];
								tnm3 = x + h;
								ynm3 = y1[[4,2]]
							];
							y2 = Milne[f,{x,z},h/2,8][t,y],
            				ypn   = f /. nrules[{t,y},{tn,yn}];
            				ypnm1 = f /. nrules[{t,y},{tnm1,ynm1}];
           					ypnm2 = f /. nrules[{t,y},{tnm2,ynm2}];
            				ysnp1 = ynm3 + h mc1.{ypn,ypnm1,ypnm2};
							y1 = ym = {{tn + h,ysnp1}};
            				ypnp1 = f /. nrules[{t,y},{tn + h,ysnp1}];
							y2 = {{tn + h,ynm1 + h mc2.{ypnp1,ypn,ypnm1}}}
						],
					AdamsBashforth,
						If[stepchange,
							If[sgn > 0,
	  							If[x + 4h - xn > 0, h = (xn - x)/4],
	  							If[x + 4h - xn < 0, h = (xn - x)/4]
							];
							y1 = ym = AdamsBashforth[f,{x,z},h,4][t,y];
							If[x != N[t0,precision],
								ym = Drop[ym,sgn]
							];
							If[sgn > 0 ,
								tn   = x + 4h;
								yn   = y1[[5,2]];
								tnm1 = x + 3h;
								ynm1 = y1[[4,2]];
								tnm2 = x + 2h;
								ynm2 = y1[[3,2]];
								tnm3 = x + h;
								ynm3 = y1[[2,2]],
								tn   = x + 4h;
								yn   = y1[[1,2]];
								tnm1 = x + 3h;
								ynm1 = y1[[2,2]];
								tnm2 = x + 2h;
								ynm2 = y1[[3,2]];
								tnm3 = x + h;
								ynm3 = y1[[4,2]]
							];
							y2 = AdamsBashforth[f,{x,z},h/2,8][t,y],
            				ypn   = f /. nrules[{t,y},{tn,yn}];
            				ypnm1 = f /. nrules[{t,y},{tnm1,ynm1}];
           					ypnm2 = f /. nrules[{t,y},{tnm2,ynm2}];
            				ypnm3 = f /. nrules[{t,y},{tnm3,ynm3}];
            				ysnp1 = yn + h ac1.{ypn,ypnm1,ypnm2,ypnm3};
 							y1 = ym = {{tn + h,ysnp1}};
           					ypnp1 = f /. nrules[{t,y},{tn + h,ysnp1}];
							y2 =  {{tn + h,yn + h ac2.{ypnp1,ypn,ypnm1,ypnm2}}}
						],
					BulirschStoer,
					   y1 = BulirschStoer[f,{x,z},h,1,bsorder[[bsndx]]][t,y];
					   y2 = BulirschStoer[f,{x,z},h,1,bsorder[[bsndx+1]]][t,y],
					ImplicitEuler,
						y1 = ImplicitEuler[f,{x,z},h,1][t,y];
						If[FreeQ[y1,Indeterminate],
							y2 = ImplicitEuler[f,{x,z},h/2,2][t,y],
							y2 = y1
						],
					ImplicitRungeKutta,
						y1 = ImplicitRungeKutta[f,{x,z},h,1][t,y];
						If[FreeQ[y1,Indeterminate],
							y2 = ImplicitRungeKutta[f,{x,z},h/2,2][t,y],
							y2 = y1
						],
					Numerov,
						sol = Numerov[f,g,{x,z1,z2},h,steps][t,y],
					___,
						Return[]
				];
				If[method === Numerov,Break[]];
				If[method === Milne || method === AdamsBashforth,
					If[sgn > 0,
						y1 = Flatten[{Last[Last[y1]]}];
						y2 = Flatten[{Last[Last[y2]]}],
						y1 = Flatten[{Last[First[y1]]}];
						y2 = Flatten[{Last[First[y2]]}]
					],
					y1 = Flatten[{Last[Last[y1]]}];
					y2 = Flatten[{Last[Last[y2]]}]
				];
				err = L2norm[Flatten[{z}],y1,y2];
	  			hnew = Min[Abs[hmax],Abs[h]/Max[tenth,
				 Min[five,((err/tolerance)^(1/5))/ninetenth]]];
				If[!NumberQ[err],
					hnew = h/2.0;
					err = 10 tolerance
				];
	  			If[err <= tolerance,
	    			(*then step is accepted*)
					If[method === Milne || method === AdamsBashforth,
						x = tn - h;
						If[!stepchange,
							tnm3 = tnm2;
							tnm2 = tnm1;
							tnm1 = tn;
							tn   = tn + h;
							x    = tn - h;
							ynm3 = ynm2;
							ynm2 = ynm1;
							ynm1 = yn;
							yn = y1 = y2
						]
					];
					bsndx -= 1;
					bsndx = Max[1,bsndx];
					stepchange = False;
	      			x += h;
					z = z1 = y1; 
					If[Length[Flatten[{z}]] == 1, 
						z = z1 = First[y1]
					];
					If[method === Milne || method === AdamsBashforth,
						sol = Join[sol,ym],
						AppendTo[sol,{x,z}]
					],
	    			(*else step is rejected *)
					If[!stepchange,
						stepchange = True
					];
					bsndx += 1;
					If[method === BulirschStoer,
						If[bsndx+1 > 11,
							bsndx = 1;
	      					hnew=Min[Abs[hnew],Abs[h]],
							hnew = Abs[h]
						],
	      				hnew=Min[Abs[hnew],Abs[h]]
					]
	  			];
	  			h = sgn hnew;
				If[sgn > 0 , test = x < xn , test = x > xn]
			];
			sol
    	]

ApproximateNthOrderLinear[eq_,y_,t_,const_Symbol] :=
	Module[{tt=t,tmp,a,b,m,cpoly,roots,count,i,j,sol={},
			realeq=FreeQ[eq,Complex]},
		tmp = GetCoefficients[eq,y,t];
		cpoly = Rest[tmp].
			Table[m^n,{n,0,DEOrder[eq,y,t]}];
		roots = Chop[Sort[Flatten[N[Solve[cpoly==0,m],precision]]]] /. 
			(m -> a_ /; FreeQ[a,I]) -> {a} /.
			{Complex[a_,b_]} -> {a,b};
		If[realeq,
			roots = roots /. {a_,b_} /; Negative[b] -> Null
		];
		count = Map[Count[roots,#]&,Union[roots]];
		roots = Union[roots];

		(* ApproximateNthOrderLinear - Part 2 *)
		For[i=1, i <= Length[roots], i++,
			For[j=0, j < count[[i]], j++,
				If[Length[roots[[i]]] === 1, 
					AppendTo[sol,t^j Exp[roots[[i,1]] t]]
				];
				If[Length[roots[[i]]] === 2, 
					If[realeq, 
						AppendTo[sol,t^j Exp[roots[[i,1]] t]  
							Cos[roots[[i,2]] t]];
						AppendTo[sol,t^j Exp[roots[[i,1]] t] 
							Sin[roots[[i,2]] t]],
						AppendTo[sol,t^j Exp[(roots[[i,1]] + 
						  roots[[i,2]] I) t]]
					]
				]
			]
		];
		Table[const[i],{i,1,Length[sol]}].sol +
			ParticularSolution[eq,y,t,Map[Function[t,#]&,sol]]
	]

NthOrderLinear[eq_,y_,t_,const_Symbol] :=
	Module[{tt=t,tmp,m,cpoly,roots,count,i,j,sol={},
			order=DEOrder[eq,y,t],realeq=FreeQ[eq,Complex]},
		tmp = GetCoefficients[eq,y,t];
		cpoly = Rest[tmp].
			Table[m^n,{n,0,order}];
		roots = Solve[cpoly==0,m];
		If[!FreeQ[roots,ToRules] || !FreeQ[roots,Root],
			Print["Approximating the roots of the characteristic equation"];
			exact = False;
			roots = NSolve[cpoly==0,m,precision]
		];
		roots = Sort[Flatten[ExpandAll[roots]]] /. 
			(m -> a_) /; !NumberQ[N[a]] -> {a} /. 
			(m -> a_) /; NumberQ[N[a]] -> {Re[a],Im[a]} /. 
			{a_,b_} /; b == 0 -> {a};
		If[realeq,
			roots = roots /. {a_,b_} /; Negative[N[b]] -> Null
		];

		(* NthOrderLinear - Part 2 *)
		count = Map[Count[roots,#]&,Union[roots]];
		roots = Union[roots];
		For[i=1, i <= Length[roots], i++,
			For[j=0, j < count[[i]], j++,
				If[Length[roots[[i]]] === 1, 
					AppendTo[sol,t^j Exp[roots[[i,1]] t]]
				];
				If[Length[roots[[i]]] === 2, 
					If[realeq, 
						AppendTo[sol,t^j Exp[roots[[i,1]] t]  
							Cos[roots[[i,2]] t]];
						AppendTo[sol,t^j Exp[roots[[i,1]] t]  
							Sin[roots[[i,2]] t]],
						AppendTo[sol,t^j Exp[(roots[[i,1]] + 
						  roots[[i,2]] I) t]]
					]
				]
			]
		];
		Table[const[i],{i,1,Length[sol]}].sol +
			ParticularSolution[eq,y,t,Map[Function[t,#]&,sol]]
	]

NthOrderLinearComplex[eq_,y_,t_,const_Symbol] :=
	Module[{tt=t,tmp,m,cpoly,roots,count,i,j,sol={},
			order=DEOrder[eq,y,t],realeq=FreeQ[eq,Complex]},
		tmp = GetCoefficients[eq,y,t];
		cpoly = Rest[tmp].
			Table[m^n,{n,0,order}];
		roots = Solve[cpoly==0,m];
		If[!FreeQ[roots,ToRules] || !FreeQ[roots,Root],
			Print["Approximating the roots of the characteristic equation"];
			exact = False;
			roots = NSolve[cpoly==0,m,precision]
		];
		roots = Sort[Flatten[roots]] /. 
			(m -> a_) -> {a};
		count = Map[Count[roots,#]&,Union[roots]];
		roots = Union[roots];
		For[i=1, i <= Length[roots], i++,
			For[j=0, j < count[[i]], j++,
				If[Length[roots[[i]]] === 1, 
					AppendTo[sol,t^j Exp[roots[[i,1]] t]]
				]
			]
		];
		Table[const[i],{i,1,Length[sol]}].sol +
			ParticularSolution[eq,y,t,Map[Function[t,#]&,sol]]
	]

(*************************** Table lookup section ****************************)

TableLookup[eq_,y_,t_,const_Symbol] :=
	Module[{yy=y,F,aa,bb,cc,dd,ee,pow,sol,a,b,c,d,e,f,n},
		If[Head[y] =!= Symbol,yy = Head[y]];
		{F,dd,cc,bb,aa,ee,pow} = Parse[eq,yy,t];
		If[F === 0,
			a = Function[{t,yy},aa];
			b = Function[{t,yy},bb];
			c = Function[{t,yy},cc];
			pow = -Last[getmeq[eq,t,yy,yy'']];
			d = Function[{t,yy},pow];
			f = Function[t,pow];
			e = Function[{t,yy},ee],
			aa = Simplify[aa];
			bb = Simplify[bb];
			cc = Simplify[cc];
			dd = Simplify[dd];
			ee = Simplify[ee];
			a = Function[{t,yy},aa];
			b = Function[{t,yy},bb];
			c = Function[{t,yy},cc];
			d = Function[{t,yy},-dd];
			f = Function[t,-dd];
			e = Function[{t,yy},ee]
		];
		If[!FreeQ[d,getmeq],Return[False]];
		Do[
			sol = Equation[n][a,b,c,d,e,pow,const][t,yy];
			If[sol =!= Null && FreeQ[sol,ComplexInfinity] &&
				FreeQ[sol,DirectedInfinity],Break[]],
			{n,1,100}
		];
		If[sol =!= False && sol =!= Null,
			If[exception,
				yy == sol,
				yy == sol + VariationOfParameters[
			  	  Function[t,#]& /@ (List @@ sol /. const[_] -> 1),f][t]
			]
		]
	]

(* Airy  ->  y'' = a t y *)
Equation[1][a_,b_,c_,d_,e_,pow_,const_Symbol][t_,y_] :=
	Module[{m,n},
		ODETracePrint["\tChecking Airy's equation"];
		If[a[t,y] =!= 1 || b[t,y] =!= 0 || e[t,y] =!= 0,
			Return[]
		];
		If[MatchQ[c[t,y],m_. t],
			n = -c[t,y] /. m_. t :> m;
			const[1] AiryAi[(n)^(1/3) t] + const[2] AiryBi[(n)^(1/3) t]
		]
	]	

(* Bessel           ->  t^2 y'' + t y' +/- (k^2 t^2 - n^2) y = 0 *)
(* Modified Bessel  ->  t^2 y'' + t y' -/+ (k^2 t^2 + n^2) y = 0 *)
Equation[2][a_,b_,c_,d_,e_,pow_,const_Symbol][t_,y_] :=
	Module[{m,n,h,k,p=Null},
		ODETracePrint["\tChecking Bessel's equation"];
		If[a[t,y] =!= 1 || b[t,y] =!= 1/t || e[t,y] =!= 0,
			Return[]
		];
		If[FreeQ[c[t,y],t],
			p = 0;
			k = Sqrt[c[t,y]]
		];
		If[MatchQ[c[t,y],h_. + m_. / t^2],
		   {k,p} = c[t,y] /. h_. + m_. / t^2 :>
			{Sqrt[h],Sqrt[-m]}];
		If[p =!= Null,
			If[(FreeQ[PowerExpand[p],Complex] && 
				FreeQ[PowerExpand[k],Complex]) ||
			   (!FreeQ[PowerExpand[p],Complex] &&
			    !FreeQ[PowerExpand[k],Complex]),
				If[(Head[p] === Integer && p >= 0) || !NumberQ[N[p]],
					const[1] BesselJ[p,k t] + const[2] BesselY[p,k t],
					const[1] BesselJ[p,k t] + const[2] BesselJ[-p,k t]
				],
				k = Sqrt[(I PowerExpand[k])^2];
				If[(Head[p] === Integer && p >= 0) || !NumberQ[N[p]],
					const[1] BesselI[p,k t] + const[2] BesselK[p,k t],
					const[1] BesselI[p,k t] + const[2] BesselI[-p,k t]
				]
			]
		]
	]	

(* Legendre  ->  (1 - t^2) y'' - 2t y' + (n(n + 1) - m^2/(1 - t^2)) y = 0 *)
Equation[3][a_,b_,c_,d_,e_,pow_,const_Symbol][t_,y_] :=
	Module[{aa,bb,m,n,k,p=Null,q=Null,tmp},
		ODETracePrint["\tChecking Legendre's equation"];
		If[a[t,y] =!= 1 || !MatchQ[b[t,y],2t/(-1 + t^2)] || e[t,y] =!= 0,
			Return[]
		];
		If[MatchQ[Together[c[t,y]],m_./(-1 + t^2)],
			q = 0;
			p = Together[c[t,y]] /. m_./(-1 + t^2) :> -m
		];
		If[MatchQ[Together[c[t,y]],-m_./(-1 + t^2)^2],
			p = 0;
			q = Together[c[t,y]] /. -m_./(-1 + t^2)^2 :> m
		];
		If[MatchQ[Collect[Numerator[Together[c[t,y]]],t],k_.(n_. + m_. t^2)],
			{p,q} = Collect[Numerator[Together[c[t,y]]],t] /. 
				k_.(n_. + m_. t^2) :> {-k m,-k n-k m}
		];
		If[NumberQ[N[p]],											
			If[Head[p = (-1+Sqrt[1+4p])/2] =!= Integer,
				p = Null
			],
			If[MatchQ[Factor[p],m_(m_ + 1)],
				p = First[Variables[{p}]],
				p = Null
			]
		];
		q = Sqrt[q];
		If[FreeQ[c[t,y],t],											
			p = 0;
			q = 0
		];
		If[p =!= Null && q =!= Null,
			const[1] LegendreP[p,q,t] + 
				 const[2] LegendreQ[p,q,t]
		]
	]	

(* Kummer == Confluent hypergeometric ->  t y'' + (c - t) y' - a y = 0 *)
Equation[4][a_,b_,c_,d_,e_,pow_,const_Symbol][t_,y_] :=
	Module[{m,n,p=Null,q=Null,sol=Null},
		ODETracePrint["\tChecking Kummer's equation"];
		If[a[t,y] =!= 1 || e[t,y] =!= 0,
			Return[]
		];
		If[ MatchQ[b[t,y],-1 + n_. m_. /t],
			p = b[t,y] /. -1 + n_. m_. /t :> n m
		];
		If[ MatchQ[b[t,y],-1],
			p = 0
		];
		If[ MatchQ[c[t,y],n_. m_. /t],
			q = c[t,y] /. n_. m_. /t :> -n m
		];
		If[p =!= Null && q =!= Null,
			If[Head[p] =!= Integer,
				sol = const[1] Hypergeometric1F1[q,p,t] + 
				 	const[2] t^(1-p) Hypergeometric1F1[1+q-p,2-p,t],
				If[p > 0,
					tmp = Hypergeometric1F1[q,p,t];
					sol = const[1] tmp + const[2] tmp Integrate[
				 	  Exp[t]/(t^p tmp^2),t],
					tmp = t^(1-p) Hypergeometric1F1[1+q-p,2-p,t];
					sol = const[1] tmp + const[2] tmp Integrate[
				 	  Exp[t]/(t^p tmp^2),t]
				]
			];
			sol
		]
	]

(* Hermite  ->  y'' - t y' + n y = 0 , y'' - 2t y' + 2n y = 0 *)
Equation[5][a_,b_,c_,d_,e_,pow_,const_Symbol][t_,y_] :=
	Module[{x,aa,bb,cc,p},
		ODETracePrint["\tChecking Hermite's equation"];
		If[a[t,y] =!= 1 || e[t,y] =!= 0,
			Return[]
		];
		If[b[t,y] === -t,
			aa[x_] := 1;
			bb[x_] := -x;
			cc[x_] := 2^(-c[t,y]/2)HermiteH[c[t,y],x/Sqrt[2]];
			Return[const[1] cc[t] + const[2] ReductionOfOrder[aa,bb,cc][t]]
		];
		If[b[t,y] === -2t,
			If[NumberQ[N[c[t,y]]] && EvenQ[c[t,y]],
				aa[x_] := 1;
				bb[x_] := -2x;
				cc[x_] := HermiteH[c[t,y]/2,x];
				Return[const[1] cc[t] + const[2] ReductionOfOrder[aa,bb,cc][t]]
			];
			If[MatchQ[c[t,y],2 n_.],
				p = c[t,y] /. 2 n_. :> n;
				aa[x_] := 1;
				bb[x_] := -2x;
				cc[x_] := HermiteH[p,x];
				const[1] cc[t] + const[2] ReductionOfOrder[aa,bb,cc][t]
			]
		]	
	]	

(* Error function  ->  y'' + 2t y' - 2n y = 0 *)
Equation[6][a_,b_,c_,d_,e_,pow_,const_Symbol][t_,y_] :=
	Module[{x,aa,bb,cc,p},
		ODETracePrint["\tChecking Error function equation"];
		If[a[t,y] =!= 1 || e[t,y] =!= 0,
			Return[]
		];
		If[b[t,y] === 2t,
			If[NumberQ[N[c[t,y]]] && EvenQ[c[t,y]],
				Return[
				  const[1] I^(-c[t,y]/2) Erfc[t] + 
					const[2] I^(-c[t,y]/2) Erfc[-t]]
			];
			If[MatchQ[c[t,y],-2 n_.],
				p = c[t,y] /. -2 n_. :> n;
				const[1] I^p Erfc[t] + const[2] I^p Erfc[-t]
			]
		]	
	]	

(* Pendulum 1  ->  y'' = a y + b y^3  *)
Equation[7][a_,b_,c_,d_,e_,pow_,const_Symbol][t_,y_] :=
	Module[{A=-c[t,y],B=-e[t,y]},
		ODETracePrint["\tChecking First Pendulum equation"];
		If[a[t,y] =!= 1 || B === 0 || pow =!= 3 ||
		   d[t,y] =!= 0,
			Return[]
		];
		Sqrt[-2(const[1]^2 + A)/B]* 
			JacobiSN[const[1](t - const[2]),Sqrt[-(const[1]^2+A)/const[1]^2]]
	]

(* Pendulum 2  ->  y'' + a Sin[y] = 0 *)
Equation[8][a_,b_,c_,d_,e_,pow_,const_Symbol][t_,y_] :=
	Module[{m,n=Null},
		ODETracePrint["\tChecking Second Pendulum equation"];
		If[e[t,y] =!= 0 ,
			Return[]
		];
		If[MatchQ[d[t,y],m_. Sin[y]],
			n = d[t,y] /. m_. Sin[y] -> m
		];
		If[n =!= Null && FreeQ[n,y] && FreeQ[n,t],
			exception = True;
			2 ArcSin[Sin[y[0]/2]* 
		      JacobiSN[Sqrt[n] t +
				 EllipticK[Sin[y[0]/2]^2],Sin[y[0]/2]^2]]
		]
	]

(* Hypergeometric  ->  t(1 - t) y'' + [c - (a + b + 1)t] y' - a b y = 0 *)
Equation[9][a_,b_,c_,d_,e_,pow_,const_Symbol][t_,y_] :=
	Module[{tmp,v,w,k,m,n,s,p=Null,q=Null,r=Null,
		alpha,beta,gamma,roots,sol=Null},
		ODETracePrint["\tChecking Hypergeometric equation"];
		If[a[t,y] =!= 1 || e[t,y] =!= 0,
			Return[]
		];
		If[c[t,y] === 0,
			r = 0
		];
		tmp = ExpandNumerator[ExpandDenominator[b[t,y]]];
		If[MatchQ[tmp,m_./(v_. + w_. k_)],
			{p,q} = Collect[Numerator[tmp],t]/Denominator[tmp] /. 
				m_./(v_. + w_. k_) :> {m/w,0}
		];
		If[MatchQ[tmp,(n_. + m_. t)/(v_. k_ + w_. k_^2)],
			{p,q,v,w} = Collect[Numerator[tmp],t]/Denominator[tmp] /. 
				(n_. + m_. t)/(v_. k_ + w_. k_^2) :> {m/w,-n/w,v,w};
			If[v =!= -w,
				p = Null;
				q = Null
			]
		];
		If[MatchQ[c[t,y],s_./(v_. k_ + w_. k_^2)],
			r = c[t,y] /. s_./(v_. k_ + w_. k_^2) :> -s/v
		];
		If[p =!= Null && q =!= Null && r =!= Null,
			{alpha,beta,gamma} = {alpha,beta,gamma} /. 
				Flatten[Union[Solve[
				{alpha + beta + 1 == p,gamma == q,alpha beta == r},
				{alpha,beta,gamma}]]];
			If[alpha =!= 0 || beta =!= 0 || gamma =!= 0,			
			  If[Head[gamma] =!= Integer,
				sol = const[1] Hypergeometric2F1[alpha,beta,gamma,t] + 
				  const[2] t^(1-gamma) 
			      Hypergeometric2F1[1+alpha-gamma,1+beta-gamma,2-gamma,t],
				If[gamma > 0,
					tmp = Hypergeometric2F1[alpha,beta,gamma,t];
					sol = const[1] tmp + const[2] tmp Integrate[
				 	  1/(t^gamma (1-t)^(alpha+beta-gamma+1)tmp^2),t],
					tmp = t^(1-gamma) 
					  Hypergeometric2F1[1+alpha-gamma,1+beta-gamma,2-gamma,t];
					sol = const[1] tmp + const[2] tmp Integrate[
					  1/(t^gamma (1-t)^(alpha+beta-gamma+1)tmp^2),t]
				]
			  ]
			];
			sol
		]
	]	

(* Chebyshev  ->  (1 - t^2) y'' - t y' + n^2 y = 0 *)
Equation[10][a_,b_,c_,d_,e_,pow_,const_Symbol][t_,y_] :=
	Module[{m,n,p=Null,q,x,aa,bb,cc,tmp},
		ODETracePrint["\tChecking Chebyshev's equation"];
		If[a[t,y] =!= 1 || !MatchQ[b[t,y],t/(-1 + t^2)] || e[t,y] =!= 0,
			Return[]
		];
		If[MatchQ[Simplify[c[t,y]], n_./(1 - t^2)],
			p = Simplify[c[t,y]] /. n_./(1 - t^2) :> Sqrt[n]
		];
		If[MatchQ[Simplify[c[t,y]], n_./(-1 + t^2)],
			p = Simplify[c[t,y]] /. n_./(-1 + t^2) :> Sqrt[-n]
		];
		If[p =!= Null && FreeQ[p,Complex],
			aa[x_] := 1 - x^2;
			bb[x_] := -x;
			cc[x_] := ChebyshevT[p,x];
			const[1] cc[t] + const[2] ReductionOfOrder[aa,bb,cc][t]
		]
	]	

(* Laguerre  ->  t y'' (a + 1 - t) y' + n y = 0 *)
Equation[11][a_,b_,c_,d_,e_,pow_,const_Symbol][t_,y_] :=
	Module[{m,n,p=Null,q=Null,x,aa,bb,cc},
		ODETracePrint["\tChecking Laguerre's equation"];
		If[a[t,y] =!= 1 || e[t,y] =!= 0,
			Return[]
		];
		If[MatchQ[b[t,y],(m_. - t)/t],
			q = b[t,y] /. (m_. - t)/t :> m-1
		];
		If[MatchQ[c[t,y],n_./t],
			p = c[t,y] /. n_./t :> n
		];
		If[p =!= Null && q =!= Null,
			aa[x_] := x;
			bb[x_] := q+1-x;
			cc[x_] := LaguerreL[p,q,x];
			const[1] cc[t] + const[2] ReductionOfOrder[aa,bb,cc][t]
		]
	]	

(* Mathieu  ->  y'' + (a - 2q Cos[2v]) y = 0 *)
(*
Equation[12][a_,b_,c_,d_,e_,pow_,const_Symbol][t_,y_] :=
	Module[{m,n,s,p=Null,q=Null,v=Null,x,aa,bb,cc},
		ODETracePrint["\tChecking Mathieu's equation"];
		If[a[t,y] =!= 1 || b[t,y] =!= 0 || e[t,y] =!= 0,
			Return[]
		];
		If[MatchQ[c[t,y],m_],
			{p,q,v} = c[t,y] /. m_ :> {m,0,0}
		];
		If[MatchQ[c[t,y],m_. - 2 n_.],
			{p,q,v} = c[t,y] /. m_. - 2 n_. :> {m,n,0}
		];
		If[MatchQ[c[t,y],m_. - 2 n_. Cos[2 s_.]],
			{p,q,v} = c[t,y] /. m_. - 2 n_. Cos[2 s_.] :> {m,n,s}
		];
		If[p =!= Null && q =!= Null && v =!= Null,
			aa[x_] := 1;
			bb[x_] := 0;
			cc[x_] := Mathieu[p,q,v,t];
			const[1] cc[t] + const[2] ReductionOfOrder[aa,bb,cc][t]
		]
	]	
*)

(* Last Equation *)
Equation[12][a_,b_,c_,d_,e_,pow_,const_Symbol][t_,y_] := Return[False]

SubstituteQ[eqn_,y_,t_,sol_] :=
	Module[{tmp,solfun},
		If[Head[sol] === Equal,
			tmp = Flatten[{sol}],
			tmp = Flatten[{y==sol}]
		];
		solfun = Map[Solve[#,y]&,tmp];
		If[!FreeQ[solfun,Solve] || 
			!FreeQ[solfun,ToRules] || !FreeQ[solfun,Root],
			solfun = Flatten[Solve[Log[tmp[[1]]] == Log[tmp[[2]]],y]]
		];
		If[solfun =!= {} && Head[solfun] =!= Symbol && 
		   FreeQ[solfun,Solve] && FreeQ[solfun,ToRules] && FreeQ[solfun,Root],
				tmp = Map[First[#]-Last[#]==0&,Flatten[{eqn}]];
				solfun = solfun /. (a_[tt_] -> b_) -> a -> Function[tt,b];
				solfun = Reverse[Union[Flatten[{solfun}]]];
				tmp = Simplify[Map[Chop,
					Map[ReplaceAll[tmp,#]&,solfun],Infinity]];
				{True} === Flatten[Together[ExpandAll
					[Map[PowerExpand,tmp,Infinity]]/.inversetrig]]
		]
	]

ProposedSet[eq_,y_,t_,ls_List,f_,const_Symbol] :=
	Module[{yy=y},
		If[Head[y] =!= Symbol,yy = Head[y]];
		If[Wronskian[ls][t] =!= 0 &&
			Union[Map[SubstituteQ[eq,yy[t],t,#]&,Through[ls[t]]]] === {True},
			Table[const[i],{i,1,Length[ls]}].Through[ls[t]] +
		 		VariationOfParameters[ls,f][t]	
		 ]
	]

AmplitudePhaseAngle[c1_. Cos[w_]]:= N[c1] Cos[N[w]]

AmplitudePhaseAngle[c2_. Sin[w_]]:= N[c2] Cos[N[w - Pi/2]]

AmplitudePhaseAngle[c1_. Cos[w_] + c2_. Sin[w_]]:=
            N[Sqrt[c1^2 + c2^2]] Cos[N[w - ArcTan[c1,c2]]]

BuildButton[tag_] := If[$VersionNumber >= 3.0,
	SelectionMove[EvaluationNotebook[], Previous, Cell];
	SelectionMove[EvaluationNotebook[], Previous, CellGroup];
	FrontEndExecute[FrontEndTokenExecute["OpenCloseGroup"]];
	SelectionMove[EvaluationNotebook[], Before, CellGroup];
	NotebookWrite[EvaluationNotebook[],	
		Cell[BoxData[ButtonBox["Play Movie", ButtonFunction :> 
   		FrontEndExecute[
   		SelectionMove[EvaluationNotebook[], Before, Notebook];
   		NotebookLocate[tag]; 
     	SelectionMove[EvaluationNotebook[], Next, CellGroup]; 
    	SelectionAnimate[EvaluationNotebook[]]]]], 
    	CellTags->{tag},Active -> True]
	];
	SelectionMove[EvaluationNotebook[], Next, CellGroup];
	SelectionMove[EvaluationNotebook[], After, CellGroup];
];

End[] (* ODE`Private` *)
(*
Protect[Parse,ODE,FirstOrderHomogeneous,IntegratingFactor,
FirstOrderExact,FirstOrderLinear,Bernoulli,Riccati,Separable,NumericalMethods,
ExchangeVariables,ApproximateNthOrderLinear,BulirschStoer,
Clairaut,ClairautQ,Lowset,Highset,DEOrder,SeriesForm,NonSingular,Frobenius,
SecondOrderLinear,VariationOfParameters,Euler,Heun,SeriesFormCauchy,
RungeKutta4,AdamsBashforth,Milne,Laplace,BernoulliQ,
HomogeneousSecondOrderLinear,Wronskian,ReductionOfOrder,LinearSystem,
HomogeneousLinearSystem,Picard,FactorEquation,RiccatiQ,
EquationFromSolutions,GetCoefficients,RungeKutta45,ConvertToSystem,
Polynomial,PowerSeries,FrobeniusSeries,CauchyEuler,LinearFractional,
TaylorSeries,LinearQ,FirstOrderExactQ,SeparableQ,LinearSystem,
CauchyEulerQ,SecondOrderExactQ,SecondOrderExact,LinearFractionalQ,
SecondOrderLinearToConstantsQ,Transformation,EquidimensionalInIndependentQ,
EquidimensionalInDependentQ,SecondOrderLinearToConstants, Adjoint,
EquidimensionalInDependent,EquidimensionalInIndependent,NthOrderLinear,
ImplicitRungeKutta,AlmostLinearQ,AlmostLinear,ImposeInitialValues,
GeneralizedHomogeneousQ,GeneralizedHomogeneous,SecondOrderLinearToRiccati,
FirstOrderLinearQ,SolvableForIndependentQ,SolvableForDependentQ,
SolvableForIndependent,NthOrderLinearComplex,NthOrderCauchyEulerComplex,
SolvableForDependent,AutonomousQ,Autonomous,Trivial,SecondOrderEuler,
Lagrange,LagrangeQ,GetMatrices,GetSemiNumericalMatrices,
RiccatiToSecondOrderLinear,NthOrderCauchyEuler,ApproximateNthOrderCauchyEuler,
ApproximateLinearSystem,TableLookup,Trajectory,DependentMissingQ,
DependentMissing,ImplicitEuler,LinearizeAt,CriticalPoints,Numerov,
ApproximateSecondOrderLinear,ApproximateSecondOrderCauchyEuler, MultiplyByDerivative]
*)

EndPackage[] (* ODE` *)

