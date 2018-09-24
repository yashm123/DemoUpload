FROM microsoft/dotnet:sdk AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM microsoft/dotnet:aspnetcore-runtime
WORKDIR /app
COPY --from=build-env /app/out .
<<<<<<< HEAD
ENTRYPOINT ["dotnet", "aspnetapp.dll"]
=======
ENTRYPOINT ["dotnet", "SampleGitUpload.dll"]
>>>>>>> 2a34432a92ee9527a64bca0302f80b1b66dd13ec
