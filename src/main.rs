use warp::Filter;

#[tokio::main]
async fn main() {
    let static_files = warp::get().and(warp::fs::dir("/static"));
    let main = warp::get()
        .and(warp::path::end())
        .and(warp::fs::file("/static/index.html"));
    let routes = main.or(static_files);
    println!("Serving static files on port 3000");
    warp::serve(routes).run(([0, 0, 0, 0], 3000)).await;
}
