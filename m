Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.74.67.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443938;
	b=pSVNtwwSIdJlxN00DgBadFKohoAtJhQso00TqioAood7/0EEyjeOMgMoC8WtweBP6g3A
	 Dyuqt1PysD+F1YxcChHJ2y4UDQHnEOKh1S93HkSgldD2iVJPwbpfOaNCX/I/u2dj+I4c6
	 0LSoPQLmJOU1+MyZ6qHYAGFBZvD56tvW3cc23wq2pIQYPbnmfGTTdfcuPFQ+CSQT3FDO9
	 X7REaN6Es2GxASRgX1qjbX2bhxTcBEnX4jBDZ3fIlh1gY4aFcJY5w3LRJuJde88Xb/lbe
	 6sXefGF75FtbdwebkXhXGUC+/Ki6kFflp9xIVca1EWpeDIVITDbvER5EK2LJsssrZmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443938;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 DKIM-Signature;
	bh=s993QDJ+0cBPgokfj9se/N7j69mh8bQ7H38pHF7uEYs=;
	b=RNyigfBRTtNggI0SquJGTR0l66gPDl86HDQSzv6smZFcz1q2UIsQ70a6ZPGrXCURfm7h
	 Lv0c5y9NsPmU+x/eo5W0Pjhu8vajb+ZJJr8yNAA4ux1cJS9kQrg9jWRWdOpZXBJsbDzXi
	 UZcTYujLik8Ov91jfqZDBdEKdHnIjt9Ag/zwZO0RaIyAt6/058xRTt9NmFTXHBR5qIk/X
	 D7tdiJxpzljW0xQlPo1eytmgc9f4lZXFb8XGwXzavSebn8F3wWgZ+a1dERBz5Pw+LtMx7
	 9ciH2YGvWyvpfuifNvjSCap54Nauaonx7b/fkngSzCaTZO3Rq0XA3FIsJciLCk+hHjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=poczta.fm;
	spf=pass smtp.mailfrom=poczta.fm;
	dkim=pass header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=C3I7JFgh;
	arc=none smtp.remote-ip=217.74.67.63
Received: from smtpo63.interia.pl (smtpo63.interia.pl [217.74.67.63])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A63606A333
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 14:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A63606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=C3I7JFgh
Received: from localhost (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Mon, 23 Nov 2026 15:25:33 +0100 (CET)
From: Slawomir Stepien <sst@poczta.fm>
To: gregkh@linuxfoundation.org,
	jiashengjiangcool@gmail.com,
	yun.zhou@windriver.com,
	zzzccc427@gmail.com,
	bigeasy@linutronix.de,
	nab@linux-iscsi.org
Cc: Slawomir Stepien <sst@poczta.fm>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] usb: gadget: f_tcm: detach gadget when dropping an enabled TPG
Date: Mon, 23 Nov 2026 15:25:12 +0100
Message-ID: <20261123142513.204652-3-sst@poczta.fm>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123142513.204652-1-sst@poczta.fm>
References: <20261123142513.204652-1-sst@poczta.fm>
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1795443935; bh=s993QDJ+0cBPgokfj9se/N7j69mh8bQ7H38pHF7uEYs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=C3I7JFghO79ez0l2jAaJZRSQBVG7fflMuDZIA6Z4Px98Np4D9JtopLW49a6KRZVCZ
	 1b9sojHd9knbxNtVCETubSDbat52YPcuOQL3lkKLtazpQoVfkHUAGv18B3k1Djd55O
	 HtKIs11qOsetCvtOycSPTXSRBMl80a5geZyIdXGM=

Removing a TPG directory via configfs rmdir ends up in usbg_drop_tpg()
through target_fabric_tpg_release(). The target core does not disable
the TPG first, so if the TPG is still enabled and the gadget is bound to
a UDC, usbg_drop_tpg() destroys the TPG workqueue and frees the TPG
while the bound function still references it through fu->tpg.
Subsequent USB traffic (tcm_setup(), bot_submit_command(),
usbg_submit_command(), ...) then dereferences freed memory and queues
work onto a destroyed workqueue.

Disable the TPG through usbg_enable_tpg() before tearing it down, so the
gadget is unbound in the same way as when writing 0 to the enable
attribute. Only do so when the gadget is connected: for the legacy
g_target driver, detaching a never-attached TPG would call
usb_composite_unregister() on a driver that was never registered.

This goes through tcm_unregister_callback(), which no longer holds
dep_lock across unregister_gadget_item() after the previous patch.
With it, a TPG is never freed while a function is still bound to it.
fu->tpg is still only set at link time; the next patch fixes that.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 drivers/usb/gadget/function/f_tcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 110a7d334afa..3949b5c50cc0 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1739,6 +1739,7 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
 }
 
 static int tcm_usbg_drop_nexus(struct usbg_tpg *);
+static int usbg_enable_tpg(struct se_portal_group *se_tpg, bool enable);
 
 static void usbg_drop_tpg(struct se_portal_group *se_tpg)
 {
@@ -1747,6 +1748,9 @@ static void usbg_drop_tpg(struct se_portal_group *se_tpg)
 	unsigned i;
 	struct f_tcm_opts *opts;
 
+	if (tpg->gadget_connect)
+		usbg_enable_tpg(se_tpg, false);
+
 	tcm_usbg_drop_nexus(tpg);
 	core_tpg_deregister(se_tpg);
 	destroy_workqueue(tpg->workqueue);
-- 
2.56.0

