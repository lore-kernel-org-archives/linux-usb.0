Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931CF238D54
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376155; cv=none; b=nMlIhw06SyxN4JmzvSD9t4Y/ZmnVk8miZlIJ9ptXGBAz0hWMDGlnjh5oPP707H2kpw7rhUROMH/T2CWZLzTS72w9/VMRHxyQKWs9+M++qLx72tWklIzZ5LFm8yuTt3hwd848SqA7t+2H7kdiNzdGKa2GYiG1JwuEmC6O+PuDL30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376155; c=relaxed/simple;
	bh=DILLGEOqmhVtnt/inOSuN+oFHC16oLiZeuvKKj6QrQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kFaucO7lslUI4bp0jMxn2ED4EhpLueyCHVXrUBphdi2qO+fW/mKWGesEvKbJtEuc08y8isuqzDai+b/eGi9RVq8m5sEXOMtzv/DXDqIBfRost78mBIeobI0+1VH1/0JaN4tgphiAw5XuRKyRGIDW3Xd+06LJZK9QTh16HUToAM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKlDe2eu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHZvFk8Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKlDe2eu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHZvFk8Z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1FRgk1263432
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=npnmsGn/PJZA8qbA6dc2x4XrktnRfF/ttnK
	kUxS5bVU=; b=cKlDe2euhIw2lcj+cn8vD22Tk07L/poBMz2npRcj3wGTh1R+tNS
	7Zh30m+QNGcQr+2d6C47cEdyM4MjiWc9n5zUSdzae/pg9C0WNcPo1xuaOGeGMozM
	3fnN4fyhfdnQO7W1JeicxDS2939LZThH6fvHQSEvW+nfWpyUmnXmOLLSp0/oDaRb
	h08lxmkbQWsY/MzUNJkxuMmtWA9Cfjdeaw3WY4rd2zips1j0yvKYUxnavo5It0aG
	hjbzpgePgn3Mr4LXq5+GV32UgoakhkQpGFwP3p+ICExEQjvbjtBV7ap55+mvk4UH
	JQRuJsGAfgODw9zcE7nre6e8WsX39aqO9OA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w18hxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:15:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so4150951eec.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 19:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792376151; x=1792980951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=npnmsGn/PJZA8qbA6dc2x4XrktnRfF/ttnKkUxS5bVU=;
        b=WHZvFk8ZOOwseO2xEwAqIjNomTflwhGjHIvT3tWImiF1LltfIJ3DGoNNat2EABRzDe
         3YN4JZVu/IGSHnAUFbpUV8eOYul56uZrOQKh27EHXKg6U5/F7pOg/17uJije183nOZ5x
         jPVPKentRIbryJ4ITEPRHyf75w2TLpTn6uEZB64KSlalNZR+600yqHs8nNkqSTBb8yeO
         mgR2yVN58apmDacY/bnp2hwlUUVzXCNaGh81iUYLIvx/YJx8fBr0iO0Ve/dwcvPTJ1KX
         auhIpdRPIWo1c5vLPP+iouBg6imEB7LD75ElestX1BUQV25QBf8fPN4jnPKzLbAaDb9c
         jqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376151; x=1792980951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npnmsGn/PJZA8qbA6dc2x4XrktnRfF/ttnKkUxS5bVU=;
        b=pIaYNI8yTh1oROu1r/InzA9pADSdRzwMXKTxqEjubm6mpJ7D93R+2pIDnFbvVumwuF
         zn7zh7/tPatqr1OPnnmy+ACyIdNx5ojpwBxUAfmWqcCt+lrhW9jL6k6diskw4FsP1CZS
         z1YqZx+QpUXfdmBD08c0JdGOPly+6mdMKg5PodUhW5BF9lJC94ncS3Jpgw6AkWIXeolp
         H6fUV+sto9MM8HONhRvLEckOSG9Mnm19KJJXIhW3hg12XyIZRjiuMmYbVIhVUHDMa29l
         snaDdF+bptiBGuJoxs+FL2J13VCQaOmhh9ZTtGseyAvkDkQ05lXHVipFqThF+M3GRoi9
         vYAA==
X-Forwarded-Encrypted: i=1; AKwUvByFOEmHvhdMDlfpgREfpXHlDSiYZSDJ9Pmq1Srm0nRN2AjRx3Zw3IKlruF2fCwXpuYRdW1rvhI49xs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZoVEQaGT86jkHhqsQ60SYoB+clOvebjmDyfb0UmxFD6PNaupM
	aFdDmoth2Dj/8g9zBnFJsipeIN62B7g8K8CvQPJecDX4wD3YwIQPWVOy+v/O5Ze7Sx079bE57CP
	kDNtdPX4HcYzMKNlhpvIWxCa7O/eBV3oR7JqZ0yDPEv0B65Vjcl0QrCDwLyPjGzQ=
