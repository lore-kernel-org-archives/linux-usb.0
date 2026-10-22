Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652987;
	b=sQvFEZHcJTAMlTntviUJDOfkx76vfVKVkYjas7OgQJbpIJ2o6ggrpB2da7sIg0jWYbw1
	 iKHmEgj54cGexnQRuK7FNg8DAGV44OfBfgo0zf0XAzIRYKIhrXLiKJQ1H9ELSekroFvCH
	 uAdOYNotV2xxZ/0O0olmG5xfvmcIyIB4MpOhelwOm8rwqMqCdEElekruW4dv/CDcxAR/p
	 9Wz3ihTVXtNu0Qn5Ol3Y5Nj9xhMS7afSg2V7yv2mz88tLXMeF3vlTl3VG0unEE2sQXs8S
	 DMJPvn1JrQB7slF+DftQLKpXOgNVJ7z6IqYqjrd3G/KFfdMuaG8qItqaFi0j8rA/jZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MnlYdPOPJlOuiqma0L/KGA43PVF31d9BgFd4VINQMpI=;
	b=vXKMF5CRYRVazjxSFGaYokk9TgwmzJnAlPk60E874YIjX9+/BT4ezqqaXX8vSLOlckJJ
	 VLVUnr7Byv2sGLsbxKdyJsVK0UJZBkcabam8mVW8HX8DihtudJHWeSVf5AfSz+0IP26EL
	 ueGlHIqZ6SPxE5tjBg8EpC4sF9ELVMRpUBIxBv7nsA+u6yE5CYtW35FM9UlATO/BwIsQU
	 laa4YPY7+bmPD1Nz9uREo24daiqwDuMk9EkitE93tESC5jAFWP/ZKyJT730TGxIrj6KmT
	 RMlDqZStIZr0E8lLvujxY09O0fBAap6i/YKN38PFg8HivkVSgiVH7Jm3n3LD+QO6Gew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBF1Lipi;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AA8606A31D
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 07:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5AA8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBF1Lipi
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd66d7e32baso142680a12.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 00:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792652986; x=1793257786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnlYdPOPJlOuiqma0L/KGA43PVF31d9BgFd4VINQMpI=;
        b=FBF1LipimvlOXg4hcf0YrlXHky4zAxyQTFinP8CkurFD/jn6M+yJwf6tRtFBg6yqXw
         GK+bdxY6WZg5zL7A063h1/5kly2IfPqDaL2wa92lxQjXdB0hI2TkmLmjwHlzMim2oVGw
         s/VIKcLAXnYeR6Cr1sEXqZaDgow1ed6sRGg8c5pMr4D5joTBodOPesrPvhW2PzWYmrcR
         FJnfNSYGzRY5DNosRdZBwXilRX6mMukUcyW0IvZVdzt68lcmxTCLHwhJhz0aE5NcMViE
         vRH943rWPi4qlUkRqEeLU2OwKnQ07L1exEd0iDtK12SGnoHDkQu1HayJO3iAeMZW1Qc8
         BPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792652986; x=1793257786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MnlYdPOPJlOuiqma0L/KGA43PVF31d9BgFd4VINQMpI=;
        b=TO+oIwdqwOMvefZAY2o39pomzr1LFrfaKSOSTMx8Ac//pCMW5PDyR8FWIahg+WYcx0
         HrAstwAF6OaVj4jeLVvYSvtCHeWtp7d7ZK1hdGc680i2ll9iyg4sXV7pSZUYoZT/h3AW
         MievIPZsz/Dy03xgwHwtFBZkVqCXRauEZcAkkk5OSYOgz5DZC7CNFnQMn6vt2aMQBYFy
         98CPOWNt8QK0LToX7/Mfwmqw7NpiRtAGUqH0sEe12HJcxRqDL7n/mPWy+MdKbYoo3vRp
         B3+GdI0amQs2G3yFqTgX+L35Ol1WdowPAhe5xD1FUhrRFo8/+jrl9r63UUUlwyzvTdRg
         6Vog==
X-Forwarded-Encrypted: i=1; AKwUvByhSQK0taH/B+RSiasZJ7rBcMlWBNqJSRG8UqcYLHdt+KDp1SUbEzBEi5MHlMg1FDhUE0DywbOEup8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzlZZRStp9rAq/p1Rxrxyr29xXWdiT/bhJdppQDlMBG5aZGMLE
	5b8Yml7y8P2vaDeOCFznZWRub9lPOPQKn48hgcoB1YyxuTl7J8JByar6
