Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D42526B973
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121224; cv=none; b=WkbpMtCiY7rA8Dnfy4+PLX76O//X7n1bz7Q6++nYGeHhdgs2/aRtXK/ZwfOvkREjp3MTiNWnVV3InLf6Rjy2c0eEeGgdE4DkumQC+68aUNOxO66xR8IGFDJir+Us+9uN05+O6+XU8LyPvMbMqjlMCZXAju5uhBuxz4ApMPWGW70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121224; c=relaxed/simple;
	bh=KtWQWhKC3Kxohq5UMc3habVp2D7N2gtkE1n6puIjLZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/l0zO6jIGCvVnZlUIKJwwuvSfTNU39uATGdb6YgItz9hlTWvNVI3DGU0vnso2gNdOZ6TPg5zdNDAsgtuj+sQucgrzac+/3tfB3lAO/gXM90QHmevtw6UiP8Scj/OGChX9MnpVrH91EcM8Vubcxuu2RvruULCb1kOYXGVs+uGFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOvbwuoF; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOvbwuoF"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-651b4d09141so2425996d50.1
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 09:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779121217; x=1779726017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m95kSTeSTgyCfxV7Wyxfftox/V8NCoAaJWZ67QlB3Ww=;
        b=mOvbwuoFyUruF+IIX9LuZ6MfteNYMWr4CzJRV0lzmy2BwFxtROds+Q+BZZ9IzVl581
         jAE/NBi+JXiAhmjP6u5brCE/95xWDlVjDTHOTpWex4CCRNgFDKK6kneBjipAIUaG37Qa
         7hq6YfdM3aABtEIK6TrenMHZ9TRpp7a0fpMx7tBe3F/pt7Z0chZEpgBO5uRSQdNABj7/
         dqeXCuq6qtEHsMs0yrNF0jn+U3HUjgXY+rfLCD/zz2QoGQ318eREeMm9AgJp7x3U7i5i
         Zxf+rPQK3Rlqv2PhmeOWhdNLwnfrq6eIbiGhnE6XCIGXnpCUwebAWDq8kCLy9uB/9zfX
         ELHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779121217; x=1779726017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m95kSTeSTgyCfxV7Wyxfftox/V8NCoAaJWZ67QlB3Ww=;
        b=gX2TzExR39tB6ZxFzLe09lwnFb5SPx2HGrAnOirm9jXmMhJx5uFh7odshH/wFAYx8l
         07s/B0Az6kegdbmoK7BimI4+5TeDYNt1L6uM5yirzNjpf1p1oRQB/ng3xoQVl0Du0pqR
         JjFUGOspcBiaoX7M6AK8qq/brDxZITeoWDaa8Avv5N4xsnBkyz3NwA97t1mL5vrlAi6e
         B7bCffHhM4/om24NODB3RRTKeypb0YVEX+qt6XuJaGfifMvL1vjW3Yc8GntAz++dxHxS
         6QZ7NzZ3tb464JV4KqBhjIMX9UUh0LiUL17hIyGhDcWLsZcXf2QaBWMKJVclmoli+jEx
         zDuA==
X-Forwarded-Encrypted: i=1; AFNElJ8hFiaK5DOT3zk4hH3QtPh5bT1MxmgEndptBLdUI8aPqIATEdYQ8Mi50jN3lFK2TQc5WmUAJ0FedpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFHcCThcyU8K43Aw0eI9O0la2xSUEtuzIoi9GgWs2mNgmj3Xnn
	o/Q55PEZHHRKSJeH0AH+1Og2mR6fiqEWcCi87bVYn9SbsjGmzftNsvIx
X-Gm-Gg: Acq92OGjaOqBYAGf0yiPxK2hKYlzt5oqbsOJEAqsQG1N11SwNLZA2rEoqzA+o8f46X2
	qbmA+LZPenIwQT/GndqP4Uzyf9GTVt2V5dHdVs2vmySH0qdjcpUvEsXcwf8XW/Q8OVvA/aUdARO
	qgLwSNPa1/g3SGyOv9svly8JaLaxuX4JuH55S6cxBOK1HWdhmxvVgTJWHRWQUr6cJnS54pkN8ou
	/5SEQCnfc9s+UL1dJQngw4Hcfp4opXsrJ3fVYtEHuadBM7oN1RoQ5nKzy2faRjbrnA3LVnUvvlb
	XsSbncbxQWxwz7HntcsCdvpQTNDFCMpXDXT49drVbdQQextaB95gdh55eZT821OVVE57CjIEm06
	f0u+s7wmOqrrNiGgYQ8kS3wo/4A8uYv8KNa+nKzSIl9lCXgYOXWRN2VjIQs+blrjk0Q8GFP6p4/
	ACAPKc/t09NNPlnsWx72sn/HaTKKWI+Njzo2d7k/mWBnitOrt9vJ11
X-Received: by 2002:a53:b451:0:b0:65c:d26a:6e71 with SMTP id 956f58d0204a3-65e0b225732mr12388187d50.27.1779121216830;
        Mon, 18 May 2026 09:20:16 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0db60379sm6596021d50.14.2026.05.18.09.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:20:16 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	gene_chen@richtek.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: usb: richtek,rt1711h: remove deprecated .txt file
Date: Mon, 18 May 2026 11:20:13 -0500
Message-ID: <20260518162014.18251-2-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518162014.18251-1-akash.sukhavasi@gmail.com>
References: <20260518162014.18251-1-akash.sukhavasi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the deprecated .txt binding for richtek,rt1711h. It was
superseded by the YAML schema added in commit a72095ed8e65
("dt-bindings usb: typec: rt1711h: Add binding for Richtek RT1711H").

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 .../bindings/usb/richtek,rt1711h.txt          | 44 -------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711h.txt

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
deleted file mode 100644
index 6f8115db2..000000000
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Richtek RT1711H TypeC PD Controller.
-
-Required properties:
- - compatible : Must be "richtek,rt1711h".
- - reg : Must be 0x4e, it's slave address of RT1711H.
- - interrupts : <a b> where a is the interrupt number and b represents an
-   encoding of the sense and level information for the interrupt.
-
-Required sub-node:
-- connector: The "usb-c-connector" attached to the tcpci chip, the bindings
-  of connector node are specified in
-  Documentation/devicetree/bindings/connector/usb-connector.yaml
-
-Example :
-rt1711h@4e {
-	compatible = "richtek,rt1711h";
-	reg = <0x4e>;
-	interrupt-parent = <&gpio26>;
-	interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-
-	usb_con: connector {
-		compatible = "usb-c-connector";
-		label = "USB-C";
-		data-role = "dual";
-		power-role = "dual";
-		try-power-role = "sink";
-		source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
-		sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
-			     PDO_VAR(5000, 12000, 2000)>;
-		op-sink-microwatt = <10000000>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@1 {
-				reg = <1>;
-				usb_con_ss: endpoint {
-					remote-endpoint = <&usb3_data_ss>;
-				};
-			};
-		};
-	};
-};
-- 
2.54.0

