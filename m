Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433865;
	b=VNSqvZD0TzrYJ1HHm6DzDnx8jQslRIdhVLg2kbqf/Nb7erhLpRoI27BQxkocsxx0m1FP
	 3nDYeLpc6PHqRii+9RZyrKZQrN86FjJQ1r8R8zAC/DD3X/ZSn4fN3/i829+IxZqpwXDX9
	 y223xe4g/b0p8OYXXATPnVDRO9v1HjMf1iezAecC3pLshwbDBd6ht3PrO4XPC8aJbCE6j
	 Y9GWTkNz3hF2Absn7iZrPH2LP4bDA2CsH1E5At2UGVgusJSeGI4eAgdJeJuueiUKO9Bnm
	 jv1oj1OGm16ELBeKkEF6iogmfSGAwIvyUgvonk2Lf7DtnJTQqELHQWehAvHxJ7gMviw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433865;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=fd0PCiCwzARHaNlIgPSY9EbYW778yuNjPYZyRv0ikcE=;
	b=Jvso87P5rSnSuPbHhxgXhZbEVWCMUgldOQv+fAI9hC8q3rWbmCR4Gc4yqMyNTTKEBr9x
	 gEAyJ8l11SQvbhBwEHTP3T39/h5b5NAlnDmg9TRLEmmjwmk6PLCiMjGqZtqshLXF+7C5q
	 82GHQKtJDMHr/g0keos6oVegpWWFouXTSwBv2U9Gwlz7V/bFneWgKu2fMffG9/ABfoHJl
	 i322Oal29+7qpywasnhKFFYEXLUZaAOLYBrV+D97/e5FaYNKtxzCrmvD0uhqr/ytdlC1c
	 8OgzlQrMSuBZU57WihQTDEJ4YCskwgrnLrja/zFZCb+Ff/EA+LSJqx8IByBDBTqopSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=S2ebc4zv;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A860A3812;
	Mon, 23 Nov 2026 11:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E8A860A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=S2ebc4zv
X-UUID: 48cd59ece73211f18dc8c9802ae25ab1-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fd0PCiCwzARHaNlIgPSY9EbYW778yuNjPYZyRv0ikcE=;
	b=S2ebc4zvI4KU0mnb9XsyNDjiWHtAGZFlDn97QRc1QE8Vf+DJdjM4pYBNtdHUgCdYqU+4C5qXktG1AfWD2OOI5o4L90H0ZSzV6V0nivnhBBcXA5rDoJKe7mibEKcKWu82Ij79QKkRJyUVUX5uzcsQfukg2WGmjt8Dr4UOFdy+iDw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:edcdadca-e681-4528-8c7a-da5fc0de09ca,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:78f7f319-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 48cd59ece73211f18dc8c9802ae25ab1-20261123
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1653618854; Mon, 23 Nov 2026 19:37:38 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 19:37:35 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Mon, 23 Nov 2026 19:37:34 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>, Sven Peter <sven@kernel.org>, Yehezkel
 Bernat <YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH v3 2/8] thunderbolt: Move ICM mailbox functions to icm.c and internalize interrupt work
Date: Mon, 23 Nov 2026 19:36:49 +0800
Message-ID: <20261123113705.2297329-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

In preparation for modularizing PCIe NHI and ICM support as a separate
driver, clean up internal helper functions so that they do not need to
be exported:

nhi_mailbox_cmd() and nhi_mailbox_mode() are only used by the Intel
firmware Connection Manager (icm.c) to exchange mailbox commands with
firmware running on Intel PCIe NHIs. The Thunderbolt core framework,
software connection manager, and non-PCIe platform controllers do
not use this mailbox interface. Move both functions into icm.c and
mark them static.

