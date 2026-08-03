Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C136D3D810D
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748500; cv=none; b=I5/7NfOVaar6wxwFCRIGXCCGdcR8GuhRzrtJSZ7PivwnPEum8RkgukrgA1U5yh2YzQPUpD1HCmz6VyBC7OCqGwRsEtimkv29IrB18xo9rI/g81RFUau/DhdlcJwDLRPVIkX7lCmZI6GbxP75X8HN6M08GNdFEh/bt8u/oRcNs0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748500; c=relaxed/simple;
	bh=NDxcc0/lAnJ4v4Wq+AOH4sMpv05emL/8XS1fsgAmP5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oxlsB390i0HtJgd110mmcaYu0nI2sxjedKGpF60ejhuDu2ZtApjotaIET0K3ptIzyMPMv6pO7npTS36B+iCvI+e++QqJl5LN3KLqktP4Hpon1SZ9hOwE9aDWF58XoKzhN9P5kcsOY/2WZpEGNwdaQ3fqKmkBanUFSgMqmdjOt4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxdqV+lq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URwQXtQG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxdqV+lq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URwQXtQG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736S0xJ051606
	for <linux-usb@vger.kernel.org>; Mon, 3 Aug 2026 09:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VYtjNoonpSK
	8fv0gbNF7iVRMip5FISJFfgPMsjKARKo=; b=dxdqV+lq8HKACT7E5ZdTjdgeYgc
	sfgYQmwJN3EC4cOuFCm3cL+olfJh7fgucLJjne4iQXeg7klBe7kYXK1I4N9uDct/
	SBT70vB3bFne/8kk/yINP+2+S38WTYng2VqF1KdUo3XwPzNw8WBpHeUoh7nvFEAu
	fRQEQ4VGOwtyXbrM0nUS9Kou+sHKMnatoy5YyJGtpqcCHc0Tm2bwKFzy8Mec+rS7
	vIsQ3/ZJkjBReXgrSWR3B06tdVdnziUcaPzq3VuoyneLOacnLf6m3lmi7gA7VNvh
	JVkB2moDIshLyXbEvScPOw4XZ65siFDThZ5GUNIiAUfaRxkED32vRHrqGMQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrb8qk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 09:14:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848568a6f62so6423987b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748497; x=1786353297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VYtjNoonpSK8fv0gbNF7iVRMip5FISJFfgPMsjKARKo=;
        b=URwQXtQGGPICq1S+K5QjpIMcpCrqmsRLWcdkYMzpsNiVBI9PbUGzpRuDpLbpavkwvp
         JFaXjbBOVmNUhWmG0nSD3DTXeiOkm0cfJylpulni+fp2EFoui/8Za6dvN4i+1Nrl6GqL
         GKqxhzBRHs2BVEJJFxga2tGRr0rY8XD+cZQ/mgwzxnIktwOV8FucjxCxFkyguuCtpG1G
         5wkop1ygtpdLCbkCQ5nZbkAWLCOd/SH/dpXiWCU7prhL46O9b/wMA3Fdxp0JqNRiTVZs
         QARhKRxruM1f6ZQ6pWslaEkGCUcrtKnXa+jwrwzaaOmM1ONue5kmaeD5Rah0NpuKF2Fz
         sBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748497; x=1786353297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VYtjNoonpSK8fv0gbNF7iVRMip5FISJFfgPMsjKARKo=;
        b=jxAtUakYP7Uz1CGMVXp3z3D3mtTI3TqocBg2KYiKy8J1/04XCk11yIf7yOYdHcHW2G
         gE0F+sZqL4TAn23KjkpKN3zCgXPwzCBXnOo3WqU8Op1VL1wn6HVgXdsjrNnrr+d4FJX7
         nC1tWDiILpHmDxGe8PQkrBz7Kg6+Sd5ZVIe/nGkunjsl4K6QmsxBqwbxYZ0LH9rbRW5f
         XWl9MA1dTCyz7oK342NsdQWWxrVICkqnmHoDoVQX5U3SgMYEYX566GsqWztQzWXg4FSN
         Mfzj0F2SBA5sMUnyJsxnomrg0z7Y66vevbLqEN4ThWfTKSBdEQ+9hrRS3ovGa6ZzDVMO
         DAVw==
