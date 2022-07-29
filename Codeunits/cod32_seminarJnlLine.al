codeunit 50132 "CSD Seminar Jnl.-Post Line"
{
    TableNo = "CSD Seminar Journal Line";

    trigger OnRun();
    begin

    end;

    var

        SeminarJnlLine: Record "CSD Seminar Journal Line";
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        SeminarRegister: Record "CSD Seminar Register";
        SeminarJnlCheckLine: Codeunit "CSD Seminar Jnl.-Check Line";
        NextEntryNo: Integer;


    local procedure Code()
    begin
        with SeminarJnlLine do begin
            if NextEntryNo = 0 then begin
                SeminarLedgerEntry.LockTable;
                if SeminarLedgerEntry.FindLast() then
                    NextEntryNo := SeminarLedgerEntry."Entry No.";
                NextEntryNo := NextEntryNo + 1;

            end;


            //Task 8 Mod 7  Fq. 286
        end;
    end;

    procedure RunWithCheck(var SeminarJnlLine2: Record "CSD Seminar Journal Line")
    begin
        SeminarJnlLine := SeminarJnlLine2;
        Code();
        SeminarJnlLine2 := SeminarJnlLine;
    end;
}