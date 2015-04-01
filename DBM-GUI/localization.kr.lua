if GetLocale() ~= "koKR" then return end

if not DBM_GUI_Translations then DBM_GUI_Translations = {} end
local L = DBM_GUI_Translations

L.MainFrame = "죽이는 보스 모드"

L.TranslationByPrefix		= "제작지원 및 번역: "
L.TranslationBy 			= "법사세린(everfinale@gmail.com)"
L.Website					= "문의/건의사항은 DBM 사용자 포럼을 이용하세요. |cFF73C2FB주소는 여기를 클릭|r (와우 인벤 제공)"
L.WebsiteButton				= "사용자 포럼"

L.OTabBosses	= "우두머리"
--L.OTabOptions	= GAMEOPTIONS_MENU

L.TabCategory_Options		= "전역 설정"
L.TabCategory_PVP	 		= "PvP"
L.TabCategory_OTHER			= "기타 우두머리 경보"

L.BossModLoaded 			= "%s 통계"
L.BossModLoad_now 			= [[이 우두머리 경보는 현재 비활성화 상태입니다. 
불러오기 버튼을 클릭하여 우두머리 경보를 불러올 수 있습니다.
]]

L.PosX						= '위치 X'
L.PosY						= '위치 Y'

L.MoveMe 					= '위치 이동'
L.Button_OK					= '확인'
L.Button_Cancel				= '취소'
L.Button_LoadMod			= '불러오기'
L.Mod_Enabled				= "경보 사용"
L.Mod_Reset					= "이 전투의 설정 초기화"
L.Reset						= "초기화"

L.Enable					= "활성화"
L.Disable					= "비활성화"

L.NoSound					= "끄기"

L.IconsInUse				= "사용되는 전술 목표 아이콘:"

-- Tab: Boss Statistics
L.BossStatistics			= "통계"
L.Statistic_Kills			= "승리:"
L.Statistic_Wipes			= "전멸:"
L.Statistic_Incompletes		= "미완료:"
L.Statistic_BestKill		= "최고 기록:"

-- Tab: General Core Options
L.General 					= "기본 DBM 설정"
L.EnableDBM 				= "DBM 사용"
L.EnableMiniMapIcon			= "미니맵 버튼 사용"
L.UseSoundChannel			= "DBM 소리 출력 채널 선택"
L.UseMasterChannel			= "주 음량"
L.UseDialogChannel			= "대화"
L.UseSFXChannel				= "효과음"
L.Latency_Text				= "동기화 신호를 보낼 최대 지연시간 설정: %d"
-- Tab: General Timer Options
L.TimerGeneral 				= "DBM 바 설정"
L.SKT_Enabled				= "우두머리별 설정을 무시하고 최고 기록 바 항상 보기"
L.CRT_Enabled				= "다음 전투 부활 충전 바 보기"
L.ChallengeTimerOptions		= "도전 모드 최고 기록 바 설정"
L.ChallengeTimerPersonal	= "개인 기록으로 보기"
L.ChallengeTimerGuild		= "길드 기록으로 보기"
L.ChallengeTimerRealm		= "서버 기록으로 보기"

L.ModelOptions				= "3D 초상화 배경 설정"
L.EnableModels				= "각 우두머리 설정에 3D 초상화 배경 사용"
L.ModelSoundOptions			= "각 우두머리 설정을 볼 때 출력될 음성 선택"
L.ModelSoundShort			= "짧은 음성"
L.ModelSoundLong			= "긴 음성"

L.Button_RangeFrame			= "거리 창 보기"
L.Button_InfoFrame			= "정보 창 보기"
L.Button_TestBars			= "시험 경보 시작"

