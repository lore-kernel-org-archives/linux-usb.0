Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF813C3437
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362165; cv=none; b=cvwvkHpAlFrPQSwvqp37lDeOGQPtGUQKo2uhTiXWpOww3g+bf/dLKQvWVATt8kseelKUG+7bPANEVvlEgT4dkoC7ki4kIwYjPDCxIXT1P+tytUPcWf2q5rzLJs4u4WjxaF4MKHvkJoQ6UKn0e0ZQKmrs6qr9Uwiae9HJV/QMRZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362165; c=relaxed/simple;
	bh=XlBDQwSAvxsyZibxTb7GVapBUaLLsh+xxc84Mnw4H68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gbzp7E8ON110cdTtvFY+jQQCJ+NffRtJ7jLpXWJSs87WGGVpgzoOOVUbESWcaqVideoa2+y5jU876vOviefTIwwbH+BwTEOIPxOj4wYnSjZCfxCQVnu2r1as5ikBsTK/D0Az8rxd2wRd/w0MzGTyuuM87WUCtE+t92i7txkCh8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsKZrXYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHfLGRWc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsKZrXYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHfLGRWc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9pTnb904871
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUTZRW8mXSr8nhQ2D0MN1c8mjSxKCPOnQ0iljovnOU8=; b=lsKZrXYzatNB+Gqq
	X9LXTRe9aDno10CTyhSYeHfQVTsukGhJw3eU09yoQmTlkM6AAWs+pRxFsQAYtOTw
	bZRF8/UdKzggeS2lGNTmIx5kgq5nkg8Ug2WrJAv6t++TuRjyoRiw7XhPMgTipL0N
	Y2hPzeP+1238j72o4862/FRCKF03ax73e7K5E3BVzJTUdM+5UWMKMZaRr7I5CtSd
	8JEfGzEcCSXBCpeGdzMo+a7wYVem/VHPfF2nTr0C1geDz4qXfWlzNqACqumuvqLQ
	bFw0rGyN3ankr0gB0TuMrAa5jyVuJ5lmusAGXwLj8XQ0XIqPWgPHBU4pONlaN6pZ
	2elLPg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqrd1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d33c89a29so15734881cf.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 04:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362160; x=1786966960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUTZRW8mXSr8nhQ2D0MN1c8mjSxKCPOnQ0iljovnOU8=;
        b=BHfLGRWcnQ6RubyhMCp8uU0NgnQqKf7YtoMpzXdYCKEL7nmMQn6tAgSYIMrygJzyc3
         TUtaSfVEXMUi10+Do1umlG6+KAecogg1FgUATr/j1EjaLKQ2capAD2CtM0xPURNXljmx
         flv4aPxMMfOCf+4T0AVtirJjTWbh1DDptKbhVXJqnYXsAHExlM7XAgjNz/5Jak/L26Ou
         jALMQ4I7HT2zZV0WvsmERXN68PhE4Mk4TUy6a4S6NvC9Wm1j1JIoVcVyL6NNEu0CrEGL
         mjgMsQGFUI4ziDFL5i4t+BxN0MhC39+2tIwdsWZZZxI8BnevF0CY0Vog8BFUw+DrYzNK
         Pf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362160; x=1786966960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WUTZRW8mXSr8nhQ2D0MN1c8mjSxKCPOnQ0iljovnOU8=;
        b=HjDl5PHtUzNHoc9Z+h2pOiNFz4YB6yc5MYj5rJkUVq9IoqarmM6RiImUgBke0kze+R
         +niLeAgSsyIMGndAVcG98yKZoKk00CzWRxNcvgLvslPF9WQA8es2do8pWwOsbjX2Txm3
         zwwk/RGgrU0oDGkr1O94pCWThRFfrRxddyT6LF0PjU07AI81tTlj+299l34gZajweOLN
         BWQ99/mJp474osmDYMHaG8C6j5ofT3rfmWPytKIPzOOxVaYcwDl+m7v+DG8/Otdmt8sc
         W6rMW1vBGAQubftW9Q81oGMAqDNIrwPOAj1BJ2fzmCTxXfQatnxLxfcUUvHaxpXsm8ZE
         3E7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoVW+mbsSxIUtZz+W/wS/JpaAp52CfOyscsKoP+YYxsBKP3fP12zVOKetkn7IoSXEd/QvXwAfCWieM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDGBXWgc9EUmkXDokDZ3kvrrQoRX1rW1gYjWXhi8DQAPANxcPD
	TrtfmSEA1Rz69vBeGDeOcm8QcdvDv4yMtjqqyt1jzM9sfVK0dRvl3/z7urYWOceSH47wFpvmQyr
	NNJXR7fzwh2olf0fKvlZqsQo+QIsrzJ8hcjBzXDhfLwOA3sQ3DjrnqCc0mSynuZU=
