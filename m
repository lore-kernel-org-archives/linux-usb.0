Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AB23A7F58
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915089; cv=none; b=losgdOOkNYRDiPLQgczF4oAixiI0xfGb+DQp7Az7JPilxA8BwhnPx7jJAWC7N0+pntRwLmpZXelWnWiJnxGEwxQdbg2t4mmkWxYa+m8r0CQeQ9uhyk+7T7mfgxfs66/2SMKVvNLeN5E7do7ud9UsnbhjeHOJxMnpxWx22RWXsOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915089; c=relaxed/simple;
	bh=h/yNVx0gWXcuWfLOkCoNxXjC56YQHgXEI/4my94jYpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIFHojBo2GVng88f71xSNWvs3uGa/mMIHL2FYK5nLIS1xZCbY9sLBArJkhRF+jGhl3Z/85YYeVUWMYyZDl8fu4gj/Hrnl+IZGGtwhLA60SVa3yUWAA2f+NAGYiEA0QDplxZ2OjiPaxqx4ksopWL4MtTp1roSqyRABjKK/KyZ6r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asZO8Eri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GROP3MMy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asZO8Eri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GROP3MMy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBo1TZ2761263
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTQrQAtTU+Kos/svZsjkSQ/F26nzo7ySCIF2BAFVgi0=; b=asZO8Eri8K2BUbig
	jmKKXhn2W61X3JJnxcyvSlvpYRq0TkUf/smABB4S5fC9xtBPaWsXCxNGwHB7lO2w
	2rPhVzIhFkCkIJuqc0mjvstgU9ZRzRB4mgyiH6JAGHU4D5y6FmkTQ67lYy/C9wY8
	OC1ZiyAug72P7Dk+gWxjGqBksNlbAd5rLWuSr7xcbzZhBYrUSBlCP1m3oFamkPpA
	RmQPdrdqkYClk1c2IDnYPnrDWyPDgsCy3zf2a502vc6VaiifVXeyyqm719foGL91
	Dzm7z/CJGOyYfPavZya8K7JCl8th6FyIJaALZbP7hEGF2XnIiD/YlfrhyWEBbF5l
	15BjNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd639n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:38:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a01d1d1b6so355114085a.1
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789915083; x=1790519883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTQrQAtTU+Kos/svZsjkSQ/F26nzo7ySCIF2BAFVgi0=;
        b=GROP3MMyMmKlGgy7svpS8XZ8948O0i1YLTzzHtdasmTpsQAvpYuM0OEdYnYRflasrH
         d3fIOhC2qXjRcgQO5ox5CUg7LwBT/CUArhQrZMTMRScKcToV/VEbcpfxPCVAS8K/dfK4
         EfMKDdROHn2euv3h+gJN+YQtce1jlYFKKFdacckiglTHNJxnSL0TR2WW229l/sy0AQhe
         oDW9YyAixdQsMgHny5Td1PzsFxP8BwxNQnu3TKi4tGgTlFModT7Ah9b+3DZtX8y8h0D2
         ZekBHnDmcuHrshoXU7C1WuilXvQLKRcdgQfvClb5+fWIxWyKP6oNJ/1MlpTW7Eaw50iB
         JFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789915083; x=1790519883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTQrQAtTU+Kos/svZsjkSQ/F26nzo7ySCIF2BAFVgi0=;
        b=e28c7sEJVqdzu6EXTZDig4TyvjT/GXBFgfbcsX/w/nqY5yICrQ8JLIhMiVgEtylPUc
         I7WanzfOcvlNSxJJuVHxHqb6TKunMmZs/uhn8qJlQI1FtxybufgJ2DUFKsWNOvB2riTa
         M/Lv+0bqVll0vznlLz+tMmZLOXM1BJGXqTiM+neJNYrRateeJJG5xNZSeI6ZYHoMoc8p
         VIvV3veV9F5JYB4Yvc88DE/0K8EsMJhvtRrnk2ZsTg9Ht5GCtV21cKHW4x+cqMt+sBbZ
         KZkrUXYy9Z2Q8PiuCi9kqOP/k20fRMPAlbL8qa7M1wHcnBIH+RZ66Zjktihg2a3c5wDC
         yJPw==
X-Forwarded-Encrypted: i=1; AKwUvByaDm0B02ZjYFBPeafC1W1sXhgYjg/RyvWl3MDd2N24gV6753ofXoU8ktyCxCMtmk7RI+OQ0CwH41M=@vger.kernel.org
X-Gm-Message-State: AFuF++nP72Kw/0i1B6wdGSG2wexjJHRPBZRb43f+2I5SxybvUxryTgyd
	PDYnu1Pi3UXgMg/VDzgKTavyS5k5sAhRwSXGG9hAnhFc/Yvbn0dxZYiIa02e6dpc/HKi3YMrS+g
	29uIwtI0ndu3bN2QLzUKkpca+suyZRanb23/lHWiSah+8QVHuXq86TeepPTqgUzI=
