using Data.Interfaces;
using Grpc.Core;
using GRPCServer.Protos;
using Data.Enums;
using Data.Entities;

namespace GRPCServer.Services
{
    public class TestService(ILogger<TestService> logger,
                                    ITblTest _tblTestRepository,
                                    ITblDictionaryValues _tblDictionaryValues) : Test.TestBase
    {
        //private readonly ITblUserRepository _tblUserRepository;
        //private readonly ITblDictionaryValues _TblDictionaryValueRepository;

        //public TestService(ITblUserRepository tblUserRepository, ITblDictionaryValues tblDictionaryValueRepository)
        //{
        //    this._tblUserRepository = tblUserRepository;
        //    _TblDictionaryValueRepository = tblDictionaryValueRepository;
        //}

        public override Task<TestResponse> GetTest(TestRequest request, ServerCallContext context)
        {
            logger.LogInformation("The message is received from {Name}", request.TestID);

            //var user = _tblUserRepository.GetByUsernameAsync(request.Name).Result;
            var test = _tblTestRepository.GetTest(request.TestID);
            if (test.IdTest != 0)
            {
                var testDetails = _tblTestRepository.GetTestDetails(test.IdTest);

                var testData = new TestData
                {
                    TestID = test.IdTest,
                    TestName = test.TestName,
                    TestCode = test.TestCode,
                    TestMethod = test.MethodID,
                    TestUnit = test.ConventionalUnitID,
                    Reagents = test.NoOfReagents,
                    BlankType = test.BlankType,
                    Decimals = test.DecimalPlaces,
                    CreatedAt = test.CreatedAt.ToString("yyyy-MM-dd HH:mm:ss"),
                    IncubationTime = testDetails.IncubationTime,
                    ReadingTime = testDetails.ReadingTime,
                    CorelationA = testDetails.CorelationA,
                    CorelationB = testDetails.CorelationB,
                    R1Volume = testDetails.R1Volume,
                    R2Volume = testDetails.R2Volume,
                    SampleVolume = testDetails.SampleVolume,
                    AutoDilutionRatio = testDetails.AutoDilutionRatio,
                    StirrerSpeedSample = testDetails.StirrerSpeedSample,
                    StirrerSpeedR2 = testDetails.StirrerSpeedR2,
                    LastReagentBlank = testDetails.LastReagentBlank,
                    ReagentBlankLow = testDetails.ReagentBlankLow,
                    ReagentBlankHigh = testDetails.ReagentBlankHigh,
                    PrimaryFilter = testDetails.PrimaryFilterID,
                    SecondaryFilter = testDetails.SecondaryFilterID,
                    Linearity = testDetails.Linearity,
                    SubstrateDepletion = testDetails.SubstrateDepletion,
                    Direction = test.DirectionID
                };

                var response = Task.FromResult(new TestResponse
                {
                    RequestSuccess = true,
                    Test = testData
                });
                return response;
            }
            else
            {
                return Task.FromResult(new TestResponse
                {
                    RequestSuccess = false,
                    //TestDescription = "",
                    //TestCategory = 0,
                    //RoleString = ""
                });
            }
        }

        public override Task<DropDownListResponse> GetAllDropDowns(DropDownRequest request, ServerCallContext context)
        {
            logger.LogInformation("The message is received from {Name}", request.ToString());

            var listOfDropDowns = new List<EnumDicitonaryKeys> {
                EnumDicitonaryKeys.BlankType,
                EnumDicitonaryKeys.Method,
                EnumDicitonaryKeys.Filter,
                EnumDicitonaryKeys.Unit,
                EnumDicitonaryKeys.ReactionDirection,
                EnumDicitonaryKeys.StirrerSpeed

            };
            var response = new DropDownListResponse();
            foreach (var dropDownKey in listOfDropDowns)
            {
                var values = _tblDictionaryValues.GetDictionaryValues((int)dropDownKey).Select(value =>
                {
                    return new DropDownListItem
                    {
                        Value = value.DictionaryValue,
                        Text = value.ValueDescription
                    };
                }).ToList();
                DropDownValues dropDown = new DropDownValues
                {
                    Items = { values }
                };

                response.DropDowns[dropDownKey.ToString()] = dropDown;
            }

            return Task.FromResult(response);
        }

        public override Task<UpdateResponse> UpdateTest(TestResponse testResponse, ServerCallContext context)
        {
            var test = new TblTest();
            var testDetails = new TblTestDetails();

            var response = testResponse.Test;

            test.IdTest = response.TestID;
            test.TestCode = response.TestCode;
            test.TestName = response.TestName;
            test.ConventionalUnitID = response.TestUnit;
            test.DecimalPlaces = response.Decimals;
            test.NoOfReagents = response.Reagents;
            test.BlankType = response.BlankType;
            test.DirectionID = response.Direction;
            test.MethodID = response.TestMethod;

            testDetails.StirrerSpeedSample = response.StirrerSpeedSample;
            testDetails.StirrerSpeedR2 = response.StirrerSpeedR2;
            testDetails.IsDelayedR2 = true;
            testDetails.CorelationA = (int)response.CorelationA;
            testDetails.CorelationB = (int)response.CorelationB;
            testDetails.R1Volume = response.R1Volume;
            testDetails.R2Volume = response.R2Volume;
            testDetails.SampleVolume = response.SampleVolume;
            testDetails.PrimaryFilterID = response.PrimaryFilter;
            testDetails.SecondaryFilterID = response.SecondaryFilter;
            testDetails.IncubationTime = response.IncubationTime;
            testDetails.ReadingTime = response.ReadingTime;
            testDetails.Linearity = response.Linearity;
            testDetails.SubstrateDepletion = response.SubstrateDepletion;
            testDetails.AutoDilutionRatio = response.AutoDilutionRatio;
            testDetails.ModifiedAt = DateTime.Now;
            testDetails.ModifiedBy = 1;

            var saveSuccess = _tblTestRepository.UpdateTest(test, testDetails);

            switch (saveSuccess)
            {
                case TestRepositoryErrors.None:
                    return Task.FromResult(new UpdateResponse
                    {
                        RequestSuccess = true,
                        ErrorType = 0,
                        Message="Test saved successfully"
                    });
                    break;
                case TestRepositoryErrors.TestNotFound:
                    return Task.FromResult(new UpdateResponse
                    {
                        RequestSuccess = false,
                        ErrorType = 1,
                        Message = "Test not found"
                    });
                    break;
                case TestRepositoryErrors.TestDetailsNotFound:
                    return Task.FromResult(new UpdateResponse
                    {
                        RequestSuccess = false,
                        ErrorType = 2,
                        Message = "Test details not found"
                    });
                    break;
                case TestRepositoryErrors.DatabaseError:
                    return Task.FromResult(new UpdateResponse
                    {
                        RequestSuccess = false,
                        ErrorType = 3,
                        Message = "Database error"
                    });
                    break;
                case TestRepositoryErrors.TestAlreadyExists:
                    return Task.FromResult(new UpdateResponse
                    {
                        RequestSuccess = false,
                        ErrorType = 4,
                        Message = "Test with the same name already exists"
                    });
                    break;
                default:
                    return Task.FromResult(new UpdateResponse
                    {
                        RequestSuccess = false,
                        ErrorType = 0,
                        Message = "Unknown error"
                    });

            }
        }
        public override Task<TestListResponse> GetTestList(TestListRequest request, ServerCallContext context)
        {
            try{
                var testCardData = new List<TestCardData>();

                var  testList = _tblTestRepository.GetTestList(request.IncludeSpecialSolutions);

                foreach(var test in testList)
                {
                    var testDetail = _tblTestRepository.GetTestDetails(test.IdTest);
                    testCardData.Add(new TestCardData
                    {
                        TestID = test.IdTest,
                        TestCode = test.TestCode,
                        TestName = test.TestName,
                        Method = _tblDictionaryValues.GetDictionaryValue((int)EnumDicitonaryKeys.Method,test.MethodID),
                        BlankType = _tblDictionaryValues.GetDictionaryValue((int)EnumDicitonaryKeys.BlankType,test.BlankType),
                        PrimaryFilter = _tblDictionaryValues.GetDictionaryValue((int)EnumDicitonaryKeys.Filter,testDetail.PrimaryFilterID),
                        SecondaryFilter = _tblDictionaryValues.GetDictionaryValue((int)EnumDicitonaryKeys.Filter,testDetail.SecondaryFilterID)
                    });
                }

                return Task.FromResult(new TestListResponse
                {
                    RequestSuccess = true,
                    Tests = { testCardData },
                });
            }catch(Exception ex)
            {
                return Task.FromResult(new TestListResponse
                {
                    RequestSuccess = false,
                    Tests = { },
                });
            }
        }
    }
}
