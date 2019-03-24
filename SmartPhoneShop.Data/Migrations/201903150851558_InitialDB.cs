namespace SmartPhoneShop.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialDB : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Customers",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Account = c.String(nullable: false, maxLength: 100),
                        Address = c.String(nullable: false, maxLength: 250),
                        Name = c.String(nullable: false, maxLength: 250),
                        Password = c.String(nullable: false, maxLength: 100),
                        Phone = c.Int(nullable: false),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Errors",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Message = c.String(),
                        StackTrace = c.String(),
                        CreatedDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Footers",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Content = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Menus",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                        URL = c.String(nullable: false),
                        DisplayOrder = c.Int(),
                        GroupID = c.Int(nullable: false),
                        Target = c.String(),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.MenuGroups", t => t.GroupID, cascadeDelete: true)
                .Index(t => t.GroupID);
            
            CreateTable(
                "dbo.MenuGroups",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Orders",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        CustomerID = c.Int(nullable: false),
                        NameShip = c.String(nullable: false, maxLength: 250),
                        AddressShip = c.String(nullable: false, maxLength: 250),
                        PhoneShip = c.Int(nullable: false),
                        OrderDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.Customers", t => t.CustomerID, cascadeDelete: true)
                .Index(t => t.CustomerID);
            
            CreateTable(
                "dbo.OrderDetails",
                c => new
                    {
                        ProductID = c.Int(nullable: false),
                        OrderID = c.Int(nullable: false),
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Promotion = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Quantity = c.Int(nullable: false),
                        Shipping = c.Boolean(nullable: false),
                        Payment = c.Boolean(nullable: false),
                        WarrantyID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.ProductID, t.OrderID })
                .ForeignKey("dbo.Orders", t => t.OrderID, cascadeDelete: true)
                .ForeignKey("dbo.Products", t => t.ProductID, cascadeDelete: true)
                .ForeignKey("dbo.Warranties", t => t.WarrantyID, cascadeDelete: true)
                .Index(t => t.ProductID)
                .Index(t => t.OrderID)
                .Index(t => t.WarrantyID);
            
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        ProductCategoryID = c.Int(nullable: false),
                        MoreImages = c.String(storeType: "xml"),
                        HotFlag = c.Boolean(nullable: false),
                        Specifications = c.String(maxLength: 250),
                        Quantity = c.Int(nullable: false),
                        Alias = c.String(maxLength: 250),
                        Content = c.String(),
                        CreateBy = c.String(nullable: false, maxLength: 250),
                        CreatedDate = c.DateTime(nullable: false),
                        Description = c.String(maxLength: 150),
                        DisplayOrder = c.Int(),
                        HomeFlag = c.Boolean(nullable: false),
                        Image = c.String(nullable: false),
                        MetaDescription = c.String(maxLength: 150),
                        MetaKeyword = c.String(maxLength: 150),
                        Name = c.String(nullable: false, maxLength: 250),
                        Status = c.Boolean(nullable: false),
                        UpdateBy = c.String(),
                        UpdatedDate = c.DateTime(),
                        ViewCount = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.ProductCategories", t => t.ProductCategoryID, cascadeDelete: true)
                .Index(t => t.ProductCategoryID);
            
            CreateTable(
                "dbo.ProductCategories",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        ParentID = c.Int(nullable: false),
                        Image = c.String(nullable: false),
                        Alias = c.String(nullable: false, maxLength: 250),
                        CreateBy = c.String(nullable: false, maxLength: 250),
                        CreatedDate = c.DateTime(nullable: false),
                        DisplayOrder = c.Int(),
                        HomeFlag = c.Boolean(nullable: false),
                        MetaDescription = c.String(maxLength: 250),
                        MetaKeyword = c.String(maxLength: 250),
                        Name = c.String(nullable: false, maxLength: 250),
                        Status = c.Boolean(nullable: false),
                        UpdateBy = c.String(maxLength: 250),
                        UpdatedDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Warranties",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                        Description = c.String(),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Pages",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                        Content = c.String(),
                        Status = c.Boolean(nullable: false),
                        MetaDescription = c.String(maxLength: 250),
                        MetaKeyword = c.String(maxLength: 250),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Posts",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        PostCategoryID = c.Int(nullable: false),
                        Alias = c.String(maxLength: 250),
                        Content = c.String(),
                        CreateBy = c.String(nullable: false, maxLength: 250),
                        CreatedDate = c.DateTime(nullable: false),
                        Description = c.String(maxLength: 150),
                        DisplayOrder = c.Int(),
                        HomeFlag = c.Boolean(nullable: false),
                        Image = c.String(nullable: false),
                        MetaDescription = c.String(maxLength: 150),
                        MetaKeyword = c.String(maxLength: 150),
                        Name = c.String(nullable: false, maxLength: 250),
                        Status = c.Boolean(nullable: false),
                        UpdateBy = c.String(),
                        UpdatedDate = c.DateTime(),
                        ViewCount = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.PostCategories", t => t.PostCategoryID, cascadeDelete: true)
                .Index(t => t.PostCategoryID);
            
            CreateTable(
                "dbo.PostCategories",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        ParentID = c.Int(),
                        Alias = c.String(nullable: false, maxLength: 250),
                        CreateBy = c.String(nullable: false, maxLength: 250),
                        CreatedDate = c.DateTime(nullable: false),
                        DisplayOrder = c.Int(),
                        HomeFlag = c.Boolean(nullable: false),
                        MetaDescription = c.String(maxLength: 250),
                        MetaKeyword = c.String(maxLength: 250),
                        Name = c.String(nullable: false, maxLength: 250),
                        Status = c.Boolean(nullable: false),
                        UpdateBy = c.String(maxLength: 250),
                        UpdatedDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.PostTags",
                c => new
                    {
                        PostID = c.Int(nullable: false),
                        TagID = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => new { t.PostID, t.TagID })
                .ForeignKey("dbo.Posts", t => t.PostID, cascadeDelete: true)
                .ForeignKey("dbo.Tags", t => t.TagID, cascadeDelete: true)
                .Index(t => t.PostID)
                .Index(t => t.TagID);
            
            CreateTable(
                "dbo.Tags",
                c => new
                    {
                        ID = c.String(nullable: false, maxLength: 50),
                        Name = c.String(nullable: false, maxLength: 100),
                        Type = c.String(nullable: false, maxLength: 100, unicode: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.PriceHistories",
                c => new
                    {
                        ProductID = c.Int(nullable: false),
                        UpdateBy = c.String(nullable: false, maxLength: 100),
                        UpdateDate = c.DateTime(nullable: false),
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Promotion = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => new { t.ProductID, t.UpdateBy, t.UpdateDate })
                .ForeignKey("dbo.Products", t => t.ProductID, cascadeDelete: true)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.ProductTags",
                c => new
                    {
                        ProductID = c.Int(nullable: false),
                        TagID = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => new { t.ProductID, t.TagID })
                .ForeignKey("dbo.Products", t => t.ProductID, cascadeDelete: true)
                .ForeignKey("dbo.Tags", t => t.TagID, cascadeDelete: true)
                .Index(t => t.ProductID)
                .Index(t => t.TagID);
            
            CreateTable(
                "dbo.Slides",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 100),
                        Description = c.String(maxLength: 100),
                        Image = c.String(),
                        URL = c.String(maxLength: 250),
                        DisplayOrder = c.Int(nullable: false),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.SuppostOnlines",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 100),
                        Department = c.String(maxLength: 50),
                        Skype = c.String(maxLength: 50),
                        Email = c.String(maxLength: 50),
                        Status = c.Boolean(nullable: false),
                        DisplayOrder = c.Int(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.SystemConfigs",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Code = c.String(nullable: false, maxLength: 50, unicode: false),
                        ValueString = c.String(maxLength: 50),
                        ValueInt = c.Int(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.VisitorStatistics",
                c => new
                    {
                        ID = c.Guid(nullable: false),
                        VisitedDate = c.DateTime(nullable: false),
                        IPAddress = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.ID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.ProductTags", "TagID", "dbo.Tags");
            DropForeignKey("dbo.ProductTags", "ProductID", "dbo.Products");
            DropForeignKey("dbo.PriceHistories", "ProductID", "dbo.Products");
            DropForeignKey("dbo.PostTags", "TagID", "dbo.Tags");
            DropForeignKey("dbo.PostTags", "PostID", "dbo.Posts");
            DropForeignKey("dbo.Posts", "PostCategoryID", "dbo.PostCategories");
            DropForeignKey("dbo.OrderDetails", "WarrantyID", "dbo.Warranties");
            DropForeignKey("dbo.OrderDetails", "ProductID", "dbo.Products");
            DropForeignKey("dbo.Products", "ProductCategoryID", "dbo.ProductCategories");
            DropForeignKey("dbo.OrderDetails", "OrderID", "dbo.Orders");
            DropForeignKey("dbo.Orders", "CustomerID", "dbo.Customers");
            DropForeignKey("dbo.Menus", "GroupID", "dbo.MenuGroups");
            DropIndex("dbo.ProductTags", new[] { "TagID" });
            DropIndex("dbo.ProductTags", new[] { "ProductID" });
            DropIndex("dbo.PriceHistories", new[] { "ProductID" });
            DropIndex("dbo.PostTags", new[] { "TagID" });
            DropIndex("dbo.PostTags", new[] { "PostID" });
            DropIndex("dbo.Posts", new[] { "PostCategoryID" });
            DropIndex("dbo.Products", new[] { "ProductCategoryID" });
            DropIndex("dbo.OrderDetails", new[] { "WarrantyID" });
            DropIndex("dbo.OrderDetails", new[] { "OrderID" });
            DropIndex("dbo.OrderDetails", new[] { "ProductID" });
            DropIndex("dbo.Orders", new[] { "CustomerID" });
            DropIndex("dbo.Menus", new[] { "GroupID" });
            DropTable("dbo.VisitorStatistics");
            DropTable("dbo.SystemConfigs");
            DropTable("dbo.SuppostOnlines");
            DropTable("dbo.Slides");
            DropTable("dbo.ProductTags");
            DropTable("dbo.PriceHistories");
            DropTable("dbo.Tags");
            DropTable("dbo.PostTags");
            DropTable("dbo.PostCategories");
            DropTable("dbo.Posts");
            DropTable("dbo.Pages");
            DropTable("dbo.Warranties");
            DropTable("dbo.ProductCategories");
            DropTable("dbo.Products");
            DropTable("dbo.OrderDetails");
            DropTable("dbo.Orders");
            DropTable("dbo.MenuGroups");
            DropTable("dbo.Menus");
            DropTable("dbo.Footers");
            DropTable("dbo.Errors");
            DropTable("dbo.Customers");
        }
    }
}
