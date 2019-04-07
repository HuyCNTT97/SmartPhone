using AutoMapper;
using SmartPhoneShop.Model.Model;
using SmartPhoneShop.Service;
using SmartPhoneShop.Web.Infrastructure.Core;
using SmartPhoneShop.Web.Infrasture.Core;
using SmartPhoneShop.Web.Infrasture.Extension;
using SmartPhoneShop.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SmartPhoneShop.Web.API
{
    [RoutePrefix("api/post")]
    public class PostController : ApiControllerBase
    {
        private IPostService _postService;

        public PostController(IErrorService errorService, IPostService postService) :
            base(errorService)
        {
            this._postService = postService;
        }

        [Route("getall")]
        public HttpResponseMessage GetAll(HttpRequestMessage request, string keyword, int page, int pageSize = 20)
        {
            return CreateHttpResponse(request, () =>
            {
                int totalRow = 0;
                var model = _postService.GetAll(keyword);

                totalRow = model.Count();
                var query = model.OrderByDescending(x => x.CreatedDate).Skip(page * pageSize).Take(pageSize);

                var responseData = Mapper.Map<IEnumerable<Post>, IEnumerable<PostViewModel>>(query);
                foreach (var item in responseData)
                {
                    item.PostCategoryName = _postService.GetNamePostCategory(item.PostCategoryID);
                }
                var paginationSet = new PaginationSet<PostViewModel>()
                {
                    Items = responseData,
                    Page = page,
                    TotalCount = totalRow,
                    TotalPages = (int)Math.Ceiling((decimal)totalRow / pageSize)
                };
                var response = request.CreateResponse(HttpStatusCode.OK, paginationSet);
                return response;
            });
        }

        [Route("add")]
        public HttpResponseMessage Post(HttpRequestMessage request, PostViewModel postVm)
        {
            return CreateHttpResponse(request, () =>
            {
                HttpResponseMessage response = null;
                if (!ModelState.IsValid)
                {
                    request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
                else
                {
                    Post newPost = new Post();
                    newPost.UpdatePost(postVm);
                    var category = _postService.Add(newPost);
                    _postService.SaveChanges();
                    response = request.CreateResponse(HttpStatusCode.Created, category);
                }
                return response;
            });
        }

        [Route("getbyid/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request, int id)
        {
            return CreateHttpResponse(request, () =>
            {
                var model = _postService.GetByID(id);

                var responseData = Mapper.Map<Post, PostViewModel>(model);

                var response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }

        [Route("update")]
        public HttpResponseMessage Put(HttpRequestMessage request, PostViewModel postVm)
        {
            return CreateHttpResponse(request, () =>
            {
                HttpResponseMessage response = null;
                if (!ModelState.IsValid)
                {
                    request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
                else
                {
                    var postDb = _postService.GetByID(postVm.ID);
                    postDb.UpdatePost(postVm);
                    _postService.Update(postDb);
                    _postService.SaveChanges();
                    var responseData = Mapper.Map<Post, PostViewModel>(postDb);

                    response = request.CreateResponse(HttpStatusCode.OK, responseData);
                }
                return response;
            });
        }

        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            return CreateHttpResponse(request, () =>
            {
                HttpResponseMessage response = null;
                if (!ModelState.IsValid)
                {
                    request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
                else
                {
                    _postService.Delete(id);
                    _postService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }
    }
}