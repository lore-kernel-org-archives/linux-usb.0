Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294412;
	b=dVRiDQ0K1pMXlqdZfyR2hjdiTW+ryHe6ADqjB6E9jvC0VDAyq/cWkz2m1drKJoLT0VTG
	 ta2mTqlIOOiixr552LJPyhlrOvS6RapTOk4TkKrKAxUEtaMlAIR66zmeqGuuSVHrjX5W/
	 fn5DHlUlxfwU4uMhXdUgywuLomLXcTpP5C+H+lHfhF4OzZdo+9AeXrsVKzix909+r76Ey
	 KjwZoXL/I4dOvYRz6zI4rsc29P1ZKN19ih4oaR5j4DDqGUyRNGjve54mkrHKmMvpzmIej
	 ME5zPfp+DW1AUMPC7HfFYc/o+Rxcv4NLzxYj7dWoZcw/qsh948u67O4ilRPvU7bGoVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
	b=BwupFMqtQAq1Ba7o+DLouwHONernXvkqg6SqEicpoAwm0kjEHhn33l4dHfPZfHcd9l3J
	 46vtukG8Up6KMODVdIWzQrGfPOtHg5I7Tu9kkoHUakBSF4tgUZyRlfoGwn9Y9lTxa5ye7
	 iVicYG3JxzF47QXIuS1fJpMnVh6Z3RKqVQSHMIf4d9D7AL1rrDoXextBx1Z0hqS3Ev8XV
	 /VrHsoHolofb6OWR+qRXXwZM/gZr4L3ARcQeTlwZHKs2M6usBJOvrKeQFBQ8zSpCFwNi9
	 flmS33xCuy65w/oJHRfDCp0RfEM3C40cxjxTy6gG28kWWysP+5wbdXHB9z53IbGgnWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKJ7rUAW;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ECC606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1ECC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKJ7rUAW
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b1535be329so843179a91.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 23:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294411; x=1794899211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=BKJ7rUAWks0DI97ftAUkRPKWbNCmemr7ZVhL0nOul9OsmRcVKnn56LRoOaVKRcwpxB
         iOeR3mPcbcm6BejaQPVX3ju2yY2zeXr0dyHKECKckIXB/NdDfCwlAEyOGTEYKOeMR/eh
         U72mfcNDxazqysd+U40sIQEngN+csLpeNFH7LLXnci8Jz0CMxn3bmoD6voVIXYY66UdX
         K6ZT/PugF+gWdrhOx36wjD89zBwqCMMAgOKXDP9oqETsquxRncoQZUurbC8qUisYvZuR
         UyF332X6SUWCmVzaPsQBQZCHmIrrm8RYko+CLEoyTxpeoJJ74dg98kl+W/57na95270n
         ea/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294411; x=1794899211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=FvcMLCe8p0eAcZAS0rvs+G45C327QOSUJKTvQUE+0Yp51apDa6D+jhB/0C+VRciQlX
         cTK7UashjkopnaJdl+XK1y0TcRN7M1RoGjmgTIewgEwM2d5SDZloCLHwK/6cqna1uI2V
         /+wJyu75c6uvJ7HLl6rGC/y4mWT/F4uB7Z8DV+CaXno9BrL5KuFTixKo7r/MMNvkDsmp
         UKsX6PkmUSdGakcYLTzlyDAy0E9p/V1hRRrMiRZxSC4q2EVd1Ovge710Eob+IkGKx/Ix
         elNqL4pO4ontLHw8kq6yebIbgUD2NxUQ8JckPOe3w9munITXCUubollXPBAFOxA0Riy8
         uC0Q==
X-Forwarded-Encrypted: i=1; AL+hErEGCgV84fWtnN0Q7VD5ipUnIUoHVxzbPUb6MQjeub2UaVJp2sr/TQZHgyPlP3PmKZi4H9FhM1X3YF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OFZBBgqgexqAAH2H82r4KHGEqnSe1voXVrXKAagTOW1HmG64l
	Mz/bi898xFt7L0Az8z9u5YEJQysRplB5ApIRPsAdIyrdLAtEBXTq0N1W
X-Gm-Gg: AYBFou35F1EBJme01fI2BrqfRSd5yuwOhHWa1BQyeB0nFmv11kkBvRIbs8Jn27Q/x9H
	n5Gbcow8AoRh+VLPfCuXKP6uzsCJ3vcGs8dALUD2ZDH6FfhVvji0XLszM1gXiYLDvIjJzYq8wPi
	rAKPc/iqSXx6V5bZqwhgwsKwpLJoP634uY1mDxqmV8ZaVCzuI5i8kUHnGG7wJFJjhDvolGBQgt8
	ThAC1CdAdQRrRSSpEFwC3jAjKXCFbi/ssb6yqz2RnYnoJqrwaeoJf2QvV8UgCcr73dqJD7a0kLf
	gwCDhNwiErGHD3DmAC9Xsu7hv69D/DHXQtiJXKhncQ6YGuxB4E3gGWee8DQhSj2B+K5LJVN+Xn2
	2xOCJaZTgeY86QYOeMz0+Vn5HjD3pYDtI/l58975IJ4pM1fNjxpJgNbEusIHfW7ELKy9+PNJkpF
	vd1Kpd5zI2mu9cA0ViVaFZ45hhIIxa+ek+1wkc7s8KMReusTBmheMEozho/xAoSEXNkWYtMaJnY
	6Z4AJ3DhZj3lMrKQafZsND8vCXQ9GbWPhpUz/+odfdsL7DMIhlO3T9vzSvjlGQ3Kwh8JGCReRFt
	i1UTf0x5b+SLpEVMa8ERHXTgSK0x2ybwg9XrQ357M5g8AAFf
X-Received: by 2002:a17:90b:3b44:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b166d12825mr1909705a91.40.1794294411341;
        Mon, 09 Nov 2026 23:06:51 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b167918e94sm2647121a91.11.2026.11.09.23.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:51 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 1/4] usb: dwc2: gadget: honor pullup requests in core_connect
Date: Tue, 10 Nov 2026 15:06:22 +0800
Message-ID: <20261110070627.217946-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
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

The connector ID work initializes the peripheral controller and calls
dwc2_hsotg_core_connect() even when no gadget driver has requested a
connection. After a host-to-device role change, this clears SFTDISCON
and lets the host enumerate an unconfigured gadget.

Check enabled in the connection helper. So the device will keep
disconnect until the controller is ready

Fixes: 510ffaa48eac ("usb: dwc2: Initialize the USB core for peripheral mode")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6c8a9f05fff0..5c8e85493289 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3664,7 +3664,8 @@ void dwc2_hsotg_core_disconnect(struct dwc2_hsotg *hsotg)
 void dwc2_hsotg_core_connect(struct dwc2_hsotg *hsotg)
 {
 	/* remove the soft-disconnect and let's go */
-	if (!hsotg->role_sw || (dwc2_readl(hsotg, GOTGCTL) & GOTGCTL_BSESVLD))
+	if (hsotg->enabled &&
+	    (!hsotg->role_sw || (dwc2_readl(hsotg, GOTGCTL) & GOTGCTL_BSESVLD)))
 		dwc2_clear_bit(hsotg, DCTL, DCTL_SFTDISCON);
 }
 
-- 
2.56.0

