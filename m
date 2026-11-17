Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919698;
	b=par/3N2jBqbP6DpktM4nYNNV5SJAHs1h2Nc35tSqtDagd78OXkuvkPw7s59tCR5zovru
	 x2u0O4rJBN/gIwi7qIleY6TuH+A4W4RfrgmSaPMU3TwXtZHisp+gG6ql0UGZIDKuBqoHm
	 VxCUowqfGIz0n4TodsJhD24Ui6WBSSuJHivC0QbWf0ejBhwafwSdit610N9vVJJSlYTqP
	 creRH5xQbQogx8vdwiA0J2WZACbxrNgvIHL/BSVxluzpyBOXjJhjCkgw3iFS17DVcyl2v
	 n3QzQRBDzJ33RUkv5iiYnvcUcxkTQZr5qBFGns+s9SczfwFIfP8RrhBC7J6wk/jumvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=2UZ4KDs27ccMSIJ05qxi98qMn453KRwTQ3SPpAtEY/Q=;
	b=FrCC0qFaNmvH858z43aa1anNpBb4XHC/VzKxi1iFTdW0Mk8sdM5ItHWSZPjF2qEL97JF
	 J2Z9A5EuJlu+0Cyd7TiyIUIBDtn5wwEZAkn9SWd3dVTbwPX3VU3Ric7M0+H4L3RgSm2nD
	 Rvb5wz74VGI92z1zJy4AcsCSTnCXqOubAcwMJDw/6rumSUWqDdSjgyfny/jetWR3jmIE0
	 vTeNidNUl08fHAnA/hvbAQsK0kcLEJJi4jp0kuTnGMTYdYUTbkakFBt7JPGYhtwm4FDY1
	 D7qJr/SYV43vC6p2dlx63Lkp+5pjOs0f408WEeM69NoIITjd6/ZnYZ308sxaWSnkSpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BvEtF63N;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4026606A898
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4026606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BvEtF63N
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so687415f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 04:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794919696; x=1795524496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UZ4KDs27ccMSIJ05qxi98qMn453KRwTQ3SPpAtEY/Q=;
        b=BvEtF63N5fmFZW/Le7YGJ2Wf6gX52ILIGV3jphIVCOJrKptLFhQJPhFoaimdJotho8
         SiT5Lq/DLcr8c8SyqyTlqxA0W/8CCbeg1eXRvInDR/H4DHjQ4rI87RxPlJLZTXHuvHJa
         b0ZZsLwP2eog+8LdjhUMxEvUVn7QSxw1GNk94w6uGHVnxdWrk//Kgwueg4kTigKHOaw3
         XlSriOotJWHlImnSoDMr1uY45mUpvmSdpk+6L9xAgWmGIQbSHjOQ/VGF9cbz5l0hJWNU
         zQKFvM0TqsJw9cAZSlISutzIC1QnvLKVF06M44l8XXH8K9dWkquv7yVValkJoW28DU08
         5lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919696; x=1795524496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UZ4KDs27ccMSIJ05qxi98qMn453KRwTQ3SPpAtEY/Q=;
        b=oP69W/uQ6WwcoQ1heNlEJMHcq+6upDy+XktwEy0WQ5pii7vXF11lF0OWLjtaXm+kXe
         yh1GFRhvSnunEOx2eIecQUW4vHVFIcb5ESBV21nOchNSxSWRWNt/8onowVd7PvSDx2jw
         ouX5h3xp9Is5EXYjMuuCMEbvx6ayVBY11bso0+hcPjW9RpuvQVLTWvfgg/dkp3qFq/jy
         UNKR4SNGS4lan33dgEczzf64dGb9gL8pcwF3rY8AvWjyX4TGzYLsyJkv61x0NWh0XbT7
         dq5v4tnMbqp3QzqBDvua2BB5S1jqXNWTUVvMNGa3miKNafvh+Jm33jwIerlfqfLFN8vW
         JF8A==
X-Gm-Message-State: APuU4Z+6JJSEeuzA1lovCvTKn0cXSpJyal0F7Nmuwwy7R/v1BG92jAan
	KAb4RU4dueB3BZym4GoOXhqSJYnZ2PSSpL2j4a8kmCjA2S1hsOFunc57T2OBwqxcUcI=
