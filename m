Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795246395;
	b=Pg/XlHuARLdz7QQ4Sz2ktbbWpirMzn5wavj/rmk6Vlsks9m/2ee9pbDieb0zXVvryEkl
	 pVrDNcWh7ZES+yiaK0yScZOE9EQsrZt2CAAp6na31i9FlvjZ64C/nRVMo21CbM7DDaBR9
	 +zzu4dY642C22+OUCccNlQc/7aV+A5XkgDPhy8QsWmqayOPhvTOyVClnUJFztwSJIyKAa
	 wZUqjZ4sHWaVKgeev5dYe8e9frknjAkfJeVJxxcReHIIiyx6GxavJeNDi3xVd7q3n7Isk
	 l6ailAw13mnARl2YeLJRf25OwBRr1LB4rNyUwOsbFF7HLOykvqQU2Sn+s27zt45uA4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795246395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YBrHrJ+Fi6ULgqrmNdXQFkJ1MFe995vz1lrt+TAu8xU=;
	b=bcV7AvHVLagdsxpz0XGqNBc3mn4PZ1Kibo7wp1Y39WwYSaq6zX9iO1kTWBEmOkMfsoaK
	 aFSaLa79ycDNSR+Ug6Z0uXgOEsORl7FvzQOfxK8Yn4kid58KMmdwzXXLH8+6Trt0H4tTg
	 zRKcqmDs70qpWDAMxwlAsOONbyhTP/FseyeHTGl7Po03sk8gIUbPbQWBD+oGpaVpv4Z/c
	 q0epOJV8V3fvFtVlvz70Dun7DQgr64rjsG+eTNxgS5kKBN0b7rHx9j5Bc5Tz8SstXHoCw
	 V9UPRm+BqMkoBVzqvOazI7yLrIC0/lDrgKrhmlKyI+7UssA5J0+ArLInxcRg5nGjYhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g1KOuyd3;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBD5606A325
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 07:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FBD5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g1KOuyd3
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ee20b82356so1426265ad.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 23:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795246395; x=1795851195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YBrHrJ+Fi6ULgqrmNdXQFkJ1MFe995vz1lrt+TAu8xU=;
        b=g1KOuyd39DbO1oJZCtZQXHAn3r83eoHFvdLOFAI6r1gcMgxhNE2+lmbsNryPqUR5AW
         Kel2datY0J7UYUxZY6D4S6tgYPu6kSzulVufKRKEzqy7Tk/GmdNfulm7DdpnRd4QXKaY
         2sSmceBXbDZfpb0UXzrHiIzTPW7AfIyBRpeFN0EBAfM1Ibu3dkiXiPZprw4HeTNOzZUl
         GgBBCQMlbL4QE75HrX4LOp5N+YSwOlQcHm1pVcyidVVbBb/E2QLFlr8m6asAVNnJ4rA+
         BmnzbmNp9JuNHsHAixgL5JBO/4HvBljTLUIOZDagJBcDJAz9UHhz75/L6ZBBVaXg546a
         x0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795246395; x=1795851195;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBrHrJ+Fi6ULgqrmNdXQFkJ1MFe995vz1lrt+TAu8xU=;
        b=JB8T7pQxQgjqaTBguNqvDTq0XPrj1RG7o2Yy83ydaXS8hCpQpatbO30rLb6hb8gm77
         aE55JKvNrJnX99vyERJ6LpVLhSGRTISHNFoHhpsLkH/YGPll+MJHpIcmG0RhtLHLAWHn
         H7mlMsRSG28D6ExCT84O84jGVqLE1UulJ/EyT0gzaU8ojlgrW5xvHUNy6LOnZE5DLo/b
         WUda1FPjbTtznTU/bYeY0xCvgmi1wwFeoOzHDlcI6HTaj3L9wSW3NRsqggDr6bB9ZZ0w
         aQZwdC7X+n+iJ7ZZLb/Uv8X/nYoP05nF+oH7wsUV7Cp9mdko3KjiCdliEZR+zUHZMvp5
         rx9A==
X-Gm-Message-State: APuU4Z/Orl60VkjWxM2wvWvcaeJUf3SFMyJmWGFBnGAP67CYqVpu6xUg
	OM7Uq9fSZkITDsvwMKlqxrFH3EhyNcVuB7bAjV6FbQJtcwVR1yVWQmcX
