using System;
using Microsoft.EntityFrameworkCore.Migrations;
using MySql.EntityFrameworkCore.Metadata;

#nullable disable

namespace Data.Migrations
{
    /// <inheritdoc />
    public partial class AddTest : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "TblTest",
                columns: table => new
                {
                    IdTest = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    UniqueIDTest = table.Column<int>(type: "int", nullable: false),
                    TestCode = table.Column<string>(type: "varchar(100)", maxLength: 100, nullable: false),
                    TestName = table.Column<string>(type: "varchar(400)", maxLength: 400, nullable: false),
                    ConventionalUnitID = table.Column<int>(type: "int", nullable: false),
                    SIUnitID = table.Column<int>(type: "int", nullable: false),
                    isSpecialSolution = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    CurveTypeID = table.Column<int>(type: "int", nullable: false),
                    MethodID = table.Column<int>(type: "int", nullable: false),
                    NoOfReagents = table.Column<int>(type: "int", nullable: false),
                    DecimalPlaces = table.Column<int>(type: "int", nullable: false),
                    BlankType = table.Column<int>(type: "int", nullable: false),
                    TestSequence = table.Column<int>(type: "int", nullable: false),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    ModifiedBy = table.Column<int>(type: "int", nullable: false),
                    ModifiedAt = table.Column<DateTime>(type: "datetime(6)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TblTest", x => x.IdTest);
                })
                .Annotation("MySQL:Charset", "utf8mb4");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "TblTest");
        }
    }
}
