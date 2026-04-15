using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Entities
{
    public class TblDictionaryKeys
    {
        public int IdDictionaryKey { get; set; }
        //Value
        public required string DictionaryKey { get; set; }
        public required string KeyDescription { get; set; }
        public int IsEditable { get; set; }

        // Audit
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public int CreatedBy { get; set; }
        public DateTime? ModifiedAt { get; set; }
        public int? ModifiedBy { get; set; }
    }
}
