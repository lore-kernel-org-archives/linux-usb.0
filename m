Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D07456E19
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 20:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157500; cv=none; b=WplLm5KCwzi/IDfvlOlYnmQ371tQg/sU8rs4Q0VA7B3njC8mhGXpDCyTIrZh2vGXhk/rz4duREIORylBgiyZjIiPduIrv5p72AfNYAmdNjJvkXkCSXbfRd2jGziHf3/wvQg6nxBZ06MadtOHG5O7wcB4JqQ1xDxOW5IkcvXeMF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157500; c=relaxed/simple;
	bh=3yZszP7h9D+b4l8Qps4Y4MOGGc25J0O0ar2EHyvPZvI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y3hsjalbb1wkoRhoodIMcQ6M3NcRgVXeEvGSfo0L4hiQgMzb5uca6/aAQiQtnY4WrxRzZ+owca0y/2Cnr3TUorQsKD4h11LSfrUYWaMi4vjQvRC+BoZtIH2VMIOmWlE1WJOvvh4+sgq05Dy7Q5/uwmC+8GPJnmNVe171eJY1JEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0FTxoz1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0FTxoz1"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441fa5c37so899611f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789157497; x=1789762297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gh0NEVb4lhSj9DL7AtTXOPiW7ET4oJeisxsXZJlngyk=;
        b=U0FTxoz1Zg6uqMZF2BQEEjYJyQ/k1P7N4vKpj9oHYV6Gi15Fs4yBVE6qimIbKOYeHp
         1eRPFyGrU881gtStYr+JA6B9ENCMy/Dn+a7P4pjTVSK+w8ieYt+VTod/GCtbrqpwXSxR
         IrSykvNZcArru8qVwDJTrMZmAJT2iSnCcKT/BRRgaMDU0ovc1xtEOJFSvGVvmEb/wPMP
         t8FnAuaKr/g8i3hOlVYPg/W2omNHu6UQdQ7EnHbQkg5eJ2qIJuITrQDnnIN8ot9pg/Tj
         3AChVOtAtD0Nome3u9FPsZbJvl2GvFi0UD+mIfAfxD8kvl9KJFkhOCSLEW4qZ0KBanDF
         jlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789157497; x=1789762297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gh0NEVb4lhSj9DL7AtTXOPiW7ET4oJeisxsXZJlngyk=;
        b=Pc/tHn6amYEqs/Ep19ssFT/gr196C3/bPebAWnXi4lbgJ3XEI/S7ssdU76W/DZnmbq
         syr5v6vXzsIV1GYOUJj2hE5X3TFghnWBDYUwrjm0FnNDUarxUzKu0ELOZLP3zcO9eqDp
         u1O8rwrT4FwZBSj2ZG5IJw+6KHPlTHxb6gFlpT2S9cojm4TdEdc939IdkEidhV2R2f5f
         AzaARXg7k8IXRp5eTOD4femVsLamBebrdnbTFkZRYm6D0U4tjkqOupbi5VkHOOYhfQXI
         uzjaxfHjScxtIxXU/xxQl/PuvX9ogymxUfx1+05gc4BUNgpbDjl8guSUCbdSA5bsUWrp
         XtzQ==
X-Forwarded-Encrypted: i=1; AKwUvByiY6/4xbniu3ClQ2wqbS6Qe4MgHtJu6a8B3MYAZRUhZfJE47RvTZyrSL5NIaN9u5G1v/cTBX5cHa0=@vger.kernel.org
X-Gm-Message-State: AFuF++moSrwbwzqNg21E2D8HLOXqnB6ww3djQthEKRr4u3952gDpbQ43
	67ezU8yeaSnSlLeX80JVSIOtQjZEMTLbi/r3qTuz1DB6R4LqUeSWG8is
X-Gm-Gg: AYBFou1Ito3QLvh/oQ0mBbwLy80zHluqvS3Wvut6eXKSbwjgA47MJ523fYeLzippQj9
	EUPhexyWgnViqFH8YKBIgeyb+gksM09vidmGjx2UvXm1ktH4x4HWb6hdLO9Q9cgBUZnTFBPFChC
	nsraecYQdb1NUK/0odYAK4Wz91wUQhptKnmu/FDP/6WOq1HG9GBtPkb+e5w7qBwHhyWqF/rAv2+
	E60wMhQFvsDA6iKZoOWdWxg4rS0kdi+G8nAxpF9MhlLVny9Lx4r4l3QTKY9pXOsZc+jJxUiJA7n
	ytHAnPrOlNKLW0/xV7p4sViVpgSoOi8wyrxmGzDD1Dcb2k7K/wXaOmJHFGPvogZ2tmSp9AGp2Ma
	6vYmGMDTEkmt/xGJ56lpPV9bdD3XhpQWpP5GsqCxyEUaeRKhEWojqbT2ujTD7i7HxHx7OxOCP0l
	iyosBcU+ySc8atsBpMDG01rQ50hnMJHUwazO94DTzqwXgC1W1n3bjPR+NbZT71ukGotXTtOX7mu
	zEmf50Z7UyXLJICWqHgnsbSruZrtI4q37jo+G5eNs/cCfYYNwK5T4J0Rohjc1IV20o70qg04E7P
	vynLLlev9bWb0xotbT57bEgrYOidL7acRdfO6w==
X-Received: by 2002:a05:600c:8b5b:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49e619d6e64mr76000905e9.25.1789157496852;
        Fri, 11 Sep 2026 13:11:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaeefsm97075635e9.12.2026.09.11.13.11.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 13:11:36 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: core: Fix a name that does not exist in kernel-doc
Date: Fri, 11 Sep 2026 22:10:16 +0200
Message-Id: <20260911201016.79577-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of usb_bulk_msg_killable() refers to usb_blk_msg,
which does not exist. The name is usb_bulk_msg. Say usb_bulk_msg.

Fixes: 416909962e7c ("USB: usbcore: Introduce usb_bulk_msg_killable()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/usb/core/message.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 75e2bfd744a984a95f5586bcf5c8d79fdca1c463..331fdb8a2c4dc9f9e4c724061eb2ae0ea5d9954b 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -411,7 +411,7 @@ EXPORT_SYMBOL_GPL(usb_bulk_msg);
  *
  * Context: task context, might sleep.
  *
- * This function is just like usb_blk_msg(), except that it waits in a
+ * This function is just like usb_bulk_msg(), except that it waits in a
  * killable state and there is no limit on the timeout length.
  *
  * Return:
