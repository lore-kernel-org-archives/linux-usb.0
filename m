Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425A4375F67;
	Tue, 23 Jun 2026 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199360; cv=none; b=e4/yoTymDw5IGUXuZSlov1KRG0iO5u5SWNlW6H4I14nzMWTyt7mZgIAgE5ZqHUT0hVkqbW4wp/orZaExDZH6KJt/Yr83Wzxb/UGvPfiqk7Z1hSKIJeRn6cAA0yhwRFdfaqOnJimpEwT09wJSWUgfVhNodecA63WBmgbfn+H+iRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199360; c=relaxed/simple;
	bh=6oZHtSGN1axWPoO7G7atZZXyrhY+by302a0hNee9d/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fqu0NpfIMgHkvz5nGvBiJMmRtwb4poJEo64CQtrJOGnyCq50bQiljguB/mEkQ2nxE9wZUNYz1NkakdgOBLxocHEpDLAY4OwFlM0U9q5G8PTIkVgFmK8guc0MF+zkWCCLnSO7Gw+49HzsAXFlpK5ibzpNemldB75wzA5sDlXQpcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4a917a286ed411f1aa26b74ffac11d73-20260623
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR, DN_TRUSTED
	SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD_SPF, CIE_UNKNOWN
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:fd54e42f-80b0-41bd-a663-0b0a2202b272,IP:10,
	URL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-10
X-CID-INFO: VERSION:1.3.12,REQID:fd54e42f-80b0-41bd-a663-0b0a2202b272,IP:10,UR
	L:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:EDM_GE969F26,ACTIO
	N:release,TS:-10
X-CID-META: VersionHash:e7bac3a,CLOUDID:529c76515e422231ead3dd5cbd70642b,BulkI
	D:260623152230JLGO609M,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|865
	|898,TC:nil,Content:0|15|50,EDM:1,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_AEC
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4a917a286ed411f1aa26b74ffac11d73-20260623
X-User: pengcan@kylinos.cn
Received: from lenovo [(74.48.78.170)] by mailgw.kylinos.cn
	(envelope-from <pengcan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 750956835; Tue, 23 Jun 2026 15:22:28 +0800
From: Can Peng <pengcan@kylinos.cn>
To: gregkh@linuxfoundation.org,
	kees@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Can Peng <pengcan@kylinos.cn>
Subject: [PATCH] USB: misc: adutux: use kmalloc_array() for read buffers
Date: Tue, 23 Jun 2026 15:22:11 +0800
Message-ID: <20260623072211.79481-1-pengcan@kylinos.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kmalloc_array() for the primary and secondary read buffers. Each
buffer stores four interrupt-in endpoint packets, so express the
allocation as 4 elements of in_end_size bytes and avoid open-coded
multiplication in allocator arguments.

Signed-off-by: Can Peng <pengcan@kylinos.cn>
---
 drivers/usb/misc/adutux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index 369d0d2ee2be..7615cb6bb482 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -680,7 +680,7 @@ static int adu_probe(struct usb_interface *interface,
 	in_end_size = usb_endpoint_maxp(dev->interrupt_in_endpoint);
 	out_end_size = usb_endpoint_maxp(dev->interrupt_out_endpoint);
 
-	dev->read_buffer_primary = kmalloc((4 * in_end_size), GFP_KERNEL);
+	dev->read_buffer_primary = kmalloc_array(4, in_end_size, GFP_KERNEL);
 	if (!dev->read_buffer_primary)
 		goto error;
 
@@ -690,7 +690,7 @@ static int adu_probe(struct usb_interface *interface,
 	memset(dev->read_buffer_primary + (2 * in_end_size), 'c', in_end_size);
 	memset(dev->read_buffer_primary + (3 * in_end_size), 'd', in_end_size);
 
-	dev->read_buffer_secondary = kmalloc((4 * in_end_size), GFP_KERNEL);
+	dev->read_buffer_secondary = kmalloc_array(4, in_end_size, GFP_KERNEL);
 	if (!dev->read_buffer_secondary)
 		goto error;
 
-- 
2.53.0

