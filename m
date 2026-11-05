Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857178;
	b=knaTXdzJ2MiiAkX2LfkzsMWy+u8oEMAq01NAikjE7RH/kFN1yVimNtPXU+SRQu8/os9o
	 8PEXRgSl0XET5Qbh4WsjL6zm35TwHGopvgjNHf3hoTLYknTxkdobUgc2zA18ApOyTriWx
	 tR6zeaJGtVmhzUXBkMOFxBXl6zBUWUo5X+kxciojczVn64zzds2Pw7ftg7Q48mKAvZ2Ef
	 dN+L2zx4WtxmKA8FEq9z985hFvne/1Wk4VRiLpCw9lCYcNzF94sVbaPGu+NorS3GTfXP4
	 rVqfHKi/XWQLkyqNx7WVgq3sk6JmeoelBmNfqlmpcTwDeep/q6oDjUqTXr2CSOh8K1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zb8urviQtBLgbNWUzwiTWUQPBuOVmT07HgtSLoEJuzw=;
	b=AkihTR/WPCumGyHpp3iFe/xaSqV+/pz7pOKOQPj2+XBzQ1NGduFvuLr9wTPYCVO2Bq6l
	 O5ks33IyFQn2czciozSRX6Of0dFpOq9a92caVtFW1DkHDjxRKgteLj5N7NSzEMLHBGeha
	 ctld37C5fZ16NLrTDvrj1fc10UAmIr634ZCNbPgmh8rQOtKfscOklspNGQQSlwmkhlmQy
	 onOvskfaQ8nVjaC0s7XKz337h/Iu6UpsuMskBJpalpsgZwxbIlhr1h+tRZ1hQe0SYxcax
	 KbiCRFI8v2QBFe44RGjrFPIMETf4n7stHUJq1RpvtudFUEQnB4zyEkcE1IZfIpmWLgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrtykEZN;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A96E606A32E
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 05:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A96E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrtykEZN
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1713536c88.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 21:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793857177; x=1794461977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zb8urviQtBLgbNWUzwiTWUQPBuOVmT07HgtSLoEJuzw=;
        b=XrtykEZNasYdt/6SffzLapgWzNs+vL+S1AK/vssprL9RC934PkjJvS79m5XK33gK/W
         rOSil0n3jpCdsRoetjwk7ZrF6JHeEmXJ+eUM23meDLZTmRknGUobWy2JlZ5jCTWyMXmO
         NT2W9+eLolDUJ58egFtRa+h+HPuMrjSbN/lLW9BfmGx4EjTZqZ+NYyrD/XszF7qdymR0
         062vslxfhzkBAPNCxQaVMCNfCRXbSAlfn5/EvT7rE6hr3sJAVobQRsvz4Qj3V7wL79Sx
         fIEoX6H7LoQwxNscLqHn48m5g5BSM8PtA0wl9i+WbGKAg5lSjIaf3ovBx07+a5FVHynO
         9ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793857177; x=1794461977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zb8urviQtBLgbNWUzwiTWUQPBuOVmT07HgtSLoEJuzw=;
        b=Xha3FGKuU9nLA1fe7XKOv67ZN3Zce2rBUQgNdR1dgLKSqxENxfSVwHvHa6uLywMByh
         AMl+sViahJBTqXrGQZfeb52v5Ru9jDnwmYpAw1sTmLb0NblNjogFd256y6av7LhKYzmA
         NyLf3eGzAiwAWWzq1qgBd+4zQzne4HV6g4Ml5u06HLqbEgx1dYAea0CWg+sWZNCJWgBn
         w4cycuSm80XXc1YiLeLCVLJZVJB1jK0kq7jedo13A3rRtA807PPDY9a+NqmiQuxguf78
         KqW+/Kt2JS55ahqac0/y8YhSd0tqZcEKP22kUSOgOLqeRxwhXLvLFiFx5/rZP8oxuUgM
         1gBQ==
X-Gm-Message-State: APuU4Z8EE1QvDcGn5G1rg0JCke97Zb/YFJ1Iii7kLI17dxb9GfcbjNQi
	JGuXv4rnVO5d0wNIAzuudjIRzM6IbDxe0oe+wAC7o4DueUdvUGbzEDay8zKcb/JU
X-Gm-Gg: AYBFou0huNIzaXJ9ueN0rgBDbGr2qnP69QXUEWuFhgAfZm6vdvZLW1BjAFGXiz9ckP1
	Br7EwvXQXZPbZXhnOYA5oyiBZyfQoRH2y9M0rOIxpVgKscQ2tmIAQyH/iLexQGd12eh5VumWukO
	bGXlLynEblVy0PtgIdV9p24x2c+rww02f+g6tgDm8lIBuvW4AIRl8kaZxBLMH4y+tpoF+m9la46
	A1/T3TTsEAsHd9sIhYpOI5Z5Q5mYNrayJLVoP82eKW43IGDeFog58HYZ3BhGTA7om/LokSasEx5
	N6aayTlTuo5dMVYhCEeBN8cuJZWTAKObKCt0wip4DuiFOxK30ARvBloo8eb8iRdGGJZ5BpedyU/
	QOQZUHY3ehEEAX/E0uIzT6OWqel+JvSoV3RNSY3C4iUbhxj4cCeTEArmcXQ7i+SWM3T5AzCEw69
	Sf153EGP/GlaUmRnsnfHKqoZAbpTbR91xJDZfUB4/zuobEJycNWz+wC97x6KyD4q7ScJrDVjd3V
	fIvhAJMljTJCjd3tOSDVd7KqSAZ/jsmE4BLgwkSz3CgSQ1h//4/tsjmxEoQN3BkHUuuxfgsopEn
	PbUq4xMUVHsRLo/LtKBQQVmRlU0WVC7kCDKG35ofdFCD0s3uEbn716uEFcuxzbyQSIZlI3rCJp9
	BCLnpOw==
X-Received: by 2002:a05:701b:454d:20b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b23b5bb847mr11221092c88.8.1793857177219;
        Wed, 04 Nov 2026 21:39:37 -0800 (PST)
Received: from localhost.localdomain (c-73-158-21-37.hsd1.ca.comcast.net. [73.158.21.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2d69asm12417912c88.11.2026.11.04.21.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:39:36 -0800 (PST)
From: Saad Varshani <varshanisaad@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saad Varshani <varshanisaad@gmail.com>,
	syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: uvc: Fix deadlock in uvcg_extension_bm_controls_store
Date: Wed,  4 Nov 2026 21:39:00 -0800
Message-ID: <20261105053900.20082-1-varshanisaad@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed su_mutex locking in the function uvcg_extension_bm_controls_store.
Done this due to the deadlock caused by the mutex conflict in
fs/configfs_write_iter. Validated commit with the C repro provided by
syzbot.No other conficts observed.

Reported-by: syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=300213c2b5b55c0244f4
Signed-off-by: Saad Varshani <varshanisaad@gmail.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 70a1415ea401..78588366f656 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1114,16 +1114,12 @@ static ssize_t uvcg_extension_bm_controls_show(struct config_item *item,
 static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
 						const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	u8 *bm_controls, *iter;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1157,7 +1153,6 @@ static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
-- 
2.55.0

