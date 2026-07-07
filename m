Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C444C3382C8
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435906; cv=none; b=FkkJ/qL3vYMuqqdbmdc6EhhbhBmgKgY3o+FL8r4MzpLD/nel3wkCbQVPWoU6+2HdeBqSInyXzuzGpxQ53ZSfe9iACjB8Rgvbzh71SLP4ixvi8vMyaSIA11zgB6RIc07uyoCAfSTgIhs3XygM1CNyz18pLMahwxchk2YHJL7ixgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435906; c=relaxed/simple;
	bh=yO/cwkvvW57lFL4Ma8QI8Y/z1gUwyT0SmaSmYJtTWwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZLXejpFy+XVrPK/342fndf5m14Wo/gtDXSsj0LWE0UwNEiYgeOfRUfcW2/MtpAWVy7fAxj7kZvdvaibLQ6mUmcQ52f1+BnEgmxLLsDNwVIwIx3ciYmI0jSybWhY9dKJAYrkv1/sdVhcuzyftV2ulxemDU258LGpt7dBaZRuNFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHAGZsml; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHAGZsml"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so33449975e9.3
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435899; x=1784040699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/s86zTxnPOiSyACjOQYgToZnZqdntjQb7k0uoRuZCQ=;
        b=ZHAGZsmlyc8K7c3YK+gH8A4f+6iiqwHI4RkfLs/0yJ66OnY7pCSwUfZ9H5bCH3W6JG
         m3+zrxDYsn5RYarxOmZzRStc8jZIU7PIGdpSHSgdvogCUVnKX66VYEKuXVKV2E3FjVWM
         siNrdhqflMly5fDEYQq8gGIqfNwI4GdIu4Jq0lypbRpd54q6FJ0P06ps2BI1fsUM7FeJ
         +Pqyo2ZTF5xQTfgw71mjTzj+swMcLHiIJxv7kCVXhMd3+JKHgcxszBxgzOB0Hc6lX3/S
         LzV1IF+qVZ2Ieim/xRtO7pxOv+RFONxzH/dqIXrfbs6aRKD3QcNrveiR4hyIsyoZklgD
         29Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435899; x=1784040699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/s86zTxnPOiSyACjOQYgToZnZqdntjQb7k0uoRuZCQ=;
        b=G1Ko6BQ9gWjB+TUWszX5JHSKH8ldYNho5r7cOvqb+Yxx+BZsn7mFZZsOp/zVKlyn/m
         KwktWSKspU7AN1SzOcvpXP/XETlhcbbOwXyXTp0pUWbzIN6H+eLXQ7lDXMWmIOCebJ+U
         Bd/k75mtuJWygqfT9bLeV39EHMliXrt4nMaNyJpsgvL3zDqlqEHLsFLWN6X1J7C1cn1N
         /uZzH7fJBFTKD4rSmXnzlxuXYfS5FtbA0qhErTyYqh3ZtIWFU/Vm/b5yYjUD+C6nWZod
         to5YrdK8Vj9fZz+doszhEqnjqhinbVNvd4895Dk+nGKtLcer37qGCATJZ+uwFCjIJXEK
         OEjw==
X-Forwarded-Encrypted: i=1; AHgh+RrGvfqiqUEqg6+qIcpfYd2R0lDOrxQzZhDgnyCvcgz/G7sLvloZjQHUsryZNPJHaqpqGygRbjdO8Ho=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmca03e70N2xU4MYb5R7fRo82OUJqQbL20f9vhAbAh6Y7AQue+
	RNE6kLQUo1G90ZjUUSCelELKe3atMY1sk8ajcc84wA0616tgrWc7GZAU
X-Gm-Gg: AfdE7cn8VhwsvOs1M25nRMqbzzu3sbD77zU7cqce27p1z9yFEj/+Pfn7pm9D1DyBfpO
	SvgPepsH8sq0HQmbfVLxzUfxmZIqPqlH2wC27tpVezmnVPLVND6mxz+ieuC7peTzAooK4caMXif
	UCR2b9inMWsIFUkiEe7uFoK3US3EHtM8e6x8xKePDkuft6TMxq77+VoLkpNAyU5ok/gnpBo/pnT
	JBVvTroYyRVL399O4lqHc/VLO0RKLg6WNwapXSOYPCpI9Esi+RGIspmdlHOaySwMLERRy/0rk7N
	zfXb/y/oM23kCDHnFhTqirPD/hrQLwxp614RPNpazIjTQmxHY5qBckKwu58YNPku54Y1oZtH7Zb
	TO8jcFilaf3+KeIhoU9ycyPxhYAhoMFpvCnnzHFUHVxazogTZMtt6g4BJbHo4B5FR3Qr/hVv+M2
	ZlcfRF8KE974npNt7soWEJjMVpo8ICco7LQvaA0PY0zsUHhllg
X-Received: by 2002:a7b:c00a:0:b0:493:bfbf:1da4 with SMTP id 5b1f17b1804b1-493df065f71mr44810015e9.22.1783435899133;
        Tue, 07 Jul 2026 07:51:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0ec6e64sm105192695e9.0.2026.07.07.07.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:51:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/3] dt-bindings: usb: renesas,usbhs: Document RZ/G3L SoC
Date: Tue,  7 Jul 2026 15:51:30 +0100
Message-ID: <20260707145135.247565-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The USBHS IP block on RZ/G3L SoC is identitcal to the one found on the
RZ/G3S device. Document the RZ/G3L USBHS IP block.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index dc74e70f1b92..13715b7c94c8 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -27,6 +27,7 @@ properties:
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
               - renesas,usbhs-r9a08g045 # RZ/G3S
+              - renesas,usbhs-r9a08g046 # RZ/G3L
               - renesas,usbhs-r9a09g047 # RZ/G3E
               - renesas,usbhs-r9a09g056 # RZ/V2N
               - renesas,usbhs-r9a09g057 # RZ/V2H(P)
-- 
2.43.0

