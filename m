Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A939F5733E;
	Wed, 26 Aug 2026 03:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787716034; cv=none; b=uSQy9y7nFfVY7COMzI4fpk5G8vN+Y19Jy7lz6kaSO10q7uh996gT4aI1CyVLG8dU6Rt0XNqlkY7iBRRKa0SYRblGx8MTr/JDSUuYvKGdZ/lv4DyuLnAC82+f9+/bTOiFhZEy9TN6/2a/CWbmclSkp8GHfPPqMuxSYqElHVrlUsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787716034; c=relaxed/simple;
	bh=3OHcOsxoydDiByqI7XObvVTJ62CbTVQq18RDHUOLoe4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C36xDLoVI7h//v+LFtiKwMNl1TKpMPutQPY5y7alF27184NHTx9F/FvoBH6hyP7hR9M5pFiLI66j1FuZ/JS+bMsXOQ8iOX0ZAYyaZD2dquqyqyhNAOHo5lf3ogA/8fAvp8PPYBjrn7e01bgj/yOh4Zs2H6ATZEYqxDkPDdVSA/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cba3e14ca10011f19a56ed5b684f684d-20260826
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7b35d4eb-c01a-4205-9cee-d481923b43e6,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-45
X-CID-META: VersionHash:7db8b62,CLOUDID:e1f963a741f65c52c65a5864092f7bbd,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:1|-100,
	IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cba3e14ca10011f19a56ed5b684f684d-20260826
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2009750874; Wed, 26 Aug 2026 11:47:01 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huang Wei <huangwei@kylinos.cn>,
	Alex Bartz <alex@alstergee.com>
Subject: [PATCH] usb: typec: ucsi: do not register UCSI on Lenovo Legion Pro 7 16IAX10H
Date: Wed, 26 Aug 2026 11:46:58 +0800
Message-Id: <20260826034658.2170407-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EC firmware of the Lenovo Legion Pro 7 16IAX10H (DMI product name
83F5) has a broken UCSI implementation: GET_PDOS returns no source
capabilities, GET_CONNECTOR_STATUS reports an incomplete RDO, and any
UCSI traffic disturbs the EC's autonomous USB-C Power Delivery
negotiation. With ucsi_acpi bound, chargers connect only briefly and
then drop, and voltage_now reads 0; with the driver blacklisted, the
EC negotiates full PD contracts on its own and charging works normally.

The problem is unaffected by BIOS updates up to Q7CN78WW (2026-04).
The AMD sibling Legion Pro 7 16AFR10H (product name 83RU) reportedly
uses the same EC firmware, but it is left out of the quirk until the
failure is confirmed on that model.

Skip probe on this machine, which is equivalent to the blacklist
workaround the reporter verified to restore charging.

Reported-by: Alex Bartz <alex@alstergee.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221142
Signed-off-by: Huang Wei <huangwei@kylinos.cn>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 18286d3e9cc5..9f36f8cfce4a 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -173,6 +173,21 @@ static const struct dmi_system_id ucsi_acpi_quirks[] = {
 	{ }
 };
 
+/*
+ * Platforms with a completely broken UCSI implementation in firmware.
+ * Do not register UCSI at all on these machines.
+ */
+static const struct dmi_system_id ucsi_acpi_ignore[] = {
+	{
+		/* Lenovo Legion Pro 7 16IAX10H: broken EC UCSI firmware */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83F5"),
+		},
+	},
+	{ }
+};
+
 static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
 {
 	struct ucsi_acpi *ua = data;
@@ -199,6 +214,12 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 	if (adev->dep_unmet)
 		return -EPROBE_DEFER;
 
+	if (dmi_check_system(ucsi_acpi_ignore)) {
+		dev_info(&pdev->dev,
+			 "UCSI implementation in firmware is broken, ignoring\n");
+		return -ENODEV;
+	}
+
 	ua = devm_kzalloc(&pdev->dev, sizeof(*ua), GFP_KERNEL);
 	if (!ua)
 		return -ENOMEM;
-- 
2.25.1

