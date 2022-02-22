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
        if Client.Get('https://api.ipify.org?format=json', ClientResponse) then begin
            if ClientResponse.IsSuccessStatusCode() then begin
                ClientResponse.Content().ReadAs(ResponseTxt);
                J.ReadFrom(ResponseTxt);
                exit(GetJSONTxtField(J, 'ip'))
            end;
        end;
    end;

    procedure GetJSONTxtField(O: JsonObject; Member: Text): Text
    var
        Result: JsonToken;
    begin
        if O.Get(Member, Result) then begin
            exit(Result.AsValue().AsText())
        end;
    end;

}