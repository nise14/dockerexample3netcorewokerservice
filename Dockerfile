#Build
FROM mcr.microsoft.com/dotnet/sdk:6.0 as build
WORKDIR app
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o out
#Runtime
FROM mcr.microsoft.com/dotnet/runtime:6.0
WORKDIR app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet","workerApp.dll"]