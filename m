Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011734;
	b=AX7GVdiDylxFNZQTPgZnpfVZZXpIFGn7aa6Xk1YYqeRGgP9bN2peYWC/PE1ps0O+TkCh
	 tnsIuVDf93kbT6ks8vd3PuMQWbjjxH72IqQ01je9orL5hfqWJeq0tQxmEF3aZ/5qgBRXb
	 elDmoN7r1mqGWPVsR+nVVxRlp6fxV85IBdsS/48w4h2u1OPyDlRzw3i0uqpRXo+LSOzPH
	 kesjJPEjoo+UsgLx78BK5B1dN2v++K1eeHOYHSv7ML8J2R2lyEtujB9dQsOyKszxnmZ6Q
	 WQNJMgJB/M7w/He6C60zwbecS2KASfh2wcHGoAIfXwI+LGPOMN4qKX6k8yQyO6rtbuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011734;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3+Up1eWAi6FZ5aP/4cLggFPz7Kl41JV1rEvqnrhdY5A=;
	b=KjMVJWnuJ2N5v39ANe/jey9lqvPShc84gOMCqllffbXiQ3VMFxeGb0Jdt56c0NstpxdQ
	 P/bhNWiRLoepTczPHR5p91iuTYliD0mGo4ym1YFhFaKuamA3K84kAI4n1htoCHXbd7liR
	 7vFAHXVGz9WsGwCc/oh5HXoRxQLs4Nq2Y7W2ssTyHom2mh5Sohnbm3dGV5AeSFC3LcvIW
	 jXQescr3ZLapav2kZwz1yQbT2yOjrFxtoxrdsCMu1wrwnzleHLKwwCciu1uWZZ766wlYi
	 iEUdUtV1Ht7UsPZCpPJN4HlY54Bsy/48Jli8Scm5KFlx/JBioLwAr71f8vuc+pfEkmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WM+GALUD;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KSHynIjk;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519F7606A32C
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 00:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 519F7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WM+GALUD;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KSHynIjk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+Up1eWAi6FZ5aP/4cLggFPz7Kl41JV1rEvqnrhdY5A=;
	b=WM+GALUD3rXK6wHBP3F/cY7AoDEl23jnaAwVp4BJbyPEYLft4cisNs5zIkKkEd+JPnpxjJ
	lQD1Vt1QgvL1sp6G9Tc/bDKI2euOMkUWv/rIjvIZkwoe75bq/cW0sKhf7iMf882JkhGSZd
	aeWt4oEHO/oUWee4d1aMoYWzAx28izc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-CV5yDiU9ODurTWqdxyQefw-1; Fri, 06 Nov 2026 19:35:32 -0500
X-MC-Unique: CV5yDiU9ODurTWqdxyQefw-1
X-Mimecast-MFC-AGG-ID: CV5yDiU9ODurTWqdxyQefw_1794011731
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-54af6c38092so13955181cf.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 16:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011731; x=1794616531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+Up1eWAi6FZ5aP/4cLggFPz7Kl41JV1rEvqnrhdY5A=;
        b=KSHynIjkR68kLh9lzQ4UqNZKkEm8sKl8DvN+TpJ18faYNOimxfBeKWhENhPh9KlbH+
         sjly/yV85FZbhuCXVQu860MOWfq9rWoh5ueYa26r0AiUef9s3RJHB+YlRunYuPMlCv3y
         jQD6btyZVAYoVkC+wqZtgZNqQ4EJmdkf+iqhzSJDnte/8EjBLQpmTVnTOFauDrnNW+zY
         yK18XCWrv8ekv+A+OgMfPANo6fugHJ7fb+RNwtYoRJOq7uBT3xas03/vMP4g9hfLffdl
         RMvA0PUls/B4ZLhMEdY+5fCnGKzcNzpXHreuPj/YrM9AvzXENjxcZhf/42sN804c8sXz
         n9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011731; x=1794616531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+Up1eWAi6FZ5aP/4cLggFPz7Kl41JV1rEvqnrhdY5A=;
        b=QM99cR/887TQ4vInONVNRojisKRurYIauxR3utSCwbsaGH8ZlPZMIIDMwLuJKW+gFl
         QZ66npJNhjH/ucoE+7iudhPyflNFed4aB/3+jyllasDqHRzq8IO0jHstM332lwW80Y+2
         pxv6tgtV4xcufRH96mTWtsSgE3WZlhGxL8116S9S7o8n7HlL+tVMThMmv/+rFZP4LU7W
         3LtFZ0L6LiHEExlCyNACoAqgE/z4xNosgXOdbEPoMqDUhKPlQFvYOcJWytJZVmvjVAG3
         0EVtQgh+nSj/FuDJKsSGcTMFpa567KzaqF8RT3IkNHplqMfp5nVcLVp2Jv5wrfh76oti
         7Lgw==
