{ pkgs, config, ... }:
{
    xdg.configFile."vesktop/themes/midnight.css".text = ''
@import url('https://fonts.googleapis.com/css2?family=Figtree:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

/* customize things here */
:root {
	/* font, change to 'gg sans' for default discord font*/
	--font: 'figtree';

	/* top left corner text */
	--corner-text: 'Midnight';

	/* color of status indicators and window controls */
	--online-indicator: var(--accent-2); /* change to #23a55a for default green */
	--dnd-indicator: hsl(340, 60%, 60%); /* change to #f13f43 for default red */
	--idle-indicator: hsl(50, 60%, 60%); /* change to #f0b232 for default yellow */
	--streaming-indicator: hsl(260, 60%, 60%); /* change to #593695 for default purple */

	/* accent colors */
	--accent-1: hsl(190, 70%, 60%); /* links */
	--accent-2: hsl(190, 70%, 48%); /* general unread/mention elements */
	--accent-3: hsl(190, 70%, 42%); /* accent buttons */
	--accent-4: hsl(190, 70%, 36%); /* accent buttons when hovered */
	--accent-5: hsl(190, 70%, 30%); /* accent buttons when clicked */
	--mention: hsla(190, 80%, 52%, 0.1); /* mentions & mention messages */
	--mention-hover: hsla(190, 80%, 52%, 0.05); /* mentions & mention messages when hovered */

	/* text colors */
	--text-0: white; /* text on colored elements */
	--text-1: var(--text-2); /* other normally white text */
	--text-2: hsl(220, 25%, 70%); /* headings and important text */
	--text-3: hsl(220, 15%, 60%); /* normal text */
	--text-4: hsl(220, 15%, 40%); /* icon buttons and channels */
	--text-5: hsl(220, 15%, 25%); /* muted channels/chats and timestamps */

	/* background and dark colors */
	--bg-1: hsl(220, 15%, 20%); /* dark buttons when clicked */
	--bg-2: hsl(220, 15%, 16%); /* dark buttons */
	--bg-3: hsl(220, 15%, 13%); /* spacing, secondary elements */
	--bg-4: hsl(220, 15%, 10%); /* main background color */
	--hover: hsla(230, 20%, 40%, 0.1); /* channels and buttons when hovered */
	--active: hsla(220, 20%, 40%, 0.2); /* channels and buttons when clicked or selected */
	--message-hover: hsla(220, 0%, 0%, 0.1); /* messages when hovered */

	/* amount of spacing and padding */
	--spacing: 12px;

	/* animations */
	/* ALL ANIMATIONS CAN BE DISABLED WITH REDUCED MOTION IN DISCORD SETTINGS */
	--list-item-transition: 0.2s ease; /* channels/members/settings hover transition */
	--unread-bar-transition: 0.2s ease; /* unread bar moving into view transition */
	--moon-spin-transition: 0.4s ease; /* moon icon spin */
	--icon-spin-transition: 1s ease; /* round icon button spin (settings, emoji, etc.) */

	/* corner roundness (border-radius) */
	--roundness-xl: 22px; /* roundness of big panel outer corners */
	--roundness-l: 20px; /* popout panels */
	--roundness-m: 16px; /* smaller panels, images, embeds */
	--roundness-s: 12px; /* members, settings inputs */
	--roundness-xs: 10px; /* channels, buttons */
	--roundness-xxs: 8px; /* searchbar, small elements */

	/* direct messages moon icon */
	/* change to block to show, none to hide */
	--discord-icon: none; /* discord icon */
	--moon-icon: block; /* moon icon */
	--moon-icon-url: url('https://upload.wikimedia.org/wikipedia/commons/c/c4/Font_Awesome_5_solid_moon.svg'); /* custom icon url */
	--moon-icon-size: auto;

	/* filter uncolorable elements to fit theme */
	/* (just set to none, they're too much work to configure) */
	--login-bg-filter: saturate(0.3) hue-rotate(-15deg) brightness(0.4); /* login background artwork */
	--green-to-accent-3-filter: hue-rotate(56deg) saturate(1.43); /* add friend page explore icon */
	--blurple-to-accent-3-filter: hue-rotate(304deg) saturate(0.84) brightness(1.2); /* add friend page school icon */
}

/* change fonts (edit the variables above, not this part) */
:root {
	--font-primary: var(--font), 'Noto Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
	--font-display: var(--font), 'Noto Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}

/* reduced motion */
:root.reduce-motion {
	--list-item-transition: none;
	--unread-bar-transition: none;
	--moon-spin-transition: none;
	--icon-spin-transition: none;
}

/* modify colors */
#app-mount .container__7e23c /* channel list */,
.privateChannels__9b518 /* dms list */,
#app-mount .container_debb33 /* user panel inner */,
.members__573eb /* member list inner */,
.member_aa4760 /* member list members */,
.searchResultsWrap__2e184 /* search results */,
.searchHeader__4d70e /* search results header */,
.chat__52833.container_d4d35b /* message requests */,
#app-mount .panels__58331 > div /* user panel children */,
.container_e1958d /* vc panel */,
.sidebarRegionScroller__8113e /* settings left */,
#app-mount .container__03ec9 /* browse channels container */,
#app-mount .header__71942 /* browse channels header */,
#app-mount .container__6b2e5 /* browse channels inner */,
.chat__52833.background__2fff8 /* server guide body */,
#app-mount .scrollerContainer_dda72c /* channels and roles customize */,
.shop_b31ed2 /* shop */,
.wrapper__6bf2d.minimum__7f356 /* private call */,
.container_ec5ce2, .container__33507 /* emoji/sticker and gif picker searchbars */,
#app-mount .uploadModal__6eb75 /* upload modal */,
.uploadModal__6eb75 .footer_f06dbb /* upload modal footer */ {
	background: var(--bg-4);
}
.mainCard__0ec2c /* forum post */,
.navRow_bb8efc[data-theme=dark] /* add new account bottom */ {
	background: var(--bg-3);
}
.folderIconWrapper__11165[style="background-color: rgba(88, 101, 242, 0.4);"] /* default color closed folders */ {
	background: var(--bg-3) !important;
}
.folder__17546.hover__043de /* folder opened on hover */, 
#app-mount .outer_a41cf3.interactive__46c44:hover, #app-mount .outer_a41cf3.active__76f42 /* friend activity cards on hover */ {
	background: var(--bg-2);
}
#app-mount .searchAnswer__2ccaf, /* search filter answer */
#app-mount .searchFilter_dbda51 /* search filter */ {
	background: var(--bg-1);
}
.newChannel__1bbcf /* new channel */ {
	background: var(--bg-1) !important;
}
.chat__52833 /* chat + member list */,
.sidebar_e031be /* channel sidebar */,
.privateChannels__9b518 .scroller__89969 /* dms list inner */,
#app-mount .innerHeader_ccbd77:after /* channels and roles header shadow */,
.attachedBars_c1606a /* reply bar underneath */ {
	background: none;
}
.selected__987e6 .header__77c95, .clickable__1383f .header__77c95:hover /* server name hover */ {
	background: var(--message-hover);
}
.message_ccca67.replying__38514.selected_e3bc5d, .mouse-mode.full-motion .message_ccca67.replying__38514:hover /* fix reply message hover */ {
	background: var(--background-message-highlight-hover);
}
div.message_ccca67.replying__38514::before /* change reply message bar to neutral */ {
	background: var(--text-2);
}
.activeButtonChild__58171 /* send button */ {
	color: var(--accent-2);
}
.container_debb33 /* user panel button strikethroughs */,
.numberBadge__40d6f /* unread number badge */,
.toolbar__62fb5 /* toolbar button strikethroughs */ {
	--status-danger: #e34973;
	# --status-danger: var(--accent-2);
}
.expandedFolderIconWrapper__324c1 > svg[style="color: rgb(88, 101, 242);"] /* default color folder icons */ {
	color: var(--accent-3) !important;
}
.divider__855e3 /* unread divider */,
.mention_dd733a /* NEW unread pill */,
.mentionsBar__7d867 /* channel list new mention pill */ {
	--status-danger: var(--accent-3);
}
.message_ccca67.mentioned_fa6fd2:before /* mention message left edge */,
.botTagOP_fd6360 /* OP tag */ {
	background: var(--accent-3);
}
.container__2ed72.checked__36fdc /* settings checkbuttons */ {
	background: var(--accent-3) !important;
}
.mention_dd733a:active /* NEW unread pill when clicked */ {
	background: var(--accent-4);
}
path[fill='rgba(35, 165, 90, 1)'] {
	fill: var(--accent-3);
}
path[fill='var(--white-500)'] {
	fill: var(--text-0) !important;
}
.numberBadge__40d6f /* dms number badge */,
.newMessagesBar__8b272 .barButtonBase__5e4cf /* unread bar */,
.botTagRegular_fc4b4a /* bot tag */,
.endCap__95d53 /* unread divider */,
.lookFilled__950dd.colorBrand__27d57 /* accent buttons */,
.lookFilled__950dd.colorBrand__27d57 .defaultColor__77578 /* accent buttons */,
.lookFilled__950dd.colorBrandNew__8872c /* accent buttons */,
.lookFilled__950dd.colorGreen__75c93 /* green buttons */,
.lookFilled__950dd.colorRed__5a617 /* red buttons */,
.lookFilled__950dd.colorYellow__818c3 /* yellow buttons */,
.bar_edc096 /* NEW unread pill */,
.wrapper__8436d:hover .childWrapper_a6ce15, /* default server icon text */ 
.wrapper__8436d.selected_ae80f7 .childWrapper_a6ce15 /* default server icon text */,
.colorDefault_e361cf.focused_dcafb9 /* menu option hover */,
.colorDefault_e361cf.focused_dcafb9 .caret_ce50ce /* popup menu hover caret */,
.colorDefault_e361cf:active:not(.hideInteraction__0b569) /* menu option active */,
.colorDefault_e361cf:active:not(.hideInteraction__0b569) .caret_ce50ce /* menu option active */,
.tabBar__73938 .addFriend__4c0a2.addFriend__4c0a2.addFriend__4c0a2 /* add friend button */,
#app-mount .button__33db6 /* notice banner button */,
.interactive:hover /* mention hover */,
.uploadIcon_d35ec2 /* profile upload image */,
.focused_a7ad64 .userMenuUsername_d2fe10 .userMenuText_b1842d /* account switcher account hover */,
.dots_a97068 /* typing dots */,
.lookOutlined__014b5.colorWhite__0033e /* server banner buttons */,
.header__8f369 /* server preview mode banner */,
.categoryItem__0608f.selectedCategoryItem__3e361,
.live_b195a5 /* streaming live */,
#app-mount .activeButton__70b70 /* member page pagination button */ ,
#app-mount .tooltipBrand__68214 /* member page filter tooltip */,
.button_b82d53.buttonColor__7bad9.buttonActive_ae686f /* active voice channel icons */,
.button_b82d53.buttonColor__7bad9.buttonActive_ae686f:hover /* active voice channel icons */,
.vcd-screen-picker-radio[data-checked="true"] .defaultColor__30336 /* vencord stream resolution picker buttons when active */,
.icon__493c1 /* streaming activity type icon  */ {
	color: var(--text-0);
}
#app-mount .button__33db6, .theme-light .button__33db6 /* notice banner button */,
.lookOutlined__014b5.colorWhite__0033e /* server banner buttons */ {
	border-color: var(--text-0);
}
#app-mount .button__33db6:hover {
	border-color: var(--text-0);
	background-color: var(--text-0);
}
.container__2ed72 /* settings checkbutton background */ {
	background: var(--bg-1) !important;
}
.container__2ed72.checked__36fdc > .slider__41d94 > rect /* settings checkbutton circle */,
.userMenuItem__7b29e path[fill="var(--white-500)"] /* account switcher account hover */,
.colorDefault_e361cf.focused_dcafb9 path {
	fill: var(--text-0);
}
.closeIcon__967e7 path /* alert banner close icon */ {
	fill: currentColor;
}
.container__2ed72 > .slider__41d94 > rect /* settings checkbutton circle */ {
	fill: var(--text-1);
}
.menu__13d0c .menuItemFocused__7beab /* account switch button hover */ {
	color: var(--text-3);
}
.menu__13d0c .menuItemFocused__7beab path /* account switch button hover */ {
	fill: var(--text-3);
}
.mini_d6d84c .grabber_e3daf3 /* spotify bar handle */ {
	margin-top: 4px;
	border-width: 1px;
}
.grabber_e3daf3 /* settings slider handle */ {
	border-width: 0;
}
.button_b82d53.buttonColor__7bad9 /* fix vc buttons */ {
	color: var(--text-4);
}
.button_b82d53.buttonColor__7bad9:hover /* fix vc buttons hover */ {
	background-color: var(--hover);
	color: var(--text-3);
}
.iconBadge__19638.isCurrentUserConnected__3bd70 /* change server vc badge to neutral */ {
	background-color: var(--bg-1);
	color: var(--text-1);
}
.bannerVisible_ef30fe .headerContent__6fcc7 /* server name over banner image */,
#app-mount .categoryText__1b8ff /* gif chooser category names */,
.searchTitle__533c3 {
	color: white;
}
.gifIcon__4c50e /* profile upload image gif chooser */ {
	background-color: white;
}
.controlIcon__73723 /* fix video maximize button */ {
	color: var(--text-1);
	opacity: 0.6;
}
.controlIcon__73723:hover /* fix video maximize button hover */ {
	opacity: 1;
}
::selection {
	background: var(--accent-4);
	color: var(--text-0);
}
.lookFilled__9c1ef.select_fe2671 {
	border: none;
}
.checkbox_fcf2ad /* channel checkboxes */ {
	border-color: var(--text-4) !important;
}
.newBadge__40645 /* fix forum new badge */ {
	color: var(--accent-2);
	line-height: 16px;
}

