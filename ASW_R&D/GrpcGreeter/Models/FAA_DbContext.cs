
using Microsoft.EntityFrameworkCore;
using System;

namespace GrpcGreeter.Models
{
    public class FAA_DbContext : DbContext
    {
        public FAA_DbContext()
        {
        }

        public FAA_DbContext(DbContextOptions<FAA_DbContext> options) : base(options) { }

        public DbSet<TblResults> TblResults { get; set; }
        public DbSet<TblTests> TblTests { get; set; }

    }
}
