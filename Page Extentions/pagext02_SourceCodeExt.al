pageextension 50103 "CSD SourceCodeSetupExt" extends "Source Code Setup"
{
    layout
    {
        addafter("Cost Accounting")
        {

            group("CSD SeminarGroup")
            {
                Caption = 'Seminar';
                field(Seminar; Rec."CSD Seminar")
                {
                }
            }
        }
    }
}