X-Gm-Gg: AYBFou2XaeuI4+1t8gxGQrtx8YWQys8tNJ+jNBxoraPLn+nWQAGU8tH/kd2zTtAVLeh
	XNax5VWLL5P/A7KsZh2pY808Qqr5gOVFVDXyv5lT1ZM0Csq2DygFz9QxDJePFGUiRioPtQbrYwG
	k3bZZOwn06J4Gw/KenJXjETQbLTMc3gxSq/Xs7uk3UUl0cDONCXsL11jfHKbxmKB0iUOH2thGNL
	2rVFrGaAAS5yoye+zFHks6KELKo7+qTb53QzAIApQ1P/gg2dAqfy++BVupolg8p2Pnx62ihlBvE
	t9NTRsYz0+Fy76vEHwgJoSC1juXY73rsCLgRXxIGkSJLaXFdRShWr89Ctut0c22W3gDOXmzAhCZ
	/nipm93XwG8s14NsIXhVGDruMB05TwIbVV83LzfauEE/vuAzyoNWR1ASv8nAOtT1FwcRCTBkFgc
	yM/NAyLNnXQ3cP
X-Received: by 2002:a05:620a:2b8c:b0:939:6dfa:48fd with SMTP id af79cd13be357-93bf576bb71mr517736685a.51.1789915082950;
        Sun, 20 Sep 2026 07:38:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8c:b0:939:6dfa:48fd with SMTP id af79cd13be357-93bf576bb71mr517734885a.51.1789915082548;
        Sun, 20 Sep 2026 07:38:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c78c1549sm1251055e87.4.2026.09.20.07.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:38:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 17:37:56 +0300
Subject: [PATCH 1/2] dt-bindings: usb: qcom,pmic-types: require one of the
 VBUS sources
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-fix-tcpm-vbus-bis-v1-1-cc9347bbe81a@oss.qualcomm.com>
References: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
In-Reply-To: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h/yNVx0gWXcuWfLOkCoNxXjC56YQHgXEI/4my94jYpk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr+/FmSa0paJW2SMhMidJAR2I17cy56sYe13SN
 f2tbaEM3r6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/vxQAKCRCLPIo+Aiko
 1S9LB/9AVciQAdfZfetcblevGwrpZkzXRgAjAhVB5bDrbPFjdLrR9SmcLIqsXHn7lWdIcaFpkGp
 k8iLAEN9xVJKy4vHDX3tiUNy1NNPRXAKJalUKfkHvfKXGlj9ssVWzUscQQHP2JhGmPFyhbrWrl0
 YTOit4sDbVdAxTWbU6ayaZsjK/vF7rKHD5FNu+PISqi2r/Sw49caI8kB+DXJysCwM4jn8u+BO2S
 3YUwVPkk42Xe2XQhFjH3ZD60L2+f3LBaBLxddMlEHukV52j9vmCHzsjOTsaatd+4r2qvYaRCpWJ
 uzsUEanfLJaXkf57UvhjRsKW00PcAmrDtrLUcWG/u29ZCwn4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfX8FJviEOPwFSx
 yGzcpYfSTx/AWC6hnes375ADkx6X+Sj6wk+hXHkjXMxR7irdC5LW3yJ2qN07s3bNmpCTZjCv+wW
 +KHVTYhP66l2l/FDqQia/wr7oIXp5wsoTwFH4chflkgyO9n8/AY0YUHM3afO7+eDktu5877TpGv
 fHWvliW7LDSfuHxbC2mwyre/ow+EX9FsX+1kLEk9tUa6JH3BlIj1HDr/S4MbZ6nplLnkBXuHzWs
 nU7TS9rdQK0KIZauxPYEsjYPoZCOfQ2V3Z4PFtDHTnaCQymivAJVuImP+W2OMbQ1Sxm5UympAyA
 4zXjhFb3WWcc5uGohfdsu4dj9EhiVe+otJ297sVdMEK3KSgPu0VxaRmIkMVC89/6UiAENl7Uxm8
 f9BN3U4v0uIKZSA3LT7mL8aIf3ShaSFMNGV5tM6Jur73AydSJbsFs9QZpjSrDPAP9ZTbsZshkO0
 CT1FdLNouRLueOnXl4w==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aafefcb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=RUh9Q5Ta6TeXDu1yFH8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: z_qcMkDXQixhZvrIKQbwRE9FUCitxFxX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfXwwOcXnlZpRzk
 sekl3rPeqvsMY4JwiGZ2XVBeieXbS98QcNeSBD/8FF4ZJ+IwroRmGnzTBuOE/44G8lC/cC/UdVt
 dqofo4NmBP8ElsLmILOPptIHkc0hXeI=
X-Proofpoint-GUID: z_qcMkDXQixhZvrIKQbwRE9FUCitxFxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200212

The commit fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate
device-specific VBUS") deprecated the old, device-specific VBUS supply
property for the sake of using the generic vbus-supply of the connector.
It also removed the old property from the list of required properties,
so now schema stopped requiring any VBUS supply. Add separate claude
demanding that either an old one or a generic property are provided.

Fixes: fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate device-specific VBUS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index ba790c4488b7..db487562cec4 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -91,6 +91,14 @@ required:
   - interrupts
   - interrupt-names
 
+oneOf:
+  - required:
+      - vdd-vbus-supply
+  - properties:
+      connector:
+        required:
+          - vbus-supply
+
 allOf:
   - if:
       properties:

-- 
2.47.3

