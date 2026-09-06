Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C99347BDC
	for <linux-usb@vger.kernel.org>; Sun,  6 Sep 2026 17:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714681; cv=none; b=fV27MKvrkAY1fKxJcynLUyzF6pYs5t9aKh5CEximdjxE+yOj+SnFawvMxcQt+u+mpcYUVJWThlCI8LFG9kkhqabXdS3/prTREu7nHzAEruiBz7CjiWz9qLUEVfzSwbtMX7+crQlRqzAIgCJ4i4h0ib2zu9NwP3A/1fQcapRUnjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714681; c=relaxed/simple;
	bh=psjI293ZtGNpGRvON44ovFaq2TzPAV0Ldl08cBMM3Ho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ky8QhBdPwZbHExq16HQAxN7P/2b019o39K+B0oLEGIs7YftZ1172QQWoQnRXjU3t9lkioeVDU8qjyTfiSpXfC/klBbkS6VlaYG+6u07MhMSTjujrz/9UD1dpxd2fsA40HZ7LSVY8PKPqvJ4xO43O27piqLqYoRAiiJqc9CkQEQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fofpfiv1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fofpfiv1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so25139605e9.1
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 10:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788714678; x=1789319478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAkZd8CjaXOKJCXRn+B8PYoP/SbpnBuVfuAx3JK4Vc8=;
        b=fofpfiv12nLfclPqwOMsa42gWmINLKGMtQOqCuGVqyzXFkalUOIiwxXR3K8pgCICwi
         9wjM9PCUTqzU3F8Vmh2Z+VTb6R2o48ImkPBwZtKh15R/58rmPCwtY9jtp16FK9Zab5ZQ
         TR8kdXG9AwJoP7jjKsu02fpHZmFz8RLPpqLTL7aQob8zVy/JGg+hEvy6pqlpDhnLc5/A
         9JKKekVzxcpPRn5GNI4GusJ7fUw2OOd1UAR/m6+ECMwMnxXWiYHBnF7jC+vufskKCwe3
         iwOrLoPRUL+c7cOtgXcgm8POa2LRgqCLtHZBtlH+0xfQgpHZfMPnAYMLTWtEO/SZIIQx
         TnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788714678; x=1789319478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAkZd8CjaXOKJCXRn+B8PYoP/SbpnBuVfuAx3JK4Vc8=;
        b=pogff5RjyRqURjXBMlffBierUDODxgarAzY2Ua0Ixunl3ddB2KtkFcvGuIW1CiLW3Z
         1xxYQc6yZloFzU/ME8SdhsIEO5TYrJ/ZBqTHlJZvTM2IggWK+M5B1dBZMZa1T/5nWWle
         SyGVi2p3ZqPCvJznSbKBO+G1WX8rvzPg1mTuGyLe3oxEd/EXC/+h3Km++hdKiFB95C20
         VVh8v725uA3KIAG/HGJPnxqczJ/Nru36+H5p4Y5A2uJa9azVdHZHXJ19wne0ZJgI9VeM
         ttZ/sX2gmDKjTpBHkZIycs6aTmwqf0ahkh8NCI3DFuAJjxIYGBwM96LitOfKaCEw7IJ2
         Y6qA==
X-Forwarded-Encrypted: i=1; AKwUvByIh0LrOQ2KWGZK2qv2ayAyid5nEHGqL9rRyiJuOZWftx4SRF054FBGa2mqs225qOrZoMry/p0fdqI=@vger.kernel.org
X-Gm-Message-State: AFuF++l7L3v6uQASLadlBWIHAVZa6ACfTAd0jgGYKi1zesd6n6ksCy5H
	TorKmEnaLlvTCPZu5/P31WnrM/PB5CSqR54yOOvFXrqL5iGlh4xuRNydWfjnGHm/
X-Gm-Gg: AYBFou24O/v+/rzZbe4QdmiyHbH5+h59ruKUqXBxLfhVLTa85nAya2Msgp+/7sZzMZo
	IG7iBQtLgPb77+22XF1lDftYOFs9N93JdaY+E0d7t6EMEk1jLJdgEepkl0g/2bubuUdFdmXdInm
	wfn4h3rf+ad8ObtN2V9930Z4tFjut/P/WUWpUPsUtdHDDXlkxgBvZGG2YDGK3wgH9hkrob9oPRD
	3OYBomdhIKtN7yvmHTQgp3jNWvCjeykCO4mhYwefmlJME4pErIcmYQajvJ3UqViaiP1V0GS++hj
	rTd/VNCXPOUYPYxAR1is9KvDdLktVBSaMkWUoRZF3GS2gjPCZlqMN0k08RZBme33zBZejsOiAHo
	ZaGiNqSWbZZrZmtqogJzyFF6bblfCNfOFvS1DMa/he1fpv25kC5777jKC7ot1j006/eW4GFcY1F
	vmXKmCVpur5XNGdD7m2iXaUb48N11hFaaEjO0EpVe01j8quV8JaJFqCmNGvdyPo3jYNGA4wTFMP
	lYaj94M+Aol7VJ45JaToofref8JWiezFPTAjhbIjjxjvTBRgpIdqnKatbph+zaoUCqQsXd7ghVU
	F2ZZIbYlr2lRbhijfTlT7AO+cb91sQo4X2Z+VRYeN/7GOBP6zoiR3PtWXcx5xd9JX1tlMNpR
X-Received: by 2002:a05:600c:c4aa:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49cf8241a84mr312530035e9.9.1788714678354;
        Sun, 06 Sep 2026 10:11:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9d84-5101-9c80-d25b-14b6-410c.310.pool.telefonica.de. [2a02:3100:9d84:5101:9c80:d25b:14b6:410c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm134050935e9.1.2026.09.06.10.11.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Sep 2026 10:11:17 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: zero: Fix the ss_bulk_qlen and ss_iso_qlen parameter descriptions
Date: Sun,  6 Sep 2026 19:11:15 +0200
Message-Id: <20260906171115.2601-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The module parameters are ss_bulk_qlen and ss_iso_qlen, but their
MODULE_PARM_DESC() lines name bulk_qlen and iso_qlen, so modinfo
describes two parameters that do not exist and shows no description for
the real ones.

Use the parameter names in the descriptions.

Fixes: 0d6c3d96678d ("usb: gadget: f_sourcesink: add queue depth")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/usb/gadget/legacy/zero.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/legacy/zero.c b/drivers/usb/gadget/legacy/zero.c
index 08a21bd0c2ba..aded34764093 100644
--- a/drivers/usb/gadget/legacy/zero.c
+++ b/drivers/usb/gadget/legacy/zero.c
@@ -265,11 +265,11 @@ MODULE_PARM_DESC(qlen, "depth of loopback queue");
 
 module_param_named(ss_bulk_qlen, gzero_options.ss_bulk_qlen, uint,
 		S_IRUGO|S_IWUSR);
-MODULE_PARM_DESC(bulk_qlen, "depth of sourcesink queue for bulk transfer");
+MODULE_PARM_DESC(ss_bulk_qlen, "depth of sourcesink queue for bulk transfer");
 
 module_param_named(ss_iso_qlen, gzero_options.ss_iso_qlen, uint,
 		S_IRUGO|S_IWUSR);
-MODULE_PARM_DESC(iso_qlen, "depth of sourcesink queue for iso transfer");
+MODULE_PARM_DESC(ss_iso_qlen, "depth of sourcesink queue for iso transfer");
 
 static int zero_bind(struct usb_composite_dev *cdev)
 {

base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0

