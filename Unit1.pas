unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
TParallel=class;
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TParallel=class
    public
    Fa:word;
    Fb:word;
    Fc:word;
    procedure init(a,b,c:word);
    function Volume:word;
    procedure Show;
  end;
var
  Form1: TForm1; Par1:TParallel; Par:array[1..5] of TParallel;
  x:word=0;
  y:word=0;
  z:word=0;

  implementation

{$R *.dfm}

{ TParallel }

procedure TParallel.init(a, b, c: word);
begin
  Fa:=a;
  Fb:=b;
  Fc:=c;
end;

procedure TParallel.Show;
begin
  ShowMessage('Объем параллелепипеда равен '+ inttostr(Volume)+#10#13+
  'Ширина - Поле Fa ='+inttostr(Fa)+#10#13+
  'Длина - Поле Fb ='+inttostr(Fb)+#10#13+
  'Высота - Поле Fc ='+inttostr(Fc));
end;

function TParallel.Volume: word;
begin
  result:=Fa*Fb*Fc;;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  x:=x+1; y:=y+1; z:=z+1;
  Par1:=TParallel.Create;
  Par[x]:=Par1;
  Par1.init(x,y,z);
  Par1.Show;
  Memo1.Lines.Add('Адрес в памяти объекта, содержащийся в Par1, равен ' +IntToStr(integer(Par1)) );
end;



procedure TForm1.Button2Click(Sender: TObject);
begin
  if Par1=nil then
  Form1.Caption:='Объекта в памяти нет'
  else
  Form1.Caption:='Объект существует в памяти';
end;


procedure TForm1.Button3Click(Sender: TObject);
var i:integer;
begin
for i := 1 to Memo1.Lines.Count do
begin
Memo1.Lines.Add('Адрес объекта с номером '+IntToStr(i) +' равен '+IntToStr( integer(Par[i]))+' Поле Fa = '+ inttostr(Par[i].Fa));
Par[i].Show;
end;
end;

end.
