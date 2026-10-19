Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091736605E
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376164; cv=none; b=mH9L67i09/FDmzcTrF9exFD2IU72gi5WTF6AaqTMz/9v7aT4GQi7JkIvTu12gKjALRfCxUmIJK5SJrsCUn3ebQk274/mfqSSNBEmEW0CH+1o/nghd1yAJb1sTMjeIoQEdsJtAMqFp148IefApe2pl1hTeAEYya7LLSrrZ9+PQ+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376164; c=relaxed/simple;
	bh=t1/WRnFdjA+59SesNcKD+j9JerSR+CiQB1pnFq3Gmhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4JvHNCe4TbJ5G1UJWFPzi8xmzHdGXJ5xBjm5rxBdk0XqWaxArBQUXJ1b1B7lfrO07Z3VoYqfr2wl64mLgYA4WK5YmWXnc2kD+ulBXDqBZnCBIWAqAPOoyXjFB/bZmH9A6OU6L83Fkbdvp3ZnWtAws+aEhUoiUVpMKLsbV4p8mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6yZMVh0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=klodhL86; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6yZMVh0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="klodhL86"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1GP6w246489
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DfBFAFApxhj
	wHCm8/sm6IzDRf10uHpOaJHMfVRqm9Xw=; b=F6yZMVh02p/QmLtdhYCtT5AoX6E
	+B24FmLTB46yNeei2ZwgS6XUnSc9876o2Q7m4Yw/GSV78hQsiAZNNZBybjKbDW24
	5+i1uBM/7XAk8mT6ZZrWKbvLGmpJm6pA/9YJpy3EMtvVBF79Ss8m300FHKwL+YDl
	AmYXMSn8TyuGgj6vJb+RXukU0mbOk9IV8wMNipBkYlrArx1Hhlk/i5vPztjS0gb3
	IyzM6vmhr8IdxDG56uAa7pZHeMTLlRmI50i1EH9ipAlKsaNOwf1DLxwXRDAvntX0
	kFQpYGIlcdQNLPw4esjIIfQbHCzuX7gV4thR9+ZubqTvZ6SS1sTQs9vrUpw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7vew2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:16:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35d4538fd74so6076256eec.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 19:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792376161; x=1792980961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfBFAFApxhjwHCm8/sm6IzDRf10uHpOaJHMfVRqm9Xw=;
        b=klodhL868jL3vGtYyDFOTSItyW95bDe/UyOHdeqWSs4OXNuAYiXGEhIo5vy2445hZt
         3eeMHdpeAIg7TVx3gbQAhj0I/XV+rdJ07AVKeVXQgFyZLp2LRIDzvyfXyxiFD3hc91Xu
         c+bCnc6hvbYVBKbDb8wMvh28iZ5EcyiOlYu4Lkob9TOWUEK6imrDlaq+irwtFLVFGTJ/
         q+ZIJWqpmWmcgDEAbaPBKb7u4D+RqKyLKyFSaXBMG5Jlvs0FjJx8Y4Ey7B6K2D/THsjp
         0PS3zGvlv2L1yTtd7RR8Ic42qo2eGrGnENnJuvUmvii/8AlydnQrxPUogFmT7dm9YJSN
         xQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376161; x=1792980961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfBFAFApxhjwHCm8/sm6IzDRf10uHpOaJHMfVRqm9Xw=;
        b=XJHIWcRu5MdOjZpZ2sK4E7GmYQI7K96kW2V9hvNqwGqt/w/NtcknZH2lXPR+ETOODa
         CUbtcFW6gEpzWJtfl4edscZScGRFnjVq1WpSzx/RoAKPGeB0xas3CbKyw+Nf6PAr+sGd
         TyrlEKIi8e2IVljOlNeqteaDejnwGkfZBHxXhaWL7F/xrggROUSzdkYyE/xcZCBZ4EW4
         GJYImG+fN/i4EpMs+JTjgfgOwCwmuwgkAfMLDub9LhlZchOLM1eij69ZbqZKS9QCQG3g
         fBfZ8wH6+9yvwcl4lhaRR5113wDaXwdmnUt30DrM6QCQyC8JOqSXOdMNEMDZzwHYFFi+
         0m1g==
X-Forwarded-Encrypted: i=1; AKwUvBxJdxe66hyC1u0vrA7x1/x/rPstDvqv8Nh3FpZJEdX+FbADjOcf6ipvisSqPsS2GQpLuRD0a9GlMWs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKxb4x4bQRrP+MJEMQry4kcTkfzVmR+9pzp2/hL+CH1qbtEMH6
	sQTdshm8qMu0OR50pwjnPkHkWwWlFWS0g1EXjKjW2mYuW9cS8jz6h3qUBzGMKyWnh1tLUbGUV/E
	zo6Iy7RSe33U7kohyZ3DpplxQmJ3JWn2XJj5uCA+yJCglXedZGkYCgXPfHnVc2e8=
