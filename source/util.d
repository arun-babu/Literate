// util.d
import globals;
import std.stdio;
import std.conv;
import parser;
import std.string;
import std.algorithm: canFind;
import std.regex: matchAll, regex;
import std.path;

import core.stdc.stdlib;

// readall function
// Read from a file
string readall(File file) {
    string src = "";
    while (!file.eof) {
        src ~= file.readln();
    }
    file.close();
    return src;
}

// Read from stdin
string readall() {
    string src = "";
    string line;
    while ((line = readln()) !is null) {
        src ~= line;
    }
    return src;
}

// error function
void error(string file, int line, string message) {
    writeln(file, ":", line, ":error: ", message);
    exit(-1);
}

// warning function
void warn(string file, int line, string message) {
    writeln(file, ":", line, ":warning: ", message);
}

// leadingWS function
string leadingWS(string str) {
    auto firstChar = str.indexOf(strip(str)[0]);
    return str[0..firstChar];
}

// getCodeblocks function
void getCodeblocks(Program p, 
                   out Block[string] codeblocks,
                   out Block[string] rootCodeblocks) {
    Block[] tempCodeblocks;

    foreach (c; p.chapters) {
        foreach (s; c.sections) {
            foreach (b; s.blocks) {
                bool isRootBlock = false;
                if (b.isCodeblock) {
                    Block copy = b.dup();
                    copy.namespace = c.title;

                    auto fileMatch = matchAll(copy.name, regex(".*\\.\\w+"));
                    auto quoteMatch = matchAll(copy.name, regex("^\".*\"$"));
                    if (fileMatch || quoteMatch) {
                        copy.isRootBlock = true;
                        if (quoteMatch) {
                            copy.name = copy.name[1..$-1];
                        }
                    }
                    if ((!copy.modifiers.canFind(Modifier.additive)) && (!copy.modifiers.canFind(Modifier.redef))) {
                        codeblocks[copy.name] = copy;
                        if (copy.isRootBlock) {
                            rootCodeblocks[copy.name] = copy;
                        }
                    } else {
                        tempCodeblocks ~= copy;
                    }
                }
            }
        }
    }

    // Now we go through every codeblock in tempCodeblocks and apply the += and :=
    foreach (b; tempCodeblocks) {
        if (b.modifiers.canFind(Modifier.additive)) {
            auto index = b.name.length;
            string name = strip(b.name[0..index]);
            if ((name in codeblocks) is null) {
                error(p.file, b.startLine.lineNum, "Trying to add to {" ~ name ~ "} which does not exist");
            } else {
                codeblocks[name].lines ~= b.lines;
            }
        } else if (b.modifiers.canFind(Modifier.redef)) {
            auto index = b.name.length;
            string name = strip(b.name[0..index]);
            if ((name in codeblocks) is null) {
                error(p.file, b.startLine.lineNum, "Trying to redefine {" ~ name ~ "} which does not exist");
            } else {
                codeblocks[name].lines = b.lines;
            }
        }
    }
}

// getChapterHtmlFile function
string getChapterHtmlFile(Chapter[] chapters, string num) {
    string[] nums = num.split(".");
    int majorNum = to!int(nums[0]);
    int minorNum = 0;
    if (nums.length > 1) {
        minorNum = to!int(nums[1]);
    }
    foreach (Chapter c; chapters) {
        if (c.majorNum == majorNum && c.minorNum == minorNum) {
            return stripExtension(baseName(c.file)) ~ ".html";
        }
    }
    return "";
}


