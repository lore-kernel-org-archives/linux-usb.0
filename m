Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184486;
	b=fNhhwZCYsnDt9K1ONEz2+LW7jmCV/18LMVQyck763MZ6WvVHjay5dkxhOQHowivWHmvi
	 YpRlFgvbQfLDT+SX6JZuizHVra9egdJLQ5HxzgEdmbglc6Wwe25AyG1LghmmJzfFis+kH
	 BZHCbPiQoxax1dwuF5SVzB2D3Edj7wXuugGRu9XLi+pQfHxnY+9QqSSmw0fC1+OLMP5hq
	 g5SK+E0tUK43zR6cKfxAVI1sc4seAqe2cKy0pSp0RNysLzEaUMOkKmgFffoL804AfT4av
	 lE7SlZrmGq4NmhCSEfrp1XaMFwkq5SVLaBR/Jv2VQJkg2OQyqssYeqSJE9BBfzfbAdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
	b=LE0XtVhi7+5U1EDFZ216Ld7qXBCjQsCbObfmN6WTwSeDKeL3WlGxPiQ5egmPAC2VYXft
	 HSlS3PoQrns3ktF8i/QNnr9Ey9SjXxzqRZ5NAkvhaltyo+8BuKuHxLVT7uqN4Wmz2JqWr
	 2akuo3N3TlRSCtHPk+GmbDDHo/TDCPz4PK5aPH9Hi55ero/oFa1tNpCe7yozNS5SWu4qu
	 mf8l+7mIHLBqkFcxlsoQlVYRpk/h99w1zpbggRbTX5Z4Io6bGeXJ/GnfV2tnLfLjmWprV
	 Gcy9NQdGD7QiEmT/e8fIybGpe1WjXdkXep1SUco29ABM2Hwg2EebiaTMyoq3Ud/Yilg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ar0o+lOa;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA7760A2625
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 00:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA7760A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ar0o+lOa
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49412eb1474so184578f8f.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 16:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184485; x=1794789285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
        b=Ar0o+lOaLQ36hMaSQhz240QICDkzMHtmQDPTHSSCzgvKoRRu6+3NEyf5r8UGihmdVO
         YbL8kGYlIwYFzt0m+P3LcvsNsXWFp1DnoXb2XeAAeHKjD0e3mSdbFDeNhE2C064eHQKn
         FBw+L6yYJJRGThN5FTZYemlT04n3GfqgGq87rIHUjOJoGNcaF4/DfTtKARyZDeZ/xjrR
         b2ektKO2o/QtZcCAYpaDtUDybpL+f8B/n0nKzY3lo3ZuY+C94fC/nTZn1362e+1nZpVD
         khlpFRfxsUKvqLFNzImO1bvZjdT7ysUCEMcuRxy31zGl1OqROACCKC3fKd/G1KVQ4t4X
         QYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184485; x=1794789285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
        b=vbBJg7ma4YQuoJB9MHRwuyj0KnVMPZ//f6fW+ZHBRGw78lOd3mIIsBZp62WBXX2kd4
         AEJ9JgP5W8yQmOx+iEz9KNQaGSPKwT0tPWZT7JeiKkbht49nEMhDCR7Rb6Dinv6kO3vG
         Po7iKh2WWTDG4HS40b41dfDldSS5awsWqyFXdw+2KfDIyj+3ceYhVfHu+GukK+CGYZ/e
         2DFoR7a/wM/nzOlVR0FAf/1E0FJ9MlKl0+WcPP+hb/qHNbc0OBzK9qZTYIRAiV+e49oO
         saJkrqeyTQOtsaa13HWVuRYboD2T97cyRfgQUX9r7dLJsJ3CqSCXVQUefawTopqOVxtz
         vB9g==
X-Forwarded-Encrypted: i=1; AL+hErGEt0v5G/zdm58kv9ybLGerFbB1atyBSediNDHZO/5gR3KvhT9dOredFvqoqHT4AcI5ILNNHFeZJTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tDKt/D6pDrusgGIYq6QwVrf7Q73Vqd7Te01qRRa1lmlUT0XCl
	cLYlxdshD2hE4Rx0HgZH7mnNSejTXp6oooFSwZfIHjSU2ixVOhzOJf9c
X-Gm-Gg: AYBFou2KLQ4BaA06ybwhv1QyrqS+6B38G6mGmkEjbL2yXEReMPV4VJNJaVVjOF4b+G8
	QI68WSPG6ctZHv3P9wdQbh2mmd+M6B8dwJG6iQVM6F/hecdN+hLbiUM6srtqvG0WNG96b9xPTTR
	IiRunOjvw8eSeo1e4AYRRRfrfdYxjAlZzeSNWknmdMe2/lPIo6vqiHgwUnIMli6TbE/AMCi1u9l
	8IUfmlDhc978yY+GEisKYN1Kq/fhlAeiW/WPOR0M3ayfsjU0mfYticcTy0q8uIoDJwcNI0uiJUx
	u3cQmAXJGXnRwmVzq90BwMSgtO4EU/x1NG6uAb8LkcmXiB4WfvsFd1xkzvNMrZWwaCTBFTc0zx1
	ktxjglHuWavoBVcatvGlZHuYL7baE0HKaSpy318v4wpPIXN4dp6EHC+s7iiK46xdcqTvkjARdzd
	Iniy87qz6WZ3vrDdZxJoq3SGV1KUM6XzPKm78m36mHgHRpzVOk0x6gYZ9GHV9lqZLYo6S/TGwfK
	SSVOkagfLlHY5heuv2zdJEx1iimu/XZAlynFp+YScWihj0Mnuab/jiMBxpItEztMRLPcAVdFEIW
	5dDM7EZbCOCvFvXHMz0voyiojNJi2JFFdxt61XYw
X-Received: by 2002:a05:6000:481a:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-49584690551mr4596063f8f.49.1794184484831;
        Sun, 08 Nov 2026 16:34:44 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:43 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:26 +0000
Subject: [PATCH 14/17] dt-bindings: interconnect: OSM L3: Add Halliday EPSS
 L3 compatible
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
Message-Id: <20261109-halliday-dts-v1-14-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=844;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=gWRtexQl3K6zrJ8s8OX25X6Fe6c5gXvBp3k5tSGU4UU=;
 b=pnbK9TbDaJw63lMsp+XBx3cpAT1m6LlRO8M5pm7At3undTaYtmQjFmjLHcmBIU0XLq40cIoX8
 jdWhe4OxgWuCqPNlp+TJGp7ld3LSdzNJFNkDbr6brDzv5M8VXRxZg8B
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the EPSS L3 interconnect on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index cd6685683bab..6c3475005a35 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-epss-l3
+              - qcom,halliday-epss-l3
               - qcom,milos-epss-l3
               - qcom,sa8775p-epss-l3
               - qcom,sc7280-epss-l3

-- 
2.55.0

