Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629306;
	b=YbUWN3GJNOp2KmUdWWeX3ibpifzHIfXOiy5kc3flRKW127zfLOU+zOZTQJNBNvXzgpIU
	 leSt5R5DpOXq9CNMpV4SInjTSSqeyE4ToHJL/tJYOnaztAxL+22aT2noqxvPW0lTw4k1U
	 WqDrbMBp7bh0PdumVUnwFwfDPk9pM3Qjp0Cn7jFB7oSXm9Sf7OZva8qVi9rp27ZSXXib4
	 PeKKNU5ATRdTq5XpjgeGfhzRIar5FuHKIGxpyGR4SYp4bAAOD5E3PpgsAeQSTODjAkHCo
	 lp/vR6lVcS+tZztpknpAAGFk3J45GKl/LS486wfYOao+P9+QDKqzMoncowXfVwE3Y7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FHhllGVlQ6IWzlGqKe6QU/LwE1EYZYemcw/zZm160z4=;
	b=vAVUoSBY/w5TNBuzxni7uuTfwSjwdJGcIOfAdZcC53fYD0X0sZP1arSAqYZdbEnqgvYH
	 kwH4WJuddQiF4t5OGK4diDpRjdm7E48Z+nWcwzKsp4849BiR2cLymGcBuhlg6suxS9ece
	 21bP854RBIKe+k1m5lXXZRoA5Yw6pnvQo5ypxc61HaxhDc5AMK38pwrbkfWVrVVhnqdUD
	 e4XtdznPhRtezcFbVVyvwcgthfaSak9wR2Unc8w3ApU6EkFKTFg4Bn1lVgVsGFSz+4VB9
	 KvCzsRb8sGV6sXGOouzpuxWRimy316xN4895gmWD1+x+I2ZbOnQxHE+oc2he5+yTknw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=XuN2QCnq;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2768B606A327
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 14:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2768B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=XuN2QCnq
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1861062f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 06:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793629304; x=1794234104; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FHhllGVlQ6IWzlGqKe6QU/LwE1EYZYemcw/zZm160z4=;
        b=XuN2QCnq4efgv/cKPsDrD5WsLl5Cjqq7ltPIjHkgnuOFj8ZCP2rtFR0xNvnsnPCNch
         R/4HxGkh+C/valt9lMrIUwwXGf6nnn8Ncpf2t/0JWcJdj6D1R9d6HaRSJdQdeXzkBPMw
         9HZWohVYsUoQnk0d+HmrW2uHz/mt4CNDmMkeO2ViWb6DiUMko4+y6ynADkfp+t3ZI1UF
         mmI3bb/NWZmbBRaWTZ3laXJYeefGV2WeCLmQRdZwYyVWUf23bFQufUA1aRT3K0f3UuCk
         /msssIhQ/VCpZwIdm2dXhQTqeWezUfIfB9Nuc6pcT8s7fGTKRWe2s+UiK5SvemXnTQd+
         7OLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629304; x=1794234104;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FHhllGVlQ6IWzlGqKe6QU/LwE1EYZYemcw/zZm160z4=;
        b=WdoyNkw1WTxLp5TlaYzb81dvPU5GGXePcMzP1pQTux2yExrC8PP/A2vXkIpFxoIIhl
         FN078S4XzyUsTHCOfSCB+8i0Pv4IPI7akFpVvlD8+KCSwZctl+6q1DrX2lvFh6xEc0xA
         yQD0KHxAb3gfKMq4JQRu/jo1mB8nnpKIIvrE+fFUHHnOSf5H5y/WTjS8DOFe0TKdtUGT
         XSWl6bvItgKLmbb1ccJuoSLXWjdZKGv6Vj0rc/eNQXwgLng5ACytkdz6O6ab5YoxPjuq
         As8dAF0TUhGJcwEhN8rkjgSaecHmIWiNJfdXVnNRiyZYHxPTo/x1YD8d3v6uHNEMCEOp
         rLPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWxStBu9X2kYzwnwkZmdCf1Nrqi3ibdanh30ZmsGhn6rD9lQ8wwpuj1s//9Dk7/PHxKpZ3x7G/3tU=@vger.kernel.org
X-Gm-Message-State: APuU4Z866EZeqAhKtEuVW5VcMXJJqA/mjAW3ugv8V8JaMRxFC4+J3z/z
	5XcpmcEWsBLsNO+zUxYcdorWECrxOipbqUXhwS0DFJ6HnWFT8QXtm3yT/5/sh0Plbp0=
