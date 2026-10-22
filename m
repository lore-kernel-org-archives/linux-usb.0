Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.130
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792663454;
	b=Z7grmNBDvAjyJnBXX+LXxzPv49F3P0vGWZufcMyxbpEUZlvhBoXqpIEPhTEaCXv4mN8m
	 UCc+IqvVeGxzN8Xw345EkrjwEmlGhRQobOYBfrQl//Wy2reqIV17TedfHKU4BNUSqyzoa
	 U5mKLbKGOHhIA/Acqia8jWMSxlaf+PbXgPl0+26Dza4SAEmkeRAgIdRIgun1FM/5tOz96
	 sITWT1kYZNdIU5KzklkMkKFEmdQVCsF14vA0cfamYEqC+Y5/fb2W8olAZ3114do3ahU3W
	 wh8Ya7mqvEuGcB8kiPGWHxvhaH1khwfoMdxy/LpUvzDFvG+P98ngQcFa/KqsL4XLtQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663454;
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
	bh=Gjznw3OblmNnxBjccwMMrEuSiw3uibuEBJm9ZzMHYPo=;
	b=eUtzcmmdjXbcQ+rIYdo0WvhrvxwlkGPBC+Hr/NogyrRJmbsobn4xZ+D6+VRROICbzQPF
	 oIo9mk8pfkbWDyHsPUV9ReLboonu68j0eKq9KtPPRhuY05Cgwubx7oclaZs7zLd0Q5hVU
	 hwmKxFS+gToFe0xNmJgNpZQQQOKWx0WQ6sCGVeW0F8SC1jj0+4jultADno5ENLUb57tp9
	 Q/Q31ylTV/xDvdG/gVez8kOsP9PkJztBDLOTCypciFoJTMxJ7YkjK7BVpPdBdFY3P1pDQ
	 Q3Vc6URK9TrnJql7hTqYQTqlPnRW4+CbWGsmOer9Plx9xiqcwPkPjX4KydbY3SxoEYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qnap.com;
	spf=pass smtp.mailfrom=qnap.com;
	dkim=pass header.d=qnap.com header.i=@qnap.com header.a=rsa-sha256 header.s=selector1 header.b=GoKX13Fo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.130
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022130.outbound.protection.outlook.com [52.101.126.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6329606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 10:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6329606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qnap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qnap.com header.i=@qnap.com header.a=rsa-sha256 header.s=selector1 header.b=GoKX13Fo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cx0fEYkRWIjub01+JR7ik7ME1V68bQABmwdoVkB7HMJit8e1hvkFd8CuDDRrtXwP/dWOsLRYAeO/BYqjP7/4IXIV6EU+Ow1y1ovNLjEJSwZh3ph11ZJ/RLL8pu0FfGQ+HxqMdM6+XjEatyKt9Vi3/ZAmUeTQew1UAzwxNkFXdGtO6pbA7fHIO8hToFmnTPNLZya8FYZSPQ/FEMVPRT3YfgnRquWQlV4fc7B9/aANWEdFXMNgVPFUmh6cVZgx6vXg/oZsnVp3S1Ag/RVDpzoN3bgK96v0tSKZ+HnNP/1OxKSkSMcg0up2gXyQVtdDucouC1M1QmFt4w5ZLdCucf5bNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gjznw3OblmNnxBjccwMMrEuSiw3uibuEBJm9ZzMHYPo=;
 b=AgEE/NRi/0d7FlMgVaSBpoEYReNXFsLQGqwxBNbb5ker5Za+bnQyl7qfo8erOqVl79RKhtj5n3BkZyrDBieJQky5olZFer3rxAyf1rj9/cRckoU1tT/5YhidBAmhDese4LSl8FO7POM7MQvUHgGRmZmIUFf8AINbQ58QA3Hba8yOTCbBZNyrqbJVidP1JVH/sXDyuvxJG2lwIdi/sNHlXc3SJTVBaPIkFY6/WEFyPgs1QZPQAmV/PquQz7EuqCUB5ggyvjcJJmsZ2mHvuleS6KqM7fm8kwtARuRYxH9iG1I//DpjNvuP//ToiALsivVQuHNYLH2dUTMxdskc/9Ltdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 122.147.219.42) smtp.rcpttodomain=gmail.com smtp.mailfrom=qnap.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=qnap.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gjznw3OblmNnxBjccwMMrEuSiw3uibuEBJm9ZzMHYPo=;
 b=GoKX13Foxfi/oz969Cw1j5UvUy8dkXdVBGrFUcA2Ky22iUNYsa0Gk07/f5/NCxTNhcfef+JwmEevx1gfE50F4lNaQgjSuxxu8ELqEC9ej7Q7IAv/rOP/fedVXxsMChoETCetK0IOT31RsFV9FIjdKHAbIErnpTe2oET6zC8ZOwDc7ZUOKTakBhy1uVMgByKIe6LRfcLX8FzSU42y8mrLHafBbVzUXS8Ary2M577PYiVXHQD3x7+L2RiybAp8WNkAaAaVSHTNqRnynfRYLno1HRjZ4+lbWKwHZnUNDZcSEp9ZfEIHdFGqFpBGGUiJMDR3MNWZI9+PWvdOP9MoHisGLA==
Received: from SI2PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::20) by PUZPR04MB6314.apcprd04.prod.outlook.com
 (2603:1096:301:fe::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 10:04:08 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::6a) by SI2PR01CA0038.outlook.office365.com
 (2603:1096:4:193::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 10:04:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 122.147.219.42) smtp.mailfrom=qnap.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=qnap.com;
