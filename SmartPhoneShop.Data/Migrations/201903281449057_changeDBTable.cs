namespace SmartPhoneShop.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class changeDBTable : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.ProductCategories", "ParentID", c => c.Int());
            AlterColumn("dbo.ProductCategories", "Image", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.ProductCategories", "Image", c => c.String(nullable: false));
            AlterColumn("dbo.ProductCategories", "ParentID", c => c.Int(nullable: false));
        }
    }
}
