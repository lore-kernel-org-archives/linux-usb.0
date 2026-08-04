Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47C82FDC57
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 03:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785814427; cv=none; b=Vc/nti7d2boc1zRskp0XpU+22mZJSwMvLWpwA8TeWcH8+Z81CZybqRr2cM9mx06ILk2jnNXjFnD4LFPcmm1eQRkoqVoVM0YHYLgoso4beImSU+A/Nv7nZPcaTND6ycjo+J6uhl79SgWqv1k6c1R5Jhymp8o2ypRNQ+oNqrMAKxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785814427; c=relaxed/simple;
	bh=JJPT5uu44aQguJzoiNHoy/Ath8/gUc7Bf0ZjaZG+5GY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U56SPo54ZwsUNFJDjcIqwlyrpkY44d9Gm7zFBlh7MfsXjOMh7C1mqI7lW/rGykzxy5+CrffF/6Pf7N6vu9ccZ9RnLHD5+qYnuj6ZPmy/Z/GrFoqSWJvTkwnmTYEDoZYwQRVtL2zRU/ytmDA930Ik9XcVMtBZN5eFNIEwgKyTE18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+ES+5hl; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+ES+5hl"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso398237a12.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 20:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785814425; x=1786419225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=seZC1uxNZsDIE6HCcr0pbelK6/1aquebV/a2t6CIBO4=;
        b=F+ES+5hl3g5aRc5y40QhB+4mc314BXjM5dWtFkXtfv16J8XOPZmA8o27pioKF+NC7p
         udWp5jyB5Uo8lmLq/IkHVXbheq0827uqK9zczTqKb8w4X85FSFRRaeGNe/T72PUR/dSn
         Dlx1dandjn19hZ/nP9Mqd9RHHbSMqXDOg46cza9zTQCc98SaNWxEkwCOz/CLEET6lyp3
         GJC9+Ex2XivuHYNk8daWlW1Xx1BBAI/GxqkuKnACmFVSILrweDTQ+lfO2IkJE/iPZsgr
         Wlz1rGGYejrIZZ5W6id5aVm4FzZnWK/lGlDAVPQSV2zQQ1rxJFNrDjkwn0BNPTtKcHNe
         4XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785814425; x=1786419225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=seZC1uxNZsDIE6HCcr0pbelK6/1aquebV/a2t6CIBO4=;
        b=sR69xZe4T4x2agzIwR5335P3g4IS3lKKFzfxpWJdOExU3GC8TdpsjhQ/AFcsQOA9cy
         /UovxnxS5QXAQvz1fpTGJJvIzVnXw3OXX89eR1f1vCqDjILaBshqJLzmF/J3SzSdP8Hg
         jJiPgMnEIE+qqpoBZBZfN2Ab38tFaKZD14374F1Amz7tsVIM0AwikyR48FU5Cfk2LSIH
         p5txa/jDnu2BOldYTeTPyzf3sBA56AX1+DdV8ik/q5nOX7DneajJqB/e4c+zjsYxj0Gm
         6bEaLrE+yNDrKlpzShRpnviCjUZz5rj6NuyRUrPaQwOJnvk1xbQHQmJ4FT4bhG6baDDY
         aIlw==
X-Gm-Message-State: AOJu0YxBvQMjZS7CZjXHeYzXGh7YCKXkSVLt2WFXZ6wbKd/YEvs1HGqp
	xPIiX8JmIm5e58z0srl8fVsFjYucn7UQabRUMpOFAlF8zmzMnaWYXUhi
X-Gm-Gg: AR+sD1334Qz2ebPzR+x+YhnarIqhjU6pP9UDWQRMAVtxmJjqPx2hR9KI1B4shzutWye
	YhXJ+QQ3zTG3VFMjn8VsvQP9aFxFoTYH5yTkxCMnA8NZK1TxZaVBNpxsQMXTg6Ba6Y8ZBzXGuLv
	Ml+FBTqLSPUY9WfcTqSwDdfF/K1fgw1TC/kffM//T9AO0mUldvIx/uRQNOwMgnOi6sb6T+xjSMT
	UNxVvud5AjUGVIKasiMhzar1kYK99R7vJQcesCA5Q83aA9vJX1w97nngOnPggoo7cNWTBMvgJbr
	nkefZjZAt6vivR6crNdFZFz40RevXEvnWzRSxr8Pk2WNqomjq0ZuVemlAupX7oQimjTQ3IWUX/4
	KzKhGDcgx9OcTfvHa1VQFPjskg2KPfsf6BYYtdsQZu9M8HNmLd1KdNwy/2QMM3O9UinWt17ngBF
	3HZYDlfhXT87EYTzbLMlN+c3XpCAYACQdcQXvedBeYeDH0qDr9TrkceTMdf/FGoN2BZwd3AaVde
	u8DF76fsCZAlbKagun2Nt4i6WyR5DFVZXef
