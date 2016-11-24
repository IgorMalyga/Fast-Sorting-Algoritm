unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //procedure mastOSTRINGgrid(A: Tarr; st:TstringGrid);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   i,l,r,middleindex,k : Integer;
  sss : double;

implementation

{$R *.dfm}

function GetMiddleIndex(var StringGrid1  : TStringGrid) : Double;
     var k  : Double;
      begin
        k:=StringGrid1.ColCount/2;
        if StringGrid1.ColCount mod 2 <> 0 then
          begin
            k:=k+0.5;
            Result:=k;
          end
          else
          begin
            result:=k;
          end;


      end;

procedure Swap(var StringGrid1 : TStringGrid; i,middleindex : integer);
        var tmp : String;
        begin
          tmp:=StringGrid1.Cells[i,0];
          StringGrid1.Cells[i,0]:=StringGrid1.Cells[middleindex,0];
          StringGrid1.Cells[middleindex,0]:=tmp;
        end;

 //procedure TForm1.mastOSTRINGgrid(A: Tarr; st:TstringGrid);
 //begin

 //end;

 function Partition(var StringGrid1 : TStringGrid; l,r : integer) : Integer;
        var i,j,x : Integer;
        begin
          x:=StrToInt(StringGrid1.Cells[r,0]);
          i:=l-1;
          for j:=l to r-1 do
           begin
             if StrToInt(StringGrid1.Cells[j,0])<= x then
              begin
                  i:=i+1;
                  Swap(StringGrid1,i,j);
                 // mastOSTRINGgrid(arr, stringGrid);
                  Sleep(1000);
              end;

           end;
           Swap(StringGrid1,i+1,r);
           result:=i+1;

        end;

procedure QuickSort(StringGrid1 : TStringGrid; l,r : integer);
          var q:Integer;
          begin
            if l<r then
              begin
                q:=Partition(StringGrid1,l,r);
                QuickSort(StringGrid1,l,q-1);
                //StringGrid1.RowCount:= StringGrid1.RowCount +1 ;
                QuickSort(StringGrid1,q+1,r);
              end;
          end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 for i := 0 to StringGrid1.ColCount-1 do
 begin
   StringGrid1.Cells[i,0]:=IntToStr(Random(100))
 end;
 l:=0; r:=StringGrid1.ColCount-1;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
QuickSort(StringGrid1,l,StringGrid1.ColCount-1);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
k:=1;
 Timer1.Enabled:=True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  
if k>=StringGrid1.ColCount-2 then Timer1.Enabled:=False;
   k:=k+1;
   StringGrid1.Cells[k,0]:=StringGrid1.Cells[k-1,0];
   StringGrid1.Cells[k-1,0]:=' ';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Timer1.Enabled:=False;
end;

end.
