page 50101 "CSD Seminar"
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
                    AssistEdit = true;
                    trigger OnAssistEdit();
                    begin
                        if Rec.AssistEdit then
                            CurrPage.Update;
                    end;
                }

                field(Name; Rec.Name)
                {

                }

                field("Search Name"; Rec."Search Name")
                {

                }

                field("Seminar Duration"; Rec."Seminar Duration")
                {

                }

                field("Minimum Participants"; Rec."Minimum Participants")
                {

                }

                field("Maximum Participants"; Rec."Maximum Participants")
                {

                }

                field(Blocked; Rec.Blocked)
                {

                }
            }

            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {

                }

                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {

                }

                field("Seminar Price"; Rec."Seminar Price")
                {

                }
            }
        }

        area(FactBoxes)
        {
            systempart("Links"; Links)
            {

            }
            systempart("Notes"; Notes)
            {

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
                    //RunObject = page "CSD Seminar Comment Sheet";
                    //RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                }
            }
        }
    }
}