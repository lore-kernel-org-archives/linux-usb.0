Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022108.outbound.protection.outlook.com [40.107.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA2A38E8A1
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145531; cv=fail; b=WpQGQnWxh9T+VCF0tYvjyIZtT9F8FBiAGpcX4yAXpCsGoHzcNDvP0YKNM7f3/lZ9u1K2fzqTEN2WGZ+ISUZdlYgp8WTWeveblvh8PqKSbwYhP8QWFIQTD41ixHIb4JGLwjz8rMT27MN5qH8YUBE6/xZDQNch12I6xcK+aOLzpc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145531; c=relaxed/simple;
	bh=WiGgjw96oNlu83LgOeS6SBSoHAwEtwb5LQdfZSRQvf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EDD+knICWtKhCnr2HhrYtW/P+rqMpLJBsjFZhkHjLaHwuvfKa5ND2x9BU8FFJ2PnHJ75HulBszw85JQ/uHloM2QPPvzyo8A8QNaFs0uURqXyfy9H9PRm04EvZzrzwme3zqAXf4E+PQDL+bvwnLxJSW+v/bJHCZiQZEYaKj942/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com; spf=pass smtp.mailfrom=qnap.com; dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b=qvF+PaHa; arc=fail smtp.client-ip=40.107.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qnap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b="qvF+PaHa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwGlONMV4qSDP7z3sYD7GfFpv+EAHypldyOGJUseshwNHbl6XFEbtLzSDBQIQbDMn01ZwbTOals1dEAo64ya7+cKwQ0QJkema/oxHzQ15qxUWs2J/TSTLPr/g7SXtK5eOVP74cF4OmAc2KFrYQgHliIKE+xnN/pIygBSgDlyr/hWdcEdvDoaWQhoPmU+oA8ajZ9RedwNGu+dDIs24C3xgd9q0vJ7UtEsscdA3NP4JoKtEMiz+WiRgaQ25ZRwvfGQPHmCkdKAUp5mmXiF1UId1VcDF9ttMWNMoxnmH//+u6Y7uU9cOmGMY18nsRc/FP9S8bAXHCPYWFIJSkS938QEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ivn8hEkqMAH4+sn5jm+NANWCnX2nkeAPj6G7M9n1mQ=;
 b=R8JOiS3cT1o09Hl6+MKzM7brK8c3vxyd9M/GIIZzdNNiVkZSr4IFXzz24o9kSti5B234pL0oitv3tCb3wkS6lp115N8QCLz6wsOGu53RPBx1MMqihcj4I5oEc+s5TO0ra0PEPNydHnLXgM6Y9CRf3jlDcseJSe4xO7v5YOYb/7mmlGBMoy38uO0biHV7MtZF0ZO27fdsxRVy2ixeZyI4p3feey5SI+gBasnWjxSJzJg9Xdmjdj/YlQ+ug351LX6EVaq/X5cZELUUtXuU23hRUdtsQr2OAm3Lkt022OaK4zxz8A6c8nyKO/8w5qXM5QstR23Eu4rqplTgVRztLxBmig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 122.147.219.42) smtp.rcpttodomain=gmail.com smtp.mailfrom=qnap.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=qnap.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ivn8hEkqMAH4+sn5jm+NANWCnX2nkeAPj6G7M9n1mQ=;
 b=qvF+PaHaJjVVeZU/Wcmc5xE0FpzjXmRM+t4AVnpalNyVsRGFlAzkxfVfpwNGmmwUVPsUT8KT1nil9afVecfbGTWrLmJowbzCa3LxNW0NEE99Su6WnkqI7LexiJZJi7NAMsGbEzlrCWujDQMl/RnQyHlUej5XJVYQnqUQ71TBehm7xEpPPt1j/L4J+EMFR1iGYYne2fKK2GxT7YgbSkdFthTp8hg42ykcN3EIqWVUk+kE5D7L5+3AeQVb+1uP/cA0OO9q8ngrFBN2fhypOGaCLrJYznI28kmCP7XCuNNBqWglnyRttgelRFIbtKSA3CIFLOSrR7P7wXe1CUyH5IvvQg==
