Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080C6453A44
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 13:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542310; cv=none; b=T8DL+6zqK+sj3FxEeZWtEZ8v+utX8nyG4dPOJ3bcGEKsEMP00ow7dNXIklMMFPoVxPN+nJc74Qlhpz8QRsCwIb4Now8Xqcc2HRVTJlnVGeHQ0DQ7o/UvkpneOwtAPw+zfn8zgINSlDOCH4O2KrChN8RWqEhhQD94Hp4uArFcyec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542310; c=relaxed/simple;
	bh=dHXdSEWJo3Fjmi2CPPFQMv893oaZbPDhTb0Zj+OIl1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vsq3qIB3S0za0PFurS6Nj3rn8UxEgYr3YpcYfGpZ1FsppoA7hb9d0a0dMDBkB/08z+R8cgVsD9dZVfXG8lLCSClnYF1z0cKLBkF+3xZcN+uXczb2a603YENhVDfDl2NDKF+NDFtnj/NSruegpgbLPSoNi94/GYENsJUqn3EYGGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+/iCKZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNCJQ8bw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+/iCKZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNCJQ8bw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDcsvh3654843
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 13:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7ozTwiVg9+hl0WUjpZaz2ubQf+JQlxvOWQb
	g5M5ApFk=; b=h+/iCKZjnv/cnKLWsVPIhbnMwvAg9aGKVfDK/6aiDaNx+QgKLCV
	XM07kzAKiA11zXyPcaT1ZXPHZHKgOQjzP4pWuekcZ0lIdBV56pHJUXSLfjrUAKFs
	Yu1GuGdc5NEsiRvp2lrAqVkDgu1J0WX+f6m3SFkzJiyW0ebOvqkni5wYZjzWl8Y/
	bu6D5Y11eM03P3aHEVw6W12Gz/cOaSRGplsky4fh+0Kf1f/oJfRiMTGdvPoZRmBW
	jflXGjjvm3HGzhPKI+LNUKzHW9NSCPOm914Q+bxQi1lEaT2YOtogOd1gOFeDVc6B
	0cfFA6m8XUQ/09UaIdccEJczLx3p2/7a+qw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0pmyru1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 13:45:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso13449471cf.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786542306; x=1787147106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ozTwiVg9+hl0WUjpZaz2ubQf+JQlxvOWQbg5M5ApFk=;
        b=MNCJQ8bwIGowMPq4WMrxtqiCzB2teAU/MvRywohYMznnw5VwEd0HeS3R6Cb6ph09F3
         YDkXHKuSuEa9LTANutSzn1kjRmEIYtoAcJ4WoVNhhxEL1PJ6fWGl5IVPyXmXUvoql3J4
         u/OvQHvaOjz7sBa63P10FoyBsjDOm6jEtujUfelrC+J5uOCvxf98zzijJAKAP+tyr5bO
         AYti6G8QjVy6hEFNqyLAMt1AYxr7+6yBxxXJxHsWAYqk3Xvhj+96+xOEe2uh/07ZF19f
         N06ytPIFGFlzUODVFkbXRAYk9kGU3jYvAoE0/B4nyCNb2oHiYxJ39GlR6ZAoUE+jUCBN
         N0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786542306; x=1787147106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ozTwiVg9+hl0WUjpZaz2ubQf+JQlxvOWQbg5M5ApFk=;
        b=SG7wFE0LNKQ8O/u2WCW1rKB2zRinOl0rn82ee48+AM2BlnhK60HJAJI5rdoF6KqupN
         vYcaKJIP2xCeW//F7WP7nWTydcBSbZp79HcawasSOEO8in492FbssM19+cGTVAI98/S3
         ahCKO4OpRG29/DIE/zkRrt/4I1EyVajH0qh8R49vkYS/ZSamf4oe2FQIwldHNH5+qQ51
         pQLG4JHGnjlliOBZdcz7nVTnJXpLhnFIGQe2E9jZUqk0l9RHZ33Xnd47/mK7dvqNE2YA
         e3wu3ozm9dKg6Mdod5PzgFFVasHhfcJh5c6Yb9Vr+VQhDVC6QedewCjSVXDukUAyBqKb
         9boQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHyLWySjFzmptxyZg0K4++rRLS+Um5sksDbVMWPPEPMBqvjf3fTOjprCA6RPJ77DSFIUsSsjwRusI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+sq0A0sTGPjCghUp763bXyVTpNKjz+aUnVMYupEo1XVeobug1
	5xu6tGBY11GhA3ru0VkwzFt4BkqwjguHaaUD5kU1KOsjpqlHQ8eVZG5g3sOx6Flh0gujGNyPpHh
	2/hpsCpihWyRrYhgMyek5u1Io/roPP4OEVl4oeMXHq8pdE6TNcuyrWaox/haG6ts=
X-Gm-Gg: AR+sD13uVpkbfH7oS0+nqlB8OBLpWK/sEs+AdggIu8d3pnYe/mpd1SlpygeKGmyVHbe
	4VqHEKK0XpWDFIdzDIrhtorvO/ztO3dgKVZFNxv2UZy9ZrujJ4CnaBdxBw0K3PKzgfZMQwvQN15
	D0o2CCs9EdcB5eiKy5CT6T+JWoSdYMxg80yQTYTPOCuzdlcDuvyO2ENDHKVWJvq/Ix5U2xKNxOE
	GHBsalv2GaEmWSAqWce+mJE/KIU/mLPAKDFlfN5JchQ008SRxfdm5QXVQHzHnTk4G0gAosZdqF7
	dF7Ye7hTwO7+e4dgkA+WUOPJXM1KwJKXpKWZEFWhENEc3TmdAAa4D2payah2yDw+EaWqW7B8o1E
	Ik0FsBhwAGeeLiy73
