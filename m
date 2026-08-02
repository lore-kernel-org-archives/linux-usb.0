Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B462D6E44
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 03:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785641436; cv=none; b=EMoOF3XOEmUy49CkKILmdXwX5s1UJ7tosgIc1BDrcWmF0OHV7fGc744iI3zMpdpigGRWKFFP5hMv3rRbnPtKrhpv2s4hxGVxYnjHfUYjjhdSh2PWvOvjsAltYvIMkM8BsB6VRruYvOZMyyBiT0wq0+V2FlFfj1mgVFBazz8fLa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785641436; c=relaxed/simple;
	bh=QZaiviFXIpFOU6xrt4pohFGuFmFnFNWk4lMFpZyHZPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B3ih0KwrmcnzLPK1wISe4/jrRve84wUPWdNBrF/4uIM43SzNL+KNAUky37jXHpkgHYf2MwxsiNgfR6cwqnRROk7ssk3UyQkg6k1J5AdywQGBA/b0y1TCIHdkXk0JewSA7y0Vg7UybPCXnbHy3zs/3Xjp7cu8f1REMqK7L1wrzVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oazx74BQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oazx74BQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49557167508so9057095e9.1
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 20:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785641433; x=1786246233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5getTzD0IVo0TFYhF1w5tTOZvncb1cQf4iioeWqGs5Y=;
        b=oazx74BQ5ljVYFxE5ay4CDYSl+BifQzmkdGHWprgszYz6Kij1gUD3iBg9VNiDSLA7z
         6GmEzqbEndXioOCOzs8M24m00sBVUdU1+HO4NbSNbKT8jwMDfy/W7rj83HNZlC+8FLVX
         AfMQyQVB75Ir6YfCMKtqXNVVB/DKIB5DW5sHgBcHbAvpLfx8cElgpEIEd5VZwjahRIPb
         3v/cwYaZ4iYtSCeYQlQUl/hInKN2WRXIPl63oap3Ej1PMfmB4XTXaXhu4Si/St/etfPF
         R3s/dg51bY1HJKBxxHMCVQOwtjS7AfIXZzwzj6rF7lvYzWMozokBowBevJrXRMFXDgCJ
         YYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785641433; x=1786246233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5getTzD0IVo0TFYhF1w5tTOZvncb1cQf4iioeWqGs5Y=;
        b=NAzOgwkUCvuPhxX/as5yZfaT1et7+nWzOPqZC6aeHW15KAKadshVq8W/icQS1tzRR9
         xjw8VPz/HEbQ3iaLV8iZ5WrDy3ysY/SDiNa+ggFv02br4aJurDtWHc1jffAAMNfIhItU
         BsW2EhZcBuGl1jKr518q7wii0Gor9SH5xrl745u2rfkhrfbcTwP3fXO85wrWWT143Wk5
         6WZykXmvqBKPmC2bEqtO0It/UKiSFnht6/gOGcJazLdjLxmVDQnB0aheAhz/KyV9Xv/X
         7WAgL79lbzSAIY43bguHiMmwDHzoO/d30vs456uGROdJYAwwZxTd8mv5+Hq+iGv8B88K
         YSAg==
X-Gm-Message-State: AOJu0YwrC3lPgFRgnYZUb9unPtCZJXxcIYbY0u1XgxgRSDhofCrivt57
	FekTLpDfEYLjbQO7Y0BXNVZCoWwVi+9EUEz3dJo4ggp6SXc1OobHyxVx
