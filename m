Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511534AFE15
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190927; cv=none; b=iofZjdZ0nnjrMIASoxjltKSSROeljpA7HDiFfZAHVErBPcLrBHmgCIK1X4L99J7R6txufGu1Ms/1fX5j/eKM6bbDE+0wq48r2I6H5ThZB7vtry8pP9Yxugpo7fUkXX6DApuBPnKefm0HUnCGOJE1iWXA9gPGTbp/V0sBS/NRKK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190927; c=relaxed/simple;
	bh=WJIWy9fh/l8ZmjHfklKBecjb67wZEtuuUHbj9jkfuKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFiRAYcLaJQA/UAFWSwPuFFR0Qvn9YwWAH2L/mJSDO9eeGWHrnt+gXXJUIgCeUAl5wmeFRcYNn2Xav5g4mBdNXTPT9GvtMQxEphE9pRMNgfp6mD9gmgw5iwDZePyTne+dUVH0m3PWxvOdF3Mib34lAqBOAOmaDKzlkhPOcYzEgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=ZVy5T+d0; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="ZVy5T+d0"
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E7CD63F610
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788190917;
	bh=L6aw7f06zAC83jbztYhI5HbGQwyw/GeoofB5v9d9v8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=ZVy5T+d0LE2PBvILCX9FiHvsrPqIhbHzTTlgUxrxSQAipP+zc5x+8mKbGivgkOgGj
	 EkdHZkdjl2SdRq6cuW6kUIA3OjKtdx97ejrku0PHxoZIhyYqgCV8ZlXizotPLvI/ye
	 kyovg1dwhILpRNHeuYMgzBrM0kBTHCTnO+abUHRrSB5nFwFh5mRvEmWCsnDMzJ8N2z
	 PK/kQHAeUHZ2yplDKnwk+BgsiQwWdgAD26054hFNfNe0r2kWM//clpWC9R2ndiagWO
	 5S5ajw8A/Bj1ZEkgwgLRyVUrSmicWd6wunXe0UAF/t4+w4KVnwToBJFXRuPcWjJB1g
	 REvHTCxdjwqzx1ygpX6YFrzY4Js/ByeR6BtktukIE7/81tCJ14knYYPjpxCdGSrOuL
	 wYWP0hOsxjwryeHodoUcXs4KDJj4DaxXureKZJTKwJ1pW/8n4ivdvXs5NvX9xgWtY5
	 iY91dAdI1a3VwTx6iuYPUzJmuEZ8m5MGnBsk1Tu+YGZQOyLdQsSAXWLW5IuSN9BVzN
	 YrF7dvpoeoYiJypuozX6EgFn522XzKoV7CmlCqJyVMLyI+Rj8f3Jljmw8zbTngW6l1
	 iLx8SugtGE71rU9S2tNdJT8fp3mJM35tShmQbGPmQvkzGXAAUPj3r/qrtzIX4OYVad
	 IR4NdjFkt9XQZwJtdOhbbM/w=
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so1874500a91.0
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 08:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190916; x=1788795716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L6aw7f06zAC83jbztYhI5HbGQwyw/GeoofB5v9d9v8Y=;
        b=ZgySsd+84z4Lp8IvRDgYiDJg5IZo7jK/GP16s3HrdzxqPnOP4dmJ4Pczl+mtW8Xa5z
         ZUlBv8Lj9CkU25yAEpKO+PbFWDk4NtGBTZT2YrMHC85RrhHEE0dRsZhOzuOsbpkG2fzC
         8IFV5TdK5HBzRtSQBsZQga4yahgZLxkNL7ACgKI44Tw7a7qPvzbOgrzXaSaJYbI/ziju
         0wyMynVs3MdvM/1cdOTihP9POdWeOg15ReBRWsyhNxsHWb3l7OuX6L+brbepjk06IIp1
         dqHKvWgaYeVTCzPjfuIZZOt+5/Pjq5XunT/EE52LtMQImlbHWVhAfT7LCIc0b5k/+vWm
         5QxQ==
X-Gm-Message-State: AFuF++lCz9pd3lan8QIC7xlex8bzAkIE+pZ9/6Zr8OqoE4i2nvuzhK3Z
	ZqwG5TOM2gMK2YWEtGD5VSuiW15Up/jk2m/Ia5TkfcJyHkWcd1I6r9lxELJVLhiUQ6sOQEzoHNQ
	a3JYOjlDVjeGncVSdDknZJjdTzcJ5pg8hfs2N/syTGxjk6hAGO9ZUfCrfEZ0BuX+bfgBuSdk+82
	UNyw==
X-Gm-Gg: AYBFou25WEef+5HaZh1f8tAc5Kly9swD+4qMgsB/419w/eaW4p+z+6aekHmuuYDIxDG
	1wHWBvysBzJRHFEINBdAYrpHK42qAblub7HqLd2c1EsEtJaJLn1QiAvddtn9ofq7HFgfm1pcfL9
	f4wOZsXEj9O9RrkD/ouXXd1NjM766/YqpIy88wHI5jfPXhRd5wKo/c74CkT4frP034jagK36qK5
	a84hNcfMqA++3+2VLxIf+/KXt4YkYt8UD6Pu/CF/TbMQXbenCqF0to40Z7E06HKA+xTvJrBKlKU
	lmnc4aP/FI+xqVRAjN9utZ//y/2bK91s6ePpCXvAHaJSjuNTi4bKNn4gqULPM1sP3QeYaByis18
	cb6X8WU4/WGmqGShs8qRzTdrZUuiJtuoDRXVL1e2y67gJAwyaYgx+0w==
