using GrpcGreeter.Models;
using GrpcGreeter.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using System.Configuration;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddGrpc();
var connectionString = builder.Configuration.GetConnectionString("AppConnection") ?? throw new InvalidOperationException("Connection string not found");
builder.Services.AddDbContext<FAA_DbContext>(options => {     
    options.UseMySQL(connectionString);
});

var app = builder.Build();

// Configure the HTTP request pipeline.
///app.MapGrpcService<GreeterService>();
app.MapGrpcService<ResultService>();
app.MapGrpcService<TestService>();
app.MapGrpcService<StreamDataService>();
app.MapGrpcService<ClientStreamService>();
app.MapGet("/", () => "GRPC server running...");

app.Run();
