Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022093.outbound.protection.outlook.com [40.107.75.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFB53CF1E3
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 10:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516567; cv=fail; b=VFFt61E2p8k8EvLnE9OML/44bYvLl6NrMNPbg/UKxc6D4aZ4c654P+VVaNEIDOWyZm0FNdPDZ9l8iOxtfEIV7aKM/p9EW+Xg6ffnr/T00Z5r7qZBZTPbnNTl/JQF2scGm8t6H5oHqjrBi/B+Mxnve6rC6JmNbDWfWoQ5vzONx/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516567; c=relaxed/simple;
	bh=SQbJLJvOqpn4JMJOcGZm16w/2wX1xqxkwZUrvB/+0Qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=atv7bq+lNMMaAz7Ryc5indzthE2jrB+UOdqgsT4+k+3ynoVBtB2EOQdINOLfGJ5KlUSEe4zqypmVNZiO9wauHuw4n5O5Ka9WLeKFmOVtFJAIo8Z/V1fOeud1qQuGL5tc4On7loYy9dj2WockT0tohqwli8ePpHMRHyOCzM4pTaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com; spf=pass smtp.mailfrom=qnap.com; dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b=dw7VhTX1; arc=fail smtp.client-ip=40.107.75.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qnap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b="dw7VhTX1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JG2WWbyY8u1mOki+Ww2zH+1y0rtcxtisidH9HldLnySCyBEJvvaQrZ6UtLqASf5OctmewRVpfux2eTHDGKXEqal+orqC3Ln4Edn6vywnxlGue0HB5Gc3CRmKimTMiTa0Q4Xy8SAMhmH4KAhwDdc2n2QI4+kd37+VGywyMg0PNS84md0JRVm9PfDp42aOOVYk6iNUR8yY7HO9Om+3/x45swlhJl/6GnZRsx+9F1hPtv8KMV4yfBwOzT9JzuR1M5x6SJ3a9iA9otQht2jDtyVpZcT6Hul5kkE7Out5RRx9O5+KBCR4PTBPmdP2NJpAQU23Bz2esnWsJoVmDF5AJFx9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWQZjIEmlyO2UmTsFtrB8FzbXfAA73Fpx+dxuz/B9ec=;
 b=ATBkDCnlaN4xIdgsieCD3BKZGBDMC2rQb/BEsoHSaJ+cfVjm50NgpxhwkZzhJ88VEDqv2OzN/AoxNR4/sZrc4rhDqsLnafOsNotzaN1903cqMM14jm1yDSNLbldWNBy0vk1IJ7nspsd+EQm5Ly7BN440OSvSS90a82cqwGlNYndRTIYlL81soByJ6T1OT/84UbvVz7JPXTXZ6nEuGI7PYeeP33mjZcdqxKKpx+rzSUwQ93k4NSXkZr+6r5ULB0en8nZpS/qtQfJBJoLV1yL38wqIJKr0KZyrmouMNPG0Dd5Qtn5lvT8X8ir8xsj0sxSoe/yxpNmGudazOx+KQO8HEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 122.147.219.42) smtp.rcpttodomain=gmail.com smtp.mailfrom=qnap.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=qnap.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWQZjIEmlyO2UmTsFtrB8FzbXfAA73Fpx+dxuz/B9ec=;
 b=dw7VhTX14dXiumUeySbn7cRlv8pkOTMQpFqyUwOy2Z58KPetoiO2FuyPIY65dOC1g/Mc6YXUbIuYqgsbvEpdiua0RKGouSux6outbnUX9zSujyGnryvCJRaq8sp4MAa8KFv/V5pY2HeNSgHu4qOCKMNP6UC8AHukOBgaiECf2U28YL0zKJAnKHNcHez5RcC2xQvWF4HjNfUtze/bIBH4DrxYKMnW6rXMmF6aPEBSjet/4hNI0v7sAc29c+C1IuvRFLNEmzN6bGvI8C82wOWRdXwcSn5l/TLO7JM/EYAw6L/Xe7J/7wzDYeZlkXdqvackEz/0U0t66i8kOtSrZLyp8g==
