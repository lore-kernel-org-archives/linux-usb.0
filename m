Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E328839525E
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 16:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785688122; cv=none; b=tuiPYr4fwJCX9aRL2f1fnAPnwzZ0kIvxXD2Db8sbcfBBNFBi9jQfrVLkBDFkQzOraqHXVSJD6ckxk08uxqAbs2Bx3JLLEBzUcvLxAJHMtdvo28BhL4ANbNXM08btNnEJQK5plnsxev3ZF49pqoLivQj6TK6ujfJLoZ+0Ux1WqdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785688122; c=relaxed/simple;
	bh=Aa1C7XVP5D0lXpdtOpM1N5UmX0/npqGqHnpvdbQLwLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MJqmIANlmyzP62ol+fJbdBv4BiT6h24xS2HdwhHR7G/bbEYI5C5Wj6Dam1HSoysKB0FIpx3vzmDX9n4K/tBmwTFdmNq/8Bu6Obd5bvKuGjztRRwkqXGoV7ErF/c7BChaVL0/FM8QVUiNcpFFYTog3RleULwuM3VbUECsTqjKZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoWIqNWW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoWIqNWW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf52d15d88so20778005ad.2
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 09:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785688120; x=1786292920; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7scSJm40+Y+XIQ6APOkt7PEg3eFGXlNbl1wv/V9PRHk=;
        b=XoWIqNWWAa6IF5Do72OjtzMHcsAJf9+qGaMAOLt/L11F6L/BLox5vXKRvksbkIm0de
         fSuV3LfRZKs7eXi4aUTFJiRRCoV49X+X6t8yPk7QmHODbfyLGETjGNSjztEkTLnMfhiH
         qYtY050ae/hKO6/KWkT39fpFadXgP7QeTZ4aT08KLevhSjUBcPza04Lf2qCuggumafOc
         5RCkjVXXnlr9pjlTa0cYIHADarKnXSwHxI/xszr1xHFWsjYOzMWQMJSN10ALHuBJGtno
         xCsXn+D26gqUuIgatm1eSBl9G4swm5Cdcu0DIOssKhyx36pImCFLrKpVpn1ZzycQwceQ
         5yBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785688120; x=1786292920;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7scSJm40+Y+XIQ6APOkt7PEg3eFGXlNbl1wv/V9PRHk=;
        b=lCjZzcAcQMyz/UxHNSRYFRrsAAssElVxwyb3cJhhkwMaSaEc9vELh2kLR63YeOTbjR
         KheCXRA4kmPNUkwtK/TAyzKohwFfXyzkdTx3uYRhF/WG4+SHeDvQENU3KT2s/epHOZ32
         DwsJWRJn4PA36u1woBcn20z6p2em1FXo5jbPH21/wkvSQiWdhgRO6Mlpr1qruY2UVJ9p
         kPgTt7caQktmHGrP5NF0gFOwKwJ3ZK34/Jafw32PAJPnqVf4LH2WAhliNg03Kz5INyzB
         6vM1CMPipo24uEhsxaIZOEIVlO2D7DKBofBaTvXeJkIEF5LUkNLmBkXd2tGOwaRLe1lQ
         1cSw==
X-Gm-Message-State: AOJu0Ywkj/sE4N3QTXtAjDJD6sCw0BnX2bR6jTMKlyuNC7C2XH61+scj
	1T+HhDlmy7A8/ArLZAu0KgMBUZqhRzmQRlM8alk9NHA4miiZKQ5p3W8vKK1IXrGB
X-Gm-Gg: AR+sD12qi5oj4V5gRpwt7RRNVdpr4wZ279qfBOgx+/QUzRU/Qy6MOMx96jMtvoPol/n
	JQdxCEPmrzF9QA/soy1GenMPxB8ZTLv4UO2Ntyl07wTNA5gvPoDDxv3wL3gD1VOI+WzWyMoIHwV
	U8TzIHwFT1k95CMrcaWs1JVUYycXHsUj70sXmEyGx/JaLprZOh0uzxbZEbadnTZm02ZcktqXz2Z
	hl2srTz5j08GtkWBldOl1coCYcfEGhfW9T8c6nGQ5Pjp0QVzwykolcI4Y52H92FI/BECTkFQ+Qq
	JvYobZREEjUAMxrIct2ovwv65XRi5q1vSVB1G3Zh2yU/K7xHlzpL6ypnoLI6B9OahYM4NdfOKkd
	cJIXfPyPIvJ7nECCHB/O8Lx7rgoQ+0yKMqFGHoPxDtuwYC4WQO9x04ai4bOdhqodGaeeRTUxQbT
	ajGdsM5GqAJYOSBa6ymVc4kD9MA1d1JxNAwsRZhj4G+EW8PBTZdZDnYP9lAKB63nY=
