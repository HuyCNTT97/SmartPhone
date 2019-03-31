namespace SmartPhoneShop.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class FixDatabaseTable : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Products", "Description", c => c.String(maxLength: 250));
            AlterColumn("dbo.Posts", "Description", c => c.String(maxLength: 250));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Posts", "Description", c => c.String(maxLength: 150));
            AlterColumn("dbo.Products", "Description", c => c.String(maxLength: 150));
        }
    }
}
