
namespace Data.Entities
{
    public class TblDictionaryValues
    {
        public int IdDictionaryValue { get; set; }
        public int IdDictionaryKey { get; set; }
        public int DictionaryValue { get; set; }
        public string ValueDescription { get; set; }
        public bool IsActive { get; set; }
        public bool IsDefault { get; set; } = false;

        // Audit
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        public int CreatedBy { get; set; }
        public DateTime? ModifiedAt { get; set; } = null;
        public int? ModifiedBy { get; set; } = null;
    }
}