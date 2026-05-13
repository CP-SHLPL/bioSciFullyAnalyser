using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Data.Migrations
{
    /// <inheritdoc />
    public partial class TestStringsAdded : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "BlankTypeString",
                table: "TblTest",
                type: "longtext",
                nullable: false);

            migrationBuilder.AddColumn<string>(
                name: "DisplayString",
                table: "TblTest",
                type: "longtext",
                nullable: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsVisible",
                table: "TblTest",
                type: "tinyint(1)",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "MethodString",
                table: "TblTest",
                type: "longtext",
                nullable: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "BlankTypeString",
                table: "TblTest");

            migrationBuilder.DropColumn(
                name: "DisplayString",
                table: "TblTest");

            migrationBuilder.DropColumn(
                name: "IsVisible",
                table: "TblTest");

            migrationBuilder.DropColumn(
                name: "MethodString",
                table: "TblTest");
        }
    }
}
