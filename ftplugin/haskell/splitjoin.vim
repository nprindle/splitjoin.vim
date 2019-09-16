if !exists('b:splitjoin_split_callbacks')
    let b:splitjoin_split_callbacks = [
                \ 'sj#haskell#SplitApplicative',
                \ 'sj#haskell#SplitList',
                \ 'sj#haskell#SplitTypeSignature',
                \ ]
endif

if !exists('b:splitjoin_join_callbacks')
    let b:splitjoin_join_callbacks = [
                \ 'sj#haskell#JoinApplicative',
                \ 'sj#haskell#JoinList',
                \ 'sj#haskell#JoinTypeSignature',
                \ ]
endif
