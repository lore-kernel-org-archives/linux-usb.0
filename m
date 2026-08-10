Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84A82DCF61
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786322567; cv=none; b=LhUB4dKlwx6d+OuMMg35kO5m1XzHQRZBdOOTD4Ov5hvGLQSsCIC+FbgBnikFwFCfoQfULO6DoADZb0nJ/Kd6JVtQQD7rHGECOSXLN527R8wOf60wvTNA0SZ6OHSrOhXozo1wSOO6VHPGreAcfasc5C/kLxoJaB5Kie+CnrhILFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786322567; c=relaxed/simple;
	bh=XH9q/y6n0YYgQgp/Q2mx0eNIcicMKwlLjlTfyiTRa34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Emd52w7akq6mE26sWk+rHBMNzBv2FUnHvHL81C9KRw+Fp6VYXggBgqvWel6Z3v7eCKYrXm2/2858XC9Qw4hHyHKqZMFP49F6JNtP+p4fE+zQ+KZyw2nbQDWSTPWPnu9/zqD1iUHhYpLPc0sl7UwtDcJP1U0ajaCX/1qvGpvWlsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMc3I/Mr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ix9CCDWh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMc3I/Mr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ix9CCDWh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679LCgWp4102328
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2MkeqS8Xm/u/rmFehJE2DuhmOxprgWDkQayQ76BCyLE=; b=DMc3I/Mrrfzi5E4b
	LzFUvxKFSkKRTcn0834s6ayo7B4Lws7E6OYu6xttyd4NJdHzc9mEw0yRV6Wi/jZ5
	Qn5lVhATbnPuI2JtG+tpnq+TmPdh8DeyRZV9lMJz7VuRflaun3FU4G7OFwmu8f3c
	UeKLJfKMlbXSKwI9uwjDDVWOSEfOWDEvoA9TMQOhpW15sBBH82qUvXw+gfucg1RC
	ZDkukMCLiAXWJC1bJ81KSwZZEQ/tw/HhkzIQPAjtWJqxgWjcUU1fugskSeINHBgS
	Qk5a8RBDDNXut4vWQS4P2j0HqlXOQbtKliwb2rAn0jKQQEOaPzq+KAJ7mgqpMd05
	YfM48g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xr93j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:42:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso24414511cf.3
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2026 17:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786322564; x=1786927364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MkeqS8Xm/u/rmFehJE2DuhmOxprgWDkQayQ76BCyLE=;
        b=Ix9CCDWhXuOhpImCXvdJes26lSRpOkozTtpNUcBTGdLD9GEi/+LIXVvicDQHDV+Sx2
         OJx/cnIUT9mlVzzwUMv2JJozIaMXOoVS2AO3cnXHIxaOTcJWRCm2QimpK+vP1r/6lXDl
         EDqfD1+Rf5bC6LnYEa86ODjryfhd/Ysw1HtxJFsecRDPP4U7UC+xzkp5gD8zh+T0YjNI
         /aMiDmTnn3es1n4pkE4D14bOQi1tya8t1NmMKJ6DXAhhMZBQYE3L02oj38sMZ8O35mcw
         hINq2QLux/mDgQC92RrRGpROc18DKX3835fP9Ehc9LUxorTS2uP7SKn3byVKv3lPAQAZ
         HenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786322564; x=1786927364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MkeqS8Xm/u/rmFehJE2DuhmOxprgWDkQayQ76BCyLE=;
        b=d9PedFXQZDmR+NkG6p97vxotAmOrq/1wMZ2+xNZhjZRP9hScF68JOkxb/pZWergguI
         5iiQuC+NOLGLG4CtRZQvAwkHQCEW3+qbLlcTHMrOvP7MxPkGPh7dmDqjEy7DLMyvYYVu
         7wdb5njvHObNUVps9y1rfJNdtWCmH3nsnuFEyFYOlp516kG6FENoRsjWiyzffhUbuVyj
         pbXZ03H8iE0mXN049g6xw+t71QOtcXop5caMvyp9b5paGDvEo1O7r/M1h1sVqMcL2thI
         Ifz1yhvr3qvB6vyCmKo0yPR0UeKcKY+/KWprzL3Wtf4nsCtuk5X+fbnZyL2C32yXYqji
         qS0A==
X-Gm-Message-State: AOJu0Ywy4nx5yA7OGI0gTQTr5jpOxZW33CPgFC/7TaylVV3WEJy8Ke2J
	Xb6pa/voJAHf43525Ov36pIeWlG97393yziJ7sYl0oKf0q9gfTZ1SgTug8qNpssdV/S07wmt5Mw
	im6E2m9U4WF7JRNK1eN6uZ/LCIsacbs8N1tTj6XdDIed9lzcBcZAjv+Km/75xz70=
X-Gm-Gg: AR+sD11gWc1AjxfZaQTlbCrZ1bWBWYGmad3ylPUk+l28InfDTSzdyjYNrlbncw1Xtxx
	niWhMYcr9gdtGaLioso/MXJ3eGKPiGPwYMgVGUQwKrj9RKS/comURHrHvH/0PECJ2pMNc8suWNH
	lCCN6I+j7aqIVCbFR/+nHVoASc0BhNYJgvH6EpNwPP68epfS3va7sXTyzG6LETRRHF18cSft7yF
	pT5rmo/81Yi3KDsISOSEeLN44wuzXbC6bLH+HH3hARDrYLVV/pUeiLqkgk3S7tbICnEuWKRD8Lb
	BUJ5mA0tLx9mFj8YvT5iGnBPPKah0SpM7hXnvw/Lesubuwd8KhnpAw3pL8Ep6S3beda7K1MAB7G
	LfM3On+DCJWZgx3U97Bj5hfLhdyxXzJ2Crzev0c+7rk6AVds62A0r2sjlDUVMClvVrav7SgKR6B
	LNfBH595ON3UCJJg==
