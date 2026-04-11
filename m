Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58AA199EAD
	for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 18:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775930485; cv=none; b=XBVJZ8YDo3BZAo8xqzTVifYvAnxqUVyVTQ+n9GDdDQVLiDrRvGAnx6YMcJTsXx/S/mZioI7JBYv7t9h5qj0kfwWvbJ5LdaY5hird/FRGgY/i/E93TTphrz12fOnCRnp+evFK8X1pi7+j6oZFlw1qD1Ub7S3EKNDwb+HcGnRWOmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775930485; c=relaxed/simple;
	bh=EvV02ZmvM+JA8M92n2q7fmCz94u6Aj+qLtTgXdzpdY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f5byQYKJXJ7hr/JXUhnV7kpiNBT4+aUEzNQL0zUKsiBy1c/nbvCcI7c6GrWxH43GdK1+SEgY0QvoM+9axrabku8QSCY1u1ma+3fV94VvvYpq6+GAqHNd4JBzPbTElCPGS8MbiBTkvOoU7B1ds4YkxSs0v0h0Hj2evjs/7ZbuC1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+8GiEJO; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+8GiEJO"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c65c87f73e3so110555a12.0
        for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 11:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775930484; x=1776535284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9yp2kH/NJKvXgSMeVoXYBn72yJ116yN3z9leX/3Fuk=;
        b=I+8GiEJOzH21HiJa2uLpghcU2pvkX86F300fGJ6+ERqE/xdPY21fxujHUanGndmQuq
         QsDDjPa8mFi0Bj0c1ys8HCm4Z/foH2r4uo3E+v0wyoTDrodmKwQzj0gIG7EAqbEzeThC
         XyI0ix6vUGmWnFAm2HcXyfF+T8jyI1nkmp5Y5cjebxyKlkj7HRnfCgNceJ/j7Ul0R1wt
         VMz91zovCU7SbuceCYUe62PnsnTtHFV4CVGt8kO+0EXhs1ytXbstABynqXwdnItahWmy
         a5165djyiLyPU4nsbhB+73gpUH1OO38AdNWNKSGVCwRosIYE+ptVDqyAUUjC4oSSKxs5
         rTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775930484; x=1776535284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B9yp2kH/NJKvXgSMeVoXYBn72yJ116yN3z9leX/3Fuk=;
        b=GYqxr7B/zqCYwHPk8LNxkovTqIOIS5VdTfS0apQSB9E+4hAlbCI8lJqLOp3F/Mn9n0
         06vcNwMk4SdXpnRMyAVLS6A1PnncLHG/P0zG7Hm29uF0e6rDj5kmOWcwQ2nHkDcVa8dC
         RPSQqXYhiEgRnMgtD21e8957xzLNuQjxNoPwjR1k6/DWZgD5koDasJcJ59S+suHOk7M6
         ORaSxZwQ8lpmbJLvN8l1QryaFuphya+BA/IIiEAXalEH61mkQK3wmXGyBi/akKzuB2BL
         8pXNjQa284l1I0Ku9WgJyj2g1pGYEx867LLmjkmzIj0EJon1FlWQNxriaKYVOvdgLJBE
         myjg==
X-Gm-Message-State: AOJu0YxUpbZi1b/ma/K9kEJV04SluG4zzH59qpMq+t1dpyflyI+zKCSl
	IlmX1klxvqHrrQJ0U11NuoOMnQjG68a8YMYlVktM0oHzPMqR3N387xbEHpKKMXax
X-Gm-Gg: AeBDievvLa/Dr+xVKg9OQOjtMFyQio+Oj3tDFNikDYJuIf4FOagyMM9VkVlOyfU2Bx6
	zQILIL7cUP1IuceXBB9XeyOqF8iiUFE0CEAAbcrNo5xnPvEsBYCEC5NI5Qkn4f6FtjsYuHEki4F
	t8p628avtF1vCkOtiHLc31OGA9p1Nff6JjrhAEkxqAe2WpIp2EFMD5mi2fV/ARgQG13CJnrz/vM
	wvITyKuD2m0B/xHW31DrZgNK1+yIzEa6BIjnMa6W5CdVb/SFmKSkfH9V/FBc0t/hLMxYLZ6d++N
	Q+j3nnGsNE28tF4Qkd7/vPupS28Rp4Bt6czJFWi8kgU+v2AeeV+XivaWatzpVK3nPH8U0CSMu9+
	0uCNd1GK32/AEAmB4YYqRTogPQ4kiqCuIGvPprVt9XSGeqmusx2ed5eQY0FXmj2ckZCx+9PVo8Z
	ywO8PwpoRWPS+3sMZ9tXOVKjqPTAdG
X-Received: by 2002:a17:90b:1dc6:b0:35c:30a8:31a with SMTP id 98e67ed59e1d1-35e4245a4e8mr4738542a91.0.1775930483734;
        Sat, 11 Apr 2026 11:01:23 -0700 (PDT)
Received: from kali ([2402:e280:3d7c:a2:536a:b505:93f5:9d5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e581537afsm925311a91.10.2026.04.11.11.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:01:23 -0700 (PDT)
From: Pavitra Jha <jhapavitra98@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavitra Jha <jhapavitra98@gmail.com>
Subject: [PATCH] usb: gadget: udc: max3420: validate endpoint index before array access
Date: Sat, 11 Apr 2026 14:00:12 -0400
Message-ID: <20260411180012.830193-1-jhapavitra98@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CALFbBidSiJTD2zdczQ1_mxv8Xm9Pqspnz8LDppHp2hudkLSoxw@mail.gmail.com>
References: <CALFbBidSiJTD2zdczQ1_mxv8Xm9Pqspnz8LDppHp2hudkLSoxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB SETUP packets originate from an external USB host and must be
treated as untrusted input.

The endpoint index is derived from wIndex masked with
USB_ENDPOINT_NUMBER_MASK, producing values in the range 0-15. However,
udc->ep[] contains only MAX3420_MAX_EPS (4) entries.

Using this unvalidated value as an array index allows out-of-bounds
read and write access to memory beyond the ep[] array when wIndex >= 4.

Add bounds checks in max3420_getstatus() and
max3420_set_clear_feature() before using the derived index.

Cc: stable@vger.kernel.org
Reported-by: Pavitra Jha <jhapavitra98@gmail.com>
Signed-off-by: Pavitra Jha <jhapavitra98@gmail.com>
---
 drivers/usb/gadget/udc/max3420_udc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/udc/max3420_udc.c
index 11fd61cba..070893723 100644
--- a/drivers/usb/gadget/udc/max3420_udc.c
+++ b/drivers/usb/gadget/udc/max3420_udc.c
@@ -548,7 +548,10 @@ static void max3420_getstatus(struct max3420_udc *udc)
 			goto stall;
 		break;
 	case USB_RECIP_ENDPOINT:
-		ep = &udc->ep[udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK];
+		id = udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;
+		if (id >= MAX3420_MAX_EPS)
+			goto stall;
+		ep = &udc->ep[id];
 		if (udc->setup.wIndex & USB_DIR_IN) {
 			if (!ep->ep_usb.caps.dir_in)
 				goto stall;
@@ -596,6 +599,8 @@ static void max3420_set_clear_feature(struct max3420_udc *udc)
 			break;
 
 		id = udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;
+		if (id >= MAX3420_MAX_EPS)
+			goto stall;
 		ep = &udc->ep[id];
 
 		spin_lock_irqsave(&ep->lock, flags);
-- 
2.53.0

