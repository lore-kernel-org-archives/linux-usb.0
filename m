Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0A11DA62E
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 03:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787370380; cv=none; b=qlDD5k222coxGOUIFphOHqTDYwJXjGsSsZNtBwoox3X3SFndO5zlM/LE+rd+ofmmv9eJVppth0KyYBCOakFhG4F2qK4M1Mpmi5oNxT01Hrbg17DRCAB2100bXuzT75AeP/ER5SY8Lgd/HFGVmB0JdUZ+CDhinoXeh2zDSUefLKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787370380; c=relaxed/simple;
	bh=z+TAOGYOtcu12SbF1K+K3yYGj291CeN7wZLybOW+9FI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rCCG33RKVP+uaTdJwiOOT8ugJVaOAkl82pkD8elQ9kWRK+vdniu4S8GRgwGkyqQ/VmmMtmbSBV0DhQMfEeRiWFBji8YP3vFaeSM0I6rYWimVa3ssCIGO6SmEJmkiwMbzsyYwSA9+NUVWVovQJWcNfU2UZYXXCKLPiN3qGetmU9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llL0dia1; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llL0dia1"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7eb29ed2bbdso1192959a34.2
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 20:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787370378; x=1787975178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vstGHMul09KvLuSLJGGZQ3AA3r1UZzwZL60ziR6ObN0=;
        b=llL0dia1hrGXkzdE83GfGbMLohVkcZUqOxMA6T6ezXIPebyR/fnRxH9Ch6cyxUP7TL
         xF2KIEgbZW2mPJ6AsFbEEKYQV/VpxKDuzDxyFlo+Erc8yzUNvcbFZeEItmuQ37tUK7+H
         5773WL65FoBtxzypTmLqvt34MXxGwkl2frdAyVdDPKlvc/meoPIUxMlQPIBaWFzPZ2E7
         3GXS0PIGlWoihs5x1PGqI73R930D8NgN+yB0WIE4iMM+uVK5xU69+ALBFrSCZX/HiJ6W
         Qzmj+h9b18afa0FoUqHFD22vgKkfw9I6k+vvgsHB8FR4a0vC0Qu0ajr9fDEhQb7Dl5CX
         Gljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787370378; x=1787975178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vstGHMul09KvLuSLJGGZQ3AA3r1UZzwZL60ziR6ObN0=;
        b=Fu6Zh2YJr3PtZBCRb5zSezpB2WIkME/qNnfPgoNPxhiPaadEyOBiRaFFE/nxDOICC0
         B0kIB3BQ+ZzheVKrVbkfcl8yPvze/xEVQ3K3HXvMScJhTq4pxSyeP2ZJFxCf4jMEoDkt
         E8I9+wcEnVLK9OazA50smZGUUJzKhig5k6WEKaqOAEuISj0Vte1aMdGhCdOaf4JQPNJa
         CDhi6V420AAp/dzxT++567cXQ9c2SIyAIgfvC3rRRrchteMbTRKcLbtTLwBsEdFpHsrN
         u8gmIWRzBsH9aJ9RjW2rQB6zEVeTVrZM9d6IDIWx94PYA/YNiW//Is5rc46VdaVBHYXM
         dG5Q==
X-Gm-Message-State: AFuF++nPfM8dWVNBn+IqhjVve/qG2/CRguDvHysdz5GrR+cibLjAuA5B
	wGxl8wg7S45gV47Ke2zcizP/+dbFMVUjzpyeKbYCT8ZqB0BAt43+dIEt+tau2jgtIkk=
X-Gm-Gg: AR+sD11+VDYR2eXKbyjHm4PdNBSTpXypX4wvsPRLVXs1RrUxraPODSmRCohVWe3yDGr
	/vTSGxLm1YyPgVA03R6m4xYAYxKLwQgd93njdKnKBVdg2mx/S+CPEmmsQW66vJEadNbNeqNwNUp
	oe5LITZPj4AoQ42VW0JrxKjgKAdvOR8P2Cw0NJzik1CweCaMzXLmxhPz+A6vvYKW/PpbWQGzRCG
	tLm5PJsINpVMlKc8o//h87y6TV0rF6dP9Wg87ZbZJy4Ai9MTxunWvGLDTYr1qtZo/jgfv8fqu0z
	ZDZu+CVereXwkMnuFPXBh5SyEDxBq+ckUeMSFag4/CSVHW4qM7AzOek++fg5wYMKFa2dDz+hkmH
	nV3ZS8zs6Zi2VVA/gJKwD5ZIFmpsOq+ArbnzfpcspjBbEmV1OTKV5Xge+4mapHV04vo6lfCDCln
	qfCRmHXS1tdxgs8t1Q0K3KgNzUnULexSazwrcOPTQCu+7I3hPerkAoeJ1QrHLnHZg05pBoc552h
	BsFtf6BL+Qkwc0R4MzFW+aEBkgCLONLOtyKLRDafFFL9upF0Ck+
X-Received: by 2002:a05:6a00:bb91:b0:84e:2382:f4f0 with SMTP id d2e1a72fcca58-851f9a4b169mr18015621b3a.4.1787363079384;
        Fri, 21 Aug 2026 18:44:39 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f03b250sm158740b3a.34.2026.08.21.18.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 18:44:39 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>,
	syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: loopback: fix memory leak on bind failure
Date: Sat, 22 Aug 2026 09:44:27 +0800
Message-ID: <20260822014427.2476530-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

loopback_bind() assigns descriptors via usb_assign_descriptors() but the
function has no unbind callback, so when configfs_composite_bind() fails
after usb_add_function() succeeds (for example when
usb_gadget_check_config() fails), purge_configs_funcs() only calls the
unbind callback and the descriptors are never freed.

Add an unbind callback that calls usb_free_all_descriptors(), matching
the pattern used by other functions such as f_acm, so the descriptors
are released when the function is unbound.

Reported-by: syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=28cf08dec5895bd562e6
Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/usb/gadget/function/f_loopback.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/function/f_loopback.c b/drivers/usb/gadget/function/f_loopback.c
index d2d07fb49..bf4038cfc 100644
--- a/drivers/usb/gadget/function/f_loopback.c
+++ b/drivers/usb/gadget/function/f_loopback.c
@@ -216,6 +216,11 @@ static int loopback_bind(struct usb_configuration *c, struct usb_function *f)
 	return 0;
 }
 
+static void loopback_unbind(struct usb_configuration *c, struct usb_function *f)
+{
+	usb_free_all_descriptors(f);
+}
+
 static void lb_free_func(struct usb_function *f)
 {
 	struct f_lb_opts *opts;
@@ -442,6 +447,7 @@ static struct usb_function *loopback_alloc(struct usb_function_instance *fi)
 
 	loop->function.name = "loopback";
 	loop->function.bind = loopback_bind;
+	loop->function.unbind = loopback_unbind;
 	loop->function.set_alt = loopback_set_alt;
 	loop->function.disable = loopback_disable;
 	loop->function.strings = loopback_strings;
-- 
2.43.0

