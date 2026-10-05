Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1992E22083
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 04:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791173754; cv=none; b=SgIkgZJa4StYu67aacv0i2C3q+U1QdNN0UPiGQRQtHaz5kC7POlLihanMkHWDP1voSwbTLO68bWmbdf8eZfGP3NG0Nrk1qkocCNqlz9ITBuLseJrMiWyP32F+UkzoiH6FRDR7DZnAAYjjVGfh27FTZE3cEvAjSTy34X8HvkLHik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791173754; c=relaxed/simple;
	bh=Ol495Yd1bB9OG/RIDv/QVy7GjKIVdA/eEWiihj9bEt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kYvjEfDICNsi2Xi9CF6pF2WOlrAOYDzVXFiTJ6bXgvrwiI5kF6UyQphtCl0rzd6X5Q88kxa/AUqsufNFwc+VanHKvM+YExvrwAK2eoBRQTt3Mcxw/Tc16J4nNT8k/XV60FhXz89QEC0bi3bd0AjoI4r27WaMyAuXOqOFxF+X10c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sHONQFvq; arc=none smtp.client-ip=74.125.224.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sHONQFvq"
Received: by mail-yx2-f11.google.com with SMTP id 956f58d0204a3-66c70f9ad8aso543708d50.1
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 21:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791173751; x=1791778551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WffhMcSo+8l7cweCHxFJooIzIC81MEZIr3lUnbAuzfw=;
        b=sHONQFvqA4JbN6SEh+mjlVXd6UjxGIfQHrjLTrwz1yarsJRkkbOijbPJaOERGOHxp6
         eWvbHTYzkN8EPKeDOhg2rawdCjLgf+s4hBHG0Jmb1Qqo/4HHs6s8bpBHMX7tkt23rR9V
         7Axo0AV356PdvBMH01RmctS02ueQZVQD7uFs+tcV9PzBVFlNyWvbtZSPFmYi0+JCs+Mu
         KtX9NuCQ2Z8ew3nw2b5vLNVreZzoAaR9hhRJ+hdaPSKQTbgzHzwQjZHqjKUhEUg75uiQ
         h/ZF/ynb5Fm0gpng77WfAcJTj2fqNPifeRH/16SkM6/futENkNHTefFzl7ZWO623JC+I
         PnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791173751; x=1791778551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WffhMcSo+8l7cweCHxFJooIzIC81MEZIr3lUnbAuzfw=;
        b=c06O2z81iBnhVWQQA/Ll8e2RstiWfgZ8N/22wTobxlBCrJPqtARu4R34VlyHcZWtfd
         qPdbOGER1f/MLcrF6iALngrpBNrGUMDw9u1nuCNLopCc9k6JCU/zJJ2GHrA+wICYaW8L
         F/q49VvXpnF/Z9IQXhWUrNpoZrrRGVD0Jjj4M6Y7/s/gk89H7HhvvQt0NNV14wWUVGqF
         qsew8Ppv6U9HgZvJSVCofpDa/39jh6e4T6jpkSSuFZo6iT0zysqFtBzAKlP7usL678IA
         0yLdckeH8r75EKOoXrR4kHrRle4mtEh1vMSyqAu9i23wOHzKLdBYQZTw6Eg2JvR7cih1
         59/Q==
X-Gm-Message-State: AFq9FYILsAtvnhVVKvSv3Szr5Hy2WSVA7LhhJGdlmemrCmDuVbypDBJL
	Xao/FqyBIgsV3Na3AGbq6Pgqv1em9lfjmTDtIuDTWYW8gpt0+RNRkYii
X-Gm-Gg: AYBFou3LlI+Gvp7wpHX4u2Wzb/tqZ/XMUBeINL7lRnY/mg2h1YFyKREwp9ta2p7Qy9E
	4sf2hveqeDD2sUgd1Kyj6dGAPLDgLh7eK2KqJY3dnEBgphJ5Awtu/Uesd8ZqLs92+MvMdbOcCtr
	IoDAGLTgKgFW8lSSA1ZCOEe4l+W2z5nHIhguY2Ag5uhzFnbSSdGSUJFBjkdajd5Gng92oCOGXJZ
	vhvaVzZF9rlmLDO79eatAQNX8nGkipOpTLPFysrMNfawaKqBnSRQJP3R51VPolNr/x0/krn6kcm
	IZxanlyRT9O6FlPLAIvfcksyq0PvH9pFePpUwwFXPVnXmUGBglpCCc2r6Lc5JbdOrsSLVIHtvgf
	nnMOaOIc1JS97UayqvWSRy15jfWTp2SQlRFEmMeuPfa7S+tdxgfcEmGZxKXzXrSjqx7UuS778Vw
	VbTlOkPxblVWx1JC9+Qnvu+VfOX/3lQb1bqlZXRi/LwfrFIhnDLGRiq66QJCdd+PRkd7neDDStF
	9cdUJME25OTjKt6xf/1mmCLhNQ4LCtSKIX/4R4rRDWJnBFYGgPo
X-Received: by 2002:a53:b64a:0:b0:671:5818:1591 with SMTP id 956f58d0204a3-677abff80f1mr3069658d50.20.1791173751046;
        Sun, 04 Oct 2026 21:15:51 -0700 (PDT)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:edd1:61d6:442f:e3ff])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1bf368esm2205213d50.20.2026.10.04.21.15.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 21:15:50 -0700 (PDT)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	oliver@neukum.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: [PATCH net] net: usb: cdc_ncm: reject short GET_NTB_PARAMETERS responses
Date: Mon,  5 Oct 2026 00:15:25 -0400
Message-ID: <20261005041525.49111-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbnet_read_cmd() returns the number of bytes read on success, which may
be smaller than the requested size. cdc_ncm_init() calls it and only
checks for negative return values, allowing initialization to continue
with an incomplete NTB parameter response.

The context is allocated and zero-initialized by kzalloc_obj() in
cdc_ncm_bind_common(). Bytes missing from a short response therefore
remain zero and may be interpreted as device-provided parameters.

Require the return value to equal sizeof(ctx->ncm_parm), consistent with
the existing exact-length check for GET_MAX_DATAGRAM_SIZE in
cdc_ncm_set_dgram_size().

Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
 drivers/net/usb/cdc_ncm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 35db38cb3e4a..66f40f0d9c27 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -524,7 +524,7 @@ static int cdc_ncm_init(struct usbnet *dev)
 			      |USB_RECIP_INTERFACE,
 			      0, iface_no, &ctx->ncm_parm,
 			      sizeof(ctx->ncm_parm));
-	if (err < 0) {
+	if (err != sizeof(ctx->ncm_parm)) {
 		dev_err(&dev->intf->dev, "failed GET_NTB_PARAMETERS\n");
 		return err; /* GET_NTB_PARAMETERS is required */
 	}

base-commit: 6dc989ea46b96ce170840174b4a38c4a387fb005
-- 
2.54.0 (Apple Git-157)

