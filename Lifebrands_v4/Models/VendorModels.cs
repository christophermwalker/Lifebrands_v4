using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace Lifebrands_v4.Entities
{
    [Table("Vendor")]
    public class Vendor
    {
        [Key]
        public String IdVendor { get; set; }
        [Required]
        public string Vendor_Name { get; set; }
        [Required]
        public String Vendor_Address { get; set; }
        [Required]
        public String City { get; set; }
        [Required]
        public String Vendor_State { get; set; }
        [Required]
        public String Zip { get; set; }

    }

}