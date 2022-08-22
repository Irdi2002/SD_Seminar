pageextension 50108 "CSD ResourceLedgerEntryExt" extends "Resource Ledger Entries"
{
    layout
    {
        addlast(Content)
        {
            field("CSD Seminar No."; Rec."CSD Seminar No.")
            {
                ApplicationArea = All;
            }
            field("CSD Seminar Registration No."; Rec."CSD Seminar Registration No.")
            {
                ApplicationArea = All;
            }
        }
    }
}