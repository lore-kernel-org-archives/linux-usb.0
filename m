Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6267A23B62B;
	Mon, 17 Aug 2026 06:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786947334; cv=none; b=HIA7rggHXzmqHzPCO5d/MP+Ss6orZUEYOKJPOu+siqJNHDb9uo1Tkyaby25jnAnSFfPYtTNoRWMHPHgBmD19GJJgqeSYq38w7qgX/IQHwwmHO5zqNXw4M1OgPAoVVYPOeDhGHfCUPMa3oPvry7Lg3qwjDEFonbMgPHFsPry2Gc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786947334; c=relaxed/simple;
	bh=WvvLLlr1T4t4NPPQ3Ffc2z9WzWqtu2TmelcD8+GLe4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIA/9JZQ1sVDbcqiXyFOg2wyRSY2ZkVGJnf0f9wKX8+vfQyISczUySn9SnzJmim5ODEAvRwBYD4rk8zjvyHuHM2jYyZpH9LwusYcJMA5OyGPdPFk6xIYNfcQZ5X0SpzKeT3ORLLBrH8OBOu6lKtGRnDcdBBDrC63nwFIgUyIMl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0b4cbbe89a0311f19a56ed5b684f684d-20260817
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:40547f95-3c03-40fd-b64c-1b999dfdb99f,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:7db8b62,CLOUDID:5b035b48cfa0a0df76b48da5940a1a32,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:1|-100,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0b4cbbe89a0311f19a56ed5b684f684d-20260817
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 553626068; Mon, 17 Aug 2026 14:15:29 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] usbip: add NULL check for calloc in do_standalone_mode
Date: Mon, 17 Aug 2026 14:15:14 +0800
Message-ID: <20260817061514.765-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a NULL check for the return value of calloc() in
do_standalone_mode(). If calloc() fails and returns NULL, the
subsequent access to fds[i].fd would cause a NULL pointer
dereference.

Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/usb/usbip/src/usbipd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
index 3e22b651c754..dbc2b48363b2 100644
--- a/tools/usb/usbip/src/usbipd.c
+++ b/tools/usb/usbip/src/usbipd.c
@@ -544,6 +544,11 @@ static int do_standalone_mode(int daemonize, int ipv4, int ipv6)
 	dbg("listening on %d address%s", nsockfd, (nsockfd == 1) ? "" : "es");
 
 	fds = calloc(nsockfd, sizeof(struct pollfd));
+	if (!fds) {
+		err("calloc for pollfd");
+		usbip_driver_close(driver);
+		return -1;
+	}
 	for (i = 0; i < nsockfd; i++) {
 		fds[i].fd = sockfdlist[i];
 		fds[i].events = POLLIN;
-- 
2.43.0

