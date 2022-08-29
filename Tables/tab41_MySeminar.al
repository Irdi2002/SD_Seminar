table 60141 "CSD My Seminar"
{
    Caption = 'My Seminar';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "User ID"; Code[60])
        {
            Caption = 'User ID';
            TableRelation = User;
            DataClassification = ToBeClassified;

        }
        field(20; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = "CSD Seminar";
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "User ID", "Seminar No.")
        {
            Clustered = true;
        }
    }
}