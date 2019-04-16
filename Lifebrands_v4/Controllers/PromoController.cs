
using Lifebrands_v4.Entities;
using Lifebrands_v4.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static Lifebrands_v4.Models.ApplicationDbContext;

namespace Lifebrands_v4.Controllers
{
    public class PromoController : Controller
    {
        [Route("Promo/Promo")]
        public ActionResult promo()
        {

            return View();
        }


        [Route("Promo/GetPromos")]
        public JsonResult GetPromos(string sidx, string sort, int page, int rows)
        {
            DatabaseContext db = new DatabaseContext();
            sort = (sort == null) ? "" : sort;
            int pageIndex = Convert.ToInt32(page) - 1;
            int pageSize = rows;

            var promoList = db.Promo.Select(
                       t => new
                       {
                           t.IdPromo,
                           t.Promo_Name,
                           t.Promo_Description,
                           t.Promo_Date,
                       }
                       ).ToList();

            int totalRecords = promoList.Count();
            var totalPages = (int)Math.Ceiling((float)totalRecords / (float)rows);
            /*
            if (sort.ToUpper() == "DESC")
            {
                promoList = promoList.OrderByDescending(t => t.idPromo);
                promoList = promoList.Skip(pageIndex * pageSize).Take(pageSize);
            }
            else
            {
                promoList = promoList.OrderBy(t => t.idPromo);
                promoList = promoList.Skip(pageIndex * pageSize).Take(pageSize);
            }
            */
            var jsonData = new
            {
                total = totalPages,
                page,
                records = totalRecords,
                rows = promoList
            };
            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }
        [Route("Promo/CreatePromo")]
        [HttpPost]
        public string Create(Promo Model)
        {
            DatabaseContext db = new DatabaseContext();
            string msg;
            try
            {
                if (ModelState.IsValid)
                {
                    Model.IdPromo = Guid.NewGuid().ToString();
                    db.Promo.Add(Model);
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
        [Route("Promo/EditPromo")]
        public string Edit(Promo Model)
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
        [Route("Promo/DeletePromo")]
        public string Delete(string Id)
        {
            DatabaseContext db = new DatabaseContext();
            Promo promo = db.Promo.Find(int.Parse(Id));
            db.Promo.Remove(promo);
            db.SaveChanges();
            return "Deleted successfully";
        }
    }

}