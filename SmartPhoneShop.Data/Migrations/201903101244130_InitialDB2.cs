namespace SmartPhoneShop.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialDB2 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Products", "CreateBy", c => c.String(nullable: false, maxLength: 250));
            AlterColumn("dbo.Products", "CreatedDate", c => c.DateTime(nullable: false));
            AlterColumn("dbo.ProductCategories", "CreateBy", c => c.String(nullable: false, maxLength: 250));
            AlterColumn("dbo.ProductCategories", "CreatedDate", c => c.DateTime(nullable: false));
            AlterColumn("dbo.Posts", "CreateBy", c => c.String(nullable: false, maxLength: 250));
            AlterColumn("dbo.Posts", "CreatedDate", c => c.DateTime(nullable: false));
            AlterColumn("dbo.PostCategories", "CreateBy", c => c.String(nullable: false, maxLength: 250));
            AlterColumn("dbo.PostCategories", "CreatedDate", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.PostCategories", "CreatedDate", c => c.DateTime());
            AlterColumn("dbo.PostCategories", "CreateBy", c => c.String(maxLength: 250));
            AlterColumn("dbo.Posts", "CreatedDate", c => c.DateTime());
            AlterColumn("dbo.Posts", "CreateBy", c => c.String(maxLength: 250));
            AlterColumn("dbo.ProductCategories", "CreatedDate", c => c.DateTime());
            AlterColumn("dbo.ProductCategories", "CreateBy", c => c.String(maxLength: 250));
            AlterColumn("dbo.Products", "CreatedDate", c => c.DateTime());
            AlterColumn("dbo.Products", "CreateBy", c => c.String(maxLength: 250));
        }
    }
}