X-Gm-Gg: AR+sD137J6tSpXonoaDGcgom7z/qE5+ky7+uyv9Q5VMzO4cKO+GpCm6fiUWjfwpdUXh
	ZV4m9nGgU7CSmNgj3fUze9OUlnsx2s7AYoMjjKpjgT8i/Pdouk0Ix6n/VBuc2RMxotLy+8thI4h
	TMX2xJbK/eSLDvx+4/qJs7vhh1wR7+fCB+ntVlAG+lmSVFu0KzoVfeyTAdh0Mp1xWqM2cL88ycu
	s8SVhjoSaHDngtA9YjyIx2v56i4kUyd7rUCuo+qNoBTNOvbVnvE1sHrojTj96hFWwujyEWcp/hO
	GsNS39o44oyZMF18hXz6F9n+n0e9QztBg1NsMMBnxLhbbkc6yKsPPTQ7hZGVNlqWWO5Na8AV5CZ
	wYK2qeuFSlxqaCww9wQiEXQ/Zyk/TBkKWnxeVvKCeJq8Qvv3x0L8bXWguW6kvVH7lVBgETM38eP
	TvuU8Bzcl0F0UMVA==
X-Received: by 2002:a05:622a:138e:b0:515:189c:e0f8 with SMTP id d75a77b69052e-52ce5fc17b5mr396944811cf.17.1786362160080;
        Mon, 10 Aug 2026 04:42:40 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:515:189c:e0f8 with SMTP id d75a77b69052e-52ce5fc17b5mr396944321cf.17.1786362159555;
        Mon, 10 Aug 2026 04:42:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:32 +0300
Subject: [PATCH 02/10] dt-bindings: phy: qcom,ipq806x-usb-phy-hs: document
 the MSM8974 HS PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-2-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XlBDQwSAvxsyZibxTb7GVapBUaLLsh+xxc84Mnw4H68=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkoHJUasBZkSEQyK8qt7Sa0CbTM1HkKPQd36
 hMtY9nvcoiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KAAKCRCLPIo+Aiko
 1XOPB/9iP+0cBpsURaaS2Nk5a31W2huWOTDf6btKzykDGqqn3mcp3DU9H5VLFMaq4MGjOuyF4WY
 nkWzPdUmUN51RIs2HuSzJNfcrJMj2rTLNTpv3ezNv7SEuucpSmjPy8yY/GMwFMGw0dNH0LrfkIV
 0NNSc6qQjEVEqSld9D2Y21LYYJeX2jsaS45feXcQaZ1LLXq4gEbc5xEC8koGjPSkEVUuVAnPLKk
 8bERkIyLr7tfRqwwYzXa/M23qNvqldkuqdmnIkKrmWZAj9BhXZ6bys+DA8I/yBghagcbJpi0s3T
 XmrOCgvsVnP3ucQPzs2W0rWFZ5akGHFaw+TtT3keCb8IPFYd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: O6C_-QvxXPhOGZhUbyTv-s6UGRqH0wW4
X-Proofpoint-ORIG-GUID: O6C_-QvxXPhOGZhUbyTv-s6UGRqH0wW4
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a79b931 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=l4NzwngxL-zSgT35z_IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX2Jrp3tY6hCn0
 1jsdJyG4uHccpdZJTCt24GRKpvqvjXtcz3k5EIvDOZMqcYKMXtCDqQ23Uxfko0C76ljZft73jVT
 KpwWyH6hvZ2ww9XSEXi8qSCO9gA4ZEQaCAA6i8EgkxgkKuE4VT3I9DNjMdsydsMUhM8kfu9/NvD
 79M6u+rKK/WrABI2uP3kA0Aa7F9xcp30/QJ9ZIRpiqzxZ3xhIUa2gUeSfXYROfed9qRaWgkjTGW
 MhG2LLsxbbYT1UAM90x8kFVk/zXlXJGDhb3LaYtBFugAYNQtudRWIoPwQKxL3G+CjeTl1OdePQw
 ocNpweZ+q9B0NElNCrmtkFUQXSwrehuH57CJd19f6SiJDNvvDHDOxu+h3Ida+9nO3X/HpvjtqbH
 9Z8UanADZPsuYqQZEumt2k/qFhwPMzTadAA0MOmeXI3CIzxGANpSv74bkS9nEofv8HP+I6CTobb
 xnN07g6MspPpHCXFsEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX6Ngw3PJAXwJ3
 vbYxrxUedKleMuiKx+OTZKnhbo/GGE0r7VrLbvaq/oPvNoZIcCNSY8zHkPsoKULhVPA3v3eNcq9
 gl13WYSddSS3N0ofQMkcOnqd7RxTEpU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

The MSM8974 DWC3 wrapper contains the same generation of Synopsys 28nm
HS PHY as IPQ806x, controlled through the QSCRATCH registers, but the
binding only covers IPQ806x, leaving the MSM8974 controller to run on
bootloader-configured PHY state.

Add the qcom,msm8974-usb-phy-hs compatible.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
index 35296c588e78..de6f94997d5e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/phy/qcom,ipq806x-usb-phy-hs.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm ipq806x usb DWC3 HS PHY CONTROLLER
+title: Qualcomm ipq806x/msm8974 usb DWC3 HS PHY CONTROLLER
 
 maintainers:
   - Ansuel Smith <ansuelsmth@gmail.com>
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,ipq806x-usb-phy-hs
+    enum:
+      - qcom,ipq806x-usb-phy-hs
+      - qcom,msm8974-usb-phy-hs
 
   "#phy-cells":
     const: 0

-- 
2.47.3