Received-SPF: Fail (protection.outlook.com: domain of qnap.com does not
 designate 122.147.219.42 as permitted sender)
 receiver=protection.outlook.com; client-ip=122.147.219.42;
 helo=mail19.qnap.com;
Received: from mail19.qnap.com (122.147.219.42) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Thu, 22 Oct 2026 10:04:07 +0000
Received: from localhost (unknown [172.17.22.73])
	by mail19.qnap.com (Postfix) with ESMTP id CC789355;
	Thu, 22 Oct 2026 18:04:04 +0800 (CST)
From: Henry Tseng <henrytseng@qnap.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Henry Tseng <henrytseng@qnap.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] xhci: handshake timeout overrun and configure endpoint hang on device disconnect
Date: Thu, 22 Oct 2026 18:03:48 +0800
Message-ID: <20261022100350.616011-1-henrytseng@qnap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930101752.15794-1-henrytseng@qnap.com>
References: <20260930101752.15794-1-henrytseng@qnap.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|PUZPR04MB6314:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7fd8a3e7-f595-44fa-46c3-08df3023cfe9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|10067099003|22082099003|18002099003|55112099003|261021121427099003|13003099007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	w96zH0Ottk6TmZ3aB2kJoUcUGrkNY/TD/bpZJ3VOu9wYjmhDUCfTneGtcM+aRsvjrpIcxvXwMO5IkUdB50Hb5HS5jZx31ttRFOsHPx2Ccjp75NOe7R9pJK57NdY/I0MxKafU1C/DjSy+MqqVYDc4Oi1MB4WJ3/KzZZzmqIz8pX6DuLiDALrp6s0I8xeX+JOvas9gGiYQdab2S89jKQF/xx85dr1ugyp+ZXG5thuAantUF41GYswkNON9IvLocsk3+lNdxpb3FpKw63pO65QoveFeEQC/eaHB1xhHfg7sSIsJU8nsShSnSakV9WM2gUQ/jBWWuJnxVdaajZQHBKRkDEcbPBD43+b4A8EaX/JDozaKEfLALNMZ5iwj4T+0YUWBYhNKA1FBY7D1DYA4pCvfMJ/l0Of4PlKpyE/YSdlFIfrbN11ifq0J5I0IJba+w1ztU16i6VJHqDGZx72BwqgGvt2gIc+2X/EK5W/vGrsPPq60MaFdOVWy49K8QzVkiSDWcBjYbSKDoH+IA8l3xSttvGuSUa5bczCwinA3UQ0i3GzZMb//+Xs3W2qO+tvwDeF5YhZl61ijdUi+p84HiKHzcgsFppO6vYBPnQg0f712wAwsQdP0JKAPLkIuyHaw4e3NS1MWqEtebtwGEN2inXKdaw==
X-Forefront-Antispam-Report:
	CIP:122.147.219.42;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail19.qnap.com;PTR:122-147-219-42.static.sparqnet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(10067099003)(22082099003)(18002099003)(55112099003)(261021121427099003)(13003099007)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oNknhaKKCKGV2VBXJVblWZCD/Sq17Pgh3m0qK/4EI9myBsFPTnRcFH8K55bt3A+KokKL+hxhDVZFr8enovlTUfPMNBdA3zgMC0EY+9Vtf1aQKMf115r2aC2bxEXmybpUf3xbKs3UBMaJCCMOLUR11CRlWb34KqiUtx737C47yGhz2EDDdZMj88Tn+BO0HQ+1+1MVrya+c2vpYIrlK34nupPXPvpkEqe4WVVDjP2XKhhV5ayk2c23VL9wJM307RCX5AzDLMmr4qoy1hjuoJHKR3YEebkFQgkDDsnotJQ9Qdt0an9MWPxyoBx3YVPN7/BR69NLfp0/tAbbgMbR1fXk0EjFDQtqRQOQIP46p4PBxD2nZUaty4U56wjem7ZJFAA5hfK1ZBW33ZSw3NL9kQrTfgW1k1yJ9D+xq/TGeWThaM7FJiAJ1G+3dVsP6ph8HDnc
