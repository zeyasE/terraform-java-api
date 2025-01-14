# terraform-java-api
practice

./gradlew bootRun
./gradlew build
java -jar ./build/libs/java-api-0.0.1-SNAPSHOT.jar
./gradlew clean build\n
docker build -t java-api .
docker images
docker run -d -p 8080:8080 java-api
curl http://localhost:8080
curl -X POST http://localhost:8080/greet -d "John" -H "Content-Type: application/json"

terraform init
terraform providers
terraform apply
terraform destroy
terraform state list
