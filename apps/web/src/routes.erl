-module (routes).
-author('Maxim Sokhatsky').
-behaviour (route_handler).
-include_lib("n2o/include/wf.hrl").
-export([init/2, finish/2]).

finish(State, Ctx) -> {ok, State, Ctx}.
init(State, Ctx) -> 
    Path = wf:path(Ctx#context.req),
%    error_logger:info_msg("Routes path: ~p", [Path]),
    {Module, PathInfo} = route(Path),
    {ok, State, Ctx#context{path=PathInfo,module=Module}}.

route(<<"/">>) -> {index, []};
route(<<"/index">>) -> {index, []};
route(<<"/feed">>) -> {feed, []};
route(<<"/product">>) -> {product, []};
route(<<"/products">>) -> {products, []};
route(<<"/login">>) -> {login, []};
route(<<"/chat">>) -> {chat, []};
route(<<"/store">>) -> {store, []};
route(<<"/store2">>) -> {store2, []};
route(<<"/reviews">>) -> {reviews, []};
route(<<"/notifications">>) -> {notifications, []};
route(<<"/account">>) -> {account, []};
route(<<"/ws/">>) -> {index, []};
route(<<"/ws/index">>) -> {index, []};
route(<<"/ws/feed">>) -> {feed, []};
route(<<"/ws/product">>) -> {product, []};
route(<<"/ws/products">>) -> {products, []};
route(<<"/ws/login">>) -> {login, []};
route(<<"/ws/chat">>) -> {chat, []};
route(<<"/ws/store">>) -> {store, []};
route(<<"/ws/store2">>) -> {store2, []};
route(<<"/ws/reviews">>) -> {reviews, []};
route(<<"/ws/notifications">>) -> {notifications, []};
route(<<"/ws/account">>) -> {account, []};
route(<<"/favicon.ico">>) -> {static_file, []};
route(_) -> {index, []}.

