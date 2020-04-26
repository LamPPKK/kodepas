unit kphelp;
interface 
    uses crt,
    getos in './system/getos',
    magicletter in './effect/magic/magicletter';
    procedure kphelp_run;
implementation
    procedure kphelp_run;
    begin
        kode_letter;
        case getos_run of
            'linux': writeln('KodePas in Linux');
            'windows': writeln('KodePas in Windows');
            else writeln('Unknow OS');
        end;
        writeln('Welcome to KodePas - Free and open source Software Development Kit for Pascal');
       writeln('Try: kodepas [option-main] [--option-branch] [value]');
       writeln('Try: kodepas [option-main] --help to see help of option');
       writeln('Option:');
       writeln('    help: give help');
       writeln('    run: build and run project');
       writeln('    start: run KodePas Live');
       writeln('    create: create project');
       writeln('    build: build project without run');
       writeln('    version: get version of KodePas (include Control, Kernel, LCL, FCL...)');
       writeln('    init: init the config, default file in project');
       writeln('    render: use to render project as resource, images,...');
       writeln('    add: add template, package to your project');
       writeln('    doctor: check KodePas in your computer');
       writeln('    setup: setup KodePas');
       writeln('    update: update KodePas from Git. Required Git CLI or wget in Linux');
       writeln('    license: read license of KodePas project');
       writeln('    legends: show the legends');
       writeln('More documents:');
       writeln('    KodePas Docs Official: https://kodelang.dev/docs');
       writeln('    GitHub Wiki: https://github.com/kodestudio/kodepas/wiki');
       writeln('    GitHub Community: https://github.com/kodestudio/kodepas/issues');
    end;
end.