/* remove shadows */
#app-mount .header_aac16f /* gif picker */ {
	box-shadow: none;
}
#app-mount .textContentFooter_e03480 /* forum post image fade */ {
	background: none;
}

/* change online indicator color */
rect[fill='#23a55a'],
svg[fill='#23a55a'] {
	fill: var(--online-indicator) !important;
}
.status__1c26d[style='background-color: rgb(35, 165, 90);'] {
	background-color: var(--online-indicator) !important;
}
rect[fill='#f0b232'],
svg[fill='#f0b232'] {
	fill: var(--idle-indicator);
}
.status__1c26d[style='background-color: rgb(240, 178, 50);'] {
	background-color: var(--idle-indicator) !important;
}
rect[fill='#f23f43'],
svg[fill='#f23f43'] {
	fill: var(--dnd-indicator);
}
.status__1c26d[style='background-color: rgb(242, 63, 67);'] {
	background-color: var(--dnd-indicator) !important;
}
rect[fill='#593695'],
svg[fill='#593695'] {
	fill: var(--streaming-indicator);
}
.status__1c26d[style='background-color: rgb(89, 54, 149);'] {
	background-color: var(--streaming-indicator) !important;
}

/* color fix filters */
.container__048f4:last-child .icon_e26761 /* explore discoverable servers icon color */ {
	background-color: #3ba55c;
	filter: var(--green-to-accent-3-filter);
}
.container__048f4:first-child .icon_e26761 /* explore discoverable servers icon color */ {
	filter: var(--blurple-to-accent-3-filter);
}
.artwork__94141 /* filter login image */ {
	filter: var(--login-bg-filter);
}

