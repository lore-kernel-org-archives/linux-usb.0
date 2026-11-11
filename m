Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370493;
	b=bRyeB/QlvppPLYvJ98+fLuR4tMMpxG40G1MpVwHEBMcFlFxz/4bPnbMnpHL+wWIfLzgZ
	 Dqa1weLtB7LT6CmbdzEAGXIX9f/be8lWQo8JCh9HPMf93ZkJRsKlvN79UfewvgcGj6izv
	 5A0nrRhdEdxl7qfbyEyvq6dFt+xgnrOaBjY8eUqgMUPOW4lESiNmaYyxbUFrQdXbZk6aG
	 yuFRs4CNKijQQBXnmUmRCVaTsIByRTc4tMQF7AIENpR9PZ0tAT5ExH74V+mKuIcsAwzG8
	 5qfp85MS1yZO8nqCfnjG3WTL14HZUFW+Ja0ojfXbuK52KJ+Wd6T6+FKauEESXNpsUiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6Jx0m1gR/D5Ve2Igam7P3jRhX1J0ZyZQYElBbHXWnmE=;
	b=sPjTEyp7Sl6PBVZww7hS+2RFCWlTccUJ3nPck4MVjEUsHkjN1tOjhKt/ED/1982Hbfhw
	 +QHc9p4UaFQEY80aEI7RNaoUOsNqokdG9DJ3w45PhDK96RN476N9xek0yKy8LVrRKL4yH
	 MLV3VqK1v/mX9uItBXTQEi+DhKGScgnbeyr7BS5x6le9TJ9Dl7zv9HWsIQ2DZJxOT9jVZ
	 Y8ZvG7GGingvy947f4etjg+WfJ9pVi/h4NyfDWUoKWFt6Gs3LMFEm4sjqd1+UBwtNy/tg
	 ZB0xTXaEeKO5QCcrNPNBajzinUCek3d6t4P+tWDyXHuC1wY1DlSvRX/v/XeD7qguFlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=03ydl0RT;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A8A606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 04:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=03ydl0RT
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5364042eecfso34578431cf.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 20:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794370492; x=1794975292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Jx0m1gR/D5Ve2Igam7P3jRhX1J0ZyZQYElBbHXWnmE=;
        b=03ydl0RTCX3B6ITWY/G1RpQm6rply5nXPHjXFdECUKSjWR7H6xA5K8HMejxzjsYVRw
         FIE4Gb+IgGEvkoQp0ahkxjfSLfqEBA5piYMgXsc9gfn6REAcGNC7u6vBaT8cv0jjlfyV
         X4YMcecqJC7cv1WuBlcs5THWD7KjR+PLmYuA3+EzfnY6yRgLhf9SKUTc1rFPDiZhqzIk
         64JxUKAQxMDeGGm1nFLDqDBc7uL0EwcVJoouQjVUfFBs/c3MhAKNrPrBkGR8UYx2ZXxW
         IbKvxwjINumcStWCT0/Uobm2va2WpWKoC3QcuYlYrT7Vz1YYKQZquOROdXwfmnbxcAPN
         dJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370492; x=1794975292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Jx0m1gR/D5Ve2Igam7P3jRhX1J0ZyZQYElBbHXWnmE=;
        b=m0YLkzpfWqHXFTsR/sCG9WudS0wU9sIe3VYVCvgcDDe4t9YlKkYIaRd/B0ucMv/eIL
         5WJBXCVLgCiXQUbOg46UY3zlsAEGVhJDx4hX2zB3szSGJ/sYoy/XBc5DuXWL+z3B5oWH
         iAgXTGZXLNj0HH/5kJ5ZPxvm3F7ldg4/5n9lUVU+zlIQ5QrpmqvR/0nbsZsmCPHAJEnr
         8Rl/ty+p5d+rGHfaRNwHIFZ1K0zXyGjQBwGJkfOuNoaNVV7j/hdiyURmJuzGC/wyZf2u
         gkWo2Bq7rYhCql+OBsjYY6NaUcIxEwMaLuzSeqLbCzsFaJhIx+08Fe3EKW1ibFvFOIZo
         exwA==
