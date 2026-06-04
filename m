Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6099D3F6603
	for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2026 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563951; cv=none; b=hzYKKsrpMTkh+w/9SIlWaYr9cCamt1Eeu5EKxHM9Gkivh3LXSP7sc/2AtMB2hDGeCMh4PBgjeypKdxSdYdoOl50Z9kZ9wBtkz076v9RZsqP1h1Gsf9MR0SI6TGbKclpn02Gh/r6PQxABg4WjTCZ+if6jQWsFYOyhF6ff8rVXtFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563951; c=relaxed/simple;
	bh=BaKUM2UywPsrZfjC3kDRqaq/kXfkQJdiHLSSxwmanmM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tS+wyVSnzxOJjHuYcAQPEueb2M7uxprwHJlX0ahtq7owjX3PCc2BCdx3clLGqz54fuS05XOh1ue3pqIeo1nNse+N3lQyRl/dKOXsgkjWlost2RU3ea9JkTgmRQgsFY4Usp3eympg1OsjrxbGlqY+DYi1owu7gBJRFpTvda85A+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJ/+XyA7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkLu6D+s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJ/+XyA7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkLu6D+s"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543na101993494
	for <linux-usb@vger.kernel.org>; Thu, 4 Jun 2026 09:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Iz8FTTBe1U3WzTPujE7PtVwMCPkGgJwjXDv
	f44rXKjE=; b=FJ/+XyA7UyXEUcoAfTkYHKRGhTy++zgGzmIEsSgJoHO0OlmBWHM
	DpSVKj9/boz2X77ECCeIE+sTgzSrwL5wsVYWc3BB/xr4swjJ3o0QJh9bLxatC6Js
	R+/B+BLGxHDX2VkVEonJ0ue6u5lKK+/GszjF08Bd8A32+yLeNXgBUcDYfunE8SRD
	/rSP42O5QYxQdT0hE0k4LVS3CcQwwjoIDm/xV44BCMdu0d8Krs7DhaMVBCGIm/gC
	owcFrXPSYh7gqi54Su4lQYySF32KVfGxER16jLp0E8XLbjjvx/3O9UzhSHMGMWS8
	APxB2KJqrMJ9WycDu9hLoIqiJf2Qrj+fVVA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8ptubj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 04 Jun 2026 09:05:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf0d79d41eso4867785ad.1
        for <linux-usb@vger.kernel.org>; Thu, 04 Jun 2026 02:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780563947; x=1781168747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iz8FTTBe1U3WzTPujE7PtVwMCPkGgJwjXDvf44rXKjE=;
        b=WkLu6D+stmDYX54OQnPs7aZB0dg9aIYvA3SvXlbjMSqCjPAlZLJXkxHhkPRFKfOguC
         dulpkvaizDt9/do3rAsh+oQqqbnqdjG3GqUcqB5l+/LFg3gtx+gU3DDeK9akMoQ26Q1l
         /yQ+GLTLdZyqq91hqKVbHpq8Xa0neETZ68Psfo0GjpcF/PM9kFZHaetKLDLbYr+K+fpA
         YacGeLaVFneZUl4weKVahKoCLJS0FkJOoScF3vsUhEpaWe9y46KtmCq4j2wEepTdZJie
         18w5+gCR4CsMgF1hMYJ47T++B6D310Hb2WDocQTU1yCYj9Jdh6dDgLvjy1LK+TY2iNhd
         +vgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563947; x=1781168747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iz8FTTBe1U3WzTPujE7PtVwMCPkGgJwjXDvf44rXKjE=;
        b=EZ6303Nz5E7ObNvszln/6DLewxNMjmvKliC/ETh0bRG3wGp7X9py4TNpzxfZ/iXB3i
         LucjgwW5LzCIEy9uANj56JxcuK+o3gjM2Eiak2Rfkf8uk+5aYjjby1+gPHeW9MbHIQw/
         540X4AGOYghZyrV38DHniMsx41s8vJRW9UMctztvUz7F6f82MGiIORAB+h7bOBC4iSGn
         G1QSl+sDJtUuPpttlvdMum8H7b4V06hawTXOUCmNfHWvy2o1HQ57Z6+x/EKkYtyUHSnX
         oMIJAyuIrvQzYxsNRxeEvpNPO53zXs9PDUwZR8DemG/cu6XkvCLkPIIxENkx+uMf5KWW
         HSXw==