-- Tab: Raidwarning
L.Tab_RaidWarning 			= "알림"
L.RaidWarning_Header		= "알림 설정"
L.RaidWarnColors 			= "알림 색상"
L.RaidWarnColor_1 			= "색상 1"
L.RaidWarnColor_2 			= "색상 2"
L.RaidWarnColor_3 			= "색상 3"
L.RaidWarnColor_4 			= "색상 4"
L.InfoRaidWarning			= [[알림 창 위치와 알림 색상을 수정할 수 있습니다.
DBM은 별도 알림 창에 알림을 표시합니다.]]
L.ColorResetted 			= "현재 색상 설정을 초기화 합니다."
L.ShowWarningsInChat 		= "알림을 대화창에서도 보기"
L.ShowFakedRaidWarnings 	= "대화창 알림 메세지를 공격대 경보처럼 보기"
L.WarningIconLeft 			= "알림 왼쪽에 주문 아이콘 보기"
L.WarningIconRight 			= "알림 오른쪽에 주문 아이콘 보기"
L.WarningIconChat 			= "대화창 알림 메세지에 주문 아이콘 보기"
L.Warn_FontType				= "글꼴"
L.Warn_FontStyle			= "글꼴 속성"
L.Warn_FontShadow			= "그림자"
L.Warn_FontSize				= "글꼴 크기: %d"
L.Warn_Duration				= "알림 지속시간: %d초"
L.None						= "없음"
L.Outline					= "외곽선"
L.ThickOutline				= "굵은 외곽선"
L.MonochromeOutline			= "예리한 외곽선"
L.MonochromeThickOutline	= "예리한 굵은 외곽선"
L.RaidWarnSound				= "알림 소리"

-- Tab: Generalwarnings
L.Tab_GeneralMessages 		= "대화창"
L.CoreMessages				= "일반 메세지 설정"
L.ShowLoadMessage 			= "대화창에 경보 불러오기 메세지 보이기"
L.ShowPizzaMessage 			= "다른 사용자가 DBM 바를 보낸 경우 메세지 보이기"
L.ShowCombatLogMessage 		= "DBM이 전투 기록을 시작/중지할 경우 메세지 보이기"
L.ShowTranscriptorMessage	= "DBM이 Transcriptor 기록을 시작/중지할 경우 메세지 보이기"
L.ShowAllVersions	 		= "공격대 경보 애드온 버전 확인시 버전 정보를 모두 보이기"
L.CombatMessages			= "전투 관련 메세지 설정"
L.ShowEngageMessage 		= "대화창에 우두머리 전투 시작 메세지 보이기"
L.ShowKillMessage 			= "대화창에 우두머리 처치 메세지 보이기"
L.ShowWipeMessage 			= "대화창에 우두머리 전멸 메세지 보이기"
L.ShowGuildMessages 		= "대화창에 길드 우두머리 전투 진행상황 메세지 보이기"
L.ShowRecoveryMessage 		= "대화창에 바 복구 메세지 보이기"
L.WhisperMessages			= "귓속말 설정"
L.AutoRespond 				= "우두머리 전투 중 귓속말을 받은 경우 자동 응답 메세지 보내기"
L.EnableStatus 				= "'status' 라는 귓속말을 받은 경우 자동 응답 메세지 보내기"
L.WhisperStats 				= "귓속말 자동 응답시 처치/전멸 횟수 포함하기"

-- Tab: Barsetup
L.BarSetup  				= "바"
L.BarTexture 				= "바 무늬"
L.BarStyle 					= "바 작동 방식"
L.BarDBM					= "DBM"
L.BarBigWigs				= "BigWigs(애니메이션 없음)"
L.BarStartColor	 			= "시작 색상"
L.BarEndColor 				= "마지막 색상"
L.Bar_Font					= "바 글꼴"
L.Bar_FontSize				= "글꼴 크기: %d"
L.Bar_Height				= "바 높이: %d"
L.Slider_BarOffSetX 		= "바 정렬: %d"
L.Slider_BarOffSetY 		= "바 간격: %d"
L.Slider_BarWidth 			= "바 너비: %d"
L.Slider_BarScale 			= "바 크기: %0.2f"
L.AreaTitle_BarSetup 		= "바 설정"
L.AreaTitle_BarSetupSmall 	= "기본 바 설정"
L.AreaTitle_BarSetupHuge 	= "커다란 바 설정"
L.EnableHugeBar 			= "커다란 바 사용"
L.BarIconLeft 				= "왼쪽 아이콘"
L.BarIconRight 				= "오른쪽 아이콘"
L.ExpandUpwards				= "바를 위로 쌓기"
L.FillUpBars				= "바를 채워나가기"
L.ClickThrough				= "바 클릭(대화창알림, 우클릭취소) 불가"
L.Bar_Decimal				= "남은시간 %d초 이하 바 소수점"
L.Bar_DBMOnly				= "아래 설정은 바 작동 방식이 \"DBM\"으로 되어 있을 때만 적용됩니다."
L.Bar_EnlargeTime			= "남은시간 %d초 미만 바 확대"
L.Bar_EnlargePercent		= "남은시간 비율 %0.1f%% 미만 바 확대"
L.BarSpark					= "바 끝 강조"
L.BarFlash					= "만료되기 직전의 바를 깜빡이기"
L.BarSort					= "남은 시간을 기준으로 정렬"

