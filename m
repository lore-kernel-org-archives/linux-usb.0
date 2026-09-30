Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023106.outbound.protection.outlook.com [40.107.44.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CC7414DCA
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 10:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763503; cv=fail; b=Po8Cc70bqhmCVoVjcTLJmrmyu7SENqrChOvwxt0kV5kBeN+3Gz3sf/R4zowHNuKBW/2E8j3r/fwVR5KV2TZBMCxRhpYFNW4g5cB4eWxxhn9nOymXnmGHLnaaocxC2bCXwb6IymYWXTkX2651M9nXZ0mXn7IThcaRxMz+7LCLHoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763503; c=relaxed/simple;
	bh=pF9qGlrkc0bJWyNOgiqKTEEGeDTP+4pXOG3YAfHPsJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BYUEOfSmQIPDV01d3uKYnWtFPvF1wavBHnnfRmg48T/S6QMeXf2rqc9f50PfqAKJlZbO0TP4Ce/2aHWGtff3UFMQrMoyJ60n3mrFy2ng9qH73VLVR8UcajlGFcaSF7ep240oGVXyEActdaX8+UpFZo7zhYubQYbPWcLlMubE+/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com; spf=pass smtp.mailfrom=qnap.com; dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b=kVTmUubU; arc=fail smtp.client-ip=40.107.44.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qnap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b="kVTmUubU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmkYYpuq05Y+zTsmUNB1vRboElT6ksMx+KYU2VLUeLAsMTpTs804CRdzXu+A8kPx+KR9jFz7f8Ula+4a1NkoyUYRmgJi0KCzGNUo6Mm8WhYAaolX5SSUDJJ0qURSCgFA+3ex062ulvmkHuVHlQ2xd8WJqa3cpQ8jZPqGbAV0hjzPCepsw9eb7yXaIr2G4LdyQ0YGNFA8Ygfa6i5WUjpt0NZmhhHQMKu14LV9rd1rOKgnIdlQ1g2KZXziKybXZi07p++m7VNMfz8XCZgQgoe7TNpbe2ZOSJ1tteHxydrTWk1N2WX0nojH7BGQmCV61UXhro3g3Ez8NCVBh1Lg7i9yNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIsEqLxWqbsEwYcFBmYJu8BLj2EJ8qVXShlyAOyBx9c=;
 b=uZWbHf0kXTTMMv2aWqWkAoPbQ0JqnqW0Sfz3CLrWkMUv1HeksC/u+iIUop1ARHSTyu8RmKtKEbsj47B28hOftPBFjmz1lLsJF8ku4teOJVe0oxt7/urXgIds29+Pxm7tjewUKW4LYAXTwpmAmn4m/1tupV7rxJ7LC5/6Isua4RD7J/707y/Dnpi+tCOQcXBuEFyXWTYsuhCuIkvAjjUzsQHnWJcHrDHh1BfhlIHJ6NXpJJPotOz+7M6iOT1fTx0GvLxIxfnBj82q3KrbL8cH6VHki6VcXuEhphoyA+ifMjIxkTdTXG/PJrXHJ3PdLsvT4lbryeBDbUuLKfiSGjd8iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 122.147.219.42) smtp.rcpttodomain=intel.com smtp.mailfrom=qnap.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=qnap.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIsEqLxWqbsEwYcFBmYJu8BLj2EJ8qVXShlyAOyBx9c=;
 b=kVTmUubUzSobLXkXw4EHur6rF/U78SzCMjBE6xfVC5AsNab47C6K1e2xvhNAIyLgJGzhekeO6YAuPWTeYsfl4E9nQEHY12cKjAQT7PhkkyVZwkP+r+CWIjkXAjBc3AmuciajfjWZZ4s07CtsCUtHWWlxpIfr6dLphw/yGIuCFT+v7JpssMTq2rSFHvw8E7mosHjhPZmrwMnMFax/EJRQqVNZXxjtLRBfnjAFDzwbVPPnyrduuVna4YjCUX+itmf04g02ythM/NLzYzZ90HLk2vVAF0nnInZEph8Q6t83SWrZWbxhtlfbqa/VSw9BpXjZPmMfPPeSRLcscUda1yheuQ==
