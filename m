Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB865846A
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 02:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787021877; cv=none; b=C3tyKtI/J3MJ1KLD3Qp4v53kKtZAlHie4fA+FjcAB0H7ziyxsYLge8UKM1vpnVItd6opShdjv8xfU+iLbgnkCNgaVpeOapXCt3Lz54pesHQqQRDbPERycVklQiiJwlHNYRvpNyvnXxyaTY6k+amFw9QVG3zpOU//ozimBJcZ3l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787021877; c=relaxed/simple;
	bh=hmqjrm7JN0bFewhwmx5whgZovzdNSmYzfg1AKUkjqi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hSLOUGlfIQ0DQUFa1o1Ggg1W32AAQukH2Bt631x/ttu53ZQgAtqs4+Z2LlopxuMdvqOozE6PAV6JGSaFZ5jeGNuV5we4g1jdQHaWI+F20lnS13sBmhyDIfTXJAQXp5B0t1UViT6DRvG5VBWErfCZKTonGqggZVE2xsvuZf2+IME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 980311a69ab011f19a56ed5b684f684d-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:882c6e56-00a0-47a0-a594-9d54069cc498,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:7db8b62,CLOUDID:72ed963ce4dd209f14d8d23b8defdc86,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:1|44|-1
	00,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_EDM_RNO
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 980311a69ab011f19a56ed5b684f684d-20260818
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1948136474; Tue, 18 Aug 2026 10:57:48 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] tools: usb: ffs-test: fix pthread_join return value check
Date: Tue, 18 Aug 2026 10:57:33 +0800
Message-ID: <20260818025733.1911-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pthread_join() returns 0 on success or a positive error number on
failure. It never returns a negative value, so the "if (ret < 0)"
check in join_thread() is always false and the error path is dead
code.

Use "if (ret)" instead to correctly detect thread join failures.

Fixes: 93f2aa4ddd25 ("USB: ffs-test: FunctionFS testing program")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/usb/ffs-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/usb/ffs-test.c b/tools/usb/ffs-test.c
index 22b938fbdfb7..dd8a1d537971 100644
--- a/tools/usb/ffs-test.c
+++ b/tools/usb/ffs-test.c
@@ -473,7 +473,7 @@ static void join_thread(struct thread *t)
 {
 	int ret = pthread_join(t->id, NULL);
 
-	if (ret < 0)
+	if (ret)
 		err("%s: joining thread", t->filename);
 	else
 		debug("%s: joined\n", t->filename);
-- 
2.43.0

