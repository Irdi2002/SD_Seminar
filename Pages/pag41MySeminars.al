page 60141 "CSD My Seminars"
{
    Caption = 'My Seminars';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD My Seminar";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                }
                field("Name"; Seminar.Name)
                {
                    ApplicationArea = All;
                }
                field(Duration; Seminar."Seminar Duration")
                {
                    ApplicationArea = All;
                }
                field(Price; Seminar."Seminar Price")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Open)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    OpenSeminarCard;
                end;
            }
        }
    }
    var
        Seminar: Record "CSD Seminar";

    trigger OnOpenPage();
    begin
        Rec.SetRange("User ID", Rec."User ID")
    end;

    trigger OnAfterGetRecord();
    begin
        if Seminar.Get(Rec."Seminar No.") then;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Clear(Seminar);
    end;

    local procedure OpenSeminarCard()
    begin
        if Seminar."No." <> '' then
            Page.Run(Page::"CSD Seminar Card", Seminar);
    end;
}