Received: from JH0PR01CA0115.apcprd01.prod.exchangelabs.com
 (2603:1096:990:59::6) by SEZPR04MB7498.apcprd04.prod.outlook.com
 (2603:1096:101:1f5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 10:09:17 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:990:59:cafe::8e) by JH0PR01CA0115.outlook.office365.com
 (2603:1096:990:59::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 10:09:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 122.147.219.42)
 smtp.mailfrom=qnap.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=qnap.com;
Received-SPF: Fail (protection.outlook.com: domain of qnap.com does not
 designate 122.147.219.42 as permitted sender)
 receiver=protection.outlook.com; client-ip=122.147.219.42;
 helo=mail19.qnap.com;
Received: from mail19.qnap.com (122.147.219.42) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 10:09:16 +0000
Received: from localhost (unknown [172.17.22.73])
	by mail19.qnap.com (Postfix) with ESMTP id CC19FB3;
	Fri,  4 Sep 2026 18:09:15 +0800 (CST)
From: Henry Tseng <henrytseng@qnap.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Henry Tseng <henrytseng@qnap.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: return an error if the host is not halted
Date: Fri,  4 Sep 2026 18:08:17 +0800
Message-ID: <20260904100818.6752-1-henrytseng@qnap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902135016.19d4c3fa.michal.pecio@gmail.com>
References: <20260902101510.30246-1-henrytseng@qnap.com> <20260902135016.19d4c3fa.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|SEZPR04MB7498:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1b974397-9e49-4520-74b2-08df0a6c93f4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|10067099003|22082099003|55112099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	j/Z3HVTsaTJl2kmok2MTUSwwEv4itXk4WFqxeVXlyTLMeMR9FQ7J6kI9oRSXY/StUC/aKu0rbOSvQu6MckWFViCERYKDqWg0YIgO9a/doS7oSpt38O1begVcxaUyJsIE8dff4XMUrbCaz8vHu67YZqB8pjZTWpwTd5Gt6KI33kpblWopWRr0NeoOYfWoHxhn+mbC0eoDZFVOVVG8PX6T1Jt9zGlUxhko/z5DX5c3kGkz6kzb86NOFhzJs0kwfD6zDVOksHlPetYLydBjYGSULrQkiTVsFWIWtOyBmJ0qE5istGS86XDvUGI/tjTVJV19Fitaz/yvqE5M0K+q96uSLh5ngnb1bCGallin3SP2gakG/SUwGuBx3dIemm2HB04jbuS/1Ryh7/dyHfi91mnVeA0jfujH1YIVy1Qmu/8IiT+OOmXT2PJYzO2CeUEYhCbkJOOaAxvlIzQEuekMUW5vVM63tKkGi1N4IqxXTIeSFJtyyscP5HKdx78+nwLuD+ba5ds7sva2UM3ryrsSlMuuTAfATcrskNYQu31uuwU6co0aEG0qcaE9ID1i4Y2lsp03UH4NoP3Dw7JH0BgNIjIwKyJGudkDJX1MgdJG4cPUo9jn/mzLSiiPcjYLOxXgdsU31K8Qxb7Pklex/0CiCLrBr8KYYJD9eBCnz5LnNPRGBQxzKYgwP5Zf4wP++iaP5VBpm3sLlSmfYZP5QBruLC4o+w==
X-Forefront-Antispam-Report:
	CIP:122.147.219.42;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail19.qnap.com;PTR:122-147-219-42.static.sparqnet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(10067099003)(22082099003)(55112099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AspSWGI/jJbuVfMfrZsQUvB2464JvnX047zFxoOPY/sLbtGGMOfwJqk/h0ZmlPpri5DC+Ecme13xK0HOhJlMKys740tvY5d5/bAt1wKg/JRa8kU2iZDscEvCyHxSgd2v4VZy/QCq+jkxg0FynnPo/9OMdFesoEYze/k9kJ13jmC6/y1bVQp9x6svoahW198D74sQnTeLfyQc0zdhQLw5u753RHGdepM4ibL4WlXHWcut7xrQ35Fzt5Ogs5vVCEAh54Divdme0Y2DFChWL9TDeUAnUFHPxJHh8CLciiOtrScZD1nJSei71qZOVlrq0++QRNhnoOXA4Sf4/5OKgSpwAC+d2CP+g/cgdjYxLP/iZXOtpj0FV4y1vC55MYpo4N1g1ik8LWC1h2QAstnv3y9Wi72PcAfdaK3XdcGFR5Z1KiTw+ssvrPrJG02QM1sYfICI
X-OriginatorOrg: qnap.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 10:09:16.3477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b974397-9e49-4520-74b2-08df0a6c93f4
X-MS-Exchange-CrossTenant-Id: 6eba8807-6ef0-4e31-890c-a6ecfbb98568
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6eba8807-6ef0-4e31-890c-a6ecfbb98568;Ip=[122.147.219.42];Helo=[mail19.qnap.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7498

On Wed, 2 Sep 2026 13:50:16 +0200, Michal Pecio <michal.pecio@gmail.com> wrote:
> That's probably how it should be, but I wonder how did you find this
> bug and are you aware of any cases where it makes a difference?

I noticed it while debugging a downstream kernel (based on v6.6) for
an embedded NAS platform, which carries an xHC error recovery routine
doing the same sequence as the reset_registers path in xhci_resume().

Since the NAS platform doesn't run a mainline kernel easily, I did the
testing on a separate machine. On this machine (Intel Meteor Lake-P
xHC, 8086:7e7d) STS_HALT is set by the time xhci_resume() runs, so I
added a fault injection flag to xhci_reset() on mainline to force the
abort path, making it return 0 without doing the reset. Resume then
restarts the HCD on a host that was never reset. Every command
afterwards times out and gets aborted, and devices loop on failed
re-enumeration for minutes:

  [  100.109411] xhci_hcd 0000:00:14.0: Host controller not halted, aborting reset.
  [  100.110025] xhci_hcd 0000:00:14.0: Start the primary HCD
  [  100.110132] xhci_hcd 0000:00:14.0: Start the secondary HCD
  [  100.194666] xhci_hcd 0000:00:14.0: The device to be reset with slot ID 0 does not exist. Re-allocate the device
  [  107.573055] xhci_hcd 0000:00:14.0: Error while assigning device slot ID: Command Aborted
  [  107.573059] xhci_hcd 0000:00:14.0: Max number of devices this xHCI host supports is 64.
  ...
  [  259.125506] xhci_hcd 0000:00:14.0: Error while assigning device slot ID: Command Aborted
  [  259.125509] xhci_hcd 0000:00:14.0: Max number of devices this xHCI host supports is 64.
  [  259.548200] xhci_hcd 0000:00:14.0: xHCI xhci_drop_endpoint called with unaddressed device
  [  259.549751] xhci_hcd 0000:00:14.0: xHCI xhci_free_dev called with unaddressed device

On the test machine I couldn't reproduce the not-halted case through a
normal xhci_suspend()/xhci_resume() cycle. But the reset_registers path
is taken exactly when the host state is not trusted (power lost, broken
suspend, HCE, RESET_ON_RESUME), so making sure xhci_reset() actually
completed seems right regardless.

> There is apparently one caller (xhci_resume()) which cares about
> xhci_reset() return value but not about the preceding xhci_halt().

Yes, xhci_resume() is exactly the caller I had in mind. Since it doesn't
check xhci_halt(), the reset return value is the only thing standing
between a host that failed to halt and the reinit.

Thanks,
Henry
