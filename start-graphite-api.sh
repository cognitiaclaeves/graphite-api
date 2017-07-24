sudo docker run -it --rm --name graphite --link carbon:carbon --volumes-from carbon -p 8000:8000 brutasse-graphite-api:2-dbg