X-Received: by 2002:a05:622a:64b:b0:51a:329:e802 with SMTP id d75a77b69052e-52d0b29a339mr256082641cf.41.1786322564145;
        Sun, 09 Aug 2026 17:42:44 -0700 (PDT)
X-Received: by 2002:a05:622a:64b:b0:51a:329:e802 with SMTP id d75a77b69052e-52d0b29a339mr256082281cf.41.1786322563756;
        Sun, 09 Aug 2026 17:42:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3d56sm1679742e87.69.2026.08.09.17.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 17:42:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 03:42:32 +0300
Subject: [PATCH 1/8] dt-bindings: usb: ti,usb8041: document the TUSB8040A
 hub
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-onboard-usb-v1-1-08a805768328@oss.qualcomm.com>
References: <20260810-msm8974-onboard-usb-v1-0-08a805768328@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-onboard-usb-v1-0-08a805768328@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XH9q/y6n0YYgQgp/Q2mx0eNIcicMKwlLjlTfyiTRa34=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1alXPWLGz5vl9U+WrOVn3VPMXPVIjmhexsP+q7mzdwty
 lwgNnlWJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmsv4cB8OCgC+/8r8HCt0W
 cO6K272jM7S9o8FhlsjKLGc+y3aRWU+X7OhoaNvusP2GhW3z+zdu7XIrZ2Rfq07ztjM98Ll8sYP
 yAWs9HufNwht/6qnklNzga9DpfbwkIvO7ay7zuZLJlXO593wKTbA8xvtt/k+RhYn+118d3bi+ec
 IR0xeyczX36/v8WjQ/XzRV/vu9HZlXZBdKvWIvb9aKDGneV9zJLCphb7fdpJPvnbZF9teVvVHzR
 d5e9i3ne2JgpvxNpyZl6sfpIc6WbacvCt6xMnJI4Ite2lYl/cavXW3H2oUGoRGqTTfZZGI6a/LV
 vQPOZfoyB0bvOGb6kLew02F9svWldf6uiyrPbM7JfvwcAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfXxgCGASCuya67
 LKJ8EV6SK2mUZwVRYbyHBjdSNvDyWDwSPnz0tV9YDP2+uj9jBBY2roGC5krMFZZFiCWv9isDW+a
 dVtGltS2b8WkXIGDo9py+th+VqxfsOM=
X-Proofpoint-ORIG-GUID: u0tjAXkU5YtrNz-7WwI4pQ9A3CvFKZLQ
X-Proofpoint-GUID: u0tjAXkU5YtrNz-7WwI4pQ9A3CvFKZLQ
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a791e84 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=8f9FM25-AAAA:8 a=e_ZJ_HNLQjvR_73SufcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX/hGZtZAI7muk
 hlG+GUG7yTKiXOX0I5hvI5IyHGdMLOrgSF7YeckZEHB7vqogClDNJ4pYimRIikenYo+XeLydkwC
 Kv66gP+SL8urhfsWwHOcbQYK1VKi6u7U6/M9N0J3cznUupgEBdhkcmtY3nmVMdTZbJiMLev4Z4x
 1KZUgCFZIlkYhZ7qEr/v/dAx6OqGCrTbCrj7QHG5ADjrHtfuNVDUVkKqk50l8B7IJIsrVthjJA5
 7LTLpmsfGB1YYVOSQUn6a0cWqeRuF/pwHCHsyfRQP4JZx43JGC+K+knS4XKFWD1DTBHPPRAGbsd
 BG+djnaYkjWqAXlVKtAjSvqqsH8Wc5qvxn2hSV1CcGREdunSkFTVW+C/jBcTHFWz/r2D2WKP4zs
 9QUgkbibYvRbHxBPQJYPKkfW3z7fxfiHGrh7bAl/ARda9U0FAQNxAVr4XKHnOb5U/IEIwvaRlkI
 eMO4vG0BuQ0s9e0GSOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100003

The TI TUSB8040A four-port USB 3.0 hub is not documented, so onboard
device nodes for it cannot be validated.

Document it next to its TUSB8041 sibling: the same reset-gpios/peer-hub
properties apply. Besides the datasheet default 0451:8040 / 0451:8042
IDs, also document 0451:8041 / 0451:8043: the configuration EEPROM can
override the product IDs, and e.g. the APQ8074 Dragonboard programs
these values, as seen when booting the vendor image.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/ti,usb8041.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
index 07e13fae640b..a7ce487090a2 100644
--- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI USB8041 and USB8044 USB 3.0 hub controllers
+title: TI TUSB8040A, USB8041 and USB8044 USB 3.0 hub controllers
 
 maintainers:
   - Alexander Stein <alexander.stein@ew.tq-group.com>
@@ -16,6 +16,10 @@ allOf:
 properties:
   compatible:
     enum:
+      - usb451,8040
+      - usb451,8041
+      - usb451,8042
+      - usb451,8043
       - usb451,8140
       - usb451,8142
       - usb451,8440

-- 
2.47.3

