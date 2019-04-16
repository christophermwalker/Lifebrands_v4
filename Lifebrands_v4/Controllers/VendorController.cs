
using Lifebrands_v4.Entities;
using Lifebrands_v4.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using static Lifebrands_v4.Models.ApplicationDbContext;

namespace Lifebrands_v4.Controllers
{
    public class VendorController : Controller
    {
        [Route("Vendor/Vendor")]
        public ActionResult vendor()
        {

            return View();
        }


        [Route("Vendor/GetVendors")]
        public ActionResult GetVendors(string sidx, string sort, int page, int rows)
        {
            DatabaseContext db = new DatabaseContext();

            var query = from e in db.Vendor select e;
            int pageIndex = Convert.ToInt32(page) - 1;
            int totalRecords = db.Vendor.Count();
            int totalPages = (int)Math.Ceiling((float)totalRecords / (float)rows);
            var jsonData = new
            {
                total = totalPages,
                page,
                records = totalRecords,
                rows = query.Select(x => new { x.IdVendor, x.Name, x.Address, x.City, x.State, x.Zip }).ToList()
            .Select (x => new {
                id = x.IdVendor,
                cell = new [] {
                    x.IdVendor.ToString(),
                    x.Name.ToString(),
                    x.Address.ToString(),
                    x.City.ToString(),
                    x.State.ToString(),
                    x.Zip.ToString()
                }}).ToArray(),
            };

            /*
            sort = (sort == null) ? "" : sort;
            int pageIndex = Convert.ToInt32(page) - 1;
            int pageSize = rows;

            var vendorList = db.Vendor.Select(
                       t => new
                       {
                           t.IdVendor,
                           t.Name,
                           t.Address,
                           t.City,
                           t.State,
                           t.Zip,
                       }
                       ).ToArray();

            int totalRecords = vendorList.Count();
            var totalPages = (int)Math.Ceiling((float)totalRecords / (float)rows);
            
            if (sort.ToUpper() == "DESC")
            {
                vendorList = vendorList.OrderByDescending(t => t.IdVendor).ToArray();
                vendorList = vendorList.Skip(pageIndex * pageSize).Take(pageSize).ToArray();
            }
            else
            {
                vendorList = vendorList.OrderBy(t => t.IdVendor).ToArray();
                vendorList = vendorList.Skip(pageIndex * pageSize).Take(pageSize).ToArray();
            }
            
            var jsonData = new
            {
                total = totalPages,
                page,
                records = totalRecords,
                rows = vendorList
            };
            */

            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }

        [Route("Vendor/CreateVendor")]

        [HttpPost]
        public string CreateVendor(Vendor Model)
        {
            DatabaseContext db = new DatabaseContext();
            string msg;
            try
            {
                if (ModelState.IsValid)
                {
                    Model.IdVendor = Guid.NewGuid().ToString();
                    db.Vendor.Add(Model);
                    db.SaveChanges();
                    msg = "Saved Successfully";
                }
                else
                {
                    msg = "Validation data not successfully";
                }
            }
            catch (Exception ex)
            {
                msg = "Error occured:" + ex.Message;
            }
            return msg;
        }
        [Route("Vendor/EditVendor")]
        public string EditVendor(Vendor Model)
        {
            DatabaseContext db = new DatabaseContext();
            string msg;
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(Model).State = EntityState.Modified;
                    db.SaveChanges();
                    msg = "Saved Successfully";
                }
                else
                {
                    msg = "Validation data not successfully";
                }
            }
            catch (Exception ex)
            {
                msg = "Error occured:" + ex.Message;
            }
            return msg;
        }

        [Route("Vendor/DeleteVendor")]
        public string DeleteVendor(string Id)
        {
            DatabaseContext db = new DatabaseContext();
            Vendor vendors = db.Vendor.Find(int.Parse(Id));
            db.Vendor.Remove(vendors);
            db.SaveChanges();
            return "Deleted successfully";
        }
    }

}