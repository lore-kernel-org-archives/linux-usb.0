Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA103A875B
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915094; cv=none; b=OOlneYGe+Ov6iZmxsGRVKyefHPE9W1YCNSkohWmXoohEpirwGgdTmTH22HH5YR6DX7eTZJOikKEMkw4QwRV8cP28loQoE0us/xaGfwHnVx+KVyAcD890/2Yg2TqPozw8b5Oec5yzXnL2JpG700wpLGT16x2wPz8V2dkVaqLwlbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915094; c=relaxed/simple;
	bh=nKcYhq9Tt6Q+VWNEVhdoKYzsvR//5tXwwDCTAB3JF7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ji825gLWxn0heH5Aa3gwXNdLJ24054JiKVvNbGzuG8LVSlwKzVkekmH+Ebsr/SqK3vVj2oGCKzi9mH/k+7TfJOeCudz7oNLs8YTjDvsNlgsPThETE8QGw53kaXCy/unG4TQjE0+kX2GSYFrINDbzoE8tjEkmXIQtqeZF/8+RCo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPo+hAMt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5bD3Cmy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPo+hAMt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5bD3Cmy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBo1RS2910100
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3tzGjQDM/jrfxY9zsJ8dD0yImoczDIdSsUt0WrKXjq4=; b=HPo+hAMt61cYwnI8
	iFbp6Vwf+eNTtdk4JNUK4lUrI83KOfuNr11N080OkUXMe25alXXSoCQd8ett7/RV
	1EGgHvzIrDUQ2JKvTVZYIzZ1uvS65r0iH2mhQd7RivRX/L/uU4E/j6ihD6RY4Kaf
	NpDEsyGPOV2n38CYu2kibGHfReY6hUZF7A2kixjMlYVwjaYaeECo7ZnryE9k/HgA
	8IQBtbDTHaUVTvlH30EEJXU4NEAu3msni6cGaQUDpFAd7MZWQbrTeyL5nEV0XMpL
	Re8oME+yf3h/cBLO3RezOtfxtTdpPjbe90wFTuaP+hcTagSA7/vGIaciW1zWB4YH
	hnbtDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxu7es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:38:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939c30aa9a0so204784385a.0
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789915087; x=1790519887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tzGjQDM/jrfxY9zsJ8dD0yImoczDIdSsUt0WrKXjq4=;
        b=V5bD3Cmy5oA4rudAQQPRNKCI9osop/My9K+9qs9fqaqw0lZsya7SbkntcyEa5IypLo
         Me69ZWjzsMUAFq1nsBFCJyVd/+XC0RhTt4wEgSlJHY0asE3q+jvsFy/ONOSVc70bWrhI
         GZSekeAnwi0mDKHETaEu582gpDNK29QI/gYl0b+qP61cEbLb9NNM2Gr5ZA/EBk5xgwWH
         oWGlxgR42Sxl1g4jiP6AGctx90uduAvq7jsioTO1sBd74MLSKQwtyEMj+8JOlSmZpPBf
         QaCqErLh3kknCnrrL9vu0KoVGj1GoXIBkIqEOSlg1oilnw4kKDoqCBfedcCn9MHmm6xh
         WbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789915087; x=1790519887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tzGjQDM/jrfxY9zsJ8dD0yImoczDIdSsUt0WrKXjq4=;
        b=yxc/D4lKJcTgeV6pbzgYUHKwzzH7uCEI8QvC1upSCZ7cJXG1YaEXx7EYcCECaYuicS
         ce2546g7k6zDU87N2oneMTgpg5KomlV82dcF2Kbooxlg6cGQrrJOiDC3CNU0ngJxVgD0
         17729BU3hRr30HfBAegVsMgQtY+3XdqFATvOgO0rDTQ4S9Ws99pQD86F+Az9HJtnWowP
         okXUpA3iPsyrbRukuN5xLUP+/PmxTQjEiC+5YQPujz/xCg+AETx64fnus5N2A8LFEtu7
         f5Yviab4tdM7S4jVZb4IcfiTfmKWQacCioGoaylybvqySJaJ8XHuRh/FsHzbwbkf2/0q
         FqPA==
X-Forwarded-Encrypted: i=1; AKwUvByO/UNSZQK9yGnKB0qkVcwtBSbaNpkKWq20K4Go5bvjUHXVNmL35rJoGZylbZ31+/NpLlYhM9gn6hw=@vger.kernel.org
X-Gm-Message-State: AFuF++naIXeB+tHJoKNh0pD27DJ/SEUoonmJjauzWPj+JWW9Kj5AlPpX
	RPnaojcMoYhCgeRP6Qa9K4UzqMFr/rJyCaVdNUtL3AWQ1+NzizIKw/qHIT6E2+SCH6zPpcgfWKb
	zAAWf57Yn1LnLvb7Eu78j8qyZDLNQ8JgBJ+LGrtFTPbFMurp1Qgb2mw0apoXwirU=
