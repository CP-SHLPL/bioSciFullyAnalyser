using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GrpcGreeter.Migrations
{
    /// <inheritdoc />
    public partial class gRPCefMigraionS2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "SampleId",
                table: "TblResults",
                type: "longtext",
                nullable: true,
                oldClrType: typeof(long),
                oldType: "bigint");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<long>(
                name: "SampleId",
                table: "TblResults",
                type: "bigint",
                nullable: false,
                defaultValue: 0L,
                oldClrType: typeof(string),
                oldType: "longtext",
                oldNullable: true);
        }
    }
}
