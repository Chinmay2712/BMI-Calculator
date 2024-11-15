# Use the official Dart image as a base
FROM dart:stable AS build

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Set the working directory
WORKDIR /app

# Copy the pubspec files and resolve dependencies
COPY pubspec.* /app/
RUN flutter pub get

# Copy the rest of the app source code
COPY . .

# Build the Flutter web application
RUN flutter build web

# Use nginx to serve the web app
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80 for nginx
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
