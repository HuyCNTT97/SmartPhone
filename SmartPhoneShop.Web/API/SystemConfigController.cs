using AutoMapper;
using SmartPhoneShop.Model.Model;
using SmartPhoneShop.Service;
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
    [RoutePrefix("api/systemconfig")]
    [Authorize]
    public class SystemConfigController : ApiControllerBase
    {
        private ISystemConfigService _systemConfigService;

        public SystemConfigController(IErrorService errorService, ISystemConfigService systemConfigService) :
            base(errorService)
        {
            this._systemConfigService = systemConfigService;
        }

        [Route("getall")]
        public HttpResponseMessage Get(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var listSystemConfig = _systemConfigService.GetAll();
                var listSystemConfigVM = Mapper.Map<List<SystemConfigViewModel>>(listSystemConfig);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listSystemConfigVM);

                return response;
            });
        }

        [Route("add")]
        public HttpResponseMessage Post(HttpRequestMessage request, SystemConfigViewModel systemConfigVm)
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
                    SystemConfig newSystemConfig = new SystemConfig();
                    newSystemConfig.UpdateSystemConfig(systemConfigVm);
                    var category = _systemConfigService.Add(newSystemConfig);
                    _systemConfigService.SaveChanges();
                    response = request.CreateResponse(HttpStatusCode.Created, category);
                }
                return response;
            });
        }

        [Route("update")]
        public HttpResponseMessage Put(HttpRequestMessage request, SystemConfigViewModel systemConfigVm)
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
                    var systemConfigDb = _systemConfigService.GetByID(systemConfigVm.ID);
                    systemConfigDb.UpdateSystemConfig(systemConfigVm);
                    _systemConfigService.Update(systemConfigDb);
                    _systemConfigService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
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
                    _systemConfigService.Delete(id);
                    _systemConfigService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }
    }
}