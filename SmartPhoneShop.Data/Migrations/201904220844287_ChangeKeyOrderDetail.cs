namespace SmartPhoneShop.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ChangeKeyOrderDetail : DbMigration
    {
        public override void Up()
        {
            DropPrimaryKey("dbo.OrderDetails");
            AlterColumn("dbo.OrderDetails", "Color", c => c.String(nullable: false, maxLength: 128));
            AddPrimaryKey("dbo.OrderDetails", new[] { "ProductID", "OrderID", "Color" });
        }
        
        public override void Down()
        {
            DropPrimaryKey("dbo.OrderDetails");
            AlterColumn("dbo.OrderDetails", "Color", c => c.String());
            AddPrimaryKey("dbo.OrderDetails", new[] { "ProductID", "OrderID" });
        }
    }
}