X-Gm-Gg: AYBFou01dKEsnjVikKaB7vZnXXoEbqygs1DMTgjySaOk4P8xZLYWoBDfMxPzwZR5fXd
	fFkiFq8BkYceNgX278Wcd/VILaPIMeELloSOo5bt2cwz7shv2aKjTcY6GsKluXM04/CKMRhFrae
	VVHzXc4uu79JkWFux1XTNqLwATA+ETot3iCxN54Xsx6WJinpzkyGu7yC59Gt7EFIL/+bLP3qHuz
	hSa3XtzYkCdQjp9uNzSmPB4hbrVVvD1Us2VtmFrg9AvtY0JeShHKgTi30VWCinU0q92ygnrwjUs
	xaPD26oHO+vsogLfXAX8MrbpLNEsEPx3e6BXvFk1aooycjn0HLEQU0hDbsLJLoqSEs0qjPKI40W
	OVLHuRQigxIxcP6/OEv8JJ2PP+18jP3B2jwPlciKgSmgNqJcLvfABjpA3MrT7J5+3vOKYoannJr
	9PbNWR0lU851JqrGfz7sGhFzP7ZKj0w/G5f1SWDHtjGd03lSkKDqkRhKDKjIH5k2kKwjML+5sqv
	/Nqe5+KXOQ2aLE9tPbpDJn40K4jZpsH1R/rE10CrYJBBf9/kqL41Ra1tnu0CreRNVrdJQyB1Yg=
X-Received: by 2002:a05:6a00:a387:b0:882:94ab:20f6 with SMTP id d2e1a72fcca58-8a089c3eec3mr3115617b3a.1.1792652985830;
        Thu, 22 Oct 2026 00:09:45 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49d1sm1706039b3a.12.2026.10.22.00.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:09:45 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Alejandro Colomar <alx+linux-hardening@kernel.org>,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH v2 RESEND 1/6] USB: add usb_make_subpath() for formatted device subpaths
Date: Thu, 22 Oct 2026 15:09:24 +0800
Message-ID: <20261022070929.20820-2-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022070929.20820-1-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261022070929.20820-1-shlomojune6@gmail.com>
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

USB drivers often build device paths by calling usb_make_path() :and
then appending a subpath. Several callers use the deprecated strlcat()
API for this.

In preparation for removing the deprecated strlcat() API[1], add
usb_make_subpath() to format the USB device path.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 include/linux/usb.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 1da4ad1610bca..c90ccea0cdbf6 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -14,6 +14,7 @@
 #include <linux/errno.h>        /* for -ENODEV */
 #include <linux/delay.h>	/* for mdelay() */
 #include <linux/interrupt.h>	/* for in_interrupt() */
+#include <linux/stdarg.h>	/* for va_list */
 #include <linux/list.h>		/* for struct list_head */
 #include <linux/kref.h>		/* for struct kref */
 #include <linux/device.h>	/* for struct device */
@@ -987,6 +988,34 @@ static inline int usb_make_path(struct usb_device *dev, char *buf, size_t size)
 	return (actual >= (int)size) ? -1 : actual;
 }
 
+/**
+ * usb_make_subpath - returns a stable device path and formatted subpath
+ * @dev: the device whose path is being constructed
+ * @buf: where to put the string
+ * @size: how big is "buf"?
+ * @fmt: format string for the subpath, without the leading slash
+ * @...: arguments for @fmt
+ *
+ * Return: Length of the string (> 0) or negative if size was too small.
+ */
+static inline __printf(4, 5)
+int usb_make_subpath(struct usb_device *dev, char *buf, size_t size,
+		     const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+	int actual;
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+	actual = snprintf(buf, size, "usb-%s-%s/%pV", dev->bus->bus_name,
+			  dev->devpath, &vaf);
+	va_end(args);
+
+	return (actual >= (int)size) ? -1 : actual;
+}
+
 /*-------------------------------------------------------------------------*/
 
 #define USB_DEVICE_ID_MATCH_DEVICE \
-- 
2.43.0
