Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168583;
	b=Mi0oPXsKyRabwIRTH6mM0Ko9yLVuIEIIu4s5KzUtgQuT2jbQy5pNSYhrO/U2rAUevSdp
	 eaA+L0s2MOwEIHMK32FlRaUrk4wueafg2I7w8UoyuB4FsKuRMHWpJdWwJ/n3Fv5uQYzfX
	 YzyQqwnCNIkQBHIUeIhMwGqktFGe2trjNp/jDo7wqqCI0qVntyEjm8QIBRB8wzwc1WSxd
	 BKGDC9zEq49RWuOwnvSdmHY6Avmz5TQM6uKvSEhrOQlxBFuahPExcHemlQSijJGMvUhEa
	 a6k7sVqRFZxPim7lPlCTX6IY2amK+d206zzElFOaAWSiqeDBBh+O5NcXG/W0bF0VHxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=2amZazKKLalsSZdiPvfObeg76WQh/qrsF14EgMPaGhU=;
	b=DXL/lcgRwzyIpyDQDZ46AClxsukH/7Aje1v9LbSoI99a0AisUDyShr3ggk3imMnD/ZqQ
	 9nerLTE++pSaPgUZ+eX+YDYhqgeFcmOtxs8KXhozvuVRNpKKwgBBBRv6h3m0g0H/e0//2
	 VOhtbfAeWM9qxLXw/T4eVt5P9SYJNR0mWSoOxbgrFA3SY3CoU3xC5I0EdEfEN9qmzhRnS
	 akB1OvijFfMYG7VR4mqRXMbZJeFXmqLaaH88FqFkDo0mbqNcNhVBU60YArgzRfpMmOZIk
	 sAaQb9ZUhVxN9QbbvGcURq2eTbEL9jck5Z93bcVtuKqkbfpNIwkp6A+B4Sy6oq84LUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NAHpx8t1;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BB0606A32A
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BB0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NAHpx8t1
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so4203345e9.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 01:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795168581; x=1795773381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2amZazKKLalsSZdiPvfObeg76WQh/qrsF14EgMPaGhU=;
        b=NAHpx8t1WZfx058Dx4xvrQlaILcQlZccpGy39MwuzqoOOYQJIHxmU45+viJw3cb7y4
         MVbxwj7u1kMUvj7wSdHKAXalPAgzVejYRiIvyoE6Udsu48DhH1o9wyGPmdCVk/xpgNP0
         3Yndpj5YofXNbcgflsRpzU2OqG3I4aL7Ek4sbADfl2tjYw389Za+CjtkQ4nRH9PAIku1
         vPU8yNbX/t63Y8+GMFb9UisfmM3rTFzdUG/s8oJ3l5/iOFS9YmxFz9q2jaI2nq95nao/
         v4rD1Pr3sQFCaZYIUgcL9X8PM0/0gAi5t46qnFkoFPAQofmb6emHScspBVp6Ta2A6XUI
         RyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168581; x=1795773381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2amZazKKLalsSZdiPvfObeg76WQh/qrsF14EgMPaGhU=;
        b=bZbshnfyKntUfbYFz577Ctz+hAiy5mQPw8njURVzVCNR4Wum+OS4h3Nhf29CPgnFHW
         fJS2P8x7KskwAEk1EHx07jp5NcCO09UPVbo4aMwAR6iZIVGu/eUmR5e2dvSXGgits35R
         qeu+VJWcvAecltsXSZ/K/VTQqQkTdkc0YwWtQp3sS4DymvzRoKrkF0jndR1Z5NMK8X9g
         OLQkK5hSSmhyTvzQRotwVmRHvvO0Y7oB4Ek1IKVJ3oJ+xO9BNN8YNnUWO97IHuqTrQ2A
         NX0Dyjd0TrNUfGtmnJdhmx+8BFs+SS2+wnOI5j59ojAHrCHSV1NjMLe6E4uV2Z2KkNEs
         jB1w==
X-Gm-Message-State: APuU4Z8cSh1RPMNpSd6KXnItBHumXfsa9NNFElGjM5HPKatrZVf9P5a+
	WirLUim8GTMZLihqb69/agHrls9o9NUp96nz9sIzJzQ3VL139O0N8ojA9nuBF/zuH6AOZa9TSeU
	zoTO+VQo=