X-Gm-Gg: AYBFou2634z+g1LX0FGcNeQFtH+Vb6DBOqjYmLciCQgDeCW6PTa+pDxtjHMrHtqjUDb
	eKvp+7/Lwcj5exGbevjho/9dmd9iK3hliNq6cBnenKmnCr5fvGp/wcOkpwpdhq7Y6mEjJ38xf9Q
	eZIicdnvWbrNU6xhDJA3aWMH70Ujvjvsnig2HETGFSm7T2qwEORKQnxQjxC1z60BnO7ZnApbfmC
	nC4OM0DfD7+W5YqsHyxzW+tVOGUuoFUAIMMnldkAKuxoLbKeOHvrmAaA+OUTt2494gmaJRdK9cW
	xgNoWGkmEx8tot8ZT3B8UryRuHZVhov71VRn3XebgBV1skaj12BzpD8S79gkeannzEmFmQQK3Nx
	BeSyXpkB35SjZpGRarFnowT2kJFnZMx+BPQUd1FeILDR7hpd/MA==
X-Received: by 2002:a05:7301:52c7:b0:35d:d671:933a with SMTP id 5a478bee46e88-361a185eff6mr8018204eec.15.1792376151303;
        Sun, 18 Oct 2026 19:15:51 -0700 (PDT)
X-Received: by 2002:a05:7301:52c7:b0:35d:d671:933a with SMTP id 5a478bee46e88-361a185eff6mr8018170eec.15.1792376150678;
        Sun, 18 Oct 2026 19:15:50 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm33841550eec.3.2026.10.18.19.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:15:50 -0700 (PDT)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH v2 0/4] arm64: dts: qcom: Set snps,resume-hs-terminations for M31 eUSB2 PHY platforms
Date: Sun, 18 Oct 2026 19:15:43 -0700
Message-ID: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX7CXhzP7g07p3
 kSiWDp7bbPk2KtzcjqReaz1AU78gAeJJneoKqZoW5KGDfodRPBwTHwWoHDXpuk0Nw0+Se7eloeD
 npMPDgZeCUVBKvrae4DkHnZmPmrwWJw=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad57d58 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7Cx1X0J1WT0CMOh0E7cA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX0cjfDOWbLb1y
 H44gufYn0ne7JPsTaG3Ty4GVGtf72S4Zfw6xudovna92QHQv8BzgVplfRD0FkuKn07sFCNaVa5K
 Jl2hwQ2y9K9Z/p+BAlca3I5DOXyQy9UNMTw40vbe4y0m0aD4H8Agcd78r8tL9uxgbvdveYaWc9v
 irQVAdkHa/tABM3TorfhfEqVxsFzz8jConGTt9hZ44zl8wRZw3M9LQFAnVnOF+cM8sIHkM6rkvM
 jTK8rLksC1cE1TjjQIcZXNLBGQ7m1LaX7+QWJ5rm9wS7AjAK/L8gWhyBEL1yUgfzwtDOdYW1nQh
 nO+xv7n5J+TtS8YAtTayEJ8EO5R97eMdNCrulNOrqe7GSiGRu9SLBCkofFhrpUXZ+sCG15RtpSu
 BqKxQFdUPhHRoq1VkkEfs7/F3hUFVhgylhhAWbvK973y7lxfug/ApCw3Nq8TnI07wlu4BEb+1me
 lB0cQk9Hvx10L0dVFng==
X-Proofpoint-ORIG-GUID: bnkg_ZQK7koXLUtBZhEMiw3tZumSz_eq
X-Proofpoint-GUID: bnkg_ZQK7koXLUtBZhEMiw3tZumSz_eq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190008

The DWC3 controllers on Qualcomm SoCs paired with the M31 eUSB2 PHY
need GUCTL1[10] (RESUME_OPMODE_HS_HOST) set for host-mode USB2 L2/L1
resume, as required by the HPG. Without it, a USB2 HS device cannot be
reset after it is runtime resumed: PORTSC.PR never clears
(PORTSC = 0xe11) and the hub driver fails with
"port_wait_reset: err = -16".

Set snps,resume-hs-terminations, which makes dwc3 core set GUCTL1[10],
on all platforms using the M31 eUSB2 PHY: Glymur, SM8750, Kaanapali
and Hawi.

Changes in v2:
- Apply the same fix to SM8750, Kaanapali and Hawi, which also use the
  M31 eUSB2 PHY (Konrad)
- Collect Reviewed-by tag from Konrad for the Glymur patch

v1: https://lore.kernel.org/all/20261016091336.2715717-1-peter.chen@oss.qualcomm.com/

Peter Chen (4):
  arm64: dts: qcom: glymur: Set snps,resume-hs-terminations for USB
    controllers
  arm64: dts: qcom: sm8750: Set snps,resume-hs-terminations for USB
    controller
  arm64: dts: qcom: kaanapali: Set snps,resume-hs-terminations for USB
    controller
  arm64: dts: qcom: hawi: Set snps,resume-hs-terminations for USB
    controller

 arch/arm64/boot/dts/qcom/glymur.dtsi    | 5 +++++
 arch/arm64/boot/dts/qcom/hawi.dtsi      | 1 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 1 +
 4 files changed, 8 insertions(+)

-- 
2.43.0

