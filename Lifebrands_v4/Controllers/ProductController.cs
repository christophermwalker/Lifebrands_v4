using Lifebrands_v4.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Web.Mvc;
using System.Web.Query.Dynamic;
using static Lifebrands_v4.Models.ApplicationDbContext;

namespace Lifebrands_v4.Controllers
{
       
    public class ProductController : Controller
    {

        [Route("Product/Product")]

        public ActionResult Product()
        {

            return View();
        }

        [Route("Product/GetProducts")]
      
       public JsonResult GetProducts(string sidx, string sort, int page, int rows)
       {
           DatabaseContext db = new DatabaseContext();
           sort = (sort == null) ? "" : sort;
           int pageIndex = Convert.ToInt32(page);
           int pageSize = rows;

           var ProductList = db.Product.Select(
                      t => new
                      {
                          t.IdProduct,
                          t.Prod_Name,
                          t.Cost,
                          t.Wholesale_Cost,
                          t.Retail_Price,
                      }
                      ).ToList();

           int totalRecords = ProductList.Count();
           var totalPages = (int)Math.Ceiling((float)totalRecords / (float)rows);
           
            /*
           if (sort.ToUpper() == "DESC")
           {
               ProductList = ProductList.OrderByDescending(t => t.name);
               ProductList = ProductList.Skip(pageIndex * pageSize).Take(pageSize);
           }
           else
           {
               ProductList = ProductList.OrderBy(t => t.name);
               ProductList = ProductList.Skip(pageIndex * pageSize).Take(pageSize);
           }
           */
          
           var jsonData = new
           {
               rows = ProductList,
               page,
               total = totalPages,
               records = totalRecords,
               
           };
           return Json(jsonData, JsonRequestBehavior.AllowGet);
       }

        [Route("Product/CreateProduct")]
        [HttpPost]
        public string CreateProduct(Product Model)
        {
            DatabaseContext db = new DatabaseContext();
            string msg;
            try
            {
                if (ModelState.IsValid)
                {
                    Model.IdProduct = Guid.NewGuid().ToString();
                    db.Product.Add(Model);
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
        [Route("Product/EditProduct")]
        public string EditProduct(Product Model)
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
        [Route("Product/DeleteProduct")]
        public string DeleteProduct(string Id)
        {
            DatabaseContext db = new DatabaseContext();
            Product Product = db.Product.Find(Id);
            db.Product.Remove(Product);
            db.SaveChanges();
            return "Deleted successfully";
        }
    }

}