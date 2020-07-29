Resources:

Copy of backup: AgdRcv_ExcelDataOnly-Backup.rdl
New version: AgdRcv_ExcelDataOnly.rdl


Report Changes:

Properties:
txtCalcAgeCurrAll
Data Only:
DataElementName: CustCurr
DataElementOutput: Auto
DataElementStyle: Auto

Set expression for: Value:

=IIF( Fields!Calc_CurrCode.Value = Parameters!CurrencyCode.Value 
or ((IsNothing(Previous(Fields!InvoiceNum.Value))= "False" 
and Previous(Fields!InvoiceNum.Value) = Fields!InvoiceNum.Value) 
and RowNumber("Details_Group") > 1), "" , CDec(Fields!Calc_AgeCurAll.Value))

Previous expression Value:

=CDec(Fields!Calc_AgeCurAll.Value)


Visibility:Change display options:
Removed:

Visibility: Show or hide based on an expression
=IIF( Fields!Calc_CurrCode.Value = Parameters!CurrencyCode.Value 
or ((IsNothing(Previous(Fields!InvoiceNum.Value))= "False" 
and Previous(Fields!InvoiceNum.Value) = Fields!InvoiceNum.Value) 
and RowNumber("Details_Group") > 1), True , False)

Set radio button to Show