-- Tab: Spec Warn Frame
L.Panel_SpecWarnFrame		= "특수 경고"
L.Area_SpecWarn				= "특수 경고 설정"
L.SpecWarn_Enabled			= "특수 경고 사용"
L.SpecWarn_ClassColor		= "특수 경고에 직업 색상 사용"
L.ShowSWarningsInChat 		= "특수 경고를 대화창에서도 보기"
L.SpecWarn_FlashFrame		= "특수 경고 화면 반짝임 효과 사용"
L.SpecWarn_FlashFrameRepeat	= "반짝임 %d회 추가"
L.SpecWarn_Font				= "특수 경고에 사용되는 글꼴"
L.SpecWarn_FontSize			= "글꼴 크기: %d"
L.SpecWarn_FontColor		= "글꼴 색상"
L.SpecWarn_FontType			= "글꼴 선택"
L.SpecWarn_FlashRepeat		= "반짝임 추가"
L.SpecWarn_FlashColor		= "반짝임 색상 %d"
L.SpecWarn_FlashDur			= "반짝임 지속시간: %0.1f"
L.SpecWarn_FlashAlpha		= "반짝임 투명도: %0.1f"
L.Area_SpecWarnFont			= "특수 경고 글꼴 설정"
L.SpecWarn_DemoButton		= "예제 보기"
L.SpecWarn_MoveMe			= "위치 설정"
L.SpecWarn_ResetMe			= "초기화"
L.SpecialWarnSound			= "특수 경고 소리 1 (SW1, 속성: 당신 또는 특정 역할에게 영향)"
L.SpecialWarnSound2			= "특수 경고 소리 2 (SW2, 속성: 공격대 다수 영향)"
L.SpecialWarnSound3			= "특수 경고 소리 3 (SW3, 속성: 치명적인 피해를 입힘)"
L.SpecialWarnSound4			= "특수 경고 소리 4 (SW4, 속성: 도망쳐야 함)"

-- Tab: Spoken Alerts Frame
L.Panel_SpokenAlerts		= "음성안내"
L.Area_VoiceSelection		= "음성선택"
L.CountdownVoice			= "초세기 1 소리 설정"
L.CountdownVoice2			= "초세기 2 소리 설정"
L.CountdownVoice3			= "초세기 3 소리 설정"
L.VoicePackChoice			= "음성안내 소리 설정(설치되어 있을 경우)"
L.Area_CountdownOptions		= "초세기 설정"
L.ShowCountdownText			= "초세기 1이 진행 중일때 화면중앙에 글자 표시"
L.Area_VoicePackOptions		= "음성안내 설정(별도 음성안내 애드온이 필요함)"
L.SpecWarn_NoSoundsWVoice	= "음성안내가 있는 특수 경고 소리 끄기 설정"
L.SWFNever					= "모두 재생"
L.SWFDefaultOnly			= "별도로 변경한 소리만 재생(SW소리는 무시)"
L.SWFAll					= "모든 특수 경고 소리 끄기"
L.SpecWarn_AlwaysVoice		= "음성안내를 무조건 듣기(각 우두머리별 설정 무시, 공격대장에게 유용합니다.)"
--TODO, maybe add URLS right to GUI panel on where to acquire 3rd party voice packs?

-- Tab: HealthFrame
L.Panel_HPFrame				= "우두머리 체력 바"
L.Area_HPFrame				= "우두머리 체력 바 설정"
L.HP_Enabled				= "우두머리별 설정을 무시하고 항상 우두머리 체력 바 보기"
L.HP_GrowUpwards			= "우두머리 체력 바를 위로 쌓기"
L.HP_ShowDemo				= "체력 바 보기"
L.BarWidth					= "바 길이: %d"

