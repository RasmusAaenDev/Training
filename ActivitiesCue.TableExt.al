tableextension 50100 "Activities Cue Ext" extends "Activities Cue"
{
    fields
    {
        field(50000; "Total Automotives"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Automotive);
        }
    }
}