(* 正規化の型  *)
type t =
  | Unit
  | Int of int
  | Float of float
  | Neg of Id.t
  | Add of Id.t * Id.t
  | Sub of Id.t * Id.t
  | Mul of Id.t * Id.t
  | Div of Id.t * Id.t
  | FNeg of Id.t
  | FAdd of Id.t * Id.t
  | FSub of Id.t * Id.t
  | FMul of Id.t * Id.t
  | FDiv of Id.t * Id.t
  | IfEq of Id.t * Id.t * t * t
  | IfLE of Id.t * Id.t * t * t
  | Let of (Id.t * Type.t) * t * t
  | Var of Id.t
  | LetRec of fun_def * t
  | App of Id.t * Id.t list
  | Tuple of Id.t list
  | LetTuple of (Id.t * Type.t) list * Id.t * t
  | Get of Id.t * Id.t
  | Put of Id.t * Id.t * Id.t
  | ExtVar of Id.t * Type.t
  | ExtArray of Id.t
  | ExtFunApp of Id.t * Id.t list
and fun_def = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

(* デバック用 TODO: エラー出力にするかも  *)
let rec log elem =
  match elem with
  | Unit -> print_string "()"
  | Int(e) -> print_int e
  | Float(e) -> print_float e
  | Neg(e) | FNeg(e) -> print_string "-("; Id.log e; print_string ")"
  | Add(e1, e2) | FAdd(e1, e2) -> print_string "("; Id.log e1; print_string " + ";
                                  Id.log e2; print_string ")"
  | Sub(e1, e2) | FSub(e1, e2) -> print_string "("; Id.log e1; print_string " - ";
                                  Id.log e2; print_string ")"
  | Mul(e1, e2) | FMul(e1, e2) -> print_string "("; Id.log e1; print_string " * ";
                                  Id.log e2; print_string ")"
  | Div(e1, e2) | FDiv(e1, e2) -> print_string "("; Id.log e1; print_string " / ";
                                  Id.log e2; print_string ")"
  | IfEq(e1, e2, e3, e4) -> print_string "if "; Id.log e1; print_string " == "; Id.log e2; print_string " then"; print_newline ();
                            log e3; print_newline ();
                            print_string "else"; print_newline ();
                            log e4
  | IfLE(e1, e2, e3, e4) -> print_string "if "; Id.log e1; print_string " <= "; Id.log e2; print_string " then"; print_newline ();
                            log e3; print_newline ();
                            print_string "else"; print_newline ();
                            log e4
  | Let((id, typ), e1, e2) -> print_string "let "; Id.log id; print_string ": "; Type.log typ; print_string " ="; print_newline ();
                              log e1; print_string " in"; print_newline();
                              log e2
  | Var(e) -> Id.log e
  | LetRec({ name = (x, t); args = yts; body = e1 }, e2) ->
      print_string "let rec ("; Id.log x;
      print_string ": "; Type.log t; print_string ") ("; print_args yts; print_string ") ="; print_newline ();
      log e1; print_string " in "; print_newline ();
      log e2
  | App(e1, e2) | ExtFunApp(e1, e2) -> Id.log e1; print_string "("; print_elems e2; print_string ")"
  | Tuple(es) -> print_string "("; print_elems es; print_string ")"
  | LetTuple(args, id, e) -> print_string "let ("; print_args args; print_string ") ="; print_newline ();
                             Id.log id; print_string " in"; print_newline ();
                             log e
  | Get(e1, e2) -> Id.log e1; print_string ".("; Id.log e2; print_string ")"
  | Put(e1, e2, e3) -> Id.log e1; print_string ".("; Id.log e2; print_string ") <- "; Id.log e3
  | ExtVar(id, t) -> Id.log id; print_string ": "; Type.log t
  | ExtArray(e) -> print_string "["; Id.log e; print_string "]"
and print_args args =
  match args with
  | [] -> ()
  | (id, typ) :: [] -> print_string "("; Id.log id; print_string ": "; Type.log typ; print_string ")"
  | (id, typ) :: argr -> print_string "("; Id.log id; print_string ": "; Type.log typ; print_string "), "; print_args argr
and print_elems elems =
  match elems with
  | [] -> ()
  | id :: [] -> Id.log id
  | id :: idr -> Id.log id; print_string ", "; print_elems idr

