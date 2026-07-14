Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEB93F4100;
	Tue, 14 Jul 2026 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784019746; cv=none; b=XrnU5gpi1Yy1O2hADhN0FBoSSpiTb9EgEQjzx2489+EcFKoNzHjcM/ctNPhppZwYbc7eZdrzMbNrZNDdFfTywe+6d9QoSW1JAz3hJRLCd0Q1IqUqqF/K0pBn2tR9Qh6Oze4NrsYJ3cwuVbbWevqFwR7RZNG6cRG3ZssPyAHLpao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784019746; c=relaxed/simple;
	bh=vv1a7frgyIT9kiGn8P7iuYRwupOlQtBBXrJCYLfcmv0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L7EI/RMT4TOoym36yDYSABdF1IJAcQN0bNUUIE2Bi4JKf+FsTiNXBZPs3W6yvzAOD06pP+CIMosmAqsgcnZmDI6wa4bEuLUiBu07v+qUSILS7nwJYU4+rE1/dZh93h9sKw60s0L0wSDG2ZwCo3+DOLILQqqvSqM7+uxEHzaJGuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b65dedba7f6211f1aa26b74ffac11d73-20260714
X-CID-CACHE: Type:Local,Time:202607141654+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5988cbf7-d9ff-48c7-85ce-e627f6b8aee5,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:cb1c2a9e8f3e2726e6e658f5b4278199,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b65dedba7f6211f1aa26b74ffac11d73-20260714
X-User: dengjie03@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1184876177; Tue, 14 Jul 2026 17:02:16 +0800
From: Jie Deng <dengjie03@kylinos.cn>
To: mathias.nyman@intel.com
Cc: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Jie Deng <dengjie03@kylinos.cn>
Subject: [PATCH] usb: xhci: Restore MSI/MSI-X reinitialization on resume for RESET_ON_RESUME hosts
Date: Tue, 14 Jul 2026 17:02:10 +0800
Message-Id: <20260714090210.1201964-1-dengjie03@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 944e7deb4238 ("xhci: Avoid PCI MSI/MSIX interrupt
reinitialization at resume") moved MSI/MSI-X setup out of xhci_run()
into a PCI-specific xhci_pci_run() that is only invoked at probe time,
and removed the xhci_cleanup_msix() call from xhci_resume().

The rationale (avoid redundant MSI reconfiguration on every resume) is
sound for controllers that preserve state across suspend.  It is however
*harmful* for controllers carrying XHCI_RESET_ON_RESUME: those hosts are
fully reset on every S3 resume, and on some of them (e.g. ASMedia 3042)
the MSI/MSI-X delivery path is no longer functional after the controller
reset + D3->D0 transition.  Because the MSI vectors are now kept around
unchanged across resume, the first post-resume command-completion event
(ENABLE_SLOT) is delivered to a stale MSI channel and never reaches the
CPU, which surfaces as:
  xhci_hcd 0000:05:00.0: Error while assigning device slot ID: Command Aborted
  xhci_hcd 0000:05:00.0: Max number of devices this xHCI host supports is 127.
  usb 1-2: device not accepting address 3, error -22
  xhci_hcd 0000:05:00.0: Error while assigning device slot ID: Command Aborted
  xhci_hcd 0000:05:00.0: Max number of devices this xHCI host supports is 127.
  usb 1-2: device not accepting address 3, error -22
  xhci_hcd 0000:05:00.0: Error while assigning device slot ID: Command Aborted
  xhci_hcd 0000:05:00.0: Max number of devices this xHCI host supports is 127.
  usb 2-2: device not accepting address 3, error -22

Up to v6.3 the resume reset path did xhci_cleanup_msix() and, through
xhci_run() -> xhci_try_enable_msi(), re-allocated the vectors, which
incidentally re-armed the MSI delivery path and masked the hardware
issue.  Work it around by restoring that behaviour, but only for hosts
marked XHCI_RESET_ON_RESUME and only for PCI devices (platform/RCAR
hosts using the same quirk must not be touched).

Fix: 944e7deb4238 ("xhci: Avoid PCI MSI/MSIX interrupt reinitialization at resume")
Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
---
 drivers/usb/host/xhci-pci.c |  6 ++++--
 drivers/usb/host/xhci.c     | 19 +++++++++++++++++++
 drivers/usb/host/xhci.h     |  2 ++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 6b3fcba44b08..77b3215c95f3 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -126,7 +126,7 @@ static void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 }
 
 /* Legacy IRQ is freed by usb_remove_hcd() or usb_hcd_pci_shutdown() */
-static void xhci_cleanup_msix(struct xhci_hcd *xhci)
+void xhci_cleanup_msix(struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
@@ -138,9 +138,10 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 	pci_free_irq_vectors(pdev);
 	hcd->msix_enabled = 0;
 }
+EXPORT_SYMBOL_GPL(xhci_cleanup_msix);
 
 /* Try enabling MSI-X with MSI and legacy IRQ as fallback */
-static int xhci_try_enable_msi(struct usb_hcd *hcd)
+int xhci_try_enable_msi(struct usb_hcd *hcd)
 {
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
@@ -207,6 +208,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	hcd->irq = pdev->irq;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(xhci_try_enable_msi);
 
 static int xhci_pci_run(struct usb_hcd *hcd)
 {
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 091c82ca8ee2..7dd3afcf6b2e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1190,10 +1190,29 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		xhci_for_each_ring_seg(xhci->cmd_ring->first_seg, seg)
 			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
 
+		/* XHCI_RESET_ON_RESUME hosts are fully reset on every resume.
+		 * On some of them (e.g. ASMedia 3042) the MSI/MSI-X delivery
+		 * path is no longer valid after the reset + D3->D0 cycle, so
+		 * tear the vectors down here and let xhci_try_enable_msi()
+		 * re-allocate them below, matching pre-6.4 behaviour.
+		 */
+		if (xhci->quirks & XHCI_RESET_ON_RESUME)
+			xhci_cleanup_msix(xhci);
+
 		xhci_debugfs_exit(xhci);
 
 		xhci_init(hcd);
 
+		/* Re-arm the MSI/MSI-X delivery path for RESET_ON_RESUME PCI
+		 * hosts. xhci_run() no longer does this (it was moved to the
+		 * probe-only xhci_pci_run()), and the stale vectors left over
+		 * from before suspend cannot carry the first post-resume
+		 * command-completion event on affected hardware.
+		 */
+		if ((xhci->quirks & XHCI_RESET_ON_RESUME) &&
+		    dev_is_pci(hcd->self.controller))
+			xhci_try_enable_msi(hcd);
+
 		/*
 		 * USB core calls the PCI reinit and start functions twice:
 		 * first with the primary HCD, and then with the secondary HCD.
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2d3941b5e1e3..a72ebfbb634a 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1903,6 +1903,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume);
 
 irqreturn_t xhci_irq(struct usb_hcd *hcd);
 irqreturn_t xhci_msi_irq(int irq, void *hcd);
+void xhci_cleanup_msix(struct xhci_hcd *xhci);
+int xhci_try_enable_msi(struct usb_hcd *hcd);
 int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev);
 int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
-- 
2.25.1