X-Received: by 2002:a05:622a:6082:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52d6482d9f3mr43867521cf.39.1786542305984;
        Wed, 12 Aug 2026 06:45:05 -0700 (PDT)
X-Received: by 2002:a05:622a:6082:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52d6482d9f3mr43866781cf.39.1786542305543;
        Wed, 12 Aug 2026 06:45:05 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c993d80sm52793265e9.12.2026.08.12.06.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:45:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: usb: snps,dwc3: Correctly restrict number of resets
Date: Wed, 12 Aug 2026 15:44:56 +0200
Message-ID: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=989; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dHXdSEWJo3Fjmi2CPPFQMv893oaZbPDhTb0Zj+OIl1Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqfHjXSTfXOV4HITJSOcYjrngPqPruu9qzNufO9
 f1A1xMOydqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanx41wAKCRDBN2bmhouD
 18YRD/0RZH97CUS5pDObp8zz2sZPR2WGr6sqRsKyMGxXbTa0Jf4R9Y4d0NS9Dia/oAuUiOoJJQS
 4RBY2jUH1v3SBqHOiPzzmwwgGmSoolkwlxEwfXtqbUh1XUH/N40ZwoHVKYTH7U8lv3ehhnoU+Hq
 ckFuX6smhWRrWZxO1Xs7YWmgbdyh6SJiLXD+z4FZoRbPio29gqoqSVrss1kIv3Y3BY6djPQHKHV
 r7xP64OY7XWA8RmZhD5eDNiWV4StHhAOvK956kCiUSsWVxQvZVn6rbV3x7ccW5jFFNi/YICAj38
 UXCIoPC/vXw/cPaSCVpsbguMGMdTJlkn8B1Nk7Hsay6MqhqQXXY5YKppXaxrrjvit8KcTqZfk6b
 +6bi1EVUsbRI4//+jDp3cLpwYiLwcK9NluozhFPZcwrMRN99pLAs+SJQrDUnNFts/L+uM6V7yfg
 qisjVbh+U58iBC66zZlFZvyAX6XhjtBwVCq+bB0Jo/SqLrYnA8flGPaGz5qQJ1DA9m5/N9XOvcx
 raAUUenaSeeqxd552EOTA2LEftoXZ52zsEgV2/SsxzCmjmj5XX+pyZR/msibe+DlRIq4FV4h4B1
 ho8HosizCz1KJkpGMtyr6qu1IBSwHRUJvyz/emm2VTznUKI4ZU+dtg994K2/eANSMhhsu1l6gsY CD+u/oBf7yL3X/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDExMiBTYWx0ZWRfXyjkYNGWdj8lt
 ocVayJMRG0BnnQF7Gayj5YAr8qPrS4mmW0hCHptYLJahmARLdss3SZgvjHKDCzmpJgggeT/w214
 VMbqiJjw+CqiPD3tFB6zPNZWqC4T/yw=
X-Proofpoint-ORIG-GUID: 4Q00TCE7Vb92-xe7Y2mMwZ6VVNz66tct
X-Authority-Analysis: v=2.4 cv=C/fZDwP+ c=1 sm=1 tr=0 ts=6a7c78e3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=F0jcGj4a8BhWEZHBF2gA:9 a=ZXulRonScM0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 4Q00TCE7Vb92-xe7Y2mMwZ6VVNz66tct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDExMiBTYWx0ZWRfX1h54PxKr4TVW
 vp4lISGSZqAwRKQdoi3HinM2CyTdRF2SP55d7bd0vtZKHtUdhNxnQ8JPfEzNAKJGr8ZnRwIdaaj
 EY5RXZyxRc1VVRJcSZYKnE9sp/m/dny3hNo7WLlDJSe8ut2YTA6BLu5mOCfBpDdI/S/z0YmkGHk
 6sGApsKJrh3bJioRSH3CuJ0O6AzFuyVCuBfL4g3gKIRUvYFLmySxjoGCun3JuP5p/+8v6/R1u6q
 +HWk4c9LX14/M70FzjlHaGEaSxE6TfDOfscXjZnofXTZCSgcX3QUthYsvxYtqbKFUOG/pikFR3M
 l3JMXaIDlYgFgVTYbOEhyMkdqGNlVfIKp9ErtazIcgbP54x+Seu014YORbEaMCMhEIRGlsZDfzd
 RWTI0AqlI7USLMZrqWgYuFHlLFlKGuLM1OzG/v3NuqVn06huNO+KuZ8Wki/AhR7+n+5MclyjciT
 jfJ3AL3TLw8y48Gm82g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120112

Add missing upper bound of number of resets for DWC3 node, because
"minItems" alone does not imply one and any number of resets would be
allowed.  Ideally this would be restricted to "maxItems: 1" (as in a few
other bindings referencing snps,dwc3.yaml) but
arch/arm64/boot/dts/hisilicon/hi3660.dtsi defines node with four resets
and a generic compatible, thus make this one an upper limit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 4380bb6fa2f0..6eb6a823bd56 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -74,6 +74,7 @@ properties:
 
   resets:
     minItems: 1
+    maxItems: 4
 
 unevaluatedProperties: false
 
-- 
2.53.0

