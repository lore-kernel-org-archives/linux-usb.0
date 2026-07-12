Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7046064
	for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 17:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783878531; cv=none; b=lAaG0r32kN/gSJFYNpiOjMCZpdyDjSlkANffIs9BvpBBcGXRqwcQiG11pDgPRh3eSnK4Wl4qO8jmZDhKDHRg4YXWwa1049WbaERpvHpqb5K6pwVJ+tBKhogVlwtSCxlVfGsNSGVIDkXZxTvTHqQqwsJ1oqFvVJHnsPdBC23EcLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783878531; c=relaxed/simple;
	bh=VJcjUXbtX3f4WSQdzSuuHqAJhBkkCn09H/VEJXL+J0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JdtoWVS9GfYLStT4PlSJTDY9U7n9WhdsCYgIg+VtlpZdgedJieOnh+rrYL8BBomK3nOGqFmmoBj480HpEvEKJK/NHyf5rAAqDFGW0EXlro7L4wytffgwX5zRs1D2q6368b2IY6K8coCkYiZaPscjS87lqHt6bOZdWRBayqnCE5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPHzvXwW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NX/Lygjt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPHzvXwW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NX/Lygjt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CGrWoc3215766
	for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 17:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uLI6dtiwQ0bBLx8SDV3mto
	Bn+506m8hldEGF6Ztdkm0=; b=bPHzvXwWiaAKVPDv4ta2X8s+7mZHmGqHl1mNAW
	sNuFOsZt6vXR5ArVIUJGgLE/npraVV56Puf0N5SahII4H61d+Hivg7w9Z8lYYzHp
	kwO1OIkhVGTwxK8K5Cze9irDIoVpFjnIU3RlUosxEL56+8TQjnRQldu9SakfIOP5
	rwFLAfU/gLdpj7miQUeJMwqqkiirpdDDIeZI+ymrx+nmacoYC3xjAhK5mDvt8mJK
	wJu62x7NmW2gSPJweNaPeAnhvEII2T/Br0PXPH+A2AGHRFMyLW1FidB+QQqiMiew
	iypx92G7eB+nh0TkZf2UCx8L3aHRDiSGRHPt1jHKVWi5RR1A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeafb71n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 17:48:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9667280edeso3286562a12.2
        for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 10:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783878529; x=1784483329; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uLI6dtiwQ0bBLx8SDV3mtoBn+506m8hldEGF6Ztdkm0=;
        b=NX/LygjtITSMRU8iAYCDoXIaCR3VoyfLMBP7R5SlpZtJBoUUnVoXX2sEcvegZBn0G/
         ixzfPj1Z4ZevW455Q9wrqVNgAmTFqpOiAQPES7OK8/MYaEXW6hFcRQLM8anF3V4eodE/
         fCHkRN2cuWkIXmHYBz36NXmuV0KX2KU82LfKC0+vx+LSciq2SZpVhYvuAy2gWcvWzrFe
         nDbTLR5RDHJ7HNhJRqroZRlVkprez/9McBLKpQSB9WfGpFAdWTOl8iZgPXBVTOENxB6W
         KQi+vF4ewQC6kRK1P5ZysC5N+YyrTiXDf5ayg5aVZmpjkJv3MUZlnpUx89xO6wU+fpZ+
         6eBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783878529; x=1784483329;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uLI6dtiwQ0bBLx8SDV3mtoBn+506m8hldEGF6Ztdkm0=;
        b=N6Lb/GfcorHPQxDZeoQV/SfJiWAdWsP3mjYGy2cjwrfERKJ8orSQyyMufjkXAX29nj
         TtdrDCkoMuNpGOXan3D+q14TjZJD8vzwJD8cwPpM5nnEznUK7804ovGYKNnHCRcVInAz
         EY6mbRpkY9uCpSONj9y4olvNPeoZCScnkDOdWikSU98qvzh7w5+ZnNnm6rB25NDt5CgD
         4BAML0s32A/4B69ckJm+lMW9MJCdwRGDzh3IQG/hMW3fxFPldt88HIJxMHoiwYLOaCRV
         73kBsdRdn3R8Qd4+dCbYOg3k1iQrD/CwAJkoF9iFPO6xATt/n197zIu6lr+XkVgwIP07
         OeEg==
X-Forwarded-Encrypted: i=1; AHgh+RqRSUrLq/WwgC4JSKTcEeoMtYO8SS6749AQ24cRFnrXtsLoVUxgPgfDRxRo4vhU9Rd3S5pwkyPkG7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNUW5MDeR8pn0q1wPzh/1+blftCOSuHYhrB648caouq1qAV9SX
	3DL3SwTx1qj3pqIfrugg09HpWlrKtgqYZRd+F6a+298SkwzezLhon2a7TpG5RjDKxBSPYxF5zw1
	FmuC2jXPsJTqIZ54UeBK3wTEFvd/0kT4dKGXYSBl9PPARux3ThctTrjHwjMoop8joI51NaY8=
