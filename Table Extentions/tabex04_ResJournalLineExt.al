tableextension 60104 "CSD ResJournalLineExt" extends "Res. Journal Line"
{
    fields
    {
        field(60100; "CSD Seminar No."; Code[20])
        {
            Caption = 'CSD Seminar No.';
            TableRelation = "CSD Seminar";
        }

        field(60101; "CSD Seminar Registration No."; Code[20])
        {
            Caption = 'CSD Seminar Registration No.';
            TableRelation = "CSD Seminar Reg. Header";
        }
    }
}