local storage = minetest.get_mod_storage()

minetest.register_chatcommand("set_status", {
    description = "Set your public in-game status",

    privs = {
        shout = true;
    },

    func = function(name, status)
        storage:set_string("player_status_" .. name, status)
        minetest.chat_send_all(name .. " is " .. status)

        return true
    end
})

minetest.register_chatcommand("get_status", {
    description = "Get a players' in-game status",

    privs = {
        interact = true;
    },

    func = function(invoker, name)
        minetest.chat_send_player(invoker, name .. " is " .. storage:get_string("player_status_" .. name))

        return true
    end
})