-- Tab: Global Filter
L.Panel_SpamFilter			= "DBM 기능 끄기"
L.Area_SpamFilter_Outgoing	= "기능 끄기 설정(다른 설정보다 항상 우선됨)"
L.SpamBlockNoShowAnnounce	= "알림 보이지 않기"
L.DontShowFarWarnings		= "멀리 떨어진 곳에서 시전된 주문 알림 및 바를 보이지 않기"
L.SpamBlockNoSendWhisper	= "다른 공격대원 또는 파티원에게 우두머리 주문 귓속말 알림을 보내지 않기"
L.SpamBlockNoSetIcon		= "전술 목표 아이콘 설정하지 않기"
L.SpamBlockNoRangeFrame		= "거리 창 보이지 않기"
L.SpamBlockNoInfoFrame		= "정보 창 보이지 않기"
L.SpamBlockNoHudMap			= "범위 정보 보이지 않기"
L.SpamBlockNoHealthFrame	= "우두머리 체력 바 보이지 않기"
L.SpamBlockNoCountdowns		= "초세기 소리 재생 안함"
L.SpamBlockNoIconRestore	= "전투 종료시 전술 목표 아이콘 설정 복구 안함"
L.SpamBlockNoRangeRestore	= "전투 종료시 거리창 설정 복구 안함"

-- Tab: Spam Filter
L.Area_SpamFilter			= "정보 숨기기"
L.StripServerName			= "알림 및 바에서 서버명 보이지 않기"
L.SpamBlockBossWhispers		= "전투 중 다른 공격대원 또는 파티원이 보낸 &lt;DBM&gt; 귓속말 감추기"
L.BlockVersionUpdateNotice	= "업데이트 팝업 창 끄기(대신 대화창으로 더 잦은 업데이트 알림이 표시됨)"

L.Area_SpecFilter			= "역할 경고 숨기기"
L.FilterTankSpec			= "방어 전담이 아닐 경우 방어 전담용 경고 보지 않기(참고: 도발 경고는 대부분 기본값으로 켜짐 상태이기 때문에 이 설정을 끄지 않는 것을 권장합니다.)"
L.FilterInterrupts			= "자신의 대상이나 주시 대상이 아닌 대상의 차단 경고 보지 않기(참고: 차단 실패시 공격대 전체에 치명적인 영향을 주는 주문에는 적용되지 않습니다.)"
L.FilterDispels				= "해제 주문이 재사용 대기시간 중일 경우 해제 경고 보지 않기"
L.FilterSelfHud				= "자기 자신의 범위 정보를 보이지 않기(거리 비례 범위 정보는 제외)"

L.Area_PullTimer			= "특수 바(전투 예정/시작, 휴식, 사용자 바) 기능 끄기"
L.DontShowPTNoID			= "같은 인스턴스에 있지 않은 사용자가 보낸 전투 예정 바 차단"
L.DontShowPT				= "특수 바 숨기기"
L.DontShowPTText			= "특수 바 관련 알림 숨기기"
L.DontPlayPTCountdown		= "특수 바 초세기 소리 끄기"
L.DontShowPTCountdownText	= "특수 바 초세기 글자 끄기"
L.PT_Threshold				= "특수 바 초세기를 몇 초부터 보여줄 것인지 설정: %d"

L.Panel_HideBlizzard		= "블리자드 기능 끄기"
L.Area_HideBlizzard			= "블리자드 기능 끄기 설정"
L.HideBossEmoteFrame		= "전투 중 블리자드 기본 레이드 경보 끄기"
L.HideWatchFrame			= "추적중인 업적이 없을 경우 전투 중 퀘스트 추적 창 숨기기(도전 모드에서는 메달 바가 표시됩니다.)"
L.HideGarrisonUpdates		= "전투 중 주둔지 알림창(임무, 건물 완료 등) 숨기기"
L.HideGuildChallengeUpdates	= "전투 중 길드 도전 과제 알림창 숨기기"
L.HideTooltips				= "전투 중 게임 툴팁 끄기"
L.DisableSFX				= "전투 중 효과음 끄기"
L.HideApplicantAlerts		= "파티 구성하기 알림 끄기"
L.HideApplicantAlertsFull	= "파티원이 가득 찼을 경우"
L.HideApplicantAlertsNotL	= "파티장이 아닌 경우 (또는 파티원이 가득 차고 파티장인 경우)"
L.SpamBlockSayYell			= "전투 중 대화 말풍선 숨기기"
L.DisableCinematics			= "게임 내 동영상 끄기"
L.AfterFirst				= "1회 이상 본 동영상"
L.Always					= "모든 동영상"

