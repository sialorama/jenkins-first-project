# Utiliser l'image de base OpenJDK 11
#FROM openjdk:11-jre-slim
FROM bellsoft/liberica-runtime-container:jre-21-slim-musl

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier JAR de l'application
COPY target/jenkins-first-project-0.0.1-SNAPSHOT.jar app.jar

# Exposer le port sur lequel l'application s'exécute (ajustez si nécessaire)
EXPOSE 8080

# Commande pour exécuter l'application
ENTRYPOINT ["java", "-jar", "app.jar"]
