Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0312240759D;
	Fri,  7 Aug 2026 10:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097052; cv=none; b=GUeyULw/UI7YHAIhL1IVnoh4cs24Q8aAKNC+U2M5DABkW55YBiKX7wvolxOQ4MmuoJRQcNckislyupHU2YRaTmSjWQsz4DNaWXWlmryK3Uhhzqqx8dJMG8WfHfaE4PtNSDoX+SJQK9C45Y25LaxaF5YF3oKlkPkhbshGzcwkJWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097052; c=relaxed/simple;
	bh=gYvAL6Bap47badhJJkSro/dQIKoKROnkObrvc385Ux0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P7Nr/QbLdkaUNkD+0mNMXjcXAVB9zMtO4fzafbGNSs/7g2qqmhlZbHheqdRMTl0rBIQ3ZxFlwNKouG8+JoDgXLb7M1MLyb8iWxp/JuaHiWRmv32Wae6B5SwXJNt1tDMVIa8EeTZE7AcF2W38Xcs9gWEnzZaM61FQmB4ocJ9EDrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 51b57584924711f1aa26b74ffac11d73-20260807
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:13760116-e5f9-4259-b5bf-dd6bef51b244,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:0236c0ae3bcbb0fc6514f2d8c3f5cee2,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 51b57584924711f1aa26b74ffac11d73-20260807
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 531783159; Fri, 07 Aug 2026 18:04:03 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Minas Harutyunyan <hminas@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huang Wei <huangwei@kylinos.cn>,
	kakapapa2 <kakapapa2@gmail.com>
Subject: [PATCH] usb: dwc2: debugfs: fix memory leak of hsotg->regset
Date: Fri,  7 Aug 2026 18:04:00 +0800
Message-Id: <20260807100400.3179625-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hsotg->regset is allocated in dwc2_debugfs_init() using devm_kzalloc()
but is never explicitly freed. While devres would eventually reclaim
the memory, the regset is logically owned by the debugfs lifetime:
dwc2_debugfs_exit() only removes the debugfs directory and leaves
hsotg->regset dangling.

Switch to kzalloc() and free it explicitly in dwc2_debugfs_exit(),
mirroring the equivalent fix already applied to dwc3 in commit
e6bdf8195b4a ("usb: dwc3: fix memory leak of dwc->regset"). Also set
the pointer to NULL after freeing to avoid a stale dangling pointer.

Reported-by: kakapapa2 <kakapapa2@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219977
Signed-off-by: Huang Wei <huangwei@kylinos.cn>
---
 drivers/usb/dwc2/debugfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/debugfs.c b/drivers/usb/dwc2/debugfs.c
index 3116ac72747f..2ecbf6523aaa 100644
--- a/drivers/usb/dwc2/debugfs.c
+++ b/drivers/usb/dwc2/debugfs.c
@@ -9,6 +9,7 @@
 #include <linux/spinlock.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
+#include <linux/slab.h>
 #include <linux/uaccess.h>
 
 #include "core.h"
@@ -787,8 +788,7 @@ int dwc2_debugfs_init(struct dwc2_hsotg *hsotg)
 	/* Add gadget debugfs nodes */
 	dwc2_hsotg_create_debug(hsotg);
 
-	hsotg->regset = devm_kzalloc(hsotg->dev, sizeof(*hsotg->regset),
-								GFP_KERNEL);
+	hsotg->regset = kzalloc_obj(*hsotg->regset, GFP_KERNEL);
 	if (!hsotg->regset) {
 		ret = -ENOMEM;
 		goto err;
@@ -810,4 +810,6 @@ void dwc2_debugfs_exit(struct dwc2_hsotg *hsotg)
 {
 	debugfs_remove_recursive(hsotg->debug_root);
 	hsotg->debug_root = NULL;
+	kfree(hsotg->regset);
+	hsotg->regset = NULL;
 }
-- 
2.25.1

