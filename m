Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425830;
	b=I3f/qBISKzF3ui3i32IQU8rKUmOLvubo6kNzZLLPMnMq3seCfbppdBxshMG1vbY187rp
	 GkRWaMNAEraPEnsusnwOe/wbu4LU0Oju9FXzeFsC8CkFHQspprX7jMTftDTtpY2VUQHGP
	 QZtTogPhd7a3lAVOkU0IZed0u/K54+Kd1VGhHnCEIgNiSDtJYoKbDFEabA0d+aIxevxLq
	 rLTrupn56MJbB/goG73p+mc+LcoNYITSntyk1PcBjSWwL2M6GeR9IB5uMmIBdX1o0qedh
	 aDTH949R9L9lMzlWzlUhidpgsAX746kKIk3ko1AL4wFlBCT1WG9F4tsWWpGZNLTvO4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
	b=b6tbUt59aWX6doqrOB3A5umMtniGKIbvmUcIwzYXuKOianV+UBTnmbQpyd+Gtr1QahoS
	 lkUW6FUOB2weLaQlO0c9VVM76rg4TLQ8sAjv2NF8Sz+BVyOc9rY+UTtDhjX1PLFOgJF2e
	 fdGZhQWniDdVZsuDG/nF7/eqvgbRyURli1DcNekcw/grVMaaL89XoK/6yveMmZXZiBURh
	 wSvkZn++485R7Xx6I0ZcvY6i4q+4hqUJieZwtRmdHS0crlomylX/LptKeFVPb6xKBOzkj
	 pqK7nAuRFPvk3YkseVQuqENmleKTguFWlOG8zCgrwnzPK2WEyBb5Xe76vIdcOyBiIzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BXpTUxX2;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9811A606A31F
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 09:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9811A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BXpTUxX2
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1851610f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 01:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425828; x=1796030628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
        b=BXpTUxX2De0BQxbcL/ZbS9dBhDjsFhMj+8T9ThbS0Mzo42yWqmILbmSxz/iv29e9Hg
         GgpzECqIc7dFPXNyXmJYYPrpwNXyMwFpwgPY5GwqPKiYaSOR2ZHDdsZwNYX5/1syY1R5
         KKbv1nLdvakMAsNWbwhLQYFk3ykSuHhmNjhHY+cjm54NsUzUXZcgjNma/AlF4AE0lb8v
         DCTe3qnSM/jAYevI9JtGLW+tsJMEt63w4M6yLKUGCBjzjLbFggHop1bcd30kMCu9berl
         axxdrSE3dsEByZBJdplS52mRYVxBRbNSnXTi8lxPtPjFZChdPm1EwoydwWq519y+HdeQ
         9l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425828; x=1796030628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
        b=j2vrCLuKU6sw3pPyDRKpGx+TjoGhpJtq9RshEn8swSlkt1AfRGcNN8tivPEu4yqbrJ
         qROIQqx0eeyaJqmxS31HCJbVNiYyClxNzwVuAUVHzJRDxqYNrt/aWascg87YIxyLaIF2
         rL5su7qXNd7X/TPP4KSIUotuW009YEn0EQv7PyEAGXz6Bc/wq8bgf6l+vawsuElQbLDw
         aCSXYNL5RNfUXjkU3tOZhDkaaTK6pJp0RhO4fCn71KYqlyLgZw8kv7FdkjSQ4Xis827x
         t5n5MxKJspQ8xUmSU38UeaGtW+hY9MiguUoLHmgEmuWGOtHWtqfIsnXbfxM4RaBqywfZ
         Jkxg==
X-Forwarded-Encrypted: i=1; AL+hErFZCgvOFZlJGePc0CKl1qS0PmRuaKjTBA8nPSCsOd0a8q8IUz5Vum4ZZ6UJX3Zs8ZWokubaPS6UFeM=@vger.kernel.org
X-Gm-Message-State: APuU4Z92+wxnPPfgxWBuVOfKkSNRS7Jc2UiVmNMclk9qKPPlPfev/P+L
	sNCQdVFkUmbpVrnIT8WU/T+j2eioBqsBTFvi2RFBheprGGSHAa+R182f
X-Gm-Gg: AZFdTZcM3azof0igJ1IDsnULSV0CrOgJxOWuL25mnZQRhSXy/JYqwgc1sBIDrRk5nz0
	HR4rtRwNgC3peMfviYq4+D5ZXCVS6fLPhCwxA56yBmLxhOL5I5S5bk6IuGe0DyDMY2gRu9uQI7w
	hgv/ceIWCbBfm/EuJxADq9q1MeFkm+xR91d3cJ0tK0ejRnGrLCQPAHNbVEPgy5IRWTySEWmWRha
	nyCsDTfJGvw0WVKPuhc5z/B1DgWJWtL/IkFr5NAWMFU+Rl5SVpsAR3dl3X7CtZUq4Oig9pOKORT
	kZlNWXuwOkegGVPgQ2Bva6Z/njPudts06mQ+5LzQ766LxGs1JC8NyJTu742oGyD+bafhi26SSmx
	TUEkIb9uhHSke60U1Jgt0KMW3Ny2Mt0EFP09lxsHa7wt02SPJegfNGEVq535dJgSba1o/f2/glV
	zCgHUes+tatdIykL/mwgEUN9NmLZVVUuY8ldHFajDMnH8ZQXSkdtpYgaSg8pCvOK5F6s6oAArPf
	wfz6zoK4KeOzg/mv0sQozyigZHoS2sxYKkPln4P4mCiEbdWCeLQ1m6MZLY5YJdkg+CwObwbnQRP
	lOUuyF+xYJnPPJAzGznxHQ5unw02QNjrq53HOezG81Q2A38Lwb33+LCPkoGBAXpsSyW1g6sK/f3
	9wrQyynyjIx/1DWfHOv64mu+JIajxXi8Pzw==
X-Received: by 2002:a5d:5f41:0:b0:4b4:510c:519e with SMTP id ffacd0b85a97d-4b4510c5231mr2688118f8f.27.1795425827893;
        Mon, 23 Nov 2026 01:23:47 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:47 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
Date: Mon, 23 Nov 2026 10:22:39 +0100
Message-ID: <20261123092244.1792040-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
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

Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
existing Exynos glue layer. It is also compatible with the Exynos850
variant. Document Exynos7885 compatible.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Use samsung,exynos850-dwusb3 fallback compatible

 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 8af0143c3e47..f62e3ed82257 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: samsung,exynos8890-dwusb3
           - const: samsung,exynos7-dwusb3
+      - items:
+          - const: samsung,exynos7885-dwusb3
+          - const: samsung,exynos850-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
-- 
2.56.1

