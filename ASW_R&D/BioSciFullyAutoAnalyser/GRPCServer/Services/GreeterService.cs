using Data.Interfaces;
using Grpc.Core;

namespace GRPCServer.Services
{
    public class GreeterService(ILogger<GreeterService> logger,
                                    ITblUserRepository _tblUserRepository) : Greeter.GreeterBase
    {
        //private readonly ITblUserRepository _tblUserRepository;
        //private readonly ITblDictionaryValues _TblDictionaryValueRepository;

        //public GreeterService(ITblUserRepository tblUserRepository, ITblDictionaryValues tblDictionaryValueRepository)
        //{
        //    this._tblUserRepository = tblUserRepository;
        //    _TblDictionaryValueRepository = tblDictionaryValueRepository;
        //}

        public override Task<HelloReply> SayHello(HelloRequest request, ServerCallContext context)
        {
            logger.LogInformation("The message is received from {Name}", request.Name);

            var user = _tblUserRepository.GetByUsernameAsync(request.Name).Result;

            if(user != null)
            {
                return Task.FromResult(new HelloReply
                {
                    Message = $"Hello {user.FirstName} {user.LastName}. Your password is {user.Password} and your role is {user.Role}"
                });
            }
            else
            {
                return Task.FromResult(new HelloReply
                {
                    Message = "User not found."
                });
            }
        }
    }
}
