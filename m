Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793355342;
	b=wNGCCL9GK13UDGc18WRlKYD29DK8CRpi082gGUmRYS0s/JSDDq29FOtu9TLc/yPSFIjl
	 tY5QUGpXA8AAu6bKEw2mqjByVeckdlx73XbAM6LrAIql430vGad2K3rOJxTe1jwP2WIe1
	 hCEWXKpHSG8/CCGWaOEWBIASBLxlepySfyvZHpQpmcWtkBdb4fKsoNRNfdwvn0SLyfxcj
	 v75U85/XZEQ1jTlbhN6DHwwZawxuLGghEi+B1LV68XKIwHfuc1zxqixgMYF6iKBPCfAZh
	 sWBokSW/dAuYzwqyZeuWXrTnYF+oACH5XLgX6TUde5g7ROKZgmv52Zritch2toU62XQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355342;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-AtpMessageProperties:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rRsGWTHzGQLVNg9M0uKsKqcmXcpt98a1Qt0o2g9iMgk=;
	b=kq63gZ3rfIh5CiHq0+CPDJqUD4zviUUWbYQ3WAA/V5Fm8ikNzcyyvhfPTEEOzJX9lDt4
	 8o7rXM7H1CrzCLquj6jTuTAandiGsgfHds6RhWSL3HX8qxsyUUQt9VMD+tESHRSyFA8lU
	 ZLksa6dpYBfNBnEWKonk78WSNV2WxMVwYNvXQKPVzKbjB6MBBn9T2DfvzwVyYGusL7JUT
	 nIgD76viNgCBfcAX1FocRO7jMJK0/UoOgHRge9rCHpWERm+rRap/Ns5kJNYnT7UkGpnsA
	 XvksUY5MbEW249GulbmwEVGaDiVUZbAgJKb/ktWitx89dn3cIOq0ohFwnZBOX3RLj2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qnap.com;
	spf=pass smtp.mailfrom=qnap.com;
	dkim=pass header.d=qnap.com header.i=@qnap.com header.a=rsa-sha256 header.s=selector1 header.b=C6wMXmuF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.92
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023092.outbound.protection.outlook.com [40.107.44.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304EF606A321
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 10:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 304EF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qnap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qnap.com header.i=@qnap.com header.a=rsa-sha256 header.s=selector1 header.b=C6wMXmuF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCpv7uRDLzkqDvjgDHzPDMNkMgALNbN0R+vQaMC8ExY/tsk9LPx9Wj44tJ46GypUKQLIDdR50JaSIXjnZ90mG6zG/VuSU1rASpdtREjM1IRnd0jorZgvEY8zXC5UGLWE2s2vEA3FMdsHnX8tHGEsm4mK/f3+uNXvv/KSyVWylN8gqaaXXo3F6hjaP6FK4I2i5SJxXmxABXiTBbjA0DAZA8tGExvG04ItHeiEF63HN8lFrXRYczRn8BCKKVJADdRYV4naRcw1GdXv0j3davBGJ6jnpoBy+zo6I9DupvvDZLjkhEEzfDdSBtL7Va5nu31zv7KkQpIUF9Z9TUZ9aKTGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRsGWTHzGQLVNg9M0uKsKqcmXcpt98a1Qt0o2g9iMgk=;
 b=vit3JOcS3fNOIC+PfBGbUldO6AC7LYZ9bwO+Fu8hVnMUljjQPMJYhQyzNH51wjJwlgRzgknDJ7AuYV2ONVyjmB8+GBItJ4wQYNIE4tv2m5M9Uwexidpg9NMVpySZSyfA5aB7M1sTRwoUcZWWu44I59BZMNsoyYBpKTvTuudeV2poPJUebfWWQQZtBnDRHCXv4Bf0peRPRK5e07O8BcR4dkzY9n+UTdIoEaE0kX/U3FxwTvdLiBtQrx1GmI0afpt66/VI9aYaludbh3DMqJo1bjrFLlqErbzKF6CIoPoW75ajdLbcJnG6rI6wibfeGNmrYAHxbO8FEXVXrMCO//hwcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 122.147.219.42) smtp.rcpttodomain=gmail.com smtp.mailfrom=qnap.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=qnap.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRsGWTHzGQLVNg9M0uKsKqcmXcpt98a1Qt0o2g9iMgk=;
 b=C6wMXmuFBM1Y64p5HJ6mhAwZRx6Z2ojo2Wo5c23lMKbTFfoeiOwcssbkx2mHcr6irECeojJxojlPCcXsSvNp8ReGJY4ecgn9xzkp68efEDwewgOlCXhOty2UMQtd8AybbtM4aUYNhBweBi4J2/giAOtd+gqVW+TTynhfyI9Uhk5PaCpO08xIGpTK4+SlVdTBmVWPWwTkXrAW7J0HLYv4b5YJ7A05LCxBDKe+ILlPF3Qx1CGpR/tZK9SA19hVj2G7DAUULORTQOUuvgfESUmy6Bmub9U0CPzd03x6nd3m6n1RSzGE26Sp03B1678A82bmcGCFT6gpX7GOQCkULjJiMw==
Received: from SG2PR02CA0135.apcprd02.prod.outlook.com (2603:1096:4:188::23)
 by SEZPR04MB5970.apcprd04.prod.outlook.com (2603:1096:101:66::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:15:37 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:4:188:cafe::af) by SG2PR02CA0135.outlook.office365.com
 (2603:1096:4:188::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Fri, 30
 Oct 2026 10:15:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 122.147.219.42) smtp.mailfrom=qnap.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=qnap.com;
Received-SPF: Fail (protection.outlook.com: domain of qnap.com does not
 designate 122.147.219.42 as permitted sender)
 receiver=protection.outlook.com; client-ip=122.147.219.42;
 helo=mail19.qnap.com;
Received: from mail19.qnap.com (122.147.219.42) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Fri, 30 Oct 2026 10:15:37 +0000
Received: from localhost (unknown [172.17.22.73])
	by mail19.qnap.com (Postfix) with ESMTP id 8149035B;
	Fri, 30 Oct 2026 18:15:36 +0800 (CST)
From: Henry Tseng <henrytseng@qnap.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Henry Tseng <henrytseng@qnap.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] xhci: handshake timeout overrun and configure endpoint hang on device disconnect
Date: Fri, 30 Oct 2026 18:15:17 +0800
Message-ID: <20261030101518.35876-1-henrytseng@qnap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026101004.37f02f78.michal.pecio@gmail.com>
References: <20260930101752.15794-1-henrytseng@qnap.com> <20261002113012.271ceead.michal.pecio@gmail.com> <179136673328.386669.9410030239460428155@qnap.com> <20261008110642.56567a92.michal.pecio@gmail.com> <20261008102522.109308-1-henrytseng@qnap.com> <20261009173516.681681a6.michal.pecio@gmail.com> <20261016101141.42602-1-henrytseng@qnap.com> <20261026101004.37f02f78.michal.pecio@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|SEZPR04MB5970:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b4503cba-1566-42ae-25af-08df366ebdf9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|5023799004|11063799006|4143699003|56012099006|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|10067099003|55112099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+6u9DNQ70fOdjJWG91SBaYT9tVKQYLgru0Ojlu/oiROo28hYbvP78O+EuPTVpMzOIhWm2UrhFa+8A/erECdF2wKx7zFx/1bSKmnCdAL8dR9u+j90UFK4+/iqm1uyCrr9o+IoYrLKJRtq6bmtdilCh0iqFaXg1KbTNswc8VwVz9B132xCIYelt05K/p+ZTffCtx83cExzGiGPZM30xNZYbxfROBQxhfDTBkSOUPU5BgEHr2uHM/WeoDoDMgPqJ5KEMptHv4Mb7jzfhHAXDDaAZv9AfBFQAkD2iBal2Snq3q60kt5ANsr9lARIXTTu3lZkt1Pq+f1nnS6/G/oUsRVOvUK0MtTPguOaYpXOTTSU1Hr+Rg5g+S71ad0torzn0sNL6SNiC4n1IfkXJ2XHmaqfs+4yA8B1DE5bY3AY/tUm3gMKPB7Fw8cm9PjRJtGWfFxABKACq1Nn+wIr89joi0e9zQamRLwbIAQ1WNDzkUmPbDQPxlNJKi6EhGQqbNdHncIyOiXsBFTXKqVKpTmT/AjWFQgn4cbWBEO1CcpOUIA5g3p9tfywoarckMntJC4wFT9oU4VMax62tb/FzwWNlBaDEV+V7SRERwDiWn1WT3QNde//OJ7zEMXCO6rGqT6IpoSWALaMAwEiuxXsQQFNZdKKKzI0tGEebhTNz1nZkKh6e6DBJKIrOMleVEMmpQNzp/K83wpzZLrefl6xjPbljs8ezA==
X-Forefront-Antispam-Report:
	CIP:122.147.219.42;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail19.qnap.com;PTR:122-147-219-42.static.sparqnet.net;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(5023799004)(11063799006)(4143699003)(56012099006)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(55112099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I0svBNEs1Z7yzpYHTNhzkIES5S8ETr0kgQ5BM/7HhuLmTpny4chQUTGjysYVRpP4pkK70S3E3BI36Qewe3s48N6CDhjQRr67VKXuuprYRtvR8zbcSLgvRRSfIhYnQNLNBfKzFaksKz2QHP3vK1svYFR62Juugc8c8iloBsyTzl+/5gnih6Cloy+aslkup2uJGOnArHCE0nFMCM8P4AQCDcFbseQ5B0JWKolLAX8ZyaSh7frGwqYf63mxo/SY+K4QW65TcnUQpiNa8VFItnSLCCK9YIP3qUOJkeHHyH78qQQ0Okh9o1eZFw7Zm/e9mpoo9yKQ5Vx2ZoSXFZH12nPQdesA5UUibJBUyZnPJl7TUqVyfIQaigbfdsn7rCk9aeUCMI7J6L4BetJcE09hVywPMH++2dZ3E1Peee6k7R/ZO2pxxSb97A0iMMPWxyGamwJB
X-OriginatorOrg: qnap.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:15:37.0097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4503cba-1566-42ae-25af-08df366ebdf9
X-MS-Exchange-CrossTenant-Id: 6eba8807-6ef0-4e31-890c-a6ecfbb98568
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6eba8807-6ef0-4e31-890c-a6ecfbb98568;Ip=[122.147.219.42];Helo=[mail19.qnap.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB5970

Hi Michal,=0D
=0D
On Mon, 26 Oct 2026 10:10:04 +0100, Michal Pecio <michal.pecio@gmail.com> w=
rote:=0D
> On Fri, 16 Oct 2026 18:11:39 +0800, Henry Tseng wrote:=0D
> > Yes. I repeated it on v7.3-rc5 with 2-1.3 deconfigured first, so 2-1.3=
=0D
> > had nothing left to drop on disconnect and no command was issued for=0D
> > it. After the USB3 root port reported the disconnect, the configure=0D
> > endpoint command for 2-1.4.4 (slot 8) completed, and then the one for=0D
> > 2-1.4 (slot 6) got stuck.=0D
> =0D
> So there is something special about those hubs, but we have no idea=0D
> what it is and whether any workaround is possible. Using the DC flag=0D
> isn't helping either, and basically=0D
> =0D
> > I agree the kernel isn't doing anything wrong here. The idea of patch=0D
> > 2 is that when disable slot follows anyway, this configure endpoint=0D
> > command doesn't seem to be needed=0D
> =0D
> This may be the only option and I haven't noticed bad side-effects on=0D
> any of my HCs when Configure Endpoint is omitted before Disable Slot.=0D
>=0D
=0D
Thanks for testing that on your side.=0D
 =0D
> However,=0D
> =0D
> > > Maybe it helps to re-connect the device before abort begins?=0D
> > > This worked with Renesas :)=0D
> > =0D
> > The timing is a bit tricky to hit, but I gave it a few tries and the=0D
> > host was still declared dead every time.=0D
> =0D
> Should be quite easy, you have 5 seconds before the abort begins. But=0D
> this result isn't good, it suggests that your patch is prone to a race=0D
> condition: if the link disappears for a moment and comes back before=0D
> USB core calls xhci_check_bandwidth(), rhub_port->connected may already=0D
> be true again, the workaround won't fire and the HC will hang.=0D
> =0D
> We really need something that permanently "sticks" to all disconnected=0D
> udevs until they are reset or deleted, like the former VDEV_PORT_ERROR=0D
> flag which has been removed in v7.3.=0D
> =0D
> I have already suggested before that the previous solution was better,=0D
> but Mathias didn't seem interested in reworking this. But I think this=0D
> cannot be avoided in the long term, due to issue like here. Per-device=0D
> flags really are the right thing to do.=0D
> =0D
=0D
I tried replacing the roothub port check in patch 2 with a check of=0D
udev->state in xhci_check_bandwidth(), and it looks fine in my tests=0D
so far.=0D
=0D
 	xhci_dbg(xhci, "%s called for udev %p\n", __func__, udev);=0D
 	virt_dev =3D xhci->devs[udev->slot_id];=0D
+=0D
+	if (udev->state =3D=3D USB_STATE_NOTATTACHED)=0D
+		return -ENODEV;=0D
=0D
USB_STATE_NOTATTACHED seems a good fit for what you describe. When a=0D
USB device has been unplugged, usb_disconnect() sets it on the device=0D
and all its children at the start of the teardown, so it's already in=0D
place by the time the configure endpoint command would be issued. It's=0D
tracked per device, and once a device is in that state it can't change=0D
back, so a link that comes back after the unplug can't flip it. I'd=0D
like to go with it for v2.=0D
=0D
> > The only hub I have at hand is a 5 Gbps one (05e3:0612), so I tested=0D
> > with it between the root port and the enclosure. On v7.3-rc5,=0D
> > unplugging the enclosure from that hub doesn't hang, and all=0D
> > configure endpoint commands complete=0D
> =0D
> What happens if you disconnect the 5gbps hub with its children from=0D
> the root hub? If this fails, we obviously have a problem. If not, we=0D
> still won't know. If you think your customers are likely to use these=0D
> devices behind hubs, you may want to get a 10gbps one and try.=0D
> =0D
=0D
I got a 10 Gbps hub (05e3:0625) and tried it on v7.3-rc5. Unplugging=0D
the enclosure from the hub still doesn't hang, but disconnecting the=0D
hub together with the enclosure from the root port does. The stuck=0D
command is again the one dropping ep 0x83 of a 1c04:0018 hub inside=0D
the enclosure, 2-1.2.3 (slot 6) here.=0D
=0D
  [   59.162027] usb 2-1.2.3: new SuperSpeed Plus Gen 2x1 USB device number=
 4 using xhci_hcd=0D
  [   59.174788] usb 2-1.2.3: New USB device found, idVendor=3D1c04, idProd=
uct=3D0018, bcdDevice=3D94.01=0D
  ...=0D
  [   99.662478] xhci_hcd 0000:0c:00.3: Port change event, 2-1, id 5, ports=
c: 0x202a0=0D
  [   99.662702] usb 2-1: USB disconnect, device number 2=0D
  [   99.662721] usb 2-1.2.3: USB disconnect, device number 4=0D
  [   99.662937] xhci_hcd 0000:0c:00.3: Cancel URB 000000002114d18f, dev 1.=
2.3, ep 0x83, starting at offset 0xfe68d000=0D
  [   99.675129] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 6, new drop f=
lags =3D 0x80, new add flags =3D 0x0=0D
  [  105.027976] xhci_hcd 0000:0c:00.3: Command timeout, USBSTS: 0x00000010=
 PCD=0D
=0D
So the hang seems tied to the root port going away rather than to=0D
where the enclosure sits. The NOTATTACHED check handles this case as=0D
well, since usb_disconnect() marks the whole subtree.=0D
=0D
Thanks,=0D
Henry=0D
