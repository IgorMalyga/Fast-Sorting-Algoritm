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
    procedure ArrayToStringGrid(mas : Tarr; SG1 : TStringGrid; startindex,endindex,row : Integer);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure SG1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    //procedure TForm1.ArrayToStringGrid(var mas : Tarr; SG1 : TStringGrid);


  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  mas : Tarr; ColorMain : COLORREF;



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

procedure TForm1.ArrayToStringGrid(mas : Tarr; SG1 : TStringGrid; startindex,endindex,row : Integer);
var i : Integer;  State: TGridDrawState;
begin
 for i:= startindex to endindex do
 begin
  SG1.Cells[i,row] := IntToStr(mas[i]);
  Sleep(500);

 // SG1DrawCell(Form1.SG1, i, row,SG1.CellRect(i,row), State);
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

Function Partition(var mas : Tarr; l,r,row : integer; SG1 : TStringGrid) : Integer;
var i,j,x : Integer; State: TGridDrawState;
begin
 x:=mas[r];
 i:=l-1;
 for j:=l to r-1 do
  begin
   if mas[j]<= x then
    begin
     i:=i+1;
     Swap(mas,i,j);
    Form1.ArrayToStringGrid(mas,SG1,l,r,row);
//  SG1.Cells[i,row] := IntToStr(mas[i]);

  //Sleep(500);
 // Form1.SG1DrawCell(Form1.SG1, i, row,SG1.CellRect(i,row), State);
  //SG1.Cells[j,row] := IntToStr(mas[j]);
  Sleep(500);
  ColorMain := ColorMain + 100;

  //Form1.SG1DrawCell(Form1.SG1, j, row,SG1.CellRect(j,row), State);
    end;
  end;
 Swap(mas,i+1,r);
 ColorMain := ColorMain + 100;
 ///////////////////////////////////////
// SG1.Cells[i,row] := IntToStr(mas[i]);

  Sleep(500);
  //Form1.SG1DrawCell(Form1.SG1, i+1, r,SG1.CellRect(i+1,r), State);
  //SG1.Cells[i+1,r] := IntToStr(mas[i+1]);
 // Sleep(500);
  ColorMain := ColorMain + 100;

 // Form1.SG1DrawCell(Form1.SG1, i+1, r,SG1.CellRect(i+1,r), State);



 ////////////////////////////////
 Form1.ArrayToStringGrid(mas,SG1,l,r,row);
 result:=i+1;
end;

procedure QuickSort(mas : Tarr; l,r,row : integer; SG1 : TStringGrid);
var q:Integer;
begin
 if l<r then
  begin
   q:=Partition(mas,l,r,SG1.RowCount-1,SG1);
   SG1.RowCount := SG1.RowCount + 1;
   //Form1.ArrayToStringGrid(mas,SG1,l,r,SG1.RowCount-1);
   QuickSort(mas,l,q-1,SG1.RowCount-1,SG1);
   QuickSort(mas,q+1,r,SG1.RowCount-1,SG1);
  end;
  //Form1.ArrayToStringGrid(mas,SG1,0,High(mas),SG1.RowCount-1);
end;



procedure TForm1.btn2Click(Sender: TObject);
begin
Randomize;
mas := InitArray(mas,SG1);
ArrayToStringGrid(mas,SG1,0,High(mas),0);
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
QuickSort(mas,0,High(mas),SG1.RowCount-1,SG1);
ArrayToStringGrid(mas,SG1,0,High(mas),SG1.RowCount-1);
end;

procedure TForm1.SG1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
with (Sender as TStringGrid) do
  begin
    begin
     Canvas.Brush.Color :=ColorMain;
     Canvas.FillRect(Rect);
     Canvas.TextOut(Rect.Left+4,Rect.Top,Cells[ACol, ARow]);
   end;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ColorMain:= $009966;
end;

end.
