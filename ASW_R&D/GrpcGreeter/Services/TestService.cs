using Google.Protobuf.WellKnownTypes;
using GrpcGreeter.Models;
using Grpc.Core;
using Microsoft.EntityFrameworkCore;


namespace GrpcGreeter.Services
{
    public class TestService : Test.TestBase
    {
        private readonly FAA_DbContext _dbContext;
        private readonly ILogger<TestService> _logger;
        public TestService(FAA_DbContext dbContext, ILogger<TestService> logger) {
            _dbContext = dbContext;
            _logger = logger;
        }

        public override async Task<TestDataOutput> SaveTestData(TestDataInput testInput, ServerCallContext context)
        {
            _logger.LogInformation("Test Data received for Testcode {TestCode}", testInput.TestCode);
            var TestData = new TblTests()
            {
                TestCode = testInput.TestCode,
                TestName = testInput.TestName
            };
            await _dbContext.TblTests.AddAsync(TestData);
            int SavedRows =  _dbContext.SaveChanges();

            return new TestDataOutput
            {
                DataStatus = SavedRows  > 0 ? 1 : 0,        //1: Saved 0: Not saved
            };
        }
    }
}
