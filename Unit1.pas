unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  Tarr = array of Integer;
  TForm1 = class(TForm)
    SG1: TStringGrid;
    btn1: TButton;
    btn2: TButton;
    //procedure mastOSTRINGgrid(A: Tarr; st:TstringGrid);
    procedure ArrayToStringGrid(mas : Tarr; SG1 : TStringGrid);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    //procedure TForm1.ArrayToStringGrid(var mas : Tarr; SG1 : TStringGrid);


  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  mas : Tarr;



implementation
{$R *.dfm}

function InitArray(mas : Tarr; SG1 : TStringGrid) : Tarr;
var i : Integer;
begin
 Randomize;
 SetLength(mas,0);
 for i:=0 to SG1.ColCount-1 do
  begin
    SetLength(mas,Length(mas) + 1);
    mas[i] := Random(20);
  end;
  Result := mas;
end;

procedure TForm1.ArrayToStringGrid(mas : Tarr; SG1 : TStringGrid);
var i,j : Integer;
begin
 for i:= 0 to High(mas) do
 begin
  SG1.Cells[i,0] := IntToStr(mas[i]);
  Sleep(300);
  SG1.Repaint;
 end;
end;

procedure Swap(var mas : Tarr; i,middleindex : integer);
var tmp : Integer;
begin
 tmp:=mas[i];
 mas[i]:=mas[middleindex];
 mas[middleindex]:=tmp;
end;

Function Partition(var mas : Tarr; l,r : integer; SG1 : TStringGrid) : Integer;
var i,j,x : Integer;
begin
 x:=mas[r];
 i:=l-1;
 for j:=l to r-1 do
  begin
   if mas[j]<= x then
    begin
     i:=i+1;
     Swap(mas,i,j);
     Form1.ArrayToStringGrid(mas,SG1);
     //Sleep(1000);
    end;
  end;
 Swap(mas,i+1,r);
 result:=i+1;
end;

procedure QuickSort(mas : Tarr; l,r : integer; SG1 : TStringGrid);
var q:Integer;
begin
 if l<r then
  begin
   q:=Partition(mas,l,r,SG1);
   QuickSort(mas,l,q-1,SG1);
   QuickSort(mas,q+1,r,SG1);
  end;
end;



procedure TForm1.btn2Click(Sender: TObject);
begin
Randomize;
mas := InitArray(mas,SG1);
ArrayToStringGrid(mas,SG1);
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
QuickSort(mas,0,High(mas),SG1);
ArrayToStringGrid(mas,SG1);
end;

end.
