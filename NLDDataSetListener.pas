unit NLDDataSetListener;

interface

uses DB, DBCtrls, Classes;

type
  TNLDFieldListener = class(TComponent)
  private
    FDataLink: TFieldDataLink;
    FOldValue: variant;
    procedure EditingChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    procedure SetDataField(const OldValue: string);
    procedure SetDataSource(const OldValue: TDataSource);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property OldValue: variant read FOldValue;

  published
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;

implementation

uses SysUtils;

destructor TNLDFieldListener.Destroy;
begin
  FreeAndNil(FDataLink);
  inherited Destroy;
end;

constructor TNLDFieldListener.Create(AOwner: TComponent);
begin
  inherited;
  FDataLink := TFieldDataLink.Create;
  FDataLink.OnEditingChange := EditingChange;
end;

procedure TNLDFieldListener.EditingChange(Sender: TObject);
begin
  if FDataLink.Editing then
    FOldValue := FDataLink.Field.OldValue;
end;

function TNLDFieldListener.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TNLDFieldListener.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TNLDFieldListener.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;

  if (Operation = opRemove) and (AComponent = DataSource) then
    DataSource := nil;

end;

procedure TNLDFieldListener.SetDataField(const OldValue: string);
begin
  FDataLink.FieldName := OldValue;
end;

procedure TNLDFieldListener.SetDataSource(const OldValue: TDataSource);
begin
  FDataLink.DataSource := OldValue;
end;

end.
