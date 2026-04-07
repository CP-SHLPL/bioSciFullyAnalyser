using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using GrpcGreeter.Models;
using Microsoft.EntityFrameworkCore;


namespace GrpcGreeter.Services
{
    public class StreamDataService : StreamData.StreamDataBase
    {
        private Random random;

        public StreamDataService()
        {
            random = new Random();
        }
        public override async Task ProcessStreamData(StreamDataInput request,IServerStreamWriter<StreamDataOutput> serverStream, ServerCallContext context)
        {

            for (int i = 1; i <=10; i++) {
                var Rnum = random.Next(1, 5);

                await serverStream.WriteAsync(new StreamDataOutput {
                    StreamDataVal = $"Server Streaming message {i} after interval of {Rnum} seconds."
                });
                await Task.Delay(Rnum * 1000);
            }
        }
    }
}
