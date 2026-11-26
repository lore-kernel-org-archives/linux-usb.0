Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685916;
	b=CTXIYquRa2lfMnXv4V7yDP/PEFVmVmsPU2ZpGH9U3cykH1v8SMCrPh9ZpeFKhEtHc7mf
	 GBxT4RyFojHXLopToKXTTUz/Qhw0yz0QHH8D2YdcQxa9U3DaZLiVWenlh03g20rahEnVB
	 l/7ypK5xQQayCk5qklqj/JpB6mLefRgeInJPm0gpSJu1I1MQyVZ3FhMr5qh9F0Ag6UPDu
	 +5kAIbPbOPnCJcK862kkgirNfHaJNB4iQvSoA1osub6O5knHeiNq60G1umzos3fK7OMHD
	 sadY4HwOaCpjP3orBIFrzFNMr2e2RcpC2GC2zwTfTpSoQWhehCGZTHmxhODI0gp0kJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OJjcEC6A3l+rkxqAUXBKDBDeimXRqX3a+RszRTJllzk=;
	b=pVH7KcuSqiPM18D0eG0M6VTMY5czXt8b48JSuCjG0Zi60yX0uhmfqIT0hU6PiOUPG6N9
	 eYXVGDuuMhUnYA+uQ01EXiwRKXuYcHdwh78a5wZO10XP+F2XyOBw9fsZQpbE+hbbZJmqz
	 VI1Sl4yDFbFnaDWHxZDmV26aVth5hcorXsi3kmq7ktNUmds2IYAEpj0+iLIeU6bR/MXFA
	 Vkx/Q7yrOkr7ikMN9Fk0NC3ldS3gzHNUd/y1bAY/xIkBhyr89d3XcLRv8uZhhZ/a/9M1R
	 gIw9todYxgg7F/Ql/P0Hii2/vcdLVa9hTgpthl9IXtPwzg1oO9p92eeZJb5JYT3fYxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mspHNW9F;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB742606A326
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB742606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mspHNW9F
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-385c497bf94so5079379eec.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 01:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685915; x=1796290715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJjcEC6A3l+rkxqAUXBKDBDeimXRqX3a+RszRTJllzk=;
        b=mspHNW9FnADo+E1ymBnNgtLq5lsFnyrQ2XEib50gP0GnXtd7/P7RKZZRJCIHL1dQNS
         mO+0RD0rMQKzUf6/Zu4ApJYHNvXF3j9dWnU0LP4vJnYRyCgPM7vT4mWFd3weRA+iYyDz
         z8Z9wjMEBuRwu+qrEP8lSRVjHpYu9lHKQgCWhJKoxtl2B+bWXmc2kJyIkOSf1k5dHLwc
         gkpol3mZs7/WVitJGWL2dVNh5m0WgcbzLBc6g+Hqa3hc5yiaf/eodMUiwKj/ROYddYBh
         dKEXyyYp2ZItKs4wtyqzcH3tZcvHAp163PDcMVwqKXSbW2g0v7a12tu1Dw12eiZUzh7E
         U3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685915; x=1796290715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJjcEC6A3l+rkxqAUXBKDBDeimXRqX3a+RszRTJllzk=;
        b=0Pjn7K7oj9GTvqhHkr7ZtmFN0yPeadrzLHnX2LTYQQ+3EWBmj40TeCHHqX1TsXuV44
         UbyrsjYiIQlaHkJNkTniE2NzwZii92e4hsWZfSXXzE8pqfU00MxuebAZOXaq1aVfcjic
         BDRnskFr8/Bp+f/6xj+TwHHBTJwDGS7X6M/wDOC16xN1RdAlmFdc7hbZC9NH5vJbr6dF
         dFYc80OLOlJICSvS9GDTQp4WZHZWVO0FhFmS+MYLUGRcQRYt+5k/iZqAib2IIl98fCQI
         WizZr8//ttAY08KBFYRqfyZkFEHHbgvn8EWkdW3EkP/GPYlBdPaJoxTFSSk81QWy8hu5
         bIig==
X-Forwarded-Encrypted: i=1; AL+hErHboCDlnbp8aGjpAOUJ/a1Nl6fMw7LPBAnbHxBCipu64GbmZtdBS6dEeprZYdHJi9JNOBkl2aos4IY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V5RYD7U/aN+lLz61TFzGtMU7X17SpClbLT8SAPJ0VyF5n/iTQ
	kgapRkNa32ICTZnEZYf6SJxVlQ9wZsmRERjnezjVV76dfTd7ZYnCxbl8
X-Gm-Gg: AZFdTZfn7JhweGB1ZH4w4BIr0XZ98g7DJuXYhoaVh3Nex0rUDZq48DYn+XOhhybOlFl
	K62d3O7QfwfKvJKI7RhjKIkZ57Vh6Hx36SxLX0AengyRpecO0tIWfBFZ327wyYNBkZKDwoZLJv4
	6qJA1kSEgzwk3ojrHgIQssekvCFTLCeu3zaBs5dANd2kIq+f7gf+KBa5RCVIyzBitzvrVFinCYS
	lN3yDHQjTavVJonDGJFcqf65PJrdg6qgvMwXbkkSQNZ+aYHe4zvNUfq1R0hEzT/0e1/Ep1j2mZT
	8WJl79hcVSFMZD+2ormwRhURYpqg9/MtJbpr3fqpBhoFxjM2CRzWtyMLdToJJoq2CMVIhNXQH56
	anyT6tQoWj5AqbaZv8UahPH3+jIbFnMJL5hrBz6y6RJOrblitDT6CPPjVryn425aac6K7BjHRx8
	vpxZ5Yq9jnWC7opIwfkGsko2FrtQ0cWTN5RcdQEMoKngaZQzT2xWu2I0QobI7u+lrsh3Oin4UhV
	xRT8nW+y07yyDAEpQsJQ+RHdNpYdeb8x/mQKYWnuC1Rlr28wKpH17GgjxcyeLAbjqTQXiSziO7t
	4DhEIipeauSq5Ezio0rh+xbSyWmHHu6EKi4TTC1KYuqV4D8U+lxR
X-Received: by 2002:a05:7300:d401:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-38569256f32mr18976622eec.0.1795685914859;
        Thu, 26 Nov 2026 01:38:34 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm32600571eec.0.2026.11.26.01.38.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:38:34 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: romain.gantois@bootlin.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: usb: ti,tusb1046: Document no-hpd
Date: Thu, 26 Nov 2026 15:08:18 +0530
Message-ID: <20261126093819.76480-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126093819.76480-1-blfizzyy@gmail.com>
References: <20261126093819.76480-1-blfizzyy@gmail.com>
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

Describe boards where the TUSB1046 HPD_IN pin has no usable HPD
signal. In DisplayPort Alt Mode, the device can be configured over
I2C to treat HPD_IN as asserted.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/usb/ti,tusb1046.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
index e1501ea6b50b..a512df1bd6fe 100644
--- a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
@@ -20,6 +20,13 @@ properties:
   reg:
     maxItems: 1
 
+  no-hpd:
+    type: boolean
+    description:
+      The HPD_IN pin is not connected to a usable HPD signal. When DisplayPort
+      Alt Mode is active, the device is configured over I2C to treat HPD_IN as
+      asserted.
+
 required:
   - compatible
   - reg
-- 
2.50.1 (Apple Git-155)

