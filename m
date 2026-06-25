Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C1F36A37B
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 09:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379079; cv=none; b=qbhs4MKyoO7FaQKzuonYmaWYxkYTbBAFU/wMjGnff99mJgv4caD0kmGf3Io9XQt/8FIKQUIR9Uj+Iv2sEfNq0QvUTBBIi//Dss7CrUGUbAbYG8znGQpUsAziYud9dObQey/tIxc1itp8arrPEPi/oTQyuUroOGuZyR7yDt9UsYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379079; c=relaxed/simple;
	bh=wn0EaBKBiPply3hw0Rd0e54QCWn0RsxYvc9f6om53NE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkcPeEQSu12Wf3TZO0Xo1xai4ldS6L3owXRuWN32T3IqYob1dDCYGtDbS3+Qo6DSmRvq84WlEWOBE2E0PYBvsUcJj4JbxQyX6DhwcbFrV7yQyY2RXNWf/EeLJoXOjrUooiiS5LLGxk5WlOGTkR0x+3CFePe8oTHeqPSqoRVmnp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Omd7jw+a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fk1fqwbH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Omd7jw+a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fk1fqwbH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pbSj1345915
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 09:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+gJEQr5fNpf
	xAJhyx5GJV9o07jgbQTlRsweqftzsC1Q=; b=Omd7jw+aRoqRziqeA02eB/ojulk
	kq33dyqUldZgdocs+9hOUCHSpaNJYlC5a/fdtav7Zhx84kEYvSJplGvsp/+qL3bq
	0v/VgE82sSebFLKXuaHcM+mss62ZfQpUqnzWiwcRJh7QDP1jL5Jn7Fwis0Gswtlb
	TQFfmgJl79lfg7Q3YWputsi4gVY+I6f+ysiwao2I0LNFIMviWi1ANdTngsxuWubr
	/6cPmNNpncHM+2ykfsSDTYOukgZ6GydoWE7erFhQnNK0iMViNfdq7SWSqKWR7ynb
	xadi1oVgFladud7UYqdpQA6i3HzSNSascCr+sk9bwUaSKvDVgX4iRQAgn0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7jkv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 09:17:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-926e8e6592eso332633285a.2
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 02:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379077; x=1782983877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gJEQr5fNpfxAJhyx5GJV9o07jgbQTlRsweqftzsC1Q=;
        b=Fk1fqwbH4ud/0R3UVWvLuRNZ27t1B53dqEvilO7aDwt6yxFi+P8yp2+ZM5HEaURgaU
         63o4Ut+sZ8RmLLz0SUsR+h5kBDGfoVYjpg/XkpsTCWxDdR5QKxL9t/69hoDFrCvaazXI
         1lCNdmxJ96SiekaoVKjEQ6bdk3gaDV9iGhfgLx6CTKVzQYxE5oex1he59uBTA44Hkwjf
         2FLRw7vypCPYLpVlrEYlNUxdLodRf4LQf1ykv0NDzSfiqaotXUGhH09/8NSHyafM8QYP
         /D19LxJOz89Ui8sMv306oM/ttnchUelhEwt1vbBbFMTcYPlpoR+oMwe8Hivsj3f47co6
         FCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379077; x=1782983877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+gJEQr5fNpfxAJhyx5GJV9o07jgbQTlRsweqftzsC1Q=;
        b=krP3JOGerGPRw5jtoZrOSFjH6AFRivSdC4YhQg4raWB+q1fuL9h0vx/eR0Cvev8atw
         /SfFZVzb4YfpyQD/IjBVjg95PJznzZ83DcymPYpPu49fN47bbjyJFuZR33m2+O0Bagnv
         O/L93MWlRYbRTx5MqKx93vIre3uRpT1BKgzXugAs4ykXwLkViOk5EteARL+fiQxfhpHA
         KD1tK6Z6/iE3laX4NxhP6Sow8OWtG7Rui4ugoseAz10UeCG4KRlsUPmrgvxGTtTWSY9h
         cMs3pwvBRyQSZw4HzONRrgrXvACn+oYvzXtVzHwLsDviHI42/q64uq1hJ1om4IpsElWF
         1EbA==
X-Forwarded-Encrypted: i=1; AFNElJ9c65UOMjUaYQY78qYzcT+h+szHQFXSIp7uma1385V9vb3cDO4oLLfGLVk29F02JzCCUMoRS5e9xAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0vzdhG0wurb1gmmGqm8UQnvBBNOtiww/2/2atRIYaQpfsqTzk
	jQA7GHc/WsjTNa1wcIMdUj8QhQVrdQBV+vWDdHfBjvorzw1T9CABl7qohTeWmuvqZiBtUvBx+wF
	1Z43Uh9rmne2RwYpJksFU8rzsQPMcAef1bLrd2GsafTlzXHYQUA5K2gBx8bxajU4=
X-Gm-Gg: AfdE7cm8VMYI5gAdyFoUQjlbEUsxXDNqPl1A4KJdgnE3019COOS7lVhZxjzom4T2RPv
	IJQEiPCh1WhLkWz1hnCwTS1RFXakxt1nn8NVy4fLF3/LbqOiwq4aL2ix1t7tAWYYjfTKK3BdeAi
	3Se/euXPBKqPhp3tJXXwYxiKcoN1X2eCy+0E+YDRCBwP97fbMNLuQSKFhIDNmFAXzauSzGEcRVw
	IJzpNmN4q3fJN4yYd/Jf2su8z+8qBXInK/YTml35hMvYtqzia38YA/rIoHauJ0hsqHCKYe+5OWv
	XoroTCsMGptpM2T1schx9p9NyJB7DjGsI0WlSKzbsFK+ihN0JkZ9Qd+xoTtKV4TIAXCj03DB0WG
	0zh32rntJcgfyPvJUSL4QI8WxbKI=
