Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348012FB084;
	Mon, 17 Aug 2026 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786949304; cv=none; b=t0V6HuEGYjGC/ZjLoeJ5vZfjiwberPAtHQWE+EwajgqL4TxUkr0Xq+txNSBPnDboft8h5l+8xDYmmN43porhzqkyapzIALr7ox586uilzkI+SL8pBUJkBkFex3aAgDDpSMLnBc1HYfVuvSEmy70SgkoLHPu4bU7E3qWRno/K+l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786949304; c=relaxed/simple;
	bh=cQjWIB7WBX4vn1zHRzERh26qWEa3ecHk1NXFx510k50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MPQNes2VhWaZ2ZAdG9CYL1W59VK7335YrefXbUw28R4lpt3RWgN1cXa5yfOKWIG/7QR/bcqlxo1Y9K6pP2XZcqXwBse/0KMkZM6GPLSnbyrYJ1K5TzFSUezaULPpE8h6lYEiNHhKdQvs+5Xz+zGSZ52cT9kxEChJOFryMTprJB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9f32e0869a0711f19a56ed5b684f684d-20260817
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c436c57f-da83-4b40-b4d4-06b007e7e73c,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:3bc4842b5c3b6fd34dc469a199d0fde9,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9f32e0869a0711f19a56ed5b684f684d-20260817
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 664575798; Mon, 17 Aug 2026 14:48:15 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] usb: ffs-test: add NULL check for malloc in descs_to_legacy
Date: Mon, 17 Aug 2026 14:48:01 +0800
Message-ID: <20260817064801.797-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In descs_to_legacy(), the return value of malloc() is used without a
NULL check. If malloc() fails, dereferencing the resulting pointer
leads to a NULL pointer dereference. Add a NULL check and return 0 on
failure, consistent with the existing error handling at the start of
the function.

Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/usb/ffs-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/usb/ffs-test.c b/tools/usb/ffs-test.c
index 22b938fbdfb7..5c9281cbbff1 100644
--- a/tools/usb/ffs-test.c
+++ b/tools/usb/ffs-test.c
@@ -293,6 +293,8 @@ static size_t descs_to_legacy(void **legacy, const void *descriptors_v2)
 
 		length = sizeof out->header + (descs_end - descs_start);
 		out = malloc(length);
+		if (!out)
+			return 0;
 		out->header.magic = cpu_to_le32(FUNCTIONFS_DESCRIPTORS_MAGIC);
 		out->header.length = cpu_to_le32(length);
 		out->header.fs_count = cpu_to_le32(fs_count);
-- 
2.43.0

