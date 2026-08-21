Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9893A4D8D97
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329017; cv=none; b=N367qMDc9btofW0VZSKLbpNRWhTPRhNeIdtDn6N9f6XDWTM2dD8Tl4GNnSkxXh761PbOkf5yXXNjIUdxPTuVqEWJVgmJWJchcUq0bp5WO9TmuKiH1zZJYz1matV4oI4ECgI77imwAMEnId2fSAdIIGdetFAD+5rlvmaE8zj2zBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329017; c=relaxed/simple;
	bh=1P6RDhvtSiDFXb71Q8qA5o6thf2dYrqwTXxVWaBRO0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1xZqRyhHXbDTQmlff93LBS6cEiAdqeJLfiavoM9XoVjcpuf+YR6qDYlhvq9iNTZE3/kc4TIdT5yxZRhFHrDyPysp4beWJ4x2TVBSXI9S9am/2mfmSFNH/F2ALL8JEjjdniuuFQjvfFCAQ5FS3dsJoSoqNC0/VUN50A266eqVEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=ImLx9AMY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="ImLx9AMY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so9854265e9.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 09:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1787329014; x=1787933814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+zNPBGZnzCFSe3FXKrZanJvr+O9PoiberfFLnMHO0A=;
        b=ImLx9AMYTs4T/IiV2rmYDLrIi0zkk86sVK4jMXFHulI9StSab6FDF7JRwmUPDdLMnb
         /UKM/CDsP7F2nfg4CZRaYeXY89rIBHMyhcxksjoL0+ppXR127fXQeYOxb7dh23+ym3yK
         p0gZwWF38HKAD8MtMDQ6+Ccw2beO4qQkRbOkrBPcUIMG0lJ3H1P3ReSnVh6dE84OJX2R
         VB6QFk/2pNUBC5JOCeDfV8o3w5jqZmhWM+K/mz+D4a8mApb2VfgCuMCglVYNa0ee8v+Z
         06gxloE9JLv8kGst/cDm9LKucF/l0ojXJxiwaOWAfzpfd7Qoor6EGDflOnWRl3VMlMxD
         z36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329014; x=1787933814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+zNPBGZnzCFSe3FXKrZanJvr+O9PoiberfFLnMHO0A=;
        b=hQpXrb8R3ZmOAGZeLN9xfKxFq8S+XceLLevlGB502T7hGe8R6XaaVC4vOlXsr9Hq3T
         SHGz/zOGPLk+89wbQudBdZqaxVP0xQl4i2dE7pkWuai8ttHkJuTNBcR2yhZkehA1YDpc
         qSgIiXlkkDn/RuIQHI7nbxQ/cwQjp/GdZuVOSQRq9jd5TrMu+qXndVl5320JcHTWayFo
         48rW1U3LYM+0Y+8VtFLi3SRZVJHdXWJhBqr2WXfxx8YqJSZ/hzL1j/NRc4VbUH+xlrri
         tizNsPr8pwihtY9coq7MZEIFPe6tcvhBMVf8yLHC29XHDt0ppQMVJJ/frdfr9SS5FpoK
         otng==
X-Gm-Message-State: AOJu0YxlybxW+Ol9f4Q11XtD6SkqtajyUkUy4QjoXGu+HZ3H/0t0TUGp
	tWmSuDFBeZMdOEW5DdZy7yN7uyt2hQnW9FfpNi9SbHmzOPynxOj3C35yoQZzpUNdEcU12vOOgqU
	QfzjCweM=
X-Gm-Gg: AR+sD13vRFXwaFMssua+i9PKwDcg1rkSacDXiCRCGxvVglJ22X/Vy/1EnZdlBNY2d1L
	f1N84fQdgrX9TNSH9Khz5+RZFX/sOVy6BQTfVyp3FpMEch39DcLmd4fY0T7vHhSijmWfwoVSYII
	RVzOxvRNj4W4iCoYuKF8bG2i5JwDGrS4hcsN00FVoaWwykW0IsXc18OWRIYROqI3lZ1ChAi0uPt
	ac98bbMPrQ7ihb/uHLSd1Gn5Y23XQ5Gnpk5BfvSWYIYoAyNf0Fwzy6JBy7UoCTgqC5y5GkjKLh6
	+hEPNg3tBcm6rKSVyQm1xZV1AV0FD81FBHoUZ7tFSrnpO7otPU+LrmKKziRy4lvWnFRpRwKfDE6
	slFjm5eM/fSSIs8Wu77i5UDhYNca1/oNMNxWZDatVLBOXj/fKdaZJjukY0ZNmD7gKQcO2KzyuQW
	vBVlli00z5k4gUKJrgIuk+NSgi5yoTKGlhqWYh4RSIKdDt7XHRWC2G72HnsIWdCQ61Au2nHksik
	4aqRDO54sX4fvONbiY09Pf77MJK0tKUJddkXaMkOw==
X-Received: by 2002:a05:600c:6217:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-499b8460e7fmr126925575e9.12.1787329013587;
        Fri, 21 Aug 2026 09:16:53 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-94.alshamil.net.ae. [86.98.192.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bd581a49sm10245235e9.1.2026.08.21.09.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:16:53 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 21 Aug 2026 20:16:34 +0400
Subject: [PATCH 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for supply
 regulators
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-hd3ss3220-regulators-v1-1-405e5c4fb306@flipper.net>
References: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
In-Reply-To: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; i=alchark@flipper.net;
 h=from:subject:message-id; bh=1P6RDhvtSiDFXb71Q8qA5o6thf2dYrqwTXxVWaBRO0Y=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR1VL5eOUtJWqxvPeuseqXGhYbFEz69njVza92FmVOVV
 gdFv05Q7pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqteYwMmzqDRS4oOJ2o1HNLJT3a6PX6ogylfhriYJ6vgvPsnc+OM7wk7FWOnz
 KTJ5+c/sZ/eaXODRWTZeS61+r3ue6bIHragVNXgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

HD3SS3220 requires two supply regulators to operate. It also strictly
requires that 5V is present before 3.3V, otherwise it gets backpowered
in a non-functional state through the 3.3V rail and kills the I2C bus.

Add both supply regulators to enable their explicit description in board
device trees.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
index 06099e93c6c3..654a982666dd 100644
--- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
@@ -25,6 +25,15 @@ properties:
   interrupts:
     maxItems: 1
 
+  vcc33-supply:
+    description: 3.3V supply (VCC33 pin), powering the SuperSpeed 2:1 MUX.
+
+  vdd5-supply:
+    description:
+      5V supply (VDD5 pin), powering the CC controller and sourcing VCONN.
+      VDD5 has to be stable for at least tVDD5V_PG (2ms) before VCC33 starts
+      ramping up, unless ENn_CC is held high while both rails ramp up.
+
   id-gpios:
     description:
       An input gpio for USB ID pin. Upon detecting a UFP device, HD3SS3220
@@ -68,6 +77,8 @@ examples:
             reg = <0x47>;
             interrupt-parent = <&gpio6>;
             interrupts = <3>;
+            vcc33-supply = <&vcc3v3_control>;
+            vdd5-supply = <&vcc5v0_device_s0>;
 
             ports {
                 #address-cells = <1>;

-- 
2.54.0

