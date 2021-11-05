unit UUE;

interface
 
 function UUEncode(filename: string): AnsiString;
// function UUDecode(UUData: AnsiString): AnsiString;
 
implementation

uses SysUtils;

 function UUEncode(filename: string): AnsiString;
  
  CONST header = 'begin';
        trailer = 'end';
        defaultMode = '644';
        defaultExtension = '.uue';
        offset = 32;
        charsPerLine = 60;
        bytesPerHunk = 3;
        sixBitMask = $3F;

  TYPE STRING80 = STRING[80];

  VAR infile: FILE OF Byte;
      outstring: AnsiString;
      infilename, mode: STRING80;
      lineLength, numbytes, bytesInLine: Integer;
      Line: ARRAY [0..59] OF Char;
      hunk: ARRAY [0..2] OF Byte;
      chars: ARRAY [0..3] OF Word;

  PROCEDURE Init;

    PROCEDURE GetFiles;

      VAR i: Integer;
          temp: STRING80;
          ch: Char;

      BEGIN {GetFiles}
       {$I-}
       AssignFile (infile, infilename);
       Reset (infile);
       {$i+}
       mode := defaultMode;
      END; {getfiles}

    BEGIN {Init}
      GetFiles;
      bytesInLine := 0;
      lineLength := 0;
      numbytes := 0;
      outstring:=header+' '+mode+' '+ExtractFileName(infilename)+#13;
    END; {init}

  PROCEDURE FlushLine;

    VAR i: Integer;

    PROCEDURE writeout(ch: Char);

      BEGIN {writeout}
        IF ch = ' ' THEN outstring:=outstring+'`'
                    ELSE outstring:=outstring+ch;
      END; {writeout}

    BEGIN {FlushLine}
      writeout(Chr(bytesInLine + offset));
      FOR i := 0 TO Pred(lineLength) DO
        writeout(Line[i]);
      outstring:=outstring+#13;
      lineLength := 0;
      bytesInLine := 0
    END; {FlushLine}

  PROCEDURE FlushHunk;

    VAR i: Integer;

    BEGIN {FlushHunk}
      IF lineLength = charsPerLine THEN FlushLine;
      chars[0] := hunk[0] SHR 2;
      chars[1] := (hunk[0] SHL 4) + (hunk[1] SHR 4);
      chars[2] := (hunk[1] SHL 2) + (hunk[2] SHR 6);
      chars[3] := hunk[2] AND sixBitMask;
      {debug;}
      FOR i := 0 TO 3 DO
        BEGIN
          Line[lineLength] := Chr((chars[i] AND sixBitMask) + offset);
          lineLength := Succ(lineLength)
        END;
      bytesInLine := bytesInLine + numbytes;
      numbytes := 0
    END; {FlushHunk}

  PROCEDURE encode1;

    BEGIN {encode1};
      IF numbytes = bytesperhunk THEN flushhunk;
      Read (infile, hunk[numbytes]);
      numbytes := Succ(numbytes)
    END; {encode1}

  PROCEDURE terminate;

    BEGIN {terminate}
      IF numbytes > 0 THEN flushhunk;
      IF lineLength > 0
        THEN
          BEGIN
            flushLine;
            flushLine;
          END
        ELSE flushline;
      outstring:=outstring+trailer+#13;
      CloseFile (infile);
    END; {terminate}


  BEGIN {uuencode}
    infilename:=filename;
    init;
    WHILE NOT EOF (infile) DO encode1;
    terminate;
	Result:=outstring;
  END; {uuencode}

 end. 