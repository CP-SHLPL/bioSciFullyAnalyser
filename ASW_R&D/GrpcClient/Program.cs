using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using Grpc.Net.Client;
using GrpcClient;
using ServerStream;
using ClientStream;


class Program
{
    static async Task Main(string[] args)
    {
        // The port number must match the port of the gRPC server.
        //var channel = GrpcChannel.ForAddress("https://localhost:7020");
        ////var client = new Greeter.GreeterClient(channel);
        //var getResult = new Result.ResultClient(channel);
        //var saveTest = new Test.TestClient(channel);

        /********Greetings ************/
        //var reply = await client.SayHelloAsync(
        //    new HelloRequest { Name = "Grpc Client - Shaurya" });
        //Console.WriteLine("Greeting: " + reply.Message + "\n\n");


        /***********Save Test to database *****************/
        //var TestOutput = await saveTest.SaveTestDataAsync(new TestDataInput
        //{
        //    TestCode = "DP",
        //    TestName = "Direct Protein"
        //});

        //if(TestOutput.Status == 1)
        //{
        //    Console.WriteLine("Test Saved success.");
        //}
        //else
        //{
        //    Console.WriteLine("Error to save test.");
        //}


        /*************Retrive resultlist from DB *****************/
        //var response = await getResult.GetResultDataAsync(
        //    new ResultDataInput {
        //        DdlTestCode = "",        
        //        TxtSampleID = "SMP002" });
        //foreach (var result in response.ResultList)
        //{
        //    string ResultDateTime = result.ResultDate.ToString();// + " " + ResultData.ResultTime.ToString();
        //    Console.WriteLine($"Received Result Data for SMPID: {result.SampleBarcode} - Result ID - {result.ResultIDPK}, Test Code - {result.TestCode}, Result - {result.Result},  ResultDate&Time - {ResultDateTime}");

        //}

        /**************Get Stream data from server **************/
        Console.WriteLine("Server data streaming started....\n");
        await ServerStreamDemo();

        Console.WriteLine("Client data streaming started....\n");
        await ClientStreamDemo();

        Console.WriteLine("Press any key to exit...");
        Console.ReadKey();

    }
    public static async Task ServerStreamDemo()             /**************Get Stream data from server **************/
    {
        var channel = GrpcChannel.ForAddress("https://localhost:7020");
        var StreamObj = new StreamData.StreamDataClient(channel);
        var response = StreamObj.ProcessStreamData(
            new StreamDataInput
            {
                InputMsg = "Start sending data stream..."
            });
        while(await response.ResponseStream.MoveNext(CancellationToken.None))
        {
            var responseMsg = response.ResponseStream.Current.StreamDataVal;
            Console.WriteLine(responseMsg);
        }

        Console.WriteLine("Server data streaming finished.");
        await channel.ShutdownAsync();
    }

    public static async Task ClientStreamDemo()
    {
        var random =  new Random();
        var channel = GrpcChannel.ForAddress("https://localhost:7020");
        var obj = new ClientStream.ClientStream.ClientStreamClient(channel);
        var clientStream = obj.ProcessClientStream();
        for (var i = 1; i <= 10; i++)
        {
            int FiterCnt = random.Next(34000, 34500);
            int waitSec = random.Next(1, 3);
            await clientStream.RequestStream.WriteAsync(new InputStream { MsgId = i, Filter = "340", CuvNo = i, Reading = FiterCnt});
            await Task.Delay(waitSec);
        }
        await clientStream.RequestStream.CompleteAsync();
        Console.WriteLine("Data streaming completed from client side...");
    }

}