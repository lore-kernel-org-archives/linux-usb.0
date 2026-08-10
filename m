Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67716CA6F;
	Mon, 10 Aug 2026 02:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786329404; cv=none; b=rbVD65JNxnLdOtUwRw9F2vZzmgMflQHRvUdQo1sG44ti0Ug7lQDLdU4EYF6hznMPyCAvtflBDF3fQ+clI/RAHJdW+SbKUAfFogDOe/2ewImDe74Le6W/vti920iwOebB1QZsU3xRAwU/9zEsRGzSuOI8AGgvlcLLS318AxXE6tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786329404; c=relaxed/simple;
	bh=bHqr1yGMsgFKucpNBrZ4u4PE1U7kkrLJJ5JRFoRO9lU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bQbaF7icXIB36uAX9BQIZ6o9sQJdoWx6pcRtfX7lxe+IWJrQ5XvMFibhD2bmFvQ07qMFEPOd5m/lbADFrTHK+4delNP4AVHo6GOMaAgFESNnPb63t+C1k/+vstTs3B9WK4F5gTY2kKWlX+obDoGAHYl160GqThUknowpdUnPlpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4c75122c946411f1aa26b74ffac11d73-20260810
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:04c3f277-2a2c-4c1f-acd1-d55b22c85d1b,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:16732161d10f8f5410b515358820790f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4c75122c946411f1aa26b74ffac11d73-20260810
X-User: dengjie03@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1793676562; Mon, 10 Aug 2026 10:36:32 +0800
From: Jie Deng <dengjie03@kylinos.cn>
To: peter.chen@kernel.org,
	pawell@cadence.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Deng <dengjie03@kylinos.cn>
Subject: [PATCH v2] usb: cdns3: Fix NULL pointer dereference in cdns3_pci_probe
Date: Mon, 10 Aug 2026 10:36:26 +0800
Message-Id: <20260810023626.70669-1-dengjie03@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cadence USBSS controller is a two-function PCI device. The first
probed function allocates the driver data and stores it with
pci_set_drvdata(), while the second function reuses it via
pci_get_drvdata() when pci_is_enabled() reports that the first
function has already been probed.

When the second function is probed while the first one has been
enabled but has not yet set its driver data, pci_get_drvdata()
returns NULL, and the subsequent wrap->devfn assignment dereferences
a NULL pointer and crashes the kernel.
logs:
Call trace:
  cdns3_pci_probe+0xa4/0x300
  local_pci_probe+0x44/0xa8
  pci_call_probe+0x54/0x158
  pci_device_probe+0x84/0x100
  really_probe+0x184/0x3d0
  __driver_probe_device+0x80/0x178
  driver_probe_device+0x44/0xe8
  __driver_attach+0xec/0x1f8
  bus_for_each_dev+0x7c/0xe0
  driver_attach+0x28/0x38
  bus_add_driver+0x110/0x238
  driver_register+0x64/0x128
  __pci_register_driver+0x50/0x60
  cdns3_pci_driver_init+0x28/0x38
  do_one_initcall+0x5c/0x280
  do_initcalls+0x104/0x1d8
  kernel_init_freeable+0x140/0x218
  kernel_init+0x28/0x1f8
  ret_from_fork+0x10/0x20

Return -EPROBE_DEFER in this case so that probing is retried after
the first function has completed its probe.

Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
Acked-by: Peter Chen <peter.chen@kernel.org>
---
Changes in v2:
- Fix the wrong Fixes tag: 8bc1901ca7b0 was reverted, use 7733f6c32e36
  which introduced the driver in the current tree (per Peter Chen's review)
- Add Acked-by from Peter Chen

 drivers/usb/cdns3/cdns3-pci-wrap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
index eb5760f75b9d..fd06a3d8e638 100644
--- a/drivers/usb/cdns3/cdns3-pci-wrap.c
+++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
@@ -96,6 +96,11 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
 
 	if (pci_is_enabled(func)) {
 		wrap = pci_get_drvdata(func);
+		if (!wrap) {
+			dev_err(&pdev->dev,
+				"second function not initialized, retrying\n");
+			return -EPROBE_DEFER;
+		}
 	} else {
 		wrap = kzalloc_obj(*wrap);
 		if (!wrap)
-- 
2.25.1

