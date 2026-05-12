using System;
using Microsoft.EntityFrameworkCore.Migrations;
using MySql.EntityFrameworkCore.Metadata;

#nullable disable

namespace Data.Migrations
{
    /// <inheritdoc />
    public partial class TestDetailsAdded1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "TblTestDetails",
                columns: table => new
                {
                    IdTestDetails = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    IdTest = table.Column<int>(type: "int", nullable: false),
                    PrimaryFilterID = table.Column<int>(type: "int", nullable: false),
                    SecondaryFilterID = table.Column<int>(type: "int", nullable: false),
                    IsDelayedR2 = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    Linearity = table.Column<double>(type: "double", nullable: false),
                    SubstrateDepletion = table.Column<double>(type: "double", nullable: false),
                    IncubationTime = table.Column<int>(type: "int", nullable: false),
                    ReadingTime = table.Column<int>(type: "int", nullable: false),
                    ReadStartCycle = table.Column<int>(type: "int", nullable: false),
                    ReadEndCycle = table.Column<int>(type: "int", nullable: false),
                    CorelationA = table.Column<int>(type: "int", nullable: false),
                    CorelationB = table.Column<int>(type: "int", nullable: false),
                    R1Volume = table.Column<int>(type: "int", nullable: false),
                    R2Volume = table.Column<int>(type: "int", nullable: false),
                    SampleVolume = table.Column<double>(type: "double", nullable: false),
                    AutoDilutionRatio = table.Column<int>(type: "int", nullable: false),
                    StirrerSpeedSample = table.Column<int>(type: "int", nullable: false),
                    StirrerSpeedR2 = table.Column<int>(type: "int", nullable: false),
                    LastReagentBlank = table.Column<double>(type: "double", nullable: false),
                    ReagentBlankLow = table.Column<double>(type: "double", nullable: false),
                    ReagentBlankHigh = table.Column<double>(type: "double", nullable: false),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    ModifiedBy = table.Column<int>(type: "int", nullable: true),
                    ModifiedAt = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TblTestDetails", x => x.IdTestDetails);
                })
                .Annotation("MySQL:Charset", "utf8mb4");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "TblTestDetails");
        }
    }
}
