using System.ComponentModel.DataAnnotations;

namespace GrpcGreeter.Models
{
    public class TblTests
    {
        [Key]
        public int TestId { get; set; }
        [MaxLength(50)]
        public String TestCode { get; set; } = String.Empty;
        [MaxLength(100)]
        public String TestName { get; set; } = String.Empty;
    }
}
