namespace SmartPhoneShop.Data.Migrations
{
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using Model.Model;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<SmartPhoneShop.Data.SmartPhoneDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(SmartPhoneShop.Data.SmartPhoneDbContext context)
        {
            //  This method will be called after migrating to the latest version.
            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new SmartPhoneDbContext()));
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new SmartPhoneDbContext()));
            //Add account
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
            manager.Create(user1, "hoanghuy123");
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
            manager.Create(user2, "thinh123");
            if (!roleManager.Roles.Any())
            {
                roleManager.Create(new IdentityRole() { Name = "Admin" });
                roleManager.Create(new IdentityRole() { Name = "Employee" });
            }
            var adminUser1 = manager.FindByEmail("hoanghuy97cnnt@gmail.com");
            var adminUser2 = manager.FindByEmail("hoanghuy97cnnt@gmail.com");
            manager.AddToRoles(adminUser1.Id, new string[] { "Admin", "Employee" });
            manager.AddToRoles(adminUser2.Id, new string[] { "Admin", "Employee" });
            //  You can use the DbSet<T>.AddOrUpdate() helper extension method
            //  to avoid creating duplicate seed data.
        }
    }
}