unit MainFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, NLDDataSetListener, StdCtrls;

type
  TMainForm = class(TForm)
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    procedure ClientDataSet1BeforePost(DataSet: TDataSet);
  private
    FListener: TNLDFieldListener;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{ TForm4 }

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited;

  FListener := TNLDFieldListener.Create(nil);
  FListener.DataSource := DataSource1;
  FListener.DataField := 'Company';
end;

destructor TMainForm.Destroy;
begin
  FreeAndNil(FListener);
  inherited Destroy;
end;

procedure TMainForm.ClientDataSet1BeforePost(DataSet: TDataSet);
begin
  Memo1.Lines.Add(FListener.OldValue)
end;

end.
