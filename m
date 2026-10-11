Received: from mail-yx2-f8.google.com (mail-yx2-f8.google.com [74.125.224.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B491371D15
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 03:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791690718; cv=none; b=AOGN3S96YCePw0UnoCMpAaZVBeeOOt1j6gLrMkxOaEZX0H7oP8mJ+px3NAGnOzlhWc+O6SY8KW1hjipLZzY56t/rnHdLnXDIt43vRPsRJoQq3259mxtMQ9bvuX2rleVDssEonQn/Fd+0G0uIQrb6pvlJYnWp7Gm3LJNJtTnfu6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791690718; c=relaxed/simple;
	bh=rsYl2evSxKIO+SY5ef5tx8ssbRNTBeYHiGZ0B0zC0F8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z5ZNBaMTUwRkhhBXfLRFEGBmD5N6w+ktECbXkBZlRGnCuL34GnBcQNGvb72SzvPSJbihKRYNGHtGa6f/tzs6M9z86gnAcBVxiZ0euC0yfDNPXpnH3g4lKH01fRdNJ/2lPKmSvwP9Ps67UabMlYZyYEpEwD7Lvz8yz1/xX7cyt2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGOGWf/K; arc=none smtp.client-ip=74.125.224.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGOGWf/K"
Received: by mail-yx2-f8.google.com with SMTP id 00721157ae682-8949fcc5ea0so2997287b3.0
        for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 20:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791690716; x=1792295516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AuaSUooYMWjiVC3in8ithjctEvqzUlOvqy+QwP+9O/Q=;
        b=YGOGWf/K2syJkwyB/x8MUt0E2WuH/vILIJDu2edKk3jNkx09BmMFCDE8IY8VSjdwAx
         HN67J+7ECq/VIRc76YuM4BwY8q/oN6bW8nCV1obMsK38R2xj2OapbrcERtkganxCCOCi
         P2snNmjjlzKwBFtN9CBX+bx4VhO7pnpbfbHriqHIWrhrON3uLIqAo66BvQDY66ni4P9c
         X6S8e8pwGlHhmq6XijfVgN5Ev/nhd+PgcJg9AYzBLcv1ITOV4YtheVxi1AG9VV2GfRaK
         3hCVtS/3FVCeUxDq58SpKkGpYF4xn83UG97P6PFkrVHQRN7prtCz/2RyYchS66wf9xxr
         6EGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791690716; x=1792295516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AuaSUooYMWjiVC3in8ithjctEvqzUlOvqy+QwP+9O/Q=;
        b=X1C0iCkhhMFpEvy8Snerdvdpihtc+b8bzoYm0YBR/WGRMZbmdFalOzd1EIrrkGORHm
         FitNtghSk8WBk8dI57RLMYHeeOA55DuYRoj1crFC/j0rtW/TCIOHQpprvCT2OP5rb0gm
         0PqyuxiN4wpI6fXMZLbA06Z8EqHcpb+zFCriXsyeacoUm/rFTFpaU2P+6tyTkdLkuiD1
         ZcsyCEK3UXKyMme5s71S1SkYwy/N7lFGzpkxVkYXtChg58RiHsu8DyGihUUWNzSjuGU0
         HeknGCci4Kl/r6HpyMg+05EMK9kopdpaa9Wlt3w1GD7zH0UL8liGBGOopKJEWPSQZR3A
         5xEg==
X-Gm-Message-State: AFq9FYKA2yc+1iuAAqqASfeJ4ACSXzbrir4ysVwU3R8GJk3qWmm3P9fM
	Z53kppx7gA9B8YS+OdrdsUym4xfSmAASz5ggDo4V1oxMl8NI6TPKPqOq
X-Gm-Gg: AYBFou0klJjD5mN8+xn5Sl8JtpOVrrSMYTXgWEL01CeghtSTfvygeXvyKycwWhWfBvC
	08wB2whK4GkKRcUuiHac2IiSjY+xxJEv5CP4KSxxabJ5FY9o+70jZHyFv4CSbd3DcXvv+KHNkjd
	VEIpj6M/F01wbsAj4ePt3G8rfQng0aM6IktuLYsZ0l+WZSZFSuyDxQO5IzZu3uBUqgVcE1pM16S
	BbTtaU7+pcUYOqx5BT74vYTA8lOmDrnmJh9gcneAboKnhsZ8456vgyb7bbSANukP696OwKAEZRc
	6iaFGqN8k6JQBZSFNKuwPnMNe4NAcXD+wLh9CRBVBDtKAKawDEfLTbPOLqvpEOVdsU2FpJl9VDI
	OccaRq3R1SO3I0IAJn1OoR+IkRWY0QvVHwE4gqClUkwK0bAVievl5zxQ/b7ACcxdlApqAg2MgnO
	eaaFBf7WxO6itIlacVtfnNkTfK23lBFozGBqQ4A39osN7iPtQfINqLLNmusGrzR7F4DWZUs4DNl
	eIch6ZHw3vFZlxkY8xek1UPh8k3XFpOsyEwOx72T5Uf4EOQjUk=
X-Received: by 2002:a05:690c:c045:b0:8ac:36da:c494 with SMTP id 00721157ae682-8b07ed14cebmr16160647b3.38.1791690715908;
        Sat, 10 Oct 2026 20:51:55 -0700 (PDT)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:68ae:b2c8:bae:dcc6])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f226b50sm22161307b3.28.2026.10.10.20.51.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 20:51:54 -0700 (PDT)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	oliver@neukum.org,
	giuseppe@southpole.se
