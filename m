Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022833BED43
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778601939; cv=none; b=pKTjBx1t9uQFinPWcjxhwSa9ba9GnvhSlU2Ny3MLAuP2DY+Ger46kpuKPDLW6WmpVvgEEbBp46f2eqZYPnYq95WUVt//iZgFiz57pVFVlYS8LPLVnb2iyUoM7N55KjoursvZLOrwYc/mT7KZ+00yoDrPaq4kwvk9UoBimIOLTI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778601939; c=relaxed/simple;
	bh=oFLU835hnkQ0S4QHH8e6Y68/BW2CchKOk0YRBCmJeaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5X3zhbCz5YdNuJ+9PBP8Xb2ufZrbWnQ6j3yAJws+5V1LOtZBLnaB90CNknaIfUK4amhI5209OEKa8SI8Hn2XDCmknZfOs9dVO/MP7bza2jeeEGwdUko3yleguMYU1u9nXAIWwtjCgV83sfX7SyymU/kLzPQ0mEc7UPQw+ARId0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ewspg6dd; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ewspg6dd"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8b74b460d77so56606166d6.3
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 09:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778601937; x=1779206737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJVGtLX4Hm7QXav4cdi4atZzWJUm1596Y32TKWTpJs0=;
        b=Ewspg6ddG2mSZ878szVA3HbFaz6E0iH10Ob322vOq5fYfbHk+iC7zEwxS3JTL0nQoV
         IoxBo6W4LL0Jw5p6hMB+o+TNYGs6BlZpsNwG7MKWSEJWUXw8YIwQ38cNyQKFoo2AHcYy
         bD9XL6JRUK4+Dk0z8ef1rg2LKboV7LcLHFrKgee5da6oSy3mQBmE6PjCoCd1jbcQhdVt
         5R1eEEmVANEXJHfqZlvSD6Oh1loyNhwgWf12kP3mZKyKbFOXHGzzTgsflrbJAqa/XLHp
         20RO3qKe3NnXJaMb6xlbyh3LjggVyaUHLCOe73nz8gi8IIjXEtp11OrGDE6UNh6ZcoIW
         DprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601937; x=1779206737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pJVGtLX4Hm7QXav4cdi4atZzWJUm1596Y32TKWTpJs0=;
        b=ULBi9kcU9OFUBWGy6ELkYXIg2eodC01cGji0Kl3RIezH7xtG17pKOTFiDvBDolbStS
         CCHI7yn6cY8Z5toDvgLUAILH8LTPJN+Uw7ZR+S2+sqwQgv8i6IQJyXpW2KJy5DPoOhw0
         KPzvA1PRf/nKJSXryxQMAm0FGAlPFljotEBcTnHZEyr6IbE77pFFeCn3MQ1vpDe9l0DN
         1jZAiR7oD+DnhcaXG0b0dleY73I0gLUK7J1IlBqVsmwO9IWQhDh07P/AxOakgwUZc6Em
         BxLDT0gzSSTdoZTshPf4L6DTVShCE4oaDKcwNA6fCLRqncMF7Jol/1l7JrfVcXywDBk7
         SUjA==
X-Gm-Message-State: AOJu0YwhedQS4nPgQiuIksXOF2fMXOTjh/MHv9F5JyazromMOaJ+e17P
	uOOB8a9frs+QKLSX5DV5VS+TgtR7jHPY417BhuNY9kXSxMLJmlyWLy7O
X-Gm-Gg: Acq92OEML2zGrKkAIPxKbVdkdiyrFkCT3E4H/E5eyDq+ie+id5m65ZInwllMUNi8VeQ
	MoyNmfWXJWyS3orjCzCKMhHhXrqlUjIfIJTi3O35R+KC7zVJ3CZd1NlOKj58XMxQ8K1CwCOeSk7
	O9U8Xbfaz/fA0zpQuIlnPAra3LaE/wRu2cxJgYaeT/lgosNyaZHGjUIdK/nYEV/9BKwF42g1k0a
	ldWy5yLEiMhD7jXjjhDIcBha+JoI6iPol4gx6N+uyR6LPNS2jbf2A7uoc4CFTx3p/gEtjrIWsFi
	i4GZUpcZndyV3WlOAzemvLz1yq1siBgZr1gD63+Y/uxrwhYyyJuV75aDEho0MKY5uYoYw0sil6p
	VBUXY0Kfwp+1lWjQvczhaw5Zo0PgyJis7ZdroXnnwlbORS0KzSZ3Nm1RumlpfPJWjrowGTGc8s6
	jAM7z0K+/GAGUodk6LxbrKrdKOhS7+nYzyCSTHkx/l6asLcLqIOENH7PRQhxRWVK47+a9mjmQ0B
	me0p+ecjzU6p+0=
X-Received: by 2002:a05:622a:4d86:b0:50f:ba44:ce5f with SMTP id d75a77b69052e-514a0a69e31mr210098491cf.22.1778601936659;
        Tue, 12 May 2026 09:05:36 -0700 (PDT)
Received: from jeremy.kali (srv1619992.hstgr.cloud. [2a02:4780:75:55a3::1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148fa78723sm118135811cf.3.2026.05.12.09.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:05:36 -0700 (PDT)
From: Jeremy Erazo <mendozayt13@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: gadget: composite: fix integer underflow in WebUSB GET_URL handling
Date: Tue, 12 May 2026 16:05:30 +0000
Message-ID: <20260512160530.352318-1-mendozayt13@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026051227-concerned-geiger-b8a6@gregkh>
References: <2026051227-concerned-geiger-b8a6@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WebUSB GET_URL handler in composite_setup() narrows
landing_page_length to fit the host-supplied wLength using

	landing_page_length = w_length
		- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset;

If wLength is smaller than WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH the
unsigned subtraction wraps, and the subsequent

	memcpy(url_descriptor->URL,
	       cdev->landing_page + landing_page_offset,
	       landing_page_length - landing_page_offset);

ends up copying close to UINT_MAX bytes from cdev->landing_page into
cdev->req->buf.  KASAN reports a slab-out-of-bounds in composite_setup
on the kmalloc-2k gadget_info allocation, and FORTIFY_SOURCE traps the
memcpy as a 4294967293-byte field-spanning write into
url_descriptor->URL (size 252).

A USB host can reach this from a single SETUP packet against any
gadget that has webusb/use=1 and a landingPage configured.

Handle the small-wLength case before the math: when the host requested
fewer bytes than the URL descriptor header, only the header is
meaningful and no URL bytes need to be copied.  Setting
landing_page_length to landing_page_offset makes the existing memcpy a
no-op and leaves the descriptor returned to the host unchanged for all
larger wLength values.

Fixes: 93c473948c58 ("usb: gadget: add WebUSB landing page support")
Cc: stable@vger.kernel.org
Signed-off-by: Jeremy Erazo <mendozayt13@gmail.com>
---

Changes in v3:
- Add missing version-change notes below the --- separator.

Changes in v2:
- Drop the self Reported-by tag.
- Add Fixes tag.
- Cc stable.

 drivers/usb/gadget/composite.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index a902184bd..dc3664374 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2172,7 +2172,10 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 				sizeof(url_descriptor->URL)
 				- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset);
 
-			if (w_length < WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_length)
+			if (w_length < WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH)
+				landing_page_length = landing_page_offset;
+			else if (w_length <
+				 WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_length)
 				landing_page_length = w_length
 				- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset;
 
-- 
2.53.0

