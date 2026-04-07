using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using GrpcGreeter.Models;
using Microsoft.EntityFrameworkCore;
using static System.Runtime.InteropServices.JavaScript.JSType;


namespace GrpcGreeter.Services
{
    
    public class ResultService : Result.ResultBase
    {
        private readonly FAA_DbContext _dbContext;
        private readonly ILogger<ResultService> _logger;
        public ResultService(FAA_DbContext dbContext, ILogger<ResultService> logger)
        {
            _dbContext = dbContext;
            _logger = logger;
        }

        public override async Task<ResultListOutput> GetResultData(ResultDataInput resInput, ServerCallContext context)
        {
            _logger.LogInformation("The Result Data for SampleID: {TxtSampleID}", resInput.TxtSampleID);
            var Query =from result in _dbContext.TblResults join test in _dbContext.TblTests on result.TestId equals test.TestId 
                       where result.SampleBarcode == resInput.TxtSampleID select new { result, test };
            
            var DataList = await Query.ToListAsync();

            if (!DataList.Any()) {
                _logger.LogInformation("No Result Found!");
                throw new RpcException(new Status(StatusCode.NotFound, "No Results Found!"));
            }
            var ResultListOutput = new ResultListOutput();

            foreach (var data in DataList)
            {
                ResultListOutput.ResultList.Add(new ResultDataOutput
                {
                    ResultIDPK = data.result.ResultId,
                    TestCode = data.test.TestName,
                    SampleBarcode = data.result.SampleBarcode,
                    Result = data.result.Result,
                    ResultDate = Timestamp.FromDateTime(data.result.ResultDate.ToUniversalTime()),
                    //ResultTime = Timestamp.FromDateTime(result.ResultTime)


                });
            }
            
            return ResultListOutput;

        }
    }
}
