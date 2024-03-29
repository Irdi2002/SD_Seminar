pageextension 60102 "CSD ResourceCardExt" extends "Resource Card"

{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; Rec."CSD Resource Type")
            {
                ApplicationArea = All;
            }
            field("CSD Quantity Per Day"; Rec."CSD Quantity Per Day")
            {
                ApplicationArea = All;

            }
        }

        addafter("Personal Data")
        {
            group("CSD Room")
            {
                Caption = 'Room';
                Visible = ShowMaxField;

                field("CSD Maximum Participants"; Rec."CSD Maximum Participants")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnAfterGetRecord();


    begin
        ShowMaxField := (Rec.Type = Rec.Type::Machine);

        CurrPage.Update(false);

    end;


    var
        [InDataSet]
        ShowMaxField: Boolean;

}