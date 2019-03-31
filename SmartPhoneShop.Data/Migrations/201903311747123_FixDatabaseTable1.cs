namespace SmartPhoneShop.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class FixDatabaseTable1 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Products", "CreateBy", c => c.String(maxLength: 250));
            AlterColumn("dbo.Products", "Image", c => c.String());
            AlterColumn("dbo.Products", "Name", c => c.String(maxLength: 250));
            AlterColumn("dbo.Posts", "CreateBy", c => c.String(maxLength: 250));
            AlterColumn("dbo.Posts", "Image", c => c.String());
            AlterColumn("dbo.Posts", "Name", c => c.String(maxLength: 250));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Posts", "Name", c => c.String(nullable: false, maxLength: 250));
            AlterColumn("dbo.Posts", "Image", c => c.String(nullable: false));
            AlterColumn("dbo.Posts", "CreateBy", c => c.String(nullable: false, maxLength: 250));
            AlterColumn("dbo.Products", "Name", c => c.String(nullable: false, maxLength: 250));
            AlterColumn("dbo.Products", "Image", c => c.String(nullable: false));
            AlterColumn("dbo.Products", "CreateBy", c => c.String(nullable: false, maxLength: 250));
        }
    }
}
