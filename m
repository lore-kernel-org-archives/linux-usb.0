Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E53B427F84
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 07:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829479; cv=none; b=YXdc1USqoNe74+EfwZ8uFlkMZAT2hqc90QC2BF+EIOexSGrqEdCPGw+uUHYGJpXNDLq8WtZlwZW46pz4eWqdNo6j6Cz+AUOJSsHeN/zVPFzQNBU29qm8sDB8k7mrcpok70QNq0f+NMA6fFGIiq5BT8kbObZHqBqUMZUyeh1djbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829479; c=relaxed/simple;
	bh=esbXX7i5X1gADRKgX80SvnOuJl3IXoEgbmVlwa26+zo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DfxO9CfFTDi0A9B7V2SkWR5beI+1HtWmPsspeE1o1JAiW7Ksua6FOfcjaHJmTT99eAMc8HJdNfqn+k6c8bwNaIEhuM1a5On+BSS4KQOHuUkQ5+dXo4HKoQpt5CB3bVzDJgmLy9g9iqHEPQeBkeDwFnVsPzYjj5BCsODIhfNlHoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaW/p7we; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaW/p7we"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e88b60121so3264308a91.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 00:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785829478; x=1786434278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTXWfWyOkl0xOSzBDPDeUohi0rPwGKQbDvqXhmbLPPY=;
        b=IaW/p7weYGjHBq/tWkQ/mIHB52uyAHr6yBNjEOXIKMnrIUqbyWCYPdA+PuMu4BBeyE
         btBhmslahSKRiLdxk9A/i/bJ6TTWqrSU9fqzxDvvtkNNrqlrly8UUteYv6m7nntkGSlu
         kRyZ+dqCYvUMVEEeXbYDYvqmvNxGxPRsfBshHVUpJCEhrmHLE/2WdWPlIEnTMv2v0kwm
         nAl0MlfpNBczMsuenTGNo+ZV9m+RFQAzT9ak6oJr3R7SDid6K+Qa/ZxxYIiIXFQc4UxI
         6lWAQOo1ofD23ybsdwmpmRCKM2KfX0vPiFkvFnrZHaDjCHDj0Rpt1fNFrEjZWclRBi/g
         A/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785829478; x=1786434278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTXWfWyOkl0xOSzBDPDeUohi0rPwGKQbDvqXhmbLPPY=;
        b=lwV1yPesZCoswau5Urk9RIxzExSc9l284bff7iEnqwRqrgml6AFqY8fo5/kDJnO9kc
         KhhtMDxpV+VHdXavE8TQSlQxJnWwVVpyJiLtsXAvprV2IKLeiKP8hngki1e+0YLMQxJc
         XQu1y9ps4uQk1+IWyKc9PvKUs+alIPzgSBqfF1viuA4tIg8Qy/wwz5xySm0YXHxGfWlZ
         T14sVoCvMy8g7WiMfyBeWT47OlEAxA1dEqXs8Ut2uubEx10acPMEFRcyst8fRR2p5coE
         qi9u96Vk6ejINdcTMSGIU420XkKkvvMXAjclvVsnIkj6lXh6qMaWiVndrj+T00QmG8Xr
         zNGg==
X-Gm-Message-State: AOJu0Ywdg1LrZqSDQeJNjgCZ6VZ4diwACL4ro6ueBHKXb5lJuQT+xce4
	lB1DqO3CNJE04C6kIWIc+EbuHc9LPwAKcb4TiPVaJt/tL7mlQcbeuC+t
X-Gm-Gg: AR+sD10iepY0XkSKuOZXcWlstgdaQeZUva/6UtM7yGGnAQYHege4HE3LX8LUGv7SMET
	I7D5LHHSurwNCQX0ejmMOglnMKQAPe2+xIjawCunqEGxlC41JMSZLv4zJp+Y+lY6pMRPVF0F6s7
	Er/cqtwp5q284VulB4/yZUhxC5cumKDdypNJgrioC0TS1VyQEm1URTMY5gfKWMU5jw3febAGbse
	t0yOyNElojkuCwOFOCJ6r30QaRKLCNQE5Ok3u3tPdnR3krxkW9QRFqea6WZGs0nrIoXs++XVoHb
	httwrp7lrLjQ5l5xXJemnQZFNvs7Dv/cEtBsnDxUABfyYF/m2xfbRdkQm6s1DNu8Bi9LKlB1r3O
	AsgzZazVnLMyiwnciU5c/hUFXYLPxpLXlQgVRpZocVEvPtFMikJiy9ImQVK9JW0GIFQS3DW21rD
	Updr8+0wAYk3rIHMj8UQO5iWiRldSRCadZBoTv2d9WOgiv7ZsPwomW//o0F/kv9w5rttvzugFZh
	f05ZEvVrVtMXA==
X-Received: by 2002:a17:90b:48c9:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-38fbc511c3emr11893259a91.27.1785829477748;
        Tue, 04 Aug 2026 00:44:37 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b551b9sm2985830a91.2.2026.08.04.00.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:44:37 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Subject: [PATCH v2] usb: gadget: f_phonet: fix use-after-free in pn_bind
Date: Tue,  4 Aug 2026 15:44:32 +0800
Message-Id: <20260804074432.2906951-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026080431-paragraph-caloric-0aae@gregkh>
References: <2026080431-paragraph-caloric-0aae@gregkh>
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

The existing "no race condition" comment was wrong: configfs_rmdir()
can run independently of the composite bind sequence.

Add a mutex to f_phonet_opts and use scoped_guard(mutex) in both
pn_bind() and phonet_free_inst() to serialize access to ->bound and
->net. Add a kernel-doc comment describing what the lock protects,
and destroy the mutex before freeing opts.

Fixes: 00a2430ff07d ("usb: gadget: Gadget directory cleanup - group usb functions")
Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=098999e05b6b877c01b3
Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
---
v2:
 - use scoped_guard(mutex) instead of open-coded lock/unlock
 - add kernel-doc comment on struct f_phonet_opts describing what
   @lock protects
 - add explicit #include <linux/mutex.h>
 - call mutex_destroy() before kfree(opts)
 - remove stale "no race condition" comment; explain why it was wrong
   in the commit message
---
 drivers/usb/gadget/function/f_phonet.c | 34 +++++++++++++-------------
 drivers/usb/gadget/function/u_phonet.h | 10 ++++++++
 2 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
index b1ee9a7c2..350579747 100644
--- a/drivers/usb/gadget/function/f_phonet.c
+++ b/drivers/usb/gadget/function/f_phonet.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/mutex.h>
 
 #include <linux/netdevice.h>
 #include <linux/if_ether.h>
@@ -499,19 +500,14 @@ static int pn_bind(struct usb_configuration *c, struct usb_function *f)
 
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
@@ -621,10 +617,13 @@ static void phonet_free_inst(struct usb_function_instance *f)
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
 
@@ -636,6 +635,7 @@ static struct usb_function_instance *phonet_alloc_inst(void)
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

