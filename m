Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29523BF67A
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 09:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492499; cv=none; b=eE6yNND/iEsbBdhg852SoGYCiKMfA0+wOxBLKc4HP+TjS4lRU5FQJybc9vu5/nuWyFKMnNEadcNg9Chjvo5jRZjw0Gp0S/Fl30y8f7ynk4qaNZx+XCrO5t5vrqVK8Ws6GAByxaprf8hEFl1e/yAvmRok2iLyQvmUi0WxS64ugSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492499; c=relaxed/simple;
	bh=etbLPXQmQXs7YfahmOYJBRPd7DKpBSbSh7qBR8PZJUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ApjufU53uzf3OYiVUUCPRYWlagYWvEwGXasiPvrtf6pc+qE+WZh2Tef/qbaXXZ1sVp6nJbHw5OFOO5y9fvZebN8ztloemOFAT3tToT1KB8fSGTkLX7yqbIt98zh7W1YwV/kJrGGrmxLgKE8TqNJWCie3Pg2FuFNOf9l141njX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=fnmilS2p; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="fnmilS2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1778492464;
	bh=uAcp+S+sOPiP3yQVGIrUCMMqCTMJ6AT4kto6Wya0KwU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fnmilS2pXDNFEjklATIgT62oAiKq9HfhBQnSU3GPp+y02bjKZT9FxTbRMlOP6RF0l
	 6ptUSIxrHJ1NjdPqrglujxBSAH5nCvlPtdfNkUBqXmFRdEKMPKk87PGZungzaFm2tf
	 vFeb/E22Wdof2u5EUoGXtHR/e3xYzO3QX7251CcU=
X-QQ-mid: zesmtpip4t1778492448t286d8ee5
X-QQ-Originating-IP: Ylm1nAof9toYU9ZREFrJZ3Nruw8rPgbcF9GEfbIP6Zg=
Received: from PEN202512010004 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 May 2026 17:40:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7979615296410837799
EX-QQ-RecipientCnt: 6
From: Xu Rao <raoxu@uniontech.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	raoxu@uniontech.com
Subject: [PATCH] xhci: show all interrupter registers in debugfs
Date: Mon, 11 May 2026 17:40:32 +0800
Message-ID: <D654EDB85F637F2A+20260511094032.1970627-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: McoPngcDBvM5TSyDIlYrxTGP4+bKbDBK1oDITaCTtK9YCGcoTXG508d8
	X8oZHJujShAGm8pmuMnqzppmNpZCBcQc76i1u+KL00X7vf/2R8PflD5JucdNFuVJt7gXL7m
	BKjAe2/tfVKUf6w6DE8Gvb2g2+8IA3mQflWFYJQ8ccFgezL+rpgTf/+QmKz0BkVKpvbnxzl
	10yQk0ia8pjCu+0hwbR60/gMVIanHStcmVHW4tRUBFzCB+2RBRfEWuS8lfLV/WXHvCnQEwa
	aH+pWClJbTeZ8MEVOi4AvDr17dD/He0KaW3YNBQa6KbSW3py2SCiiqv42x8B2OMrOaInlni
	nrIOTGsJOTBxBhC5wxvvcQ2NvWN+w4MfkW7Pu3Snnm/d69ivnZyLNSQlZuCR/AGSZn+pnP/
	maUULjI8bjCEG3wwnVa7fxSfZ+O115X16xYGFp0jy0DVsh6atqT/Q4gns04a6R8P1RXE8SI
	7zUSfDmjjDuTMqE5qx5p134cFP4jzEWC6SNR04/u33oerAI4aluv9FlKf7fMfpn1MQyj3eC
	wYAbO+ptxI4+rKWROtC1dXR+OeyPO7nz3W7sFg/aoUUvgkqT73L8eSs3GoNFubNZbI9vpYF
	RWtBCMuTJk35eJkRnoN5CVLCeS1YbL6BrWkvhRgH/R9ay3aUOkJKBSbSkvJWZ+KdgIURS1M
	2q55VFOUSr7BX+9WIxRAt0FyVxXZ5W9uKhiM65q6fENHOuQM6uY6rQxFoisRmj5OhVfFB/3
	wYxalXdFnHRprtfyRD/7bC1GvFQ9cf7XTSbqr/wEgRUne+vnsUFAuVqlIB0WDmVJEHgy7q6
	rOyso5Rwvlo8pzfJPXhHuMnhcoD8rF+jHXOrODWPoqK4YN30MUMHG1960AzJLV6he6xseXk
	QCkoQuKeaggXGDQgy9HHwft0Tal6MzpD8NmcLwQG3cReSdSLwYkWedFnCY+QoeBCgYbRyOM
	hqd/tw9wfIzo0txvZwd62frS2+0cjAsrqV6nK6kuyfuWdTIgIdfhN+SP5OxSE8SIHqhg=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

