using Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Configurations
{
    public class TblTestDetailsConfiguration : IEntityTypeConfiguration<TblTestDetails  >
    {
        public void Configure(EntityTypeBuilder<TblTestDetails> builder)
        {
            builder.ToTable("TblTestDetails");
            builder.HasKey(e => e.IdTestDetails);
            builder.Property(e => e.IdTestDetails)
                .ValueGeneratedOnAdd();


        }
    }
}
