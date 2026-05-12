using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Data.Entities;

namespace Data.Configurations
{
    public class TblTestConfiguration : IEntityTypeConfiguration<TblTest>
    {
        public void Configure(EntityTypeBuilder<TblTest> builder)
        {
            builder.ToTable("TblTest");
            builder.HasKey(e => e.IdTest);
            builder.Property(e => e.IdTest)
                .ValueGeneratedOnAdd();

            builder.Property(e => e.TestCode)
                .IsRequired()
                .HasMaxLength(100);

            builder.Property(e => e.TestName)
                .HasMaxLength(400);

        }
    }
}