Received: from TY4P286CA0105.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:380::9)
 by TYUPR04MB6931.apcprd04.prod.outlook.com (2603:1096:400:356::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 10:18:15 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:405:380:cafe::8d) by TY4P286CA0105.outlook.office365.com
 (2603:1096:405:380::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 10:18:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 122.147.219.42) smtp.mailfrom=qnap.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=qnap.com;
Received-SPF: Fail (protection.outlook.com: domain of qnap.com does not
 designate 122.147.219.42 as permitted sender)
 receiver=protection.outlook.com; client-ip=122.147.219.42;
 helo=mail19.qnap.com;
Received: from mail19.qnap.com (122.147.219.42) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Wed, 30 Sep 2026 10:18:14 +0000
Received: from localhost (unknown [172.17.22.73])
	by mail19.qnap.com (Postfix) with ESMTP id F1F86247;
	Wed, 30 Sep 2026 18:18:13 +0800 (CST)
From: Henry Tseng <henrytseng@qnap.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Henry Tseng <henrytseng@qnap.com>
Subject: [PATCH 2/2] xhci: skip configure endpoint when dropping endpoints of a disconnected device
Date: Wed, 30 Sep 2026 18:17:52 +0800
Message-ID: <20260930101752.15794-3-henrytseng@qnap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930101752.15794-1-henrytseng@qnap.com>
References: <20260930101752.15794-1-henrytseng@qnap.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|TYUPR04MB6931:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3c4d13e2-44e8-423d-52c4-08df1edc235d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|55112099003|22082099003|18002099003|3023799007|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	DRX4nz2C7cvG4COXXENTvWKUj/00zCTAbt9valkglDtzBJVej14v1+JHLpH/vMj3aJL+MlIDAVb8P+TEohfa1Bnwh6TFN9rg/MNieSmcjNCK6Rk1a6t22/V7Lcg7/3Mc3WlwvDUWcx4Eb0P5xCbeM4MZkJO9gy2SUxrCIUjVgIabXEK+VJhDYjMjML2otbqfZOf/+VWIfewQ335NWqlmk2otB92HbMnnbpRpIT+U3HjcaoZsndPlK0MLwaxXZyBg+cTlO4EDlGVMeBYQQTxsqj6DVQYLC9NwrC3bIc3aWPsxBPyXfAySZqNw19gWw6Q6PKpL/NAJmG4Z8wWX7Rnp6hfb7cWpHs9Gd2SZ6bgIIsABeY4xXG5zNQVdC5Hgqx/o2h6fuI8HHPbJWKKUhWFajVoe1bIWHdh2302DvuJjInd2iqcgPQ3mvdQoKPWEBRBZZgkfzuFK642guvXuO0/CZFvr54Y+UZRXaWcmU3rz53SFcJf4+q2O9OCnZVCmCos5wcI0vJ+eWY124S02oZTg6SVzvGLgUbf7Y9ZU2kDrxzfI+svREP0whV9+Tdpx2EznvslGBrYyIAuyvCR9q6Bi/AbbogJxA5DVy/JyarceRB5eC9wFG7F1mAggirR8sQXW11a6xLU/d+Gf34Wka2RZO8I8pCz78XoOCQHa46WhHrgJ64OcYHiYFMp2CvoJm2HD
X-Forefront-Antispam-Report:
	CIP:122.147.219.42;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail19.qnap.com;PTR:122-147-219-42.static.sparqnet.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(55112099003)(22082099003)(18002099003)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GS0FpDxLhwCgojw6ivuoc6T/TWMdHxn7PlGLeEMm4zaUI/gSGtApvqlhNbmtFewyKGcihiumr2WzzBQFVzNiepx7yzHL6p34eDv6B9WrB4KzYSqNLam0UaJ0ZtnscjnCndisaTN/u4Ncs8wxPKnoJiopPGhvQYuHudNHnIJyB2ZMBw0MuBJPmFDUfFGdxbmzCmnHlZquZxob9A1v1OUokadmmfd2wXdb1iT2SwsXj9OmATc0UK8boMJF7lAe4in1UCz26HbuVn2oKIA3htKE9ghllyt7/1klpFGa/VSG9SjPZLPIkMqaSrq8DgqSRIoCF2A9ngclwajo0awwgvTYd3z1FmTLB1rzAmSxvwBohFG3xC2VmAJ9FQ/Hrhs1F1iQ1BRoq8fabBI7gWHSyy4PLyszmcuCnY/IwpcxegSYiZC3qodMpDjcWfzvDsGlAHEM