X-Gm-Gg: AYBFou0x+280agTXuV1IldN4xGJJlnuZ7IHgL4HQPNfju7W729M4Qp1NC/EK7ZkV+pI
	1go71CIN7TDvoEAH4dXZGuMkehR4JkbT0jAmaBzpgYyaRf0t0R4VEIkNY0xqso1rRZ0rOYyuHE5
	K/+d91nDYr/bbp8HJUhzs64pGQ8ZsMenx5v0ZOBylrv9M8RVMOwxIBLPznwDgtHAkWWETfoRZH1
	FfzYhfeGyBnKgmhvPxAx+/iONYVdYe+JdtX4FjONa8vZ68lrGHM4Fy2jW/07Hc8SEGeZ/7J7X6L
	VjD7M2LBBhCunRv1R5wBv0mIcdcOBd0KXfTTTt3FUI8Hka5FMZuuyQFz/h/UO78W4+abTv7XLSN
	cAeMfvlxZmQtBoy6h1CVXAOGSqb1+ON9lfZ4bipludEa9LDD4wu42nG+kDq3ux8s5bLMJC3W9Lp
	uUcB705pqBt04Nm3U2o1Sbp1YakkTlGz4i6lZ3nxJLnrQ/qUyW8+yagxLLF0WI0hviiFYDyCvTe
	mfuEZZwiDhjBgCL5bdJ/KS5kleo68q8EzLoIPbOKt4mP/UjTX/3d3frrw907aqkENgxIfjEWNA0
	J2o0a0WfTdSZBKQFcJiNXXqsDSICZlzDwhzphj0ylQdNS4/KLzQ=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr50159465e9.9.1795168581091;
        Fri, 20 Nov 2026 01:56:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm149124555e9.13.2026.11.20.01.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:56:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Nov 2026 10:56:17 +0100
Subject: [PATCH 2/2] usb: typec: tcpm: unregister stale partner sink
 capabilities
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
Message-Id: <20261120-topic-tcpm-core-fixes-v1-2-c753d1d286bb@linaro.org>
References: <20261120-topic-tcpm-core-fixes-v1-0-c753d1d286bb@linaro.org>
In-Reply-To: <20261120-topic-tcpm-core-fixes-v1-0-c753d1d286bb@linaro.org>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <groeck@chromium.org>
Cc: linux-usb@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=otPFy8+sAdWYiXsyCF/s3Tty3teP58JpE75OVUEWQEY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrABlCzfWiK8UvhhnQ+4ieSdK56C6hbkrG4+Ap3beZ
 2yDLOpaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAZQgAKCRB33NvayMhJ0UctD/
 wP8HW1ePSGMMTS006wGy0fgLV91tIrbQCOrw/N9WIjcCxlkuv5n9aHFEnHBoSGaDQ+neIXUbFHe3Lt
 nWbU5fNCK65PC0CjNwBx0/pVhASezq8uX7eYrsY3rQsV9QhUPVCCJsOH2xPBJvn+Aeys1xoQMU4NO0
 TGAiZ2yy29yZBYYR/VSzbiYcKyok8wq61iaZ6f7EgLoqWemdazVImw2uOYDyY/zutGb/lPhgt6UBex
 JdAdEm46PAeMl+TCIIkqjwt0kdYyTLHY266uhzHJZ7jyZJx0vibZrid2dJzLTsWye+NtX6zJXuHbNP
 aiEVMI0/l9DLcaKM4mK1bpYA4myYSaLtn+XJLIm3I7iZl+IkZQcMzdlvqqad8AKEEKWqKwtLl8d+Fm
 IvkqrBJeoSs25tpK+sE51l8FZfOLSn7WdddcFFefzXNgTiyGO+i1c5jnCU5OEyXIR52+DDuQTN26if
 iWVtnzHv73Mih/B4WqBW6i0lJ2sOAx6/Y1Y50wbG8MdAhWw7jUBLRh9Hd0/+jjP301nFARl/HdBJ+Q
 6Ky8aoSSofBYJCNmG73FV3139PAHdbz+xNJMazwNdgk1w2gnl+JynqHXsFQgnqvTlN9nAbFzrkpyfS
 EbUVnZKjFc1rk2KvN6jlPfjloblA9J5sGuW/LMH13vQkLvJu8tahPaz40BAw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

tcpm_register_sink_caps() registers a new "sink-capabilities" device
under the partner USB PD object every time a Sink_Capabilities message
is received, but the previously registered one is only removed on
detach.

sink_cap_done is cleared on Hard Reset, so the sink capabilities are
queried and registered again on the same partner: registering a second
device with the same name under the same parent fails, and the stale
capabilities stay exposed in sysfs.

Unregister the previous capabilities before registering the new ones.

Cc: stable@vger.kernel.org
Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Capabilities")
Assisted-by: LLM
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 1d007e59a2bf..c5a4c0b6da16 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3563,6 +3563,8 @@ static int tcpm_register_sink_caps(struct tcpm_port *port)
 	if (IS_ERR(cap))
 		return PTR_ERR(cap);
 
+	if (port->partner_sink_caps)
+		usb_power_delivery_unregister_capabilities(port->partner_sink_caps);
 	port->partner_sink_caps = cap;
 
 	return 0;

-- 
2.34.1