nhi_interrupt_work was previously initialized in pci.c within
nhi_pci_init_msi(), requiring it to be visible across files. Move
INIT_WORK(&nhi->interrupt_work, ...) into tb_nhi_probe() so that
the workqueue item is initialized by the NHI core and
nhi_interrupt_work() can be marked static in nhi.c.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: fix a indent
---
 drivers/thunderbolt/icm.c | 59 ++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/nhi.c | 64 ++-------------------------------------
 drivers/thunderbolt/nhi.h |  3 --
 drivers/thunderbolt/pci.c |  2 --
 4 files changed, 62 insertions(+), 66 deletions(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index a295a5e6cc9c..736f551cd567 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -45,6 +45,7 @@
 #define ICM_RETRIES			3
 #define ICM_APPROVE_TIMEOUT		10000	/* ms */
 #define ICM_MAX_LINK			4
+#define ICM_MAILBOX_TIMEOUT		500 /* ms */
 
 static bool start_icm;
 module_param(start_icm, bool, 0444);
@@ -269,6 +270,64 @@ static int pcie2cio_write(struct icm *icm, enum tb_cfg_space cs,
 	return pci2cio_wait_completion(icm, 5000);
 }
 
+/**
+ * nhi_mailbox_cmd() - Send a command through NHI mailbox
+ * @nhi: Pointer to the NHI structure
+ * @cmd: Command to send
+ * @data: Data to be send with the command
+ *
+ * Sends mailbox command to the firmware running on NHI.
+ *
+ * Return: %0 on success, negative errno otherwise.
+ */
+static int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data)
+{
+	ktime_t timeout;
+	u32 val;
+
+	iowrite32(data, nhi->iobase + REG_INMAIL_DATA);
+
+	val = ioread32(nhi->iobase + REG_INMAIL_CMD);
+	val &= ~(REG_INMAIL_CMD_MASK | REG_INMAIL_ERROR);
+	val |= REG_INMAIL_OP_REQUEST | cmd;
+	iowrite32(val, nhi->iobase + REG_INMAIL_CMD);
+
+	timeout = ktime_add_ms(ktime_get(), ICM_MAILBOX_TIMEOUT);
+	do {
+		val = ioread32(nhi->iobase + REG_INMAIL_CMD);
+		if (!(val & REG_INMAIL_OP_REQUEST))
+			break;
+		usleep_range(10, 20);
+	} while (ktime_before(ktime_get(), timeout));
+
+	if (val & REG_INMAIL_OP_REQUEST)
+		return -ETIMEDOUT;
+	if (val & REG_INMAIL_ERROR)
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * nhi_mailbox_mode() - Return current firmware operation mode
+ * @nhi: Pointer to the NHI structure
+ *
+ * The function reads current firmware operation mode using NHI mailbox
+ * registers and returns it to the caller.
+ *
+ * Return: &enum nhi_fw_mode.
+ */
+static enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
+{
+	u32 val;
+
+	val = ioread32(nhi->iobase + REG_OUTMAIL_CMD);
+	val &= REG_OUTMAIL_CMD_OPMODE_MASK;
+	val >>= REG_OUTMAIL_CMD_OPMODE_SHIFT;
+
+	return (enum nhi_fw_mode)val;
+}
+
 static bool icm_match(const struct tb_cfg_request *req,
 		      const struct ctl_pkg *pkg)
 {
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index c574c336f25b..ce02f96187b0 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -35,8 +35,6 @@
  */
 #define RING_E2E_RESERVED_HOPID	RING_FIRST_USABLE_HOPID
 
-#define NHI_MAILBOX_TIMEOUT	500 /* ms */
-
 static bool host_reset = true;
 module_param(host_reset, bool, 0444);
 MODULE_PARM_DESC(host_reset, "reset USB4 host router (default: true)");
@@ -964,65 +962,7 @@ int tb_ring_throttling(struct tb_ring *ring, unsigned int interval_nsec)
 }
 EXPORT_SYMBOL_GPL(tb_ring_throttling);
 
-/**
- * nhi_mailbox_cmd() - Send a command through NHI mailbox
- * @nhi: Pointer to the NHI structure
- * @cmd: Command to send
- * @data: Data to be send with the command
- *
- * Sends mailbox command to the firmware running on NHI.
- *
- * Return: %0 on success, negative errno otherwise.
- */
-int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data)
-{
-	ktime_t timeout;
-	u32 val;
-
-	iowrite32(data, nhi->iobase + REG_INMAIL_DATA);
-
-	val = ioread32(nhi->iobase + REG_INMAIL_CMD);
-	val &= ~(REG_INMAIL_CMD_MASK | REG_INMAIL_ERROR);
-	val |= REG_INMAIL_OP_REQUEST | cmd;
-	iowrite32(val, nhi->iobase + REG_INMAIL_CMD);
-
-	timeout = ktime_add_ms(ktime_get(), NHI_MAILBOX_TIMEOUT);
-	do {
-		val = ioread32(nhi->iobase + REG_INMAIL_CMD);
-		if (!(val & REG_INMAIL_OP_REQUEST))
-			break;
-		usleep_range(10, 20);
-	} while (ktime_before(ktime_get(), timeout));
-
-	if (val & REG_INMAIL_OP_REQUEST)
-		return -ETIMEDOUT;
-	if (val & REG_INMAIL_ERROR)
-		return -EIO;
-
-	return 0;
-}
-
-/**
- * nhi_mailbox_mode() - Return current firmware operation mode
- * @nhi: Pointer to the NHI structure
- *
- * The function reads current firmware operation mode using NHI mailbox
- * registers and returns it to the caller.
- *
- * Return: &enum nhi_fw_mode.
- */
-enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
-{
-	u32 val;
-
-	val = ioread32(nhi->iobase + REG_OUTMAIL_CMD);
-	val &= REG_OUTMAIL_CMD_OPMODE_MASK;
-	val >>= REG_OUTMAIL_CMD_OPMODE_SHIFT;
-
-	return (enum nhi_fw_mode)val;
-}
-
-void nhi_interrupt_work(struct work_struct *work)
+static void nhi_interrupt_work(struct work_struct *work)
 {
 	struct tb_nhi *nhi = container_of(work, typeof(*nhi), interrupt_work);
 	int value = 0; /* Suppress uninitialized usage warning. */
@@ -1331,6 +1271,8 @@ int tb_nhi_probe(struct tb_nhi *nhi)
 	if (!nhi->tx_rings || !nhi->rx_rings || !nhi->interrupt_mask)
 		return -ENOMEM;
 
+	INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
+
 	nhi_reset(nhi);
 
 	/* In case someone left them on. */
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index a36c62c49a5c..3dd6ace6150d 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -27,11 +27,8 @@ enum nhi_mailbox_cmd {
 	NHI_MAILBOX_ALLOW_ALL_DEVS = 0x23,
 };
 
-int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data);
-enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
 void nhi_enable_int_throttling(struct tb_nhi *nhi);
 void nhi_disable_interrupts(struct tb_nhi *nhi);
-void nhi_interrupt_work(struct work_struct *work);
 irqreturn_t tb_nhi_isr(int irq, void *data);
 irqreturn_t tb_ring_msix(int irq, void *data);
 int tb_nhi_probe(struct tb_nhi *nhi);
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 2f0abf4d27a3..275389903090 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -206,8 +206,6 @@ static int nhi_pci_init_msi(struct tb_nhi *nhi)
 		if (nvec < 0)
 			return nvec;
 
-		INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
-
 		irq = pci_irq_vector(pdev, 0);
 		if (irq < 0)
 			return irq;
-- 
2.45.2

