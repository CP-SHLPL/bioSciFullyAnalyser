using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Data.Entities;

namespace Data.Configurations
{
    public class TblUserConfiguration : IEntityTypeConfiguration<TblUser>
    {
        public void Configure(EntityTypeBuilder<TblUser> builder)
        {
            builder.ToTable("TblUser");
            builder.HasKey(e => e.IdUser);
            builder.Property(e => e.IdUser)
                .ValueGeneratedOnAdd();

            builder.Property(e => e.Username)
                .IsRequired()
                .HasMaxLength(100);

            builder.Property(e => e.FirstName)
                .HasMaxLength(100);

            builder.Property(e => e.LastName)
                .HasMaxLength(100);

        }
    }
}