X-Gm-Gg: AYBFou04DgJG0t5PQ4hcpdBsayjkoq4NzIHkDRIy8Zh6wfyhUMGqd92SynybFYkHMdN
	gEzq2VYe9k4OARvKGWIJKUOmPeF0CIcZRk6UAF7af8IVsIgXW8IssXMdyBp0fBh5DNCUi7TKkL3
	xG1kQ+X3emohB4NAPgoyxrWtNJZZOzhVGFwJi63/9O1TEpI0hl2sdODXuAmsq9zqdQQL2mEj/xA
	uQDeMd7WR0JL54dUE8SuoBd+/CKRmC7TNrO3jy87ILXAbquY5989/044WyWqZcP8BF6Wakw5ESi
	EpHCTrhtFITMISlCm9UBA5PndO6TMoBI/lwBYbFX7GtqC5Bzx/dh3Z+Fcjq8Kgvn0Baox5FFp0q
	HvFUWjfI4fG/WhL6+4VDa+3VPXA/MN/DUIDhh03STulIrmgT2dP+FlL8/xB2Vg8fT3vm+QNMx+R
	8a8sw/txlUTQtY5NjleC4dZfB7Pmy1oK077+/Cv7kqFlkauJtL3nu1w5WX+uOlzMCnqSTAgaXXj
	A4zcLlRVUbvJScFra47KTb9QXpHlsn34wlOz/CWzo0Zgu3sP8RmcMKjoWq/v88dka04RHp6vhaP
	2pSOydtW5oJF7wH3KmXQ3V6iy3QSciSZ6I62YbedNDQlUIoSA0+PLgBFe2EaMitX3L8A6Ld0sYL
	u1l83fjhqLdDx1fV2HOYrHKtvfrcZhPk=
X-Received: by 2002:a05:600c:6089:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb76d9f83amr77248575e9.34.1794919696039;
        Tue, 17 Nov 2026 04:48:16 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5f350d51sm124029135e9.4.2026.11.17.04.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:48:15 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 16:48:07 +0400
Subject: [PATCH v3 1/3] usb: gadget: udc: Clear a pending connection when
 starting the UDC
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-udc-connect-v3-1-9413b491d213@flipper.net>
References: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
In-Reply-To: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044; i=alchark@flipper.net;
 h=from:subject:message-id; bh=52B6NtpvqPp1v/6zvOd5T1p3lDIt9y6MOcV/446fH1E=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT98eWOuhAQefuhmuGtvc8j9ZcGMP6VFWwW5Ml1PBxSH
 JB8RUaqYyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKn+vZ/hf2H4Q/cbe7ndb+meuRmbfsV7GhNr50r+tg8Z+wt3afWW8TIyvHj+4c2
 shFiL3y3bbhr9jlJMf9BYlPZBNvK2zk4lrqi3DAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Since commit 62911bc82b03 ("usb: gadget: udc: skip pullup() if already
connected"), usb_gadget_connect_locked() returns early when
gadget->connected is set. A connection requested while the UDC is
stopped sets that flag too, without enabling the pullup. A later
gadget_bind_driver() or soft_connect "connect" then finds it set and
never enables the pullup, so the host doesn't see the gadget until it is
unbound and bound again.

This happens whenever a UDC driver reports VBUS through
usb_udc_vbus_handler() while no gadget driver is bound, e.g. when a
Type-C port controller switches the controller to the device role at
boot, seconds before userspace binds a configfs gadget.

The pullup is never enabled while the UDC is stopped, so clear
gadget->connected once it starts. The bind connects according to the
VBUS state that the core tracks anyway, and a function that deactivates
the gadget during bind still has the connection recorded for
usb_gadget_activate().

Fixes: 62911bc82b03 ("usb: gadget: udc: skip pullup() if already connected")
Cc: stable@vger.kernel.org
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/gadget/udc/core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index d5844384c368..577bc15f61a1 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1236,8 +1236,16 @@ static inline int usb_gadget_udc_start_locked(struct usb_udc *udc)
 	}
 
 	ret = udc->gadget->ops->udc_start(udc->gadget, udc->driver);
-	if (!ret)
+	if (!ret) {
 		udc->started = true;
+		/*
+		 * The pullup is never enabled while the UDC is stopped, so any
+		 * connection recorded meanwhile was only a request. Forget it,
+		 * so that the next usb_gadget_connect_locked() enables the
+		 * pullup rather than returning early.
+		 */
+		udc->gadget->connected = false;
+	}
 
 	return ret;
 }

-- 
2.56.0