X-Forwarded-Encrypted: i=1; AHgh+RqgvEMelJhIVFFiDILKHI2KlYtn5H8n2S2W9hVJrddqfAiJz9w3I0HsWXjNEDLUOweRVUQKDzhSXRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOJrEF/AHJmna1BSCjZTrBCJy1k1HTIU1OoYmXMVA1goTIUbN/
	2QTbOiik1cST5HLN+Cj/RU15fkVeSUIsbZ2Mh0W0o4RarvsXu9oKc+BBhaccArMavCsqU49PsN5
	zPXMh6l3wHHQMrKgZpojL/0zATpH37bAc4has/ANvDqLpM62QhLuKrqKmMRhMVAc=
X-Gm-Gg: AR+sD1003Z+Qbg4PgjkZUmd1Akvx3DJJ8Q6dnVzYX3aw1MbW+Cvov4bSxOv6AngMkvr
	UNay0CLR4pbNrkLRaLoxKu9th1qJi59xDoyvQq3fw4NhrTqBkPKls3vsIaUYPGCCJgboRM/gEzW
	/210Y4Oou8Ck313EUvtf2vaZambR85xlkvj47g34rLTymz6lFlMbLqwd+qJxrCTu4vmO9YIq1Nw
	ncOAm2PlhpFiQoNqFJeY1uqbcPwGmXsdMacA07L4wXxZIQyfQ7Am42HqTHYCGboCASUyxkAsHw7
	HRDt4hR8dRAOo9MUwy3pMjGbbg57WzipasIegMLFDc7z+vLHiXZSnBgqdiUzCrrCHtG7+47Vim4
	G1av1hkBKBJLWuFLX/RSVYghGii4=
X-Received: by 2002:a05:6a00:2349:b0:848:2ab3:ddeb with SMTP id d2e1a72fcca58-84ee4777038mr8457264b3a.14.1785748496392;
        Mon, 03 Aug 2026 02:14:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2349:b0:848:2ab3:ddeb with SMTP id d2e1a72fcca58-84ee4777038mr8457249b3a.14.1785748495924;
        Mon, 03 Aug 2026 02:14:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe572d1sm3516376b3a.18.2026.08.03.02.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:14:55 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
Date: Mon,  3 Aug 2026 14:44:38 +0530
Message-ID: <20260803091441.3040830-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX4fF5BMv1PkKY
 +Oa2B3I+CKuHI45+NY2U/j7M3MUsDnzoeYbqNuoaByL/DCiZmDE3KwlttvKnF6mjfEuk6WnZwB9
 jUVWHsvT3U935zKI5v+DWrDB5vNsXFI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfXxTrfUd893lyg
 GCg/uIDjUAWXMCF6zRnOV4eCNB0PN/R1yCgN4n8TsBObjeW9W9Fx4SQGpKzJybLDprRm8r2xz99
 LNQC6lw+xh/ZvnbCkHvFGhGUVTGcSbITJ92XetkgPmimroE2mpwM4eXEGQAzZEhaKC+0crum4TD
 bXtSlayi+gbK1hu7AKVjgUtw0oK5h8hFZyaIomLjzLFWY35TMefQshW1tpx31g70jCUohCVnnVM
 qVWzv4c/68YhrqQwW6cKEAx/OJHGEEb6k0YvHtR5XwtuGoSbH02hJgk4KsGa9eEJqGsijV739PZ
 Kf9pu/5jQ/6EUxlTkAFiOz05BqfziNxbew/JAadvpqvcIuzk7lsVOaI8cMH/GN1iH/PqtefYBht
 y9kQDf8phsNSYflIlooflX0SnrZKowzje3P3dHJQWPEWAP+bTmjEKw2Ye4UUmENLa2TxLCQsCAN
 VijSTSsmzqWFficXHqA==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a705c11 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=8IMiPDtIn6OAJiDpRukA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: a_w45XsKoUFw4Y9SkKxNWAtV_5rBHzXz
X-Proofpoint-ORIG-GUID: a_w45XsKoUFw4Y9SkKxNWAtV_5rBHzXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030081

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Document the Hawi compatible string for the QMP combo PHY.

Hawi uses a new QSERDES V10 register layout with a new COM AON module
and hardware-specific PHY init sequences compared to previous targets,
requiring a dedicated compatible string.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 4eff92343ce4..ea3f1699eee8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -26,6 +26,7 @@ properties:
           - const: qcom,sm8750-qmp-usb3-dp-phy
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
+          - qcom,hawi-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -209,6 +210,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
+              - qcom,hawi-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy
-- 
2.53.0

