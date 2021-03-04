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
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender:TObject);
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
    {procedure init(a,b,c:word); }
    constructor Create(a,b,c:word);
    function Volume:word;
    procedure Show;
  end;

   TBar=class(TParallel)
   public
   FRo:real;
   constructor Create(a,b,c:word; Ro:real);
   function massa:real;
   Procedure Show;
   end;
var
  Form1: TForm1; Par1:TParallel; Par:array[1..5] of TParallel;
  x:word=0;
  y:word=0;
  z:word=0;
  Bar1:TBar;
  implementation

{$R *.dfm}

{ TParallel }

{procedure TParallel.init(a, b, c: word);
begin
  Fa:=a;
  Fb:=b;
  Fc:=c;
end;}

procedure TParallel.Show;
begin
  ShowMessage('����� ��������������� ����� '+ inttostr(Volume)+#10#13+
  '������ - ���� Fa ='+inttostr(Fa)+#10#13+
  '����� - ���� Fb ='+inttostr(Fb)+#10#13+
  '������ - ���� Fc ='+inttostr(Fc));
end;

function TParallel.Volume: word;
begin
  result:=Fa*Fb*Fc;;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  x:=x+1; y:=y+1; z:=z+1;
  Par1:=TParallel.Create(x,y,z);
  Par[x]:=Par1;
 { Par1.init(x,y,z);}
  Par1.Show;
  Memo1.Lines.Add('����� � ������ �������, ������������ � Par1, ����� '
  +IntToStr(integer(Par1)) );
end;



procedure TForm1.Button2Click(Sender: TObject);
begin
  if Par1=nil then
  Form1.Caption:='������� � ������ ���'
  else
  Form1.Caption:='������ ���������� � ������';
end;


procedure TForm1.Button3Click(Sender: TObject);
var i:integer;
begin
for i := 1 to Memo1.Lines.Count do
begin
Memo1.Lines.Add('����� ������� � ������� '+IntToStr(i) +' ����� '
+IntToStr( integer(Par[i]))+' ���� Fa = '+ inttostr(Par[i].Fa));
Par[i].Show;
end;
end;

constructor TParallel.Create(a,b,c:word);
begin
  Fa:=a;
  Fb:=b;
  Fc:=c;
end;

constructor TBar.Create(a: Word; b: Word; c: Word; Ro: Real);
begin
  inherited Create(a,b,c);
  Fro:=Ro;
end;
 function TBar.massa:real;
 begin
  result:=FRo*Volume;
 end;
 procedure TBar.Show;
 begin
  ShowMessage('����� ��������������� ����� '+inttostr(Volume)+#10#13
  +'������ - ���� Fa='+inttostr(Fa)+#10#13
  +'�����  - ���� Fb='+inttostr(Fb)+#10#13
  +'������ - ���� Fc='+inttostr(Fc)+#10#13
  +'��������� - ���� FRo='+floattostr(FRo)+#10#13
  +'����� ='+floattostr(massa));
 end;


procedure TForm1.Button4Click(Sender: TObject);
begin
  Bar1:=TBar.Create(1,2,3,10.5);
  TParallel(Bar1).Show;
end;

end.
