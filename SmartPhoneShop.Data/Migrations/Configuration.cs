namespace SmartPhoneShop.Data.Migrations
{
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using Model.Model;
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using System.Security.Cryptography;
    using System.Text;
    using System.Text.RegularExpressions;

    internal sealed class Configuration : DbMigrationsConfiguration<SmartPhoneShop.Data.SmartPhoneDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(SmartPhoneShop.Data.SmartPhoneDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            #region User

            CreateUser(context);

            #endregion User

            #region ProductCategory

            if (context.ProductCategory.Count() == 0)
            {
                CreateProductCategory(context);
            }

            #endregion ProductCategory

            #region Customer

            if (context.Customer.Count() == 0)
            {
                CreateCustomer(context);
            }

            #endregion Customer

            #region MenuGroup

            if (context.MenuGroups.Count() == 0)
            {
                CreateMenuGroup(context);
            }

            #endregion MenuGroup

            #region Menu

            if (context.Menu.Count() == 0)
            {
                CreateMenu(context);
            }

            #endregion Menu

            #region Footer

            if (context.Footers.Count() == 0)
            {
                CreateFooter(context);
            }

            #endregion Footer

            #region Order

            if (context.Order.Count() == 0)
            {
                CreateOrder(context);
            }

            #endregion Order

            #region Tag

            if (context.Tag.Count() == 0)
            {
                CreateTag(context);
            }

            #endregion Tag

            #region Warranty

            if (context.Warranty.Count() == 0)
            {
                CreateWarranty(context);
            }

            #endregion Warranty

            #region PostCategory

            if (context.PostCategory.Count() == 0)
            {
                CreatePostCategory(context);
            }

            #endregion PostCategory

            #region Post

            if (context.Post.Count() == 0)
            {
                CreatePost(context);
            }

            #endregion Post

            #region PostTag

            if (context.PostTag.Count() == 0)
            {
                CreatePostTag(context);
            }

            #endregion PostTag

            #region Product

            if (context.Product.Count() == 0)
            {
                CreateProduct(context);
            }

            #endregion Product

            #region ProductTag

            if (context.ProductTag.Count() == 0)
            {
                CreateProductTag(context);
            }

            #endregion ProductTag

            #region Slide

            if (context.Slide.Count() == 0)
            {
                CreateSlide(context);
            }

            #endregion Slide

            #region SuppostOnline

            if (context.SuppostOnline.Count() == 0)
            {
                CreateSuppostOnline(context);
            }

            #endregion SuppostOnline

            #region OrderDetail

            CreateOrderDetail(context);

            #endregion OrderDetail
        }

        private void CreateTag(SmartPhoneDbContext dbContext)
        {
            var listTag = new List<Tag>()
           {
               new Tag()
               {
                 ID="samsung",
                 Name="samsung",
                 Type="chưa thêm"
               },
                new Tag()
               {
                 ID="iphone",
                 Name="iphone",
                 Type="chưa thêm"
               }
           };
            dbContext.Tag.AddRange(listTag);
            dbContext.SaveChanges();
        }

        private void CreateSuppostOnline(SmartPhoneDbContext dbContext)
        {
            var listSuppostOnline = new List<SuppostOnline>()
           {
               new SuppostOnline()
               {
                  Department="Hỗ trợ khách hàng",
                  Email="hoanghuy97cntt@gmail.com",
                  Name="Hoàng Huy",
                  Skype="0978962224",
                  Status=true
               }
           };
            dbContext.SuppostOnline.AddRange(listSuppostOnline);
            dbContext.SaveChanges();
        }

        public static string convertToUnSign3(string s)
        {
            Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
            string temp = s.Normalize(NormalizationForm.FormD);
            return regex.Replace(temp, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
        }

        private void CreateSlide(SmartPhoneDbContext dbContext)
        {
            var listSlide = new List<Slide>()
           {
               new Slide()
               {
                 Image="",
                 Description="giảm giá",
                 Name="giảm giá tháng 4",
                 Status=true,
                 URL=""
               }
           };
            dbContext.Slide.AddRange(listSlide);
            dbContext.SaveChanges();
        }

        private void CreateProductTag(SmartPhoneDbContext dbContext)
        {
            var listProductTag = new List<ProductTag>()
           {
               new ProductTag()
               {
               ProductID=2,
               TagID="iphone"
               }
           };
            dbContext.ProductTag.AddRange(listProductTag);
            dbContext.SaveChanges();
        }

        private void CreateProduct(SmartPhoneDbContext dbContext)
        {
            var listProduct = new List<Product>()
           {
               new Product()
               {
                  Content="chưa",
                  CreateBy="Huy",
                  CreatedDate=DateTime.Now,
                  Name="Iphone 6s Plus Mới",Alias=convertToUnSign3("Iphone 6s Plus Mới")
                  .Replace(" ","-").ToLower(),
                  Description="Đẹp như mới, kèm sạc, cable chính hãng",
                  Image="chưa",MetaDescription=convertToUnSign3("Đẹp như mới, kèm sạc, cable chính hãng")
                  .Replace(" ","-").ToLower(),MetaKeyword="iphone-6s-plus",ProductCategoryID=1,
                  Status=true,
                  Specifications="chưa",
                  Quantity=20
               }
           };
            dbContext.Product.AddRange(listProduct);
            dbContext.SaveChanges();
        }

        private void CreatePostTag(SmartPhoneDbContext dbContext)
        {
            var listPostTag = new List<PostTag>()
           {
               new PostTag()
               {
                   PostID=1,
                   TagID="samsung"
               }
           };
            dbContext.PostTag.AddRange(listPostTag);
            dbContext.SaveChanges();
        }

        private void CreatePostCategory(SmartPhoneDbContext dbContext)
        {
            var listPostCategory = new List<PostCategory>()
           {
               new PostCategory()
               {
                   Name="Tin Điện Thoại",
                   Alias="tin-dien-thoai",
                   CreateBy="Huy",
                   CreatedDate=DateTime.Now,
                   MetaDescription="Tin tức điện thoại mới, nổi bật",
                   Status=true,
                   MetaKeyword="Tin điện thoại",
               }
           };
            dbContext.PostCategory.AddRange(listPostCategory);
            dbContext.SaveChanges();
        }

        private void CreatePost(SmartPhoneDbContext dbContext)
        {
            var listPost = new List<Post>()
           {
               new Post()
               {
                   Name="Tư vấn: Chọn mua Samsung A30 hay Samsung A50 ?",
                   Alias=convertToUnSign3("Tư vấn: Chọn mua Samsung A30 hay Samsung A50 ?")
                   .Replace(" ","-").ToLower(),
                   Content="chưa",
                   CreateBy="Huy",
                   CreatedDate=DateTime.Now,
                   Description="Samsung vừa mang về thị trường Việt Nam 2 sản phẩm tầm trung rất “hot”: Galaxy A30 và Galaxy A50. Vậy Galaxy A30 dành cho những ai, và Galaxy A50 sẽ là sự lựa chọn lý tưởng cho những đối tượng người dùng nào?",
                   Image="chưa",
                   MetaDescription=convertToUnSign3("Samsung vừa mang về thị trường Việt Nam 2 sản phẩm tầm trung rất “hot”: Galaxy A30 và Galaxy A50. Vậy Galaxy A30 dành cho những ai, và Galaxy A50 sẽ là sự lựa chọn lý tưởng cho những đối tượng người dùng nào?")
                   .Replace(" ","-").ToLower(),
                   MetaKeyword="mua Samsung A30 hay Samsung A50",
                   Status=true,PostCategoryID=1,
               }
           };
            dbContext.Post.AddRange(listPost);
            dbContext.SaveChanges();
        }

        private void CreatePage(SmartPhoneDbContext dbContext)
        {
            var listPage = new List<Page>()
           {
               new Page()
               {
                  Content="",
                  MetaDescription="",
                  MetaKeyword="",
                  Name="",
                  Status=false
               }
           };
            dbContext.Page.AddRange(listPage);
            dbContext.SaveChanges();
        }

        private void CreateWarranty(SmartPhoneDbContext dbContext)
        {
            var listWarranty = new List<Warranty>()
           {
               new Warranty()
               {
                   Name="dCare (mặc định)",
                   WarrantyOld="6 tháng",
                   WarrantyNew="12 tháng",
                   TimeInnovation="15 ngày",
                   FixTime="21 ngày",
                   Status=true,
                   Description="Các lỗi phần cứng, không bao gồm nguồn, màn hình, vân tay, mất imei, brick, máy có dấu hiệu móp méo, vào nước, hóa chất"
               }
           };
            dbContext.Warranty.AddRange(listWarranty);
            dbContext.SaveChanges();
        }

        private void CreateOrderDetail(SmartPhoneDbContext dbContext)
        {
            var listOrderDetail = new List<OrderDetail>()
           {
               new OrderDetail()
               {
               OrderID=1,
               Price=10000000,
               ProductID=2,
               Promotion=0,
               Quantity=2,
               Shipping=false,
               Payment=false,
               WarrantyID=1,
               }
           };
            dbContext.OrderDetail.AddRange(listOrderDetail);
            dbContext.SaveChanges();
        }

        private void CreateOrder(SmartPhoneDbContext dbContext)
        {
            var listOrder = new List<Order>()
           {
               new Order()
               {
                CustomerID=dbContext.Customer.Single(x=>x.Account=="customer@gmail.com").ID,
                AddressShip="gtvt hcm",
                GiaoDuHang=false,
                NameShip="Lan",
                OrderDate=DateTime.Now,
                PhoneShip=1234
               }
           };
            dbContext.Order.AddRange(listOrder);
            dbContext.SaveChanges();
        }

        private String GetMD5(string txt)
        {
            String str = "";
            Byte[] buffer = System.Text.Encoding.UTF8.GetBytes(txt);
            System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            buffer = md5.ComputeHash(buffer);
            foreach (Byte b in buffer)
            {
                str += b.ToString("X2");
            }
            return str;
        }

        private void CreateMenu(SmartPhoneDbContext dbContext)
        {
            var listMenu = new List<Menu>()
           {
               new Menu()
               {
                 Name="Điện Thoại",
                 Target="_self",
                 Status=true,
                 URL="chưa nhập",GroupID=1
               }
           };
            dbContext.Menu.AddRange(listMenu);
            dbContext.SaveChanges();
        }

        private void CreateMenuGroup(SmartPhoneDbContext dbContext)
        {
            var listMenuGroup = new List<MenuGroup>()
           {
               new MenuGroup()
               {
                Name="menuphai",
               },
               new MenuGroup()
               {
                   Name="menutrai"
               }
           };
            dbContext.MenuGroups.AddRange(listMenuGroup);
            dbContext.SaveChanges();
        }

        private void CreateFooter(SmartPhoneDbContext dbContext)
        {
            var listFooter = new List<Footer>()
           {
               new Footer()
               {
                  Content="Abc",
               }
           };
            dbContext.Footers.AddRange(listFooter);
            dbContext.SaveChanges();
        }

        private void CreateCustomer(SmartPhoneDbContext dbContext)
        {
            var listCustomer = new List<Customer>()
           {
               new Customer()
               {
                   Account="customer@gmail.com",
                   Name="customer 1",
                   Address="gtvt",
                   Password=GetMD5("customer123"),
                   Phone=123,
                   Status=true
               }
           };
            dbContext.Customer.AddRange(listCustomer);
            dbContext.SaveChanges();
        }

        private void CreateUser(SmartPhoneDbContext dbContext)
        {
            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new SmartPhoneDbContext()));
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new SmartPhoneDbContext()));

            var user1 = new ApplicationUser()
            {
                UserName = "Huy",
                BirthDay = DateTime.Parse("01/01/1997"),
                Address = "DH giao thong van tai",
                PhoneNumber = "123456",
                Email = "hoanghuy97cnnt@gmail.com",
                EmailConfirmed = true,
                FullName = "Nguyen Le Hoang Huy"
            };
            var user2 = new ApplicationUser()
            {
                UserName = "Thinh",
                BirthDay = DateTime.Parse("01/01/1997"),
                Address = "DH giao thong van tai",
                PhoneNumber = "123456",
                Email = "thinh@gmail.com",
                EmailConfirmed = true,
                FullName = "Ngo Duc Thinh"
            };
            var user3 = new ApplicationUser()
            {
                UserName = "Teo",
                BirthDay = DateTime.Parse("01/01/1997"),
                Address = "DH giao thong van tai",
                PhoneNumber = "123456",
                Email = "teo@gmail.com",
                EmailConfirmed = true,
                FullName = "Nguyen Van Teo"
            };
            if (!manager.Users.Any())
            {
                manager.Create(user1, "hoanghuy123");
                manager.Create(user2, "thinh123");
                manager.Create(user3, "teo123");
            }
            if (!roleManager.Roles.Any())
            {
                roleManager.Create(new IdentityRole() { Name = "Admin" });
                roleManager.Create(new IdentityRole() { Name = "Employee" });
            }
            var adminUser1 = manager.FindByEmail("hoanghuy97cnnt@gmail.com");
            var adminUser2 = manager.FindByEmail("thinh@gmail.com");
            var adminUser3 = manager.FindByEmail("teo@gmail.com");
            manager.AddToRoles(adminUser1.Id, new string[] { "Admin", "Employee" });
            manager.AddToRoles(adminUser2.Id, new string[] { "Admin", "Employee" });
            manager.AddToRoles(adminUser3.Id, new string[] { "Employee" });
        }

        private void CreateProductCategory(SmartPhoneDbContext dbContext)
        {
            var user = dbContext.Users.SingleOrDefault(x => x.UserName == "Huy");
            if (dbContext.ProductCategory.Count() == 0)
            {
                var listProductCategory = new List<ProductCategory>()
            {
                new ProductCategory()
                {
                  Name="Điện Thoại",Alias="dien-thoai",
                  CreateBy=user.UserName,
                  CreatedDate=DateTime.Now,
                  Status=true
                },
                 new ProductCategory()
                {
                  Name="Iphone",Alias="iphone",Image="",
                  MetaDescription="",
                  CreateBy=user.UserName,
                  CreatedDate=DateTime.Now,
                  Status=true
                }
               };
                dbContext.ProductCategory.AddRange(listProductCategory);
                dbContext.SaveChanges();
            }
        }
    }
}