@EndUserText.label: 'Create Position'
define abstract entity ZBS_S_RAPCreatePosition
{
  key DummyKey          : abap.char(1);
      Material          : abap.char(5);
      @Semantics.quantity.unitOfMeasure : 'Unit'
      Quantity          : abap.quan(10,0);
      Unit              : abap.unit(3);
      @Semantics.amount.currencyCode : 'Currency'
      Price             : abap.curr(15,2);
      Currency          : abap.cuky;
      _DummyAssociation : association to parent zbs_s_rapcreateinvoice on $projection.dummykey = _DummyAssociation.dummykey;
}
