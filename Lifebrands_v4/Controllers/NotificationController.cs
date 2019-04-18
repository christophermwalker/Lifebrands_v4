
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
    public class NotificationController : Controller
    {
        [Route("Notification/Notification")]
        public ActionResult Notification()
        {

            return View();
        }


        [Route("Notification/GetNotifications")]
        public JsonResult GetNotifications(string sidx, string sort, int page, int rows)
        {
            DatabaseContext db = new DatabaseContext();
            sort = (sort == null) ? "" : sort;
            int pageIndex = Convert.ToInt32(page) - 1;
            int pageSize = rows;

            var NotificationList = db.Notification.Select(
                       t => new
                       {
                           t.IdNotification,
                           t.Note_Date,
                           t.Note_Subject,
                           t.Comments,
       
                       }
                       ).ToList();

            int totalRecords = NotificationList.Count();
            var totalPages = (int)Math.Ceiling((float)totalRecords / (float)rows);
            /*
            if (sort.ToUpper() == "DESC")
            {
                NotificationsList = NotificationsList.OrderByDescending(t => t.idNotifications);
                NotificationsList = NotificationsList.Skip(pageIndex * pageSize).Take(pageSize);
            }
            else
            {
                NotificationsList = NotificationsList.OrderBy(t => t.idNotifications);
                NotificationsList = NotificationsList.Skip(pageIndex * pageSize).Take(pageSize);
            }
            */
            var jsonData = new
            {
                total = totalPages,
                page,
                records = totalRecords,
                rows = NotificationList
            };
            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }
        [Route("Notification/CreateNotification")]

        [HttpPost]
        public string CreateNotification(Notification Model)
        {
            DatabaseContext db = new DatabaseContext();
            string msg;
            try
            {
                if (ModelState.IsValid)
                {
                    Model.IdNotification = Guid.NewGuid().ToString();
                    db.Notification.Add(Model);
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

        [Route("Notification/EditNotification")]
        public string EditNotification(Notification Model)
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

        [Route("Notification/DeleteNotification")]
        public string DeleteNotification(string Id)
        {
            DatabaseContext db = new DatabaseContext();
            Notification idNotification = db.Notification.Find(int.Parse(Id));
            db.Notification.Remove(idNotification);
            db.SaveChanges();
            return "Deleted successfully";
        }
    }

}