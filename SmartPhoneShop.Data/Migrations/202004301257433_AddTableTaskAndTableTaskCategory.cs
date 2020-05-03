namespace SmartPhoneShop.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddTableTaskAndTableTaskCategory : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.ApplicationGroups",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                        Description = c.String(maxLength: 250),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.ApplicationRoleGroups",
                c => new
                    {
                        GroupId = c.Int(nullable: false),
                        RoleId = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => new { t.GroupId, t.RoleId })
                .ForeignKey("dbo.ApplicationGroups", t => t.GroupId, cascadeDelete: true)
                .ForeignKey("dbo.ApplicationRoles", t => t.RoleId, cascadeDelete: true)
                .Index(t => t.GroupId)
                .Index(t => t.RoleId);
            
            CreateTable(
                "dbo.ApplicationRoles",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        Name = c.String(),
                        Description = c.String(maxLength: 250),
                        Discriminator = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.ApplicationUserRoles",
                c => new
                    {
                        UserId = c.String(nullable: false, maxLength: 128),
                        RoleId = c.String(nullable: false, maxLength: 128),
                        ApplicationUser_Id = c.String(maxLength: 128),
                        IdentityRole_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => new { t.UserId, t.RoleId })
                .ForeignKey("dbo.ApplicationUsers", t => t.ApplicationUser_Id)
                .ForeignKey("dbo.ApplicationRoles", t => t.IdentityRole_Id)
                .Index(t => t.ApplicationUser_Id)
                .Index(t => t.IdentityRole_Id);
            
            CreateTable(
                "dbo.ApplicationUserGroups",
                c => new
                    {
                        UserId = c.String(nullable: false, maxLength: 128),
                        GroupId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.UserId, t.GroupId })
                .ForeignKey("dbo.ApplicationGroups", t => t.GroupId, cascadeDelete: true)
                .ForeignKey("dbo.ApplicationUsers", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId)
                .Index(t => t.GroupId);
            
            CreateTable(
                "dbo.ApplicationUsers",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        FullName = c.String(maxLength: 256),
                        Address = c.String(maxLength: 256),
                        BirthDay = c.DateTime(),
                        Email = c.String(),
                        EmailConfirmed = c.Boolean(nullable: false),
                        PasswordHash = c.String(),
                        SecurityStamp = c.String(),
                        PhoneNumber = c.String(),
                        PhoneNumberConfirmed = c.Boolean(nullable: false),
                        TwoFactorEnabled = c.Boolean(nullable: false),
                        LockoutEndDateUtc = c.DateTime(),
                        LockoutEnabled = c.Boolean(nullable: false),
                        AccessFailedCount = c.Int(nullable: false),
                        UserName = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.ApplicationUserClaims",
                c => new
                    {
                        UserId = c.String(nullable: false, maxLength: 128),
                        Id = c.Int(nullable: false),
                        ClaimType = c.String(),
                        ClaimValue = c.String(),
                        ApplicationUser_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.UserId)
                .ForeignKey("dbo.ApplicationUsers", t => t.ApplicationUser_Id)
                .Index(t => t.ApplicationUser_Id);
            
            CreateTable(
                "dbo.ApplicationUserLogins",
                c => new
                    {
                        UserId = c.String(nullable: false, maxLength: 128),
                        LoginProvider = c.String(),
                        ProviderKey = c.String(),
                        ApplicationUser_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.UserId)
                .ForeignKey("dbo.ApplicationUsers", t => t.ApplicationUser_Id)
                .Index(t => t.ApplicationUser_Id);
            
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
                "dbo.DailyTasks",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        TaskName = c.String(nullable: false),
                        Description = c.String(),
                        ExprireDate = c.DateTime(nullable: false),
                        CreatedDate = c.DateTime(nullable: false),
                        TaskCategoriesId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.TaskCategories", t => t.TaskCategoriesId, cascadeDelete: true)
                .Index(t => t.TaskCategoriesId);
            
            CreateTable(
                "dbo.TaskCategories",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        CategoryName = c.String(nullable: false),
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
                        CustomerID = c.String(),
                        NameShip = c.String(nullable: false, maxLength: 250),
                        AddressShip = c.String(nullable: false, maxLength: 250),
                        PhoneShip = c.String(nullable: false),
                        OrderDate = c.DateTime(nullable: false),
                        GiaoDuHang = c.Boolean(nullable: false),
                        CreateDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.OrderDetails",
                c => new
                    {
                        ProductID = c.Int(nullable: false),
                        OrderID = c.Int(nullable: false),
                        Color = c.String(nullable: false, maxLength: 128),
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Promotion = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Quantity = c.Int(nullable: false),
                        Shipping = c.Boolean(nullable: false),
                        Payment = c.Boolean(nullable: false),
                        WarrantyID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.ProductID, t.OrderID, t.Color })
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
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Quantity = c.Int(nullable: false),
                        OriginalPrice = c.Int(nullable: false),
                        OriginalQuantity = c.Int(nullable: false),
                        Promotion = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Alias = c.String(nullable: false, maxLength: 250),
                        Content = c.String(nullable: false),
                        CreateBy = c.String(nullable: false, maxLength: 250),
                        CreatedDate = c.DateTime(nullable: false),
                        Description = c.String(),
                        DisplayOrder = c.Int(),
                        HomeFlag = c.Boolean(nullable: false),
                        Image = c.String(nullable: false),
                        MetaDescription = c.String(),
                        MetaKeyword = c.String(maxLength: 150),
                        Name = c.String(maxLength: 250),
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
                        ParentID = c.Int(),
                        Image = c.String(),
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
                        WarrantyOld = c.String(maxLength: 150),
                        WarrantyNew = c.String(maxLength: 150),
                        TimeInnovation = c.String(maxLength: 150),
                        FixTime = c.String(maxLength: 150),
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
                        Alias = c.String(nullable: false, maxLength: 250),
                        Content = c.String(nullable: false),
                        CreateBy = c.String(nullable: false, maxLength: 250),
                        CreatedDate = c.DateTime(nullable: false),
                        Description = c.String(),
                        DisplayOrder = c.Int(),
                        HomeFlag = c.Boolean(nullable: false),
                        Image = c.String(nullable: false),
                        MetaDescription = c.String(),
                        MetaKeyword = c.String(maxLength: 150),
                        Name = c.String(maxLength: 250),
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
            DropForeignKey("dbo.ApplicationUserRoles", "IdentityRole_Id", "dbo.ApplicationRoles");
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
            DropForeignKey("dbo.Menus", "GroupID", "dbo.MenuGroups");
            DropForeignKey("dbo.DailyTasks", "TaskCategoriesId", "dbo.TaskCategories");
            DropForeignKey("dbo.ApplicationUserGroups", "UserId", "dbo.ApplicationUsers");
            DropForeignKey("dbo.ApplicationUserRoles", "ApplicationUser_Id", "dbo.ApplicationUsers");
            DropForeignKey("dbo.ApplicationUserLogins", "ApplicationUser_Id", "dbo.ApplicationUsers");
            DropForeignKey("dbo.ApplicationUserClaims", "ApplicationUser_Id", "dbo.ApplicationUsers");
            DropForeignKey("dbo.ApplicationUserGroups", "GroupId", "dbo.ApplicationGroups");
            DropForeignKey("dbo.ApplicationRoleGroups", "RoleId", "dbo.ApplicationRoles");
            DropForeignKey("dbo.ApplicationRoleGroups", "GroupId", "dbo.ApplicationGroups");
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
            DropIndex("dbo.Menus", new[] { "GroupID" });
            DropIndex("dbo.DailyTasks", new[] { "TaskCategoriesId" });
            DropIndex("dbo.ApplicationUserLogins", new[] { "ApplicationUser_Id" });
            DropIndex("dbo.ApplicationUserClaims", new[] { "ApplicationUser_Id" });
            DropIndex("dbo.ApplicationUserGroups", new[] { "GroupId" });
            DropIndex("dbo.ApplicationUserGroups", new[] { "UserId" });
            DropIndex("dbo.ApplicationUserRoles", new[] { "IdentityRole_Id" });
            DropIndex("dbo.ApplicationUserRoles", new[] { "ApplicationUser_Id" });
            DropIndex("dbo.ApplicationRoleGroups", new[] { "RoleId" });
            DropIndex("dbo.ApplicationRoleGroups", new[] { "GroupId" });
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
            DropTable("dbo.TaskCategories");
            DropTable("dbo.DailyTasks");
            DropTable("dbo.Customers");
            DropTable("dbo.ApplicationUserLogins");
            DropTable("dbo.ApplicationUserClaims");
            DropTable("dbo.ApplicationUsers");
            DropTable("dbo.ApplicationUserGroups");
            DropTable("dbo.ApplicationUserRoles");
            DropTable("dbo.ApplicationRoles");
            DropTable("dbo.ApplicationRoleGroups");
            DropTable("dbo.ApplicationGroups");
        }
    }
}
