namespace SmartPhoneShop.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class FixDatabaseTable2 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Products", "Alias", c => c.String(nullable: false, maxLength: 250));
            AlterColumn("dbo.Products", "Content", c => c.String(nullable: false));
            AlterColumn("dbo.Products", "CreateBy", c => c.String(nullable: false, maxLength: 250));
            AlterColumn("dbo.Products", "Description", c => c.String());
            AlterColumn("dbo.Products", "Image", c => c.String(nullable: false));
            AlterColumn("dbo.Products", "MetaDescription", c => c.String());
            AlterColumn("dbo.Posts", "Alias", c => c.String(nullable: false, maxLength: 250));
            AlterColumn("dbo.Posts", "Content", c => c.String(nullable: false));
            AlterColumn("dbo.Posts", "CreateBy", c => c.String(nullable: false, maxLength: 250));
            AlterColumn("dbo.Posts", "Description", c => c.String());
            AlterColumn("dbo.Posts", "Image", c => c.String(nullable: false));
            AlterColumn("dbo.Posts", "MetaDescription", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Posts", "MetaDescription", c => c.String(maxLength: 150));
            AlterColumn("dbo.Posts", "Image", c => c.String());
            AlterColumn("dbo.Posts", "Description", c => c.String(maxLength: 250));
            AlterColumn("dbo.Posts", "CreateBy", c => c.String(maxLength: 250));
            AlterColumn("dbo.Posts", "Content", c => c.String());
            AlterColumn("dbo.Posts", "Alias", c => c.String(maxLength: 250));
            AlterColumn("dbo.Products", "MetaDescription", c => c.String(maxLength: 150));
            AlterColumn("dbo.Products", "Image", c => c.String());
            AlterColumn("dbo.Products", "Description", c => c.String(maxLength: 250));
            AlterColumn("dbo.Products", "CreateBy", c => c.String(maxLength: 250));
            AlterColumn("dbo.Products", "Content", c => c.String());
            AlterColumn("dbo.Products", "Alias", c => c.String(maxLength: 250));
        }
    }
}
