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

        if SemJnLine.EmptyLine then exit;
        SemJnLine.TestField("Posting Date");
        SemJnLine.TestField("Instructor Resource No.");
        SemJnLine.TestField("Seminar No.");

        case
            SemJnLine."Charge Type" of
            SemJnLine."Charge Type"::Instructor:
                SemJnLine.TestField("Room Resource No.");
            SemJnLine."Charge Type"::Room:
                SemJnLine.TestField("Room Resource No.");
            SemJnLine."Charge Type"::Participant:
                SemJnLine.TestField("Participant Contact No.");

        end;

        if SemJnLine.Chargeable then
            SemJnLine.TestField("Bill-to Customer No.");

        if SemJnLine."Posting Date" = ClosingDate(SemJnLine."Posting Date") then
            SemJnLine.FieldError("Posting Date", ClosingDAteTxt);

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

        if (SemJnLine."Posting Date" < AllowPostingFrom) OR
           (SemJnLine."Posting Date" > AllowPostingTo) then
            SemJnLine.FieldError("Posting Date", PostingDateTxt);

        if (SemJnLine."Document Date" <> 0D) then
            if (SemJnLine."Document Date" = ClosingDate(SemJnLine."Document Date")) then
                SemJnLine.FieldError("Document Date", PostingDateTxt);

    end;

}