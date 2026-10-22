Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.74.67.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676999;
	b=QM6f0oBS6PJKGfjtkpRTQrirngW8114v63qwwEZ9LKhQecPfrQn6gCOtOm2CMd/oXTaa
	 lnTRG6XOwXB48S9l9gRASCEYOgJUEjohLjdIkcOBd09Wrhqygs/4fdD/X1pw5KBo8mREJ
	 2UIdiJ8FHwwAcWXPRoYOxXwwH4yQFICeMIlXPZfmKLBGETxtLqrIvEIDoVf7oj38O2k11
	 onfqNFcZKZRWN9Tf3aAKFMvCOldzoVUuIrpQk2RcIYfP5v4JLMLusmpJErwUl6lElqRjj
	 CB5pDfD6cVADrwp78ljf3pZpNykSUxjlMx59F2mNmC9IzxhFUIiVqEspLZe8wJz8x2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676999;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 DKIM-Signature;
	bh=PNyZ8jU0Q5bdnVJblV2dUc0mxbUEeOldCttPO58NaBY=;
	b=NSQr20WMHnmIqME5TndIa4Q1dAsy05PBHENWrlOLOKAyC1L4uELK6QfT5BYvCfdm/bqG
	 7wb4RlLqN4We2FTjg2lnY/RXhsBd/OnqH9drI3otOYtxCndDbEWhGzKNZsq1WvbZ/9AMv
	 z8OOdBiZO9qLDYI/Tn3W/TVQwzqIOgs1BtvpHtiYfqxlKJfoyEsFOk6qpSPQv/N5nOa+X
	 1kTn0D44emubIyS4Mb22hY2IcU8Q4wRNfij3cZ/nXW6/nYYsKQbcYou1h/kremGrSbq1K
	 daB6WA23+/Z545yvoUcAv9bXYOWQtBiltfi5CggYof35BoB2oMmLvph5COWiohlOhjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=poczta.fm;
	spf=pass smtp.mailfrom=poczta.fm;
	dkim=pass header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=b84nQNjJ;
	arc=none smtp.remote-ip=217.74.67.49
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1669606AFC3
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1669606AFC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=b84nQNjJ
Received: from localhost (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Thu, 22 Oct 2026 15:49:54 +0200 (CEST)
From: Slawomir Stepien <sst@poczta.fm>
To: gregkh@linuxfoundation.org,
	andrzej.p@samsung.com,
	jiashengjiangcool@gmail.com,
	yun.zhou@windriver.com,
	zzzccc427@gmail.com,
	bigeasy@linutronix.de,
	nab@linux-iscsi.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slawomir Stepien <sst@poczta.fm>
Subject: [PATCH 2/3] usb: gadget: f_tcm: detach gadget when dropping an enabled TPG
Date: Thu, 22 Oct 2026 15:49:25 +0200
Message-ID: <20261022134926.1125473-2-sst@poczta.fm>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022134926.1125473-1-sst@poczta.fm>
References: <20261022134926.1125473-1-sst@poczta.fm>
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
	t=1792676996; bh=PNyZ8jU0Q5bdnVJblV2dUc0mxbUEeOldCttPO58NaBY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=b84nQNjJWmLpdtpGglqKdyZZQY3xionpaV0sR6sMiu/eeQIQ14xYDygJpkfnBsGbO
	 cwYAUjMb+1S7HLVdn8BYjuX4Tg3TuAvSGFJnOJqvjuZeFOalVlj59uL1JsPFaumoQj
	 xXSNRWVLftBUN7dM5Sdf2DY+hz55SAwlbO0XsJSs=

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

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 drivers/usb/gadget/function/f_tcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index cc75d7e9792a..bcf11f4405ae 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1742,6 +1742,7 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
 }
 
 static int tcm_usbg_drop_nexus(struct usbg_tpg *);
+static int usbg_enable_tpg(struct se_portal_group *se_tpg, bool enable);
 
 static void usbg_drop_tpg(struct se_portal_group *se_tpg)
 {
@@ -1750,6 +1751,9 @@ static void usbg_drop_tpg(struct se_portal_group *se_tpg)
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

