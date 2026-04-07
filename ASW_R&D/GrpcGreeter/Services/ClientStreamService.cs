using Grpc.Core;
using Google.Protobuf.WellKnownTypes;
using GrpcGreeter.Models;
using Microsoft.EntityFrameworkCore;

namespace GrpcGreeter.Services
{
    public class ClientStreamService : ClientStream.ClientStreamBase
    {
        public ClientStreamService() { }
        public override async Task<OutputData> ProcessClientStream(IAsyncStreamReader<InputStream> clientStream, ServerCallContext context) {

            while (await clientStream.MoveNext()) {
                Console.WriteLine($"MessageID: {clientStream.Current.MsgId} Filter: {clientStream.Current.Filter} CuvNo: {clientStream.Current.CuvNo} Reading: {clientStream.Current.Reading}");
            }

            Console.WriteLine("Data receiving operation completed.");
            return new OutputData { 
                StatusMsg = "Data Received successfully."};
        }
    }
}
