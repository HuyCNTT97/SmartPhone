using AutoMapper;
using SmartPhoneShop.Model.Model;
using SmartPhoneShop.Model.Models;
using SmartPhoneShop.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Mappings
{
    public class AutoMapperConfiguration
    {
        public static void Configure()
        {
            Mapper.Initialize(cfg =>
            {
                cfg.CreateMap<Post, PostViewModel>();
                cfg.CreateMap<Customer, CustomerViewModel>();

                cfg.CreateMap<Footer, FooterViewModel>();
                cfg.CreateMap<Menu, MenuViewModel>();
                cfg.CreateMap<MenuGroups, MenuGroupViewModel>();
                cfg.CreateMap<Order, OrderViewModel>();
                cfg.CreateMap<OrderDetail, OrderDetailViewModel>();
                cfg.CreateMap<Page, PageViewModel>();
                cfg.CreateMap<PostCategory, PostCategoryViewModel>();
                cfg.CreateMap<PostTag, PostTagViewModel>();
                cfg.CreateMap<PriceHistory, PriceHistoryViewModel>();
                cfg.CreateMap<Product, ProductViewModel>();
                cfg.CreateMap<ProductCategory, ProductCategoryViewModel>();
                cfg.CreateMap<ProductTag, ProductTagViewModel>();
                cfg.CreateMap<Slide, SlideViewModel>();
                cfg.CreateMap<SuppostOnline, SuppostOnlineViewModel>();
                cfg.CreateMap<SystemConfigs, SystemConfigViewModel>();
                cfg.CreateMap<Tag, TagViewModel>();
                cfg.CreateMap<VisitorStatistics, VisitorStatisticsViewModel>();
                cfg.CreateMap<Warranty, WarrantyViewModel>();
            });
        }
    }
}