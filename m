Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4B03FB7F1
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114545; cv=none; b=RJNIzYoqYlVgjvqrSBdHOyj2RCrypvCJ6e2mlibzP7Xkw7LIlsl2AYia2MHpkgji/ZdP4pzCrWkKGcc3fsn9icFgTXF+u7x1B4RitWz/Y58QFzEfJy/yym1pjjdnPsIx8d/Wu69aNYeJBckYoz7glySISvwhaivdHzOTiSOvN5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114545; c=relaxed/simple;
	bh=KtWQWhKC3Kxohq5UMc3habVp2D7N2gtkE1n6puIjLZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSrJC+YkQOW3ZWzOJjqmRO2/unodyEgk1QA3AZRvhUjZZ2hymMDR7eK879OP2rTksfgj0KAEEdp8n02f+SQhW5C5M7QRfdD2+hQGtPy+rl4+d5MwUeEWv7NA4j+mKaZzA1oy+47uuoFb4MFOTjolsme9Rt6Ru62epa7CqkGuZNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDGhFy94; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDGhFy94"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7bd4c61765dso17655707b3.3
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 07:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114543; x=1779719343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m95kSTeSTgyCfxV7Wyxfftox/V8NCoAaJWZ67QlB3Ww=;
        b=MDGhFy94mLkXpcp2BWP38EVMHj0MrNv/rzkBoAP8l4usolunk+INXYNx772g3nrEBl
         X57pSbiQoSopm+3wgJlJ2Z2buutrGm1Zpf7BC9ahGCK7E+/Ro6B4NWj3VpkN/susw2Lx
         xc5GQXK4bCwx/pQ9s3SjmNnjI89iSaKA4uH1J8z7fzIIJoLpQE6FNaBSieSSOvulym6Z
         Mj54ZPAG1WNrZriJkvrCzAWyHoU5XQ3phYf4znAMA4OgI/BeirdLE+DBA+ZlTjFltsA/
         2c6csdf/XMjrfhmsE17Cb22n5gKgqUiRf2rfsju7IyoC+WfgDbmYJls/IX7KlJIUyJIM
         NpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114543; x=1779719343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m95kSTeSTgyCfxV7Wyxfftox/V8NCoAaJWZ67QlB3Ww=;
        b=OS3PoB7uKFNsDt6aJ6j+S8pYACw8eTWtx3D4Hi1jjgD2ZpLuhI64txtciGQkY68iaI
         kriZp5T55EqBWS/76gsV09CkMG8I/xLqCrI9voWJWm9of9N0nOPfnyZVgikwkNhbH6tc
         PWbTcxWds7WEyTtyf7Fh4JJSqv960tvKLc5Xrv4V6nfTM8Beq+EkNOfETXEpIrGey4d0
         t7FS94fxxGU+n/epc7jiN6WReaaAyQqJNF25biaLNwLQ7Ar30uYmOVigCWtJZ5wu/TH7
         qLFYipvB+S2J6sum/Q4z+au37SYbZnhih6swDotqkhp8Iert6v7sBZNExFgiJVxJyARq
         92eg==
X-Forwarded-Encrypted: i=1; AFNElJ8xWsfQeGleSn7FwssOG5EUYAzHMp2Mu/pH4cp4a9B5RUTbOsQN32hsvkgOdkaN8PpG+ygZ3EdbawU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw29IlJZSzE5VzvRx+pyYooAeK7qQpTm7pYwYar63t+HLH/zAau
	jjqAXWfXR6eQnbdrnoJo6c725wojfX891Q7nN8SJpZB9I3YAS9VfcGDC
X-Gm-Gg: Acq92OHAB2FB+cGgdCh+e9DL2zvA77++dxB9Y1UfC6klDZIgH6ODMDXYI5/ijwkfhI9
	JcmI3eOdyVUP/zP+8EiDCQJFThSHli8RNRpGqae2FzNA4JXXGkZJaCgURpVvy1m2OP7bx//SJQg
	2dMexYThQxh2+orhap2cTzRc2vuzx73eTuZN7RvYzPJp4VD5zQ+RGgI6tE/H2JF17Sk89ppWgOx
	ScT1qWB3eNl+deK1VVu4qDT5UElbXXtnLUj2UByZtnnJlzUAlWsgBdJEMO2BE6XMlioTUzG29yW
	m41tw7xjsT/cfow3kMMIQD9P8MK+YjgsoKgqKlQmZd8zMepWgqf0sfDQKpNDoN5gnswvXOhHh+b
	9QNPadxjVyMXfwA3HCZHHx61GSLZ4gag0omThLTBUekqWqkpGjx1dTHtZuP71ddSu/nlhXOZJy7
	I4kKuGLCPoHnn0ilGJP1n1aUGowPQPnhrUzgscueCMNw==
X-Received: by 2002:a05:690c:89:b0:7b2:7dc9:35f1 with SMTP id 00721157ae682-7c95cce0297mr161105917b3.43.1779114543341;
        Mon, 18 May 2026 07:29:03 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc997cb156sm22094067b3.18.2026.05.18.07.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:29:02 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	gene_chen@richtek.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: usb: richtek,rt1711h: remove deprecated .txt file
Date: Mon, 18 May 2026 09:29:00 -0500
Message-ID: <20260518142901.1747-2-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518142901.1747-1-akash.sukhavasi@gmail.com>
References: <20260518142901.1747-1-akash.sukhavasi@gmail.com>
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

