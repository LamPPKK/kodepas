unit magicletter;
interface
    uses crt;
    procedure kode_letter;
implementation
    procedure kode_letter;
    begin
        writeln('##     ##     ####    #######    #########');
        writeln('##    ##   ##     ##  ##     ##  #########');
        writeln('##   ##    ##     ##  ##     ##  ##       ');
        writeln('## ##      ##     ##  ##     ##  #########');
        writeln('##  ##     ##     ##  ##     ##  #########');
        writeln('##   ##    ##     ##  ##     ##  ##       ');
        writeln('##    ##   ##     ##  ##     ##  #########');
        writeln('##     ##    ####     #######    #########');
    end;
end.