X-OriginatorOrg: qnap.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 10:04:07.8726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd8a3e7-f595-44fa-46c3-08df3023cfe9
X-MS-Exchange-CrossTenant-Id: 6eba8807-6ef0-4e31-890c-a6ecfbb98568
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6eba8807-6ef0-4e31-890c-a6ecfbb98568;Ip=[122.147.219.42];Helo=[mail19.qnap.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6314

On Wed, 30 Sep 2026 18:17:50 +0800, Henry Tseng <henrytseng@qnap.com> wrote=
:=0D
> This series addresses two problems found while debugging an AMD Raven=0D
> USB 3.1 xHCI (1022:15e0) that gets declared dead when a USB storage=0D
> enclosure is unplugged. During teardown a command fails to complete,=0D
> aborting the command ring also fails, and the whole host is declared=0D
> dead, taking unrelated devices on other root ports down with it:=0D
> =0D
>   xhci_hcd 0000:0c:00.3: Command timeout, USBSTS: 0x00000010 PCD=0D
>   xhci_hcd 0000:0c:00.3: Abort command ring=0D
>   xhci_hcd 0000:0c:00.3: Abort failed to stop command ring: -110=0D
>   xhci_hcd 0000:0c:00.3: xHCI host controller not responding, assume dead=
=0D
> =0D
> Reproduced on mainline v7.3-rc5:=0D
> =0D
>   CPU:        AMD Ryzen Embedded V1500B=0D
>   xHCI:       AMD Raven USB 3.1, 0000:0c:00.3 [1022:15e0]=0D
>   Enclosure:  QNAP TL-D800C=0D
> =0D
> I have only seen this with this enclosure on this controller. Other USB=0D
> devices unplug cleanly from the same host, and this enclosure unplugs=0D
> cleanly from a Meteor Lake-P xHCI. Similar messages were reported in=0D
> [1][2] without a resolution. I could not confirm the same command was=0D
> involved.=0D
> =0D
> Patch 2 fixes the host death on disconnect. The command that never=0D
> completed is a configure endpoint command issued during teardown of a=0D
> device behind the disconnected root port, right before disable slot for=0D
> the same slot. Skip it when the roothub port is gone, as=0D
> xhci_check_bandwidth() already does when the host is being removed.=0D
> =0D
> Patch 1 is an independent handshake overrun noticed during the same=0D
> debugging, and does not fix the disconnect hang on its own. The command=0D
> abort handshake has a 5 s timeout but took 15.8 s with interrupts=0D
> disabled. This is not specific to this controller. When forced to time=0D
> out, a 10 s xhci_handshake() returns after 19.1 s on Alder Lake-S and=0D
> 17.2 s on Meteor Lake-P. With patch 1 applied it returns after 10 s on=0D
> both.=0D
> =0D
> [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1857385=0D
> [2] https://marc.info/?l=3Dlinux-usb&m=3D155120372130870&w=3D2=0D
> =0D
=0D
Hi Mathias,=0D
=0D
Gentle ping. Before sending a v2 I'd like your opinion on two things.=0D
=0D
For patch 2, the roothub port check only skips the command for devices=0D
directly behind a disconnected root port, not for anything disconnected=0D
further down, so the subject oversells it. I could keep the check and=0D
fix the description, or check udev->state =3D=3D USB_STATE_NOTATTACHED=0D
instead. If it's the latter, would you rather have it in=0D
xhci_check_bandwidth(), or is usb_hcd_alloc_bandwidth() a better place?=0D
=0D
For patch 1, Michal's patch takes care of the abort case by dropping=0D
the lock, but xhci_handshake() still runs 1.7-1.9x past its timeout=0D
on the Intel hosts I tried. Do you think that's worth fixing?=0D
=0D
More details are in my last reply to Michal:=0D
https://lore.kernel.org/linux-usb/20261016101141.42602-1-henrytseng@qnap.co=
m/=0D
=0D
Thanks,=0D
Henry=0D
