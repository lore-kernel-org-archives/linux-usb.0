Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF11271456
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 00:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786841687; cv=none; b=IQQGZ/pUs1SSJqBrMK0XBFuRTXHVNig8d6OauCG1llCT4ah+mwooOFqDm/W03+lWx3IA8IicQJwK6a4xr4NbkKtxT3oc8U4wfBTZvs7LYZJB+ARMaVP37Wf+waWLrI+zEtvAj6pbGfhQnUE5SNcgzT5A30kt4A/a021wNXDeDUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786841687; c=relaxed/simple;
	bh=dhYWpeBhPVGAijpVY9A0yj0k2r/Nn2Iq0rU9yCWTMVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PHHs7ylGF/p2o0YQZxe8Ow1m9qjuW09YLlYTG4QjigIFFad/w4F+P7GQATWYvbaHtGO5oBwFa7QzxWXjWMHvQdRwxMFobTFjNV4vt9ocP04WRFgCcOACxVN+cmA2wGkIPDDBzPna6KvjnehhZx9AAp99XKk85RTXtoA+rIQ+zYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqTgSM2k; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqTgSM2k"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso2103015b3a.1
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 17:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786841685; x=1787446485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LhBayU0zL3CCNfcwVZJNkjqGRYpc/saRBdtRAgZU1O0=;
        b=BqTgSM2kB/RstI3aWfegYTagtXy4EEpv28qbfM5UT3Jv/wthdSAq0S9KBPISIeHoaI
         YWw+VxYnqkqGzWLYN99bTEgTu4pi9xvjN5smTAf5+ausLBX6LW0ocascFBLCktBY0Ng2
         +tSuFomfa3uRcvnkfNJP3HpwchtiaQYkizxbTGifcW7/ShGj3cO+0QDsAYoMsaDmvEkQ
         Pu5lzW8mLc4NKAb7Qpur9wzXGLswk0iEHMnZHdKsKUoUHgDTQVdoog7lWaf4+TecQJpe
         l+BQiaS/p9m/FvMk8lHzyJHlUCgLOHF24DIguWh2ldzFde2MJLvHhiL2nskgw260ofvj
         mtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786841685; x=1787446485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LhBayU0zL3CCNfcwVZJNkjqGRYpc/saRBdtRAgZU1O0=;
        b=JGbeX/swsgQRjT/NUhkUPnGKZIPKfZVib3JMK4eXoB8ZOgrXeCiESiWU4giZyIeBgB
         2Z/PHx9vv/lGXrfEgNBIFlPUdlVML0WPVTey6TNyhEB2nREOS8XLSgF9trYjS/n8VFl6
         v2Rfjb1BkXbhgiB6apPHnengovEQHMpI4Tp3PXy5CqerRquB/aVCEBVPb8onVa7oLvMr
         wAUoe43Aos3s5bPDQfR4fmzRVibCTC4v9RhYNZzMlh+zzHdDZaBPeG1HRA+vrm03wRNl
         P/izFUlHHnHphO48NZGE5H1Oh8b81HDJ7FqnfbrFLFYjSr0SLGNmk9ttH7jNceovoUU1
         E0lA==
X-Forwarded-Encrypted: i=1; AHgh+RopKsEGEgy+U8K+BeIAFO/Hr4/3jO9wh5OCCqLxvOQZq0serSdo0+WrdWRUir9UhlBu3VjsDaA+OBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdF3a1rwOqTYmkpM6lyWgOYWmAg0+L0ggPSzlpJl1cPlRw5nPv
	Thnb2AojdwwOK+/SeMScfFCrRQGlpkI8Z4Puu5qB+tn3FVRr6JpxevrW
