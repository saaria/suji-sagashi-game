program suji2;



uses
  Forms,
  Registry,
  main in 'main.pas' {Form1},
  setpanel in 'setpanel.pas',
  about in 'about.pas' {AboutBox};

{$R *.res}
var
 Reg : TRegistry;
 hData : Integer ;
begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Reg := TRegistry.Create;

  if Reg.OpenKey('suji',False ) then
  begin
   hData :=Reg.ReadInteger('Top');
   Form1.Top :=hData;

   hData :=Reg.ReadInteger('Left');
   Form1.Left :=hData;

   hData :=Reg.ReadInteger('Width');
   Form1.Width :=hData;

   hData :=Reg.ReadInteger('Height');
   Form1.Height :=hData;
   Reg.CloseKey ;
  end;

 Reg.Free;
 ///////////////////////////////////////////////////


  Application.Run;
end.
