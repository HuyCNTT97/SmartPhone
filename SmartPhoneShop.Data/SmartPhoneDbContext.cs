using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SmartPhoneShop.Model.Model;
using TeduShop.Model.Models;

namespace SmartPhoneShop.Data
{
    public class SmartPhoneDbContext : DbContext
    {
        public SmartPhoneDbContext() : base("SmartPhoneShopConnection")
        {
            this.Configuration.LazyLoadingEnabled = false;
        }

        public DbSet<Footer> Footers { set; get; }
        public DbSet<Customer> Customer { set; get; }
        public DbSet<GoodsReceipt> GoodsReceipt { set; get; }
        public DbSet<Menu> Menu { set; get; }
        public DbSet<MenuGroups> MenuGroups { set; get; }
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
        public DbSet<Shipment> Shipment { set; get; }
        public DbSet<Slide> Slide { set; get; }
        public DbSet<SuppostOnline> SuppostOnline { set; get; }
        public DbSet<SystemConfigs> SystemConfigs { set; get; }
        public DbSet<Tag> Tag { set; get; }
        public DbSet<VisitorStatistics> VisitorStatistics { set; get; }
        public DbSet<Warranty> Warranty { set; get; }
        public DbSet<Error> Errors { set; get; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}