X-Gm-Gg: AR+sD13P18hJpV7Ov+xOmcdpIMmH8Ttdy4E+4iB6yg0gtcI9uVB3vokmQZ8KTU5EmZp
	J7eOD7hTqrpmQitlOOkUAVPhNPWbEH1OBf+ZmTj1xYGDUpiSVHoTnhfgVeauMi5T9RQ1qZuonq2
	XnFWqWTZwyP3uRMJWQQIuYUze13/J2+QeT+e4M6iqhO9A6wIEqCZDbCGk3Y20dC2b8fMeuTTnrM
	d9hGWRDXWkvFIt/TgyL416sMWPBIViNS5qIH0SIFKUBmSsgKen8lHveGA3e9b05yi5Ab6uKGscr
	ZdOblNU9pX6m8gqzgJx8w8yNadAlM+9RRIi6PTFwyYQOEQWTCXaV0dr6gnLh97+Ez9wvukcl8E1
	gbDMdJySJCgDDCDSTkJXdB8loXgoAkIw0xQbCQkeTHNbHXb4NDj/wC1VuLAZgqEo9heIq4HIwkI
	bYuj1YJ5vhCQhPFcB3kLLNEmuOcMawu9ikXPAQm344kgQGbmlwbHWuMA==
X-Received: by 2002:a05:6a00:a889:b0:846:5d1f:56d4 with SMTP id d2e1a72fcca58-84fdc7c6a2fmr12528000b3a.14.1786841685271;
        Sat, 15 Aug 2026 17:54:45 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d0236a9sm1589202b3a.24.2026.08.15.17.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 17:54:44 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.de>
Cc: Kees Cook <kees@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>,
	syzbot+2280f1cca5e6b0c353e4@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: f_midi2: fix use-after-free in string attribute show path
Date: Sat, 15 Aug 2026 18:54:33 -0600
Message-ID: <20260816005434.34018-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_midi2_opts_str_show() takes the string lock internally, but its
callers dereference the opts->info.<field> pointer before calling it,
outside the lock. This races with f_midi2_opts_str_store(), which
frees the old string under opts->lock when the attribute is written
concurrently, the show path can read a pointer that gets freed
before the lock inside str_show() is even taken.

Change f_midi2_opts_str_show() to take a pointer to the string field,
matching the existing pattern in f_midi2_opts_str_store(), and
dereference it only after the lock is held. Update all three callers
(iface_name, block name, and the EP string option macro) accordingly.

Reported-by: syzbot+2280f1cca5e6b0c353e4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2280f1cca5e6b0c353e4
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/usb/gadget/function/f_midi2.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
index 19fdac024343..6bfd171b96a9 100644
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -2178,13 +2178,13 @@ static ssize_t f_midi2_opts_bool_store(struct f_midi2_opts *opts,
 
 /* generic show/store for string */
 static ssize_t f_midi2_opts_str_show(struct f_midi2_opts *opts,
-				     const char *str, char *page)
+				     const char **strp, char *page)
 {
 	int result = 0;
 
 	mutex_lock(&opts->lock);
-	if (str)
-		result = scnprintf(page, PAGE_SIZE, "%s\n", str);
+	if (*strp)
+		result = scnprintf(page, PAGE_SIZE, "%s\n", *strp);
 	mutex_unlock(&opts->lock);
 	return result;
 }
@@ -2278,7 +2278,7 @@ static ssize_t f_midi2_block_opts_name_show(struct config_item *item,
 {
 	struct f_midi2_block_opts *opts = to_f_midi2_block_opts(item);
 
-	return f_midi2_opts_str_show(opts->ep->opts, opts->info.name, page);
+	return f_midi2_opts_str_show(opts->ep->opts, &opts->info.name, page);
 }
 
 static ssize_t f_midi2_block_opts_name_store(struct config_item *item,
@@ -2435,7 +2435,7 @@ static ssize_t f_midi2_ep_opts_##name##_show(struct config_item *item,	\
 					     char *page)		\
 {									\
 	struct f_midi2_ep_opts *opts = to_f_midi2_ep_opts(item);	\
-	return f_midi2_opts_str_show(opts->opts, opts->info.name, page);\
+	return f_midi2_opts_str_show(opts->opts, &opts->info.name, page);\
 }									\
 									\
 static ssize_t f_midi2_ep_opts_##name##_store(struct config_item *item,	\
@@ -2589,7 +2589,7 @@ static ssize_t f_midi2_opts_iface_name_show(struct config_item *item,
 {
 	struct f_midi2_opts *opts = to_f_midi2_opts(item);
 
-	return f_midi2_opts_str_show(opts, opts->info.iface_name, page);
+	return f_midi2_opts_str_show(opts, &opts->info.iface_name, page);
 }
 
 static ssize_t f_midi2_opts_iface_name_store(struct config_item *item,
-- 
2.55.0