X-Received: by 2002:a17:903:390c:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d05218984fmr68365745ad.8.1785688120180;
        Sun, 02 Aug 2026 09:28:40 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:b43c:4b21:e8d4:b1b4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddda5d9sm34668604eec.13.2026.08.02.09.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 09:28:39 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sun, 02 Aug 2026 21:58:34 +0530
Subject: [PATCH] usb: gadget: f_uac1/f_uac2: fix invalid-free and memory
 leak in sampling rate store
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-usb-f_uac1-v1-1-2c85fb0597e0@gmail.com>
X-B4-Tracking: v=1; b=H4sIADFwb2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMj3dLiJN20+NLEZEPdtMSklBTjVDMLi6QUJaCGgqLUtMwKsGHRsbW
 1AEfZ8DpcAAAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Julian Scheel <julian@jusst.de>, Pavel Hofman <pavel.hofman@ivitera.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+2532c7901f590afd0c3a@syzkaller.appspotmail.com, 
 Subasri S <subasris1210@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785688117; l=3948;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=Aa1C7XVP5D0lXpdtOpM1N5UmX0/npqGqHnpvdbQLwLs=;
 b=YWc4X9Zgd+NxD4giR1uKSIm9+wnIctaLp6/lMeu2Zndny/1Q+LdLXx/ro42OF2XpPmA+N2V9G
 4Jct0vG/VzTDIcv6ktIRGg/30koJhCeKGmX/6bne+TN3hE66EU7f7BR
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

strsep() modifies the pointer passed to it, advancing it past each
delimiter. In f_uac1.c, in the UAC1_RATE_ATTRIBUTE macro,
it advances the 'split_page' pointer past the ","
between the sampling rates. This causes two bugs:

On the error path: if kstrtou32() fails while parsing (possibly due
to a garbage value passed to it), the goto jumps to 'end' where kfree()
is called on 'split_page', which now points into the middle of the
'split_page' pointer instead of its start, causing an invalid-free.

On the success path: when strsep() exhausts the string it sets
'split_page' to NULL, so the kfree() at 'end' becomes a no-op,
silently leaking the kstrdup allocation on every successful write.

Save the return value of kstrdup into 'dup_page' before the strsep
loop and always free that instead. This fixes both the invalid-free
on the error path and the memory leak on the success path.

Apply the same fix to the identical UAC2_RATE_ATTRIBUTE macro in
f_uac2.c.

Reported-by: syzbot+2532c7901f590afd0c3a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2532c7901f590afd0c3a
Tested-by: syzbot+2532c7901f590afd0c3a@syzkaller.appspotmail.com
Fixes: 695d39ffc2b5 ("usb: gadget: f_uac1: Support multiple sampling rates")
Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/gadget/function/f_uac1.c | 4 +++-
 drivers/usb/gadget/function/f_uac2.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 85c502e98f57..07c33dbce3be 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1595,6 +1595,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 {									\
 	struct f_uac1_opts *opts = to_f_uac1_opts(item);		\
 	char *split_page = NULL;					\
+	char *dup_page = NULL;				\
 	int ret = -EINVAL;						\
 	char *token;							\
 	u32 num;							\
@@ -1609,6 +1610,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 	i = 0;								\
 	memset(opts->name##s, 0x00, sizeof(opts->name##s));		\
 	split_page = kstrdup(page, GFP_KERNEL);				\
+	dup_page = split_page;				\
 	while ((token = strsep(&split_page, ",")) != NULL) {		\
 		ret = kstrtou32(token, 0, &num);			\
 		if (ret)						\
@@ -1619,7 +1621,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 	};								\
 									\
 end:									\
-	kfree(split_page);						\
+	kfree(dup_page);					\
 	mutex_unlock(&opts->lock);					\
 	return ret;							\
 }									\
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 897787d0803c..2292c72f3843 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -2013,6 +2013,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 {									\
 	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
 	char *split_page = NULL;					\
+	char *dup_page = NULL;				\
 	int ret = -EINVAL;						\
 	char *token;							\
 	u32 num;							\
@@ -2027,6 +2028,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 	i = 0;								\
 	memset(opts->name##s, 0x00, sizeof(opts->name##s));		\
 	split_page = kstrdup(page, GFP_KERNEL);				\
+	dup_page = split_page;				\
 	while ((token = strsep(&split_page, ",")) != NULL) {		\
 		ret = kstrtou32(token, 0, &num);			\
 		if (ret)						\
@@ -2037,7 +2039,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 	};								\
 									\
 end:									\
-	kfree(split_page);						\
+	kfree(dup_page);					\
 	mutex_unlock(&opts->lock);					\
 	return ret;							\
 }									\

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260802-usb-f_uac1-fabdd3e688bd

Best regards,
-- 
Subasri S <subasris1210@gmail.com>

