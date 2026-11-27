Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.125
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774666;
	b=OFb+vCwzCPXFM6kj26K8IzfDC37/+01WUKo04YYz7/cht2EDWWVToo2Y5tNTCHEu9bQE
	 CBbvZ38euCmniBz7uD5B8FD8Avj4lMOOKP6JIi3gUntBMC0yNOvSw9d0HehOJCgf/mgnP
	 n3Klt9AGCncZ5Pn3fBfp7JjVdOXwDVFJVfryvKUQoaI28KVxoh9xuMgXnW1kFkDVJiNFq
	 dMEshXPDnM/bovatYkmMVGIScnXK1efEncVtXYG8Yor/gLG5KfVIJsYpkgyMhJ8FjCBxa
	 3m8SWh6gA8/IrdbJUL+QdqVa6N+GxqF0CGBkSWSDGmENfFngjOrcey1YtcvaBYkenfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774666;
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
	bh=rxpEN5zqbwBnn9NakPMrDdvJPdwZh7r8M+VDsV+KCjk=;
	b=aLJWLcGaJEXSY3I7TUteVUjxc102U5QQoCYMA9SOS9AxnYfhCU6zIGcs9AgQsKG47FF4
	 /KWsmffR6xu0wkbiV/9d+NyNFYVrO7fc2TyqAvD4RUg6qHp662BMwUXyFOa2DBLrJ22F1
	 bWG9sVR5mwyOXO/LwZi1JnqBY9IhY74CJBNOqUOl4Ya9uWzm2s2FGjaaFoP4v6uABDEgf
	 RzFcGEc+T9Nt9so+ClnSqkDKrBjFhSWe4Rzdp2riQ64YK+KyNZn7ZepA5kkbstLRHbHcJ
	 vfoEajBNEastVhD/iwC2sTHkvC5BJvS3cRSfUiRzLC+r3g6YhjBVI1l6XPPoY8xsm3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qnap.com;
	spf=pass smtp.mailfrom=qnap.com;
	dkim=pass header.d=qnap.com header.i=@qnap.com header.a=rsa-sha256 header.s=selector1 header.b=kIq+yg8C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.125
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022125.outbound.protection.outlook.com [52.101.126.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70388606A31E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 10:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70388606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qnap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qnap.com header.i=@qnap.com header.a=rsa-sha256 header.s=selector1 header.b=kIq+yg8C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KObAIh3yhjneesybQ3YUXdWj2fWbtu6Z8sJYjHjVIMoAE+k0XDbHlaqBkxj+Rpp5fQHi2ZyZrcC2/NWy57nx68yFg+ElIuPhj9lSZsxxw2phBev+0uRAnMGZ2pr+q/6qQaa9WuKMnMYXmUJQHG6MJNdszxa8jYYneOJkh1I9vRXCHXly1KHGr0gv58LQg3Rh3DkO6BVogKxK1iRrrrUOZLSS51TJoe0yjegeSaSUEK4gwD6mgGdkKm9geg1y7nnITutGaRt6zlNUjnM2pb7UICkSUG4QuVaqkxb71Z97108fKB+kBs0N9sJQwBv76Yj7xuU/Pg7oQBeylckNoUeDWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxpEN5zqbwBnn9NakPMrDdvJPdwZh7r8M+VDsV+KCjk=;
 b=UA9zuhmObXzMB24gXNL5CrbCEMorQR7Rw/jPm6SYKUQ1tOyr+9nA3oZkN58F9E/cACX6e9ztOEGM3B2l0mvr9W/ynNSC8FYtHdOBVCXGGMcd9AxNnZu1ZaJ98mEj2/Y/h4e8IXUN3sD18QO4ihZAMhwxvTFmXnKC1HkPcrU1hTY/bDIv0J4nH5Y/aEc415WcE6eUxg8siejpktkM+xuzL+qcqO7VYBLmA9piDkGb72M9tWk4EPZ76L7E+SXUwU7BhsW7S05ka5FpprWxT7XZYR/ojIHTShH2uY/WXa8M1qRejaoI5O1NfMVK+CwqieYXdZddbT1Rf5FDGMzzcevPpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 122.147.219.42) smtp.rcpttodomain=gmail.com smtp.mailfrom=qnap.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=qnap.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxpEN5zqbwBnn9NakPMrDdvJPdwZh7r8M+VDsV+KCjk=;
 b=kIq+yg8CC+88/+qxFnynX307hfMwz2vtrpwuTczxRtUT/w4+WuxjuR062dt9zMtw08u2y7m1kRH2kwPoR3UoSaUY6guIEpqYz9Z+E0WsPrjSTlXYBpm5ozCcMGat1LNz4oPSrO6obLmKW6KxPMQsGvx1o4wpnhljZpAnxnLJKy2VUfHDATxBk5zxSBtI6LtohoZxGz7R9h3AHEuG8BeOf0R5/ny0bnxRHE9MnRTKqON9vbE4mpST103ASJypKn4O5sa/ljoxMTDmubbjAITYdmb2Z+puk/LcRHMBEUtikXrp++LHjS1dC4UHo6M1zuu1arsl6J2u+9LrtmiuT5TFTA==
Received: from SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) by SG2PR04MB5794.apcprd04.prod.outlook.com
 (2603:1096:4:1d9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 10:17:41 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::13) by SI2PR01CA0005.outlook.office365.com
 (2603:1096:4:191::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 10:17:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 122.147.219.42) smtp.mailfrom=qnap.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=qnap.com;
Received-SPF: Fail (protection.outlook.com: domain of qnap.com does not
 designate 122.147.219.42 as permitted sender)
 receiver=protection.outlook.com; client-ip=122.147.219.42;
 helo=mail19.qnap.com;
