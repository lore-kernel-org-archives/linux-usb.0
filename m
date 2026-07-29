Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1ED4457AA
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 10:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321654; cv=none; b=Brw9JlKYdqByHPwFpVLLjkRFyN4SxgIPG960hGAM1aLBEDuczf0scx8ila7PylB+DESwiPlNqzYXLorQ6gBhWZlVI5EG+T89cD96RkXv8K1hE4myYsDMsLe/12KxUjG2pBJ8Rbdhsr/brp5Igaze6oAJkUYAxpmoNNdLRqyq4YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321654; c=relaxed/simple;
	bh=YGiiJkFaCKkaB+Xm11Jvz9erxC7pH/otgUx/4g5BseQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nGw9kYrgHvdLxJKCoESpps6Fm6tQ6YBrq85iGryjOW5OxbJfsQVjCLaKhaGzRENNlbXrryeWbenwxrP+Qw3rrfx3gXNqoTI3cKO2AkgbpOWIdd+p3sQT6+MnWZmBhfs5jWfBqEeZ1TmTHvinO5vaq2wt82nG2zWVaqG+AdbfsxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDt8u7vX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDt8u7vX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8485ef63b68so815851b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785321652; x=1785926452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CbN2mFDLnyzkrDjN40cvtHAPvSJ4u9k4PdIhML2Nd30=;
        b=ZDt8u7vXwXNWDGGHnAxx7v6yABZTbABELFdExWk4EXBXOBV/chhNpICeTXkCK/6gxt
         v/f/guvxcV7eUJ7LIdLTWrzcfIJClb4uuOEVF9O1hXhajHq0MkRMkbWGwCKs8zKSjOtp
         kEZcwdJT2acJlvzYysJSPTFpqeep3myuvOV0YBTdNTk0pK7aSjVysGNZexaXr6OhGpAg
         YM+aZAVxQaPe889RaknXev5dkGL9ibITXtzixDC3dKjahCjiymfOuC6R+L+v6aiPEyua
         4+e9Sc2mdbIaLnqef6YzkgguPCLYzMx6fnMFsCCVR81EuPmVVLnqW236rfPsDBv3o12S
         Mb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785321652; x=1785926452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbN2mFDLnyzkrDjN40cvtHAPvSJ4u9k4PdIhML2Nd30=;
        b=SK54EHH3AuJhIZfWGZ83509TpOxwRVmx9s07Ns4ZkcbjFsErAmfusEEaPArQGbfVFW
         NJik23UdA0+ZDZLZUN9AC317XuTF2prEPbUmLBYybV7uf9AmFhysK+P7xpBTJ+cUnG2Y
         CzuFg/k/B4gq5TbEdJDoDDZxMOdfSqYrxt8fbDRaRxFbkO74H+OxNhCSj6qCXaa71ywR
         KUAJDkRsh0JMEj7+vbD/5WDvwaGM7/kcr67mYALd9+y3ZTNM6APhgaw16mrn8mWWyCZ3
         GtWP8QNGPHwsvX68cfxZuPmQTkjmWhmCECyftBVNhofz4zyBvyVUGUJzq3mpoHICTIio
         ajFA==
X-Forwarded-Encrypted: i=1; AHgh+RreUa/y/OBQ5sV49CK98lLD9brP9fhqKBd87RgWh3x4qYZg26cffUCtXyW9sEiV/GbB1hRaj4fLyMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfKjjGHaQ76v1u/TFBmQJnlYZ4Xis20QNjOTPvOYcZMgIeEHRO
	PDQbmWXFG4W9MV5rq1+sQcUqZfxsN87rD4pBVB3HEN2H4hWBqekn9jhK
