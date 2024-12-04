local go_status, go = pcall(require, "go")
if not go_status then
    print("go did not load")
    return
end

go.setup({
    build_tags = "testutils"
})
