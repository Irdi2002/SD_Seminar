tableextension 50103 "CSD SeminarLedgerEntryExt" extends "Res. Ledger Entry"
{
    fields
    {
        field(50100; "CSD Seminar No."; Code[20])
        {
            Caption = 'CSD Seminar No.';
            TableRelation = "CSD Seminar";
        }

        field(50101; "CSD Seminar Registration No."; Code[20])
        {
            Caption = 'CSD Seminar Registration No.';
            TableRelation = "CSD Seminar Reg. Header";
        }
    }
}