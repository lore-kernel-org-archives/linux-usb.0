Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011736;
	b=j6A4VZNDsO2EO4fxo9g0EUYgFKY+4AN+tdSUVlDedMzio+C6lJNwfi0MzS8QXOMnz8AC
	 YRa6NlDwFWiSlWYETnEUA/H9PWQ7z4pJqlBaVd9IBpIDtJPPLsnytmSUmx/456kK/zoSa
	 ob/FllOsT16TyRayU+XZjAFf/M6bGK9rK+S9L0/L0NrNqRvlK08JqKkON57yjFKBsQlAK
	 VLAQ1k4W50/TCu/oIlTtXsZziyZbPBt5P6gbcE+XXbTfPiwFANwcewlinS81ekxmOU0Pf
	 9nQ86Z8ag8yY+BCctARBIoM4c2iHhw8WRO5RChunAD0QtZ5deGEe7HvHwWKDvO7pkZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011736;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6JkliyVUZAYe9DzLvLZYRlgILzNsCo2gyWXNuVXN4mg=;
	b=TXfUHUdtQUWhsOP2wmKBzDO04nPv2G44KiYhRDS1vStiTG1tdPHbJd3KimvWtvUs/dhF
	 5EnaVE5XKK9DDDdGMPZonlIHitPk86+sarqzlIWrHaeDWg31F/hUVPP2TXgohshEGiH6B
	 6UQ5m8Vzb68IvNeUtEgkXjuF1GjTqGOCEpLgvkBcVGF/0Q5uGGgO5cSPy4smElhV8ukIh
	 A+4rn4j6qKK4MheWi2lBsS9KrxxcrUA7jxBvpUTnsz/3w1ehzCd5tO9KtA4Lld7OdDv1v
	 DPwEyLNp2sczSA8OfORdc4x9KiJpwoXY5/SWNkVBSwxvxK6KNDxi4cbkYdHC8mW4OWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gakii2YF;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qQlPSc2R;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFF5606D829
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 00:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFF5606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gakii2YF;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qQlPSc2R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6JkliyVUZAYe9DzLvLZYRlgILzNsCo2gyWXNuVXN4mg=;
	b=gakii2YFYdexlK0HSmK/7BFXghbdNiandbWzV0151Rz6e62N6bT+kooH9SCVXyFg2LhGAK
	5owsehtVFDJAn2wdZyxCT8Ff7Tk8j0Nw8JuTJS2RYp7qmlB7gftqAQLViT+t1jHVwSShey
	Jolq9YSR3OqaHfsr5DtDEIyS2Vdvy6s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-WYElY2prNXy8mLLItzSdpA-1; Fri, 06 Nov 2026 19:35:33 -0500
X-MC-Unique: WYElY2prNXy8mLLItzSdpA-1
X-Mimecast-MFC-AGG-ID: WYElY2prNXy8mLLItzSdpA_1794011733
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c8a517107so33593096d6.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 16:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011733; x=1794616533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JkliyVUZAYe9DzLvLZYRlgILzNsCo2gyWXNuVXN4mg=;
        b=qQlPSc2RKQ3e/e2TUwYhEq/gMhe19IntxMyHZBUTaBot2FSqUnlvXMUTefbpM33ukd
         bsS0/OJ5hX5ktKYa2W8kwW1BAB++Y89PcMVKw6YaLyjAl3trl0dMurnf3hTVbvaw8TuO
         GwLjrCb58BMBuSmYrtb3cVA9H25TxOs5pnb3RyPbJj+DgRfqHTfAejcdro6wOLDqLbKu
         Tx8alqXvH5vir61gsi1nQgojycp3gOcXAkwB7uNBP2/0FA0SPuddf4qEWWhz8jSHNOLR
         Tt0U2fQkkobmWtbOIldo7FbkLrkN0THxYFmTVolAgUXCCnX8+SnHMP08Ds7ad0j06yNk
         T7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011733; x=1794616533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JkliyVUZAYe9DzLvLZYRlgILzNsCo2gyWXNuVXN4mg=;
        b=cvGfTJhYeLLUOJ7sj2dfIZkIezpul9gIxNjyZ1EjfLcMtglJ2PfIReYCUANacjVCU/
         JNfgfd0HkJmZNu9cbn/Sahve7NpOBfMbVV+UbydEqfykQ9htxFkEz16Zj1H0NXD9dt1z
         1gsswFpGJ9YWuO4ECF1eJb9YRVoIDjoxpoMAZn3F3APmSAX1g7aH1arFx7aLOvip11f0
         li+m/l0U4g9QRsHSrQuRr0/I6v1WmELhjp8TfYgXo6XgcygJ2ITNvdteI1boeT+G46W4
         0cDWmptZgKtSfkz2C41C9ufqBxckRw1t6ATGOK6E6Mtu0tM+uMyB6cAUEwJvWyMV/Pku
         AW2Q==
