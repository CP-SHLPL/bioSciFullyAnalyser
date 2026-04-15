using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Entities
{
    public class TblDictionaryValues
    {
        public int IdDictionaryValue { get; set; }
        public int IdDictionaryKey { get; set; }
        public required string DictionaryValue { get; set; }
        public required string ValueDescription { get; set; }
        public bool IsActive { get; set; }
        public bool IsDefault { get; set; } = false;

        // Audit
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public int CreatedBy { get; set; }
        public DateTime? ModifiedAt { get; set; } = null;
        public int? ModifiedBy { get; set; } = null;
    }
}
