writeTable::usage =
"writeTable[\"file\", table] writes the table to the file, one row per line, with elements separated by tabs."
writeTable[filename_String, data_List] :=
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