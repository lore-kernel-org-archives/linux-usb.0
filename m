Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41BC383C67
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 04:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785730395; cv=none; b=EZHQpDUpQbPM5k6ogO3ANqJTvCkp9ShMk+B/PNdr2YyBKO9lBZE9uZhXqME1ikiLesgBYCl8ezQUKBiM4+UtBxzw7iR/8l1pnPmXXRZWO4oADUWTyRNrw4ERN7HP4wr5WuNgJdK+rxwaALE3mGfSH7NQTpb/GuLQq6SUCo/7OAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785730395; c=relaxed/simple;
	bh=8Wwj72HCdXHXMmYq1uFB2/otTQhkXwKZSxFTaC/Em+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fsQIkjFE9gLY2IEMdVSuH+YZjXqn8QyEQYiNXp6hiEgPR7MKkvFO/CBWlJCHIxPLfquN5o9eGM0Bc3b1Rfr1I36dHo53nBbrzTPj2ZzA7N/bW5dvSJYAp3JdWoRvMXewwwGsUKc6kBhaMj0HQlbH4JM+aFSX/99P32JU5n6NlAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+ScPNye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BmuINZmk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+ScPNye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BmuINZmk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LXPkT2212848
	for <linux-usb@vger.kernel.org>; Mon, 3 Aug 2026 04:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lGC2bVyMf3BTWJ3jpK+mXC
	MTLxM/L5ymuNn/F79cBcI=; b=F+ScPNyetJwyHc6Ke5AAndnKX++AHKd+3dU6zT
	25J5itCMZMK0EEkF6L3JgwZ7AwhpfUX3NiZ/WBc2fm2fTiLadBjD32PwF1WcZfzp
	FcaMENHV0+fcwmtjFQaTL6RKg7Vz3Z7p9jqbAOJPhfb0hXXnJqiKrW1LVAm6afsf
	z7D8tubRg53QgqKBJGxPFB1kYMKjvZ8xkePx3hd+xd3AifzPWRFwLoq+AGsD16DM
	OYae8x/oe2dupxhXHcto8oswf6UPNIlgZVbMl/hn4kKyL74ctN+vHLf2RZHoFcsq
	uZvPcMD3rMngGDOlLzCv241ZRcJBqukRUI5sK7VTZoysyZLQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmx8seg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 04:13:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce8a76df2dso51134025ad.2
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 21:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785730392; x=1786335192; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lGC2bVyMf3BTWJ3jpK+mXCMTLxM/L5ymuNn/F79cBcI=;
        b=BmuINZmkVEjCPWapfKG+7GlQlZMj2tTbBYES2/M6QJsp+ja8igrjjX7Metw+8jbbfF
         u0PlwFf9UKgdRyx7GrFtcqcPnftdtRA6Bp9oBz2vD23/A3jSAoxvQkpHetHl9adpzqIm
         lxsRzoVbUA3YfSGvA4fHMMcqTGh2wRiOb9piEAnqvKzDhA22YAzaCiuo8nhaIwtAW1fB
         hXb70sJM7xXfbmvJTMcT3ahbaE3qrL2+kFYRHwliFE+FgA+QRtEpyXYC1Wq7L0SEmjt/
         /z5FAStLBASaLl88OzPWLus9qyu3lqskqXAMA3znFyTQxhjtyNseqleiI1ltAnrxr20H
         WYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785730392; x=1786335192;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lGC2bVyMf3BTWJ3jpK+mXCMTLxM/L5ymuNn/F79cBcI=;
        b=k49QMhI/bNwdnmhkGlgqAhXWlHKMsItIQCdGMjp9z3/Ni0oUUXgdbNSeBFv8+5vU9z
         Q/RCA3OQzdM5XxP/xVzAdz3uQi1Xf7YbnluTaIyzKnv9FDbpAH4Z0z6mcvBM3m/RxIUI
         EvyW6yvFY5E05HCNFvSd6+46XkELmEmXDCDgjNMlGb5HpskWCcry2EHnhsDLQfhNW9ll
         5VRBjwPRseoGGweDfydLzef0caZhZNHbZ03zCqsnSuGcEMrKg2U6Ts2qmMh/0bbiHwdy
         gfOhZv2GR9EviC3iZ0sZxhbnqfSUurIitgI7b3lrioaXepHCNheFF+jRSzXiNB14Q0Al
         04+w==
X-Forwarded-Encrypted: i=1; AHgh+RoWhJSkW1cIHeGyq++/vM4aL808JQ7eOl1IMnULREatRdqIfJLDrhrglg9MbnNoFutfvJcSkTHIrZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YynOxr82EDTp7gfWFVD1cgDgKCqnz/MEX/6AYewTJvCf1QNyeDL
	85HyXRHSLglLJCTv8ULSmPBxePa4NHP75soz33wmz5rblXsEqgTkv8FID+mqPIsynD+eBM+0Oa/
	EBF1LP8GLKjduGy17kfp4+suY6MqdRoEnNvQHsBGMAMR2gUTCCo5A8wOqcuWod18=