X-Forwarded-Encrypted: i=1; AFNElJ+Y/ZDoOYfX5ygLYvfThBDZCU+1EWUvGjg+V+t1CTgBtQ8nHATPICtolyBC2lVZH6RTLG9TQEmkWqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+iYZ5bhMWnDQpwAVKZSRjfXqs0ffk3xwnrwXqRSpDZ7iIDo3B
	JbIQWUdTD5IZvZvI7FCiKSCH+SAWYZ0X9ZMIW+Pa8NEKV5GWeutjvuYvQTQaA9tqWiGBclTYzca
	giFGFpDqZH6VGplpyUcAoaYsgiIUSl3mrHBv8km2BXJQq1rV3fRRpT4q7ifLHDcA=
X-Gm-Gg: Acq92OFf5vavxmpBukQitFUw7EMov4FWC7Ijp3mHyMEXMkJz+ggbXmtyCdf8K/DGA7B
	lS0HtBu9afouu9DiM8ZoVxwVtLjZM7tF042fminmTQEngWiIhQQC64hSPIMCQYcZGONqAKoh05H
	JE+booPxuDAYG6zliET4YsWTAbID4299miEG6/a6foaP/ZTZSQN7ADpxrQQmJsr0gQ4ZH2pV5xl
	6uyZi1UR0NZYh+kl5YwJHlN1RIqYcen9Gi4ly+KrGIEuLxLjoum/ERMaiwSPazuMVKwQmuChsBB
	pFM1J5QgZ+A5mHX1O8twoMxAjmpjj+FBIETqqXrHGlfa55G0S3mUYW4c2Gy8U+kTz9EzQKghbQj
	h6jYUNi+fHRrQRGa5Fa8v2zx0mYCp15+ZqsmkgNO7Z9t78L7zh/7lL5HAdk8eLBIWwPf8mDvLia
	JPE//mfP9LalvflgNOY3/B8jDZilW0SKayLnc4+RfqP5brCNK5sZpJVWK/MtCW9g==
X-Received: by 2002:a17:903:2f0d:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2c1640aab54mr69291895ad.26.1780563947341;
        Thu, 04 Jun 2026 02:05:47 -0700 (PDT)
X-Received: by 2002:a17:903:2f0d:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2c1640aab54mr69291555ad.26.1780563946848;
        Thu, 04 Jun 2026 02:05:46 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8429fsm63211845ad.18.2026.06.04.02.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:05:46 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add ipq5210 to USB DWC3
Date: Thu,  4 Jun 2026 14:35:28 +0530
Message-Id: <20260604090528.735236-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: t7HeWTCdCGzSy6EbKAMG1vQE5o_fu_AX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA4NiBTYWx0ZWRfX243d9gRgBith
 Xely/7AfqHfnWAJIvd186XPM/7S0T1Q3Ft5bA3rnqzMLpNCBAycH+s/g5/IMKw4FHI/BkGobS7a
 aqfOLk1f2Wb3K2yLj4MVJy29V4Rw1g1q7D3rR0yKr9aHah+JPGLCHWUvp5c2MW6XyYQSLXD5U40
 NoAVo5Rao5mhyynoPEuhuCJM4L9v5kTbQKXB7LETTXcsFdb/g37VVW3G8G9yAF+NL+rI91QgMdV
 TgXqAqTYvX97fqj2avko3F9pzNRe8ho9CrQkkSFF2sP5aZEngy0rZFp2WHgeleII9SOlF6Pamzn
 bJpNegomC3Nh0tcDLzyEslRQP/Pft2ZL7uRk/i9GLwkEwgQGk1BvIYSUxKemzbaRlbxiC9VYBVb
 CasGKfX3Z0/YccAEOl27abbckpyzsLQAqWZL511aopOPWmyVP1WKYrf81KVKzc+IZOj8NJzerTj
 9lxeEaMGoG0vS8y2aeQ==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a213fec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pdNo10f9niJiPu__wPQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: t7HeWTCdCGzSy6EbKAMG1vQE5o_fu_AX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040086

IPQ5210 includes a Qualcomm DWC3 USB controller supported by the existing
binding. Add its compatible string to the schema and include it in the
matching conditional constraints.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v2: Separated out from phy related patches
    Moved from deprecated qcom,dwc3.yaml to qcom,snps-dwc3.yaml.
    Included ipq5210 in clocks and interrupts constraints.

v1: https://lore.kernel.org/linux-arm-msm/20260515-usb2phy-v1-3-5f8338d466bf@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..932d7aea43c5 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,glymur-dwc3-mp
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
+          - qcom,ipq5210-dwc3
           - qcom,ipq5332-dwc3
           - qcom,ipq5424-dwc3
           - qcom,ipq6018-dwc3
@@ -203,6 +204,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
@@ -497,6 +499,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
     then:
-- 
2.34.1

