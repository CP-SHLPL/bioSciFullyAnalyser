using Data.Contexts;
using Data.Interfaces;
using Data.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Text;

namespace Data
{
    public static class AddDatabaseContext
    {
        public static IServiceCollection AddSharedDatabase(
        this IServiceCollection services,
        string connectionString)
        {
            services.AddDbContext<DatabaseContext>(options => options.UseMySQL(connectionString));

            services.AddScoped<ITblUserRepository, TblUserRepository>();
            services.AddScoped<ITblDictionaryValues, TblDictionaryValuesRepository>();
            return services;
        }
    }
}
