git clone https://github.com/valiantlynx/altlokalt-nextjs.git
echo "Cloned altlokalt-nextjs"
git clone https://github.com/valiantlynx/anime-site.git
echo "Cloned anime-site"
git clone https://github.com/valiantlynx/pocketbase-upload-maga.git
echo "Cloned pocketbase-upload-maga"
git clone https://github.com/valiantlynx/manga-site.git
echo "Cloned manga-site"
git clone https://github.com/valiantlynx/simple-service-worker.git
echo "Cloned simple-service-worker"
git clone https://github.com/valiantlynx/blog-nextjs-sanity.git
echo "Cloned blog-nextjs-sanity"
git clone https://github.com/valiantlynx/minfuel-web.git
echo "Cloned minfuel-web"
git clone https://github.com/valiantlynx/animevariant_com_api.git
echo "Cloned animevariant_com_api"
git clone https://github.com/valiantlynx/next-blog.git
echo "Cloned next-blog"
git clone https://github.com/valiantlynx/pocketbase-docker.git
echo "Cloned altlokalt-nextjs"

# compose
curl -o docker-compose.yml https://raw.githubusercontent.com/valiantlynx/valiantlynx/main/docker-compose.yml
echo "Downloaded docker-compose.yml"

# build and run the prerequisites projects
docker-compose up -d pocketbase-docker
echo "Finished pocketbase-docker"
docker-compose up -d animevariant_com_api
echo "Finished animevariant_com_api"
docker-compose up -d pocketbase-upload-maga
echo "Finished pocketbase-upload-maga"

# build and run the main projects
docker-compose up -d 
echo "Finished altlokalt-nextjs"
sleep 5
echo "all containers are up and running"