Received: from SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) by
 TYSPR04MB7879.apcprd04.prod.outlook.com (2603:1096:405:89::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.14; Fri, 16 Oct 2026 10:12:04 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096::cafe:0:0:5e) by SG2P153CA0002.outlook.office365.com
 (2603:1096::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.2 via Frontend Transport; Fri, 16
 Oct 2026 10:12:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 122.147.219.42) smtp.mailfrom=qnap.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=qnap.com;
Received-SPF: Fail (protection.outlook.com: domain of qnap.com does not
 designate 122.147.219.42 as permitted sender)
 receiver=protection.outlook.com; client-ip=122.147.219.42;
 helo=mail19.qnap.com;
Received: from mail19.qnap.com (122.147.219.42) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Fri, 16 Oct 2026 10:12:03 +0000
Received: from localhost (unknown [172.17.22.73])
	by mail19.qnap.com (Postfix) with ESMTP id 87546148D;
	Fri, 16 Oct 2026 18:12:00 +0800 (CST)
From: Henry Tseng <henrytseng@qnap.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Henry Tseng <henrytseng@qnap.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] xhci: handshake timeout overrun and configure endpoint hang on device disconnect
Date: Fri, 16 Oct 2026 18:11:39 +0800
Message-ID: <20261016101141.42602-1-henrytseng@qnap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009173516.681681a6.michal.pecio@gmail.com>
References: <20260930101752.15794-1-henrytseng@qnap.com> <20261002113012.271ceead.michal.pecio@gmail.com> <179136673328.386669.9410030239460428155@qnap.com> <20261008110642.56567a92.michal.pecio@gmail.com> <20261008102522.109308-1-henrytseng@qnap.com> <20261009173516.681681a6.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|TYSPR04MB7879:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6a4a2b40-3c8a-4ac7-aa24-08df2b6deccf
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|6133799003|55112099003|22082099003|18002099003|260925021311599003|260925022911599003|260925021911599003|10067099003|3023799007|4143699003|261009223027099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	sfcG1vzQcczLfzWLCYBeEIbJxiaSLib+ctfHayPa+q+6ZnMAwbQHKtOZbo+PnslYiMSDSepiijYnTEiWDBJ4CAThltN5mdgXUZ7uPwr+G+/uyq9/pXrbWyTsyl8zQj56V7EtB8xF3iqTWbWdks62NBtB82jcv7Ym3jj7qSO+DitwE17bk4stU/qfzJIf0RAbDpCdPiXZZkpkiFkVswmxZfBR3/l5fuLYq2dGOC5KGVy3FFFFZuKi+dIHZ9FBSMRy5IkgCWR/1hV11WI1vFaHVkOq/gAK8UvFkP6GtbBtZGFJhUWITK0zoYE0QNTpU+S8niDBeNOGOxQzRdQyFT+NXKMJOoOkm6Eh9MVVLsAJ4pGCIplQlLcOzh5yG0WkPmVBC3TSKA9lYOgs7E7AIw1P866Bij9CeqqmGbz5YvvW7uZJd4zxlm7iMeGK8ie7MGymEsSw8ife6e6U6G81b4HEvfEMSiJNgC74GmW+mBP0ZPR1SMJkdVIwgMYJzDvecE54sxU9vYtDp5QmCgKjxtrDJCi5PIcxpL1dDlOsW3ltz6fAcEJEMYDWJEp0lERz2pbc8i5+eU5Vg2PSDM9C2b7aydXmhN//wH0edP0tttZdCdCf/FFf1m0E/AmkWltAorEpQ9wyeMd9vHBnGlVSrkPFbCSae71t3qjGsgElc92HCHXXjkWk+ZJyFMv7MZPwUirLMLO/M9FyMtu2P0ArRkuyKw==
X-Forefront-Antispam-Report:
	CIP:122.147.219.42;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail19.qnap.com;PTR:122-147-219-42.static.sparqnet.net;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(6133799003)(55112099003)(22082099003)(18002099003)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(3023799007)(4143699003)(261009223027099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	40oMKT9PrQAffMEF1ZwHCkVh7763dCWRg14u9NatqKFUlhbQljGddoR1y6+aZJwtyr4oDpIFYm8URAghUkloclrXeLNQwmKJXrqYiUDnZaAfLgrb2C4r2nFO+Wj1FOJsIG48SrWmZ9BFaQI1vHJ9jXYYsGuC+PJc5/e1Kt94IlRHZlXfrhUKRTeMLhHajo0R5MegmZQFGTRM6xML/mASYyp5sTpC1OcaN2KmKwzwHdRSdsqgEFs1MCC5QUHYwvQgpGa1Y9yGHyN5mhdyA8Qr6KkvBVvPHaX7oLWmU+ST1XQoKXGePmSGJ7EQg19ScKmhfnnAVrw83hZ4vUr8nY7FMNJRIYQ3/hUC2DURlNwO5aEHaGH2Lgtn5aJp95IukPl0NmBkoLBfC0pMKZkv8P/4iiZU8oHHWfobzC0CzIfOOt1MDcALzpcqMMuX6j1Ttjco
X-OriginatorOrg: qnap.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:12:03.3126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4a2b40-3c8a-4ac7-aa24-08df2b6deccf
X-MS-Exchange-CrossTenant-Id: 6eba8807-6ef0-4e31-890c-a6ecfbb98568
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6eba8807-6ef0-4e31-890c-a6ecfbb98568;Ip=[122.147.219.42];Helo=[mail19.qnap.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7879

Hi Michal,

On Fri, 9 Oct 2026 17:35:16 +0200, Michal Pecio <michal.pecio@gmail.com> wrote:
> On Thu,  8 Oct 2026 18:25:20 +0800, Henry Tseng wrote:
> > > Does it help to blacklist "uas" driver before connecting the whole
> > > tree? My guess at this point: probably not, it's not a streams bug.
> > >   
> > 
> > No, the host still dies.
> 
> > Deconfiguring 2-1.3 completes fine:
> > 
> >   [   87.929570] xhci_hcd 0000:0c:00.3: Cancel URB 0000000064a1e51d, dev 1.3, ep 0x83, starting at offset 0xfff49000
> >   [   87.929675] xhci_hcd 0000:0c:00.3: Stopped on Transfer TRB for slot 4 ep 6
> >   [   87.929756] xhci_hcd 0000:0c:00.3: Successful Set TR Deq Ptr cmd, deq = @fff49010
> >   [   87.930564] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 4, new drop flags = 0x80, new add flags = 0x0
> >   [   87.937756] xhci_hcd 0000:0c:00.3: Successful Endpoint Configure command
> > 
> > The host still dies on disconnection, but the stuck command is now the
> > configure endpoint dropping 0x83 of the 2-1.4 hub (slot 6):
> > 
> >   [  164.793408] usb 2-1: USB disconnect, device number 2
> >   [  164.793419] usb 2-1.3: USB disconnect, device number 3
> >   ...
> >   [  164.803390] usb 2-1.4: USB disconnect, device number 4
> >   ...
> >   [  164.834173] xhci_hcd 0000:0c:00.3: Cancel URB 000000009ac4b95a, dev 1.4, ep 0x83, starting at offset 0xfff15010
> >   [  164.834219] xhci_hcd 0000:0c:00.3: Stopped on Transfer TRB for slot 6 ep 6
> >   [  164.834819] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 6, new drop flags = 0x80, new add flags = 0x0
> >   [  170.058142] xhci_hcd 0000:0c:00.3: Command timeout, USBSTS: 0x00000010 PCD
> >   [  185.909602] xhci_hcd 0000:0c:00.3: Abort failed to stop command ring: -110
> >   [  185.921446] xhci_hcd 0000:0c:00.3: xHCI host controller not responding, assume dead
> 
> But 2-1.4.4 deconfigured successfully before 2-1.4 failed?
> Looks like there is something special about those hubs...
> 

Yes. I repeated it on v7.3-rc5 with 2-1.3 deconfigured first, so 2-1.3
had nothing left to drop on disconnect and no command was issued for
it. After the USB3 root port reported the disconnect, the configure
endpoint command for 2-1.4.4 (slot 8) completed, and then the one for
2-1.4 (slot 6) got stuck. The relevant lines are below.

  [  117.157549] xhci_hcd 0000:0c:00.3: Port change event, 2-1, id 5, portsc: 0xe0202a0
  [  117.157712] usb 2-1: USB disconnect, device number 2
  [  117.170395] usb 2-1.4: USB disconnect, device number 4
  [  117.170483] usb 2-1.4.4: USB disconnect, device number 5
  [  117.352819] xhci_hcd 0000:0c:00.3: drop ep 0x4, slot id 8, new drop flags = 0x198, new add flags = 0x0
  [  117.352827] xhci_hcd 0000:0c:00.3: xhci_check_bandwidth called for udev 000000000a3ed4fc
  [  117.352917] xhci_hcd 0000:0c:00.3: Successful Endpoint Configure command
  [  117.354934] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 6, new drop flags = 0x80, new add flags = 0x0
  [  117.354944] xhci_hcd 0000:0c:00.3: xhci_check_bandwidth called for udev 000000004aefaf78
  [  122.439248] xhci_hcd 0000:0c:00.3: Command timeout, USBSTS: 0x00000010 PCD

> The kernel doesn't seem to be doing anything wrong, just stops
> these endpoints (which don't even seem to be doing much) and
> tries to disable them. I'm only unsure why 2-1.3 seems not to
> be suspended despite having no children?
> 

I agree the kernel isn't doing anything wrong here. The idea of patch
2 is that when disable slot follows anyway, this configure endpoint
command doesn't seem to be needed, although the xHC certainly shouldn't
hang on it.

> Set TR Deq is omitted in the failing case above, but this isn't
> supposed to matter and kernels before 7.3 didn't omit it.
> 
> One thing coming to my mind is that the HW might expect the
> "deconfigure" flag to be set in the Configure Endpoint command
> under such circumstances. If you don't mind spending a few minutes
> more, please try the attached patch, and also before unplugging,
> 
>   echo 0 > /sys/bus/usb/devices/1-1/bConfigurationValue
>   echo 2-1.3:1.0 >/sys/bus/usb/drivers/hub/unbind
> 

With your patch applied and both commands run before unplugging, it
still hangs. The configure endpoint command for 2-1.3 (slot 4) was
issued with the deconfigure flag set and didn't complete. This kernel
also had patch 1 applied, which is why the abort took 5 s.

  [ 1094.491293] xhci_hcd 0000:0c:00.3: Port change event, 2-1, id 5, portsc: 0xe0202a0
  [ 1094.491641] usb 2-1: USB disconnect, device number 2
  [ 1094.491647] usb 2-1.3: USB disconnect, device number 3
  [ 1094.491996] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 4, new drop flags = 0x80, new add flags = 0x0
  [ 1094.492037] xhci_hcd 0000:0c:00.3: deconfigure slot 4
  [ 1099.851729] xhci_hcd 0000:0c:00.3: Command timeout, USBSTS: 0x00000010 PCD
  [ 1104.851768] xhci_hcd 0000:0c:00.3: Abort failed to stop command ring: -110
  [ 1104.863613] xhci_hcd 0000:0c:00.3: xHCI host controller not responding, assume dead

> But it's starting to look like your patch may be the only option.
> It's not out of spec and I've tested it on some HW today, none of
> it had any issues with disabling slots with enabled endpoints.
>
> This only works for disconnection from the root hub. Do you have
> any external (ideally at least USB 3.1 10gbps) hub to check if HC
> still hangs when you disconnect the same device from a hub?
> 

The only hub I have at hand is a 5 Gbps one (05e3:0612), so I tested
with it between the root port and the enclosure. On v7.3-rc5,
unplugging the enclosure from that hub doesn't hang, and all configure
endpoint commands complete, including the ones for the 1c04:0018 hubs.
I'm not sure whether 5 Gbps versus 10 Gbps makes a difference here.
If it would help, I can look for a 10 Gbps hub and repeat the test.

With patch 2 applied the result is the same. Patch 2 doesn't skip any
command there, since the root port stays connected and the connected
flag of its xhci_port stays set. All the commands are still issued and
complete. This is something I had overlooked, and it isn't what I had
in mind when writing patch 2. The subject also makes it sound like it
covers any disconnected device.

I'm not sure what the best way to handle this would be. One option is
to keep the roothub port check and just fix the commit message.
Another is to base the check on udev->state, which usb_disconnect()
sets to USB_STATE_NOTATTACHED before the configure endpoint command is
issued. If USB_STATE_NOTATTACHED is used as the condition, would it fit
better to check it in usb_hcd_alloc_bandwidth() in usb core? That
function already returns early for hosts without check_bandwidth, and
in tree only xhci implements it, so other hosts wouldn't be affected.

Any preference on which direction to take?

> Maybe it helps to re-connect the device before abort begins?
> This worked with Renesas :)
> 

The timing is a bit tricky to hit, but I gave it a few tries and the
host was still declared dead every time.

Thanks,
Henry