(* 自由変数の割当 *)
let rec free_var = function
  | Unit | Int(_) | Float(_) | ExtVar(_) | ExtArray(_) -> MiniSet.empty
  | Neg(x) | FNeg(x) -> MiniSet.singleton x
  | Add(x, y) | Sub(x, y) | Mul(x, y) | Div(x, y)
  | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) | Get(x, y) ->
      MiniSet.of_list [x; y]
  | IfEq(x, y, e1, e2) | IfLE(x, y, e1, e2) ->
    MiniSet.add x (MiniSet.add y (MiniSet.union (free_var e1) (free_var e2)))
  | Let((x, t), e1, e2) -> MiniSet.union (free_var e1) (MiniSet.remove x (free_var e2))
  | Var(x) -> MiniSet.singleton x
  | LetRec({ name = (x, t); args = yts; body = e1 }, e2) ->
      let zs = MiniSet.diff (free_var e1) (MiniSet.of_list (List.map fst yts)) in
      MiniSet.diff (MiniSet.union zs (free_var e2)) (MiniSet.singleton x)
  | App(x, ys) -> MiniSet.of_list (x :: ys)
  | Tuple(xs) | ExtFunApp(_, xs) -> MiniSet.of_list xs
  | Put(x, y, z) -> MiniSet.of_list [x; y; z]
  | LetTuple(xs, y, e) -> MiniSet.add y (MiniSet.diff (free_var e) (MiniSet.of_list (List.map fst xs)))

