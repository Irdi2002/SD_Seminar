page 50142 "CSD Seminar Manager RoleCenter"
{
    Caption = 'Seminar Manager RoleCenter';
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(RoleCenter)
        {
            group(Column1)
            {
                part(Activities; "CSD Seminar Manager Activities")
                {
                    ApplicationArea = All;
                    Caption = 'CSD Seminar Manager Activity';
                }
                part(MySeminars; "CSD My Seminars")
                {
                    ApplicationArea = All;
                    Caption = 'CSD My Seminars';
                }
            }
            group(Column2)
            {
                part(MyCostumers; "My Customers")
                {
                    ApplicationArea = All;
                }
                systempart(MyNotifications; MyNotes)
                {
                    ApplicationArea = All;
                }
                part(ReportInbox; "Report Inbox Part")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Embedding)
        {
            action(SeminarRegistrations)
            {
                Caption = 'Seminar Registrations';
                ApplicationArea = All;
                Image = List;
                RunObject = Page "CSD Posted Seminar Reg. List";
                ToolTip = 'Create Seminar Registrations';
            }
            action(Seminars)
            {
                Caption = 'Seminar ';
                ApplicationArea = All;
                Image = List;
                RunObject = Page "CSD Seminar List";
                ToolTip = 'View all seminars';
            }
            action(Instructors)
            {
                Caption = 'Instructors';
                ApplicationArea = All;
                RunObject = Page "Resource List";
                RunPageView = where(Type = const(Person));
                ToolTip = 'View all resources registers as persons';
            }
            action(Rooms)
            {
                Caption = 'Rooms';
                ApplicationArea = All;
                RunObject = Page "Resource List";
                RunPageView = where(Type = const(Machine));
                ToolTip = 'View all resources registers as machines';
            }
            action("Sales Invoices")
            {
                Caption = 'Sales Invoices';
                ApplicationArea = Basic, Suite;
                Image = Invoice;
                RunObject = Page "Sales Invoice List";
                ToolTip = 'Register your sales to costumers';
            }
            action("Sales Credits Memos")
            {
                Caption = 'Sales Credit Memos';
                ApplicationArea = All;
                RunObject = Page "Sales Credit Memos";
                ToolTip = 'Revert the financial transactions involved when your customers want to cancel a purchase';
            }
            action(Customers)
            {
                Caption = 'Customers';
                ApplicationArea = All;
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with';
            }
        }
        area(Sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View history for sales, shipments, and inventory';
                action("Posted Seminar Registrations")
                {
                    Caption = 'Posted Seminar Registrations';
                    ApplicationArea = All;
                    Image = Timesheet;
                    RunObject = Page "CSD Posted Seminar Reg. List";
                    ToolTip = 'Open the list of posted Registrations';
                }

                action("Posted Sales Registrations")
                {
                    Caption = 'Posted Sales Registrations';
                    ApplicationArea = All;
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices';
                }
                action("Posted Sales Credit Memos")
                {
                    Caption = 'Posted Sales Credit Memos';
                    ApplicationArea = All;
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit Memos';
                }
                action("Registers")
                {
                    Caption = 'Seminar Registers';
                    ApplicationArea = All;
                    Image = PostedShipment;
                    RunObject = Page "CSD Seminar Registers";
                    ToolTip = 'Open the list of Seminar Registers';
                }
            }
        }
        area(Creation)
        {
            action(NewSeminarRegistration)
            {
                ApplicationArea = All;
                Caption = 'Seminar Registration';
                Image = NewTimesheet;
                RunObject = Page "CSD Seminar Registration";
                RunPageMode = Create;
            }
            action(NewSalesInvoice)
            {
                ApplicationArea = All;
                Caption = 'Sales Invoice';
                Image = NewSalesInvoice;
                RunObject = Page "Sales Invoice";
                RunPageMode = Create;
            }
        }
        area(Processing)
        {
            action(CreateInvoices)
            {
                ApplicationArea = All;
                Caption = 'Create Invoices';
                Image = CreateJobSalesInvoice;
                RunObject = report "Create Seminar Invoices";
            }

            action(Navigate)
            {
                ApplicationArea = All;
                Caption = 'Navigate';
                Image = Navigate;
                RunObject = Page Navigate;
                RunPageMode = Edit;
            }
        }
    }
}