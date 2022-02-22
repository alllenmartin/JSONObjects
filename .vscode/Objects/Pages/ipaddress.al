page 51000 "My IP Address"
{
    PageType = Card;
    Caption = 'My IP Address';
    UsageCategory = Administration;
    Editable = false;
    ApplicationArea = all;

    layout
    {
        area(Content)
        {
            field(IP; GetIP())
            {
                ApplicationArea = all;
                Caption = 'Current Public IP Address of my BC Server';
            }
        }
    }
    procedure GetIP(): Text
    var
        Client: HttpClient;
        ClientResponse: HttpResponseMessage;
        J: JsonObject;
        ResponseTxt: Text;
    begin
        //https://api.ipify.org?format=json
    end;

}