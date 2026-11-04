Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778139;
	b=JJaBA0Toh+B37Ff0rM/Do3Db980sXozC9vAjnrBOTViETWJdoYOkxCTK4wp7JmnPLgH7
	 evexeZexB2Uy8u86GJ3lyXnALVp6snjZXr3jVfB1QSnHCsdAkmCbhiU2DFfxXsdF35Qay
	 gqEkoOndSzVWmgMgixgT7AOZcrhUVfnUppcP+q7o517KhCr7XmIxYca/WvRKY4Aju0KDj
	 yKM3K+YF+/+xufuTRkiadax1E3pPJZZAqnbtZbTpxMVJt28Pjj+Y1jBkxR6SHNO5NmoeO
	 gI0oWCC36IsNxHJXuz8BBtn22ZblCEcJqWs9kxD2+H4Q1+kp8eB3NiXrSQZA0lMrsXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DmsYpFlGwWZ6wODCprWn4/pAbquT0OQazWJnECBB6Is=;
	b=I2Zb9wFEkZ8TqNNM+hhiPkYcl92i4aXIBiOgP4YH9T3WlnqQV6CwcdjxFM2/6y8YDbnR
	 ggOsclAmFtEGs+s3hqtWFt0dcsI0sg2rOr1MV6jVyHBHuxHwKnR5gH8YxVF62NeqDPoU+
	 27Y31pfJRrIpNo00Hg7ZXYkTkN0NBG5tWJU/WDS0trIVFUbZevkH/y2xguZNNgeqIXoFN
	 cOTFcuPdou7V0scbOqzAAD2sV1GMFjlco6eSmW0yv0H2A/G1q+ZopDHoq0VGRk93rPRay
	 QPPgYifA1oCvD0i9SIPy3vl/1WryrMQ6qNNWCiwB1bDfPFppIRug9C6Sj9aNWEnZIfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOFw0+rQ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523A7606A33A
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 523A7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOFw0+rQ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36cedf1bd63so351100eec.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 23:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778138; x=1794382938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DmsYpFlGwWZ6wODCprWn4/pAbquT0OQazWJnECBB6Is=;
        b=GOFw0+rQ4Ki57IB4ZW29BzoZiSL96hz+qgDdjQj/oPScTAJi6HjnRAB21NRT9r425C
         xFTZYWbk9VXMZLFutBr+ixjINLhyH8eUmPnDgjRXZEi5NmM/N21ZUhJB+gezsya3SppW
         f40oBw4DuuBXQ7h+VNBCbpqg17daldox5cbY9/+Pt5zItqHpb4bCcdRp/ZejRi/NDrV6
         +o78jxmwCzV6VS3Wpiz5z380+tdLFoyj3ipB3Ths2yn0XTFclU6/E7BXA1sN1/j+SqI+
         F/NYKZ1PW5nmiThlTwpH/cXt5B2wsfDpzxDVU1aULl4tiIoVGfBTP3SNUpB/e0nuxS1O
         VdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778138; x=1794382938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DmsYpFlGwWZ6wODCprWn4/pAbquT0OQazWJnECBB6Is=;
        b=OlzewOFdxfj+LDfQ16XXlgpJLXwjoUQ8jbhRuclOAjjhNqDpAaO4yJNYFL5Y3n4owc
         gfBovv8/xgDqJa6Vi4Xq8L9nJzAVGk2awbkrKVRSl9NkrA7bY87XJ2Pz6Mq4x+ASR14f
         YRDsaz0UouU4HNl95npMpz/JIF4yymntfkBiLHp9CqCeOE3HEReDCIF58KvFPJKky3+k
         BUsyrx7C2a4VVQmr7G8I/BM8ZAU9bPBd3mO1CRmxw1FA/Hrf3RvGx1/vNDvYxS1aZ8DP
         b0+lLEZbJpWjyxs6Glh1gow4kpc9LK0c/zSre7tJRw8d5nYs//bS4kPEBN7uxwGQkhhf
         ZMxg==
X-Gm-Message-State: APuU4Z9Rf9LRRqKnvN0kuNSVZ4hNyzyvgjbYEJ/HvypxSBzCjQOIJcRv
	42Nq9xkd6yWXTH2AaIjDS3VMt8HWJ0JfP0ellpepi29GM6atAzz7gyTnL9IB9A==
X-Gm-Gg: AYBFou2qwuVuZMIv76lh6jBdSHrSP++zx2KZVaLuwJsMWIQSiNhp7YhAZpTr9wGhE4X
	Buutc+NxLvox8IvoQc61ix7osXeWnA4kS99gkmIvLZTbBztrX3CCXQHI2li3RKQ4Hv+shyz27aE
	mwnuvm1zX/D1Fej5B6ls3yixkubrTUBu9xeNn/wYM5om+1djHlUMg7Jr5hg5fFKtM8B6RswTTgS
	iWayylDCr8eODJdd+p6Kba1SmdV5tqcFkMufCUSysFVBvIyJ0K4oPQsYB8lcQ/IMc9xaUd+ElDe
	wHy744THPVrahR2RRpduBlQaoRcWD0FlcvFu9BKLgRjZriR0Wq+hp5HeKD9xl4wQ67na5dh5KUV
	eGiFMTSquGcyPIBcTOGryAF05jhz8CRwivceAXPuFQtbiYtZVoCUpLhqv6bk6gGjz3r0ZPO7TjG
	R4R/wUvdFvG56+pCVycP1Fv2YCpyeJsVuqNv6w3JnW4gJ22RhblykFg06NyNdYlx2GcdBY7cMEA
	bMB5AS/pZnlFyTruzbGuOhtLMNUhPPIe60VV/UgaSBvKiXVX6vN4JC3INpGfmLKBmXnjewnVhKu
	p9o1pXynhkdgbKIQDDifj1c97+t6qwYIzfwzCvpn9cB4uM3dQ58TIg==
X-Received: by 2002:a05:701b:4555:10b0:1b1:f02b:2317 with SMTP id a92af1059eb24-1b1f03a6afamr11492019c88.22.1793778138147;
        Tue, 03 Nov 2026 23:42:18 -0800 (PST)
Received: from 192.168.1.71 ([2402:a00:163:2ce9:c926:5826:36de:3b37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm5318385c88.5.2026.11.03.23.42.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 23:42:17 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	romain.gantois@bootlin.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: usb: ti,tusb1046: document HPD_IN override
Date: Wed,  4 Nov 2026 13:12:01 +0530
Message-ID: <20261104074202.76712-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261104074202.76712-1-blfizzyy@gmail.com>
References: <20261104074202.76712-1-blfizzyy@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For boards where HPD_IN is not asserted by hardware, the TUSB1046
can force it high over I2C using the HPDIN_OVERRIDE bit in the
General register (0x0A).

Document the optional ti,hpd-in-override property to force HPD_IN
high when DisplayPort mode is selected.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/usb/ti,tusb1046.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
index e1501ea6b50b..58e9fde3ca71 100644
--- a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
@@ -20,6 +20,14 @@ properties:
   reg:
     maxItems: 1
 
+  ti,hpd-in-override:
+    type: boolean
+    description: |
+      Force the HPD_IN signal high through the HPDIN_OVERRIDE bit in the
+      General register while DisplayPort Alt Mode is active. This is useful
+      on boards where HPD_IN is not driven by the downstream DisplayPort
+      sink.
+
 required:
   - compatible
   - reg
@@ -39,6 +47,7 @@ examples:
 
             mode-switch;
             orientation-switch;
+            ti,hpd-in-override;
 
             port {
                 endpoint {
-- 
2.50.1 (Apple Git-155)

