using System;

namespace Data.Entities
{
    public class TblUser
    {
        public int IdUser { get; set; }

        // Authentication
        public required string Username { get; set; }
        public required string Password { get; set; }
        public required string PasswordSalt { get; set; }

        // Profile
        public required string FirstName { get; set; }
        public required string LastName { get; set; }
        public required int Role { get; set; }

        // Status
        public bool IsActive { get; set; } = true;

        // Audit
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public int CreatedBy { get; set; }
        public DateTime? ModifiedAt { get; set; }
        public int? ModifiedBy { get; set; }
    }
}