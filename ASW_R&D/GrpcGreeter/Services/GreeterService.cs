using Grpc.Core;

namespace GrpcGreeter.Services
{
    public class GreeterService(ILogger<GreeterService> logger) : Greeter.GreeterBase
    {
        public override Task<HelloReply> SayHello(HelloRequest request, ServerCallContext context)
        {
            logger.LogInformation("The message is received from {Name}", request.Name);
            String[] RequestNames = request.Name.Split('-');

            return Task.FromResult(new HelloReply
            {
                Message = "Hello " + RequestNames[1] +", how may I help you?"
            });
        }
    }
}
