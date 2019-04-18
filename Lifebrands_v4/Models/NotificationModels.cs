using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace Lifebrands_v4.Entities
{
    [Table("Notification")]
    public class Notification
    {
        [Key]
        public String IdNotification { get; set; }
        [Required]
        public String Note_Date { get; set; }
        [Required]
        public String Note_Subject { get; set; }
        [Required]
        public String Comments { get; set; }

    }

}