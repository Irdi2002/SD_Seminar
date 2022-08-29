tableextension 60117 "CSD SeminarLedgerEntryExt" extends "Res. Ledger Entry"
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