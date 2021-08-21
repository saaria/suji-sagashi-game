unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Menus, MMSYSTEM, MPlayer, ShellAPI, Registry;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    Panel1: TPanel;
    ProYOU: TProgressBar;
    Panel2: TPanel;
    TopPanel: TPanel;
    PYouScore: TPanel;
    PQuicken: TPanel;
    PHard: TPanel;
    PEasy: TPanel;
    PNormal: TPanel;
    PShuffle: TPanel;
    ProCPU: TProgressBar;
    PCpuScore: TPanel;
    PHell: TPanel;
    PPuls1: TPanel;
    PPuls2: TPanel;
    PPuls3: TPanel;
    PPuls4: TPanel;
    PCpuGet: TPanel;
    PExtend: TPanel;
    PGet2: TPanel;
    Memo1: TMemo;
    PShorten: TPanel;
    PHiding: TPanel;
    PSecret: TPanel;
    MainMenu1: TMainMenu;
    G1: TMenuItem;
    Start: TMenuItem;
    Exit1: TMenuItem;
    LvSelect: TMenuItem;
    lv0: TMenuItem;
    lv1: TMenuItem;
    lv2: TMenuItem;
    Help1: TMenuItem;
    H1: TMenuItem;
    About1: TMenuItem;
    CpuWait: TTimer;
    Navi: TTimer;
    MediaPlayer1: TMediaPlayer;
    lv3: TMenuItem;
    T1: TMenuItem;
    procedure lv0Click(Sender: TObject);
    procedure lv1Click(Sender: TObject);
    procedure lv2Click(Sender: TObject);
    procedure StartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NaviTimer(Sender: TObject);
    procedure CpuWaitTimer(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure lv3Click(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure T1Click(Sender: TObject);
  private
    //難易度       0=練習, 1=簡単, 2=普通, 3=難しい, 4=地獄
    Lv:Integer;
    //難易度補正値 0=+1, 1=+2, 2=+3, 3=+4
    Puls:Integer;
    //クリアスコア
    ClearScore:Integer;
    //オプション
    Extend, Shorten, Quicken, Shuffle, Get2, CpuGet, Hiding, Secret: boolean;
    //パネルカウント
    PanelCount:Integer;
    //ランダムで選ぶTString配列番号
    j:Integer;
    //探す数字
    TargetNum:String;
    //ボタン操作ロック
    BtnLock:boolean;
    //CPUによるクリック
    CpuClick:boolean;
    //スコア
    YouScore, CpuScore:Integer;
    //クリックされたボタンの判別
    ClickBtnNum:String;
    //ゲームが終了しているか
    EndGame:boolean;
    //
    firstplay:boolean;
    procedure SearchPanel(num:String);
    procedure CheckScore;
    procedure DisableBtn(num:String);
    procedure ResetBtnColor;
    procedure SetHideBtnColor;
    procedure EnableAllBtn;
    procedure DisableAllBtn;
    procedure lv4Set;
    //
    procedure SwitchExtend;
    procedure SwitchShorten;
    procedure SwitchQuicken;
    procedure SwitchShuffle;
    procedure SwitchGet2;
    procedure SwitchCpuGet;
    procedure SwitchHiding;
    procedure SwitchSecret;
    procedure SwitchPuls(num:Integer);
    //
    procedure ShufflePanel;
    procedure SetShufPanel(num:String; panelpos:String);
    procedure OptControl;
  public
    { Public 宣言 }
  end;

var
  Form1: TForm1;
  MyList: TStringList;
implementation

uses setpanel, about;

{$R *.dfm}
{$R 'sound.res'}

procedure TForm1.lv0Click(Sender: TObject);
begin
 Lv   := 0;
 Lv0.Checked := True;
 Lv1.Checked := False;
 Lv2.Checked := False;
 Lv3.Checked := False;
end;

procedure TForm1.lv1Click(Sender: TObject);
begin
 Lv   := 1;
 Lv0.Checked := False;
 Lv1.Checked := True;
 Lv2.Checked := False;
 Lv3.Checked := False;
end;

procedure TForm1.lv2Click(Sender: TObject);
begin
 Lv   := 2;
 Lv0.Checked := False;
 Lv1.Checked := False;
 Lv2.Checked := True;
 Lv3.Checked := False;
end;

procedure TForm1.lv3Click(Sender: TObject);
begin
 Lv   := 3;
 Lv0.Checked := False;
 Lv1.Checked := False;
 Lv2.Checked := False;
 Lv3.Checked := True;
end;

procedure TForm1.lv4Set;
begin
 Lv   := 4;
 Lv0.Checked := False;
 Lv1.Checked := False;
 Lv2.Checked := False;
 Lv3.Checked := False;
end;

procedure TForm1.StartClick(Sender: TObject);
var
 SetP: SetClass;
 i,musicnum:Integer;
  RS:TResourceStream;

begin
  Memo1.Lines.Clear;
          if Lv = 0 then begin
  Puls := 0;
  CpuWait.Interval := 5000;
  ClearScore := 20;
 end else if Lv = 1 then begin
  Puls := 0;
  CpuWait.Interval := 4000;
  ClearScore := 35;
 end else if Lv = 2 then begin
  Puls := 0;
  CpuWait.Interval := 3000;
  ClearScore := 33;
 end else if Lv = 3 then begin
  Puls := 0;
  CpuWait.Interval := 2000;
  ClearScore := 30;
 end else if Lv = 4 then begin
  Puls := 0;
  CpuWait.Interval := 1500;
  ClearScore := 25;
  Memo1.Lines.Add('Hellモードがスタートしました');
 end;

 Randomize;
 EnableAllBtn;
 ResetBtnColor;
 Navi.Enabled := False;
 CpuWait.Enabled := False;
 EndGame := False;
// LvSelect.Enabled := False;
 PYouScore.Caption := '0';
 PCpuScore.Caption := '0';
 ProYou.Position := 0;
 ProCpu.Position := 0;
 ProYou.Max := ClearScore;
 ProCpu.Max := 41-ClearScore;
 TopPanel.Caption := 'クリアスコア:'+IntToStr(ClearScore);
 YouScore := 0;
 CpuScore := 0;
 PanelCount := 0;
 BtnLock := True;
 CpuClick := False;
 ClickBtnNum := '0';

 Extend  := false;
 Shorten := false;
 Quicken := false;
 Shuffle := false;
 Get2    := false;
 CpuGet  := false;
 Hiding  := false;
 Secret  := false;

 PEasy.Color      := ClGray;
 PEasy.Font.Color := clSilver;
 PNormal.Color      := ClGray;
 PNormal.Font.Color := clSilver;
 PHard.Color      := ClGray;
 PHard.Font.Color := clSilver;
 PHell.Color      := ClGray;
 PHell.Font.Color := clSilver;
 PPuls1.Color      := ClGray;
 PPuls1.Font.Color := clSilver;
 PPuls2.Color      := ClGray;
 PPuls2.Font.Color := clSilver;
 PPuls3.Color      := ClGray;
 PPuls3.Font.Color := clSilver;
 PPuls4.Color      := ClGray;
 PPuls4.Font.Color := clSilver;
 PExtend.Color      := ClGray;
 PExtend.Font.Color := clSilver;
 PShorten.Color      := ClGray;
 PShorten.Font.Color := clSilver;
 PQuicken.Color      := ClGray;
 PQuicken.Font.Color := clSilver;
 PShuffle.Color      := ClGray;
 PShuffle.Font.Color := clSilver;
 PGet2.Color      := ClGray;
 PGet2.Font.Color := clSilver;
 PCpuGet.Color      := ClGray;
 PCpuGet.Font.Color := clSilver;
 PHiding.Color      := ClGray;
 PHiding.Font.Color := clSilver;
 PSecret.Color      := ClGray;
 PSecret.Font.Color := clSilver;

 if          Lv = 1 then begin
  PEasy.Color      := ClGreen;
  PEasy.Font.Color := clLime;
 end else if Lv = 2 then begin
  PNormal.Color      := ClGreen;
  PNormal.Font.Color := clLime;
 end else if Lv = 3 then begin
  PHard.Color      := ClGreen;
  PHard.Font.Color := clLime;
 end else if Lv = 4 then begin
  PHell.Color      := ClGreen;
  PHell.Font.Color := clLime;
 end;

 Randomize;

 //ここでランダム関数でパネルセットタイプ指定
 SetP := SetClass.Create;
 SetP.SetPanel(Random(9)+1);
 SetP.Free;

 MyList.Clear;
 for i := 1 to 40 do begin
  MyList.Add(IntToStr(i));
 end;

 if mediaPlayer1.DeviceID <> 0 then begin
  MediaPlayer1.Close;
 end;

// musicnum := Random(3)+1;

 if Lv <= 2 then musicnum := 1
 else musicnum := 3;

 if FileExists(ExtractFilePath(Application.ExeName)+'mdt_0'+IntToStr(musicnum)+'.mp3') = false then begin
  RS :=TResourceStream.Create(hInstance,'MDT'+IntToStr(musicnum),'MP3');
  try
    RS.SaveToFile(ExtractFilePath(Application.ExeName)+'mdt_0'+IntToStr(musicnum)+'.mp3');
  finally
    RS.Free;
  end;
 end;

 if FileExists(ExtractFilePath(Application.ExeName)+'mdt_0'+IntToStr(musicnum)+'.mp3') then begin
  MediaPlayer1.FileName := ExtractFilePath(Application.ExeName)+'mdt_0'+IntToStr(musicnum)+'.mp3';
  MediaPlayer1.Open;

//  if firstplay = true then begin
   MediaPlayer1.Play;
//   firstplay := false;
//  end else begin
//   if MediaPlayer1.Mode <> mpStopped then MediaPlayer1.Play;
//  end;
 end;
  
 Navi.Interval := 2000;
 Navi.Enabled := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 MyList := TStringList.Create;
 firstplay := true;
 lv0.Click;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 MyList.Free;
 if FileExists(ExtractFilePath(Application.ExeName)+'mdt_01.mp3') = True then
  DeleteFile(ExtractFilePath(Application.ExeName)+'mdt_01.mp3');
// if FileExists(ExtractFilePath(Application.ExeName)+'mdt_02.mp3') = True then
//  DeleteFile(ExtractFilePath(Application.ExeName)+'mdt_02.mp3');
 if FileExists(ExtractFilePath(Application.ExeName)+'mdt_03.mp3') = True then
  DeleteFile(ExtractFilePath(Application.ExeName)+'mdt_03.mp3');
// if FileExists(ExtractFilePath(Application.ExeName)+'mdt_04.mp3') = True then
//  DeleteFile(ExtractFilePath(Application.ExeName)+'mdt_04.mp3');

end;

procedure TForm1.NaviTimer(Sender: TObject);
begin
 if TopPanel.Caption <> '探す数字は..' then begin
  if ClickBtnNum <> '0' then DisableBtn(ClickBtnNum);
  OptControl;
  TopPanel.Caption := '探す数字は..';
 end else begin

  if MyList.Count = 20 then begin
   j := MyList.Count-1;
   TargetNum := MyList.Strings[j];
   MyList.Delete(j);
  end else begin
   j := Random(MyList.Count-1);
   TargetNum := MyList.Strings[j];
   MyList.Delete(j);
  end;
  
  if Secret = False then begin
   if Shuffle = True then ShufflePanel;
   if Get2 = False then
    TopPanel.Caption := TargetNum+'だ！'
   else
    TopPanel.Caption := IntToStr(StrToInt(TargetNum)*2)+'だ！';
  end else
   TopPanel.Caption := '??だ！';

  BtnLock := false;
  Navi.Enabled := False;
  CpuWait.Enabled := True;
 end;

end;

procedure TForm1.SearchPanel(num:String);
begin
 CpuClick := True;
      if BitBtn1.Caption = num then begin
  SendMessage(BitBtn1.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn1.Click;
  PostMessage(BitBtn1.Handle,BM_SETSTATE,0,0);
 end else if BitBtn2.Caption = num then begin
  SendMessage(BitBtn2.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn2.Click;
  PostMessage(BitBtn2.Handle,BM_SETSTATE,0,0);
 end else if BitBtn3.Caption = num then begin
  SendMessage(BitBtn3.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn3.Click;
  PostMessage(BitBtn3.Handle,BM_SETSTATE,0,0);
 end else if BitBtn4.Caption = num then begin
  SendMessage(BitBtn4.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn4.Click;
  PostMessage(BitBtn4.Handle,BM_SETSTATE,0,0);
 end else if BitBtn5.Caption = num then begin
  SendMessage(BitBtn5.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn5.Click;
  PostMessage(BitBtn5.Handle,BM_SETSTATE,0,0);
 end else if BitBtn6.Caption = num then begin
  SendMessage(BitBtn6.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn6.Click;
  PostMessage(BitBtn6.Handle,BM_SETSTATE,0,0);
 end else if BitBtn7.Caption = num then begin
  SendMessage(BitBtn7.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn7.Click;
  PostMessage(BitBtn7.Handle,BM_SETSTATE,0,0);
 end else if BitBtn8.Caption = num then begin
  SendMessage(BitBtn8.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn8.Click;
  PostMessage(BitBtn8.Handle,BM_SETSTATE,0,0);
 end else if BitBtn9.Caption = num then begin
  SendMessage(BitBtn9.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn9.Click;
  PostMessage(BitBtn9.Handle,BM_SETSTATE,0,0);
 end else if BitBtn10.Caption = num then begin
  SendMessage(BitBtn10.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn10.Click;
  PostMessage(BitBtn10.Handle,BM_SETSTATE,0,0);
 end else if BitBtn11.Caption = num then begin
  SendMessage(BitBtn11.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn11.Click;
  PostMessage(BitBtn11.Handle,BM_SETSTATE,0,0);
 end else if BitBtn12.Caption = num then begin
  SendMessage(BitBtn12.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn12.Click;
  PostMessage(BitBtn12.Handle,BM_SETSTATE,0,0);
 end else if BitBtn13.Caption = num then begin
  SendMessage(BitBtn13.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn13.Click;
  PostMessage(BitBtn13.Handle,BM_SETSTATE,0,0);
 end else if BitBtn14.Caption = num then begin
  SendMessage(BitBtn14.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn14.Click;
  PostMessage(BitBtn14.Handle,BM_SETSTATE,0,0);
 end else if BitBtn15.Caption = num then begin
  SendMessage(BitBtn15.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn15.Click;
  PostMessage(BitBtn15.Handle,BM_SETSTATE,0,0);
 end else if BitBtn16.Caption = num then begin
  SendMessage(BitBtn16.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn16.Click;
  PostMessage(BitBtn16.Handle,BM_SETSTATE,0,0);
 end else if BitBtn17.Caption = num then begin
  SendMessage(BitBtn17.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn17.Click;
  PostMessage(BitBtn17.Handle,BM_SETSTATE,0,0);
 end else if BitBtn18.Caption = num then begin
  SendMessage(BitBtn18.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn18.Click;
  PostMessage(BitBtn18.Handle,BM_SETSTATE,0,0);
 end else if BitBtn19.Caption = num then begin
  SendMessage(BitBtn19.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn19.Click;
  PostMessage(BitBtn19.Handle,BM_SETSTATE,0,0);
 end else if BitBtn20.Caption = num then begin
  SendMessage(BitBtn20.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn20.Click;
  PostMessage(BitBtn20.Handle,BM_SETSTATE,0,0);
 end else if BitBtn21.Caption = num then begin
  SendMessage(BitBtn21.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn21.Click;
  PostMessage(BitBtn21.Handle,BM_SETSTATE,0,0);
 end else if BitBtn22.Caption = num then begin
  SendMessage(BitBtn22.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn22.Click;
  PostMessage(BitBtn22.Handle,BM_SETSTATE,0,0);
 end else if BitBtn23.Caption = num then begin
  SendMessage(BitBtn23.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn23.Click;
  PostMessage(BitBtn23.Handle,BM_SETSTATE,0,0);
 end else if BitBtn24.Caption = num then begin
  SendMessage(BitBtn24.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn24.Click;
  PostMessage(BitBtn24.Handle,BM_SETSTATE,0,0);
 end else if BitBtn25.Caption = num then begin
  SendMessage(BitBtn25.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn25.Click;
  PostMessage(BitBtn25.Handle,BM_SETSTATE,0,0);
 end else if BitBtn26.Caption = num then begin
  SendMessage(BitBtn26.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn26.Click;
  PostMessage(BitBtn26.Handle,BM_SETSTATE,0,0);
 end else if BitBtn27.Caption = num then begin
  SendMessage(BitBtn27.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn27.Click;
  PostMessage(BitBtn27.Handle,BM_SETSTATE,0,0);
 end else if BitBtn28.Caption = num then begin
  SendMessage(BitBtn28.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn28.Click;
  PostMessage(BitBtn28.Handle,BM_SETSTATE,0,0);
 end else if BitBtn29.Caption = num then begin
  SendMessage(BitBtn29.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn29.Click;
  PostMessage(BitBtn29.Handle,BM_SETSTATE,0,0);
 end else if BitBtn30.Caption = num then begin
  SendMessage(BitBtn30.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn30.Click;
  PostMessage(BitBtn30.Handle,BM_SETSTATE,0,0);
 end else if BitBtn31.Caption = num then begin
  SendMessage(BitBtn31.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn31.Click;
  PostMessage(BitBtn31.Handle,BM_SETSTATE,0,0);
 end else if BitBtn32.Caption = num then begin
  SendMessage(BitBtn32.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn32.Click;
  PostMessage(BitBtn32.Handle,BM_SETSTATE,0,0);
 end else if BitBtn33.Caption = num then begin
  SendMessage(BitBtn33.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn33.Click;
  PostMessage(BitBtn33.Handle,BM_SETSTATE,0,0);
 end else if BitBtn34.Caption = num then begin
  SendMessage(BitBtn34.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn34.Click;
  PostMessage(BitBtn34.Handle,BM_SETSTATE,0,0);
 end else if BitBtn35.Caption = num then begin
  SendMessage(BitBtn35.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn35.Click;
  PostMessage(BitBtn35.Handle,BM_SETSTATE,0,0);
 end else if BitBtn36.Caption = num then begin
  SendMessage(BitBtn36.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn36.Click;
  PostMessage(BitBtn36.Handle,BM_SETSTATE,0,0);
 end else if BitBtn37.Caption = num then begin
  SendMessage(BitBtn37.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn37.Click;
  PostMessage(BitBtn37.Handle,BM_SETSTATE,0,0);
 end else if BitBtn38.Caption = num then begin
  SendMessage(BitBtn38.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn38.Click;
  PostMessage(BitBtn38.Handle,BM_SETSTATE,0,0);
 end else if BitBtn39.Caption = num then begin
  SendMessage(BitBtn39.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn39.Click;
  PostMessage(BitBtn39.Handle,BM_SETSTATE,0,0);
 end else if BitBtn40.Caption = num then begin
  SendMessage(BitBtn40.Handle,BM_SETSTATE,1,0);
  Sleep(50);
  BitBtn40.Click;
  PostMessage(BitBtn40.Handle,BM_SETSTATE,0,0);
 end;
end;

procedure TForm1.CpuWaitTimer(Sender: TObject);
begin
 CpuWait.Enabled := False;
 SearchPanel(TargetNum);
end;

procedure TForm1.CheckScore;
begin
 CpuClick := false;
 PYouScore.Caption := IntToStr(YouScore);
 PCpuScore.Caption := IntToStr(CpuScore);
 ProYou.Position := YouScore;
 ProCpu.Position := CpuScore;

 PanelCount := PanelCount+1;

 if PanelCount < 40 then begin
  if CpuScore >= 41-ClearScore then begin
   if ClickBtnNum <> '0' then DisableBtn(ClickBtnNum);
   TopPanel.Caption := 'GAME OVER';
   EndGame := True;
   DisableAllBtn;
  end else begin
   Navi.Enabled := True;
  end;
 end else begin
  if ClickBtnNum <> '0' then DisableBtn(ClickBtnNum);
  if Lv = 3 then begin
   lv4Set;
   Start.Click;
  end else begin
   if YouScore >= ClearScore then begin
    TopPanel.Caption := 'クリア！';
    EndGame := True;
    if Lv = 2 then
     if lv3.Enabled = False then begin
      Memo1.Lines.Add('Hardモードの選択が可能になりました');
      lv3.Enabled := True;
     end;
    DisableAllBtn;
   end else begin
   TopPanel.Caption := 'GAME OVER';
   EndGame := True;
   DisableAllBtn;
   end;
  end;
 end;
end;






procedure TForm1.BitBtn9Click(Sender: TObject);
var
 RS:TResourceStream;
begin
 if BtnLock = false then begin
  if TBitBtn(Sender).Caption = TargetNum then begin
   if CpuWait.Enabled = True then CpuWait.Enabled := False;
   BtnLock := true;
   if CpuClick = false then begin

    RS := TResourceStream.Create(hInstance,'YOUGET','WAVE');
    try
     sndPlaySound(RS.Memory,SND_MEMORY or SND_ASYNC);
    finally
     RS.Free;
    end;

    TBitBtn(Sender).Font.Color := ClGreen;
    YouScore := YouScore+1
   end else begin

    RS := TResourceStream.Create(hInstance,'CPUGET','WAVE');
    try
     sndPlaySound(RS.Memory,SND_MEMORY or SND_ASYNC);
    finally
     RS.Free;
    end;

    TBitBtn(Sender).Font.Color := ClMaroon;
    CpuScore := CpuScore+1
   end;
   ClickBtnNum := TargetNum;
   CheckScore;
  end else begin
   RS := TResourceStream.Create(hInstance,'NGNUM','WAVE');
   try
    sndPlaySound(RS.Memory,SND_MEMORY or SND_ASYNC);
   finally
    RS.Free;
   end;
  end;
 end else begin
  RS := TResourceStream.Create(hInstance,'NGNUM','WAVE');
  try
   sndPlaySound(RS.Memory,SND_MEMORY or SND_ASYNC);
  finally
   RS.Free;
  end;
 end;
end;

procedure TForm1.DisableBtn(num:String);
begin
      if BitBtn1.Caption = num then begin
  BitBtn1.Caption := '';
  BitBtn1.Enabled := False;
 end else if BitBtn2.Caption = num then begin
  BitBtn2.Caption := '';
  BitBtn2.Enabled := False;
 end else if BitBtn3.Caption = num then begin
  BitBtn3.Caption := '';
  BitBtn3.Enabled := False;
 end else if BitBtn4.Caption = num then begin
  BitBtn4.Caption := '';
  BitBtn4.Enabled := False;
 end else if BitBtn5.Caption = num then begin
  BitBtn5.Caption := '';
  BitBtn5.Enabled := False;
 end else if BitBtn6.Caption = num then begin
  BitBtn6.Caption := '';
  BitBtn6.Enabled := False;
 end else if BitBtn7.Caption = num then begin
  BitBtn7.Caption := '';
  BitBtn7.Enabled := False;
 end else if BitBtn8.Caption = num then begin
  BitBtn8.Caption := '';
  BitBtn8.Enabled := False;
 end else if BitBtn9.Caption = num then begin
  BitBtn9.Caption := '';
  BitBtn9.Enabled := False;
 end else if BitBtn10.Caption = num then begin
  BitBtn10.Caption := '';
  BitBtn10.Enabled := False;
 end else if BitBtn11.Caption = num then begin
  BitBtn11.Caption := '';
  BitBtn11.Enabled := False;
 end else if BitBtn12.Caption = num then begin
  BitBtn12.Caption := '';
  BitBtn12.Enabled := False;
 end else if BitBtn13.Caption = num then begin
  BitBtn13.Caption := '';
  BitBtn13.Enabled := False;
 end else if BitBtn14.Caption = num then begin
  BitBtn14.Caption := '';
  BitBtn14.Enabled := False;
 end else if BitBtn15.Caption = num then begin
  BitBtn15.Caption := '';
  BitBtn15.Enabled := False;
 end else if BitBtn16.Caption = num then begin
  BitBtn16.Caption := '';
  BitBtn16.Enabled := False;
 end else if BitBtn17.Caption = num then begin
  BitBtn17.Caption := '';
  BitBtn17.Enabled := False;
 end else if BitBtn18.Caption = num then begin
  BitBtn18.Caption := '';
  BitBtn18.Enabled := False;
 end else if BitBtn19.Caption = num then begin
  BitBtn19.Caption := '';
  BitBtn19.Enabled := False;
 end else if BitBtn20.Caption = num then begin
  BitBtn20.Caption := '';
  BitBtn20.Enabled := False;
 end else if BitBtn21.Caption = num then begin
  BitBtn21.Caption := '';
  BitBtn21.Enabled := False;
 end else if BitBtn22.Caption = num then begin
  BitBtn22.Caption := '';
  BitBtn22.Enabled := False;
 end else if BitBtn23.Caption = num then begin
  BitBtn23.Caption := '';
  BitBtn23.Enabled := False;
 end else if BitBtn24.Caption = num then begin
  BitBtn24.Caption := '';
  BitBtn24.Enabled := False;
 end else if BitBtn25.Caption = num then begin
  BitBtn25.Caption := '';
  BitBtn25.Enabled := False;
 end else if BitBtn26.Caption = num then begin
  BitBtn26.Caption := '';
  BitBtn26.Enabled := False;
 end else if BitBtn27.Caption = num then begin
  BitBtn27.Caption := '';
  BitBtn27.Enabled := False;
 end else if BitBtn28.Caption = num then begin
  BitBtn28.Caption := '';
  BitBtn28.Enabled := False;
 end else if BitBtn29.Caption = num then begin
  BitBtn29.Caption := '';
  BitBtn29.Enabled := False;
 end else if BitBtn30.Caption = num then begin
  BitBtn30.Caption := '';
  BitBtn30.Enabled := False;
 end else if BitBtn31.Caption = num then begin
  BitBtn31.Caption := '';
  BitBtn31.Enabled := False;
 end else if BitBtn32.Caption = num then begin
  BitBtn32.Caption := '';
  BitBtn32.Enabled := False;
 end else if BitBtn33.Caption = num then begin
  BitBtn33.Caption := '';
  BitBtn33.Enabled := False;
 end else if BitBtn34.Caption = num then begin
  BitBtn34.Caption := '';
  BitBtn34.Enabled := False;
 end else if BitBtn35.Caption = num then begin
  BitBtn35.Caption := '';
  BitBtn35.Enabled := False;
 end else if BitBtn36.Caption = num then begin
  BitBtn36.Caption := '';
  BitBtn36.Enabled := False;
 end else if BitBtn37.Caption = num then begin
  BitBtn37.Caption := '';
  BitBtn37.Enabled := False;
 end else if BitBtn38.Caption = num then begin
  BitBtn38.Caption := '';
  BitBtn38.Enabled := False;
 end else if BitBtn39.Caption = num then begin
  BitBtn39.Caption := '';
  BitBtn39.Enabled := False;
 end else if BitBtn40.Caption = num then begin
  BitBtn40.Caption := '';
  BitBtn40.Enabled := False;
 end;
 ClickBtnNum := '0';
end;

procedure TForm1.ResetBtnColor;
begin
 BitBtn1.Font.Color := clBlack;
 BitBtn2.Font.Color := clBlack;
 BitBtn3.Font.Color := clBlack;
 BitBtn4.Font.Color := clBlack;
 BitBtn5.Font.Color := clBlack;
 BitBtn6.Font.Color := clBlack;
 BitBtn7.Font.Color := clBlack;
 BitBtn8.Font.Color := clBlack;
 BitBtn9.Font.Color := clBlack;
 BitBtn10.Font.Color := clBlack;
 BitBtn11.Font.Color := clBlack;
 BitBtn12.Font.Color := clBlack;
 BitBtn13.Font.Color := clBlack;
 BitBtn14.Font.Color := clBlack;
 BitBtn15.Font.Color := clBlack;
 BitBtn16.Font.Color := clBlack;
 BitBtn17.Font.Color := clBlack;
 BitBtn18.Font.Color := clBlack;
 BitBtn19.Font.Color := clBlack;
 BitBtn20.Font.Color := clBlack;
 BitBtn21.Font.Color := clBlack;
 BitBtn22.Font.Color := clBlack;
 BitBtn23.Font.Color := clBlack;
 BitBtn24.Font.Color := clBlack;
 BitBtn25.Font.Color := clBlack;
 BitBtn26.Font.Color := clBlack;
 BitBtn27.Font.Color := clBlack;
 BitBtn28.Font.Color := clBlack;
 BitBtn29.Font.Color := clBlack;
 BitBtn30.Font.Color := clBlack;
 BitBtn31.Font.Color := clBlack;
 BitBtn32.Font.Color := clBlack;
 BitBtn33.Font.Color := clBlack;
 BitBtn34.Font.Color := clBlack;
 BitBtn35.Font.Color := clBlack;
 BitBtn36.Font.Color := clBlack;
 BitBtn37.Font.Color := clBlack;
 BitBtn38.Font.Color := clBlack;
 BitBtn39.Font.Color := clBlack;
 BitBtn40.Font.Color := clBlack;
end;

procedure TForm1.SetHideBtnColor;
begin
 BitBtn1.Font.Color := clBtnFace;
 BitBtn2.Font.Color := clBtnFace;
 BitBtn3.Font.Color := clBtnFace;
 BitBtn4.Font.Color := clBtnFace;
 BitBtn5.Font.Color := clBtnFace;
 BitBtn6.Font.Color := clBtnFace;
 BitBtn7.Font.Color := clBtnFace;
 BitBtn8.Font.Color := clBtnFace;
 BitBtn9.Font.Color := clBtnFace;
 BitBtn10.Font.Color := clBtnFace;
 BitBtn11.Font.Color := clBtnFace;
 BitBtn12.Font.Color := clBtnFace;
 BitBtn13.Font.Color := clBtnFace;
 BitBtn14.Font.Color := clBtnFace;
 BitBtn15.Font.Color := clBtnFace;
 BitBtn16.Font.Color := clBtnFace;
 BitBtn17.Font.Color := clBtnFace;
 BitBtn18.Font.Color := clBtnFace;
 BitBtn19.Font.Color := clBtnFace;
 BitBtn20.Font.Color := clBtnFace;
 BitBtn21.Font.Color := clBtnFace;
 BitBtn22.Font.Color := clBtnFace;
 BitBtn23.Font.Color := clBtnFace;
 BitBtn24.Font.Color := clBtnFace;
 BitBtn25.Font.Color := clBtnFace;
 BitBtn26.Font.Color := clBtnFace;
 BitBtn27.Font.Color := clBtnFace;
 BitBtn28.Font.Color := clBtnFace;
 BitBtn29.Font.Color := clBtnFace;
 BitBtn30.Font.Color := clBtnFace;
 BitBtn31.Font.Color := clBtnFace;
 BitBtn32.Font.Color := clBtnFace;
 BitBtn33.Font.Color := clBtnFace;
 BitBtn34.Font.Color := clBtnFace;
 BitBtn35.Font.Color := clBtnFace;
 BitBtn36.Font.Color := clBtnFace;
 BitBtn37.Font.Color := clBtnFace;
 BitBtn38.Font.Color := clBtnFace;
 BitBtn39.Font.Color := clBtnFace;
 BitBtn40.Font.Color := clBtnFace;
end;

procedure TForm1.EnableAllBtn;
begin
 BitBtn1.Enabled := True;
 BitBtn2.Enabled := True;
 BitBtn3.Enabled := True;
 BitBtn4.Enabled := True;
 BitBtn5.Enabled := True;
 BitBtn6.Enabled := True;
 BitBtn7.Enabled := True;
 BitBtn8.Enabled := True;
 BitBtn9.Enabled := True;
 BitBtn10.Enabled := True;
 BitBtn11.Enabled := True;
 BitBtn12.Enabled := True;
 BitBtn13.Enabled := True;
 BitBtn14.Enabled := True;
 BitBtn15.Enabled := True;
 BitBtn16.Enabled := True;
 BitBtn17.Enabled := True;
 BitBtn18.Enabled := True;
 BitBtn19.Enabled := True;
 BitBtn20.Enabled := True;
 BitBtn21.Enabled := True;
 BitBtn22.Enabled := True;
 BitBtn23.Enabled := True;
 BitBtn24.Enabled := True;
 BitBtn25.Enabled := True;
 BitBtn26.Enabled := True;
 BitBtn27.Enabled := True;
 BitBtn28.Enabled := True;
 BitBtn29.Enabled := True;
 BitBtn30.Enabled := True;
 BitBtn31.Enabled := True;
 BitBtn32.Enabled := True;
 BitBtn33.Enabled := True;
 BitBtn34.Enabled := True;
 BitBtn35.Enabled := True;
 BitBtn36.Enabled := True;
 BitBtn37.Enabled := True;
 BitBtn38.Enabled := True;
 BitBtn39.Enabled := True;
 BitBtn40.Enabled := True;
end;

procedure TForm1.DisableAllBtn;
begin
 BitBtn1.Enabled := False;
 BitBtn2.Enabled := False;
 BitBtn3.Enabled := False;
 BitBtn4.Enabled := False;
 BitBtn5.Enabled := False;
 BitBtn6.Enabled := False;
 BitBtn7.Enabled := False;
 BitBtn8.Enabled := False;
 BitBtn9.Enabled := False;
 BitBtn10.Enabled := False;
 BitBtn11.Enabled := False;
 BitBtn12.Enabled := False;
 BitBtn13.Enabled := False;
 BitBtn14.Enabled := False;
 BitBtn15.Enabled := False;
 BitBtn16.Enabled := False;
 BitBtn17.Enabled := False;
 BitBtn18.Enabled := False;
 BitBtn19.Enabled := False;
 BitBtn20.Enabled := False;
 BitBtn21.Enabled := False;
 BitBtn22.Enabled := False;
 BitBtn23.Enabled := False;
 BitBtn24.Enabled := False;
 BitBtn25.Enabled := False;
 BitBtn26.Enabled := False;
 BitBtn27.Enabled := False;
 BitBtn28.Enabled := False;
 BitBtn29.Enabled := False;
 BitBtn30.Enabled := False;
 BitBtn31.Enabled := False;
 BitBtn32.Enabled := False;
 BitBtn33.Enabled := False;
 BitBtn34.Enabled := False;
 BitBtn35.Enabled := False;
 BitBtn36.Enabled := False;
 BitBtn37.Enabled := False;
 BitBtn38.Enabled := False;
 BitBtn39.Enabled := False;
 BitBtn40.Enabled := False;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
 Form1.Close;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
 AboutBox.Show;
end;

procedure TForm1.MediaPlayer1Notify(Sender: TObject);
begin
// if EndGame = False then MediaPlayer1.Play
// else firstplay := true;
// else opened := false;
end;

procedure TForm1.SwitchExtend;
var
 RS:TResourceStream;
begin
 if Extend = False then begin
  RS := TResourceStream.Create(hInstance,'OPTON','WAVE');
  try
   sndPlaySound(RS.Memory,SND_MEMORY or SND_ASYNC);
  finally
   RS.Free;
  end;
  Memo1.Lines.Add('CPU待ち時間の延長が適用されました');
  Extend := True;
  PExtend.Color      := clGreen;
  PExtend.Font.Color := clLime;
  CpuWait.Interval := CpuWait.Interval+1000;
 end else begin
  Memo1.Lines.Add('CPU待ち時間の延長が解除されました');
  Extend := False;
  PExtend.Color      := clGray;
  PExtend.Font.Color := clSilver;
  CpuWait.Interval := CpuWait.Interval-1000;
 end;
end;

procedure TForm1.SwitchShorten;
var
 RS:TResourceStream;
begin
 if Shorten = False then begin
  RS := TResourceStream.Create(hInstance,'OPTON','WAVE');
  try
   sndPlaySound(RS.Memory,SND_MEMORY or SND_ASYNC);
  finally
   RS.Free;
  end;
  Memo1.Lines.Add('CPU待ち時間の短縮が適用されました');
  Shorten := True;
  PShorten.Color      := clGreen;
  PShorten.Font.Color := clLime;
  if Lv = 4 then
   CpuWait.Interval := CpuWait.Interval-500
  else if Lv = 3 then
   CpuWait.Interval := CpuWait.Interval-500
  else
   CpuWait.Interval := CpuWait.Interval-1000;
 end else begin
  Memo1.Lines.Add('CPU待ち時間の短縮が解除されました');
  Shorten := False;
  PShorten.Color      := clGray;
  PShorten.Font.Color := clSilver;
  if Lv = 4 then
   CpuWait.Interval := CpuWait.Interval+500
  else if Lv = 3 then
   CpuWait.Interval := CpuWait.Interval+500
  else
   CpuWait.Interval := CpuWait.Interval+1000;
 end;
end;

procedure TForm1.SwitchQuicken;
var
 RS:TResourceStream;
begin
 if Quicken = False then begin
  RS := TResourceStream.Create(hInstance,'OPTON','WAVE');
  try
   sndPlaySound(RS.Memory,SND_MEMORY or SND_ASYNC);
  finally
   RS.Free;
  end;
  Memo1.Lines.Add('ナビ表示間隔時間の短縮が適用されました');
  Quicken := True;
  PQuicken.Color      := clGreen;
  PQuicken.Font.Color := clLime;
  Navi.Interval := 250;
 end else begin
  Memo1.Lines.Add('ナビ表示間隔時間の短縮が解除されました');
  Quicken := False;
  PQuicken.Color      := clGray;
  PQuicken.Font.Color := clSilver;
  Navi.Interval := 2000;
 end;
end;

procedure TForm1.SwitchShuffle;
var
 RS:TResourceStream;
begin
 if Shuffle = False then begin
  RS := TResourceStream.Create(hInstance,'OPTON','WAVE');
  try
   sndPlaySound(RS.Memory,SND_MEMORY or SND_ASYNC);
  finally
   RS.Free;
  end;
  Memo1.Lines.Add('パネルのシャッフルが適用されました');
  Shuffle := True;
  PShuffle.Color      := clGreen;
  PShuffle.Font.Color := clLime;
 end else begin
  Memo1.Lines.Add('パネルのシャッフルが解除されました');
  Shuffle := False;
  PShuffle.Color      := clGray;
  PShuffle.Font.Color := clSilver;
 end;
end;

procedure TForm1.SwitchGet2;
var
 RS:TResourceStream;
begin
 if Get2 = False then begin
  RS := TResourceStream.Create(hInstance,'OPTON','WAVE');
  try
   sndPlaySound(RS.Memory,SND_MEMORY or SND_ASYNC);
  finally
   RS.Free;
  end;
  Memo1.Lines.Add('探索数字の２倍表示が適用されました');
  Get2 := True;
  PGet2.Color      := clGreen;
  PGet2.Font.Color := clLime;
 end else begin
  Memo1.Lines.Add('探索数字の２倍表示が解除されました');
  Get2 := False;
  PGet2.Color      := clGray;
  PGet2.Font.Color := clSilver;
 end;
end;

procedure TForm1.SwitchCpuGet;
var
 RS:TResourceStream;
begin
 if CpuGet = False then begin
  RS := TResourceStream.Create(hInstance,'OPTON','WAVE');
  try
   sndPlaySound(RS.Memory,SND_MEMORY or SND_ASYNC);
  finally
   RS.Free;
  end;
  CpuGet := True;
  PCpuGet.Color      := clGreen;
  PCpuGet.Font.Color := clLime;
  CpuWait.Interval := 1;
 end else begin
  CpuGet := False;
  PCpuGet.Color      := clGray;
  PCpuGet.Font.Color := clSilver;
  if Lv = 4 then
   CpuWait.Interval := 1500
  else if Lv = 3 then
   CpuWait.Interval := 2000
  else if Lv = 2 then
   CpuWait.Interval := 3000
  else if Lv = 1 then
   CpuWait.Interval := 4000
  else if Lv = 0 then
   CpuWait.Interval := 5000;
 end;
end;

procedure TForm1.SwitchHiding;
var
 RS:TResourceStream;
begin
 if Hiding = False then begin
  RS := TResourceStream.Create(hInstance,'OPTON','WAVE');
  try
   sndPlaySound(RS.Memory,SND_MEMORY or SND_ASYNC);
  finally
   RS.Free;
  end;
  Memo1.Lines.Add('パネルの非表示が適用されました');
  Hiding := True;
  PHiding.Color      := clGreen;
  PHiding.Font.Color := clLime;
  SetHideBtnColor;
 end else begin
  Memo1.Lines.Add('パネルの非表示が解除されました');
  Hiding := False;
  PHiding.Color      := clGray;
  PHiding.Font.Color := clSilver;
  ResetBtnColor;
 end;

end;

procedure TForm1.SwitchSecret;
var
 RS:TResourceStream;
begin
 if Secret = False then begin
  RS := TResourceStream.Create(hInstance,'OPTON','WAVE');
  try
   sndPlaySound(RS.Memory,SND_MEMORY or SND_ASYNC);
  finally
   RS.Free;
  end;
  Memo1.Lines.Add('探索数字の非表示が適用されました');
  Secret := True;
  PSecret.Color      := clGreen;
  PSecret.Font.Color := clLime;
 end else begin
  Memo1.Lines.Add('探索数字の非表示が解除されました');
  Secret := False;
  PSecret.Color      := clGray;
  PSecret.Font.Color := clSilver;
 end;
end;

procedure TForm1.SwitchPuls(num:Integer);
begin
 if num = 1 then begin
  Puls := num;
  PPuls1.Color      := clGreen;
  PPuls1.Font.Color := clLime;
  PPuls2.Color      := clGray;
  PPuls2.Font.Color := clSilver;
  PPuls3.Color      := clGray;
  PPuls3.Font.Color := clSilver;
  PPuls4.Color      := clGray;
  PPuls4.Font.Color := clSilver;
 end else if num = 2 then begin
  Puls := num;
  PPuls2.Color      := clGreen;
  PPuls2.Font.Color := clLime;
  PPuls1.Color      := clGray;
  PPuls1.Font.Color := clSilver;
  PPuls3.Color      := clGray;
  PPuls3.Font.Color := clSilver;
  PPuls4.Color      := clGray;
  PPuls4.Font.Color := clSilver;
 end else if num = 3 then begin
  Puls := num;
  PPuls3.Color      := clGreen;
  PPuls3.Font.Color := clLime;
  PPuls2.Color      := clGray;
  PPuls2.Font.Color := clSilver;
  PPuls1.Color      := clGray;
  PPuls1.Font.Color := clSilver;
  PPuls4.Color      := clGray;
  PPuls4.Font.Color := clSilver;
 end else if num = 4 then begin
  Puls := num;
  PPuls4.Color      := clGreen;
  PPuls4.Font.Color := clLime;
  PPuls2.Color      := clGray;
  PPuls2.Font.Color := clSilver;
  PPuls3.Color      := clGray;
  PPuls3.Font.Color := clSilver;
  PPuls1.Color      := clGray;
  PPuls1.Font.Color := clSilver;
 end;
end;

procedure TForm1.OptControl;
begin

   if Lv = 1 then begin
    //START OF Lv1
    if PanelCount >= 15 then begin
     if Puls = 0 then
      SwitchPuls(1);
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if Shorten = False then SwitchShorten;
     end else begin
      if Shorten = True  then SwitchShorten;
     end;
    end;
    //END OF Lv1

   end else if Lv = 2 then begin
    //START OF Lv2

    if PanelCount = 8 then begin
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if CpuGet = False then SwitchCpuGet;
     end;
    end;
    if PanelCount = 9 then begin
      if CpuGet = True  then SwitchCpuGet;
    end;

    if PanelCount >= 10 then begin
     if Puls = 0 then
      SwitchPuls(1);
      if Shorten = False then SwitchShorten;
    end;

    if PanelCount >= 18 then begin
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if Puls = 1 then
       SwitchPuls(2);
      if Quicken = False then SwitchQuicken;
     end;
    end;

    if PanelCount = 23 then begin
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if Hiding = False then SwitchHiding;
     end;
    end;
    if PanelCount = 24 then begin
      if Hiding = True  then SwitchHiding;
    end;

    if PanelCount >= 25 then begin
      if Shuffle = False  then SwitchShuffle;
    end;

    if PanelCount = 33 then begin
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if Puls = 2 then
       SwitchPuls(3);
      if Secret = False then SwitchSecret;
     end;
    end;

    if PanelCount = 34 then begin
      if Secret = True  then SwitchSecret;
    end;


    if PanelCount >= 35 then begin
      if Puls = 3 then
       SwitchPuls(4);
      if Get2 = False  then SwitchGet2;
    end;

    if PanelCount = 39 then begin
      if CpuGet = False  then SwitchCpuGet;
    end;

    //END OF Lv2

   end else if Lv = 3 then begin
    //START OF Lv3
    if PanelCount = 3 then begin
     if StrToInt(PCpuScore.Caption) > StrToInt(PYouScore.Caption) then begin
      if Extend = False then SwitchExtend;
     end;
    end;
    if PanelCount = 4 then begin
      if Extend = True then SwitchExtend;
    end;
    if PanelCount >= 10 then begin
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if Puls = 0 then
       SwitchPuls(1);
      if Shorten = False then SwitchShorten;
     end;
    end;
    if PanelCount >= 25 then begin
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if Puls = 1 then
       SwitchPuls(2);
      if Shuffle = False then SwitchShuffle;
     end;
    end;
    if PanelCount >= 30 then begin
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if Puls = 2 then
       SwitchPuls(3);
      if Get2 = False then SwitchGet2;
     end;
    end;
    if PanelCount >= 35 then begin
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if Puls = 3 then
       SwitchPuls(4);
      if Quicken = False then SwitchQuicken;
     end;
    end;

    //END OF Lv3
   end else if Lv = 4 then begin

    if PanelCount >= 10 then begin
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if Puls = 0 then
       SwitchPuls(1);
      if Get2 = False then SwitchGet2;
     end;
    end;
    if PanelCount >= 13 then begin
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if Puls = 1 then
       SwitchPuls(2);
      if Shuffle = False then SwitchShuffle;
     end;
    end;
    if PanelCount = 13 then begin
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if Secret = False then SwitchSecret;
     end;
    end;
    if PanelCount = 14 then begin
      if Secret = True then SwitchSecret;
    end;
    if PanelCount >= 17 then begin
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if Puls = 2 then
       SwitchPuls(3);
      if Quicken = False then SwitchQuicken;
     end;
    end;
    if PanelCount >= 20 then begin
     if StrToInt(PCpuScore.Caption) < StrToInt(PYouScore.Caption) then begin
      if Puls = 3 then
       SwitchPuls(4);
      if Shorten = False then SwitchShorten;
     end;
    end;

   end;

end;

procedure TForm1.ShufflePanel;
var
 PanelPos, PanelNum:TStringList;
 i,count:Integer;
begin
PanelPos := TStringList.Create;
 try
  PanelNum := TStringList.Create;
  try
   PanelPos.Clear;
   PanelNum.Clear;
   count := 0;

 if BitBtn1.Caption <> '' then begin
  PanelNum.Add(BitBtn1.Caption);
  PanelPos.Add('1');
 end;
 if BitBtn2.Caption <> '' then begin
  PanelNum.Add(BitBtn2.Caption);
  PanelPos.Add('2');
 end;
 if BitBtn3.Caption <> '' then begin
  PanelNum.Add(BitBtn3.Caption);
  PanelPos.Add('3');
 end;
 if BitBtn4.Caption <> '' then begin
  PanelNum.Add(BitBtn4.Caption);
  PanelPos.Add('4');
 end;
 if BitBtn5.Caption <> '' then begin
  PanelNum.Add(BitBtn5.Caption);
  PanelPos.Add('5');
 end;
 if BitBtn6.Caption <> '' then begin
  PanelNum.Add(BitBtn6.Caption);
  PanelPos.Add('6');
 end;
 if BitBtn7.Caption <> '' then begin
  PanelNum.Add(BitBtn7.Caption);
  PanelPos.Add('7');
 end;
 if BitBtn8.Caption <> '' then begin
  PanelNum.Add(BitBtn8.Caption);
  PanelPos.Add('8');
 end;
 if BitBtn9.Caption <> '' then begin
  PanelNum.Add(BitBtn9.Caption);
  PanelPos.Add('9');
 end;
 if BitBtn10.Caption <> '' then begin
  PanelNum.Add(BitBtn10.Caption);
  PanelPos.Add('10');
 end;
 if BitBtn11.Caption <> '' then begin
  PanelNum.Add(BitBtn11.Caption);
  PanelPos.Add('11');
 end;
 if BitBtn12.Caption <> '' then begin
  PanelNum.Add(BitBtn12.Caption);
  PanelPos.Add('12');
 end;
 if BitBtn13.Caption <> '' then begin
  PanelNum.Add(BitBtn13.Caption);
  PanelPos.Add('13');
 end;
 if BitBtn14.Caption <> '' then begin
  PanelNum.Add(BitBtn14.Caption);
  PanelPos.Add('14');
 end;
 if BitBtn15.Caption <> '' then begin
  PanelNum.Add(BitBtn15.Caption);
  PanelPos.Add('15');
 end;
 if BitBtn16.Caption <> '' then begin
  PanelNum.Add(BitBtn16.Caption);
  PanelPos.Add('16');
 end;
 if BitBtn17.Caption <> '' then begin
  PanelNum.Add(BitBtn17.Caption);
  PanelPos.Add('17');
 end;
 if BitBtn18.Caption <> '' then begin
  PanelNum.Add(BitBtn18.Caption);
  PanelPos.Add('18');
 end;
 if BitBtn19.Caption <> '' then begin
  PanelNum.Add(BitBtn19.Caption);
  PanelPos.Add('19');
 end;
 if BitBtn20.Caption <> '' then begin
  PanelNum.Add(BitBtn20.Caption);
  PanelPos.Add('20');
 end;
 if BitBtn21.Caption <> '' then begin
  PanelNum.Add(BitBtn21.Caption);
  PanelPos.Add('21');
 end;
 if BitBtn22.Caption <> '' then begin
  PanelNum.Add(BitBtn22.Caption);
  PanelPos.Add('22');
 end;
 if BitBtn23.Caption <> '' then begin
  PanelNum.Add(BitBtn23.Caption);
  PanelPos.Add('23');
 end;
 if BitBtn24.Caption <> '' then begin
  PanelNum.Add(BitBtn24.Caption);
  PanelPos.Add('24');
 end;
 if BitBtn25.Caption <> '' then begin
  PanelNum.Add(BitBtn25.Caption);
  PanelPos.Add('25');
 end;
 if BitBtn26.Caption <> '' then begin
  PanelNum.Add(BitBtn26.Caption);
  PanelPos.Add('26');
 end;
 if BitBtn27.Caption <> '' then begin
  PanelNum.Add(BitBtn27.Caption);
  PanelPos.Add('27');
 end;
 if BitBtn28.Caption <> '' then begin
  PanelNum.Add(BitBtn28.Caption);
  PanelPos.Add('28');
 end;
 if BitBtn29.Caption <> '' then begin
  PanelNum.Add(BitBtn29.Caption);
  PanelPos.Add('29');
 end;
 if BitBtn30.Caption <> '' then begin
  PanelNum.Add(BitBtn30.Caption);
  PanelPos.Add('30');
 end;
 if BitBtn31.Caption <> '' then begin
  PanelNum.Add(BitBtn31.Caption);
  PanelPos.Add('31');
 end;
 if BitBtn32.Caption <> '' then begin
  PanelNum.Add(BitBtn32.Caption);
  PanelPos.Add('32');
 end;
 if BitBtn33.Caption <> '' then begin
  PanelNum.Add(BitBtn33.Caption);
  PanelPos.Add('33');
 end;
 if BitBtn34.Caption <> '' then begin
  PanelNum.Add(BitBtn34.Caption);
  PanelPos.Add('34');
 end;
 if BitBtn35.Caption <> '' then begin
  PanelNum.Add(BitBtn35.Caption);
  PanelPos.Add('35');
 end;
 if BitBtn36.Caption <> '' then begin
  PanelNum.Add(BitBtn36.Caption);
  PanelPos.Add('36');
 end;
 if BitBtn37.Caption <> '' then begin
  PanelNum.Add(BitBtn37.Caption);
  PanelPos.Add('37');
 end;
 if BitBtn38.Caption <> '' then begin
  PanelNum.Add(BitBtn38.Caption);
  PanelPos.Add('38');
 end;
 if BitBtn39.Caption <> '' then begin
  PanelNum.Add(BitBtn39.Caption);
  PanelPos.Add('39');
 end;
 if BitBtn40.Caption <> '' then begin
  PanelNum.Add(BitBtn40.Caption);
  PanelPos.Add('40');
 end;

  repeat
   i := Random(PanelNum.Count-1);
//   Memo1.Lines.Add('PanelNumCount='+IntToSTr(PanelNum.Count));
//   Memo1.Lines.Add('Num='+PanelNum.Strings[i]+'Pos='+PanelPos.Strings[count]);
   SetShufPanel(PanelNum.Strings[i], PanelPos.Strings[count]);
   PanelNum.Delete(i);
   count := count+1;
  until PanelNum.Count < 1;

  finally
   PanelNum.Free;
  end;
 finally
  PanelPos.Free;
 end;

end;

procedure TForm1.SetShufPanel(num:String; panelpos:String);
begin
          if panelpos = '1' then begin
  BitBtn1.Caption := num;
 end else if panelpos = '2' then begin
  BitBtn2.Caption := num;
 end else if panelpos = '3' then begin
  BitBtn3.Caption := num;
 end else if panelpos = '4' then begin
  BitBtn4.Caption := num;
 end else if panelpos = '5' then begin
  BitBtn5.Caption := num;
 end else if panelpos = '6' then begin
  BitBtn6.Caption := num;
 end else if panelpos = '7' then begin
  BitBtn7.Caption := num;
 end else if panelpos = '8' then begin
  BitBtn8.Caption := num;
 end else if panelpos = '9' then begin
  BitBtn9.Caption := num;
 end else if panelpos = '10' then begin
  BitBtn10.Caption := num;
 end else if panelpos = '11' then begin
  BitBtn11.Caption := num;
 end else if panelpos = '12' then begin
  BitBtn12.Caption := num;
 end else if panelpos = '13' then begin
  BitBtn13.Caption := num;
 end else if panelpos = '14' then begin
  BitBtn14.Caption := num;
 end else if panelpos = '15' then begin
  BitBtn15.Caption := num;
 end else if panelpos = '16' then begin
  BitBtn16.Caption := num;
 end else if panelpos = '17' then begin
  BitBtn17.Caption := num;
 end else if panelpos = '18' then begin
  BitBtn18.Caption := num;
 end else if panelpos = '19' then begin
  BitBtn19.Caption := num;
 end else if panelpos = '20' then begin
  BitBtn20.Caption := num;
 end else if panelpos = '21' then begin
  BitBtn21.Caption := num;
 end else if panelpos = '22' then begin
  BitBtn22.Caption := num;
 end else if panelpos = '23' then begin
  BitBtn23.Caption := num;
 end else if panelpos = '24' then begin
  BitBtn24.Caption := num;
 end else if panelpos = '25' then begin
  BitBtn25.Caption := num;
 end else if panelpos = '26' then begin
  BitBtn26.Caption := num;
 end else if panelpos = '27' then begin
  BitBtn27.Caption := num;
 end else if panelpos = '28' then begin
  BitBtn28.Caption := num;
 end else if panelpos = '29' then begin
  BitBtn29.Caption := num;
 end else if panelpos = '30' then begin
  BitBtn30.Caption := num;
 end else if panelpos = '31' then begin
  BitBtn31.Caption := num;
 end else if panelpos = '32' then begin
  BitBtn32.Caption := num;
 end else if panelpos = '33' then begin
  BitBtn33.Caption := num;
 end else if panelpos = '34' then begin
  BitBtn34.Caption := num;
 end else if panelpos = '35' then begin
  BitBtn35.Caption := num;
 end else if panelpos = '36' then begin
  BitBtn36.Caption := num;
 end else if panelpos = '37' then begin
  BitBtn37.Caption := num;
 end else if panelpos = '38' then begin
  BitBtn38.Caption := num;
 end else if panelpos = '39' then begin
  BitBtn39.Caption := num;
 end else if panelpos = '40' then begin
  BitBtn40.Caption := num;
 end;

end;


procedure TForm1.H1Click(Sender: TObject);
begin
 if FileExists(ExtractFilePath(Application.ExeName)+'\htm\manual.htm') = true then
  ShellExecute(0,'open',PChar(ExtractFilePath(Application.ExeName)+'\htm\manual.htm'),nil,nil,SW_SHOWNORMAL);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
Reg : TRegistry;
begin

 Reg := TRegistry.Create;

 //サブキー作成
 Reg.CreateKey('suji');

 Reg.OpenKey('suji',True);

 //Topを格納
 Reg.WriteInteger('Top',Form1.Top);
 //Leftを格納
 Reg.WriteInteger('Left',Form1.Left);
 //Widthを格納
 Reg.WriteInteger('Width',Form1.Width);
 //Heightを格納
 Reg.WriteInteger('Height',Form1.Height);

 Reg.CloseKey;

 Reg.Free;
end;

procedure TForm1.T1Click(Sender: TObject);
begin
 if T1.Checked = true then begin
  T1.Checked := false;
  Form1.FormStyle := fsNormal;
 end else begin
  T1.Checked := true;
  Form1.FormStyle := fsStayOnTop;
 end;
end;

end.