X-Gm-Gg: AfdE7cl48SBvRqr3owBdOU6k/NxySzxBILyxL5TVgTzNA8psHWiDm0B9XDxDW7bNDhP
	k44xXRME/s/cRGK59KfI9wRdP295afhAQG1k+PNiqLeyagWbYG4E3i56as2eB8fCsJnsGfbWY70
	Q7kOOEQpwzjAE8YdZcAJSDdA57T6FD8+EuiPMOpv48jsgqD76/iiAOxBpYAoW9JSScGRY/ECTJD
	SB8rh+OyrIALY4r2UUGgabM/daYZbdmMdl+N1a/vztmE6j26SLWr7by8jSH5nx8iunRxVylckUZ
	6yEb0HFlViB5cNSwryt7i5A/gTg9qiQeTYUkgXpqGCx6e74c7H/TbQY2iJg9fnwE6ZuH+z4TzFp
	+guNoCd5Sx7q+m83qUcJgIRXO3Y3d+8URfGt6oAAgRIY8mwK/wQsckdTSeLD/hOnJZS2ft5yIn8
	508r6s
X-Received: by 2002:a05:6a21:e584:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3c110a47008mr6050713637.16.1783878528660;
        Sun, 12 Jul 2026 10:48:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:e584:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3c110a47008mr6050699637.16.1783878528239;
        Sun, 12 Jul 2026 10:48:48 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b987fc629sm10369954c88.0.2026.07.12.10.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 10:48:47 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 23:18:35 +0530
Subject: [PATCH] dt-binding: qcom,snps-dwc3: Add Maili compatible to
 supported device list
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-maili-usb-dwc3-binding-v1-1-fd6697fa1e21@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHLTU2oC/yXMQQ6CMBBG4auQWTtJKSjBqxgXTDvib7SajigJ4
 e5WXX6L9xYyzVCjfbVQ1hcM91RQbyoK5yGNyojF5J3fua72fBtwBU8mHN+hYUGKSCP3wcdWOtd
 vG6ESP7KeMP/Gh+PfNslFw/N7o3X9AFp4o1F6AAAA
X-Change-ID: 20260712-maili-usb-dwc3-binding-9c2d4b70953b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783878524; l=1581;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=VJcjUXbtX3f4WSQdzSuuHqAJhBkkCn09H/VEJXL+J0M=;
 b=kinRlM8Q7KyFXC9K6ofEAUKJd+qvlawCj0u78m9N4+eSav+8r9Lm5D5HhISbJqmQiXoDsRsu9
 CqMxIbUPN+OBWwPTsH3Xr7Rh5m8YuLLtcWXehZNfC3gqmEFIEcaIUS2
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: A648bOtjNuMWs_fiKI-5rlPqMwM3SHoX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE5MSBTYWx0ZWRfX75KAKx4NmDu4
 zPSNJNh86npfXQXtybBYaMlHwI0mrWZK5YDpyDG4eyW3TGGg/PwTTpm9PDzQn220WTbrF/gQyR9
 Kl7EZwl+el9HyNbt5RcIkIX2db8qMU919AwF4l+HIZKhAiQW0vAOnY7JVrqSXyx5AfktHPVswfJ
 E01IW8gC4F+Jqsu7fFHZ2Du6t/QS5+1xrXpubCmBiMmVIx8NtqfAL8VHMw020VhoEslXzBa4HQw
 Vn6SfkF3Xw9SO3B3glIHWCWxR78OgJlDkduskhLIWPtvkq7dw1Pu0BqRYrbXH3ohN4YG2SYIP3l
 WtFnr4OidKNSQxDHTjcPFQG0h/nD96CPyZ1tBU2cEcI7xoqPDJqQIFRTNOM9k5f/Wky/fWJvmfF
 IjfdGpiwAdxggpZOhWSgl/OWTs6sjy4Udu7BAuIK4DWeEMBIseD7q31DhiJ1slPVM8BX6RljY5i
 e3ZNzg+TRHPMJjQZA2g==
X-Authority-Analysis: v=2.4 cv=O5MJeh9W c=1 sm=1 tr=0 ts=6a53d381 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-cuiU98Imdfp90X4gAkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: A648bOtjNuMWs_fiKI-5rlPqMwM3SHoX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE5MSBTYWx0ZWRfX7DDgEhxjbqzE
 fwnjtZfBelU18mqc32c7kvppkb+qm9EYkihq9DChqiuiLaNOt+mrcDodlrZOQlgf9SzIdYcJ5HA
 j8cWqLFC+ED1he0YSs9fsDFCmqJIejU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120191

Add Maili compatible to supported device list. Maili has one SuperSpeed
USB controller.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 932d7aea43c5..9eec07dd33de 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
           - qcom,kaanapali-dwc3
+          - qcom,maili-dwc3
           - qcom,milos-dwc3
           - qcom,msm8953-dwc3
           - qcom,msm8994-dwc3
@@ -208,6 +209,7 @@ allOf:
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
+              - qcom,maili-dwc3
               - qcom,msm8953-dwc3
               - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
@@ -546,6 +548,7 @@ allOf:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
+              - qcom,maili-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3

---
base-commit: 1db5c6b0b9834aee2f14e39764becfcc29d09ccf
change-id: 20260712-maili-usb-dwc3-binding-9c2d4b70953b

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

