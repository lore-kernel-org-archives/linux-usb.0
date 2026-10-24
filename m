Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792821121;
	b=dGUnFEdTq8AIfIYtzcgDqSth8A9eUv60DM1IUOSAjOzNYtWrPgsCf71i5cW8UygCnWJq
	 ByrMYmxwDUSTE0AJpsmaAQp94AFBPseNLZMPALLDZUvx/zWaQHRlSorcnow81RvFZIazM
	 Tol4QzaneTow5BBGUIR/M6/2CdnV974itdwWVSxyDyJnmKpDjKz8McDnYHP8PfEWxtDx7
	 o/Lzzzx4YKL1biw2yhqZwC+dpLmM8p5J9PS2awCLcExWyeiLDSSyYvl3aCoMzmRSDfeMz
	 GLeb4K/YP6zxqcKO1+myMx/LxsW9vtAq0yprYpbQcDyfrHPeIh9T9ALV9vcF0LJf22g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792821121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Jlpo7fIcByTBeMoPijrvjPiifrT7FNSteMRpBZdk4xs=;
	b=3Dd0fqs7IkTNN9tI9eAguzldltE3xDG9Bwd91NKZCKn3BkBaNW0U8pSwSEZrA1QEJU9w
	 1zOgOcjpsSS7+qsnIdL5qODfwN/QZev2LU4UAZxwWHIPVjfcvYBfcsWM6nqX4dVn3FYnL
	 /3Kp1gnVaqkQUpI93uSHJ2oJhlpDsXsx1LIYGC0wjogdgJ0Ga3udLKhFxlKLATBvqMRWg
	 V4oYYMQ4D2oBeAnzNPRAheEE0jIAldkm21FCO0FNUfrH7ziXlR/YJ7xeZShppQ2SokXi3
	 oWbGLcBRFgtpl3P4jkepdMoNdRt6orwHj7XPChc4qU5xcQDD8H3D3R012SwmEIQ4h2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hkwChsJm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48193606A31B
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 05:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48193606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hkwChsJm
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso2035370a12.3
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 22:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792821119; cv=none;
        d=google.com; s=arc-20260327;
        b=o/PTNNomZllLV7ohfwOLvKZXf12DOf1VT1CmWwW/HH2aC6l5Un6+MKeRJ0b+R2idzN
         4dbtXpedaYq2k16oXoPcdsezqfITATl5tLWy1kCGvfmXxeIKNYVV1l5XLckH6IhEz3Rs
         4j8RtRlxx4WSrMD6sWCIEWUt/rOFqO/iqx3TA0HVwTfm6YKSt4S8MfrQsgeCowo2kPv8
         gblHHZG9xVoEIf43z7Sa30PftOwXuEmKLsa+qp2O5FDL5RE0y2PROf7Ly1SHYmw8Zr9k
         JiQljSEkFjqv2MvUSN+RcXvfg+awY/qfu8JCzpViwF/XSE10M1viBVc3TFNcx3owpd9N
         Z2BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Jlpo7fIcByTBeMoPijrvjPiifrT7FNSteMRpBZdk4xs=;
        fh=GN4KCDVfJUbwD8dvGAq3soDeMUoAJ/WeZ76LTnydx2Y=;
        b=XBO0EcjrWnRZPSdDXEetvrl+rYSsqTo2/b1h9QDXCNkT2ee/uyJAtbtrQ8Y3DyhhQg
         DO+LG2bYYohLks+jLDezzSEusC/zFK5DBsFenZ3tLZvlBc+WsYdZqrPpVk0aeaz3R6yV
         Sun7aRBylmvviS6YUkdRoavIZu9kjW20/HyUXPiFxfxu8Npb1h/brckbj4nZSJMnkWUB
         +zWETvcM4GQM4atM9Svq2M2U7t5vom/lQDQmS5IfeH6GNuBdeOxD1kmGC/7KRQqffhny
         tY509N+48n1OPLu3M0/xK/if4aHRzguq7H1K7tfJeHu0n2EBYuwAYb7wlDt+QYoFJUBC
         OYPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792821119; x=1793425919; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jlpo7fIcByTBeMoPijrvjPiifrT7FNSteMRpBZdk4xs=;
        b=hkwChsJme7QNNH3tI3Fn3WXS/b/Cb1okFbuJGRBy+gWkbKI2D9SJVisKv6upNvjw38
         cfjtsaNP4sbWCV1og3e0OBcGXzeBbVOYVGxGFWA3eaVm5RHYFY8X7vgjJ2GSI+8Z/wo8
         nltNHiXpc31jkjw9kWA8NQJdJXf353M93Kod5PT2lyFca+ilkNIsoZaWQmRPhx4lhlvt
         VOTRxA/8bRubllssJD6iO80kki4GcUUn+I7AvMpY2wA47VoIGhUIPV5qjqZ5QwkBrE9c
         AjAZJBi0m+xWRHgzlHD5CzfWKBvRYuGcSDWktlGP1fycJdGWW9itIBhjOIFXMVs0/+ha
         AsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792821119; x=1793425919;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jlpo7fIcByTBeMoPijrvjPiifrT7FNSteMRpBZdk4xs=;
        b=FqSatStnyrcmOxbFtdaBjOxwMttp5B9w1z/BIVwkEom9x0EpL/reSL5SUQHOVaHbq5
         r+hwstzu6U1IaSo6PVfBx4MNPBfqTUhIyqwdnqgAlENEQqoulo0e3KgRJNeij6Iwu+Dg
         7Elei2muG5ZUp/KJllPWtpka93xD7zY8OFVD0ZdaX6B7K7pu3XRsmNPJ7SgYaAY0plgP
         VFoD6OnhMuFxyUWfCZQM/x+YnaqLhBmNIHgKVHk+X88/T+qIr77VJV8e2dYUGrYnU9Ij
         dTt7hlh1tvwNEkYeF8bfY+8MsRr7cEMbKEb0wQKzVE7QJe5q/uFHh9piizD8XTY1cm2G
         H7Kw==