X-Received: by 2002:a05:6a21:6906:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3cb6c752d6dmr2124947637.2.1785814424915;
        Mon, 03 Aug 2026 20:33:44 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04506csm46215078eec.17.2026.08.03.20.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 20:33:44 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Subject: [PATCH] usb: gadget: f_phonet: fix use-after-free in pn_bind
Date: Tue,  4 Aug 2026 11:33:41 +0800
Message-Id: <20260804033341.2784711-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phonet_free_inst() checks opts->bound to decide whether to call
gphonet_cleanup() or free_netdev(). If opts->bound is false,
free_netdev(opts->net) is called immediately.

However, pn_bind() can race with phonet_free_inst() when a configfs
entry is removed while binding is in progress. pn_bind() reads
opts->bound and calls gphonet_set_gadget(opts->net, ...) before
setting opts->bound = true. If phonet_free_inst() runs concurrently
after the !opts->bound check in pn_bind() but before opts->bound is
set, it will free opts->net, causing a use-after-free when pn_bind()
subsequently writes to net->dev.parent via gphonet_set_gadget().

Fix this by adding a mutex to f_phonet_opts and holding it in both
pn_bind() and phonet_free_inst() when accessing opts->bound and
opts->net. This is consistent with how other gadget functions such
as f_eem protect their opts->bound flag.

Fixes: 00a2430ff07d ("usb: gadget: Gadget directory cleanup - group usb functions")
Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=098999e05b6b877c01b3
Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
---
 drivers/usb/gadget/function/f_phonet.c | 16 ++++++++--------
 drivers/usb/gadget/function/u_phonet.h |  1 +
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
index b1ee9a7c2..b7eae14e8 100644
--- a/drivers/usb/gadget/function/f_phonet.c
+++ b/drivers/usb/gadget/function/f_phonet.c
@@ -499,20 +499,17 @@ static int pn_bind(struct usb_configuration *c, struct usb_function *f)
 
 	phonet_opts = container_of(f->fi, struct f_phonet_opts, func_inst);
 
-	/*
-	 * in drivers/usb/gadget/configfs.c:configfs_composite_bind()
-	 * configurations are bound in sequence with list_for_each_entry,
-	 * in each configuration its functions are bound in sequence
-	 * with list_for_each_entry, so we assume no race condition
-	 * with regard to phonet_opts->bound access
-	 */
+	mutex_lock(&phonet_opts->lock);
 	if (!phonet_opts->bound) {
 		gphonet_set_gadget(phonet_opts->net, gadget);
 		status = gphonet_register_netdev(phonet_opts->net);
-		if (status)
+		if (status) {
+			mutex_unlock(&phonet_opts->lock);
 			return status;
+		}
 		phonet_opts->bound = true;
 	}
+	mutex_unlock(&phonet_opts->lock);
 
 	/* Reserve interface IDs */
 	status = usb_interface_id(c, f);
@@ -621,10 +618,12 @@ static void phonet_free_inst(struct usb_function_instance *f)
 	struct f_phonet_opts *opts;
 
 	opts = container_of(f, struct f_phonet_opts, func_inst);
+	mutex_lock(&opts->lock);
 	if (opts->bound)
 		gphonet_cleanup(opts->net);
 	else
 		free_netdev(opts->net);
+	mutex_unlock(&opts->lock);
 	kfree(opts);
 }
 
@@ -636,6 +635,7 @@ static struct usb_function_instance *phonet_alloc_inst(void)
 	if (!opts)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_init(&opts->lock);
 	opts->func_inst.free_func_inst = phonet_free_inst;
 	opts->net = gphonet_setup_default();
 	if (IS_ERR(opts->net)) {
diff --git a/drivers/usb/gadget/function/u_phonet.h b/drivers/usb/gadget/function/u_phonet.h
index ff62ca22c..4666413fc 100644
--- a/drivers/usb/gadget/function/u_phonet.h
+++ b/drivers/usb/gadget/function/u_phonet.h
@@ -13,6 +13,7 @@
 
 struct f_phonet_opts {
 	struct usb_function_instance func_inst;
+	struct mutex lock;
 	bool bound;
 	struct net_device *net;
 };
-- 
2.34.1