Received: from mail19.qnap.com (122.147.219.42) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Fri, 27 Nov 2026 10:17:41 +0000
Received: from localhost (unknown [172.17.22.73])
	by mail19.qnap.com (Postfix) with ESMTP id C09D0B3;
	Fri, 27 Nov 2026 18:17:40 +0800 (CST)
From: Henry Tseng <henrytseng@qnap.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Henry Tseng <henrytseng@qnap.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] xhci: handshake timeout overrun and configure endpoint hang on device disconnect
Date: Fri, 27 Nov 2026 18:17:21 +0800
Message-ID: <20261127101730.70717-1-henrytseng@qnap.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|SG2PR04MB5794:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9de53267-d1c3-4f41-d449-08df4c6fab95
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|6133799003|18002099003|55112099003|22082099003|10067099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261022105027099003|261026121527099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	BCDjPygRUzaSD7aip5oktkYLwDDLBRQhaynIawp2BOiZK4WbmrdplWB17yOIupBeF6D58PB7MZKSByaQ0gklw4JOLYLml3YyLSKb705C/D4+RvgagQdk9ejurWZ/r5A3oG8aR4b9k1yOyapumv5v8leVQgR59MlOpao6I0ZeCn0nWfn884yrKX24inVICgp58G8w3TLLIjlhjRYnKhrP0xpQ2CcabXwhsD9MSdS0mP7m4++4rM1D8lyFoiCAeNSrr5bnBy4FoiBtYiF6mpqCMd6Y5qAFV6YfM8zCFzfHerxzKkUShXLzcz+nqfPQl8Xyj2SVOzL5HEO33dN3i0kcHxDb61TARHoxwn7WWwdQ/Clr6PTvZUHU14Gg9sfdWyIVk86osFhO6HFleyMajcJuaj68FpugsFadt9DcbMCHL9IiwoEGtWqCHzOJBIyADh+OzqlxId0R4FA3Z+7ig0aE8MTdp7pp6OCe8Rc5dqX+vNCqAaBWDiValiy6l/PvHwsHxlzXI3DuS8J8w2ApUVB+KtGCaHAlOnc3W/rrkOQA6XdzSDHyz4K205OQ12q5z1knDkq/Wq+tGgTeF0+7M86oBoYxDTJGVOQ40LVNwqnhuwJXWuywQAY2DdaHJ+2OjpHScOmu9OPUqgthrZHWZ+cW/oqztNfTsDxJfzpCLKEE1IXFiwuhgauOE2AQs7jS33HaklHxthgMivG9XPYzII9A4A==
X-Forefront-Antispam-Report:
	CIP:122.147.219.42;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail19.qnap.com;PTR:122-147-219-42.static.sparqnet.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(6133799003)(18002099003)(55112099003)(22082099003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261022105027099003)(261026121527099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4p2eVDlDr2KCUXlOWHIb1aFUG+nBTu+6S6N0i1L5+d0x/ycJSSLVSZmE3pnX/ouvUR/T1fXdOkQuOv5J3+CY5PHr6Y9Lyof+dj6bAwZ9lYk5YR55fGjCWx9Pr3daglUYuxfBoC3imKUnFmJWcLNW+fm0fo5kXrp7Of8qgCEj57WTA8f/adoLGkUoDkUgImCjDyiajNQbFHrTs5/ECstL+SWb84dU6MgJma0tYWz4vgZV74qZZqSTXAg96XX2Nes4LH9wzdcQA5FnsMwI630i7LKnPIku9adUxRkrQcYG5lH9C9y5jnPvAqtokEUVQ2p7Xz6lvquNmAvkzajTSpSUGgOHxRLlDT9o+p4A7omKiF7uWfqPt30sYuSWd6+9QLFsj2hRXdLkaazPiz6RIOmF54oHUzz0jmDEIDbXF/8YTL1sFIJIrFTf7G6YfgDxyOuI
X-OriginatorOrg: qnap.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:17:41.2362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de53267-d1c3-4f41-d449-08df4c6fab95
X-MS-Exchange-CrossTenant-Id: 6eba8807-6ef0-4e31-890c-a6ecfbb98568
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6eba8807-6ef0-4e31-890c-a6ecfbb98568;Ip=[122.147.219.42];Helo=[mail19.qnap.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB5794

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
=0D
Hi Mathias,=0D
=0D
Gentle ping on this series. A short summary, since the thread got long:=0D
=0D
On an AMD Raven xHCI (1022:15e0), unplugging a QNAP TL-D800C enclosure=0D
leaves the Configure Endpoint command that drops a hub's endpoints=0D
during teardown incomplete. The command ring abort then fails and the=0D
host is declared dead, taking down devices on other root ports too.=0D
It only happens when the command is issued after the root port=0D
disconnect, deconfiguring the same hubs while still connected works.=0D
=0D
Since Disable Slot follows right after and disables all endpoints of=0D
the slot anyway (xHCI 4.8.3), the idea is to skip this Configure=0D
Endpoint for disconnected devices. Michal saw no side effects on his=0D
hosts when it is omitted before Disable Slot.=0D
=0D
v1 decided this from the roothub port state, but as Michal pointed=0D
out, that can miss the case where the link comes back before=0D
xhci_check_bandwidth() runs. For v2 I'd like to check=0D
udev->state =3D=3D USB_STATE_NOTATTACHED instead. usb_disconnect() sets=0D
it on the device and its children before the command is issued, and=0D
it doesn't change back.=0D
=0D
Would that work for you, and if so, would you prefer the check in=0D
xhci_check_bandwidth() or in usb_hcd_alloc_bandwidth() in USB core?=0D
=0D
Thanks,=0D
Henry=0D
