Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1DF395AFA;
	Tue, 18 Aug 2026 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042562; cv=none; b=fS+C8mX8PzTFJyYhuAtGRMYgTG1YKZvAOvJBGpDOllQp/2szWNbt2qi32DK6AHUU9VOzPgRoYx3n4Jta72TnC8kzYnJtGxZ2N8pNcshJTAPEEmRLFLHL+JkKwicyB2zP98DpsY6Yq0KxEvk/d96LucmC8CuB8F6Oz58ftkkSRKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042562; c=relaxed/simple;
	bh=/HIfcmZ4tcSAaPsV1jRvZqTQwgPybKXRxnYd0/qXBHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MO5JhdkAAdDkH6/tbCuKkf0aZDJQ3dnCiZPABzoGk/UiyruJCqlcqKB7pstKQZhSr/SUb1wooLk04ETei8+DAevJhyl6RdAUs9tvQikFtR42c7XOkjQpPSH32xhs/pOw7rOXFMRf3vFm0FUA9uVzOYvf+Mq02ra0tZctsfqNnDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c1d86d349ae011f19a56ed5b684f684d-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:16013340-6b12-4b47-b117-d449a7598bab,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:be3b0a7b8a9329f209210adffb4ef57b,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|850|865|898,TC:nil,Content:0|15|50,E
	DM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c1d86d349ae011f19a56ed5b684f684d-20260818
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 548216937; Tue, 18 Aug 2026 16:42:34 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gonglinkai@kylinos.cn
Subject: [PATCH v2] usb: gadget: f_hid: drop ERROR() on copy_from_user() failure
Date: Tue, 18 Aug 2026 16:42:24 +0800
Message-Id: <20260818084224.1879665-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260818012118.3903388-1-gonglinkai@kylinos.cn>
References: <20260818012118.3903388-1-gonglinkai@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed copy_from_user() is a userspace fault, not a kernel error.
Do not spam the log, and return -EFAULT instead of -EINVAL.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
v2:
- Return -EFAULT instead of -EINVAL (David Laight)

 drivers/usb/gadget/function/f_hid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d06a6d..b8e1c0e0f1a2 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -656,9 +656,8 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
 
 	if (copy_from_user(&entry->report_data, buffer,
 				sizeof(struct usb_hidg_report))) {
-		ERROR(cdev, "copy_from_user error\n");
 		kfree(entry);
-		return -EINVAL;
+		return -EFAULT;
 	}
 
 	report_id = entry->report_data.report_id;
-- 
2.25.1
