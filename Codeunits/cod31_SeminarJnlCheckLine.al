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

            if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) and (AllowPostingTo = 0D) then begin
                if UserId <> '' then
                    if UserSetup.GET(UserId) then begin
                        AllowPostingFrom := UserSetup."Allow Posting From";
                        AllowPostingTo := UserSetup."Allow Posting To";
                    end;

                if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                    GLSetup.GET;
                    AllowPostingFrom := GLSetup."Allow Posting From";
                    AllowPostingTo := GLSetup."Allow Posting To";
                end;
                if AllowPostingTo = 0D then
                    AllowPostingTo := DMY2Date(32, 12, 9999);
            end;

            if ("Posting Date" < AllowPostingFrom) OR
               ("Posting Date" > AllowPostingTo) then
                FieldError("Posting Date", PostingDateTxt);

            if ("Document Date" <> 0D) then
                if ("Document Date" = ClosingDate("Document Date")) then
                    FieldError("Document Date", PostingDateTxt);

        end;

    end;

}