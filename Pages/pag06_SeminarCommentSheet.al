page 50106 "CSD Seminar Comment Line"
{
    Caption = 'CSD Seminar Comment Line';
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    ApplicationArea = All;
    UsageCategory = Administration;
    AutoSplitKey = true;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    Visible = false;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean);
    begin

        Rec.SetupNewLine;

    end;
}