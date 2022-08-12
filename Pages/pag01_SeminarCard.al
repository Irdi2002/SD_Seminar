page 50101 "CSD Seminar Card"
{
    PageType = Card;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    trigger OnAssistEdit();
                    begin
                        if Rec.AssistEdit then
                            CurrPage.Update;
                    end;
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                }

                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ApplicationArea = All;
                }

                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ApplicationArea = All;
                }

                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                }

                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
            }

            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }

                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                }

                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                }
            }
        }

        area(FactBoxes)
        {
            systempart("Links"; Links)
            {
                ApplicationArea = All;
            }
            systempart("Notes"; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Seminar")
            {
                action("Co&mments")
                {
                    RunObject = page "CSD Seminar Comment Sheet";
                    RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ApplicationArea = All;

                }

                action("Ledger Entries")
                {
                    Caption = 'Ledger Entries';
                    RunObject = page "CSD Seminar Ledger Entries";
                    RunPageLink = "Seminar No." = field("No.");
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortcutKey = "CTRL+F7";
                    ApplicationArea = All;
                    Image = WarrantyLedger;
                }

                action("&Registrations")
                {
                    Caption = 'Registrations';
                    RunObject = page "CSD Seminar Registration List";
                    RunPageLink = "Seminar No." = field("No.");
                    Image = Timesheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;
                }
            }
        }
        area(Processing)
        {
            action("Seminar Registration ")
            {
                RunObject = page "CSD Seminar Registration";
                RunPageLink = "Seminar No." = field("No.");
                RunPageMode = Create;
                Image = Timesheet;
                Promoted = true;
                PromotedCategory = New;
                ApplicationArea = All;
            }
        }
    }
}