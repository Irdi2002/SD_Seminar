pageextension 60101 "CSD ResourceListExt" extends "Resource List"
{
    layout
    {

        modify(Type)
        {
            Visible = Showtype;
        }
        addafter(Type)
        {
            field("CSD Resource Type"; Rec."CSD Resource Type")
            {

            }
            field("CSD Maximum Participants"; Rec."CSD Maximum Participants")
            {
                Visible = ShowMaxField;
            }
        }
    }




    trigger OnOpenPage();

    begin
        ShowType := (Rec.GetFilter(Type) = '');
        ShowMaxField := (Rec.GetFilter(Type) = format(Rec.Type::Machine));
    end;


    var
        [InDataSet]
        Showtype: Boolean;
        [InDataSet]
        ShowMaxField: Boolean;
}