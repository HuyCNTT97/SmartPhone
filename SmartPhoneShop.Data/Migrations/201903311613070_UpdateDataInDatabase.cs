namespace SmartPhoneShop.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateDataInDatabase : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Warranties", "WarrantyOld", c => c.String(maxLength: 150));
            AddColumn("dbo.Warranties", "WarrantyNew", c => c.String(maxLength: 150));
            AddColumn("dbo.Warranties", "TimeInnovation", c => c.String(maxLength: 150));
            AddColumn("dbo.Warranties", "FixTime", c => c.String(maxLength: 150));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Warranties", "FixTime");
            DropColumn("dbo.Warranties", "TimeInnovation");
            DropColumn("dbo.Warranties", "WarrantyNew");
            DropColumn("dbo.Warranties", "WarrantyOld");
        }
    }
}
