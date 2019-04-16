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
        public String IdNotifications { get; set; }
        [Required]
        public DateTime Note_Date { get; set; }
        [Required]
        public String Subject { get; set; }
        [Required]
        public String Comments { get; set; }

    }

}