Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0433344C4F5
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785852317; cv=none; b=oAG4z0FjKwjtQ0+qoROXQMmfUSfH2XIpCnQH7IYQRFycG07oKVFfljdY/GHHROz89ZDck078+8EbK/cKob/gYjLq3ux9jIOm/pZEt26PR+sxlHlL/0ze+wwlANVQMxcRVo+wWT2q3liEJN9AYHTuKGedNJLeIywYqwN/IoFj4GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785852317; c=relaxed/simple;
	bh=d97IpNyJsYB5IVGgs4Li0wWu0NiI/7JE9bvfPe1TDcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dn1Gzfqr5S2olOmFxclWLy+O3KhLXk3IBVZfkoKj7KOgzbiSWyMfNniaxKNRKBOO4houVqbDHZlggGCnnh/vKwPzhUZToorM7af+RPNK2+KGEv7k77h4S1IwCq89BqL3WVC0fzZrmzDeZx2SVWRcFWTl7+8LriNJqSHJDkdsEE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jf6pF4kc; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jf6pF4kc"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so750121a12.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 07:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785852315; x=1786457115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=di7yb5nKkAVEK5laxIrEVUkFWbaRV9fl/4mdiWB8KDc=;
        b=Jf6pF4kcmxr0Y2UHFL2AhprTlMLaAhkMwtvnILk4rIrrweAQHjrFL7Lsqj/r3nURLf
         VZkQ1Iork3a2NF3dbAI5Akv1JP7dM84al8nlW7KDEzqWDX4FjQZA2b+mlHyffGWrmhLe
         u/H8svpyUGKo9McqVG7fMszLBz3b0UQxZV5dWVfP0jPaCHE6Usl1R/Cbpo85WtJRUeYj
         smAiipjvDvfJok0sAUbKqAWvd6tT+AlE//5DpqLpufiSQV5HO5uwFcfE/Ac56XZjihP3
         yyfv+SF+W1CG3J+rbxqBixDM+xwWrDBklguy52pPK1c2v9G23OVxhrebTXCSI/wQBXoL
         b9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785852315; x=1786457115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=di7yb5nKkAVEK5laxIrEVUkFWbaRV9fl/4mdiWB8KDc=;
        b=Bn09ttjN7vZxgKo6u0rYxtRX4gLDzAYKeI26POL3EbQyCf1AL0ZGHDcb2k+URMn6Sp
         s4LUd9cmLfGa6XCTSAUFeY62i/dfeZLgrPH7GpZ4Qd4Z++jnMGqkpY3CmiZx1b21JUH1
         fyoOiEIZ1GbFEonXBNdvMNG1T/dUg88vBqpFBO2Oi4nq39XZAOM/vUi3q8XF/XGx9YZJ
         ce5Uswn9hpWv/9k0Adz1SqbVFoO5iRLd7bYGZYo4AC56k0zJNhGMFTEROSpG+WXUXIcI
         QHyuGKqO4fAs87rdIoKWTEfiR/ULuzql92kdaS+5U/FLaRYVHdMnK5sly7/WyPe8lvYm
         3Vtw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4my19bfk6fS/yA1WvAWDtAXvIRK4A9Iyb6nyB64PnbNnhtUrG5p7V/7hEYPDgE1iEy22MTx+zLX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMSP3XsDZ6ft++bDGIr1AYqjWnPEs2sxc0FhNkhpHSgL0mJZt4
	qaXP5axyQPDkJbnoFPI1DN04fN78wMpv6/JURaCT5+pFRxGDo4SZI4ouN64p
X-Gm-Gg: AR+sD10pay8frpvHb9I39zC4wm4d0uTU0/HJU3HJjChhE76tLUEVKFGUjcxbJZnYeQC
	xrV8g8tawGNgmkIMSowrQ45FDJ2VhO98kOojfWDDzIdSR0e0m4rJSRX5n7jM1v5sq/3QnxVzd53
	jEdWf2QVlBNC/GWAcExIjb7DW8IqRU0aJeTiM1bwxdejQD8w0yS5NNrXEcdHnA1ZfOuD/tAnpxh
	0WEcjrocWo/IsInp4Pu07VuyPpySE8Xo+vtKeq77S0yqfxiakPeZvVMlw1+DDzlakQZ8toRS6jd
	5FqYK0BGVw1nI+Bk20UKtzDxoCpXA4IjRd9NX/7xbZbGr4c7VEDMIf6V+OLQXYkBWoHcQqZgcky
	At+HNpItAaQfBHzQKmsBJnqRkVw0Gzz/jhso6iwdsPP8TE+WnXLR1IsZ3hLrTB9jzxf1GbBrEBd
	b+Du9egWctK9F/82CJeRX5ESfWGkMXsLbweSZtKU0m63TJ83JUXITRpCLE27l1CD2W17OgDvf80
	ucM9xs0AB1KqRfGBePv6i/1YmbIvT7I+4rsmbw3avitmb4KbCF5h3O5y9CZHDm4DbfL1xpK7H6o
	yepwNUaFgVamefKb3JGEvSi+
X-Received: by 2002:a05:6a20:a11b:b0:3bf:ee42:192 with SMTP id adf61e73a8af0-3cb6c773de9mr3807571637.6.1785852315187;
        Tue, 04 Aug 2026 07:05:15 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3963daa7sm5097183a12.5.2026.08.04.07.05.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 07:05:14 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>,
	Raviteja Garimella <raviteja.garimella@broadcom.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: snps_udc_plat: clean up PHY on probe deferral
Date: Tue,  4 Aug 2026 23:05:10 +0900
Message-ID: <20260804140510.37639-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the referenced extcon device has not registered yet,
extcon_get_edev_by_phandle() returns -EPROBE_DEFER after the driver has
initialized and powered on the PHY. The direct return bypasses the common
cleanup path and leaves both operations unbalanced.

Store the lookup error first and route deferred probing through exit_phy,
while retaining the existing behavior of suppressing the error message for
deferral.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 1b9f35adb0ff ("usb: gadget: udc: Add Synopsys UDC Platform driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/gadget/udc/snps_udc_plat.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
index db842a6de643..0ee3ed185d9c 100644
--- a/drivers/usb/gadget/udc/snps_udc_plat.c
+++ b/drivers/usb/gadget/udc/snps_udc_plat.c
@@ -159,10 +159,9 @@ static int udc_plat_probe(struct platform_device *pdev)
 	if (of_property_present(dev->of_node, "extcon")) {
 		udc->edev = extcon_get_edev_by_phandle(dev, 0);
 		if (IS_ERR(udc->edev)) {
-			if (PTR_ERR(udc->edev) == -EPROBE_DEFER)
-				return -EPROBE_DEFER;
-			dev_err(dev, "Invalid or missing extcon\n");
 			ret = PTR_ERR(udc->edev);
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "Invalid or missing extcon\n");
 			goto exit_phy;
 		}
 
-- 
2.47.1

