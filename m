Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBDA3C455B
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 04:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785903205; cv=none; b=f8gPib/8U7UAqU3IqsSn5nT61ys7oa2hH2i5pNpLGTixzramzrQSAxl6JT1s4oa56Sb17yuZSmdZiVpD8JaDcCvZzC4493ggra5bdJOJ7pVEzDmZmIIgA3maOLlqpG5tmTSMlrvwyTVZKFvzQsj7pT5Ko5JCb/IVKwc3vmh9e8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785903205; c=relaxed/simple;
	bh=G6y86Bnl9pH5Yy5pJthkcZYErCAbB9k9Prmrewimk/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PGgQEw/rjcbAn1cPdcE7c+M0k0b4o3IpzEkRRE3yy+ToE7kSL9yw8ckrMLKjtHdEBlVTqEPHT8EPJn7t4Dq4w2WD0rODNMurqQzaWk+E7Svxqxd7bAfNCcvX2Zppi5YgDwd0QDJBvRgeutBN0uuc7zjTavqvG31iIP0uNvq1VWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yb18BwOX; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yb18BwOX"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8487214ad2bso842883b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 21:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785903203; x=1786508003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z14pFBM+gRuEL1nL/itnWoFwr8ux+8wC7KVMIdZnv9w=;
        b=Yb18BwOXGe2DflIgpzVyEFNXpf6tJVkXD+1Ghepimlj6P9gqXQLUtr8yystahIdQPE
         8PYivTb3f8L7gDw1I5VlINsvxQrIljFP9ivlJUXRZdqn3gZicyZtJjV0uzCvndoc7Nhs
         RBk6OjEhp/MjCOXfUFq5enGKPt44Cjz6SbVBfaUKKaOSjANiilFlpMcMqpwvtgmfqEve
         k4aBpokNdujuEw2M7HzzGMBM1LTEEqH0EpLlbqXenDor4z+fpY+xHcKtlgzTDoD9aXjo
         xq7hzxmgPXHsH6MTGowhjM+DI1HMRKMkhUM70IAnFJRdxSMccnYLRBbxDU2LL0gDZG56
         WR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785903203; x=1786508003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z14pFBM+gRuEL1nL/itnWoFwr8ux+8wC7KVMIdZnv9w=;
        b=NgUk3MkAG/wP2eWoHLSXB1dYNFVRp2igRSf6ZC1wvZfrkcgUvo7QCby2yKnfAloTiw
         L34z/Ju5B8GTE2w9hTEbDOLvh6Y6Z/CWkU36a1esHiZNM87TuLfIf3kJaKCzDBiQ6SSs
         oOgziVxcWc6s98V2wZK61b08XVtx2QqGRGkMDKBdiDsBwcBISjJPWFkTFmZUOX5HnFdi
         Mk31Hc61snEh4+hkv7dLA7QvE0B9btSXichGYEq8bM7gQP8M2mJssz6fX77zQLh8G3rA
         0KB2RUGZzdJ9ipJFZqZwlgbdRyHJnr0BsQfriOEhzlIkMVdMb0ZIBf9FN2Ki4jg2WpyC
         yNYQ==
X-Gm-Message-State: AOJu0Yx7+FphL/AKMQHSmgghvR5YGaQJm0PSrO83Nf6l7gyl+10SthKO
	c3Gcud3Qim9GWOqO8ns9wP9ifXsPqeuQU0iepgC2wppWLYoTyP0xjDyM
X-Gm-Gg: AR+sD12c27c/8oF96fvPWG4ty/2YmsM54pUxMGgFUVUTIbTGiXdgrBUWuEut41rLIId
	h6uHRi6Cr2UYM2CEXI/5APIz/M6Qc8SL5kCpxNIwhjNEjtJNHPo49JwHwKGcidoDsRxkkvZH8Mh
	arT1P1P/UZBvdUhfJd/H5iFwNytqx9jj+38qR/XLLFpknR+3xETUgsUa7Fq0sX83II7ynHg2Njw
	YDoYhbwmodZ7iYjruCHWdPIEeq9+YjSmBLE6/LWS0RJDpFppCuHxozSkxS8TyG3jDfAvqbV1ydN
	7Z4A1tXXFKDw75uO3yIB7UUqhYE2nNppq/dCOVe4c645Gf3DMt7bJdgorWXK4ysKCO7Uvlhyq17
	gQNCfccHAFMiMAYIdzHHs2U+e0hklwlZozXRzl/a5wYnz8OVxA2w272ylIbjVxy9IFJmJqCmRT9
	J2Z3kOaMIK+xftpXrsthZ2Y9EAvoY5MaTZxFXLSuF9PTTwiQ1/v0lpc73DoXiOzr2OybunD+CPx
	2W2JAPdrYLQ5w==
X-Received: by 2002:a05:6a21:3294:b0:39c:126c:93b5 with SMTP id adf61e73a8af0-3cb85e5402emr3945302637.21.1785903203521;
        Tue, 04 Aug 2026 21:13:23 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca908068sm8238608c88.12.2026.08.04.21.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 21:13:23 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>,
	syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
