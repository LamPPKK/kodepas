unit kpversion;
interface 
    uses crt,
    getos in './system/getos';
    procedure kpversion_run;
implementation
    procedure kpversion_run;
    begin
        case getos_run of
            'linux': writeln('KodePas for Linux');
            'unix': writeln('KodePas for Unix');
            'windows': writeln('KodePas for Windows');
            else writeln('KodePas'); 
        end;
        writeln('KodePas Control: 1.0');
        writeln('KodePas Kernel: 1.0');
        writeln('System packages:');
        writeln('   LCL: 2.1');
        writeln('   FCL: 1.0.1');
        writeln('   LazUtils: 1.0');
        writeln('   CodeTools: 1.0.1');
        writeln('   LCLBase: 2.1');
        writeln('   DebuggerIntf: 0.1');
    end;
end.