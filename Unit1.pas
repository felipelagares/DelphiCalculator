unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Themes, Vcl.Styles, System.Character;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    txtNum1: TEdit;
    Label2: TLabel;
    txtNum2: TEdit;
    btAdit: TButton;
    btSubt: TButton;
    btMult: TButton;
    btDiv: TButton;
    Label3: TLabel;
    txtResult: TEdit;
    optApearence: TRadioGroup;
    procedure btAditClick(Sender: TObject);
    procedure btSubtClick(Sender: TObject);
    procedure btMultClick(Sender: TObject);
    procedure btDivClick(Sender: TObject);
    procedure optApearenceClick(Sender: TObject);
    procedure txtNum1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function calcular(num1,num2: Real; operacao: String): Real;
    function validate(): Boolean;
    procedure logRegister(line: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btAditClick(Sender: TObject);
var
ans: Real;
begin
  ans := calcular(StrToFloat(txtNum1.Text), StrToFloat(txtNum2.Text), 'soma');
  txtResult.Text := FloatToStr(ans);
  logRegister(txtNum1.Text + ' + ' + txtNum2.Text + ' = ' + FloatToStr(ans));
end;

procedure TForm1.btDivClick(Sender: TObject);
var
ans: Real;
begin
  ans := calcular(StrToFloat(txtNum1.Text), StrToFloat(txtNum2.Text), 'div');
  txtResult.Text := FloatToStr(ans);
  logRegister(txtNum1.Text + ' / ' + txtNum2.Text + ' = ' + FloatToStr(ans));
end;

procedure TForm1.btMultClick(Sender: TObject);
var
ans: Real;
begin
  ans := calcular(StrToFloat(txtNum1.Text), StrToFloat(txtNum2.Text), 'mult');
  txtResult.Text := FloatToStr(ans);
  logRegister(txtNum1.Text + ' * ' + txtNum2.Text + ' = ' + FloatToStr(ans));
end;

procedure TForm1.btSubtClick(Sender: TObject);
var
ans: Real;
begin
  ans := calcular(StrToFloat(txtNum1.Text), StrToFloat(txtNum2.Text), 'subt');
  txtResult.Text := FloatToStr(ans);
  logRegister(txtNum1.Text + ' - ' + txtNum2.Text + ' = ' + FloatToStr(ans));
end;

function TForm1.calcular(num1,num2: Real; operacao: String): Real;
var
answer : Real;

begin
  answer := 0;

  if operacao = 'soma' then
    begin
      answer := num1 + num2;
    end;
  if operacao = 'subt' then
    begin
      answer := num1 - num2;
    end;
  if operacao = 'mult' then
    begin
      answer := num1 * num2;
    end;
  if operacao = 'div' then
    begin
      answer := num1 / num2;
    end;

  Result := answer;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  logRegister('Fim');
  logRegister('---------------------------------');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  logRegister('---------------------------------');
  logRegister('Inicio');
end;

procedure TForm1.logRegister(line: String);
// Muitas aberturas e fechamentos de arquivo, otimizar ?
var
  arquivo: TextFile;
begin
  try
    AssignFile(arquivo, 'Logs.txt');
    if FileExists('Logs.txt') then
      Append(arquivo)
    else
      Rewrite(arquivo);

    Writeln(arquivo, '[' + DateTimeToStr(now()) + '] - ' + line);
  finally
    CloseFile(arquivo);
  end;
end;

procedure TForm1.optApearenceClick(Sender: TObject);
begin
  case optApearence.ItemIndex of
    0: TStyleManager.TrySetStyle('Windows');
    1: TStyleManager.TrySetStyle('Glow');
  end;
end;

procedure TForm1.txtNum1Change(Sender: TObject);
begin
  if validate then
    begin
      btAdit.Enabled := True;
      btSubt.Enabled := True;
      btMult.Enabled := True;
      btDiv.Enabled := True;
    end
  else
    begin
      btAdit.Enabled := False;
      btSubt.Enabled := False;
      btMult.Enabled := False;
      btDiv.Enabled := False;
    end;

end;

function TForm1.validate: Boolean;
begin
  if (txtNum1.Text = '') or (txtNum2.Text = '') or (txtNum2.Text = '0') then
    Result := False

  else
    begin
      try
        StrToFloat(txtNum1.Text);
        StrToFloat(txtNum2.Text);
        Result := True
      except
        on E: EConvertError do
          begin
            Result := False
          end;
      end;

    end;


end;

end.
