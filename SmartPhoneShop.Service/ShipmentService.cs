using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Data.Repositories;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Service
{
    public interface IShipmentService
    {
        Shipment Add(Shipment shipment);

        void Update(Shipment shipment);

        void Delete(int id);

        IEnumerable<Shipment> GetAll();

        IEnumerable<Shipment> GetAllPaging(int page, int pageSize, out int totalRow);

        Shipment GetByID(int id);

        IEnumerable<Shipment> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class ShipmentService : IShipmentService
    {
        private IShipmentRepository _shipmentRepository;
        private IUnitOfWork _unitOfWork;

        public Shipment Add(Shipment shipment)
        {
            return _shipmentRepository.Add(shipment);
        }

        public void Delete(int id)
        {
            _shipmentRepository.Delete(id);
        }

        public IEnumerable<Shipment> GetAll()
        {
            return _shipmentRepository.GetAll();
        }

        public IEnumerable<Shipment> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _shipmentRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<Shipment> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _shipmentRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public Shipment GetByID(int id)
        {
            return _shipmentRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(Shipment shipment)
        {
            _shipmentRepository.Update(shipment);
        }
    }
}