Subject: [PATCH net v2] net: usb: cdc_ncm: reject short GET_NTB_PARAMETERS responses
Date: Sat, 10 Oct 2026 23:51:50 -0400
Message-ID: <20261011035150.53315-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbnet_read_cmd() returns the actual transfer length, but cdc_ncm_init()
only checks for negative errors when reading the NTB parameters. A short
response therefore leaves the missing bytes zero-filled, and
initialization continues with parameters that were not supplied by the
device.

CDC NCM 1.1, section 7.2.1, Table 7-3 defines a 28-byte NTB
parameter structure. Require GET_NTB_PARAMETERS to return the
complete structure before continuing initialization.

Return -EIO for short responses, including zero-length responses, and
preserve negative errors from usbnet_read_cmd(). This ensures that a
zero-byte response cannot be reported as successful initialization when
rejecting an incomplete response.

The issue is theoretical and was found by manual inspection of
usbnet_read_cmd() callers with LLM assistance.

Fixes: 36c35416a94f ("cdc_ncm: fix endianness problem.")
Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
Changes in v2:
- Return -EIO for short responses, including zero-length responses,
  while preserving negative errors from usbnet_read_cmd().
- Add the missing Fixes tag.
- Changes of description in the commit message.

v1: https://lore.kernel.org/netdev/20261005041525.49111-1-xinsheng.zhu.ny@gmail.com/

 drivers/net/usb/cdc_ncm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 35db38cb3e4a..79893d2342ca 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -524,9 +524,9 @@ static int cdc_ncm_init(struct usbnet *dev)
 			      |USB_RECIP_INTERFACE,
 			      0, iface_no, &ctx->ncm_parm,
 			      sizeof(ctx->ncm_parm));
-	if (err < 0) {
+	if (err != sizeof(ctx->ncm_parm)) {
 		dev_err(&dev->intf->dev, "failed GET_NTB_PARAMETERS\n");
-		return err; /* GET_NTB_PARAMETERS is required */
+		return err < 0 ? err : -EIO; /* GET_NTB_PARAMETERS is required */
 	}
 
 	/* set CRC Mode */

base-commit: 6dc989ea46b96ce170840174b4a38c4a387fb005
-- 
2.54.0 (Apple Git-157)

