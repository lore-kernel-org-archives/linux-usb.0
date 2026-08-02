Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C112206A7
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 00:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785632302; cv=none; b=Z6wRCow81mIOGHid3zPK+RoS/QBzFwZDePCbnPD8Nc4i9dtAiZnzlLjDflZrBI2duoz8XikXT7OzILj7axQzmBCAVyb5LGvmAgI6BTZujMfJAPFP34p2WdlO/8TmDgMrLW856M4CPZJpfKqGm9Zo1AdQaNGsiTpPDD14mX6nJgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785632302; c=relaxed/simple;
	bh=QZaiviFXIpFOU6xrt4pohFGuFmFnFNWk4lMFpZyHZPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nby1BClBIm0tJFlEmXmJCd0mQCp6qPZF2zmMEH8bB97EN/09dtWc4c/J/7wJYJNgJWK4Q+eDlfF7jC+kK4V92G4wZ6RmCtTfbw8aU6sIY3Rv8OTgzJjmd5Ogtt7Llfj7tc3XFQ8Q44fd8DSeqz1XocGnQKXjEkwgmwoqayJvKRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FziIgDtu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FziIgDtu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954aff6088so7374575e9.3
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 17:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785632298; x=1786237098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5getTzD0IVo0TFYhF1w5tTOZvncb1cQf4iioeWqGs5Y=;
        b=FziIgDtuq3XFdWR18OLLqec+JY0ah6ECy77AXLIDAXXnB/KDFkr0MwQjPcWTZ7rf7S
         4N50adPc4zdXtqvUMIPr599z4bE4kSGZBF2TJ1tFtJYUJF6IH4f1+iH7ZTNJjXu9uZAP
         5HAu6opkxrVHtIXSTHaOUzX0/NtsWdYtazkKsjzed/hAO+IF3SL2sG1ySjeqUkp22yrh
         0b9ENbgdvoOsGIzlH3EpHZ+JCMEVKud7P3+3r3qN6rlhWOYXzh/eJ26HMvEGIAJs/Zs8
         +PKAKHI0NfqwnXUg4PxxJX4f2/2QsPLvIfkf5dyu7AafPlp6uZILwXk2KbIcKPlSPG3n
         T0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785632298; x=1786237098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5getTzD0IVo0TFYhF1w5tTOZvncb1cQf4iioeWqGs5Y=;
        b=TwyTZL8ZO3L7W+VLo444pev6gIvUNEjtTTXz3cDJuvRascqBF2lxaKGaI7oH9MkJ8l
         S/xJyJq0qpOaabGVscwVbPVll2jTWAH3FqY+s3SV9oY7aCIqv05xWp7gEivEUImBp6Jk
         z5gFAfpM2lQn2kA195timqNL8l/AXQJ8kdLeiaad4OrW8N1zjfsUPDfbtgloNiYCsGFu
         hNApaAMDq+/ed9Zc12mXIXcQOCY78Rg2cqI2745Vl6BiWjy2btwiMQnvJ8odMxsdYkwF
         pHkxlmszPh61j38fH+k5cKj+9F4mP2Zsbm9ef5Y2+PQu72nxPXRcNVu7JNZYkfL+Tdj5
         hyBg==
X-Gm-Message-State: AOJu0YzzFFwplXRH1jWuQ0uUpE5iyNUkdTXkMJF/C3sUZh0JE2KHQMlI
	lsYgEWQBX4pxfMimoLrizlOWoHDkXxfRr2W/cU4hzxFaaHZ/tpCrdBJH
X-Gm-Gg: AR+sD10Ra65y79yKExzM2pJGvOYKWgE2O10b53RJIMhQyL6bBVrN/IVqyBCp7dZl+FB
	pwvkjPCQ5oDmb2n0KU0QnNeLsXlbTBSlQrL4FBowAfZV5jzWZ9erRotedbhvTdvxQymmPPLwlQu
	WjSCUaM0sRr8T1CRGNumoSMTF1GL6Xy3BrXNPkEmYqPqUS5hend5tzObM8EUniH8Ganv5pPTyYg
	lwijk7beIMAJI2aEksuwrv44nlQ7bk7iYIvltXFmvYoDTF5x7jq11FfT0ZHqp47DnIfCH5H+/2l
	vwtvbbTlaUEP02J6pFAdrD01PmOI/i8VYec4rxImY0JtjZ7fH+lQVe1ubj2Tr4tthMG5dXqaIPi
	NKfpGCIgyGQrWRHaPKuNGhCuWW7pgOF2WJOZ0e9l5UBbuxwMXQ5x3S0HkczrqBruLkJ5zxsm779
	3gwTa5X5INxY5X/nFU+MrBXqRMKC6meDkscG4Wms1mbFg+eIEW3lbiSjwbHgSWwUMJZg8PXemOM
	EhyBSiMb86W2T4coX6P8y4goKpXJtyf5Jk1ujSdmJNjWHaUD47U3jmByk/SgjhYeZ5FAbjtGvaF
	1hjm+EJ2ZLeut35H/qxOZ8p/p9J8+9aYtMQmw8MbbyW8
X-Received: by 2002:adf:e90f:0:b0:47f:9d0e:f8f with SMTP id ffacd0b85a97d-47fd72e6079mr9559836f8f.26.1785632297667;
        Sat, 01 Aug 2026 17:58:17 -0700 (PDT)
Received: from riacini.speedport.ip (p200300fcd73d5b95e8f13abce6faaab2.dip0.t-ipconnect.de. [2003:fc:d73d:5b95:e8f1:3abc:e6fa:aab2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm19700843f8f.7.2026.08.01.17.58.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 01 Aug 2026 17:58:16 -0700 (PDT)
From: Rituparna Warwatkar <rwarwatkar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rituparna Warwatkar <rwarwatkar@gmail.com>,
	syzbot+ebd045a6645cfb713c95@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: f_uac2: fix memory leak in sample rate store
Date: Sun,  2 Aug 2026 02:58:10 +0200
Message-ID: <20260802005810.92953-1-rwarwatkar@gmail.com>
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

