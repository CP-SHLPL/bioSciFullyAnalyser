using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Data.Entities;

namespace Data.Configurations
{
    public class TblDictionaryValuesConfiguration : IEntityTypeConfiguration<TblDictionaryValues>
    {
        public void Configure(EntityTypeBuilder<TblDictionaryValues> builder)
        {
            builder.ToTable("TblDictionaryValues");
            builder.HasKey(e => e.IdDictionaryValue);
            builder.Property(e => e.IdDictionaryValue)
                .ValueGeneratedOnAdd();

            builder.Property(e => e.DictionaryValue)
                .IsRequired()
                .HasMaxLength(100);

            builder.Property(e => e.ValueDescription)
                .HasMaxLength(400);

        }
    }
}