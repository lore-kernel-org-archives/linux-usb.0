Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184481;
	b=4WbZaHLqDQgceF1xRRAyuFMGPXOdHtWfyrkChO+sZi0s5IXsDLpCJKLEmULJpZ0Xv1G0
	 Nlbryw34NzxaacTcsnFOdLqxpfrmstHfivdoj6v+OepBM3VyoPa4qRSphKzdbz11dDQEe
	 L4IssLiLhH1UHeYpeQFDCXxV47xFbD+JCsChHu2s7yqSW1xmGnKduAxXV2PIh1ksswaNF
	 q9kgfYSFf9bENpDav5jYRyFhgP21Oa5u6ozqLIjWlx0ss6eqN94S07aGqQG8m1/fRkEkm
	 ZjVgfNp+LmYcg8Nx0swd9xLxYl2COVjqExthn/dBxglDMDN3rSdB3ccM7r5/Jzk9GTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
	b=kE5XDpHrWQZ9uuBRlaKhyFIiTQTGMGOI6vgDuptuOC4HlM8xP24SmMTbY+1VI5enqwRR
	 gqwElTeIwn86zFdFcGU4OM2HtsBGoO3teTgOgSJfpmlAmbWZTTG8qDNgkhlEXwsQIoYMy
	 I5/d7jmpt774RPohTUzYoLbOTUGeKH1sa1ubQ7mM8kc9yPUIYdLmau5NBTwKur0JTjqSz
	 dQSHA8/JKLJWSBymd9htTivkydAWAuoWCMIhJmcsrHvfLYl+eF+C1KE+HziK3gQhYhMSA
	 wVR3Ax6qU4ZoSGlJYLPA883uVFR2SGI5SL6jkvQAQ4DswjJMd/inPSoFKdStZ1F/qqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVXS0Dfp;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60D0606D818
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 00:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E60D0606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVXS0Dfp
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492f0a1b685so236623f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 16:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184479; x=1794789279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=IVXS0DfpUIsNMmmlCVLQc/sr3m1dEoc2PxYn9Q1ZBDZgge7WUtw+jdTyqhCup5beuX
         p5UkKtqsdQor407ZN5+sThyv2nEYmcDa0uUa+CnKgMYC7zlI6qui62evwV2DL9VYinBy
         BarYqmMFrc3QEZTIlC8ssJP3XT4AbNHEFJZW9AzKMaUXkbZAhWMFSvOd7SRW3KD8cBll
         drhaytrMXaHy1ToVY72wpbCvSuNZPazRJo4cICaGRiht28G8IVeEueDOvEoNfrZLf8pw
         YGCplgziHwLWFFjwnfizo2aTCI9Yr266yhB2sLiV1K7bPAt2DOuj7ztQV7B0vgLaulZy
         apqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184479; x=1794789279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=tYkedcoGTtEppqeCkHuLpdS6b3sbT/MTbgJDI4VIVMlYeIv5imORKHz3dPgE+mnigm
         5mfLdUzuudXmAbsKbB4vLqZhBLh6m4SWx1oJJcl6CdHF4XsCBkYHEJxN/z+vejE3QjqB
         f64TyFuQEAUPYpNS4fU5hqRXB/lO7FKWi8XFhErRmujN8gda9aSyQu9yiiDM7Zr0cDqo
         UOlefYlvXwTI7K5C3UxoODAC1zjr586F4JfFEERbHINbAC9+NK6wLgst03qyhBf7ggCM
         jpDa69SGUXzerSWqTZio4jwKRt9ZfwdH1vtVscGJs+mMJYnzfeJkevMwh43sCmTTg1Ux
         F/Xg==
X-Forwarded-Encrypted: i=1; AL+hErHmNTbBbQ77YdDatmfYcFuvpPR/CIOOwx/5gqwj97Mg5noRkim1hskkT2ieV3PzRJQ1FTiv0rbNfqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ufK5o1z0fkY1AXc1Npf3WPS7vxzUusro/IfXrGBU+fmj5XFdW
	clHMe3TVuryjwk6lxY2fIPdTIDbxGyTWcSzdqhb7FtUe/tYJJT87VUAW
X-Gm-Gg: AYBFou3EW78HUjpt+20MSiQPe68/jus/6Q/4x+eDNrP3uo3a9WTFMw6NXfVqdjuBXw5
	1k2hPIBcReh1zC9YMIe1gxMCF8j7NL5KE8KNhOxVqbFBsbfpo4L2ip1QiuojX5tRJom513l3iYn
	E3x1MWhgdCxyUQcTmdqdG4fYZZjnbgn+mF8+pfQSsQAXNmwFpQwH2rEycNUWLLBKk5bzbRVblGG
	Tw9fjZXF3E4HTfkBUv7otFXKaTlMNGqyvCVj8bGm+zeYB+FbCL7U4UgOFCgzW2H+D0UIFvx++ja
	A8eXeB5CgbGydzgrtr23mXlXLGjH2t1cKxezt/8NdD/5Cphin6adet74JAu5EbHdAGsb16pOY0d
	+yKCsRuf97kqZqepEhghIw7PPNbt9geEOEOqboH/08T2ai8wsI5u3B2CLqGOtOjTmirZb+dKqYE
	rjsxARGz9WKd789T5k4srRQT3meEmYvpd2WHWXKlF2eErgKoIcFS39oIsXctzuZbbqQNsCeNeGN
	DVYrt0ehEoUc7V9KLtXfD0tgGUoHEdlnsOOJAIPA42+Hk0cMIoieRAgfzckUti7pJx10ovoy/os
	iCmzQmCDoPj7UwLyMmT/3j0nfy2PXe0/VYxdOBM2
X-Received: by 2002:a5d:6f0f:0:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-49586a3c015mr4911501f8f.3.1794184479389;
        Sun, 08 Nov 2026 16:34:39 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:25 +0000
Subject: [PATCH 13/17] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
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
Message-Id: <20261109-halliday-dts-v1-13-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=829;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QaX1Uqhi9JFBTyniSmrOqgkrx65fb+cn/pSnBpltl3Q=;
 b=Nal1T+ROAiQwIycyxEfKMIQ4y4aGW1L0uJ4HewmCRmGIZfSJuQVD6Fg2qPRcOrHnEpA/WiD2I
 u4aa5TB+J3JDBwhP4O82nlPD61zqIxNlRPMGwQQVcuKGnMJPv1tp6Q6
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0

