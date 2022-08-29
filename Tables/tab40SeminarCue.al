table 60140 "CSD Seminar Cue"
{
    Caption = 'Seminar Cue';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(20; "Planned"; Integer)
        {
            Caption = 'Planned';
            FieldClass = FlowField;
            CalcFormula = Count("CSD Seminar Reg. Header" where(Status = Const(Planning)));
        }
        field(30; "Registered"; Integer)
        {
            Caption = 'Registered';
            FieldClass = FlowField;
            CalcFormula = Count("CSD Seminar Reg. Header" where(Status = Const(Registration)));
        }
        field(40; "Closed"; Integer)
        {
            Caption = 'Closed';
            FieldClass = FlowField;
            CalcFormula = Count("CSD Seminar Reg. Header" where(Status = Const(Closed)));
        }
        field(60; "Posted"; Integer)
        {
            Caption = 'Posted';
            FieldClass = FlowField;
            CalcFormula = Count("CSD Posted Seminar Reg. Header" where(Status = Const(Closed)));
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}