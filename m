Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CC523393E
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022488; cv=none; b=nLEZ3ILMnD/LiEHZf+G9/sZG2kkk/E9nLqulcRAMTCHssK7U0lPWtikXT1AG5fo8L2bzn5OsKNzLRTQ6idGsga4NR+UYGsEoo0V9eZOzkJ/sT0DGL7AEXylkJsvwM7l7Qf0WGI5dqgV6VuHZkIBbfJCPRO7XaFbdOD5xQhbRVx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022488; c=relaxed/simple;
	bh=gfadCGLtggEJAurd/FZ9mhDOfgHYg0iKq+ncOchBJ8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RhJnSyfSk8D6LqJfTnWyrJG+oBNKtvVTWxqs0WucpHSbrde2RfOVInUT6qYJuLKebS11JuKMaOBt3wvEZ4V4eJ20KjJtEpheaONqLxg1yEMVYVMca9jI/r2mAv5PZMqblEkFWpLAAliS4ycKgLXfyuWVNrX4SLfOUTGWRa6q/90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmmu8SLe; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmmu8SLe"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f7854678cso1400075f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 06:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786022479; x=1786627279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AL4CvOtEmUlLWL3axPw38b/ZnvPXXb2xlZ3xTvT71U=;
        b=nmmu8SLesk1Gw5RLh6QTm/iMRWBRdcYi4TySjTksf13PYAQlf8YWX37rvmU4MyoCVQ
         XLmJrzuYECdLuiyuD9BhxIoWd1Yp/GYCfMPimhoonY7NLw01Uq/XJqq2JU1iuTf9m68T
         uIQzpdTIx9lL8Pgu6Kw6SdW8BBqc1Av3nNAOyRglKxnQo8h21oLVyYEwvYKORbKvIOm1
         0RgGAMLUl5WXn/kVc/PwCZxB9K9Ab+Ph8QiUZfaCSCWQvG1F1IKliKV2dJSL7Kvol5zc
         pvsKV6oQOZO45L7MGuDW3cvfRo+70RvO/8PraxihWpJYkjzZHfdTDa99HAfHuX6pw+CX
         Sv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786022479; x=1786627279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AL4CvOtEmUlLWL3axPw38b/ZnvPXXb2xlZ3xTvT71U=;
        b=pdbHs+dwSSxiSNPUio5HDuYvWM+iFp93hre3bJG4zOd67jnJJguRwFJ5i137CK1hom
         czbkcUFgM0Ksy4ryb+rrffMtWlIIN7ebkdOXwUf8DkubDDiofe7JX5W+xlWEhm44SBCy
         Sz+cTjndrCI3rX/EeGdh6BrutSiImR539+np3PT+IrQPIDhSLPNrU+vRX7nSkvyE2Whd
         4X2bE5sgGH8ZjGrLgciSjok0M0+beBPF/Pu+xcE1AYCSqj2FhQMvuDPpsJIDhsYbk/wQ
         WPdh6JG0EaRAKTA2sqOosdFYjoSIMGMK9pH+/0EuwrN6lm1iYWFqseyErgwFPbOIs5b6
         BCxA==
X-Forwarded-Encrypted: i=1; AHgh+RpcCPjfOEDTGEAfFHT7S+R6lOjK6DtLS6/UG2SC/lk2SoGwydZV47zagediFq/eup7nRKAB5BV02zc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx87iOCfXysUGhrtCybEygArYhkud2R23IBQHsgf8FDCleZ06fZ
	tyOPVHquCR9E+Q8g1yb1M5T0bMfaxti4g3D67JGhSgcrmEjKCFUFHNX5
X-Gm-Gg: AR+sD13HizOWvGSNiAZw7of25K2/yvARsFgDxxgsVRwbnWQmEngJPCQLXYidwKoL0qB
	3bscebVY8pHUuMX51nrgEJ34ZvrHefr2sTgRcCmu8GGHqD3fZ11vSOpA+wu1i7ibwyUTKNAyvU/
	PIPpimlgqMcQdxdyg3B9cOTAPToJdVynDwnHqhtLvOQv9Dh1rqrbQvAPU/Zr0CFiRgA37WnGGEO
	JOGDkq/BoR+KJR9xO+GS3qKfAfed3QW0pLf+FcbZFdMrBN1kh4DHA+Cmy5r3WV512j2nPMXJnHT
	HBt5+PnJ0CL8mJsXOaXGQrFOG8IZJrwmK+kmo6auK5Us+KPxT79bTk2k2BhbpL4GbHcxszw0FeE
	hHx0a8nqMWIcV06wAWLHntWs3OhIi2ZUCB0IVEGwBiI2FEZV3ldtK+J7wUsjzUOaNgknVGljPUw
	spEgaXAGdnGPH+LLPWlHhYvp7EcjYDuW+6VaDNOygpQiMU0yk4/WjZut1aAwceB7pAFdieQQ==
X-Received: by 2002:a05:6000:25ca:b0:47f:8480:4abd with SMTP id ffacd0b85a97d-47fec62f995mr21583099f8f.29.1786022479251;
        Thu, 06 Aug 2026 06:21:19 -0700 (PDT)
Received: from fedora ([2a02:2f0a:7305:1100:2d17:dc4a:b635:9a95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm6884124f8f.24.2026.08.06.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:21:18 -0700 (PDT)
From: Robert-Andrei Mercea <robertandreimercea@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kuen-Han Tsai <khtsai@google.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Xu Yang <xu.yang_2@nxp.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert-Andrei Mercea <robertandreimercea@gmail.com>,
	syzbot+7cc26dd73231714cecd4@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: f_uac1: fix memory leak in f_uac1_opts_*_store
Date: Thu,  6 Aug 2026 16:21:02 +0300
Message-ID: <20260806132102.88183-1-robertandreimercea@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_uac1_opts_*_store() duplicates the page given as parameter using
kstrdup(). It parses the duplicate (stored as split_page) using
strsep(). Upon completion, it frees split_page.

strsep() mutates the string given as parameter (split_page in this
case). When it is fully parsed it becomes NULL. Instead, if an error
arises, split_page will be a pointer somewhere in the string. In both
cases, kfree() is called and the original memory is not freed.

Fix this by creating a copy of the original pointer and passing that to
kfree() instead.

Fixes: 695d39ffc2b59 ("usb: gadget: f_uac1: Support multiple sampling rates")
Reported-by: syzbot+7cc26dd73231714cecd4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7cc26dd73231714cecd4
Signed-off-by: Robert-Andrei Mercea <robertandreimercea@gmail.com>
---
 drivers/usb/gadget/function/f_uac1.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 85c502e98f57..ce399e4b80c4 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1595,6 +1595,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 {									\
 	struct f_uac1_opts *opts = to_f_uac1_opts(item);		\
 	char *split_page = NULL;					\
+	char *split_page_orig = NULL;					\
 	int ret = -EINVAL;						\
 	char *token;							\
 	u32 num;							\
@@ -1609,6 +1610,8 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 	i = 0;								\
 	memset(opts->name##s, 0x00, sizeof(opts->name##s));		\
 	split_page = kstrdup(page, GFP_KERNEL);				\
+									\
+	split_page_orig = split_page;					\
 	while ((token = strsep(&split_page, ",")) != NULL) {		\
 		ret = kstrtou32(token, 0, &num);			\
 		if (ret)						\
@@ -1619,7 +1622,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 	};								\
 									\
 end:									\
-	kfree(split_page);						\
+	kfree(split_page_orig);						\
 	mutex_unlock(&opts->lock);					\
 	return ret;							\
 }									\
-- 
2.55.0

