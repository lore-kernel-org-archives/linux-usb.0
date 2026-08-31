Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBD04AFE12
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190926; cv=none; b=YPHg3yK1KuYrK6x4prB/AG5s1OUUfMBQSDLgumuwTuEPJno6EkSc3F+Kn8f4ehgRXUpIIS1+7IcBI9wtJQjh9sB5VEmsHKN5kP4q3ZFl8N0FsNwUGI5PRdWKZF21TfUlZsy6LB2yVJmnmeWCS53EqIFbqqN9UVT3C6kqhDnycUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190926; c=relaxed/simple;
	bh=Gq8JYF5nWCJlfgbdytpev/utNj+z83XlgtJTacxeFCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaX4JLaHeqGaTaTmczZm94dVTfnh0Abwdf+7ceCL3DlOGbSv5uNdw/x5yXAMOv7ziVEIJuAw8V8diy8h1819G7Y0OQUNjnCin5L5mI4FBvN4k66qQ0oym4dopUzNk2dDrqxkj/Yn8gomL3obuq5NCRPHPWg5XEboka1OJg/eVH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=iA3Hbhs2; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="iA3Hbhs2"
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2753C3FBB3
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788190923;
	bh=axqcHerFD9/BKdwHu8nkAm/q4tjDX8v2GkuwmfGnDKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=iA3Hbhs2YEd51rsNg2+qFqI6R0t0xGbKiU5TPw2KdtgP0T3AjFFKEW6+lwg2BRy0z
	 HkFfwVejt7/VP6UeJkQmwc5b4LAojBFU3O/f/GdSoo88lE4PRHCHqZNzX922e86Iry
	 mef86oEjcyUuQxz4q3r0OkafBDhHXe188zE1/ogNl8GBjZ1RgtJmz08RP4Eq6jZ8Qc
	 aje4nQoI7/5ZSpW/pGPq94Vl5PirdDj6biBuaEOKPrFZCoBFrmwPOB/GgIPKO93sgK
	 T1YbYwdTXeehF4xhhySmfZJjch892KnrH23A/ewFJjXcWuDanptWuZ/AEPywtBSKgt
	 IdoqcCKFrHtseHBqy0/s+VsDHoU1Y/mEd1rm4koiTK50y1I7QaJl+i8bWScEUKAPx/
	 x6qZCusTT/PbNSMnUbyMA6t0OIAI+ELDEk+kYC83kG+lDpHU/3mYbDeDRd9mbg8AbU
	 l7L/0SFY9PqU1y36MBTDks+brhwAlqYSIvU+BXt0dqLfwUd/2cdqAAoktjiWfNKxuB
	 01xn1kpDANPJqiQQ3Ow/MVR9qaM1vA9eJF6YBZgQNv5BCOcAoIhKEqy+hPtttffRar
	 wonOtrrGxKIdg5GZTkXlqgaUDU4bs1UoTbYFm6x+mnLDj6+e3ZKsvQTCHg5wtAhBaN
	 FYlRdZVQzYvxjzt+5Rm5rpP4=
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so4186822a12.3
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 08:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190921; x=1788795721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=axqcHerFD9/BKdwHu8nkAm/q4tjDX8v2GkuwmfGnDKQ=;
        b=NXWThJx2ryoBTdzsjOTm5G5tpycdXi1RNzTS6jT4zORztQHneIzngtIw/n2B0lIoS1
         9YLJ7D86M70CB9JOxbz2RbkBR0FTsAZLinyUuR4GypBXeXAHJmPd79Q3h6l5OOGGWTWA
         aKifsvUz+PSmpBJaDubWfWTSmgyJSIZxYBKes3Rsej1CAX7NhZLCk4PnBxGLD5mL31Eo
         pg4u86g7eKAMihBlsVBX3fS1e8riRrG2wqrj46bzj2L+5LIigaJuZnFuXv5/x4kaGouz
         TtMsN4kSgWiwRJlqhXjBxdwFnXOZtTYqGLNYUczSrzYceWwJsPLfAtk9/uqQO9q/jtTX
         g1yA==
X-Gm-Message-State: AFuF++lmwQqZ1diAbE/EiHTESgr1G7AiD0xDhxdgSDoJ8PU+Q9Cmp8om
	d/lg9ElYtMiVMrxotzzLzhdb6QP5qSgeH0M20d6Y0eDobPkfcogdCUNmLd8uVVmIsFQ1J1CZJXc
	00MMFFFGqx+/nYPACMSRQQMRzzu5XWpetTrdEZeEHfnGrmKTpqyXIL5p9TLGE9DMRE8wgQOX4eo
	0bAbyiMmZDnw==
