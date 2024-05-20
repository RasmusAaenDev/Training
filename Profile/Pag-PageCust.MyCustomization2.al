pagecustomization MyCustomization2 customizes "Customer List"
{
    views
    {
        addfirst
        {
            view(MyView)
            {
                Caption = 'MyView';
                Filters = where("Balance Due" = filter(> 0));
                SharedLayout = false;

                layout
                {

                }
            }
        }
    }
}