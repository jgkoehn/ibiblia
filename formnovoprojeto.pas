unit formnovoprojeto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, Buttons, LCLTranslator;

type

  { TFormNovoProjeto }

  TFormNovoProjeto = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    EditTextoOrigem: TLabeledEdit;
    EditTextoDestino: TLabeledEdit;
    EditTextoRef1: TLabeledEdit;
    EditTextoRef2: TLabeledEdit;
    EditNomeProjeto: TLabeledEdit;
    OpenDialog1: TOpenDialog;
    RadioGroupEscopo: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { private declarations }
    procedure SelecionarTexto(edit: TLabeledEdit);
  public
    { public declarations }
  end; 

var
  FormNovoProjeto1: TFormNovoProjeto;

resourcestring
  SNewProject = 'New project';
  SChooseAName = 'Please choose a name for your project';
  SChooseAtLeastTwoTexts = 'Please choose at least one source and one destination texts';

implementation

{ TFormNovoProjeto }

procedure TFormNovoProjeto.BitBtn5Click(Sender: TObject);
begin
  //TBitBtn(Sender).ModalResult := mrNone;

  if EditNomeProjeto.Text = '' then
  begin
    ModalResult:=mrNone;
    MessageDlg(SNewProject, SChooseAName, mtWarning, [mbOK], 0);
    exit;
  end;

  if (EditTextoOrigem.Text = '') or (EditTextoDestino.Text = '') then
  begin
    ModalResult:=mrNone;
    MessageDlg(SNewProject, SChooseAtLeastTwoTexts, mtWarning, [mbOK], 0);
    exit;
  end;

  //TBitBtn(Sender).ModalResult := mrOK;
  ModalResult:=mrOK;
  //Close;
end;

procedure TFormNovoProjeto.BitBtn1Click(Sender: TObject);
begin
  SelecionarTexto(EditTextoOrigem);
end;

procedure TFormNovoProjeto.BitBtn2Click(Sender: TObject);
begin
  SelecionarTexto(EditTextoDestino);
end;

procedure TFormNovoProjeto.BitBtn3Click(Sender: TObject);
begin
  SelecionarTexto(EditTextoRef1);
end;

procedure TFormNovoProjeto.BitBtn4Click(Sender: TObject);
begin
  SelecionarTexto(EditTextoRef2);
end;

procedure TFormNovoProjeto.SelecionarTexto(edit: TLabeledEdit);
begin
  if OpenDialog1.Execute then
    edit.Text := OpenDialog1.FileName;
end;

initialization
  {$I formnovoprojeto.lrs}

end.

