---@class DB_DATA_MODULE
---@field db_entries DBEntry[]

---@class DB_ENTRY_FOR_DBEE
---@field name string
---@field type "postgres" | "sql"
---@field url string

---@class DBEntry
---@field name string
---@field type "postgres" | "sql"
---@field user string
---@field password string
---@field host string
---@field port number
---@field db_name string
---@field flags table<string, string | boolean>?

---@type DB_DATA_MODULE
local db_data = require("custom.db-credentials")

local dbee_sources = require("dbee.sources")

---Format the db entry to the `require("dbee.sources").MemorySource:new()`
---@param db_entry DBEntry
---@return DB_ENTRY_FOR_DBEE
local function format_db_entry(db_entry)
	local out = {
		name = db_entry.name,
		type = db_entry.type
	}
	local url = "postgresql://"
		.. db_entry.user
		.. ":"
		.. db_entry.password
		.. "@"
		.. db_entry.host
		.. ":"
		.. db_entry.port
		.. "/"
		.. db_entry.db_name

	---@type string[]
	local all_url_params = {}
	for param, value in pairs(db_entry.flags or {}) do
		local param_str = ""
		if type(value) == "boolean" then
			param_str = param
		else
			param_str = param .. "=" .. value
		end

		table.insert(all_url_params, param_str)
	end
	if db_entry.flags ~= nil then
		url = url .. "?" .. table.concat(all_url_params, "&")
	end

	out.url = url

	return out
end

---@type DB_ENTRY_FOR_DBEE[]
local ready_to_setup_db_entries = {}

for _, db_entry in ipairs(db_data.db_entries) do
	table.insert(ready_to_setup_db_entries, format_db_entry(db_entry))
end

require("dbee").setup {
	sources = {
		dbee_sources.MemorySource:new(ready_to_setup_db_entries),
	},
}
