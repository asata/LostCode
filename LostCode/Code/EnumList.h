// 화면 출력 
// PrintLogin, PrintJoin, PrintMain, PrintTraining, PrintExploration, PrintWar, PrintState, PrintKitList
enum PrintLayer {
    PrintLogin,
    PrintMain,
    PrintTraining,
    PrintMemoryGame,
    PrintState
};

// 스탯 훈련
enum StateTraining {
    ST_POWER,           // 힘
    ST2_QUICKNESS,      // 민첩
    ST3_INTELLIGENT,    // 지력
    ST4_STRENGTH        // 체력
};