X-Gm-Message-State: APuU4Z8q+HdRlgsU5wmewnuHEQ1u/YAZzxsJXeV9TVXkACeKTYb9D5Qw
	FjSCOPcoblVkVCTJlxPiN8DBrGRz/bXuTcB68LvNOTf0FqKwDJ4kuYLZr2c4mslb
X-Gm-Gg: AYBFou3b7w2MNLo8nDDVzQrDV/kYP13k55TedgZUyXxgHHZkunHWcFArsHmKQhvYVBA
	KqkwyyiwfHwcRw5dkWJBhw+WQEyhf4fcYIkvizcnkCebkadBu9hT1uK2RPQSOu/cRerEzxtmolC
	oyhR+OQ+9UDwC806MmDPszg43X8IDGrthGOzX9atKR18oa8o8bfzIV7nM2GrRV4a6Xlo5wFcc4B
	RrIwsGVwcSN0h0WB6xev4meMhmsfMR5n0DPV4akyDbePm3JuJ5BdT988zuaycrmZFYFGVd40klx
	7P3wsW05uuimvJIt4V7RMnuoR8689pYtfMuauBKo/td72hZ56iRhlCDMbTKPwx8bBx2t3cDjYCI
	kNlScKl05jWhpdAVqa4Qqe+ul4zntYMRxH5XHPFXAEj//uTRPNyGcQPV7LXj5X21BFr1k7qFn1V
	COOG17vRW5Hch+/qOyDmZOai4Urr2lmzRbUhvutKy8yrYwLCKwXCiFRcUScZzg+VKmSTjMRFA1w
	HSvEAunym3q6b1v82SnQTuLhNfWsssGwUahx+P+vP1HPsmPBljryGMnVoN1o8neU1jS+6SvhE9l
	zKi5LGqe9ABIkUmo1g==
X-Received: by 2002:ac8:5ac1:0:b0:535:14f9:3f03 with SMTP id d75a77b69052e-556c0205a1dmr17834711cf.25.1794370492247;
        Tue, 10 Nov 2026 20:14:52 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b942e83sm40856271cf.18.2026.11.10.20.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:14:50 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] usb: typec: Check the alternate mode ID allocation
Date: Tue, 10 Nov 2026 23:14:46 -0500
Message-ID: <20261111041446.3072716-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

typec_register_altmode() stores the return value of altmode_id_get()
in an unsigned int without checking it. When ida_alloc() fails, the
error code becomes the ID, and the alternate mode is registered under
a name such as "port0-partner.4294967284". A second failure on the same
partner then fails with a duplicate name:

  [    0.423055] sysfs: cannot create duplicate filename '/devices/platform/altfail/typec/port0/port0-partner/port0-partner.4294967284'

Return the error when the ID allocation fails.

Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Reproduced in QEMU (x86_64) with a test module that registers a port,
a partner and 63 partner alternate modes, and then two more with
failslab (task-filter) making ida_alloc() fail with -ENOMEM. Without
this patch, the first of the two is registered as
"port0-partner.4294967284" and the second fails with -EEXIST and the
error above. With it, both return -ENOMEM. Same result in three runs
each.

 drivers/usb/typec/class.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 54c7810b563b..29fb13ca9f28 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -641,11 +641,14 @@ typec_register_altmode(struct device *parent,
 		       const struct typec_altmode_desc *desc,
 		       const struct device_type *type)
 {
-	unsigned int id = altmode_id_get(parent);
+	int id = altmode_id_get(parent);
 	bool is_port = is_typec_port(parent);
 	struct altmode *alt;
 	int ret;
 
+	if (id < 0)
+		return ERR_PTR(id);
+
 	alt = kzalloc_obj(*alt);
 	if (!alt) {
 		altmode_id_remove(parent, id);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

