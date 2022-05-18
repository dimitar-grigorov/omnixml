object MainF: TMainF
  Left = 0
  Top = 0
  Caption = 'MainF'
  ClientHeight = 465
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 643
    Height = 279
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodId'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoodName'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Visible = True
      end>
  end
  object memLog: TMemo
    Left = 0
    Top = 279
    Width = 643
    Height = 145
    Align = alBottom
    TabOrder = 1
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 424
    Width = 643
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnTestMemdata: TButton
      Left = 24
      Top = 6
      Width = 97
      Height = 25
      Caption = 'Test MemData'
      TabOrder = 0
      OnClick = btnTestMemdataClick
    end
    object btnTestCDS: TButton
      Left = 127
      Top = 6
      Width = 106
      Height = 25
      Caption = 'Test ClientDataSet'
      TabOrder = 1
      OnClick = btnTestCDSClick
    end
    object btnXMLToCDS: TButton
      Left = 424
      Top = 6
      Width = 121
      Height = 25
      Caption = 'XML to ClientDataSet'
      TabOrder = 2
      OnClick = btnXMLToCDSClick
    end
    object btnXMLToMemData: TButton
      Left = 297
      Top = 6
      Width = 121
      Height = 25
      Caption = 'XML to MemData'
      TabOrder = 3
      OnClick = btnXMLToMemDataClick
    end
  end
  object DataSource1: TDataSource
    Left = 312
    Top = 232
  end
end
