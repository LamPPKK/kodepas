![alt](https://github.com/kodestudio/kodepas/blob/master/images/kodelogo.png)
**KodePas là mô trường phát triển phần mềm cho ngôn ngữ lập trình Pascal**

**Nếu đây là lần đầu bạn sử dụng KodePas, xin hãy đọc kĩ các bước để cài đặt không bị lỗi.**

# Cài đặt KodePas trên Windows

## Yêu cầu hệ thống

- Ổ đĩa còn trống 500MB

- Windows 7 trở nên(khuyến khích Windows 10)

- Đã cài đặt FPC (Free Pascal Compile). Nếu chưa bạn có thể tải về tại [đây](https://www.freepascal.org/download.html). Bạn nhớ chọn kĩ hệ điều hành và loại vi xử lí máy tính bạn nhằm tránh bị lỗi nhé. Ưu tiên bản FPC mới nhất và KodePas hiện đang tương thích với bản FPC 3.0.4

## Cài đặt

### Bước 1: Tải KodePas về máy tính

Bạn tải về file kodepas.zip từ GitHub của KodePas tại [đây](https://github.com/kodestudio/kodepas/archive/master.zip)

Trong trường hợp bạn muốn tải trực tiếp mã nguồn thì dùng Git và gõ lệnh sau:

`git clone https://www.github.com/kodestudio/kodepas.git`

### Bước 2: Chuyển mã nguồn (Có thể bỏ qua)

Chuyển toàn bộ mã nguồn vừa tải về vào thư mục trên ổ C:\

* Lưu ý: bạn có thể đặt KodePas ở đường dẫn bất kì, nhưng chúng tôi khuyến khích nên đặt vào C:\KodePas hoặc D:\KodePas

### Bước 3: Thêm KodePas vào biến môi trường (Bước quan trọng)

Bạn truy cập vào Control Panel trên PC của bạn và tìm vào đường dẫn

`Control Panel\System and Security\System`

![alt](https://github.com/kodestudio/kodepas/blob/master/images/controlpanel.PNG)

Sau đó chọn vào Mục ** Advanced System Settings **

![alt](https://github.com/kodestudio/kodepas/blob/master/images/systempro.PNG)

Tại đây chọn Enviroment Variables

![alt](https://github.com/kodestudio/kodepas/blob/master/images/vari.PNG)

Bạn nhấn đúp chuột vào mục PATH

![alt](https://github.com/kodestudio/kodepas/blob/master/images/addpath.PNG)

Rồi chọn New và nhập đường dẫn vào:

`C:\KodePas\bin`

Sau đó nhấn OK.

### Bước 4: Trỏ mã nguồn về LCL

Đây là bước quan trọng để bạn có thể kết nối KodePas với LCL.

Bạn truy cập vào đường dẫn chứa tệp quy định của KodePas, mặc định là:

`C:\KodePas\bin\config\environmentoptions.xml` 

Nội dung tệp có thể là:

`<?xml version="1.0" encoding="UTF-8"?>
<CONFIG>
  <EnvironmentOptions>
    <Debugger Class="TGDBMIDebugger">
      <ClassTGDBMIDebugger>
        <Config ConfigClass="TGDBMIDebugger" DebuggerFilename="$Path($(CompPath))\gdb.exe" Active="True" UID="{A0E40DA3-4A0D-4A25-9EFD-71E15D55EEB0}"/>
      </ClassTGDBMIDebugger>
      <WatchesDlg ColumnNameWidth="-1" ColumnValueWidth="-1"/>
      <CallStackDlg ViewCount="0"/>
    </Debugger>
    <DebuggerFilename Value="$Path($(CompPath))\gdb.exe"/>
    <Version Value="110" Lazarus="1.0"/>
    <FormEditor>
      <Rubberband>
        <SelectionColor Value="8388608"/>
        <CreationColor Value="128"/>
      </Rubberband>
    </FormEditor>
    <Recent AlreadyPopulated="True"/>
    <ExternalTools Version="3"/>
    <LazarusDirectory Value="C:\KodePas">
    </LazarusDirectory>
    <CompilerFilename Value="fpc.exe">
    </CompilerFilename>
    <MakeFilename>
    </MakeFilename>
    <TestBuildDirectory Value="C:\Users\ADMINS~1\AppData\Local\Temp\">
    </TestBuildDirectory>
  </EnvironmentOptions>
  <ObjectInspectorOptions ShowHints="False" InfoBoxHeight="50">
    <Version Value="3"/>
  </ObjectInspectorOptions>
</CONFIG>
`

Tại đây bạn sửa các đường dẫn lại sao cho đúng với nơi bạn lưu trữ KodePas. Gợi ý là:

`<LazarusDirectory Value="C:\KodePas">`

### Bước 5: Thử KodePas đã hoạt động chưa

Bạn dùng tổ hợp phím Win + R để mở bản chọn RUN. Sau khi bản chọn hiện lên bạn gõ `cmd ` và nhấn Enter.

![alt](https://github.com/kodestudio/kodepas/blob/master/images/run.PNG)

Bạn nhập lệnh sau vào Command Prompt

`kode --version`

Nếu Command Prompt trả lại kết quả như sau thì bạn đã cài đặt thành công

![alt](https://github.com/kodestudio/kodepas/blob/master/images/complete.PNG)

### Bước 6: Chạy thử chương trình mẫu

Bạn truy cập vào đường dẫn lưu trữ KodePas và vào mục project và mở Command Prompt ở đó

`C:\KodePas\project`

Sau đó gõ lệnh sau:

`kode --build-all project.kode`

Nếu bạn nhận được kết quả

![alt](https://github.com/kodestudio/kodepas/blob/master/images/build.PNG)

thì tiếp tục gõ lệnh

`project`

![alt](https://github.com/kodestudio/kodepas/blob/master/images/project.PNG)

** Nếu bạn nhận được kết quả như trên thì xin chúc mừng !. Bạn đã cài đặt thành công KodePas



