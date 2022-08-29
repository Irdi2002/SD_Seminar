page 60107 "CSD Seminar Comment List"
{
    Caption = 'CSD Seminar Comment List';
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    Editable = false;
    ApplicationArea = All;
    UsageCategory = Administration;
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
}