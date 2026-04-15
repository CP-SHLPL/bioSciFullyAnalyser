using Data.Interfaces;
using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using GRPCServer.Protos;

namespace GRPCServer.Services
{
    public class LoginService(ILogger<GreeterService> logger,
                                    ITblUserRepository _tblUserRepository,
                                    ITblDictionaryValues _TblDictionaryValueRepository) : Login.LoginBase
    {
        //private readonly ITblUserRepository _tblUserRepository;
        //private readonly ITblDictionaryValues _TblDictionaryValueRepository;

        //public GreeterService(ITblUserRepository tblUserRepository, ITblDictionaryValues tblDictionaryValueRepository)
        //{
        //    this._tblUserRepository = tblUserRepository;
        //    _TblDictionaryValueRepository = tblDictionaryValueRepository;
        //}

        public override Task<LoginResponse> LoginAttempt(LoginRequest request, ServerCallContext context)
        {
            logger.LogInformation("The message is received from {Name}", request.Username);

            var user = _tblUserRepository.AttemptLogin(request.Username, request.Password);

            if (user != null)
            {
                var userRole = _TblDictionaryValueRepository.GetUserRole(user.Role);

                return Task.FromResult(new LoginResponse
                {
                    LoginSuccess = true,
                    UserID = user.IdUser,
                    FirstName = user.FirstName,
                    SecondName = user.LastName,
                    RoleString = userRole ?? "Unkown",
                    Role = user.Role
                });
            }
            else
            {
                return Task.FromResult(new LoginResponse
                {
                    LoginSuccess = false,
                    UserID = -1,
                    FirstName = "",
                    SecondName = "",
                    RoleString = "Unknown",
                    Role = -1
                });
            }
        }

        //DictionaryListResponse

        public override Task<DictionaryListResponse> GetDictionaryValues(DictionaryRequest request, ServerCallContext context)
        {
            var DictionaryList = _TblDictionaryValueRepository.GetDictionaryValues(request.DictionaryId);

            var DictionaryListResponse = new DictionaryListResponse();
            foreach (var item in DictionaryList)
            {
                var dictItem = new DictionaryItem();
                dictItem.Id = 1;
                dictItem.Value = item;
                dictItem.CreatedAt = Timestamp.FromDateTime(DateTimeOffset.Now.UtcDateTime);
                DictionaryListResponse.Items.Add(dictItem);
            }
            //return DictionaryListResponse;
            return Task.FromResult(DictionaryListResponse);
        }

        public override Task<DictionaryItem> UpdateDictionaryValue(DictionaryItemRequest request, ServerCallContext context)
        {

            var isUpdated = _TblDictionaryValueRepository.UpdateDictionaryValue(request.DictionaryKeyId, request.DictionaryValueId, request.ValueDescription);

            if (isUpdated)
            {

                return Task.FromResult(new DictionaryItem
                {
                    Id = request.DictionaryValueId,
                    Value = request.ValueDescription,
                    CreatedAt = Timestamp.FromDateTime(DateTimeOffset.Now.UtcDateTime)
                });
            }
            else
            {
                return Task.FromResult(new DictionaryItem
                {
                    Id = -1,
                    Value = "",
                    CreatedAt = Timestamp.FromDateTime(DateTimeOffset.Now.UtcDateTime)
                });
            }
        }

    }
}
