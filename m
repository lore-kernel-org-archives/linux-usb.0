Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A6B471CFC
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190925; cv=none; b=LN5pQoK9hPm02MtxgUuMcXPklPTnj8Y1IjjBHWHuL/03ZNtQzNA+Hm0POtlp9AXN3CwbMToUeNP03payUzmI+03D+TvagYoVffjkfNnfTFtfBdL4dwxio9OJPVzW7et81RZo2QIy3Dif2oP5a59gy5qJBknqvxNiEBKsEjf+MK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190925; c=relaxed/simple;
	bh=VH8QZ7cKZhiK44QMVjMrGW5MytTxffMIdFgoMOpFUJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRuZcTLfbGuZ11U/iIJwEI8SS3+6/lEYGPUx9IzRDjzs/IL5k62sN3JeInXybHqCAISkwd40uIg8PvHVjhNd7me+GRt6MTb5E0Bvrq8IUP2pVQ6DogpnaDeuloO3m7kT1vi+ygRKuMttvEvTIdIzlZnaKSPfOrX23pGJgm7U6PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Ga4lGr9I; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Ga4lGr9I"
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5929C3FBDC
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788190921;
	bh=1GfGefQ9EUED0C8C1WTtZnhklJ50/jiUaV3tIS7bBow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Ga4lGr9IFlt+vLCQ/Lm4CqAV6RUjdx+FvJKvphha472o2p5ALfZkwboYvobG1cUDv
	 z3yr9nX91kgurJ5VfRelcnh81vL4ucoqdUKhKcnocRWbvyxzFEcS8gWZfmFHAwud7i
	 Pfm+59hroNYH3kmfU118mFKJG5c9EbTSNFQlQz3XjEP7CapxHh+/rqcT4mgYbMM2st
	 WpYFAwHsfgkejlt2wiUesTjWp8pMG95LuTyCfAtk90uW8XZH3mQ/TSKgE3/G8XWumn
	 75AiYUvaZ+ptJwJjnhiHAiFl5m+hmn7lnxGEvJ/R1ciE6EYzkvfF9xj9fwP7GNYpdB
	 lvsG4pAsTvwWO+dOhPJiIyh8j/6wZVjgvmeBwdHPg+J6I4rOWO3wCzmXo6zXLH8Vhs
	 yLOiEJSBgsCjXdeEmSJGC/jjxkb9WwTr4OaO8NoZrjbiEs+IuvlsY2oSJ5IieSCAYy
	 tO8qRjY1CnQYKlu9JpApXKkKmzGIBSsbYaitArStQ9FUuNSrSXIlTOMRNCFRHdeLls
	 aTGx7kr81Dy8QJF0YaqCo9xbpozPRpXhS0JfFVJBz4lhCWhZeqvt+VsH9DwM+vM5Zn
	 T0liKnEq//KE1Gl2+ei0KxJV3f/FpYoCBTj2ZzIwUZitDgRerVHmVQeDGdgXy5toOa
	 Tmwk8hK13xSBvYZF9AAX0LsQ=
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso4968644a91.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 08:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190920; x=1788795720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1GfGefQ9EUED0C8C1WTtZnhklJ50/jiUaV3tIS7bBow=;
        b=Iwgf6U1/n/S3FBs5EIb5D/Zq9hlyq38veuAXX74B/YnE/RIhba8IeJO9pnKRuwdEKc
         Um3h0b4jhGSPY8WHTQiKu8yGwHjiBf/wTc3C7SilhWqcI6eh0an2/t0HR4eau0Y0IUpF
         NWzxwuRrXxfW4vZi8KdfYYMJZNu/89ax4UCvmTzo9U1EZyOZQHZHGO1XtpTm0veWfWAb
         f+h58EevB5qU2hKD5kOsNdQr5q1e0S3/4viMSLPGFadWXqtq01nrY9Np3BIH9yGQJ860
         dyQPmrG5undckoIieIqn0n0yhIkXXOWGnDycxL+MTY/CBHX6nfsBgoRfACJW87SAvRCp
         GIzg==
X-Gm-Message-State: AFuF++lw9qwPVZusNgc9zVIF30UEnmYeM+tuTiaz8oK/SDXFNfvDo+Ni
	Tnn65TqoZ/3EbPzmzdstmjmnrq7Dwd3K3eGfUg2C6XjbG2mNodaIZLYa60//fAkopwaDSK12cnZ
	qV4TbG6N04yZhlb6+9xAXAY/X28GejbmSnJPH2zZqOwD/Pi7hCtwLufCXUycDtO+VN34M4Z2Uck
	g5nZuuvUFucQ==
X-Gm-Gg: AYBFou3Rg57m7x53TCNZHqlVuJ3KDtxI6Ose35kd4B8adlZyjpYt9YilZOmhWaftaVw
	hM5+OyRrxcAG6M/rGiInXOvRbzF6FURxFCQ+p1Bx16tsf0LJqkJpCwxtjmlN4vEai+IAHM8XPuh
	Sqp8rf0YAZFkq/F42wmdsr7ny9BLtia9djTTARWKYIrUiBo4YAuewLcUBIVhyVN8uc13EIAiyf/
	y0i02NiCp6MgDOnvT6yZh56Mcp/hQoo12qRnhhxc/YqYAfMRpMDhsD8e/7pvTALsSV4Xp8cuwIG
	zKPAtLCJSYczsiPQtgeY8iA6/ZIreC2cXxqnWWqtKkyMSJJINhyczgrKncIdTLzDVnpuJstAAr3
	uJWYv/scIM3srZNNyGxGS+qG/Eg9FYucKnZoC2Ib9k4qGVB7XvRobcA==
