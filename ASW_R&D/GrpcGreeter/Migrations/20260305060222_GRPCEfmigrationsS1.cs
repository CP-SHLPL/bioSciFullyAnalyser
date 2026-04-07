using System;
using Microsoft.EntityFrameworkCore.Migrations;
using MySql.EntityFrameworkCore.Metadata;

#nullable disable

namespace GrpcGreeter.Migrations
{
    /// <inheritdoc />
    public partial class GRPCEfmigrationsS1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterDatabase()
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "TblResults",
                columns: table => new
                {
                    ResultId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    TestId = table.Column<short>(type: "smallint", nullable: false),
                    SampleId = table.Column<long>(type: "bigint", nullable: false),
                    Result = table.Column<string>(type: "varchar(50)", maxLength: 50, nullable: false),
                    ResultDate = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    ResultTime = table.Column<TimeSpan>(type: "time(6)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TblResults", x => x.ResultId);
                })
                .Annotation("MySQL:Charset", "utf8mb4");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "TblResults");
        }
    }
}