/* fix weird message bar padding */
.clipContainer_ab9cf6 {
	padding-top: 0;
	margin-top: 0;
}

/* separate header bar */
.title_d4ba1a.themed_b152d4 /* remove bg */ {
	background: none;
}
.searchResultsWrap__2e184 /* allow overflow */ {
	overflow: visible;
}
.chatContent_f087cb::before /* main chat */,
.membersWrap__5ca6b::before /* member list */,
.searchResultsWrap__2e184::before /* search results */,
.profilePanel_e2cafe::before /* dm profile */,
.container_b92032::before /* forums */ {
	content: ''';
	position: absolute;
	margin-top: -48px;
	background: var(--background-primary);
	width: 100%;
	height: 48px;
	border-radius: var(--roundness-xl) var(--roundness-xl) 0 0;
}
.wrapper__6bf2d.minimum__7f356 ~ .content__01e65 .container__93316::before /* remove when in private call */ {
	display: none;
}
.membersWrap__5ca6b /* fix members list height when not scroll */ {
	height: 100%;
}

/* rearrange toolbar */
a[href="https://support.discord.com"] /* hide help */
{
	display: none;
}
.search__07df0 {
	order: 1;
	margin: 0 4px 0 12px;
}
.chat__52833:has(.searchResultsWrap__2e184) .searchBar__5a20a {
	width: 394px !important;
	margin-left: calc(var(--spacing) + 8px);
}
.chat__52833:has(.profilePanel_e2cafe) .searchBar__5a20a {
	width: 316px !important;
	margin-left: calc(var(--spacing) + 8px);
}
.chat__52833:has(.membersWrap__5ca6b) .searchBar__5a20a {
	width: 216px !important;
	margin-left: calc(var(--spacing) + 8px);
}

/* add spacing */
.base_c0676e /* outside edges */ {
	margin: 0 var(--spacing) var(--spacing) 0;
}
.sidebar_e031be /* channel list and user panel */,
.content__01e65 /* between chat and member list */ {
	gap: var(--spacing);
}
.sidebar_e031be /* channel list and chat */ {
	margin-right: var(--spacing);
}
.sidebar_e031be.hidden__3ab58 {
	margin-right: 0;
}
.resizeHandle_cc9d34 /* pretend to be a margin */ {
	width: var(--spacing);
}
.wrapper__6bf2d.fullScreen_b3f0af .callContainer__1477d /* fullscreen vc */ {
	margin-top: var(--spacing);
}
.notice__5fd4c /* banner notice */,
.wrapper__6bf2d.minimum__7f356 /* private call */ {
	margin-bottom: var(--spacing);
}
/* fix padding */
#vc-spotify-player /* vencord spotify */,
.container_e1958d /* vc panel */,
.panel_bd8c76 /* stream panel */ {
	padding: 10px;
}

/* add rounded corners */
.container__7e23c /* channel list */,
.panels__58331 /* user panels */,
.privateChannels__9b518 /* dms list */,
.container_bd15da /* friends page */,
.applicationStore__444b9 /* nitro page */,
#app-mount .container_d4d35b /* message requests */,
.shop_b31ed2 /* discord shop */,
.container_ec90d4 /* family center */,
.container__694a1 /* message request */,
#app-mount .callContainer__1477d /* vc */, 
.chat__52833 /* general chat container (for browse channels page */,
.animatedContainer__0e828 /* server image card */,
.notice__5fd4c /* banner notice */,
.wrapper__6bf2d.minimum__7f356, /* private call */
.wrapper__6bf2d.minimum__7f356 ~ .content__01e65 /* chat under private call */,
.main_e0b3ac /* server onboarding */ {
	border-radius: var(--roundness-xl);
	overflow: hidden;
}
.container__93316 /* main chat */,
.chatContent_f087cb /* main chat inner */,
.container_f79ab4 /* members list */,
.members__573eb /* members list inner */,
.searchResultsWrap__2e184 /* search results */,
.profilePanel_e2cafe /* profile panel outer */,
.userPanelOuter_eb00b1 /* profile panel inner */,
.userPanelInner_f9edb8 /* profile panel inner inner */,
.userPanelInner_f9edb8::before /* profile panel inner inner filter */,
.container_b92032 /* forums */ {
	border-radius: 0 0 var(--roundness-xl) var(--roundness-xl);
}

/* more rounded corners */
.messagesPopoutWrap__10dd1 /* inbox, pinned messages popout */,
.container_f93da8 /* thread popout */,
.menu__088f7 .item__183e8d /* server option popout */,
.userPopoutOuter_d67f56 /* user profile popout */,
.root_ba16f0 /* user profile modal */,
.contentWrapper_e0bb2c /* emoji, sticker, gif pickers */,
.footer_e0b400 /* edit modal footer */,
.layerContainer_a2fcaa .root_a28985 /* upload modal */,
.uploadModal__6eb75 .footer_f06dbb /* upload modal footer */ {
	border-radius: var(--roundness-l);
}
.roundedBanner__16aa6 /* user profile popout top */,
.banner_b7f1fb /* user profile top when edit */ {
	border-radius: calc(var(--roundness-l) - 4px) calc(var(--roundness-l) - 4px) 0 0;
}
.userPopoutInner_ac0960:before /* user profile popout bottom */,
.userProfileModalInner__99b1e:before /* user profile modal bottom */ {
	border-radius: calc(var(--roundness-l) - 4px);
}
.overlayBackground__345c9 /* user profile inner */ {
	border-radius: var(--roundness-s);
}
.menu__088f7 /* general popouts */,
.embed_cc6dae /* embeds */,
.mediaAttachmentsContainer__242e2 /* image container */,
.oneByOneGridSingle__8c6ef /* image container single */,
.imageContainer__1b5e9 .imageWrapper__178ee /* gif wrapper */,
.markup_a7e664 code /* code block */,
.itemCard_b64118 /* friend activity */,
.peopleListItem_dab480:hover /* online list friends */,
.withTagAsButton_e22174:hover, .withTagless__058f8:hover /* user panel username */,
.messageGroupWrapper__1fce2 /* pinned messages */ {
	border-radius: var(--roundness-m);
}
.scrollableContainer_ff917f /* message bar */,
.channelTextArea_c2094b /* message bar underneath */,
.select_fe2671 /* bot dropdown select */,
.layout_bb8e67 /* members */,
.interactive__0786a /* dms */,
.container__17159 /* thread link */,
.input_f27786 /* settings inputs */,
.item_b7fb7e /* settings radiobutton bars */,
.item_b7fb7e .radioBar__70669 /* settings radiobutton bars */ {
	border-radius: var(--roundness-s);
}
.select_fe2671.open_cd27aa /* vencord plugin show all */ {
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}
.popout_a6e77f /* vencord plugin show all */ {
	border-radius: 0 0 var(--roundness-s) var(--roundness-s);
}
.banner_f13f1e /* community server tutorial thing on message bar */ {
	border-radius: var(--roundness-s) var(--roundness-s) 0 0;
}
.scrollableContainer_ff917f.hasConnectedBar__7d21e /* fix message bar with reply bar */ {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
.replyBar_ed6afc {
	border-radius: var(--roundness-s) var(--roundness-s) 0 0;
}
.link_ddbb36 /* channels */,
.content__3b07e /* member connected to vc */,
.side_b4b3f6 .item__48dda /* settings tabs */,
button.button__581d0 /* small buttons */,
.container__33507 /* friend searchbar */,
.container_ec5ce2, /* sticker/emoji picker searchbar */
.item__183e8 /* general popout buttons */,
.icon__493c1 /* streaming icon */,
#vc-spotify-album-image,
.background__3b760 /* settings nitro tab selected */,
.hoverButtonGroup__304b2 /* video download button */,
.wrapper__4e6b6 /* message hover menu */,
.previewChannelRowContent__9054b {
	border-radius: var(--roundness-xs);
}
.hoverButtonGroup__304b2 /* reposition video download button */ {
	top: 6px;
	right: 6px;
}
.wrapper__53064 /* mentions */,
.searchBar__5a20a /* search bar */,
.searchBar__621ec .searchBarComponent__8f95f /* find conversation search bar */,
.topPill__63ad4 .item__48dda /* friend online/categories */ {
	border-radius: var(--roundness-xxs);
}
#app-mount .centerButton__8316e /* fix vc buttons */ {
	border-radius: 50%;
}

/* separate guilds panel background */
.guilds__2b93a {
	background: var(--bg-4);
	border-radius: var(--roundness-xl);
	margin: 0 0 var(--spacing) var(--spacing);
}
.guilds__2b93a.hidden__7c832 {
	margin: 0;
}
#app-mount .scroller_de945b {
	padding: 12px 0;
}
.base_c0676e {
	margin-left: var(--spacing);
}
.guilds__2b93a::after /* add bottom scroll shadow */,
.membersWrap__5ca6b::after {
	content: ''';
	position: absolute;
	background: linear-gradient(transparent 85%, var(--bg-4) 100%);
	bottom: 0;
	left: 0;
	right: 0;
	height: 100px;
	pointer-events: none;
	border-radius: 0 0 var(--roundness-xl) var(--roundness-xl);
}
.guilds__2b93a::before /* add top scroll shadow */ {
	content: ''';
	position: absolute;
	background: linear-gradient(var(--bg-4) 0%, transparent 15%);
	top: 0;
	left: 0;
	right: 0;
	height: 100px;
	pointer-events: none;
	z-index: 1;
}
.childWrapper_a6ce15 {
	background: var(--bg-3);
}
.container_d1f8f5 > [style$='display: flex;'] > .guilds__2b93a {
	margin: 0;
}
.container_d1f8f5 > [style$='display: flex;'] {
	margin: 0 0 var(--spacing) var(--spacing);
}
/* UNCOMMENT IF YOU REMOVE THE ABOVE SECTION "separate guilds panel background"
.expandedFolderBackground_b1385f,
.folder__17546,
.folderIconWrapper__11165 {
	background-color: var(--bg-4) !important;
} */

/* extra top margin for macos and custom clients */
.container_d1f8f5 {
	margin-top: var(--spacing);
}
.platform-win .container_d1f8f5 {
	margin-top: 0;
}
/* UNCOMMENT if you want to make panels evenly sized on macos 
.platform-osx .wrapper__216eb {
    margin-top: 0;
}
.platform-osx .container_d1f8f5 {
    margin-top: 32px;
} */

/* top corner title */
[class^='wordmarkWindows'] {
	padding: 4px var(--spacing);
}
[class^='wordmarkWindows'] > svg {
	display: none;
}
[class^='wordmarkWindows']::after {
	content: var(--corner-text);
	display: block;
	position: relative;
	height: 16px;
	line-height: 16px;
	font-family: var(--font);
	font-size: 13px;
	font-weight: 900;
	color: var(--text-5);
	transform: scaleX(1.2);
	margin-left: 6px;
}

/* top bar height */
[class^='typeWindows'] {
	height: calc(var(--spacing) + 8px);
}

/* window controls */
[class^='winButton'] > svg {
	display: none;
}
[class^='winButton'] {
	background: none !important;
	top: 0;
	width: calc(var(--spacing) + 8px);
	height: calc(var(--spacing) + 8px);
	margin: -2px 4px 0px 0px;
}
[class^='winButtonClose'] {
	margin: -2px calc(var(--spacing) - 4px) 0px 0px;
}
[class^='winButton']::after {
	content: ''';
	height: 12px;
	width: 12px;
	border-radius: 12px;
}
[class^='winButton']:hover::after {
	filter: brightness(0.8);
}
[class^='winButton']:active::after {
	transform: scale(0.9);
}
[class^='winButtonClose']::after {
	background-color: var(--dnd-indicator) !important;
}
[class^='winButtonMinMax']:nth-child(3)::after {
	background-color: var(--online-indicator) !important;
}
[class^='winButtonMinMax']:nth-child(4)::after {
	background-color: var(--idle-indicator) !important;
}

