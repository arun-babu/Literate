// tangler.d
import globals;
import std.file;
import std.path;
import std.range;
import std.string;
import std.stdio;
import std.algorithm: canFind;
import parser;
import util;
import std.conv: to;

void tangle(Program p) {
    // tangle function
    Block[string] rootCodeblocks;
    Block[string] codeblocks;
    
    getCodeblocks(p, codeblocks, rootCodeblocks);
    if (rootCodeblocks.length == 0) {
        warn(p.file, 1, "No file codeblocks, not writing any code");
    }
    foreach (b; rootCodeblocks) {
        string filename = b.name;
        File f;
        if (!noOutput) {
            string fname = std.path.buildNormalizedPath(outDir, filename);
    
            string dname = std.path.buildPath(std.range.dropBack(std.path.pathSplitter(fname), 1));
            if (dname != "") {
                std.file.mkdirRecurse(dname);
            }
    
            f = File(fname, "w");
        }
    
        writeCode(codeblocks, b.name, f, filename, "");
        if (!noOutput)
            f.close();
    }

}

// writeCode function
void writeCode(Block[string] codeblocks, string blockName, File file, string filename, string whitespace) {
    Block block = codeblocks[blockName];

    if (block.commentString != "") {
        if (!noOutput && !block.modifiers.canFind(Modifier.noHeader))
            file.writeln(whitespace ~ block.commentString.replace("%s", blockName));
    }

    foreach (lineObj; block.lines) {
        string line = lineObj.text;
        string stripLine = strip(line);
        if (stripLine.startsWith("@{") && stripLine.endsWith("}")) {
            string newWS = leadingWS(line);
            auto index = stripLine.length - 1;
            auto newBlockName = stripLine[2..index];

            newBlockName = newBlockName.replace("/"," / ");
            newBlockName = newBlockName.replace("  "," ");
            newBlockName = newBlockName.replace("  "," ");

            string [] s = newBlockName.split("/");
            if (s.length == 1 && block.namespace != "")
		newBlockName = block.namespace ~ " / " ~ newBlockName; 

            if (newBlockName == blockName) {
                error(lineObj.file, lineObj.lineNum, "{" ~ blockName ~ "} refers to itself");
                tangleErrors = true;
                return;
            }
            if ((newBlockName in codeblocks) !is null) {
                writeCode(codeblocks, newBlockName, file, filename, whitespace ~ newWS);
            } else {
                error(lineObj.file, lineObj.lineNum, "{" ~ newBlockName ~ "} 2 does not exist");
                tangleErrors = true;
            }
        } else {
            if (!noOutput) {
                if (lineDirectives) {
                    if (lineDirectiveStr != "") {
                        file.writeln(lineDirectiveStr, " ", lineObj.lineNum);
                    } else {
                        file.writeln(block.commentString.replace("%s", to!string(lineObj.lineNum)));
                    }
                }

		string wl = (whitespace ~ line).strip();
	
		if (wl.length == 0)
        		file.writeln();
		else
                	file.writeln(whitespace ~ line);
            }
        }
    }
    if (!noOutput)
        file.writeln();
}