X-Gm-Gg: AYBFou2uHwmSE6q0CPNdqV7prWMybgYb6tKpA2q4KyQJUykjpS303xD3NI+4sCNapjZ
	XhiATN848xcpOBc0XgHNxc8Y64m7x4R4M8eQSF1nZojlLqX+Yw5VsxY9ZM/lMCbK+T26U3Cd+x4
	VLhtbC2dt+V5bzl8fOUvWVcKHBULjo05OIkLDZSPQ7oMt+fTJsQD/znfiSolMdvilOWCFhJV3nZ
	lyiYbducHPcZWDUkjzt2CI8mPseS92iObOkJc7FUdEy1jOEMYstSo28gh1fYKiVtl4C/OtBzUOH
	XSsXGMHbnLINlOM+mrSLEpLS9bzbVUzsnfN0bA5MSQMYTVTvX8r4xOI00o/Rk7re73hs2eNCigQ
	aTzPfHG2MWyyruwgf6aT3ToMVdYXB9SOqt1Hkdw0YBLFL7pz1AQ==
X-Received: by 2002:a05:7301:dd91:b0:351:5b99:5f36 with SMTP id 5a478bee46e88-361a1365d16mr8233103eec.9.1792376161285;
        Sun, 18 Oct 2026 19:16:01 -0700 (PDT)
X-Received: by 2002:a05:7301:dd91:b0:351:5b99:5f36 with SMTP id 5a478bee46e88-361a1365d16mr8233070eec.9.1792376160728;
        Sun, 18 Oct 2026 19:16:00 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm33841550eec.3.2026.10.18.19.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:16:00 -0700 (PDT)
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
Subject: [PATCH v2 4/4] arm64: dts: qcom: hawi: Set snps,resume-hs-terminations for USB controller
Date: Sun, 18 Oct 2026 19:15:47 -0700
Message-ID: <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX3IxLAvQMVv9K
 DAaLt9tlCLB8slaw37zjhBY+7n2FMT79s9qUODmCsKZ0GZeiFclOlH1eMIss4CLDOlODjpFkm+V
 txyqimvTac2GNKdnXa9C1pk68xk+17A=
X-Proofpoint-ORIG-GUID: LIifBMyce_b8tOf9zjn9TqcFiUtSPt6r
X-Proofpoint-GUID: LIifBMyce_b8tOf9zjn9TqcFiUtSPt6r
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad57d62 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=_PA-CDJEJREJmSlHXOMA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX5RptSOyRXiQm
 KxxSsAFR6LXwRZxhQGzZ0BuxbqFudoM+leR++KJJZ0wo6xoG19wP9188VFNl2bIW1FUZ++tS/LX
 9dzprfSX3ddEFgMp7Z0vZLvBiL/zl2bk7sGbHNFOBiUv9Wntsx3dilAE4V4R5A2IslIWYd9LQdr
 JpPJxtDMGMowaPTSJvYGL1Kyw1TPXJVeRxwT7cXz+OODNuWvHJlodxtWewjs2wYJiOKwMzTSkRz
 UPDV0DD8J1nGE2OQtZwtTHduiUeGs9yVT4vu0pkAKHLBOAlsfaburkK0rAUnJrlmO0mheHIUegv
 +qXa2zh/+1DSLRqVosX3yw8jpVCTRsmlbm09mgzKbJimMq/Br6VWFSyyO4FcIOUbJOtCfiFAd1S
 KsmObol1Yb1zH1AfR8WJs0RCbbxmhNA4wUwsvzrk/dZ+eAwVa7W04POzEPsLwD810uvZmeTKOoP
 tYqB7uCsIFwxUOPu+bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190008

The DWC3 controller on Hawi is paired with the M31 eUSB2 PHY.
According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
(RESUME_OPMODE_HS_HOST) must be set.

Set snps,resume-hs-terminations on the Hawi USB controller. This makes
dwc3 core set GUCTL1[10].

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index c7ae8133b9cd..cdd660ef2dcd 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3945,6 +3945,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,usb3_lpm_capable;
 			snps,usb2-lpm-disable;
 			snps,has-lpm-erratum;
+			snps,resume-hs-terminations;
 			tx-fifo-resize;
 			dma-coherent;
 
-- 
2.43.0