X-OriginatorOrg: qnap.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 10:18:14.3698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4d13e2-44e8-423d-52c4-08df1edc235d
X-MS-Exchange-CrossTenant-Id: 6eba8807-6ef0-4e31-890c-a6ecfbb98568
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6eba8807-6ef0-4e31-890c-a6ecfbb98568;Ip=[122.147.219.42];Helo=[mail19.qnap.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6931

When a USB device is disconnected, its endpoints are dropped with a
configure endpoint command, immediately followed by a disable slot
command for the same slot.

Per xHCI 1.2b section 4.8.3 that configure endpoint transitions the
dropped endpoints to the Disabled state, and the following disable slot
transitions all endpoints of the slot to Disabled. The dropped
endpoints end up Disabled either way, so skipping the configure
endpoint does not change the outcome.

xhci_check_bandwidth() already returns -ENODEV without issuing the
command when the host is dying or being removed, and teardown then
continues to disable slot in xhci_free_dev(). Add the case of the
device's roothub port being disconnected or its link being inactive to
that condition, using the port state tracked since commit 042aad8d0db6
("xhci: prevent endpoint recovery after roothub disconnect"). Device
disconnect then follows the same path as host removal. The caller runs
xhci_reset_bandwidth() on -ENODEV, and the rings of the dropped
endpoints are freed by xhci_free_virt_device() after disable slot.

On an AMD Raven USB 3.1 xHCI (1022:15e0), unplugging a USB device
sometimes leaves the configure endpoint command incomplete. The command
ring abort then fails too, and the host is declared dead, taking
unrelated devices on other root ports with it:

  [   80.928319] usb 2-1: USB disconnect, device number 3
  [   80.939654] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 5, new drop flags = 0x80, new add flags = 0x0
  [   86.086412] xhci_hcd 0000:0c:00.3: Command timeout, USBSTS: 0x00000010 PCD
  [  101.924383] xhci_hcd 0000:0c:00.3: Abort failed to stop command ring: -110
  [  101.936213] xhci_hcd 0000:0c:00.3: xHCI host controller not responding, assume dead
  [  101.937662] xhci_hcd 0000:0c:00.3: Timeout while waiting for configure endpoint command

With this change the same slot 5 drop returns immediately. Teardown
continues and the port 2-1 device is unregistered with the host still
alive:

  [  114.356084] usb 2-1: USB disconnect, device number 3
  [  114.356982] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 5, new drop flags = 0x80, new add flags = 0x0
  [  114.357675] xhci_hcd 0000:0c:00.3: drop ep 0x81, slot id 6, new drop flags = 0x8, new add flags = 0x0
  ...
  [  114.564127] usb 2-1: unregistering device

Signed-off-by: Henry Tseng <henrytseng@qnap.com>
---
 drivers/usb/host/xhci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 8169d30dd40e..3d701d0fd3df 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3088,6 +3088,7 @@ int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 	struct xhci_input_control_ctx *ctrl_ctx;
 	struct xhci_slot_ctx *slot_ctx;
 	struct xhci_command *command;
+	struct xhci_port *rhub_port;
 
 	ret = xhci_check_args(hcd, udev, NULL, 0, true, __func__);
 	if (ret <= 0)
@@ -3099,6 +3100,15 @@ int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 
 	xhci_dbg(xhci, "%s called for udev %p\n", __func__, udev);
 	virt_dev = xhci->devs[udev->slot_id];
+	rhub_port = virt_dev->rhub_port;
+
+	/*
+	 * Skip configure endpoint if the roothub port is gone or its link
+	 * is inactive. Some hosts stop completing endpoint commands after
+	 * disconnect, wedging the command ring.
+	 */
+	if (rhub_port->link_inactive || !rhub_port->connected)
+		return -ENODEV;
 
 	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 	if (!command)
-- 
2.43.0

