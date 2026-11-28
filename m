Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795831055;
	b=A30nFnxWB2ahgDBjGm2mmgNRwlq1jr5Dz2moA773KB32JQxMJ/7Ixc+CbVZZwZHYtZWJ
	 qZPg5B1OtgZJvdqHxUlKbohWMDfrHUb54ZRp64EzNPjC47x7pGY/xxWNWg2InA3YwXMMu
	 FkRJyWFrM26kIx/PH5m6XLwO0GO0uS3aekF/tQP1HrqnFGEmCAjp89qOuUisJVaksHONX
	 Q9WouV9OrQyKEUC12RbgR5ZgJig1n1Zam0mad89XkFev4FVoI+UPT/H/JLMvO6q2TJMou
	 wdBPfAa2DHB8nrpZbamwzBUouiuywpeZdLqpuVfBlD2QPNG3c2n6LITFRU2l3xFQD/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795831055;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bHxqvPh3ppNYFdCM4V5QvWKC2wpzaqk/bpoy4eBiOkA=;
	b=t32HNq1n4ngfnRki+lcPP2Ums+6lrhs9GIjU7UKQec06Cct0QjLIGzWgYpVGSw3OSCD2
	 YkkDAtCs9hMo2zej2fAHMzd+LtsBZjGBHbT+6cGangncwAG31QPpWIYiDIbhrbka5tllC
	 K5VRCTx+qY8H+wqLxXzfSwRQKzeMm8SAqjaphr7KbERqf1FNl7YZFxJ4iq4Q4ho6/yxKc
	 Rv0+mtGnyOHh+0O0gwC7uSerNCTiiiqDRMRQD0qD7Iu8nH+gAD1VAyWBcjDEcATGJbEqJ
	 YrN+vqZaOGaaXg1dAigHUk6SkdH+RZPp8dW+n96EY60JyJygWsaHWvdlZU305L/tdHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TibZhc1f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE94606A31C
	for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 01:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TibZhc1f
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795831054;
	b=VdA74k43fIcKqtntVsKcHmiArm4yeT8zKEy3BNSiGuFG/9cigHNdh1lG/WHxmvuNXuu1
	 Sd4HI/fbY8NhUskCO9PwT5++JHc15pth0qIqWTjb+UWhbbqvKVXSwPccfWKOIzZnfRigv
	 R7bpcjLhXmysXbs1BPp5R9c12KpEDsoTV4nRYqaggZScA1gGH0c+vuGwVCQHzgFYPFstj
	 cmhuNB6j/oLzpGoi85LPoKp2CZ5L/a25KXrM5uVksPVIe3S3zWhz1ZLZtn5Rmy3siSUgZ
	 Rd4M9pXUSnB/mseOjgIdFwqg3Wv/RiVnyLGhk6hh4s/5JoBxCiCOoUispXGr4O5/Wdg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795831054;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bHxqvPh3ppNYFdCM4V5QvWKC2wpzaqk/bpoy4eBiOkA=;
	b=CIMIZ0ab0Wcvms/uNLDeVSzRMyHcXePpeddjI9xV/3af5PvJNeJIais6/gQpxD+n+N6n
	 cJ2tmnQih8z9R9VcMR8pcIUzsU7yUWUQzReAjJ4ompmLy7fb5yejO0GFXXEVBpafN5TdC
	 nObXBzOnixdZdr3jbp/I2V5bD20zZPZ0F8rIccnEiflDNmjHD4hRiug9HtczW4TF6n4OZ
	 HeBDTUbGzeCp1eFj3kOXGDYvr0m62H4RhJypq+GOzL6TeN4lvXj7MtlGkhquIYckA28od
	 BGfY8qphCH7WN3R9lhnjwuRMMZynUQPdCsI229AtZQuZygstsia6Yqd4mB2YZWwmKjQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D58E1F00893;
	Sat, 28 Nov 2026 01:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795831054;
	bh=bHxqvPh3ppNYFdCM4V5QvWKC2wpzaqk/bpoy4eBiOkA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=TibZhc1fqM+TLNB8jF61TRaUBRkzq2pxWJZdDcbJFEezJVY6czG4kUvHE0nQ2K4R+
	 XTpc+qP2zDEQkwTdxuY3wnFV713HgxmMaT8wsNPlqwWGRGa0/GFgPThiBwc/af7/PJ
	 pxMb1nwAoTpa2KkZTbvKup7nMeaeHHtTTAUPt/w/0QFUOiDR6+6wMlkfqwzkj8E+X8
	 2wcjbAAOe0WtlybmpBK+FBKZzQjx9dNR2XDS77IIGs1dWx9w5ZfyeLco3fxGRnS16Y
	 CuX185n7yZP3fZ1rpVO53JthZWCFeA3vZCu0PkF5dT8rQjmpD3tZ9RlGK01ievMgoH
	 9UkX2bOBFjqXA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C4C9C4DF08;
	Sat, 28 Nov 2026 01:57:33 +0000 (UTC)