X-Gm-Gg: AR+sD13wso82whuzKH2lERr+1L8587UmGe/SApvhsPS8aTkSAfF1UBydQyaoB38kQXC
	7hJ+32pXiwQ/Hhn5dSzF3qilJHm+xVkm0U0hlJjQFUG3XSP4lT0M6NwqSxhNYzA3d33f0VLfvqz
	XhQ+PthXQt+N2fDh1XeB54A+N2E0SBMs/rVPH2h6e4vP20jXXGArTNJ/7AK25YN1IuWLvt/uVH3
	MOgCa5v5e10dU3wnjOXn4HZJrq+EVxks9eRDFFq27Xw/A5rWKInW7gf4lf7BzhBZvLPCzXhzgse
	Qcm14bslJidrtCWaDFOPPuCjD/yP59qNzEhZ5t5CUHef7eMagdq0HvN4ECuMp8YZF/COEXsOPCF
	g2hOah0pRbNOkS37QMZkxAXhSmp43wuKOXLJ4QbRff1FHZjfE5sacurReUaNad2xagbRE1w==
X-Received: by 2002:a17:903:26c4:b0:2c9:97a8:8c17 with SMTP id d9443c01a7336-2d05247261dmr95643545ad.42.1785730392092;
        Sun, 02 Aug 2026 21:13:12 -0700 (PDT)
X-Received: by 2002:a17:903:26c4:b0:2c9:97a8:8c17 with SMTP id d9443c01a7336-2d05247261dmr95643315ad.42.1785730391681;
        Sun, 02 Aug 2026 21:13:11 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18d9c6sm33524874eec.30.2026.08.02.21.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 21:13:11 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 09:43:04 +0530
Subject: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding for
 non-MP controllers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE8VcGoC/yXMQQ6CMBCF4auQWTtJKVjAqxgXFIY6BorpWAIh3
 J2qyy8v/9tBKDAJ3LIdAi0sPPuE/JJB92y9I+Q+GbTSRtWqQDduUwwYxaJl37N3OPBKgkZXZZW
 bphmKK6T8Heg3pPr++FuifVH3+f7BcZx6C2fnfAAAAA==
X-Change-ID: 20260803-glymur-usb-binding-fixes-627471699f35
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785730387; l=1328;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=8Wwj72HCdXHXMmYq1uFB2/otTQhkXwKZSxFTaC/Em+w=;
 b=Yrlbo+O7LMwe0YnKZgfW1TX+BTzpgqlsBT4SZvl3qrYjEn3JjZkDLgLkm2xwTbbBnbcLDhQC9
 5KAkDWKCqEHDVchF6CyOwtnc36UUmxhkPszG5f7AHJf7WM63yrOPMVd
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: 4kUg4BQryzZkZiK4iRg8GUCqzf8dwO9m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAzMyBTYWx0ZWRfX7IDH3OE9QTCV
 3aRxgT84gs6D6BWHzkqgRlo5sVa8hW43+fC4k0CQe9HN0+OqJrSw4LyC7x5RY8uFDNAKbseoXh9
 s/kNYlwjB2mKwmJmyY+2Uxot8QXp3Mk5LCMWZSHkufPP2FBzlLzTtSRnOrOENKR/mccrvVtYi2N
 AhgwGQAH2n1zYXpgIpZL+F+kYCMEOpv5+yv426DTjjmFnzDIgdIeEAQufWPxn51zEeJa2n3l6fO
 IMIDXLYqhgzjkfNwJ52PEcdISHSW5pPKm6vODRQt6FokMDUf14jal09rciI8Q2hMR6e2CKTllHA
 54EcfJlhN37WhAvQU1IC5gj1KMzxVsQ0Ze6NPns4vQkYIO/28FucHgscJ33AbsQONCAisyiDVoW
 WoI9uw4us49Wl1gfHvzkMugRf7+yoFC4YvDP/dcIiLRmdFtnIBELvyC/IwS4cZmu4WpCbwsbAs+
 ttzuyKAzTUSGgQebN/A==
X-Proofpoint-ORIG-GUID: 4kUg4BQryzZkZiK4iRg8GUCqzf8dwO9m
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAzMyBTYWx0ZWRfX5D/qYLMflhk0
 GiY2EEZ9U14DkwzWUHcB2aa8pdWcJrMNUdORm8eU9K6YEHV0vTDacr8bwW4fUkbSZOqQDVR8Mel
 vzWb3lze//kWLn0UWIRPnmFu9TMfnIg=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a701558 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XvnPSs-z2d9DttoqT6gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030033

Glymur DRD capable controllers have HS Phy interrupt. Fix the binding to
indicate the same.

Fixes: b9d87b41f96f ("dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible")
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index d410aeaf92fb..100a287ea46c 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -524,7 +524,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,glymur-dwc3
               - qcom,milos-dwc3
               - qcom,x1e80100-dwc3
     then:
@@ -547,6 +546,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,glymur-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3

---
base-commit: 5d5fd841c34649f1b09220fe58e59dffd61c447d
change-id: 20260803-glymur-usb-binding-fixes-627471699f35

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

