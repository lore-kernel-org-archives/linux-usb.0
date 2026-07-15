Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3E147798B;
	Wed, 15 Jul 2026 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118573; cv=none; b=ki5Ejt05lEjIEb4ihrxMS4TuwElhpQnvI4Y3qkZf7cVs1yt92IsLbbPIwKK6crpP7j23Q6i4piVhw8HDY9jTsPD+D8HhIaJEXBr1JnZJYtIp/YWVcNqf/SciLN/jw69H5MIBbnnPL/QbnA+2qMmHY1b4krAezrMcINSh/Z8xUPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118573; c=relaxed/simple;
	bh=MhGk/CHy2kt92XmIvi4RBzeEVW+sWguFNAZtDuLvclE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=isNVPDdsIvsFtxtxwDDSwRjfnDUAvN6TX86phjs0fzu7gFfOlZ7LBNrqnDp29lK+np9OKZuyssAxkSK9w65cAI7X5z5Vyfg5o49NsZZXSdq3OKn36wiDz6QzJxKbILP/9eMfMVCkY5R8ayewFqqKmhOgvB9MMAV6hZoy5J25i5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zt3FRaGS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zt3FRaGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A581F00A3A;
	Wed, 15 Jul 2026 12:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784118570;
	bh=jPOQT/PB2k8KkJ+NTN4By9GA7M/j8INKvvlBVqVXrs4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Zt3FRaGS2nKDhaLrxHZpzEKGjsTgP9VknnkHI+McoBdSK0+yVeIxfgZ3KC1qpKIqe
	 ELp22XjJF2tvNOce4fa4Gv07k9cwWkMq88g2IXiA1Dtb9vmTXmFT+HwLYjJ9QjLR9S
	 maLThLYLKFia6neJlPsfAdWE6zFkZh8w8So1IamkevMTdRVnvgmqRK5kvRIRe3fPTn
	 N0SY/S96rYJNw7HOctm2En1YoqjdW3Z3jMYxgTJVJ4gbghEGeUjyA1w43ESZ9bUYvZ
	 nJWDSxNpQbEErg5BP4MRn9bMuDpazvneO8T0Jd0ahGFX9p+jAQXOqQFHEoKNXBkDpx
	 vNc/EGrJ6EKEA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 15 Jul 2026 14:29:17 +0200
Subject: [PATCH v2 1/4] usb: xhci: debugfs: Expose the USB3 tunneling
 ext_cap register value
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-topic-dwc3_tunneling_state-v2-1-026487a08119@oss.qualcomm.com>
References: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
In-Reply-To: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784118563; l=2275;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=qvUPwA/dw1tFcJg0a37yvDIBq9eIxcYl8zySkWJxako=;
 b=btPMca/TcBQje8x6aKBMq3/T56KmrQSbTr1f0sSW76jNuGCS0AgOyUP2O9LAwwSAG786cHwod
 M+3DSnfH2AUD5bkSwifKIgm7taYy/1TCAQCRHZWUs9Hd9UBv6xVdTi8
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The USB3 Tunneling Support Capability (idx 18) features a single
register. Expose it over debugfs, if supported by the controller.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/host/xhci-debugfs.c  | 9 +++++++++
 drivers/usb/host/xhci-debugfs.h  | 2 ++
 drivers/usb/host/xhci-ext-caps.h | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index d07276192256..380778403b2d 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -81,6 +81,10 @@ static const struct debugfs_reg32 xhci_extcap_dbc[] = {
 	dump_register(EXTCAP_DBC_DEVINFO2),
 };
 
+static const struct debugfs_reg32 xhci_extcap_usb3_tunneling[] = {
+	dump_register(EXTCAP_USB3_TUNNELING),
+};
+
 static struct dentry *xhci_debugfs_root;
 
 static struct xhci_regset *xhci_debugfs_alloc_regset(struct xhci_hcd *xhci)
@@ -815,6 +819,11 @@ void xhci_debugfs_init(struct xhci_hcd *xhci)
 				   ARRAY_SIZE(xhci_extcap_dbc),
 				   "reg-ext-dbc");
 
+	xhci_debugfs_extcap_regset(xhci, XHCI_EXT_CAPS_USB3_TUNNELING,
+				   xhci_extcap_usb3_tunneling,
+				   ARRAY_SIZE(xhci_extcap_usb3_tunneling),
+				   "reg-usb3-tunneling");
+
 	xhci_debugfs_create_ring_dir(xhci, &xhci->cmd_ring,
 				     "command-ring",
 				     xhci->debugfs_root);
diff --git a/drivers/usb/host/xhci-debugfs.h b/drivers/usb/host/xhci-debugfs.h
index 7c074b4be819..ca6b7f2da8e3 100644
--- a/drivers/usb/host/xhci-debugfs.h
+++ b/drivers/usb/host/xhci-debugfs.h
@@ -70,6 +70,8 @@
 #define REG_EXTCAP_DBC_DEVINFO1				0x38
 #define REG_EXTCAP_DBC_DEVINFO2				0x3c
 
+#define REG_EXTCAP_USB3_TUNNELING			0x00
+
 #define dump_register(nm)				\
 {							\
 	.name	= __stringify(nm),			\
diff --git a/drivers/usb/host/xhci-ext-caps.h b/drivers/usb/host/xhci-ext-caps.h
index 67ecf7320c62..22e53a750e2a 100644
--- a/drivers/usb/host/xhci-ext-caps.h
+++ b/drivers/usb/host/xhci-ext-caps.h
@@ -40,6 +40,7 @@
 #define XHCI_EXT_CAPS_ROUTE	5
 /* IDs 6-9 reserved */
 #define XHCI_EXT_CAPS_DEBUG	10
+#define XHCI_EXT_CAPS_USB3_TUNNELING	18
 /* Vendor caps */
 #define XHCI_EXT_CAPS_VENDOR_INTEL	192
 #define XHCI_EXT_CAPS_INTEL_SPR_SHADOW	206

-- 
2.55.0

