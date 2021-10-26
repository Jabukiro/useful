const cardDrawer = document.getElementById("card-drawer")
const [backdrop, drawerPaper] = cardDrawer.children;
const openDrawer = () => {
    cardDrawer.style.visibility = "visible";
    backdrop.style.opacity = 0.5;
    drawerPaper.style.width = "500px";
}
const closeDrawer = () => {
    cardDrawer.style.visibility = "hidden";
    backdrop.style.opacity = 0;
    drawerPaper.style.width = 0;
}
backdrop.addEventListener("click", () => {
    closeDrawer();
})
document.getElementById("openBtn").addEventListener("click", () => {
    openDrawer();
})
document.getElementById("closeBtn").addEventListener("click", () => {
    closeDrawer();
})