Subject: [PATCH v3] usb: gadget: f_phonet: fix use-after-free in pn_bind
Date: Wed,  5 Aug 2026 12:13:19 +0800
Message-Id: <20260805041319.3197126-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804074432.2906951-1-khiemtranzo532001@gmail.com>
References: <20260804074432.2906951-1-khiemtranzo532001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pn_bind() and phonet_free_inst() race on opts->bound and opts->net.
If configfs removes the function instance while pn_bind() is between
the !bound check and setting bound = true, free_inst() frees opts->net
and pn_bind() then writes to net->dev.parent via gphonet_set_gadget().

The old "no race condition" comment was wrong - configfs_rmdir() can
run in parallel with the composite bind path.

Add a mutex to f_phonet_opts, use scoped_guard(mutex) in both paths,
add kernel-doc on the struct, and destroy the mutex before freeing
opts.

Fixes: 00a2430ff07d ("usb: gadget: Gadget directory cleanup - group usb functions")
Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=098999e05b6b877c01b3
Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
---
v3: drop the redundant #include <linux/mutex.h> in f_phonet.c -
    u_phonet.h already includes it.

v2: scoped_guard(mutex) instead of open-coded lock/unlock; kernel-doc
    on the struct; mutex_destroy(); remove the wrong comment.
---
 drivers/usb/gadget/function/f_phonet.c | 33 +++++++++++++-------------
 drivers/usb/gadget/function/u_phonet.h | 10 ++++++++
 2 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
index b1ee9a7c2..e14ee91a8 100644
--- a/drivers/usb/gadget/function/f_phonet.c
+++ b/drivers/usb/gadget/function/f_phonet.c
@@ -499,19 +499,14 @@ static int pn_bind(struct usb_configuration *c, struct usb_function *f)
 
 	phonet_opts = container_of(f->fi, struct f_phonet_opts, func_inst);
 
-	/*
-	 * in drivers/usb/gadget/configfs.c:configfs_composite_bind()
-	 * configurations are bound in sequence with list_for_each_entry,
-	 * in each configuration its functions are bound in sequence
-	 * with list_for_each_entry, so we assume no race condition
-	 * with regard to phonet_opts->bound access
-	 */
-	if (!phonet_opts->bound) {
-		gphonet_set_gadget(phonet_opts->net, gadget);
-		status = gphonet_register_netdev(phonet_opts->net);
-		if (status)
-			return status;
-		phonet_opts->bound = true;
+	scoped_guard(mutex, &phonet_opts->lock) {
+		if (!phonet_opts->bound) {
+			gphonet_set_gadget(phonet_opts->net, gadget);
+			status = gphonet_register_netdev(phonet_opts->net);
+			if (status)
+				return status;
+			phonet_opts->bound = true;
+		}
 	}
 
 	/* Reserve interface IDs */
@@ -621,10 +616,13 @@ static void phonet_free_inst(struct usb_function_instance *f)
 	struct f_phonet_opts *opts;
 
 	opts = container_of(f, struct f_phonet_opts, func_inst);
-	if (opts->bound)
-		gphonet_cleanup(opts->net);
-	else
-		free_netdev(opts->net);
+	scoped_guard(mutex, &opts->lock) {
+		if (opts->bound)
+			gphonet_cleanup(opts->net);
+		else
+			free_netdev(opts->net);
+	}
+	mutex_destroy(&opts->lock);
 	kfree(opts);
 }
 
@@ -636,6 +634,7 @@ static struct usb_function_instance *phonet_alloc_inst(void)
 	if (!opts)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_init(&opts->lock);
 	opts->func_inst.free_func_inst = phonet_free_inst;
 	opts->net = gphonet_setup_default();
 	if (IS_ERR(opts->net)) {
diff --git a/drivers/usb/gadget/function/u_phonet.h b/drivers/usb/gadget/function/u_phonet.h
index ff62ca22c..54fadfe64 100644
--- a/drivers/usb/gadget/function/u_phonet.h
+++ b/drivers/usb/gadget/function/u_phonet.h
@@ -8,11 +8,21 @@
 #ifndef __U_PHONET_H
 #define __U_PHONET_H
 
+#include <linux/mutex.h>
 #include <linux/usb/composite.h>
 #include <linux/usb/cdc.h>
 
+/**
+ * struct f_phonet_opts - Phonet function instance options
+ * @func_inst: USB function instance
+ * @lock: protects @bound and @net against concurrent access from
+ *        pn_bind() vs phonet_free_inst() during configfs teardown
+ * @bound: true once pn_bind() has successfully registered @net
+ * @net: net_device owned by this function instance
+ */
 struct f_phonet_opts {
 	struct usb_function_instance func_inst;
+	struct mutex lock;
 	bool bound;
 	struct net_device *net;
 };
-- 
2.34.1

