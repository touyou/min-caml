open Syntax

let rec main e = function
  | Let(xt, e1, e2) ->
    (match e1 with
    | LetDef((x, t), e1') -> Let((x, t), e1', main e e2)
    | LetRecDef(fundef) -> LetRec(fundef, main e e2)
    | _ -> failwith "library must be definisions.")
  | LetDef((x, t), e1') -> Let((x, t), e1', e)
  | LetRecDef(fundef) -> LetRec(fundef, e)
  | _ -> failwith "library must be definisions."