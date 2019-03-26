(* ::Package:: *)

pwd = $ScriptCommandLine[[2]];

hexifyColor[color_RGBColor] := 
 StringJoin["#", 
  ToUpperCase@IntegerString[Round[Level[color, 1]*255], 16, 2]];
changeColor[file_, i_] := 
 Module[{txt, txtNew}, txt = Import[file, "String"]; 
  txtNew = StringReplace[txt, 
    a : (StartOfLine ~~ Whitespace ~~ "\"cep_s" | "\"f0_s" ~~ 
         DigitCharacter ~~ "_") ~~ b : DigitCharacter .. ~~ 
      c : Shortest[___ ~~ "fillcolor="] ~~ d : "gold" ~~ e : "];" :> 
     a <> b <> c <> "\"" <> colormapping[[i]][ToExpression@b] <> 
      "\"" <> e];
  Export[file, txtNew, "String"]];

Print["WolframScript Process mdl1..."];
files = FileNames["*.dot", FileNameJoin[{pwd,"mdl1"}], 1];
dat = Partition[BinaryReadList[FileNameJoin[{pwd,"DecisionTreeMat.dat"}], "Real32"], 
   10];
colormapping = 
  Table[hexifyColor[ColorData["TemperatureMap"]@#] & /@ 
      Rescale[#, MinMax@#] &@
    KeyMap[Round, Log@Sort@Counts@dat[[All, i]]], {i, 10}];
Do[changeColor[files[[i]], i], {i, 10}];

Print["WolframScript Process mdl3..."];
files = FileNames["*.dot", FileNameJoin[{pwd,"mdl3"}], 1];
dat = Partition[BinaryReadList[FileNameJoin[{pwd,"DecisionTreeMat_mdl3.dat"}], "Real32"], 
   10];
colormapping = 
  Table[hexifyColor[ColorData["TemperatureMap"]@#] & /@ 
      Rescale[#, MinMax@#] &@
    KeyMap[Round, Log@Sort@Counts@dat[[All, i]]], {i, 10}];
Do[changeColor[files[[i]], i], {i, 10}];

Print["WolframScript Process mdl5..."];
files = FileNames["*.dot", FileNameJoin[{pwd,"mdl5"}], 1];
dat = Partition[BinaryReadList[FileNameJoin[{pwd,"DecisionTreeMat_mdl5.dat"}], "Real32"], 
   10];
colormapping = 
  Table[hexifyColor[ColorData["TemperatureMap"]@#] & /@ 
      Rescale[#, MinMax@#] &@
    KeyMap[Round, Log@Sort@Counts@dat[[All, i]]], {i, 10}];
Do[changeColor[files[[i]], i], {i, 10}];