/* custom dm button moon icon */
.childWrapper_a6ce15 > svg:not(.favoriteIcon__901fa) {
	display: var(--discord-icon);
}
.childWrapper_a6ce15:has(> svg:not(.favoriteIcon__901fa))::before {
	content: ''';
	display: var(--moon-icon);
	position: absolute;
	width: 65%;
	height: 65%;
	background: var(--text-4);
	-webkit-mask-image: var(--moon-icon-url);
	-webkit-mask-size: var(--moon-icon-size);
	-webkit-mask-repeat: none;
}
.wrapper__8436d:hover .childWrapper_a6ce15::before {
	/* prettier-ignore */
	transition: background-color 0.15s ease-out, transform var(--moon-spin-transition);
	transform: rotate(0deg) scale(1);
}
.wrapper__8436d:hover > .childWrapper_a6ce15::before,
.wrapper__8436d.selected_ae80f7 > .childWrapper_a6ce15::before {
	background: var(--text-0);
	transform: rotate(-360deg) scale(0.8);
}
.lowerBadge_e89e22::before {
	content: ''';
	display: block;
	position: absolute;
	width: 24px;
	height: 24px;
	transform: translate(-4px, -4px);
	z-index: -1;
	background: var(--bg-3);
	border-radius: 50%;
}
/* custom dm button background instead of icon */
/* .childWrapper_a6ce15:has(> svg:not(.favoriteIcon__901fa)) {
	background: url('https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png');
	background-color: transparent !important;
	background-size: cover;
} */

