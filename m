Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDE53451CF
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 05:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045538; cv=none; b=h1gCMMdTshnP3xgecbdHeKi8916sq0IkKYzuKw6a6JCiZEIZNtuwQlYqzeig0x2GOWS7OiOzzhPrU9XIDo6UJ4nnkbgvIirQifyXNut5BLK+T/a66gqK/ms2Wm5MgRoguKk61zAp/+lv0XiBjFZ+LnFgCZmZyIulKv4UrhEYCYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045538; c=relaxed/simple;
	bh=VxOAHrZpJpurQtSM2Pjmpid8aHBuNuE6GONcMEEhS7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ek4WeiosNwIeVFvnE2V3idbkPkBJDCjpgZ1/PW6zf7YjldeCAM+6ZL3zQr8CeophetfX+MC4VYL8VZLcftoj5uv6LTXfx+6NtzVrXfnE724qp9oq3pASWAYDU3nSuTVTmb3M6pr0bS+kATWUyKAoNvE41s//xGqq5A76dpKprow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLrGu0nS; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLrGu0nS"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84864086bfeso1635160b3a.1
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 22:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785045537; x=1785650337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FkWxhPec2UIUBbIiwFcw7jNj3vgcWuDHoDJujK6mWUA=;
        b=HLrGu0nSuFlPFynYKY9XEE82LT2EpbgL2Xal7K+dpxi9PdTZwG1O9SJ2vhzH4Ym0PU
         FQV5Of5Af6/WK5GlfzjabfSPaQiWe8psN8yR5uCGm/W07yUVYRJ93WQV3G8X+DIfPyml
         ToDGLUPYwe1UoO1s/HCnWckNlSPMAVgRF9GTRBm2X8z0nfMXKBR/d1vwyPh8ccI3Ywes
         WGBMUiuhCFDpTyehES7VVJbxBTn9MKv4akLhTPSfSgG57yEbWq+UUAmX51Aw3Q60zkOq
         Kt4mCA+iZeWQZB8OVSW9m8BqfyOw8nY2JZMI/le3Yd/4cYKYkkK3ooHXol2rnqK+WgYK
         02FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045537; x=1785650337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FkWxhPec2UIUBbIiwFcw7jNj3vgcWuDHoDJujK6mWUA=;
        b=on4O+n2EWiIXxPMQtPksNSJuhZpgesniEFs161Vs1j2kx3dNnJRMzB1qLcYa+p0zgP
         lvZ3rEZVebw5eF67vZ9oa5w4chvyGDYEsXCw+skMTe/kefxa/fhR6U19+5T/eftJQDcO
         LHWpmoOMiaG2uLwBGeRBpnyod5k8t/JC5Pwx+o0jbJnkHGmiEjvL1Wuygs1Q8YGmzKNW
         enHc7GWfoFj9ddN27oZE0aMYNkXLDS2a8qP5iHnHwg7bDQKyPfunxJnB6sDkz8k8+Vjc
         CYWjJbR38mD3whUIPlgoiI2IhRD60TOwiNY7BkTIpakO80NtA88SwyKLQvfN0s19eMB9
         HPBQ==
X-Gm-Message-State: AOJu0Yz17L1zWqq8FCMHnqWTKhea/jbAiIoMawTGzx7VzTYWORWJ+kaZ
	oxnE0rFkAvL5fkh6o4tp9qDauigB1TxwJbBpO4T3adlmEV8L5laH9WMz
X-Gm-Gg: AR+sD11Qa4EGUBdAxIf2KBaV1h2+I4UDF+87NL59mICLrwHpiuJ2vbEKQa8llNVVdDA
	v8Q872Wddk06WIZapC4IUCqAAONUgtYTTfqZdotzLG+6Y/uzct9AzFzkExKhVwo982v4NdGjoCh
	8X3/4TB70eKBvfw9i7vrog1YOH1BGJalcWjU64fbwxGA1wwuk/3pVUM7fkTMXGB20vjFUTVsQB/
	Cl7LopHVEJ6KKqP7ZHZEjOdgzG+5C7/nhWVVnEAvuZLaCrKzzzg8wU0MKiHxjJgQqlF7OaLcn5O
	CXDNHbOo0ZZW9duYxBiqFG+NMerBC8RYDmqI+vmgCw5nFBVjqiblr06JIWIzJ94x0kPU4tAJ4i3
	tpz4jaupjTzB5jkJiz/FNlKKZBVZ5ldeJNrTArr/pdzimI7+wOIVCDAVO5zM7kkikAKmwvoTQrG
	FuOUsxfkmC8y+XWj71wbog4Vgi1ZvFhtbOxvF2Rri1CA==
X-Received: by 2002:a05:6a00:2e1e:b0:848:2f84:732 with SMTP id d2e1a72fcca58-84e5959438amr3266918b3a.69.1785045536715;
        Sat, 25 Jul 2026 22:58:56 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344dd4esm1603772b3a.54.2026.07.25.22.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:58:56 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jaswinder.singh@linaro.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: maxim,max3420-udc: fix 'provices' spelling
Date: Sun, 26 Jul 2026 11:28:46 +0530
Message-ID: <20260726055846.18444-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell: provices -> provides.
No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml b/Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml
index 6edb1fc5044e..25bce48f01b1 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Jassi Brar <jaswinder.singh@linaro.org>
 
 description: |
-  The controller provices USB2.0 compliant FullSpeed peripheral
+  The controller provides USB2.0 compliant FullSpeed peripheral
   implementation over the SPI interface.
 
   Specifications about the part can be found at:
-- 
2.43.0

