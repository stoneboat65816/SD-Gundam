==============Mục lục/目次/TABLE OF CONTENTS============

A. Tiếng Việt
	I. Khái quát
	II. Cấu trúc
	III. Cách compile
	
B. 日本語
	I. 概要
	II. 本フォルダーの構造成分
	III. 実行方法
	
C. English
	I. Overview
	II. Structure
	III. How to Compile

########################   A. Tiếng Việt   ###################################
I. Khái quát
Đây là mã nguồn của bản patch cải tiến cho game "SD Gundam Power Formation Puzzle".
●Hệ máy: Super Famicom (SNES)
●Hãng phát hàng: Bandai
●Năm phát hành: 1996

Bản patch này có thêm phần hiển thị thông tin về phe mà bạn đang chọn, cũng như cấp độ Robo mà bạn đang xếp được.  
Ngoài ra, bản patch này cũng cho phép thay đổi ngoại hình của loại Gundam xuất hiện bằng cách thay đổi phe mà bạn chọn, bằng cách nhấn nút L hoặc R. Những tính năng này không có trong bản gốc.
Với mã nguồn này, bạn có thể tự compile Rom gốc (tiếng Nhật) để đưa chức năng này vào ROM chỉ với một cú click chuột.
Mã nguồn này được thiết kế để chạy trên Windows. Nếu muốn chạy trên Mac thì bạn cần phải chạy thông qua WINE hoặc máy ảo.

II. Cấu trúc
Folder mã nguồn này gồm những thành phần như bên dưới, không tính file Readme này.
●01_xkas.exe (tác giả: Byuu): phần mềm biến mã assembly trong các file text thành mã máy rồi chèn chúng vào Rom. 
●01_RUN.bat: file batch của Windows, dùng để gọi xkas. Double click file này để chạy.
●Các file .asm ("03_main.asm", "04_vector.asm", "05_maincode.asm", "06_incbin.asm"): các file code để đưa những tính năng kể trên vào Rom.
●Thư mục "Data": chứa dữ liệu cần thiết để đưa những tính năng kể trên vào Rom.

Trong folder này không bao gồm Rom. 
Nếu bạn sở hữu băng game một cách hợp pháp thì có thể trích xuất Rom từ băng qua các thiết bị như Super UFO PRO 8.

III. Cách compile

1. Mở file "01_RUN.bat" bằng phần mềm Notepad hoặc bất kỳ text-editor nào.
Trong này bạn sẽ thấy những dòng lệnh như bên dưới.

=============Code===============
COPY 02_Source.sfc 02_TARGET.SFC
01_xkas.exe -o 02_TARGET.SFC 03_MAIN.ASM
pause
================================

Trong đó "02_Source.sfc" là tên Rom gốc chưa chỉnh sửa, còn "02_TARGET.SFC" là tên bản sao của Rom gốc.
Bạn có thể đổi tên Rom thành bất cứ tên gì cũng được, miễn là nó khớp với phần khai báo trong file .bat này.
Chúng ta làm việc trên bản sao của Rom để tránh gây ảnh hưởng lên Rom gốc.

2. Đặt Rom gốc (tiếng Nhật) của trò "SD Gundam Power Formation Puzzle" vào folder này.

3. Double-click vào file "01_RUN.bat:". Lúc này xkas sẽ tạo ta file "02_TARGET.SFC" (hoặc bất kỳ tên gì, ứng với tên được khai báo ở bước 1).

4. Chạy file "02_TARGET.SFC" vừa được tạo ra bằng các phần mềm giả lập Super Famicom như BSNES, MESEN, SNES9X,...
Bạn cũng có thể chạy file này trên phần cứng Super Famicom thật hoặc những phần cứng clone khác như SupaBoy, Retron,...

Lưu ý: Rom gốc của bạn không được chứa 0x0200 byte header.
Dùng bất cứ Hex-editor nào để kiểm tra. Nếu thấy phần header thì xóa nó đi.

Mã nguồn được chia sẻ miễn phí tại:
https://github.com/stoneboat65816/

########################   B. 日本語   ###################################
I. 概要
SDガンダムパワーフォーメーションパズル改造パッチのソースコードです。
■対応機種：スーパーファミコン
■発売元：バンダイ
■発売年：1996

本パッチでは、選択している陣営や現在積み上げたガンダムのレベルを画面上に表示する機能が追加されます。
さらに、LボタンとRボタンで陣営を切り替えることで、登場するガンダムの見た目を変更することも可能になります。これらの機能は無改造版には存在しないものです。
本ソースコードを使用することで、無改造ROM（日本語版）を対象にしてワンクリックでコナミコマンドを導入することができます。
本ソースコードおよび関連ソフトはWindows上で動作させるよう設計されています。MacOSで実行する場合は、WINEまたは仮想マシンを使用してください。