/* vencord spotify player support */
#vc-spotify-player {
	--vc-spotify-green: var(--accent-1);
}

/* improve unread divider */
.divider__855e3 {
	border-width: 4px;
	border-radius: 4px;
}
.divider__855e3 .content__7191e {
	margin-top: -3px;
}
.endCap__95d53 {
	margin-top: -1px;
	padding-top: 2px;
}
/* improve highlight message left edge */
.message_ccca67.mentioned_fa6fd2::before,
.replying__38514::before {
	width: 4px;
	border-radius: 4px;
}
/* modify embeds */
.embedFull__14919 {
	border: 4px solid var(--bg-2);
	border-top-color: transparent !important;
	border-bottom-color: transparent !important;
	border-right-color: transparent !important;
}

/* horizontal server list fix */
#app-mount .app_b1f720 .base_c0676e {
	top: calc(var(--server-container) + var(--spacing)) !important;
}

/* list hover animations */
.wrapper__612a5 .link_ddbb36 /* channels */,
.container_a48b21 /* members */,
.channel__0aef5 /* dms */,
.side_b4b3f6 .item__48dda /* settings */ {
	transition: margin-left var(--list-item-transition);
}
.wrapper__612a5:hover .link_ddbb36,
.side_b4b3f6 .item__48dda:hover {
	margin-left: 10px;
}
.container_a48b21:hover,
.channel__0aef5:hover {
	margin-left: 18px;
}

/* spin hover animations */
button.button_ae40a4 /* make user panel buttons round */ {
	border-radius: 50%;
}
.button_ae40a4:last-child .contents__322f4 /* settings button */, 
.attachButton__56f98 .attachButtonInner__84c26 /* upload button */,
.emojiButton_b63c38 .contents__322f4 /* emoji button */,
.closeButton__8177f /* settings exit button */,
.contents__322f4 > .closeIcon__16020 /* modal close */ {
	transition: transform var(--icon-spin-transition);
}
.button_ae40a4:last-child:hover .contents__322f4,
.attachButton__56f98:hover .attachButtonInner__84c26,
.emojiButton_b63c38:hover .contents__322f4,
.closeButton__8177f:hover,
.contents__322f4:hover > .closeIcon__16020 {
	transform: rotate(360deg);
}

