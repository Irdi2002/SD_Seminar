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

        end;
    end;

    procedure RunWithCheck(var SeminarJnlLine2: Record "CSD Seminar Journal Line")
    begin
        SeminarJnlLine := SeminarJnlLine2;
        Code();
        SeminarJnlLine2 := SeminarJnlLine;
    end;
}