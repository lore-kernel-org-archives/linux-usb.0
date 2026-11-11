Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393464;
	b=4tPHjGTOHGQKbUdr1okmNwMiUiQVDYX6iBbeNJeju5VN6b2nL2XU2D+AiEF7hyiZ73fa
	 fDaWZXyhusjDFavzmJimfeDDbCqtk6oPolpJSHJ/tGaeo8BF+20gkumlMusPi5KhhmQhq
	 UasbLPso1YuIZ2/4FX5IokR2uHcGAI/GiyE/wGncZPvGja2y6W57bqcC2NPB+9C5yaW5V
	 jfehxJn0ZX2f3JoZwQ15aQ1fjCXfMNc+GKDRTDCF4+EXmSu2zTHNn99YKUV9jd0shAfx8
	 r4858jrZ4PTZrNesc5ZB1zbxVKsXjYDAKxRY3P9PyZ0xRn+Y0vG/OFdmnJPE/L/FHdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0qMWUwpenvvRooHCV912wT6twGzrEe+8/IZ/0k0HJCU=;
	b=E3+mdDw8MPmcSfe0BS5rlwFU6PYwh5t+cv+r1FeK7LyZZJOUxYo6kCZwh9Oc8JMqNIcx
	 nuG/UX0DszeTUH8Jtv6suqV1DlkFL8RhPskRuKHEag623Dx3P45eF0iauEJNDLC1SbDDf
	 kocfozSZlCUklg7gH1rIH78yVFsfBN10hdYXzQCr33F5MPoLVkrYnwQHAjkcKRAs4DGlf
	 4MZtkjGDwTQb0+T7nFIJzG8/YOn19V4VSBFreTsDmdRy3kX75C9LZKksufDiWLEz3b7dD
	 Ky1BW0nTF+MTh5Czd86Hi9RkYPpITHORuY2Ulz/fPlQNiYlLMZIqv/MnhidY+z8CqtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Qc8xrak4;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB91606A895
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 10:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB91606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Qc8xrak4
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so4696192c88.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 02:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794393463; x=1794998263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qMWUwpenvvRooHCV912wT6twGzrEe+8/IZ/0k0HJCU=;
        b=Qc8xrak4/32Gna3SdE8hXByhMXfk5ZZ39ef3KlM7LHsk/FC0f7Gjv11KdQfftmNbKi
         ZtMFOwXoIgdUsue1L1z9jsQjczEeNfC+aru77qwkE0bRpriBwNJj/5HhYqznr8rtacKj
         JcoVLxM3d59zgKMcBFHGHPpODNY+xk7Tqy/b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393463; x=1794998263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qMWUwpenvvRooHCV912wT6twGzrEe+8/IZ/0k0HJCU=;
        b=s4kF5XkxbLQynKhgygghSlcyhpmsdJPIL1ifNyl7PgEeb8GWlOrmWfQ6ZEx1+zVyLq
         Ez+gWeZ+QB9KVELYEQ7+gChQDHSdLbCIYl3Xlny/C5DLK5ArOX29mCuTessXLxb1Ddje
         AlCVHLLHBFlSDMthGSTtwhPdeCO2iat5PyeVwA1xpXgN2pncdMNcvrEVDUo2rw+4RTSw
         ztZrBncY8w79qHE0+RJXzuBcYPR3MYWVk4eeOY7rgcGeJRfH1WQaDkxrDp38PdojTdf8
         SGGctu2jOL5TjzvZn4/odDekluywAlVrzWm+8aJ08WNkZlcj6q2wcOQNQjZcpqdXJRXc
         7H6Q==
X-Forwarded-Encrypted: i=1; AL+hErEsR08g45ebS21pHGHj/+6foSARFVng9YbazGubUqkEupAZvw00p8gja7Ki8m0ojU7u8+iiiI5u2DM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jfPElKRK2kMt9U4GV5rvxOGX7VXPS+CsmupaIMC5+7oavaWgp
	EK95XfKpT00/0k2WvYXZLJ1zEFFNn8I6CavhCl7VP3JGa+wUxRLrDBdIdY42oIVGzm0LhAqptuz
	e510=
X-Gm-Gg: AYBFou1DKm3+iVSdApHAPucQhVIB49nFURftByODGms3R/v1SKri0vO/bumK5R+0jtn
	2IaRUc/X4MkaKC/kpnB9v5PXe7YNk8zlqcI8Zrh1UTV2z9NIK7jahfBecN/Q1XdKNExe73oYQKC
	dltNHGKV/fHLIBKWI6oWPr+PnAnmEGB+RpvySc1xPOALysKWLTGZDJ7rOJ7CssO3IgSbGp7gFNQ
	I54wc6njnpKA2mfC/WN6p2aIKkFpxXWMo8nRpPVRUzeHlbk1KIONJgi3GPnpIATXVbC3Qn5biZA
	PIurKWfky3ZZ+pgZlsM/UOaFgvimlLHDTlMIKSBSsSKjx8GykgkSNbV5+/yDPh40ch6yojBjyaP
	OXI/PLI7kz/U/6KX9qjpH63kDioZg4sGc3BzhGmqXAEVYOV0g3wJXKKBe23KNt/Cb2eaTQVm3Y6
	smGzs/z18OYBRhKXBWZF+Kpnkh6XqlNa9MEHsd41kOWg+ZjetTC0kvIugFZ/qaM/wBcRvOSdLGR
	In5bG2vSVhXME9WNiVpJMjE7Vdag/W/aPdIVARlV8e3IyXeZnxym0XSZ69PuLaRCzaFanY8q8bs
	cwJ2o/tTw/u1yzpXtlHFXklpVKwr2KcXojEvc1KHUZO6ldq9koVBCEipBvshRuQFtzHACzDmhpc
	qIldPEvNBtjau3rLTyLlhRxUtqLR6yE2Tsgf/Yg==
X-Received: by 2002:a05:7022:c91:b0:143:2968:564c with SMTP id a92af1059eb24-1b3c0318478mr1829313c88.26.1794393462774;
        Wed, 11 Nov 2026 02:37:42 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm14735194c88.2.2026.11.11.02.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:37:42 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Fei Shao <fshao@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: usb: Add Genesys Logic GL3525 hub controller
Date: Wed, 11 Nov 2026 18:36:12 +0800
Message-ID: <20261111103710.1393311-2-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261111103710.1393311-1-fshao@chromium.org>
References: <20261111103710.1393311-1-fshao@chromium.org>
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

Add USB 3.2 (usb5e3,629) and USB 2.0 (usb5e3,630) compatibles for the
Genesys Logic GL3525 hub controller, which is powered by a 5V VDD supply
like GL3523.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index e8b8c03f87a0..5153a988a835 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -17,6 +17,8 @@ properties:
       - usb5e3,620
       - usb5e3,625
       - usb5e3,626
+      - usb5e3,629
+      - usb5e3,630
 
   reg: true
 
@@ -70,6 +72,8 @@ allOf:
             enum:
               - usb5e3,610
               - usb5e3,620
+              - usb5e3,629
+              - usb5e3,630
     then:
       properties:
         peer-hub: true
-- 
2.56.0.542.g3ef89b7020-goog