X-Gm-Message-State: AFq9FYI9JjbXEzPAwWKOH6leJMEY6xaJXv2sAh6SXukUlBfJn5D8pYfP
	zRA9GkqpUZ5GfgGNRjKNa6uVU88sBW6eFtEfCByf4dTNZbyPcVP/823H4Lvl0IVSdtt/AqOGhZ7
	f106eqgxEjKUFXz9yARrBex7EfvQDFEdBvlD6gfUR/uE6RfVbMw==
X-Gm-Gg: AYBFou07fhMdgx8+34CPR0PWqe/mcT+vq2GwtawanP6bOmb7G5nyRuvBun/pG9LxqJ2
	Oc1zn4GusYtLBH4l5YIF579bRckortqZS2A7I5oF5DkfH4ZWMhHNOM0EfKSP2q4ngCpxMtZsPds
	m89gTRG2yWlWGv2S22CC52mPX+hcGyKImMoq4jdW6No5ZamF0CHCwfVzYFLruAb5aLO+jl8paU1
	gNB1nqA9ESUkfK2CJsdkzo3VNtJ7hp5G89wv7d+aNO1beqvoAkuIluSbyIHw+JWxH034TmV2rRP
	VKWJmVfPRLagW2AU8LOT20AXWOVUJKnrYdwKNzKv0DV9RKzaaBbL0XeQuwXtxKsJn9Ciz65OI09
	A+3fCJ0ZTEqjD0AxIeVXJj9ejLoaYiy14xX0B5gLYIfX0L2BC0gmxwVHZ2nPl/s1Y4U92EEu7iZ
	EMe30WP7+zQvIQseRUegncItdUnKjyuQt/KQ==
X-Received: by 2002:a05:6402:42c9:b0:6b4:201f:17e3 with SMTP id
 4fb4d7f45d1cf-6b442fd51b4mr1581114a12.16.1792821119296; Fri, 23 Oct 2026
 22:51:59 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Elliot Alderson <hackerowskiy@gmail.com>
Date: Sat, 24 Oct 2026 15:51:46 +1000
X-Gm-Features: AclHuK9YJjm5GNixWxM7scDTrYw4REFQPygYXTy9slYfpoiG72e8KjMFOVfyw1o
Message-ID: <CAG2k5NBDNqksjd+FUHXAcC-pHwadLzwobr45pTXuATqQ7shyPQ@mail.gmail.com>
Subject: [PATCH] usb: gadget: printer: clear current RX request on unbind
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+ffc483dc87891d3c107b@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

printer_func_unbind() frees current_rx_req but leaves the pointer in
printer_dev. A later unbind can then pass the stale pointer to
printer_req_free() again. Clear the saved request and its associated read
state before freeing it.

Fixes: b185f01a9ab7 ("usb: gadget: printer: factor out f_printer")
Reported-by: syzbot+ffc483dc87891d3c107b@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=ffc483dc87891d3c107b
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/usb/gadget/function/f_printer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c
b/drivers/usb/gadget/function/f_printer.c
index 1857d786110..11471bd065c 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1462,8 +1462,11 @@ static void printer_func_unbind(struct
usb_configuration *c,
         printer_req_free(dev->in_ep, req);
     }

-    if (dev->current_rx_req != NULL)
-        printer_req_free(dev->out_ep, dev->current_rx_req);
+    req = dev->current_rx_req;
+    dev->current_rx_req = NULL;
+    dev->current_rx_bytes = 0;
+    dev->current_rx_buf = NULL;
+    printer_req_free(dev->out_ep, req);

     while (!list_empty(&dev->rx_reqs)) {
         req = container_of(dev->rx_reqs.next,
-- 
2.55.0
