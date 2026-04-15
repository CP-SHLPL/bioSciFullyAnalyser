using System;
using Microsoft.EntityFrameworkCore;
using Data.Entities;

namespace Data.Contexts
{
    public class DatabaseContext : DbContext
    {
        public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options)
        {
        }

        public DbSet<TblUser> TblUsers { get; set; }
        public DbSet<TblDictionaryKeys> TblDictionaryKeys { get; set; }
        public DbSet<TblDictionaryValues> TblDictionaryValues { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Load all IEntityTypeConfiguration implementations from this assembly
            modelBuilder.ApplyConfigurationsFromAssembly(typeof(DatabaseContext).Assembly);

            base.OnModelCreating(modelBuilder);
        }
    }
}
