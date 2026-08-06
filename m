Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A5343FD32
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 09:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009019; cv=none; b=R0I1bkloyqYmEFUoN+exSDRAUQmqFB02XiZAhRCQo1wAznELPn5PsszimNtx6YAQpK2Ul5GuBXrZIJv7OI0YKPOuXbl9DKUpBFsNatJBdLH+/H18G+ZEJoZvUPB0q5vvC9E8VN2wwnqYUk7yzdVNOhOhIxixywSzsCaeYw344TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009019; c=relaxed/simple;
	bh=b+l5kijwg7xqkug1cUOat0L12FhdH5xWFmrLKtjJQAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XJXYEid69R/dJGa7hFZa7NeG0k2zEAWA45sXdp0KEJ3emfYLOfbcQj1/emQqmR5PBAdizPnkjADpPSuFAxz7mCdUt+5+Kri2UV46qVAGEmlOwpmvR2gfBaNjUcEF3SLaGyyrKE+IaWvC0cTE8473va47vu6Xqgy58DzLpLqZuVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGugs4rM; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGugs4rM"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1137874a12.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 02:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786009017; x=1786613817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xuKKBDjdJMpXUXcqM87Kpr9WDhoVOO+MdV9hJTMzecQ=;
        b=fGugs4rM6o/WolkPDKOV4Rx/K2gmkmOrQeKnkHklabzUZznKrkcFMk2O4yLtKeSR2Y
         981HhbhPWUgr+ZOb6S1ccKOqnSG6KxcQ3cgJlR2kMke8CkfiPlTth6wPZiOmQQmbvUBu
         k3tlfLMX14f3nmZEEnZ5de6S7LTlbldD7PW5Gy297KzfKyPzXTDeZS6RHEUkr/dfgPvw
         G5a9/xGg1C6DOrhOINHTvwZVyNVStfwUQkgqcwJG13rjCZXqnNB+zBSNE48wwfGs+ZxD
         wzSPzMKFH8Y7uJpmNYCsKx7IVcSueSDPg0A+kxau+JdD7wnIs2QFJNAfp2klRFukwDVk
         ZzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009017; x=1786613817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xuKKBDjdJMpXUXcqM87Kpr9WDhoVOO+MdV9hJTMzecQ=;
        b=QU2KZjuAHA/9B6q+VuVbBlEjzAXwtg8NXQGXYaRxDSg7YISA998XfmBZrrP4vt0sfi
         YPUaL+RQOHcuqGI8sl1m970tbqp9aq1NyPThD9EhQWkbCvw+9y9B2OgM3OCOJGjfKV0j
         9cQmvzN4uW2BYgGkGqdl87FRYEcI+qJd85nhCIV+vGeRyadwBuDUwnJu9ON78myDxHJ2
         XnEZK8LVX+nq61BPHBdmUamsAh4H2ymxwJ7MmsMOk+8qh9g3O+y4zctccPptsuOc/7w7
         o+GbK5a/CRYf42fPU9UGSuuuru/E1TEDgl/bnwZ7UkDibtJ26abuNR/rVG9ZnK6F8pdU
         yeeQ==
X-Forwarded-Encrypted: i=1; AHgh+RovcKcUAEDRpUGt76OBFNnog1Jd+53kmTwBRmOHRMObLLAA3ceTjfewmW/7NF4hc6IMgL6mgUEEZQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzst+aO6dopHqmLYpTSMRtWSPK28E3e5NBb8TMd1RlWulm0gY4/
	G0FujvllKIneMJpy/mf77z3iCsuUMeDQdM66jmsJ1XEeYSQgyXgYblkO
X-Gm-Gg: AR+sD10YIkO3o3ZJbx/73DUwvwx1bC0YhnGMnK1oPj2fqYVqOn9IMOtjpE+HVUH9R6R
	s/dDWzAVYK5ADnfrTLYafyZk9g8sqwRcVrxVgeXWg9uLXTNhpxDoLC0SklUgzVywZOzvYwxH0Ed
	h1oaop72mVSor/vNQ+L/nAfmIsqZUSK0C90g2X23fCDmhfeEhdlb1315lLQqUe1hEeZI8sb76el
	dm2Pf0NGmSl0Ldbs/nnV2RSw4q1O/7iCDMWB4JomlZXZzM3BgvPNeqp46x3nNZfD1EzyhwZUa7l
	WNVR2HkXEqFXwk1Oage3sWMDlZWolmZbmW3qEuMavBz1yIPjZ/QCHq2reSBITQjPwiHoMGsYTId
	Cdmn9BfRnr3yX2Nubpinzd4I/rcKXo/HpqjfkuLKy+J+zlLrh6v+FKSXJwMQv2h6xdSUpQ/c/Hr
	sFFvOJ9BglpJS4kkawe/VTiRR3Q0FrgvJ03MXWMO3TGXld1eBOW1yohRD7m+31KC2ldrRjq+o/c
	w==
X-Received: by 2002:a05:6a21:1b85:b0:3c8:d3a4:7b40 with SMTP id adf61e73a8af0-3cb85ded978mr17550129637.2.1786009016964;
        Thu, 06 Aug 2026 02:36:56 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm45917973eec.25.2026.08.06.02.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:56 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <kees@kernel.org>,
	Julian Scheel <julian@jusst.de>,
	Pavel Hofman <pavel.hofman@ivitera.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+87c10526d2cfa8d14ff6@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: f_uac2: fix memory leak in sample rate parsing
Date: Thu,  6 Aug 2026 09:36:39 +0000
Message-ID: <20260806093639.781501-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UAC2_ATTRIBUTE store macro duplicates the input string with
kstrdup() and then tokenises the copy with strsep(). strsep() advances
the pointer it is given, so once the string has been fully consumed that
pointer is NULL and no longer refers to the start of the allocation. The
macro passed the same pointer to both strsep() and the final kfree(), so
kfree() was called on NULL (or a mid-buffer address) and the buffer
returned by kstrdup() was leaked on every write to attributes such as
p_srate and c_srate.

Keep the pointer returned by kstrdup() in a stable variable used for
kfree() and iterate with a separate cursor passed to strsep().

Fixes: a7339e4f5788 ("usb: gadget: f_uac2: Support multiple sampling rates")
Reported-by: syzbot+87c10526d2cfa8d14ff6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=87c10526d2cfa8d14ff6
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 drivers/usb/gadget/function/f_uac2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 897787d0803c..2cbdaf6a7db9 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -2013,6 +2013,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 {									\
 	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
 	char *split_page = NULL;					\
+	char *iter = NULL;						\
 	int ret = -EINVAL;						\
 	char *token;							\
 	u32 num;							\
@@ -2027,7 +2028,8 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 	i = 0;								\
 	memset(opts->name##s, 0x00, sizeof(opts->name##s));		\
 	split_page = kstrdup(page, GFP_KERNEL);				\
-	while ((token = strsep(&split_page, ",")) != NULL) {		\
+	iter = split_page;						\
+	while ((token = strsep(&iter, ",")) != NULL) {			\
 		ret = kstrtou32(token, 0, &num);			\
 		if (ret)						\
 			goto end;					\
-- 
2.43.0

