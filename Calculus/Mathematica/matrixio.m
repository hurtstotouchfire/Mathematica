writeMatrix::usage =
"writeMatrix[\"file\", matrix] writes the matrix to the file, one row per line, with elements separated by tabs."
writeMatrix[file_String,mat_List] := 
Module[
	{matout=OpenWrite[file],
	 rows=Length[mat],
	 cols=Length[mat[[1]]]},
	Do[
		Do[
			WriteString[matout,
				ToString[mat[[i,j]]],Tab],
		{j,1,cols-1}
		];
		WriteString[matout,
			ToString[mat[[i,cols]]]];
		WriteString[matout,"\n"],
	{i,1,rows}
	];
	Close[matout];
];

readMatrix::usage =
"matrix=readMatrix[\"file\"] reads the file and returns a matrix, with the elements on each line of the file becoming the elements of each row of the matrix.  The file is assumed to contain number elements only."
readMatrix[file_String] :=
Module[
	{},
	ReadList[file,Number,RecordLists->True]
];

writeVector::usage =
"writeVector[\"file\", vector] writes the vector to the file on a single line, with elements separated by tabs."
writeVector[file_String,vector_List] :=
	writeMatrix[file,{vector}];

readVector::usage =
"vector=readVector[\"file\"] reads the file and returns a vector, with the elements on the first line of the file becoming the elements of the vector.  The file is assumed to contain number elements only."
readVector[file_String] :=
	Part[readMatrix[file],1]

writeMatrixToSpreadSheet::usage =
"writeMatrixToSpreadSheet[\"file\", matrix] writes the matrix to the file, one row per line, with elements separated by tabs."
writeMatrixToSpreadSheet[filename_String, data_List] :=
	Block[{
			file = OpenWrite[filename]
		},
		Scan[
			(
				WriteString[file, First[#]];
				Scan[
					WriteString[file, "\t", #]&,
					Rest[#]
				];
				WriteString[file, "\n"]
			)&,
			data
		];
		Close[file]
	]