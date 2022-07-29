codeunit 50131 "CSD Seminar Jnl.-Check Line"
{
    TableNo = "CSD Seminar Journal Line";


    trigger OnRun();
    begin
        Runcheck(Rec);
    end;

    var

        GLSetup: Record "General Ledger Setup";

        UserSetup: Record "User Setup";

        AllowPostingFrom: Date;

        AllowPostingTo: Date;

        ClosingDAteTxt: Label 'Cannot be a closing date.';

        PostingDateTxt: Label 'Is not withing your range of allowed posting dates.';


    procedure Runcheck(var SemJnLine: Record "CSD Seminar Journal Line");
    begin
        with SemJnLine do begin
            if EmptyLine then
                exit;
            TestField("Posting Date");
            TestField("Instructor Resource No.");
            TestField("Seminar No.");

            case
                "Charge Type" of
                "Charge Type"::Instructor:
                    TestField("Room Resource No.");
                "Charge Type"::Room:
                    TestField("Room Resource No.");
                "Charge Type"::Participant:
                    TestField("Participant Contact No.");

            end;

            if Chargeable then
                TestField("Bill-to Customer No.");

            if "Posting Date" = ClosingDate("Posting Date") then
                FieldError("Posting Date", ClosingDAteTxt);
        end;

    end;

}