X-Gm-Gg: AYBFou1C8zuaT+sIC3KhmTwmXDLy0VFF0Dq8kT+YZjIxWgFrFIeAuWOpqiuuDeYZpp+
	pSlPqiFjr/Q+mZwh8FkebT0IsFDMwriYWO2yssj4Unbqxu/AYvDehOar/v9EA5kxYAOH5inPuaN
	56iLTaIt1PZP54Kxgg/g4aVf3pTswgTSKQMFgIB6L96zk3VNtV4Ank+QeInzIjL9Qrp5CI9Jqet
	ZlBNxneDaBRgPslzE4YJjv8qGdlR+PzJslYY5L9/aVNlV/UcYsErsOmS2BbsOAeAWF9uaqPuQAd
	t5/3N8v9Y2TCp6uIEpDLh0ZKcdn+oK5BUfW7c/96bPm8M0kkMKjHTTDLmQ5y3VJAltpe8Hbxo5d
	oXA2FggpMVs3XBzPGOWoCnEhrKmxrbaRNvwIiot+bR4x6Ex0Iwi/p1oQ/1KKcLNLXNi2XOoQF3d
	c3JrGOorS+FALB
X-Received: by 2002:a05:620a:1a24:b0:93a:48a:167 with SMTP id af79cd13be357-93bf572c8f8mr579909685a.39.1789915086993;
        Sun, 20 Sep 2026 07:38:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:93a:48a:167 with SMTP id af79cd13be357-93bf572c8f8mr579905685a.39.1789915086466;
        Sun, 20 Sep 2026 07:38:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c78c1549sm1251055e87.4.2026.09.20.07.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:38:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 17:37:57 +0300
Subject: [PATCH 2/2] dt-bindings: usb: qcom,pmic-types: make example use
 generic VBUS property
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-fix-tcpm-vbus-bis-v1-2-cc9347bbe81a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nKcYhq9Tt6Q+VWNEVhdoKYzsvR//5tXwwDCTAB3JF7w=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9b690d332RY+Odb43v/2CMarcFSh4vkxbZMmye6wkInP
 Xf1wzmHOxmNWRgYuRhkxRRZfApapsZsSg77sGNqPcwgViaQKQxcnAIwkVn57P+Dj6S45d4rqvvZ
 cjBrT5zAURGjNTHKZhsYj/uZtZkeWGomU78y5ujuQ77XG5+o5d5OlmC7rSOcpTtT2V50uUScK9O
 BLr7ypZ6zau5WFFySORmbUpySVMJ3XNNKcuPa+sx525JLZj+d94Ox0POUd2qFh+NS75TipeEM3+
 6zNzxJspyzbvOC9hcOTEyGV2ouWIQ2bq7T+BHyfcLpl2dlfaV136/Y9VFQabflZZHdQc41l1dOk
 bNduv+c44+tDsIJmkELfZ+xdgr3xb4+YRn7QdLOjC0qtd3LKfNftVLU6/l8i0rEDSdE+0ycldfU
 7zrnfEqwb/3bx7e6li4qOv2k4b27M2PtMlfbPULRLSqXAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6aafefcf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-4HvE1n6-quVXk9uR7wA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfX2SAyu9fwv4JI
 53j8BKpgkcb9KofzHpCc0JMP8r3+ixA4TNgbFxXPuS2amhspJHtjBlm1LEdU3CBwTncHola/hBm
 NMZXfREta4FG3evv6fA0fJj9IWqkw9Q=
X-Proofpoint-GUID: kYL8PEuaIjhUBkwuq3FnHNhuCczZjFyC
X-Proofpoint-ORIG-GUID: kYL8PEuaIjhUBkwuq3FnHNhuCczZjFyC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfX8vPXtz4PFDBl
 oMleEtKC+7oAGi1lCYTv7mUlVtHdli3oAqE1LbxdrVpoolRIPv7M48GM7cyYx2R99blP7N2EWTX
 O+w7dCJKwDUFxBYvpwGHLh3UIjLXIcAxmXXCt8FhgooBMqaUMkfFGJp55KJuz6PXRuUqEDdyt5+
 Bam/ZEVFnteLWtsDtYaQnI0xTXCCl91+bd8Yn8Tzf3ZMa1v+NiUjrdIqF7TPPDG5JIrItFMxlif
 mU0LJYmYDfvwdk9YphgpH2OvVvzjzEutCnAIOvkLJdfjZVeYN4DlAikSun+FJN6do1UuKlF2MYs
 YplK/bLdrCr4Stc8m86Nu8Ta13AkNMWiVA10m3xb5HAYPLohpEnBpl/Ntk6kPnoo6FrCYKtHxoD
 Q0xMiE9Six6Bi8ZcoeV535bTt4k7yAuNP9pshGdjv2oOwO7VyR4HYk8aP5P6XQa77B48y1fWlhn
 tZF6JtKTQpWJv/WW6YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200212

The commit fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate
device-specific VBUS") switched the schema to use generic vbus-supply
property, however the example continued to use the old, deprecated one.
Update example to use the expected style of specifying the VBUS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index db487562cec4..dd56dc8afe03 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -176,7 +176,6 @@ examples:
                               "msg-rx-discarded",
                               "fr-swap";
 
-            vdd-vbus-supply = <&pm8150b_vbus>;
             vdd-pdphy-supply = <&vreg_l2a_3p1>;
 
             connector {
@@ -186,6 +185,8 @@ examples:
                 data-role = "dual";
                 self-powered;
 
+                vbus-supply = <&pm8150b_vbus>;
+
                 source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
                                PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
 

-- 
2.47.3