II. 本フォルダーの構造成分
本ソースコードフォルダーには、本Readmeファイルを除き、以下の内容が含まれています。
●01_xkas.exe（作者：Byuu氏）：アセンブリコードを機械語へ変換し、ROMへ挿入するソフトウェアです。
●01_RUN.bat：Windows用のバッチファイルで、xkasを呼び出すために使用します。本ファイルをダブルクリックすることで実行できます。
●拡張子 .asmファイル ("03_main.asm", "04_vector.asm", "05_maincode.asm", "06_incbin.asm"): 上記機能をROMに導入させるためのソースコードです。
●「Data」フォルダ：上記機能をROMに導入させるために必要なデータを格納する場所です。

本フォルダーにはROMファイルは含まれていません。
ゲームカセットを所有している場合、Super UFO PRO 8などの吸出し器を使用することでカセットからROMを抽出することが可能です。

III. 実行方法
1. 「01_RUN.bat」ファイルを、Notepadまたは任意のテキストエディタで開いてください。
ファイル内には、以下のようなコマンド行が記載されています。
=============Code===============
COPY 02_Source.sfc 02_TARGET.SFC
01_xkas.exe -o 02_TARGET.SFC 03_MAIN.ASM
pause
================================
ここで、「02_Source.sfc」は無改造ROMのファイル名で、「02_TARGET.SFC」はそのコピーのファイル名です。
ROMのファイル名は任意の名称に変更可能ですが、その場合は本.batファイル内で指定されている名称と一致させる必要があります。
無改造ROMに影響を与えないよう、本作業は必ずそのコピーを対象にするわけです。

2 .無改造ROMの日本語版『SDガンダムパワーフォーメーションパズル』を本フォルダーに置いてください。

3. 「01_RUN.bat」をダブルクリックします。
すると、xkasにより「02_TARGET.SFC」（または1.で指定した任意のファイル名）が生成されます。

4. 生成された「02_TARGET.SFC」を、bsnes、Mesen、Snes9x などのスーパーファミコン用エミュレータでプレイしてください。
また、スーパーファミコン実機や、SupaBoy、Retron などの互換機で動作させることも可能です。

※無改造ROMは、ヘッダー（0x200バイト）のないものでないといけません。スターリング等バイナリエディタでROMを開いてヘッダーの有無を確認できます。ヘッダーが確認された場合、バイナリエディタで削除してください。
このソースコードは下記URLにて無料で提供しております。
https://github.com/stoneboat65816/


########################   C. English   ###################################
I. Overview
This is the source code for improvement patch of "SD Gundam Power Formation Puzzle".
◆Platform: Super Famicom (SNES)
◆Publisher: Bandai
◆Year of publication: 1996

This patch adds on-screen information showing the faction you’ve selected as well as the current Robo level you’ve built up.
In addition, it allows you to change the appearance of the Gundam that appears by switching factions using the L and R buttons. These features were not available in the original version.
With this source code, you can compile the original Japanese ROM yourself and add this feature to the game with just a single click.
The source code is designed to run on Windows. If you’re using a Mac, you’ll need to run it through WINE or a virtual machine.

II. Structure
This source folder includes the following files (not counting this Readme):
◆01_xkas.exe  (author: Byuu): This tool assembles the assembly code in txt files into machine code and inserts it into the ROM.
◆01_RUN.bat: A Windows batch file used to run xkas. Just double-click this file to execute it.
◆The ".asm" files ("03_main.asm", "04_vector.asm", "05_maincode.asm", "06_incbin.asm"): source code to implement above functions to your ROM.
◆The "Data" folder: contains necessary data for above functions.

The ROM file itself is not included in this folder.
If you legally own the original game cartridge, you can dump the ROM using devices such as the Super UFO PRO 8.

III. How to Compile

1. Open the file "01_RUN.bat" using Notepad or any text editor.
Inside, you’ll see lines of code like the ones below.

=============Code===============
COPY 02_Source.sfc 02_TARGET.SFC
01_xkas.exe -o 02_TARGET.SFC 03_MAIN.ASM
pause
================================
In that file, "02_Source.sfc" is the name of the original, unmodified ROM, and "02_TARGET.SFC" is the name of the duplicated ROM that will be patched.
You can rename the ROM to anything you like, as long as it matches what’s written in the .bat file.
We’re working on a copy of the ROM to make sure the original file stays untouched.

2. Place the original Japanese ROM of "SD Gundam Power Formation Puzzle" into this folder.

3. Double-click "01_RUN.bat."
xkas will then generate a new file called “02_TARGET.SFC” (or whatever name you specified in step 1).

4. Run the newly created ROM file using a Super Famicom emulator such as bsnes, Mesen, or SNES9x.
You can also run it on real Super Famicom hardware or compatible clone systems like SupaBoy or RetroN.

Note: the untouched ROM must be a headerless one. You can open the ROM using any Hex-editor to comfirm whether it has 0x200 bytes header or not.
If it does, you must delete this header using the Hex-editor.

The source code is available for free at:
https://github.com/stoneboat65816/