xmlport 14135100 "lvnStatesXML"
{
    Caption = 'Import States CSV';
    Direction = Import;
    TextEncoding = UTF8;
    Format = VariableText;
    FieldDelimiter = '"';
    FieldSeparator = ',';


    schema
    {
        textelement(root)
        {
            tableelement(States; "lvnState")
            {


                XmlName = 'States';
                fieldelement(Name; States.Name) { }
                fieldelement(Code; States.code) { }


            }
        }
    }

}