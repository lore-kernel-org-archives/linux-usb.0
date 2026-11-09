Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184455;
	b=O5WER7765v1Du/eKx2rkcbncbueP/HoiBk6G+aEDXAvmeVbCnGphTJ86eJZ/b3GGAwae
	 2gUHFsZ/2ripb78eLvGUNtDMmaguJgNOTUzi0mD8n+RphkdhazOHe89ujkIGyAHAu7FTP
	 vZw+hyhPLg3/onpy9hpdL6GXjo8qjQ1d42gUzEq5Jzp2RK+D8Kn8M5AQ+Sdpmr1iFlZ3E
	 lm3PThlMMEGZZBwitS5XO+/a/vbqXUCfgzmWrUoa4qrHO5Tt7JZ65C4BpJ24jJJJc7Bvn
	 6o9aq0H8LR6gfl/PbMfAKdkl3MYnsi6vPelyVVlSwPZLKsxzIk6rSskO38sE6EuEepg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
	b=OC+acbzxr7EAbUuqKQIbMTQ5j0iVGIZtVWRGOdMskqkel40SVxD2IyMhRzZmvd8/C6dh
	 JaXrDCbk6ShJGQ7PJMFSLNfSpy/J06ng1QLHWOUOMqjxKAdZBA9KjMvrNRQPToqS3gj+N
	 pMdwNnKzPspR2ux7eYLeitmgDDntDE5Fci8z/P6qe09DpH8RrKNuslRJHNwogZTWc8S7z
	 PhyV2zSoCTu7MnkDWKnRZTkZjBEGD8KxGJmq2DhP+UrJFGPbPaI6B5Mv5iu2cq0igUFlY
	 shGYcy+4p7Ut9C0dlrks34wj+Frt+fpw/EgEE3RDNkIUzmAEU4isgd8oao7PfKMcYQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjJzEiWq;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593F8606EE9C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 00:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593F8606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjJzEiWq
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso179424f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 16:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184434; x=1794789234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
        b=EjJzEiWqX7bP8p2RpKx0A8Mw4VIgcyhMxrNGNGYks9jT5K7ErZactzYCM9t6cwd4kq
         HaawBIqhzJIoLY4VKt7M7axDUH3ltzAQECL2DA4uwdXfdrRmzhjFbqCwUEKRsgMmA3OT
         yUx4/q4gfrM7qxWKUVkUiMy+1fv7O8bhhnA2B0BUCSLouXNRGcMKyshx7XYeRBPj5cMQ
         wqd9SPL1tAWpz/KhUuAGxUxS4NdfwwA1C8dkrWO405Sx1TUg/iTb9/AsEtLF0Uiqhn/2
         2FoNSTstnuusd6jY9eQoW6qa0bQaccSOIzfX/PXknfF9DEqb996bbOcC6TQtKxYLJM+a
         m8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184434; x=1794789234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
        b=KS5u1KTUUGIpd5V7ROt9bU9HISaVNq+u6d7ezNHn3/YVOCTfbVdaglDfG0iW+afHoV
         ER9fQ1xesen6EHcwwg9w59wlHqWlup1u/wfJeCMrEPcdl4HMSH2THsnuxmmBqUrUbYfv
         e/YoOZN75itGNHasvrXJHPCoXKYHwQq7XRT6kGY2kvD566GBwx6EZsXOIAyrz1MHL2Bg
         RKA4lLEqfQK769aB9sBw/A7YG+63PKV+W3k04YKsqbqFHO84gYOmmAbBsPT1drxwbXg5
         qhwe3ObXEiufKrYHfJthLrT4HRTTv4K0aHCoEwrqJAxExWKEtiDGdoEkOZ0hH3UG+ON0
         7Dow==
X-Forwarded-Encrypted: i=1; AL+hErFFCnzkcXb9gBpj41fz+Lt4d5CN3StKcFCORWMnQGHnFFJLx5N30MyZnJxQljpF4jCb/1lvaAYW4mQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s2K9RA7OSH9K3DEHL5Iy/RZQmGUApzlRtqBDoMHrfYm3MsWsO
	oBSQHVVfirYWItho5460u7kiY90KXIseGTuuk0SeLfKsU/YuF+0ZyGdG
X-Gm-Gg: AYBFou1w7hfM1tCNM6FbHLTr81afts+RhWGqlbT7P9dl3Xc4eTIUPCgVwTJyx51vIsx
	Q67ksWW51WwrpiznWKwaK1H8vGAg2tGD3YoCfvfU8NAvbywFMN5I8Tr5Oqto0mBfBWiVIPN6Or6
	WCiL+zWf6Q0PlJfM8kYB+NGu4MeJ302HQ/Ivw0+Skj3Gls3Gac63YFbwWWeiKinfQig7M2ke35D
	DMDl3b02Fv2udJWZKwHemMA+YFZbmcm0jbi5PKRf+nTqov/oykHe57n79M95ezbhwKDbjNFHgpo
	XC17yJ/nF3OfAbmLZeNXdmfKPE6xIqkCJqVZCvE+Ahfir3XB9FEFJl/H1HCpWPtZMk6h/TESJE8
	byZw5FH89hNRkCso9TzGwBuvC7s1UAHCADc81y/w3ZZs9wTydyX590QGr7v11+xoOUcpBYHY4Np
	iyJKxRPZ89ax6hCPpNzLjcwh+6V+3IzRCLCGD15UudS9fC3A6vsQUq+ut9exyiGiHckIsj499kW
	Zgk+AYdq0kriGtcH9BrGWD48e/sJqX3Huus3R3Y8NspjxQZbhfXitNjJYaYuOivDef5eW9KooAM
	N1i8lsSbVdYzyBJ81hnsQrvF7J8n1oOUDZsru72sLQ==
X-Received: by 2002:a05:6000:186c:b0:493:2eb8:e7fb with SMTP id ffacd0b85a97d-495856e15f7mr5379354f8f.41.1794184434351;
        Sun, 08 Nov 2026 16:33:54 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:53 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:18 +0000
Subject: [PATCH 06/17] dt-bindings: arm-smmu: Add Halliday SMMU
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
Message-Id: <20261109-halliday-dts-v1-6-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1112;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=ePrzoruUVeLDRq3OCS+DiCl1d/Uk3kZuK6w1BATsFKY=;
 b=pH81WehGSEFzi7T7LS+ShwXYAfu5lsev7imaA1JaeNifItRSFvMkK3a/y3Fr2K8IwuXgQfeAv
 1F1xnpR5tNxDdiiDmSxt0TVIqWh9HxtwfbMTz8uhxpsozlK3LlCAs7D
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SMMU-500 on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..925afa8cca8d 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,halliday-smmu-500
               - qcom,hawi-smmu-500
               - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
@@ -629,6 +630,7 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,halliday-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,ipq9650-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.55.0