X-Gm-Message-State: APuU4Z8e394niPvwguBJ+JsyBj61mNbysT/You1sb8KGW8IQYdBuoLNr
	RzNT4z9RVTKclMHL835rUmTqjmegAQ8TKlFCl9HYAuhglSFqpx4Kl3CsxMCAMNpcITowqQ4U4gU
	Ew5Ww99g/AXOkjECXfC+4oVOL1iEAZN0u3bBXQnQwemq0I55WVZRwBbH3M+zEAw==
X-Gm-Gg: AYBFou2iBJ5Z9yTE6JHA5ezSqEOQkoAq+n3wOWollFiT2HY3Z5QWkOQ3R25EJFrJmqY
	Bqe7VnmZ12cGUngy+u9ClUjCdRD6Wp9aLcgBpVLpaFsKZ6VElstCM4sW3pWbfFH0FqbBGqX2a43
	2SDrxzT8WuzYpB6/9PI+yNoZIa16W0Zg2BZSZDu3z36aaQL6oOK44H1br1O+RO+CAHwf+PSt0CP
	ud0BqkJvrT3Ti8QHlXq9dVNt5d2GtVjU1TkFEX2GVQPkuDIvYeR26qjyOiHgJG1NCGXuz1HkYm1
	cDhu/0BX2HRqR550ZVUdO63tK2PeN2mtj3r6fKQfkp13I4nN3vb7O0jrTboPZTwX+GfJj/ucR0a
	id2oSc4w4LywkAHAdq4IDd8ku2dr64OJK3++Gq0HLjcwtdq+jb+y+ogIBiZoaMVLjGLEKv4Px6q
	XvcFi0bj1aOmKGoP5e
X-Received: by 2002:a05:6214:53c1:b0:915:e732:33b4 with SMTP id 6a1803df08f44-91ea96a68c5mr60340216d6.19.1794011733015;
        Fri, 06 Nov 2026 16:35:33 -0800 (PST)
X-Received: by 2002:a05:6214:53c1:b0:915:e732:33b4 with SMTP id 6a1803df08f44-91ea96a68c5mr60339856d6.19.1794011732410;
        Fri, 06 Nov 2026 16:35:32 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5c3sm32967686d6.12.2026.11.06.16.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:35:31 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:35:14 -0500
Subject: [PATCH 3/3] usb: phy: twl6030: convert to subsys_platform_driver()
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
Message-Id: <20261106-usb-subsys-v1-3-3a86369c3f86@redhat.com>
References: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
In-Reply-To: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=JhlI7VYFUCpnrlF0rhah6YE4TeE6fg139Kd9/dVb16A=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFXnUfphzrUSlYwuvWtaKKyeSd0QUPO5q23Ho1rTXP
 28ve5dp21HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEjPwZ/qet+Xv37pnydSf9
 WRyuqu43fcSv/j6p+9yxb5+WObCz+bkz/FMOm1214ePRHftj7gV2iHhuNjeQ1Jv2wHZuwprExiV
 lj1gB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/usb/phy/phy-twl6030-usb.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index 8c09db750bfd..5b71aa95b779 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -439,17 +439,7 @@ static struct platform_driver twl6030_usb_driver = {
 	},
 };
 
-static int __init twl6030_usb_init(void)
-{
-	return platform_driver_register(&twl6030_usb_driver);
-}
-subsys_initcall(twl6030_usb_init);
-
-static void __exit twl6030_usb_exit(void)
-{
-	platform_driver_unregister(&twl6030_usb_driver);
-}
-module_exit(twl6030_usb_exit);
+subsys_platform_driver(twl6030_usb_driver);
 
 MODULE_ALIAS("platform:twl6030_usb");
 MODULE_AUTHOR("Hema HK <hemahk@ti.com>");

-- 
2.56.0

