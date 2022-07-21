page 50106 "CSD Seminar Comment Line"
{
    Caption = 'CSD Seminar Comment Line';
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    //LookupPageID = "CSD Seminar Comment List";
    //DrillDownPageId = "CSD Seminar Comment List";


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Date; Date)
                {

                }
                field(Code; Code)
                {
                    Visible = false;
                }
                field(Comment; Comment)
                {

                }
            }
        }
    }
}