X-Gm-Gg: AR+sD1325Wan9WUzkwUylI2QVfkLTJIjxDjubKs8+eO8eCEiKKQO/uYE0ku8oQ3Vniz
	M3S2BPPyCwWAR/YtgT3kmrEWKcRJp3IVXUwL+L3op9abBxnwTqZGV4nS3IDb95FafOFI05KmTj8
	aQ8r0D2ES+bed/WuIehgMT6G/jWw6V6l7pFPEJ+rxIbXFg5DeBEdJrj8TmO8rXKJoQy5vYZNtX3
	CoHC4pVA3WUjg5r7lgTsWnMwyW5J6qZkSPn8e7e/lcRJvM1DdymWs/i3oxMJmuKjhsITFoXWUly
	efNQBvYFD0muug5SfgrOip6hHceOXQm0FvFhKoX+8paA5P025jM0SnOsb6opKmb5BdE2ruQuUh/
	7h8Xg/kKxGQA0oTgfR8jAiGlSeX4/pFjMcZTsPbaCvYy+SwEXfGqRh/48GUWVRP3+t2W8kX1FMy
	bKw8r/JnI5S4YlaWuR2SB0uhsv8kL1VV2SKqqeAlsPj/K2xIYwiD0MPAdaU3V5E0yxJipBjl8wj
	fM6poVx36WT/VHTwFftI4GJq3sctkiRIKbkj9VNpzsZLiQWa859/9ojAKNwVnJPKA69Bio2CiB0
	YDssOu8zEWKsOupky7Ya4Le7HMzJL2o3f9sUiIn3nj0sD8P+B16x360=
X-Received: by 2002:a05:600c:4795:b0:495:5d5b:7533 with SMTP id 5b1f17b1804b1-4980c65b84bmr53485235e9.13.1785641433009;
        Sat, 01 Aug 2026 20:30:33 -0700 (PDT)
Received: from riacini.speedport.ip (p200300fcd73d5b95e8f13abce6faaab2.dip0.t-ipconnect.de. [2003:fc:d73d:5b95:e8f1:3abc:e6fa:aab2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191be8sm159659035e9.2.2026.08.01.20.30.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 01 Aug 2026 20:30:32 -0700 (PDT)
From: Rituparna Warwatkar <rwarwatkar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rituparna Warwatkar <rwarwatkar@gmail.com>,
	syzbot+ebd045a6645cfb713c95@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: f_uac2: fix memory leak in sample rate store
Date: Sun,  2 Aug 2026 05:29:59 +0200
Message-ID: <20260802032959.98815-1-rwarwatkar@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_uac2_opts_{p,c}_srate_store() duplicate the input page with kstrdup()
and then tokenize it with strsep(&split_page, ","). strsep() advances
the pointer it is given, so by the time the parsing loop finishes
split_page points at the end of the string (or NULL). The subsequent
kfree(split_page) therefore frees the wrong pointer (NULL when the
whole buffer was consumed), leaking the buffer allocated by kstrdup():

  BUG: memory leak
  unreferenced object 0xffff888112a01e00 (size 64):
    kstrdup
    f_uac2_opts_c_srate_store
    configfs_write_iter
    vfs_write
    ksys_write

Keep the original allocation in split_page and hand a separate iterator
to strsep(), so the buffer is always freed. While at it, handle a
kstrdup() failure instead of dereferencing NULL. Both the p_srate and
c_srate attributes use the same macro and are fixed together.

Fixes: a7339e4f5788 ("usb: gadget: f_uac2: Support multiple sampling rates")
Reported-by: syzbot+ebd045a6645cfb713c95@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ebd045a6645cfb713c95
Signed-off-by: Rituparna Warwatkar <rwarwatkar@gmail.com>
---
 drivers/usb/gadget/function/f_uac2.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 897787d0803..8facf289710 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -2013,6 +2013,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,       \
 {                                                                      \
        struct f_uac2_opts *opts = to_f_uac2_opts(item);                \
        char *split_page = NULL;                                        \
+       char *rest;                                                     \
        int ret = -EINVAL;                                              \
        char *token;                                                    \
        u32 num;                                                        \
@@ -2027,7 +2028,12 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,      \
        i = 0;                                                          \
        memset(opts->name##s, 0x00, sizeof(opts->name##s));             \
        split_page = kstrdup(page, GFP_KERNEL);                         \
-       while ((token = strsep(&split_page, ",")) != NULL) {            \
+       if (!split_page) {                                              \
+               ret = -ENOMEM;                                          \
+               goto end;                                               \
+       }                                                               \
+       rest = split_page;                                              \
+       while ((token = strsep(&rest, ",")) != NULL) {                  \
                ret = kstrtou32(token, 0, &num);                        \
                if (ret)                                                \
                        goto end;                                       \
--
2.47.3

