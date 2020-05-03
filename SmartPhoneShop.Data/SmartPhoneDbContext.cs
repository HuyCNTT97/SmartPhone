using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SmartPhoneShop.Model.Model;
using SmartPhoneShop.Model.Models;
using Microsoft.AspNet.Identity.EntityFramework;

namespace SmartPhoneShop.Data
{
    public class SmartPhoneDbContext : IdentityDbContext<ApplicationUser>
    {
        public SmartPhoneDbContext() : base("name=SmartPhoneShopSomee")
        {
            this.Configuration.LazyLoadingEnabled = false;
        }

        public DbSet<Footer> Footers { set; get; }
        public DbSet<DailyTask> DailyTasks { set; get; }
        public DbSet<TaskCategory> TaskCategories { set; get; }
        public DbSet<Customer> Customer { set; get; }

        public DbSet<Menu> Menu { set; get; }
        public DbSet<MenuGroup> MenuGroups { set; get; }
        public DbSet<Order> Order { set; get; }
        public DbSet<OrderDetail> OrderDetail { set; get; }
        public DbSet<Page> Page { set; get; }
        public DbSet<Post> Post { set; get; }
        public DbSet<PostCategory> PostCategory { set; get; }
        public DbSet<PostTag> PostTag { set; get; }
        public DbSet<PriceHistory> PriceHistory { set; get; }
        public DbSet<Product> Product { set; get; }
        public DbSet<ProductCategory> ProductCategory { set; get; }
        public DbSet<ProductTag> ProductTag { set; get; }
        public DbSet<Slide> Slide { set; get; }
        public DbSet<SuppostOnline> SuppostOnline { set; get; }
        public DbSet<SystemConfig> SystemConfigs { set; get; }
        public DbSet<Tag> Tag { set; get; }
        public DbSet<VisitorStatistic> VisitorStatistics { set; get; }
        public DbSet<Warranty> Warranty { set; get; }
        public DbSet<Error> Errors { set; get; }
        public DbSet<ApplicationGroup> ApplicationGroups { set; get; }
        public DbSet<ApplicationRole> ApplicationRoles { set; get; }
        public DbSet<ApplicationRoleGroup> ApplicationRoleGroups { set; get; }
        public DbSet<ApplicationUserGroup> ApplicationUserGroups { set; get; }
        public static SmartPhoneDbContext Create()
        {
            return new SmartPhoneDbContext();
        }

        protected override void OnModelCreating(DbModelBuilder builder)
        {
            builder.Entity<IdentityUserRole>().HasKey(i => new { i.UserId, i.RoleId }).ToTable("ApplicationUserRoles");
            builder.Entity<IdentityUserLogin>().HasKey(i => i.UserId).ToTable("ApplicationUserLogins");
            builder.Entity<IdentityRole>().ToTable("ApplicationRoles");
            builder.Entity<IdentityUserClaim>().HasKey(i => i.UserId).ToTable("ApplicationUserClaims");
        }
    }
}