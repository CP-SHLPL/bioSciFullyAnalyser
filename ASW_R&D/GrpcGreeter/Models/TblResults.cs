using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace GrpcGreeter.Models
{
    public class TblResults
    {
        [Key]
        public int ResultId { get; set; }
        [Required]
        public short TestId { get; set; }
        public String SampleBarcode { get; set; } = String.Empty;
        [Required]
        public float Result { get; set; }
        [Required]
        public DateTime ResultDate { get; set; }
        [Required]
        public TimeSpan ResultTime { get; set; }
    }
}