L.Panel_ExtraFeatures		= "기타 기능"
L.Area_ChatAlerts			= "문자 알림 설정"
L.RoleSpecAlert				= "공격대 참여시 전문화와 설정된 전리품 전문화가 맞지 않을시 대화창에 알림 보기"
L.CheckGear					= "전투 시작시 착용 장비 경고 보기(착용 아이템 레벨이 가방 아이템 레벨보다 40 이상 낮거나 주 장비가 장착되어 있지 않은 경우)"
L.WorldBossAlert			= "현재 서버에서 친구 또는 길드원에 의해 야외 우두머리 전투가 시작 된 경우 메세지 보이기(서버 공용지역에서 보낸 경우 부정확할 수 있습니다)"
L.Area_SoundAlerts			= "소리 알림 설정"
L.LFDEnhance				= "전장/공격대 찾기 입장, 역할 확인 소리를 주 음량 또는 대화 음량에 맞추어 듣기(환경 소리가 꺼져 있을 때도 작동하며, 일반적으로 다른 소리보다 더 크게 들립니다)"
L.WorldBossNearAlert		= "근처에서 야외 우두머리 전투가 시작된 경우 전투 준비 소리 듣기(우두머리별 설정 무시)"
L.RLReadyCheckSound			= "전투 준비 소리를 주 음량 또는 대화 음량에 맞추어 듣기"
L.AFKHealthWarning			= "자리 비움 상태 도중 체력이 줄면 경고음 듣기"
L.Area_AutoLogging			= "자동 전투 기록 설정"
L.AutologBosses				= "우두머리 전투시 블리자드 전투 기록 자동 활성화(전투 시작전 주요 정보를 기록하려면, /dbm pull 명령어를 사용하세요)"
L.AdvancedAutologBosses		= "우두머리 전투시 Transcriptor 기록 자동 활성화"
L.LogOnlyRaidBosses			= "공격대 우두머리 전투만 기록하기(공격대 찾기 제외)"
L.Area_3rdParty				= "외부 애드온 연동 기능"
L.ShowBBOnCombatStart		= "전투 시작시 BigBrother 버프 체크 실행하기"
L.BigBrotherAnnounceToRaid	= "BigBrother 버프 체크 결과를 공격대에 알리기"
L.Area_Invite				= "파티 초대 설정"
L.AutoAcceptFriendInvite	= "친구가 보낸 파티 초대 자동 수락"
L.AutoAcceptGuildInvite		= "길드원이 보낸 파티 초대 자동 수락"
L.Area_Advanced				= "고급 설정"
L.FakeBW					= "DBM 대신 BigWigs 사용자로 위장하기(BigWigs 사용을 강제하는 공격대에서 유용합니다.)"

L.PizzaTimer_Headline 		= '사용자 지정 바 만들기'
L.PizzaTimer_Title			= '이름(예: "Pizza!")'
L.PizzaTimer_Hours 			= "시"
L.PizzaTimer_Mins 			= "분"
L.PizzaTimer_Secs 			= "초"
L.PizzaTimer_ButtonStart 	= "바 시작"
L.PizzaTimer_BroadCast		= "공격대에 알리기"

L.Panel_Profile				= "프로필"
L.Area_CreateProfile		= "프로필 생성"
L.EnterProfileName			= "생성할 프로필 이름 입력"
L.CreateProfile				= "DBM-Core 설정 프로필 생성"
L.Area_ApplyProfile			= "프로필 적용"
L.SelectProfileToApply		= "적용할 DBM-Core 설정 프로필 선택"
L.Area_CopyProfile			= "프로필 복사"
L.SelectProfileToCopy		= "복사할 DBM-Core 설정 프로필 선택"
L.Area_DeleteProfile		= "프로필 삭제"
L.SelectProfileToDelete		= "삭제할 DBM-Core 설정 프로필 선택"
L.Area_DualProfile			= "우두머리 경보 프로필 설정"
L.DualProfile				= "각 전문화 별로 별도의 우두머리 설정 사용(전문화별 세부기능은 좌측 상단 우두머리 탭을 선택 후, 경보를 불러오고 나서 나타난 통계 화면에 있습니다.)"

L.Area_ModProfile			= "다른 캐릭터 또는 그 캐릭터의 전문화별 설정을 복사/삭제"
L.ModAllReset				= "이 경보의 모든 설정을 초기화"
L.ModAllStatReset			= "이 경보의 통계를 초기화"
L.SelectModProfileCopy		= "전체 설정 복사"
L.SelectModProfileCopySound	= "소리 설정 복사"
L.SelectModProfileDelete	= "설정 삭제"

-- Misc
L.FontHeight = 16
