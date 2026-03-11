Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1AD3DEAE8
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242437; cv=none; b=DjXW50LwWFI3IGNh3IJrpFVXTZFJvHn9EPJYWX1Zg3TCZ3Fkb8opoHyWcTaZTT03Fch53iHMTtxX2J65Sl4Ta7Alm7AmXh+zznK6Ue+fkVC7uHWub/pnlGvFL0/78vsQ6LSWPXvwR9mJkvlmHGsl1taK2uNWFqLlTvKYlmNusYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242437; c=relaxed/simple;
	bh=k8vqIKO3xLjgEO38lfDktFmauXtP6ZAzBhYpNYRUGV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0vHq/EHXLjEeTVVuWRBil+1BDKvv1hpXlxgJUeldfUxz2a3g9YuqYdgGiR+PWVpOSBWKo3eAkLsPMd5QqnlsQk+GT+zs8zNTMbkEvrttJe4WnGsygrnEop+BWwy8xdCpRI5GCtNwKDxTjY82ekSTpGYmqCeY+DxbJNFMeMy96w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=Uq1MELM1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="Uq1MELM1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853aec185aso32413535e9.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773242434; x=1773847234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKC8d2TXckb0zTKnURMJksMddQtIA6XHiRORzPSr0ak=;
        b=Uq1MELM1S1DMiG8h/ly7le16A0tPSMzSyQ/uMveYQcLk+jAXLr5k8BOgacKY7lkShX
         H0Temf+P+U2K+gLug/FhfoKPmATBy1d0B29GMAZrwMarAUY8cMguyJZM2JvGW5iNCKMl
         +4CRyrKG9r06yxAaCMkmC0ECVE6AFb1Rg3DSGpNXB4PL35xIRNtzIffEP9FkzSAFmCLH
         +U9PvFUNgF95rXm8QkcQkkIlAmBdLobu4BdV9mqYrotnihLt05F37wROzU3syFv0krBh
         fkh1Sj2LDieU3HDm4xCTj6Sz+Ri6oKQnrB6Qk5N6d7WeTAa0hSxLpTs6VbcET9XZxfRy
         VInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773242434; x=1773847234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JKC8d2TXckb0zTKnURMJksMddQtIA6XHiRORzPSr0ak=;
        b=iSD5WCzOJFeKwcWc4/trHSYDcFvMz7x6YkYPhQ7T854yxXkYaFazW60l/CW6x0iAiX
         RrLymvv3NnOIJhENPPuEDcw06vZprkMcmSrrRANuGRSDeLJ2PWxZlw0edWfxUOoFsh4C
         6CojoI5GIetE8qwirSIXnKLQv+4gDYaKsS5LwE4Q1h+Rz6QIVOjeSsADyTfusMEHcfXC
         9H/nqEONbIgcbHL5gM5EMjx9luPyGv5PzOxPbBmPIC6xuSm0GN/EW9wr59h3SkmjD0/D
         dwwWPH4UjSwGE57vMqWIbdwozUiX9n+OdYoFiAfNa3c3x0e1zOaS9upXGqUqBqegPsOY
         8hgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk3bmPNcd026EjiLezcVdFTuDn9hvZZ8F561iQ4yAEtWYmO7+8a8RjXyRR+NRsHHLD04Q6iKmS3Kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzidRYLujKHqXlGjewOqJoMR/51OF/i3pVjG/rZNIKPQZKDfcXK
	QyGci8vXj8RSqay7RUhcLkjOAGErVRw11zKpoCsplixxY1PMQ0b35hfOhDxr/MjPDPI=
X-Gm-Gg: ATEYQzy2UMxbKqRbvxZ+Ri0SrHb7baNB4NA8leKzLGzoFYe/iBThyrt5fKF15T5Vs3r
	m+/GFbKs282craIb3AcSWNwUi8WO1NbmRJ5FDTZwU4VC60O9yR69ZsZMxXbLkuf9POBcPb6/WI3
	Fr6DQFvAJ8Yd/eYylZdrXQw58GIjmEjzrVwmN/5pZ0U0uweEX6s5u2OY0AgF8eJeREO4P0kqxP9
	E021AxiUS2hvvdrTSktKI2ZlGHy8JFbBz0A/5tyiar/6hvIsUCXxPIPelaBdnJpMc8F04oSWm29
	rTcoen6zaqXar8cqojRmqyOqL7gzX9yV998Jys3RArdqXkNQgpQVdKRCkJe83H3vcI3kgkWYrXs
	FgwRdjO1J3orkzIMrOG/mFpN8RuYd60mXbNMm6/55/0x6sOFsqm10tacPACU5Jb6UNq2ruzR5A+
	VnBXn4iKfm5gLeaJj8rsN1OTYXEYcji3Oo5SV6aM4spTxKIHAGWuWsDqg0zx3AcipXJAPrjwa/P
	hRDkQ==
X-Received: by 2002:a05:600c:4fd5:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-4854b0c7f6dmr48753475e9.13.1773242434180;
        Wed, 11 Mar 2026 08:20:34 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm435519285e9.2.2026.03.11.08.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:20:33 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Mar 2026 19:20:21 +0400
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Corechips
 Microelectronics
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-sl6341-v1-1-0a890056f054@flipper.net>
References: <20260311-sl6341-v1-0-0a890056f054@flipper.net>
In-Reply-To: <20260311-sl6341-v1-0-0a890056f054@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=alchark@flipper.net;
 h=from:subject:message-id; bh=k8vqIKO3xLjgEO38lfDktFmauXtP6ZAzBhYpNYRUGV0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRu7LDj/spVP+nGTlNNyeOJ0zXXOVzkSb6R+rzsVUjs4
 sjJxrHqHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaGOsY4RAxenAEz1BnWG/1WMkXfF/TV8V3xeN3fpYb8rxYcjJZ3m14Ryn3AJWnMp9xgjw6TrcsH
 79JNnFjuVWz06uWDX63K954FMz98yn+r7/CiujQUA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add Shenzhen Corechips Microelectronics Co., Ltd., which is a company
producing chips for USB accessories

Link: http://www.corechip-sz.com/enproducts.asp
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 04b7d1aaaef1..5f1a804a96de 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -361,6 +361,8 @@ patternProperties:
     description: CORERIVER Semiconductor Co.,Ltd.
   "^corpro,.*":
     description: Chengdu Corpro Technology Co., Ltd.
+  "^corechips,.*":
+    description: Shenzhen Corechips Microelectronics Co., Ltd.
   "^cortina,.*":
     description: Cortina Systems, Inc.
   "^cosmic,.*":

-- 
2.52.0