X-Received: by 2002:a17:90b:4c0b:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-3989c0c7ffemr25989483a91.25.1788190918875;
        Mon, 31 Aug 2026 08:41:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0b:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-3989c0c7ffemr25989439a91.25.1788190918432;
        Mon, 31 Aug 2026 08:41:58 -0700 (PDT)
Received: from resolute-linux.lxd (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d62b807sm36228a91.16.2026.08.31.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:41:57 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>,
	=?UTF-8?q?J=C3=B3=20=C3=81gila=20Bitsch?= <jgilab@gmail.com>
Subject: [PATCH v1 2/3] usb: gadget: composite: fix WebUSB URL descriptor length handling
Date: Mon, 31 Aug 2026 15:39:38 +0000
Message-ID: <20260831154139.55811-3-aristo.chen@canonical.com>
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

The bound passed to strnlen() subtracts the descriptor header twice:

	landing_page_length = strnlen(cdev->landing_page,
		sizeof(url_descriptor->URL)
		- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset);

URL[] is already declared as U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH
bytes, so it does not include the header, and subtracting the header
again leaves room for three bytes fewer than the descriptor can carry.

That is normally masked by the w_length handling below it, which folds
the host's requested length into the URL length:

	landing_page_length = w_length
		- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset;

Doing so conflates three separate quantities, namely how much URL there
is, how large the descriptor is, and how many bytes the host asked for.
It gets all three wrong:

 - the emitted URL length becomes w_length - header, bounded by the
   request rather than by sizeof(url_descriptor->URL), so a host asking
   for w_length between 256 and 259 has up to 256 bytes copied into the
   252 byte URL[] and bLength, a u8, wraps to 0 or 3.  cdev->req->buf is
   USB_COMP_EP0_BUFSIZ bytes, so nothing outside the request buffer is
   touched, but the descriptor is malformed.

 - bLength ends up describing the transfer instead of the descriptor.
   WebUSB defines it as the size of the descriptor, so a full length
   landing page requested with w_length 4 must still report bLength 255
   while transferring four bytes; instead it reports 4.

 - for w_length below WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH the reply is
   the three byte header, which is more than the host's data stage.

Compute the URL length once, bounded only by sizeof(url_descriptor->URL),
build the descriptor from it, and shorten the reply alone with
min_t(u16, w_length, ...) the way the rest of composite_setup() already
does.  A 260 byte "https://" landing page is now emitted as 252 URL
bytes with bLength 255, and short requests are answered with a correctly
sized descriptor truncated to what was asked for.

Fixes: 93c473948c58 ("usb: gadget: add WebUSB landing page support")
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
 drivers/usb/gadget/composite.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index df39e3487c1f..6c8e15faee6a 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2151,7 +2151,7 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 		    w_index == WEBUSB_GET_URL &&
 		    w_value == WEBUSB_LANDING_PAGE_PRESENT &&
 		    ctrl->bRequest == cdev->b_webusb_vendor_code) {
-			unsigned int	landing_page_length;
+			unsigned int	url_length;
 			unsigned int	landing_page_offset;
 			struct webusb_url_descriptor *url_descriptor =
 					(struct webusb_url_descriptor *)cdev->req->buf;
@@ -2169,24 +2169,27 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 				url_descriptor->bScheme = WEBUSB_URL_SCHEME_NONE;
 			}
 
-			landing_page_length = strnlen(cdev->landing_page,
-				sizeof(url_descriptor->URL)
-				- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset);
-
-			if (w_length < WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH)
-				landing_page_length = landing_page_offset;
-			else if (w_length <
-				 WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_length)
-				landing_page_length = w_length
-				- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset;
+			/*
+			 * The scheme prefix is encoded in bScheme and is not
+			 * emitted, so URL[] bounds what is left of the URL.
+			 */
+			url_length = strnlen(cdev->landing_page,
+					     sizeof(cdev->landing_page));
+			url_length -= landing_page_offset;
+			if (url_length > sizeof(url_descriptor->URL))
+				url_length = sizeof(url_descriptor->URL);
 
 			memcpy(url_descriptor->URL,
 				cdev->landing_page + landing_page_offset,
-				landing_page_length - landing_page_offset);
-			url_descriptor->bLength = landing_page_length
-				- landing_page_offset + WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH;
+				url_length);
+			url_descriptor->bLength = url_length
+				+ WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH;
 
-			value = url_descriptor->bLength;
+			/*
+			 * bLength describes the descriptor, not the transfer,
+			 * so only the reply is shortened to what was asked for.
+			 */
+			value = min_t(u16, w_length, url_descriptor->bLength);
 
 			goto check_value;
 		}
-- 
2.53.0

