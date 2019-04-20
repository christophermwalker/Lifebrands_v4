using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace Lifebrands_v4.Entities
{
    [Table("Promo")]
    public class Promo
    {
        [Key]
        public String IdPromo { get; set; }
        [Required]
        public String Promo_Name { get; set; }
        [Required]
        public String Promo_Description { get; set; }
        [Required]
        public String Promo_Date { get; set; }

        public String Promo_Discount { get; set; }

    }

}