(* letを挿入する補助関数 *)
let insert_let (e, t) k =
  match e with
  | Var(x) -> k x
  | _ ->
      let x = Id.gen_tmp t in
      let e', t' = k x in
      Let((x, t), e, e'), t'

(* k正規化 *)
let rec normalize env = function
  | Syntax.Unit -> Unit, Type.Unit
  | Syntax.Bool(b) -> Int(if b then 1 else 0), Type.Int
  | Syntax.Int(i) -> Int(i), Type.Int
  | Syntax.Float(d) -> Float(d), Type.Float
  | Syntax.Not(e) -> normalize env (Syntax.If(e, Syntax.Bool(false), Syntax.Bool(true)))
  | Syntax.Neg(e) ->
      insert_let (normalize env e)
        (fun x -> Neg(x), Type.Int)
  | Syntax.Add(e1, e2) ->
      insert_let (normalize env e1)
        (fun x -> insert_let (normalize env e2)
            (fun y -> Add(x, y), Type.Int))
  | Syntax.Sub(e1, e2) ->
      insert_let (normalize env e1)
        (fun x -> insert_let (normalize env e2)
            (fun y -> Sub(x, y), Type.Int))
  | Syntax.Mul(e1, e2) ->
      insert_let (normalize env e1)
        (fun x -> insert_let (normalize env e2)
            (fun y -> Mul(x, y), Type.Int))
  | Syntax.Div(e1, e2) ->
      insert_let (normalize env e1)
        (fun x -> insert_let (normalize env e2)
            (fun y -> Div(x, y), Type.Int))
  | Syntax.FNeg(e) ->
    insert_let (normalize env e)
      (fun x -> FNeg(x), Type.Float)
  | Syntax.FAdd(e1, e2) ->
      insert_let (normalize env e1)
        (fun x -> insert_let (normalize env e2)
            (fun y -> FAdd(x, y), Type.Float))
  | Syntax.FSub(e1, e2) ->
      insert_let (normalize env e1)
        (fun x -> insert_let (normalize env e2)
            (fun y -> FSub(x, y), Type.Float))
  | Syntax.FMul(e1, e2) ->
      insert_let (normalize env e1)
        (fun x -> insert_let (normalize env e2)
            (fun y -> FMul(x, y), Type.Float))
  | Syntax.FDiv(e1, e2) ->
      insert_let (normalize env e1)
        (fun x -> insert_let (normalize env e2)
            (fun y -> FDiv(x, y), Type.Float))
  | Syntax.Eq _ | Syntax.LE _ as cmp ->
      normalize env (Syntax.If(cmp, Syntax.Bool(true), Syntax.Bool(false)))
  | Syntax.If(Syntax.Not(e1), e2, e3) -> normalize env (Syntax.If(e1, e3, e2))
  | Syntax.If(Syntax.Eq(e1, e2), e3, e4) ->
      insert_let (normalize env e1)
        (fun x -> insert_let (normalize env e2)
            (fun y ->
               let e3', t3 = normalize env e3 in
               let e4', t4 = normalize env e4 in
               IfEq(x, y, e3', e4'), t3))
  | Syntax.If(Syntax.LE(e1, e2), e3, e4) ->
      insert_let (normalize env e1)
        (fun x -> insert_let (normalize env e2)
            (fun y ->
               let e3', t3 = normalize env e3 in
               let e4', t4 = normalize env e4 in
               IfLE(x, y, e3', e4'), t3))
  | Syntax.If(e1, e2, e3) -> normalize env (Syntax.If(Syntax.Eq(e1, Syntax.Bool(false)), e3, e2))
  | Syntax.Let((x, t), e1, e2) ->
      let e1', t1 = normalize env e1 in
      let e2', t2 = normalize (MiniMap.add x t env) e2 in
      Let((x, t), e1', e2'), t2
  | Syntax.Var(x) when MiniMap.mem x env -> Var(x), MiniMap.find x env
  | Syntax.Var(x) ->
      (match MiniMap.find x !Typing.ext_env with
        | Type.Array(_) as t -> ExtArray x, t
        | t -> ExtVar(x, t), t)
  | Syntax.LetRec({ Syntax.name = (x, t); Syntax.args = yts; Syntax.body = e1 }, e2) ->
      let env' = MiniMap.add x t env in
      let e2', t2 = normalize env' e2 in
      let e1', t1 = normalize (MiniMap.add_list yts env') e1 in
      LetRec({ name = (x, t); args = yts; body = e1' }, e2'), t2
  | Syntax.App(Syntax.Var(f), e2s) when not (MiniMap.mem f env) ->
      (match MiniMap.find f !Typing.ext_env with
      | Type.Fun(_, t) ->
          let rec bind xs = function
            | [] -> ExtFunApp(f, xs), t
            | e2 :: e2s ->
                insert_let (normalize env e2)
                  (fun x -> bind (xs @ [x]) e2s) in
          bind [] e2s
      | _ -> assert false)
  | Syntax.App(e1, e2s) ->
    (match normalize env e1 with
     | _, Type.Fun(_, t) as g_e1 ->
       insert_let g_e1
         (fun f ->
            let rec bind xs = function
              | [] -> App(f, xs), t
              | e2 :: e2s ->
                insert_let (normalize env e2)
                  (fun x -> bind (xs @ [x]) e2s) in
            bind [] e2s)
     | _ -> assert false)
  | Syntax.Tuple(es) ->
      let rec bind xs ts = function
        | [] -> Tuple(xs), Type.Tuple(ts)
        | e :: es ->
            let _, t as g_e = normalize env e in
            insert_let g_e
              (fun x -> bind (xs @ [x]) (ts @ [t]) es) in
      bind [] [] es
  | Syntax.LetTuple(xts, e1, e2) ->
      insert_let (normalize env e1)
        (fun y ->
           let e2', t2 = normalize (MiniMap.add_list xts env) e2 in
           LetTuple(xts, y, e2'), t2)
  | Syntax.Array(e1, e2) ->
      insert_let (normalize env e1)
        (fun x ->
           let _, t2 as g_e2 = normalize env e2 in
           insert_let g_e2
             (fun y ->
                let l =
                  match t2 with
                  | Type.Float -> "create_float_array"
                  | _ -> "create_array" in
                ExtFunApp(l, [x; y]), Type.Array(t2)))
  | Syntax.Get(e1, e2) ->
      (match normalize env e1 with
      | _, Type.Array(t) as g_e1 ->
          insert_let g_e1
            (fun x -> insert_let (normalize env e2)
                (fun y -> Get(x, y), t))
      | _ -> assert false)
  | Syntax.Put(e1, e2, e3) ->
      insert_let (normalize env e1)
        (fun x -> insert_let (normalize env e2)
            (fun y -> insert_let (normalize env e3)
                (fun z -> Put(x, y, z), Type.Unit)))

let main e = fst (normalize MiniMap.empty e)
