namespace SmartPhoneShop.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ChangeOrderDetailTable : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Orders", "GiaoDuHang", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Orders", "GiaoDuHang");
        }
    }
}