X-Gm-Gg: AYBFou1ZaJFm4eN16ikPujk11MJNTvTlBN73wYdM5zVxzcNhE/S4qNsPU4/HfcTmjfZ
	TvZGXgiDm326EWdZxUoRDyLOMuUwwB2FjVwsMdig7ppCCBtFHnCFMHUhlcV8xwrZ/n15uSn12ND
	Y5ffOa0jZQENWfyapx8kQ87wBpOaXz233QAUA1ATFJQVJ6Y2IE90dqUbndTCg0Qik/bLKVXs2MI
	Fo7FySqNsh3twWYOs0lUFpo1bS3yiHDYTDs6yKA/j4qsILCOWp5IuwK5p51ZTjITIenVB1Ouf7r
	knGOkFtmyQqtNhVHYH6BzjCYWjlVEUFjUn/Xpipkvw91yZ8P7rbaVXb4h0rYnW/Xi/WOl+1kvPN
	t40Wlw1dHlAy3FbULn18F2fB+Z2eeyeSywTrLKM3DoA0eKUSek38qmA==
X-Received: by 2002:a17:90b:2c88:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-396d0f52a0amr44291203a91.8.1788190921319;
        Mon, 31 Aug 2026 08:42:01 -0700 (PDT)
X-Received: by 2002:a17:90b:2c88:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-396d0f52a0amr44291119a91.8.1788190920779;
        Mon, 31 Aug 2026 08:42:00 -0700 (PDT)
Received: from resolute-linux.lxd (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d62b807sm36228a91.16.2026.08.31.08.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:42:00 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>
Subject: [PATCH v1 3/3] usb: gadget: configfs: drop dead store in webusb_landingPage_store()
Date: Mon, 31 Aug 2026 15:39:39 +0000
Message-ID: <20260831154139.55811-4-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831154139.55811-1-aristo.chen@canonical.com>
References: <20260831154139.55811-1-aristo.chen@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bytes_to_strip is used for two unrelated purposes in
webusb_landingPage_store(). It is first incremented to account for a
trailing newline:

	if (page[l - 1] == '\n') {
		--l;
		++bytes_to_strip;
	}

and then unconditionally overwritten a few lines later by the URL scheme
detection, so the increment is a dead store: the newline has already
been accounted for by --l.

The dead store makes the subsequent bound check

	if (l > U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + bytes_to_strip)

read as though it also allows for the newline when it does not, so
anyone auditing that bound has to first work out that one of the two
meanings of bytes_to_strip is dead. Compilers do not warn about this
because the variable is genuinely used later.

Drop the increment and rename the variable to scheme_len, which is what
it actually holds. No functional change.

Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
 drivers/usb/gadget/configfs.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 4bc95f4b6670..02e619ed14f5 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1062,15 +1062,13 @@ static ssize_t webusb_landingPage_store(struct config_item *item, const char *pa
 				     size_t len)
 {
 	struct gadget_info *gi = webusb_item_to_gadget_info(item);
-	unsigned int bytes_to_strip = 0;
+	unsigned int scheme_len;
 	int l = len;
 
 	if (!len)
 		return len;
-	if (page[l - 1] == '\n') {
+	if (page[l - 1] == '\n')
 		--l;
-		++bytes_to_strip;
-	}
 
 	if (l > WEBUSB_URL_RAW_MAX_LENGTH) {
 		pr_err("webusb: landingPage URL too long\n");
@@ -1079,15 +1077,15 @@ static ssize_t webusb_landingPage_store(struct config_item *item, const char *pa
 
 	// validation
 	if (strncasecmp(page, "https://",  8) == 0)
-		bytes_to_strip = 8;
+		scheme_len = 8;
 	else if (strncasecmp(page, "http://", 7) == 0)
-		bytes_to_strip = 7;
+		scheme_len = 7;
 	else
-		bytes_to_strip = 0;
+		scheme_len = 0;
 
-	if (l > U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + bytes_to_strip) {
+	if (l > U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + scheme_len) {
 		pr_err("webusb: landingPage URL %d bytes too long for given URL scheme\n",
-			l - U8_MAX + WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH - bytes_to_strip);
+			l - U8_MAX + WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH - scheme_len);
 		return -EINVAL;
 	}
 
-- 
2.53.0