X-Gm-Gg: AZFdTZdNN9nNRCUVysbm3XCOTisP66suCkroN9WPVi5WRnO9Olc1BSmj4qZqpRsEfcR
	Hw3o8ojxisz9HWcB0qGUBMPy+rOwTG/3ijhLTB+bxpfZhgDFOkrFBzac9x8jFy7PgE3rw0NxXMu
	9WaVEqPfgk/58e9VkenjgYRLXnCEGV6FwI+X2HFK/m8/pVDAVUnfI+BhCpq4BKfdQ5CmVNBHogJ
	GP7EFkQP9R6RvWu6au2Vf7rw9VIV6mOdhkZQd0bOWKZjwLf+pmDpHYkJ6+NsExkALvwjHgN8TEr
	N1ISQysY5I99H2Pb1nMpzbS6wnkjWYcmk2uVkXk7/WGWjjUBzUvkTrNXfvhgKIVY+SO17W0ca7O
	k+STXWdS3XTkNGEG1K1HpWQmE9rHHgN4ow7Z92AwRMN1qX/4vF8dz1RVxoXeRNADxshTb6K9lM4
	6BnkonXWvXiT+4tRdZquvcv/cIJwwyGrZ3PjbA8umtr83HTMQndWrLCPqbV08f2gEmscLMSYbK/
	LCPT6GZNKHRPXNUY5QEO4/J+X2SWD8PflAjslYdu4XkFAR0YKkX29CjRJSVFzrLymUYENBWmsfA
	7nl6YcIcgkdBJmtZqXSPBFnoIoLyl5lJUlu78KWdzmrzAGqxOIWThQ==
X-Received: by 2002:a17:90b:57c6:b0:3b4:e3e:642 with SMTP id 98e67ed59e1d1-3b41c579226mr8216561a91.0.1795246394913;
        Fri, 20 Nov 2026 23:33:14 -0800 (PST)
Received: from [10.232.20.87] ([101.90.31.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm10344021a91.16.2026.11.20.23.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:33:14 -0800 (PST)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, stable@vger.kernel.org
Subject: Re: [PATCH RESEND] usb: musb: fix double put of gadget device on setup failure
Date: Sat, 21 Nov 2026 15:33:10 +0800
Message-ID: <179524639094.16200.18023925953069130613@gmail.com>
In-Reply-To: <2026112011-dingy-onyx-4d4e@gregkh>
References: <179250629747.20696.17364135141613638741@gmail.com> <179419596286.2244.11782596409403661076@gmail.com> <2026112011-dingy-onyx-4d4e@gregkh>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

musb_gadget_setup() calls usb_add_gadget_udc() and, when that fails,
calls device_unregister(&musb->g.dev).  But usb_add_gadget_udc() already
releases the gadget on failure: usb_add_gadget_udc_release() calls
usb_put_gadget(), i.e. put_device(&gadget->dev), in its error path.

The device model documents the same rule in the kerneldoc of
device_register() (drivers/base/core.c):

    NOTE: _Never_ directly free @dev after calling this function, even
    if it returned an error! Always use put_device() to give up the
    reference initialized in this function instead.

The extra device_unregister() therefore runs device_del() on a device
that was never added (or was already deleted) and drops the reference a
second time, causing a refcount underflow.

Drop the redundant cleanup and just return the error; the UDC core has
already released the gadget.

This issue was found by manual code inspection.

Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>
---

Resending in full because the original submission fell out of the queue
during the merge window.  No changes from v1; Sashiko reviewed it and
reported no issues.

Link: https://lore.kernel.org/linux-usb/179250629747.20696.17364135141613638741@gmail.com/

 drivers/usb/musb/musb_gadget.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 016d3f3fc1e0..4bc4270088bc 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1794,13 +1794,9 @@ int musb_gadget_setup(struct musb *musb)
 
 	status = usb_add_gadget_udc(musb->controller, &musb->g);
 	if (status)
-		goto err;
+		return status;
 
 	return 0;
-err:
-	musb->g.dev.parent = NULL;
-	device_unregister(&musb->g.dev);
-	return status;
 }
 
 void musb_gadget_cleanup(struct musb *musb)
-- 
2.54.0.windows.1