X-Gm-Gg: AR+sD12YMJ8gkFItL51nSkhs9H5U58DRuoY8lGnv3bP3Lbn3FMsGrK+vsrpDXSnop6X
	5SQe1uTDs3XJSx1jt7Mx7c4cqEH0+luQugbDUrIgcs9AzkM3xm2J3ZUjZCYjXyS2fxQVGdYCe0i
	grKSQfGVtWh1+O+3dG2vwjI3WfbXL/FKchJ4ChvWU6W9hOZY8gnZTMZR7YiMXff4sGwDg39i/or
	Z/qCni+qJ51VI3GaCZGiJsXOsmTcarQrsHUlzUe0OpEz+JeSa2CDU2B9ZZsR79melL8HFJiVaxs
	pO2hGBjTzsxAfhBjMXbxwP2XqnbBibmMuUWPEwYmOaxty8njvcZRUVBvodI70yvFtjQaGnlLy5e
	yoWubTrhUsm7i/oCrmQsUGYeJJn2WZGQ7qON+oU2hVIknjyo27nvvZIn296vDM+w3HfJUlPTq7L
	qEy9H59zp40D8bvUAmRJbJhqVrjxItR1fWOv2kSP5RzQamgNJumJWWhswuIFV2TJZlIGieo0bl5
	SgJ30UttoJCCyb33Z6DdQDN7/K35fRTrNUq+hEYB7jP
X-Received: by 2002:a05:6a20:d28e:b0:3c0:9c18:d5ad with SMTP id adf61e73a8af0-3c8ba7114c1mr6556192637.74.1785321652155;
        Wed, 29 Jul 2026 03:40:52 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:76df:4b30:2654:28a3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504bb29b2sm8247857eec.13.2026.07.29.03.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 03:40:51 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: christophe.jaillet@wanadoo.fr,
	kees@kernel.org,
	julian@jusst.de,
	linux-usb@vger.kernel.org,
	pavel.hofman@ivitera.com,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+a4f65284f1451010b0a8@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: f_uac2: fix invalid free in UAC2_RATE_ATTRIBUTE store
Date: Wed, 29 Jul 2026 16:10:42 +0530
Message-ID: <20260729104042.9776-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The store callback generated by UAC2_RATE_ATTRIBUTE() parses a
comma-separated list of sample rates by repeatedly calling strsep()
on split_page, which was obtained via kstrdup(). strsep() advances
the pointer it is given to point past each consumed token, so by
the time the loop reaches the end label - either after a normal
full parse or after an early exit via "goto end" when kstrtou32()
fails on a malformed token - split_page no longer points at the
start of the buffer returned by kstrdup(). kfree() is then called
on this interior pointer, which is not a valid allocation start
address, resulting in a KASAN invalid-free.

Fix this by keeping a separate pointer, orig_page, that is set
once from the kstrdup() return value and is never modified by
strsep(). orig_page is initialized to NULL so that early exits
before kstrdup() is reached (e.g. the opts->refcnt busy check)
result in a harmless kfree(NULL) instead of freeing an
uninitialized stack value. kfree() is called on orig_page instead
of split_page at the end label.

Since both f_uac2_opts_p_srate_store() and f_uac2_opts_c_srate_store()
are generated from this same macro, this fixes both attributes.

Reported-by: syzbot+a4f65284f1451010b0a8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a4f65284f1451010b0a8
Fixes: a7339e4f5788 ("usb: gadget: f_uac2: Support multiple sampling rates")
Tested-by: syzbot+a4f65284f1451010b0a8@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/usb/gadget/function/f_uac2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 897787d0803c..4b403cb779fd 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -2012,7 +2012,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 					  const char *page, size_t len)	\
 {									\
 	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
-	char *split_page = NULL;					\
+	char *split_page = NULL, *orig_page = NULL;					\
 	int ret = -EINVAL;						\
 	char *token;							\
 	u32 num;							\
@@ -2026,7 +2026,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 									\
 	i = 0;								\
 	memset(opts->name##s, 0x00, sizeof(opts->name##s));		\
-	split_page = kstrdup(page, GFP_KERNEL);				\
+	orig_page = split_page = kstrdup(page, GFP_KERNEL);				\
 	while ((token = strsep(&split_page, ",")) != NULL) {		\
 		ret = kstrtou32(token, 0, &num);			\
 		if (ret)						\
@@ -2037,7 +2037,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 	};								\
 									\
 end:									\
-	kfree(split_page);						\
+	kfree(orig_page);						\
 	mutex_unlock(&opts->lock);					\
 	return ret;							\
 }									\
-- 
2.43.0

