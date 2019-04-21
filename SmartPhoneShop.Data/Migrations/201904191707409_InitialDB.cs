namespace SmartPhoneShop.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialDB : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Orders", "CustomerID", "dbo.Customers");
            DropIndex("dbo.Orders", new[] { "CustomerID" });
            AddColumn("dbo.OrderDetails", "Color", c => c.String());
            AlterColumn("dbo.Orders", "CustomerID", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Orders", "CustomerID", c => c.Int(nullable: false));
            DropColumn("dbo.OrderDetails", "Color");
            CreateIndex("dbo.Orders", "CustomerID");
            AddForeignKey("dbo.Orders", "CustomerID", "dbo.Customers", "ID", cascadeDelete: true);
        }
    }
}
