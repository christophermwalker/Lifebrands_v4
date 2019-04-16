using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;


namespace Lifebrands_v4.Models
{
    [Table("Product")]
    public class  Product
    {
        [Key]
        public String IdProduct { get; set; }
        [Required]
        public String Prod_Name { get; set; }
        [Required]
        public Decimal Cost { get; set; }
        [Required]
        public Decimal Wholesale_Cost { get; set; }
        [Required]
        public Decimal Retail_Price { get; set; }
    }

}