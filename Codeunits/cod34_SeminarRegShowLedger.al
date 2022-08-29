codeunit 60134 "CSD Seminar Reg.-Show Ledger"
{
    TableNo = "CSD Seminar Register";

    trigger OnRun()
    begin
        //Pse nuk behet SeminarLedgerEntry.Reset ??
        SeminarLedgerEntry.SetRange("Entry No.", Rec."From Entry No.", Rec."To Entry No.");
        page.Run(Page::"CSD Seminar Ledger Entries")
    end;

    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
}