X-Gm-Gg: AYBFou3jBTnaMUDMqztyBFRgQhTYM2F4E98xHFZ6qTPLO6iH1sd9YXegQGKIcvuEDJm
	IJ5T8zSB4u4lfBOCkK4mifaFiLGvN1yqsbA8jBCHfG60jNheSnPUvGtsLBWcxPVSzhQFET4ifkQ
	IWjCZNIRljgNNk2qKlZuiXeX/0746hps+vC1E/pvdFTTYuNrDf+c5qeaIvMfnsBv0nYF0H/tXgQ
	n7zwsDK6ew2IPgPy7KI1BQJrInt1WtvyttKrbYmUBqQyBfScxEPeG8KkcG4+3j/zN9WypYZywB8
	4hA85KylSCnpNErehHIgIGNKibvekkSaWKWtaOWCtIC2lyAd9ZqLz80kaUTOqlLi/jj0pkO+QRA
	kWwAgB/55v/3MrBo8j94VL1RUfizKDANiCIOTc460jbg+JPM9ULR5FCe0Xomm3HfP/zeghxmQKH
	OyLTV5SwuNqzhUCrD8M5rOsc7umY0jucVhmqHxNg2eRpYwObPhQmQp9d7Pj8u1MHajEXJqs9EKP
	Syya9bX3Ue/uoaO/4IyPCxwdUbEq15MqgXPyAFKGElwxR+Yx/SQu3oDuvj2MFb5lvKpxo683Bre
	x5xNsK00fGIHt5e++pSPf1VgltFnmCiuBSKZMtnMqFOslevxT7S5d5bOaibeLpH/G84TT2Jiehp
	0gDT6slf4h5zdTniAmUjYccHCmS4gKK4=
X-Received: by 2002:a05:6000:430d:b0:48e:25d7:d276 with SMTP id ffacd0b85a97d-48e6e2c3527mr24817977f8f.2.1793629304361;
        Mon, 02 Nov 2026 06:21:44 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm19476811f8f.56.2026.11.02.06.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:21:42 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 02 Nov 2026 18:21:24 +0400
Subject: [PATCH] usb: typec: tcpm: Record the partner's Product Type VDOs
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
Message-Id: <20261102-tcpm-product-type-vdo-v1-1-02e90dadbc2d@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB0waVHpVcSFTWZ0hJqQRGkR7
 96oy7f4f4dIQSjCq9gh0CZR3JKhygLMNCwjodhs0JWulao0JuM/6IOzq0mYfp5wsw4HbpsHsWL
 LT8itD8Tyvb5dfzuu75lMOmdwHH/ciYKQeQAAAA==
X-Change-ID: 20261102-tcpm-product-type-vdo-af873ef1fdf4
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832; i=alchark@flipper.net;
 h=from:subject:message-id; bh=NVkFNDZ72XAHJLMT4AFXB0xMljodzwzt9GA/Cq3evbs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9mJPBkhOgwbPhEkPh8dy/99SefH7t8TUjXSKza4nmJ
 PXQ2RF3OiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqLy1Ghk9ynIdy1c/mHbtu5bt1m9mbjvr+a7smRE+T/zrp3acf2yoYGX7JN70
 36d5wuePQsVWLsv79sfjwRIjFc+WVq8lT61beusMDAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A Discover Identity response can carry up to three Product Type VDOs
after the Product VDO, describing what the partner is as a UFP, DFP or
alternate mode adapter. The Type-C class keeps them in the identity and
shows them as product_type_vdo1-3, but TCPM stores only the ID header,
Cert Stat and Product VDOs of a partner, so those always read 0. Cable
identities already get their VDOs.

Store the Product Type VDOs as received and zero the ones the partner
does not send, leaving their PD revision specific layout to the reader.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d721baef5210..8fd6b1f842b3 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2064,6 +2064,7 @@ static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
 {
 	u32 vdo = p[VDO_INDEX_IDH];
 	u32 product = p[VDO_INDEX_PRODUCT];
+	int i;
 
 	if (cnt <= VDO_INDEX_PRODUCT)
 		return;
@@ -2073,6 +2074,10 @@ static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
 	port->partner_ident.id_header = vdo;
 	port->partner_ident.cert_stat = p[VDO_INDEX_CSTAT];
 	port->partner_ident.product = product;
+	/* Product Type VDOs, if any, follow the Product VDO */
+	for (i = 0; i < ARRAY_SIZE(port->partner_ident.vdo); i++)
+		port->partner_ident.vdo[i] = VDO_INDEX_PRODUCT + 1 + i < cnt ?
+					     p[VDO_INDEX_PRODUCT + 1 + i] : 0;
 
 	if (port->partner)
 		typec_partner_set_identity(port->partner);

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-tcpm-product-type-vdo-af873ef1fdf4

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

