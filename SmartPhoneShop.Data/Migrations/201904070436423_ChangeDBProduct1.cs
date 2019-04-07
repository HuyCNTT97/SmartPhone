namespace SmartPhoneShop.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ChangeDBProduct1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Products", "Promotion", c => c.Decimal(nullable: false, precision: 18, scale: 2));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Products", "Promotion");
        }
    }
}