X-Received: by 2002:a17:90b:2f0f:b0:380:540:d499 with SMTP id 98e67ed59e1d1-396d0ed0023mr43261757a91.6.1788190916148;
        Mon, 31 Aug 2026 08:41:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0f:b0:380:540:d499 with SMTP id 98e67ed59e1d1-396d0ed0023mr43261680a91.6.1788190915629;
        Mon, 31 Aug 2026 08:41:55 -0700 (PDT)
Received: from resolute-linux.lxd (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d62b807sm36228a91.16.2026.08.31.08.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:41:53 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>,
	=?UTF-8?q?J=C3=B3=20=C3=81gila=20Bitsch?= <jgilab@gmail.com>
Subject: [PATCH v1 1/3] usb: gadget: configfs: fix WebUSB landing page missing NUL terminator
Date: Mon, 31 Aug 2026 15:39:37 +0000
Message-ID: <20260831154139.55811-2-aristo.chen@canonical.com>
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

landing_page is sized WEBUSB_URL_RAW_MAX_LENGTH, which is exactly the
length of the longest URL that can be represented in a WebUSB URL
descriptor (U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + 8 == 260),
leaving no room for a NUL terminator.

webusb_landingPage_store() bounds the URL with

	if (l > sizeof(gi->landing_page))

so l == 260 is accepted, and for a "https://" URL the second bound
allows 260 as well.  memcpy_and_pad() degenerates to a plain memcpy()
when dest_len == count, so nothing terminates the string:

	printf '%s' "https://$(printf 'A%.0s' $(seq 252))" > webusb/landingPage

configfs runs store() once per write(), so the 260 bytes have to reach
it in a single write to hit the case.

webusb_landingPage_show() then does sysfs_emit(page, "%s\n", ...), which
reads past the end of the array.  What follows landing_page is the
padding in front of the spinlock member, three bytes of it in the
layout here, and kzalloc() left that padding zero, so the read stops
there and the attribute happens to return exactly the bytes that were
written.  The over-read is harmless today only by accident of the
layout: the terminator is never written, and nothing keeps a new member
or a different configuration from putting live data where the zeroed
padding currently sits.

A 260 byte URL is legitimate: after stripping "https://" it yields a
252 byte URL descriptor payload, or bLength == U8_MAX exactly.  So
rather than rejecting it, give the buffers room for the terminator and
keep WEBUSB_URL_RAW_MAX_LENGTH as what its name says, a maximum URL
length.  The explicit bound in webusb_landingPage_store() now uses that
macro instead of sizeof(), since the buffer is deliberately one byte
larger than the longest URL it may hold.

Fixes: 93c473948c58 ("usb: gadget: add WebUSB landing page support")
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
 drivers/usb/gadget/configfs.c | 6 +++---
 include/linux/usb/composite.h | 2 +-
 include/linux/usb/webusb.h    | 5 ++++-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 51df6d1d1487..4bc95f4b6670 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -55,7 +55,7 @@ struct gadget_info {
 	bool use_webusb;
 	u16 bcd_webusb_version;
 	u8 b_webusb_vendor_code;
-	char landing_page[WEBUSB_URL_RAW_MAX_LENGTH];
+	char landing_page[WEBUSB_URL_RAW_MAX_LENGTH + 1];
 
 	spinlock_t spinlock;
 	bool unbind;
@@ -1072,7 +1072,7 @@ static ssize_t webusb_landingPage_store(struct config_item *item, const char *pa
 		++bytes_to_strip;
 	}
 
-	if (l > sizeof(gi->landing_page)) {
+	if (l > WEBUSB_URL_RAW_MAX_LENGTH) {
 		pr_err("webusb: landingPage URL too long\n");
 		return -EINVAL;
 	}
@@ -1742,7 +1742,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 		cdev->use_webusb = true;
 		cdev->bcd_webusb_version = gi->bcd_webusb_version;
 		cdev->b_webusb_vendor_code = gi->b_webusb_vendor_code;
-		memcpy(cdev->landing_page, gi->landing_page, WEBUSB_URL_RAW_MAX_LENGTH);
+		memcpy(cdev->landing_page, gi->landing_page, sizeof(cdev->landing_page));
 	}
 
 	if (gi->use_os_desc) {
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index c18041fafa52..0621a6a5cc57 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -472,7 +472,7 @@ struct usb_composite_dev {
 	/* WebUSB */
 	u16				bcd_webusb_version;
 	u8				b_webusb_vendor_code;
-	char				landing_page[WEBUSB_URL_RAW_MAX_LENGTH];
+	char				landing_page[WEBUSB_URL_RAW_MAX_LENGTH + 1];
 	unsigned int			use_webusb:1;
 
 	/* private: */
diff --git a/include/linux/usb/webusb.h b/include/linux/usb/webusb.h
index fe43020b4a48..a3febe726911 100644
--- a/include/linux/usb/webusb.h
+++ b/include/linux/usb/webusb.h
@@ -68,12 +68,15 @@ struct webusb_url_descriptor {
 } __packed;
 
 /*
- * Buffer size to hold the longest URL that can be in an URL descriptor
+ * Length of the longest URL that can be in an URL descriptor
  *
  * The descriptor can be U8_MAX  bytes long.
  * WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH bytes are used for a header.
  * Since the longest prefix that might be stripped is "https://", we may accommodate an additional
  * 8 bytes.
+ *
+ * Note that this is a string length and not a buffer size: a buffer holding such
+ * a URL needs one more byte for the NUL terminator.
  */
 #define WEBUSB_URL_RAW_MAX_LENGTH (U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + 8)
 
-- 
2.53.0