The xHCI runtime register set contains one interrupt register set per
interrupter, but the existing reg-runtime debugfs file only includes
IR0. This hides the register state of secondary interrupters used by
sideband users.

Add a read-only debugfs file that dumps the runtime register set for
each currently allocated interrupter. Snapshot the values under
xhci->lock so a debugfs read cannot dereference a secondary
interrupter while it is being removed.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/host/xhci-debugfs.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index d07276192256..29fda05e0092 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -46,6 +46,44 @@ static const struct debugfs_reg32 xhci_runtime_regs[] = {
 	dump_register(IR0_ERDP_HIGH),
 };

+static int xhci_runtime_ir_show(struct seq_file *s, void *unused)
+{
+	struct xhci_hcd		*xhci = s->private;
+	unsigned long		flags;
+	unsigned int		i;
+
+	for (i = 0; i < xhci->max_interrupters; i++) {
+		struct xhci_interrupter *ir;
+		u32 iman, imod, erstsz;
+		u64 erstba, erdp;
+
+		spin_lock_irqsave(&xhci->lock, flags);
+		ir = xhci->interrupters[i];
+		if (!ir || !ir->ir_set) {
+			spin_unlock_irqrestore(&xhci->lock, flags);
+			continue;
+		}
+
+		iman = readl(&ir->ir_set->iman);
+		imod = readl(&ir->ir_set->imod);
+		erstsz = readl(&ir->ir_set->erst_size);
+		erstba = xhci_read_64(xhci, &ir->ir_set->erst_base);
+		erdp = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
+		spin_unlock_irqrestore(&xhci->lock, flags);
+
+		seq_printf(s, "IR%u_IMAN = 0x%08x\n", i, iman);
+		seq_printf(s, "IR%u_IMOD = 0x%08x\n", i, imod);
+		seq_printf(s, "IR%u_ERSTSZ = 0x%08x\n", i, erstsz);
+		seq_printf(s, "IR%u_ERSTBA = 0x%016llx\n", i,
+			   (unsigned long long)erstba);
+		seq_printf(s, "IR%u_ERDP = 0x%016llx\n", i,
+			   (unsigned long long)erdp);
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(xhci_runtime_ir);
+
 static const struct debugfs_reg32 xhci_extcap_legsup[] = {
 	dump_register(EXTCAP_USBLEGSUP),
 	dump_register(EXTCAP_USBLEGCTLSTS),
@@ -799,6 +837,9 @@ void xhci_debugfs_init(struct xhci_hcd *xhci)
 			    readl(&xhci->cap_regs->run_regs_off) & RTSOFF_MASK,
 			    xhci_runtime_regs, ARRAY_SIZE(xhci_runtime_regs),
 			    xhci->debugfs_root, "reg-runtime");
+	debugfs_create_file("reg-runtime-ir", 0444,
+			    xhci->debugfs_root, xhci,
+			    &xhci_runtime_ir_fops);

 	xhci_debugfs_extcap_regset(xhci, XHCI_EXT_CAPS_LEGACY,
 				   xhci_extcap_legsup,
--
2.43.0
