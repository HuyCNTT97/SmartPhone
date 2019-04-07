using SmartPhoneShop.Model.Model;
using SmartPhoneShop.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Infrasture.Extension
{
    public static class EntityExtension
    {
        public static void UpdatePostCategory(this PostCategory postCategory, PostCategoryViewModel postCategoryVM)
        {
            postCategory.ID = postCategoryVM.ID;
            postCategory.ParentID = postCategoryVM.ParentID;
            postCategory.Alias = postCategoryVM.Alias;
            postCategory.CreateBy = postCategoryVM.CreateBy;
            postCategory.CreatedDate = postCategoryVM.CreatedDate;
            postCategory.DisplayOrder = postCategoryVM.DisplayOrder;
            postCategory.HomeFlag = postCategoryVM.HomeFlag;
            postCategory.MetaDescription = postCategoryVM.MetaDescription;
            postCategory.MetaKeyword = postCategoryVM.MetaKeyword;
            postCategory.Name = postCategoryVM.Name;
            postCategory.Status = postCategoryVM.Status;
            postCategory.UpdateBy = postCategoryVM.UpdateBy;
            postCategory.UpdatedDate = postCategoryVM.UpdatedDate;
        }

        public static void UpdateCustomer(this Customer cusTomer, CustomerViewModel cusTomerVM)
        {
            cusTomer.Account = cusTomer.Account;
            cusTomer.ID = cusTomer.ID;
            cusTomer.Address = cusTomer.Address;
            cusTomer.Name = cusTomer.Name;
            cusTomer.Password = cusTomer.Password;
            cusTomer.Phone = cusTomer.Phone;
            cusTomer.Status = cusTomer.Status;
        }

        public static void UpdateFooter(this Footer footer, FooterViewModel footerVM)
        {
            footer.ID = footerVM.ID;
            footer.Content = footerVM.Content;
        }

        public static void UpdateMenuGroup(this MenuGroup menuGroup, MenuGroupViewModel menuGroupVM)
        {
            menuGroup.ID = menuGroupVM.ID;
            menuGroup.Name = menuGroupVM.Name;
        }

        public static void UpdateMenu(this Menu menu, MenuViewModel menuVM)
        {
            menu.ID = menuVM.ID;
            menu.Name = menuVM.Name;
            menu.URL = menuVM.URL;
            menu.DisplayOrder = menuVM.DisplayOrder;
            menu.GroupID = menuVM.GroupID;
            menu.Target = menuVM.Target;
        }

        public static void UpdateOrderDetail(this OrderDetail orderDetail, OrderDetailViewModel orderDetailVM)
        {
            orderDetail.OrderID = orderDetailVM.OrderID;
            orderDetail.ProductID = orderDetailVM.ProductID;
            orderDetail.Price = orderDetailVM.Price;
            orderDetail.Promotion = orderDetailVM.Promotion;
            orderDetail.Quantity = orderDetailVM.Quantity;
            orderDetail.Shipping = orderDetailVM.Shipping;
            orderDetail.Payment = orderDetailVM.Payment;
            orderDetail.WarrantyID = orderDetailVM.WarrantyID;
        }

        public static void UpdateOrder(this Order order, OrderViewModel orderVM)
        {
            order.ID = orderVM.ID;
            order.CustomerID = orderVM.CustomerID;
            order.NameShip = orderVM.NameShip;
            order.AddressShip = orderVM.AddressShip;
            order.PhoneShip = orderVM.PhoneShip;
            order.OrderDate = orderVM.OrderDate;
            order.GiaoDuHang = orderVM.GiaoDuHang;
        }

        public static void UpdatePage(this Page page, PageViewModel pageVM)
        {
            page.ID = pageVM.ID;
            page.Name = pageVM.Name;
            page.Content = pageVM.Content;
            page.Status = pageVM.Status;
        }

        public static void UpdatePostTag(this PostTag postTag, PostTagViewModel postTagVM)
        {
            postTag.PostID = postTagVM.PostID;
            postTag.TagID = postTagVM.TagID;
        }

        public static void UpdatePost(this Post post, PostViewModel postVM)
        {
            post.ID = postVM.ID;
            post.PostCategoryID = postVM.PostCategoryID;
            post.Alias = postVM.Alias;
            post.Content = postVM.Content;
            post.CreateBy = postVM.CreateBy;
            post.CreatedDate = postVM.CreatedDate;
            post.Description = postVM.Description;
            post.DisplayOrder = postVM.DisplayOrder;
            post.HomeFlag = postVM.HomeFlag;
            post.Image = postVM.Image;
            post.MetaDescription = postVM.MetaDescription;
            post.MetaKeyword = postVM.MetaKeyword;
            post.Name = postVM.Name;
            post.Status = postVM.Status;
            post.UpdateBy = postVM.UpdateBy;
            post.UpdatedDate = postVM.UpdatedDate;
            post.ViewCount = postVM.ViewCount;
        }

        public static void UpdatePriceHistory(this PriceHistory priceHistory, PriceHistoryViewModel priceHistoryVM)
        {
            priceHistory.ProductID = priceHistoryVM.ProductID;
            priceHistory.UpdateBy = priceHistoryVM.UpdateBy;
            priceHistory.UpdateDate = priceHistoryVM.UpdateDate;
            priceHistory.Price = priceHistoryVM.Price;
            priceHistory.Promotion = priceHistoryVM.Promotion;
        }

        public static void UpdateSlide(this Slide slide, SlideViewModel slideVM)
        {
            slide.ID = slideVM.ID;
            slide.Name = slideVM.Name;
            slide.Description = slideVM.Description;
            slide.Image = slideVM.Image;
            slide.URL = slideVM.URL;
            slide.DisplayOrder = slideVM.DisplayOrder;
            slide.Status = slideVM.Status;
        }

        public static void UpdateSuppostOnline(this SuppostOnline suppostOnline, SuppostOnlineViewModel suppostOnlineVM)
        {
            suppostOnline.ID = suppostOnlineVM.ID;
            suppostOnline.Name = suppostOnlineVM.Name;
            suppostOnline.Department = suppostOnlineVM.Department;
            suppostOnline.Skype = suppostOnlineVM.Skype;
            suppostOnline.Email = suppostOnlineVM.Email;
            suppostOnline.Status = suppostOnlineVM.Status;
            suppostOnline.DisplayOrder = suppostOnlineVM.DisplayOrder;
        }

        public static void UpdateSystemConfig(this SystemConfig systemConfig, SystemConfigViewModel systemConfigVM)
        {
            systemConfig.ID = systemConfigVM.ID;
            systemConfig.Code = systemConfigVM.Code;
            systemConfig.ValueString = systemConfigVM.ValueString;
            systemConfig.ValueInt = systemConfigVM.ValueInt;
        }

        public static void UpdateTag(this Tag tag, TagViewModel tagVM)
        {
            tag.ID = tagVM.ID;
            tag.Name = tagVM.Name;
            tag.Type = tagVM.Type;
        }

        public static void UpdateVisitorStatistic(this VisitorStatistic visitorStatistic, VisitorStatisticViewModel visitorStatisticVM)
        {
            visitorStatistic.ID = visitorStatisticVM.ID;
            visitorStatistic.VisitedDate = visitorStatisticVM.VisitedDate;
            visitorStatistic.IPAddress = visitorStatisticVM.IPAddress;
        }

        public static void UpdateWarranty(this Warranty warranty, WarrantyViewModel warrantyVM)
        {
            warranty.ID = warrantyVM.ID;
            warranty.Name = warrantyVM.Name;
            warranty.Description = warrantyVM.Description;
            warranty.Status = warrantyVM.Status;
        }

        public static void UpdateProductCategory(this ProductCategory productCategory, ProductCategoryViewModel productCategoryVM)
        {
            productCategory.ID = productCategoryVM.ID;
            productCategory.ParentID = productCategoryVM.ParentID;
            productCategory.Alias = productCategoryVM.Alias;
            productCategory.CreateBy = productCategoryVM.CreateBy;
            productCategory.CreatedDate = productCategoryVM.CreatedDate;
            productCategory.DisplayOrder = productCategoryVM.DisplayOrder;
            productCategory.HomeFlag = productCategoryVM.HomeFlag;
            productCategory.MetaDescription = productCategoryVM.MetaDescription;
            productCategory.MetaKeyword = productCategoryVM.MetaKeyword;
            productCategory.Name = productCategoryVM.Name;
            productCategory.Status = productCategoryVM.Status;
            productCategory.UpdateBy = productCategoryVM.UpdateBy;
            productCategory.UpdatedDate = productCategoryVM.UpdatedDate;
        }

        public static void UpdateProductTag(this ProductTag productTag, ProductTagViewModel productTagVM)
        {
            productTag.ProductID = productTagVM.ProductID;
            productTag.TagID = productTagVM.TagID;
        }

        public static void UpdateProduct(this Product product, ProductViewModel productVM)
        {
            product.ID = productVM.ID;
            product.ProductCategoryID = productVM.ProductCategoryID;
            product.MoreImages = productVM.MoreImages;
            product.HotFlag = productVM.HotFlag;
            product.Specifications = productVM.Specifications;
            product.Quantity = productVM.Quantity;
            product.Alias = productVM.Alias;
            product.Content = productVM.Content;
            product.CreateBy = productVM.CreateBy;
            product.CreatedDate = productVM.CreatedDate;
            product.Description = productVM.Description;
            product.DisplayOrder = productVM.DisplayOrder;
            product.HomeFlag = productVM.HomeFlag;
            product.Image = productVM.Image;
            product.Price = productVM.Price;
            product.Promotion = productVM.Promotion;
            product.MetaDescription = productVM.MetaDescription;
            product.MetaKeyword = productVM.MetaKeyword;
            product.Name = productVM.Name;
            product.Status = productVM.Status;
            product.UpdateBy = productVM.UpdateBy;
            product.UpdatedDate = productVM.UpdatedDate;
            product.ViewCount = productVM.ViewCount;
        }
    }
}