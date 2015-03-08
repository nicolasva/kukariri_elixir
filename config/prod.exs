use Mix.Config

config :kukariri, Kukariri.Endpoint,
  url: [host: "example.com"],
  http: [port: System.get_env("PORT")],
  secret_key_base: "HnCEtLCJnUDRbWFxeU2dl7svuD82WVtCDAZD9JQaX9UPPxyg7AfkpMo367s4Rfvz"
  
config :phoenix, Kukariri.Router,
  session: [store: :session,
            key: "D&QUM&0=)&1O#PP!Z%T_*D(Z16)Z!#R!Q71L5XEYP1FJV$(IOU@NTJ+W+)2W(IIB@HBWTF%DR4("]

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section:
#
#  config:kukariri, Kukariri.Endpoint,
#    ...
#    https: [port: 443,
#            keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#            certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables point to a file on
# disk for the key and cert.
  

# Do not pring debug messages in production
config :logger, level: :info

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :kukariri, Kukariri.Endpoint, server: true
#
