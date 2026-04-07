using Microsoft.EntityFrameworkCore.Migrations;
using MySql.EntityFrameworkCore.Metadata;

#nullable disable

namespace GrpcGreeter.Migrations
{
    /// <inheritdoc />
    public partial class TestTbladded_S3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "SampleId",
                table: "TblResults");

            migrationBuilder.AlterColumn<float>(
                name: "Result",
                table: "TblResults",
                type: "float",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "varchar(50)",
                oldMaxLength: 50);

            migrationBuilder.AddColumn<string>(
                name: "SampleBarcode",
                table: "TblResults",
                type: "longtext",
                nullable: false);

            migrationBuilder.CreateTable(
                name: "TblTests",
                columns: table => new
                {
                    TestId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    TestCode = table.Column<string>(type: "varchar(50)", maxLength: 50, nullable: false),
                    TestName = table.Column<string>(type: "varchar(100)", maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TblTests", x => x.TestId);
                })
                .Annotation("MySQL:Charset", "utf8mb4");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "TblTests");

            migrationBuilder.DropColumn(
                name: "SampleBarcode",
                table: "TblResults");

            migrationBuilder.AlterColumn<string>(
                name: "Result",
                table: "TblResults",
                type: "varchar(50)",
                maxLength: 50,
                nullable: false,
                oldClrType: typeof(float),
                oldType: "float");

            migrationBuilder.AddColumn<string>(
                name: "SampleId",
                table: "TblResults",
                type: "longtext",
                nullable: true);
        }
    }
}