/* hide unread bar on hover */
.messagesWrapper_add28b {
	overflow: hidden;
}
.newMessagesBar__8b272 {
	top: -48px;
	height: 72px;
	transition: top var(--unread-bar-transition);
	background: none;
	box-shadow: none;
	border-radius: 0;
}
.newMessagesBar__8b272::before {
	content: ''';
	background: var(--brand-experiment);
	box-shadow: var(--elevation-low);
	width: 100%;
	position: absolute;
	height: 32px;
	border-radius: var(--roundness-s);
}
.newMessagesBar__8b272:hover {
	top: -12px;
}
.top__81fa6 > .containerPadding_ca1052 {
	padding: 16px;
	margin-top: -40px;
	transition: margin-top var(--unread-bar-transition);
}
.top__81fa6:hover > .containerPadding_ca1052:hover {
	margin-top: -12px;
}
.bottom__53f5a > .containerPadding_ca1052 {
	padding: 16px;
	margin-bottom: -40px;
	transition: margin-bottom var(--unread-bar-transition);
}
.bottom__53f5a > .containerPadding_ca1052:hover {
	margin-bottom: -12px;
}

.theme-light {
	--text-link: var(--accent-5);
}
html.theme-light,
.theme-dark {
	--activity-card-background: var(--primary-700);
	--android-navigation-bar-background: var(--primary-830);
	--android-navigation-scrim-background: hsl(var(--primary-830-hsl) / 0.5);
	--android-ripple: hsl(var(--white-500-hsl) / 0.07);
	--background-accent: var(--bg-2);
	--background-floating: var(--bg-3);
	--background-mentioned: var(--mention);
	--background-mentioned-hover: var(--mention-hover);
	--background-message-automod: hsl(var(--red-400-hsl) / 0.05);
	--background-message-automod-hover: hsl(var(--red-400-hsl) / 0.1);
	--background-message-highlight: var(--active);
	--background-message-highlight-hover: var(--hover);
	--background-message-hover: var(--message-hover);
	--background-mobile-primary: var(--bg-4);
	--background-mobile-secondary: var(--primary-630);
	--background-modifier-accent: var(--hover);
	--background-modifier-accent-2: red;
	--background-modifier-active: var(--active);
	--background-modifier-hover: var(--hover);
	--background-modifier-selected: var(--active);
	--background-nested-floating: var(--primary-630);
	--background-primary: var(--bg-4);
	--background-secondary: var(--bg-3);
	--background-secondary-alt: var(--bg-3);
	--background-tertiary: var(--bg-3);
	--bg-backdrop: hsl(var(--black-500-hsl) / 0.7);
	--bg-backdrop-no-opacity: var(--black-500);
	--bg-base-primary: var(--primary-600);
	--bg-base-secondary: var(--primary-630);
	--bg-base-tertiary: var(--primary-660);
	--bg-mod-faint: var(--bg-4);
	--bg-mod-strong: hsl(var(--primary-500-hsl) / 0.54);
	--bg-mod-subtle: hsl(var(--primary-500-hsl) / 0.48);
	--bg-surface-overlay: var(--primary-800);
	--bg-surface-overlay-tmp: var(--primary-800);
	--bg-surface-raised: var(--primary-600);
	--black: var(--black-500);
	--blur-fallback: hsl(var(--primary-700-hsl) / 0.96);
	--blur-fallback-pressed: hsl(var(--primary-730-hsl) / 0.96);
	--border-faint: hsl(var(--white-500-hsl) / 0.03);
	--border-strong: hsl(var(--white-500-hsl) / 0.16);
	--border-subtle: hsl(var(--white-500-hsl) / 0.08);
	--bug-reporter-modal-submitting-background: hsl(var(--primary-800-hsl) / 0.6);
	--button-creator-revenue-background: var(--teal-430);
	--button-danger-background: var(--red-430);
	--button-danger-background-active: var(--red-530);
	--button-danger-background-disabled: var(--red-430);
	--button-danger-background-hover: var(--red-500);
	--button-outline-brand-background: hsl(var(--white-500-hsl) / 0);
	--button-outline-brand-background-active: var(--brand-560);
	--button-outline-brand-background-hover: var(--brand-500);
	--button-outline-brand-border: var(--brand-500);
	--button-outline-brand-border-active: var(--brand-560);
	--button-outline-brand-border-hover: var(--brand-500);
	--button-outline-brand-text: var(--white-500);
	--button-outline-brand-text-active: var(--white-500);
	--button-outline-brand-text-hover: var(--white-500);
	--button-outline-danger-background: hsl(var(--white-500-hsl) / 0);
	--button-outline-danger-background-active: var(--red-460);
	--button-outline-danger-background-hover: var(--red-430);
	--button-outline-danger-border: var(--red-400);
	--button-outline-danger-border-active: var(--red-430);
	--button-outline-danger-border-hover: var(--red-430);
	--button-outline-danger-text: var(--white-500);
	--button-outline-danger-text-active: var(--white-500);
	--button-outline-danger-text-hover: var(--white-500);
	--button-outline-positive-background: hsl(var(--white-500-hsl) / 0);
	--button-outline-positive-background-active: var(--green-530);
	--button-outline-positive-background-hover: var(--green-430);
	--button-outline-positive-border: var(--green-360);
	--button-outline-positive-border-active: var(--green-530);
	--button-outline-positive-border-hover: var(--green-430);
	--button-outline-positive-text: var(--white-500);
	--button-outline-positive-text-active: var(--white-500);
	--button-outline-positive-text-hover: var(--white-500);
	--button-outline-primary-background: hsl(var(--white-500-hsl) / 0);
	--button-outline-primary-background-active: var(--primary-430);
	--button-outline-primary-background-hover: var(--primary-500);
	--button-outline-primary-border: var(--primary-500);
	--button-outline-primary-border-active: var(--primary-430);
	--button-outline-primary-border-hover: var(--primary-500);
	--button-outline-primary-text: var(--white-500);
	--button-outline-primary-text-active: var(--white-500);
	--button-outline-primary-text-hover: var(--white-500);
	--button-positive-background: var(--green-430);
	--button-positive-background-active: var(--green-530);
	--button-positive-background-disabled: var(--green-430);
	--button-positive-background-hover: var(--green-500);
	--button-secondary-background: var(--bg-2);
	--button-secondary-background-active: var(--text-5);
	--button-secondary-background-disabled: var(--bg-2);
	--button-secondary-background-hover: var(--bg-1);
	--card-gradient-bg: hsl(var(--black-500-hsl) / 0.4);
	--card-gradient-pressed-bg: hsl(var(--black-500-hsl) / 0.5);
	--card-primary-bg: var(--primary-560);
	--card-primary-pressed-bg: var(--primary-645);
	--card-secondary-bg: var(--bg-3);
	--card-secondary-pressed-bg: var(--primary-645);
	--channel-icon: var(--text-4);
	--channel-text-area-placeholder: var(--text-5);
	--channels-default: var(--text-4);
	--channeltextarea-background: var(--bg-3);
	--chat-background: var(--primary-600);
	--chat-border: var(--primary-700);
	--chat-input-container-background: var(--primary-600);
	--chat-swipe-to-reply-background: var(--primary-660);
	--control-brand-foreground: var(--accent-2);
	--control-brand-foreground-new: var(--brand-360);
	--creator-revenue-icon-gradient-end: var(--teal-430);
	--creator-revenue-icon-gradient-start: var(--teal-360);
	--creator-revenue-info-box-background: hsl(var(--teal-430-hsl) / 0.1);
	--creator-revenue-info-box-border: var(--teal-400);
	--creator-revenue-locked-channel-icon: var(--teal-345);
	--creator-revenue-progress-bar: var(--teal-400);
	--deprecated-card-bg: var(--bg-3);
	--deprecated-card-editable-bg: hsl(var(--primary-700-hsl) / 0.3);
	--deprecated-quickswitcher-input-background: var(--primary-400);
	--deprecated-quickswitcher-input-placeholder: hsl(var(--white-500-hsl) / 0.3);
	--deprecated-store-bg: var(--primary-600);
	--deprecated-text-input-bg: var(--bg-3);
	--deprecated-text-input-border: hsl(var(--black-500-hsl) / 0.3);
	--deprecated-text-input-border-disabled: var(--primary-700);
	--deprecated-text-input-border-hover: var(--primary-900);
	--deprecated-text-input-prefix: var(--primary-200);
	--display-banner-overflow-background: hsl(var(--primary-700-hsl) / 0.5);
	--divider-strong: hsl(var(--white-500-hsl) / 0.16);
	--divider-subtle: hsl(var(--white-500-hsl) / 0.08);
	--focus-primary: var(--blue-345);
	--forum-post-extra-media-count-container-background: hsl(var(--primary-660-hsl) / 0.8);
	--forum-post-tag-background: hsl(var(--primary-660-hsl) / 0.9);
	--guild-notifications-bottom-sheet-pill-background: var(--primary-700);
	--header-muted: var(--text-4);
	--header-primary: var(--text-2);
	--header-secondary: var(--text-4);
	--home-background: var(--bg-4);
	--home-card-resting-border: hsl(var(--transparent-hsl) / 0);
	--icon-muted: var(--primary-400);
	--icon-primary: var(--primary-130);
	--icon-secondary: var(--primary-330);
	--info-box-background: hsl(var(--blue-345-hsl) / 0.1);
	--info-danger-background: hsl(var(--red-400-hsl) / 0.1);
	--info-danger-foreground: var(--red-400);
	--info-danger-text: var(--white-500);
	--info-help-background: hsl(var(--blue-345-hsl) / 0.1);
	--info-help-foreground: var(--blue-345);
	--info-help-text: var(--white-500);
	--info-positive-background: hsl(var(--green-360-hsl) / 0.1);
	--info-positive-foreground: var(--green-360);
	--info-positive-text: var(--white-500);
	--info-warning-background: hsl(var(--yellow-300-hsl) / 0.1);
	--info-warning-foreground: var(--yellow-300);
	--info-warning-text: var(--white-500);
	--input-background: var(--bg-3);
	--input-placeholder-text: var(--text-5);
	--interactive-active: var(--text-3);
	--interactive-hover: var(--text-3);
	--interactive-muted: var(--text-5);
	--interactive-normal: var(--text-4);
	--legacy-android-blur-overlay-default: hsl(var(--primary-660-hsl) / 0.5);
	--legacy-android-blur-overlay-ultra-thin: hsl(var(--black-500-hsl) / 0.025);
	--legacy-blur-fallback-default: hsl(var(--primary-660-hsl) / 0.975);
	--legacy-blur-fallback-ultra-thin: hsl(var(--black-500-hsl) / 0.95);
	--live-stage-tile-border: hsl(var(--primary-500-hsl) / 0.6);
	--logo-primary: var(--white-500);
	--mention-background: var(--mention);
	--mention-foreground: var(--accent-1);
	--modal-background: var(--bg-4);
	--modal-footer-background: var(--bg-4);
	--navigator-header-tint: var(--white-500);
	--polls-image-normal-border: hsl(var(--black-430-hsl) / 0.9);
	--polls-victor-border: var(--yellow-300);
	--polls-victor-fill: var(--mention);
	--polls-victor-label: var(--primary-600);
	--polls-voted-border: var(--green-330);
	--polls-voted-fill: var(--mention);
	--polls-voted-label: var(--primary-600);
	--profile-gradient-card-background: hsl(var(--black-500-hsl) / 0.7);
	--profile-gradient-message-input-border: hsl(var(--primary-500-hsl) / 0.48);
	--profile-gradient-note-background: hsl(var(--black-500-hsl) / 0.3);
	--profile-gradient-overlay: hsl(var(--black-500-hsl) / 0.6);
	--profile-gradient-overlay-synced-with-user-theme: hsl(var(--black-500-hsl) / 0.8);
	--profile-gradient-profile-body-background-hover: hsl(var(--white-500-hsl) / 0.16);
	--profile-gradient-role-pill-background: hsl(var(--primary-660-hsl) / 0.5);
	--profile-gradient-role-pill-border: hsl(var(--white-500-hsl) / 0.2);
	--profile-gradient-section-box: hsl(var(--black-500-hsl) / 0.45);
	--redesign-activity-card-background: var(--primary-560);
	--redesign-activity-card-background-pressed: var(--primary-630);
	--redesign-activity-card-badge-icon: var(--primary-360);
	--redesign-activity-card-border: hsl(var(--white-500-hsl) / 0.02);
	--redesign-activity-card-overflow-background: var(--primary-630);
	--redesign-button-danger-background: var(--red-430);
	--redesign-button-danger-pressed-background: var(--red-460);
	--redesign-button-danger-text: var(--white-500);
	--redesign-button-overlay-alpha-background: hsl(var(--black-500-hsl) / 0.54);
	--redesign-button-overlay-alpha-pressed-background: hsl(var(--black-500-hsl) / 0.64);
	--redesign-button-overlay-alpha-text: var(--white-500);
	--redesign-button-overlay-background: var(--white-500);
	--redesign-button-overlay-pressed-background: var(--primary-230);
	--redesign-button-overlay-text: var(--primary-860);
	--redesign-button-positive-background: var(--green-430);
	--redesign-button-positive-pressed-background: var(--green-460);
	--redesign-button-positive-text: var(--white-500);
	--redesign-button-primary-alt-background: hsl(var(--brand-500-hsl) / 0);
	--redesign-button-primary-alt-border: var(--brand-360);
	--redesign-button-primary-alt-on-blurple-background: hsl(var(--brand-530-hsl) / 0);
	--redesign-button-primary-alt-on-blurple-border: var(--white-500);
	--redesign-button-primary-alt-on-blurple-pressed-background: var(--brand-530);
	--redesign-button-primary-alt-on-blurple-pressed-border: var(--brand-360);
	--redesign-button-primary-alt-on-blurple-text: var(--white-500);
	--redesign-button-primary-alt-pressed-background: hsl(var(--brand-700-hsl) / 0.16);
	--redesign-button-primary-alt-pressed-border: hsl(var(--brand-400-hsl) / 0.5);
	--redesign-button-primary-alt-pressed-text: var(--brand-360);
	--redesign-button-primary-alt-text: var(--brand-360);
	--redesign-button-primary-background: var(--brand-500);
	--redesign-button-primary-on-blurple-background: var(--white-500);
	--redesign-button-primary-on-blurple-pressed-background: var(--brand-200);
	--redesign-button-primary-on-blurple-pressed-text: var(--brand-530);
	--redesign-button-primary-on-blurple-text: var(--brand-500);
	--redesign-button-primary-pressed-background: var(--brand-560);
	--redesign-button-primary-text: var(--white-500);
	--redesign-button-secondary-alt-background: var(--primary-660);
	--redesign-button-secondary-alt-pressed-background: var(--primary-560);
	--redesign-button-secondary-alt-pressed-text: var(--primary-330);
	--redesign-button-secondary-alt-text: var(--primary-230);
	--redesign-button-secondary-background: var(--primary-460);
	--redesign-button-secondary-border: hsl(var(--white-500-hsl) / 0.08);
	--redesign-button-secondary-pressed-background: var(--primary-500);
	--redesign-button-secondary-pressed-border: hsl(var(--transparent-hsl) / 0);
	--redesign-button-secondary-text: var(--primary-230);
	--redesign-channel-category-name-text: var(--primary-330);
	--redesign-channel-message-preview-text: var(--primary-360);
	--redesign-channel-name-muted-text: var(--primary-360);
	--redesign-channel-name-text: var(--primary-130);
	--redesign-chat-input-background: var(--primary-700);
	--redesign-input-control-active-bg: var(--primary-645);
	--redesign-input-control-selected: var(--brand-500);
	--redesign-only-background-active: var(--primary-530);
	--redesign-only-background-default: var(--primary-600);
	--redesign-only-background-overlay: var(--primary-645);
	--redesign-only-background-raised: var(--primary-630);
	--redesign-only-background-sunken: var(--primary-660);
	--scrollbar-auto-scrollbar-color-thumb: var(--primary-730);
	--scrollbar-auto-scrollbar-color-track: var(--primary-630);
	--scrollbar-auto-thumb: var(--bg-3);
	--scrollbar-auto-track: transparent;
	--scrollbar-thin-thumb: var(--bg-3);
	--scrollbar-thin-track: transparent;
	--spoiler-hidden-background: var(--primary-700);
	--spoiler-revealed-background: var(--primary-660);
	--status-danger: var(--red-400);
	--status-danger-background: var(--red-400);
	--status-danger-text: var(--text-0);
	--status-dnd: var(--red-400);
	--status-idle: var(--yellow-300);
	--status-offline: var(--primary-360);
	--status-online: var(--green-360);
	--status-positive: var(--green-360);
	--status-positive-background: var(--green-430);
	--status-positive-text: var(--text-0);
	--status-speaking: var(--green-360);
	--status-warning: var(--yellow-300);
	--status-warning-background: var(--yellow-300);
	--status-warning-text: var(--black-500);
	--text-brand: var(--accent-1);
	--text-danger: var(--red-345);
	--text-link: var(--accent-1);
	--text-link-low-saturation: var(--blue-330);
	--text-low-contrast: var(--primary-360);
	--text-message-preview-low-sat: var(--primary-360);
	--text-muted: var(--text-5);
	--text-muted-on-default: red;
	--text-normal: var(--text-3);
	--text-positive: var(--green-330);
	--text-primary: red;
	--text-secondary: var(--text-3);
	--text-warning: var(--yellow-300);
	--textbox-markdown-syntax: var(--primary-360);
	--theme-locked-blur-fallback: hsl(var(--primary-700-hsl) / 0.96);
	--user-profile-header-overflow-background: hsl(var(--primary-700-hsl) / 0.5);
	--voice-video-tile-blur-fallback: hsl(var(--primary-700-hsl) / 0.48);
	--voice-video-video-tile-blur-fallback: hsl(var(--primary-700-hsl) / 0.48);
	--white: var(--white-500);

	--profile-gradient-primary-color: var(--bg-4);
	--profile-gradient-secondary-color: var(--bg-4);

	--elevation-low: none;
	--search-popout-option-fade: none;
	--search-popout-option-fade-hover: none;

	--brand-260: var(--bg-1); /* new badge */
	--brand-430: var(--accent-3);
	--brand-500: var(--accent-3);
	--brand-530: var(--accent-4);
	--brand-560: var(--accent-4);
	--brand-600: var(--accent-5);

	--brand-experiment-400: var(--accent-3); /* loading spinning animation element */

	--green-330: var(--accent-1);
	--green-360: var(--accent-3);
	--green-430: var(--accent-4);
	--green-500: var(--accent-4);
	--green-530: var(--accent-5);

	--brand-experiment-15a: var(--mention); /* background of reacted reactions */
	--brand-360: var(--accent-2); /* invite text */

	--primary-500: var(--bg-2); /* progress bars */
	--primary-600: var(--bg-3); /* delete message preview */
	--primary-630: var(--bg-3); /* billing transaction history */
	--primary-660: var(--bg-3); /* search popout "enter" bar */

	--white-500: var(--text-1);
}

* {
	scrollbar-color: unset !important;
	scrollbar-width: unset !important;
}

    '';
}