From: Felix Huang via B4 Relay <devnull+akafelixab.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 20:58:51 -0500
Subject: [PATCH] usb: phy: fsl-usb: use NULL instead of plain integer 0
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
Message-Id: <20261127-fsl-usb-null-pointer-v1-1-1d10607f9f39@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB1I0qKlVykuHDvRkRAlY0pBv
 HtTXb7F/zsoJ2GFZ7VD4o+oLLHA1hUMUx9HRnkXgzOusda16DVgVsKYQ8B1kbhxQk9k7w/T9Dc
 yUNI1sZfvuX11lzXTzMP2f8Fx/AAoLyv+eAAAAA==
X-Change-ID: 20261127-fsl-usb-null-pointer-fbb14806a3b0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 Felix Huang <akafelixab@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795831131; l=1057;
 i=akafelixab@gmail.com; s=20261128; h=from:subject:message-id;
 bh=F90+UAhf/qFwjlJxTZbrRIrGBJm8qNw2VciNz2TFR6I=;
 b=dq/U0Wmrsv/58/mA0pLYFqm6ys7ncWjOkCfRqzTVV8Txb6bluBYA5ekaFRD5GiaKD6V4ywLdq
 ANp9UlLeWzUAFIiUhqdxB7L2tlZm+sX3zVh3S1nB6g6UhG0Fk3jZQzE
X-Developer-Key: i=akafelixab@gmail.com; a=ed25519;
 pk=Axl3BM1UWa+m0/AWcEhRIdIk/WY9FnY4wZkyQn64uVY=
X-Endpoint-Received: by B4 Relay for akafelixab@gmail.com/20261128 with
 auth_id=1670
X-Original-From: Felix Huang <akafelixab@gmail.com>
Reply-To: akafelixab@gmail.com
Content-Transfer-Encoding: 7bit

From: Felix Huang <akafelixab@gmail.com>

Fix the following sparse warning in fsl_otg_set_peripheral():

  drivers/usb/phy/phy-fsl-usb.c:618:31: warning: Using plain integer as NULL pointer

Assign NULL instead of 0 to the struct usb_gadget pointer otg->gadget.

Signed-off-by: Felix Huang <akafelixab@gmail.com>
---
 drivers/usb/phy/phy-fsl-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 1986f7e9d..110b277aa 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -615,7 +615,7 @@ static int fsl_otg_set_peripheral(struct usb_otg *otg,
 		if (!otg->default_a)
 			otg->gadget->ops->vbus_draw(otg->gadget, 0);
 		usb_gadget_vbus_disconnect(otg->gadget);
-		otg->gadget = 0;
+		otg->gadget = NULL;
 		otg_dev->fsm.b_bus_req = 0;
 		otg_statemachine(&otg_dev->fsm);
 		return 0;

---
base-commit: f4585067150b85e33f60876149a6e742928da75e
change-id: 20261127-fsl-usb-null-pointer-fbb14806a3b0

Best regards,
--  
Felix Huang <akafelixab@gmail.com>


