using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Data.Entities;

namespace Data.Configurations
{
    public class TblDictionaryKeysConfiguration : IEntityTypeConfiguration<TblDictionaryKeys>
    {
        public void Configure(EntityTypeBuilder<TblDictionaryKeys> builder)
        {
            builder.ToTable("TblDictionaryKeys");
            builder.HasKey(e => e.IdDictionaryKey);
            builder.Property(e => e.IdDictionaryKey)
                .ValueGeneratedOnAdd();

            builder.Property(e => e.DictionaryKey)
                .IsRequired()
                .HasMaxLength(100);

            builder.Property(e => e.KeyDescription)
                .HasMaxLength(400);

        }
    }
}