X-Gm-Message-State: APuU4Z9NQWf9kAU/YSUXLMBG45mYwsW7xb1BVqgN9YfZwtPMg++raM9B
	4dcYf3+OwqtLnmOd/D6no+QzVYAPjGVHFQlKyCHNm7+e1zDYAhzdiv1emVftGVmFSPsl3iH73UN
	pkuKrhjuCQ9GHZ8dfej32zZK5skhczHDpXSVVnAYfAKTK2Q64d5kNVifjDZBjpg==
X-Gm-Gg: AYBFou0hEgVre74fIW3dhQHkOkILP7BgCXYE367MFZZJ+obDHNPvXCC8M/Lv62YFcpa
	hewWBh45R73RBm5Th8LIw7gFAIKIfEqXB+KgxZYFH+fg6i3KbFCgWcdVfUsYc+6is2be2QhKagP
	j2ieL1wrfa1Bh3EC6ysN0BqcwTGYI7WJXVMjNeCczDWp3+OsEfrmj5sn0AlOqB2V4L1h0i5Vi8u
	0YrwIifMkeLyhBGSWmcbluyej3cQ+fPRxqnC0QLk5tfh5Ve+b3vfpgMReVzOCUZs/SfnGtzj2Lc
	tnvxHf0+5FSxyiIpogQH8bjs5B5wnG+MwEqzoV+J+YIGG15iQD0m07iCM6cTZgInb/M40mjTThP
	eZPEqZs99IDgtuxVVoPTQsi/PTvleqRwcFkh0sfOGWUbRuwBfiRCDkjt2dbHSDJtjJWZuyesaH3
	utqf2t/MldNzFjhKgG
X-Received: by 2002:a05:622a:4c0a:b0:532:9b14:96c5 with SMTP id d75a77b69052e-54e15762f20mr63065931cf.60.1794011731416;
        Fri, 06 Nov 2026 16:35:31 -0800 (PST)
X-Received: by 2002:a05:622a:4c0a:b0:532:9b14:96c5 with SMTP id d75a77b69052e-54e15762f20mr63065661cf.60.1794011730921;
        Fri, 06 Nov 2026 16:35:30 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5c3sm32967686d6.12.2026.11.06.16.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:35:29 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:35:13 -0500
Subject: [PATCH 2/3] usb: phy: phy-ab8500-usb: convert to
 subsys_platform_driver()
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
Message-Id: <20261106-usb-subsys-v1-2-3a86369c3f86@redhat.com>
References: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
In-Reply-To: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=KwKuScuKpz/3uSterueKo9bscNQg0aADIVbOPy7RCVI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFbnz6Cu5ppSJ75Fznd6r+epAd3HQwpqjliV5UbcaU
 q7NbPzfUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEQ+cTP8L4/R27p89ryvvazK
 0tEhR0+mt/o9Dez88Fgrw3HJ9gfSpgz/g/f/+VN5dac7l+0qm8+VXDJeUmHa6dNUzjooCvpcO2D
 PCwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/usb/phy/phy-ab8500-usb.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/usb/phy/phy-ab8500-usb.c b/drivers/usb/phy/phy-ab8500-usb.c
index e2e06e57dced..2c569c3244a0 100644
--- a/drivers/usb/phy/phy-ab8500-usb.c
+++ b/drivers/usb/phy/phy-ab8500-usb.c
@@ -988,17 +988,7 @@ static struct platform_driver ab8500_usb_driver = {
 	},
 };
 
-static int __init ab8500_usb_init(void)
-{
-	return platform_driver_register(&ab8500_usb_driver);
-}
-subsys_initcall(ab8500_usb_init);
-
-static void __exit ab8500_usb_exit(void)
-{
-	platform_driver_unregister(&ab8500_usb_driver);
-}
-module_exit(ab8500_usb_exit);
+subsys_platform_driver(ab8500_usb_driver);
 
 MODULE_AUTHOR("ST-Ericsson AB");
 MODULE_DESCRIPTION("AB8500 family usb transceiver driver");

-- 
2.56.0