X-Received: by 2002:a05:620a:2552:b0:915:efa6:d718 with SMTP id af79cd13be357-9293cade740mr238111785a.47.1782379076612;
        Thu, 25 Jun 2026 02:17:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:915:efa6:d718 with SMTP id af79cd13be357-9293cade740mr238108185a.47.1782379076101;
        Thu, 25 Jun 2026 02:17:56 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm14676789f8f.14.2026.06.25.02.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:17:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: usb: generic-ohci: Document clock-names in top-level
Date: Thu, 25 Jun 2026 11:17:46 +0200
Message-ID: <20260625091744.109467-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625091744.109467-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260625091744.109467-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1364; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wn0EaBKBiPply3hw0Rd0e54QCWn0RsxYvc9f6om53NE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqPPI5kTue/3E0veUC08g2ueasjhqcZvSVjIR1c
 hozr9MyJnaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajzyOQAKCRDBN2bmhouD
 12TID/4m4vZ5/ZH2dK1rHNg36etKWJws0e/Z9NvhYUvQZUbA99CAwMCFqJHVMYroOWiTpF886Um
 nI6ADxVBYRD1Dv7roIMi3wcP7KU3pPIHM6eGQ7Two9v11GtxLQ0N26QXCF58AWQvQmg4uBS2U0x
 6PmLgNrcbbTouUIijJUKUBdGilXwUTNzR+YfhTrw26Snom3uODVANIQ+Lt/f13O0gS53x9/ZGEK
 mciSQ+JGJsa/zzF/iOeSZCP2yzGY8MFZMBW8S9W372C9gVgDXL31b3tMkkf3i877HpIqUMXg/mS
 yzu1EW3ZOIwEVwOWa7K6wCMY3qnqxLbTh3sm1qT9T4dJ/g56J7UHTHJ4cixLuTeHtfKCh5cwDNg
 QdZ/iNky5+aebHxaQpM7VdE11JK9fnNx4QMm2MpjQyhuY2I4iUPY0/6IOQvK0gHCuQNvAHSNDbU
 x7M98c6DJmAaLiGw+OGftVRal5/kXs0IALS2qlPzE2xbdccfr4a9qflWtcgb3zF6wJVp62CTTLy
 gDju9zs7Hm9Uu4urUMSTRI29YDCYdcjcGpoweyJYtdANRsTbOP4Ovz0QLraolhWtHQUzJTm9S/3
 xh+y9DZ99kbw1N8g1dmJbVdZptyi8FEhC+AmNkJ8uuotBKB2yiv7caGnzIhCGXY/bO2GWkD8wQ8 7tHla014ZBQeK2Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX4NCFgB6IBaXO
 GW8TuaBQoIgusHCCsKXVGBb9clqJAN/7n6vhhWn9naB6r+Ml4rWl7PGWsHyGpN/UuWbHQMzQ5cx
 m1JN08XP8qaf73jEI6lO7EqwcSmQdxc=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3cf245 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=PMfV3fAWEKOp6pZ_1OUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 3b4uAzDZavCSFvOjmQix2lsJ-J3ixWj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfXxNez/jfaJob7
 lj1ie9bdwI+WxCfi8vYObiiDZX0xL3hJB9KypH+ERANjPT03Cr75j5NMTfNyyAoGlfEY1B4Ey1h
 KG011TawYo2vxd/YALllgEKZd32U9sySGlJWHvQxDxp19fEULngr2Z5M6PvjPEdLH9D37DhxS2r
 xzAUVnKCdK9wShgffQx4+MvzPXojMKmd+HG+eVY0YmWiI1ZOCr89tYsA2DXjvAeBBTBOimdgm0A
 cCzhn7lv+PjTsKVnBcqanZ8vmFlR2RlJPuuSd6ZuZiCm+6pFPI+lc+tw/iSTxce99TJSFEqfdTO
 08QMbHj028xnJW6Vqq1wzf5nBWj2DtV+uW++D/BAluVAtGegf9GOFdZhLRNKSCJ5jaSH2sJRLEb
 w9a9hJSGZBdgVRvY2MAcYnViE5M+knJgpJkFryLGEdAqeN6FYMT+Ltc8KAsddZwffEJWdQu2nd1
 X0xbpqgfchxFj0L9UAA==
X-Proofpoint-GUID: 3b4uAzDZavCSFvOjmQix2lsJ-J3ixWj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250079

Convention is to always have properties defined in top-level part of the
binding and then customized (narrowed per variant) in "if:then:" blocks.
The clock-names were mentioned only in such "if:then:" block for
atmel,at91rm9200-ohci, thus add the top-level part and disallow usage of
clock-names for other devices.  This has no practical impact as
clock-names are not used by other variants, except in
hisilicon/hi3798cv200.dtsi, but that SoC has it undocumented.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index d42f448fa204..322808aaa283 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -83,6 +83,10 @@ properties:
         - if a USB DRD channel: first clock should be host and second
           one should be peripheral
 
+  clock-names:
+    minItems: 1
+    maxItems: 4
+
   power-domains:
     maxItems: 1
 
@@ -182,6 +186,7 @@ allOf:
 
     else:
       properties:
+        clock-names: false
         atmel,vbus-gpio: false
         atmel,oc-gpio: false
 
-- 
2.53.0

