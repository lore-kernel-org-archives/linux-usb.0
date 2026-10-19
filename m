Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465093644DB
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376163; cv=none; b=gx/cC0gwZX7thu2hlwz1RuiV+5AfmyUFhIyJKPOs8CVKO6U6PjgHSz6GvVhby9ziR1GZuTr5xT7Pww5axk9HlQ6bDiAQDDrhlCuwAMP8l8UgG+QcRdt9hdq1pKULUeg/qKCkE47MMpgyGIucHJIIKqiVEM1MU1ordAU+Y9AKFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376163; c=relaxed/simple;
	bh=9iNBNzF/O/OCk2M+YkQl3DeLvr7QYK389Mps3ejvZS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okO6XWEizBHHGRm36kKQrc+wiYZqky1WZi3xPkidRJVCHdNVSVZVJeGSEM1/sQ1M/wnkxvPSxUAc8WarT8aAd1J5M5FrtXEOjvEgsMrWNIuQ73/bdBz0npkEdvJi8syxGbI3BeTIhOCn68sdp1goa9QdKR++9V5PDbyg0bp2NSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtyK6OcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQBknROB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtyK6OcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQBknROB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1FQxg1263334
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pK/JsYFhvVy
	JWwuTEf3AYzE8dP57u1HvP32VitU3Qbw=; b=BtyK6OcW01M8S9FK+Dk4B0rDAkg
	eS5oQ42XLhj1Egh8XUaDLjj5JU+W5i3EIKbXlCdoliX34dB3rUpLIUi3WKm/696W
	5ypMYYoD778qTZfWfLq/+7ktjsWQoUr9hakqaOQrwEAiEI7tIYQiwbR/fEb6IIFz
	siY9IFBefwLraYCi3qwKpPizlA3O67yeMclN5YTzGNEnJC2mkCNFhkjIDTUuxn/W
	9DQtkR6QkKK5zUcn4Ost8x9mw06WXx9P5JFIaSrNSkVqqKJhs4utfgvQinCb4JQh
	DJrg19bUZNeKJO++HdDqf/mQX9UzhMtn7jGpP0f9Q2MzzY+bqWe4xlEsWUA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w18hxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:16:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso2848657eec.0
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 19:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792376160; x=1792980960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pK/JsYFhvVyJWwuTEf3AYzE8dP57u1HvP32VitU3Qbw=;
        b=BQBknROBNI0/ar/t0mCc9t5PulC2X1BzpgjDZWeyhysl7KXtFF3y7WtiL3TxKyVh6z
         4/EwT7ULI+9Kwy1i24VLbPzTl4bUnZvgSPxpsOz7FvFcx23MreH0Vj2BVPCOtZrpmUkq
         lpixd+3RrnOFSRafZpVDHA2LtuWtEpBFGsV7+7RIvAX/EEZYJ1mrAiJ0f2yCWpj0sP2u
         dvfwq/m9zoe3rlt1yP7eH/ZaVG8WfACraJGtq53pCTEnuZQHcfF+j0cNPpFUHxPnQAZr
         NjQ3z4X7AaTurrCYdbmzMsS9RN63Iqn1TZ6kSG5puyiME1ENtwSLrxxcesbwXkvko3tj
         0MwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376160; x=1792980960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pK/JsYFhvVyJWwuTEf3AYzE8dP57u1HvP32VitU3Qbw=;
        b=cICad33jh3BcQ0yTM769wgt43tLOPD/riLmR3k2TEhB+LYhEh2N0ID8MrI+exP/1gL
         mJUbvhA3vay9BLPLm5spWZMRoiwjsXkZkBlYa3RHVkt4gYkzxbADqVvPjf1QMWWUgByD
         npITKxg+QYQ9KxIoTAvAITJlsfmMwzD7IRJ62gEQb9ODXMLRVGlfndWitNNgVOImqCGF
         MIp6tHXGc0TmYA8wzkL6eEZQj70nBuh76nFH6ggRohKwuJaFi6hSjcG2FgJv4mjoi2/z
         nf+Yj5/rsKKhx78mhVSuyq4++TjclycQc/wNHVxkIctvbl2tQcs+FadEm7Lqeax7cz+1
         NH2g==
X-Forwarded-Encrypted: i=1; AKwUvBwDGjTPgBrkJRuJLe3KCIhfblD2HBt8YyCPYznWRBoU0XoDv0HSbC4aCjdDmscLJDLuYKnQ7cQ33pI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2LIZkZW920xdwYi5Muv3+rJd4o+IpFARc8tkKWtjQzkh5rxoo
	j0GwUczLd29vcTfHN3GyhKzymVH1UclZin1pFr3dK/4uS8Okjjv/HsuUOl3VxGQGKX4RDxPQ4SB
	WFu5OlB+CkzcNdl/e4JgSI6SIX1NCvz+8AsPmadmWuPA8SpaDYGQucmSokt2TSS0=
X-Gm-Gg: AYBFou3aaNep1uYKt/pT5u7Js2G5FS2g9wltmJcICtvEiD7U5dZ4tCyiDubeWCANnCy
	arI8G/Amip/jAuzxuU9cYjgSMwoKG56cxquVUYHNyNTurTR1VHEnUXHcrc2yeAeEHCT9S1cripW
	HWccnOFdoaZWde47K1btqFXHPBPQ5qmtcQVpnX7MvXpVu74pu+hvTG0ldyozn+Npe21LI7xaHI7
	tvNgdwnqlAMDVjNu6ggC7C0qbklqjU3UjQLStW9vjCxwhGMBRBbQU84EimVqJe69EmPwqiLa0LT
	GWQ3eoCgyyGat7ZnMEWomCWf29hp/aP8iLmpmtHn3ocQEpQukp3sHmhGpzy7pzFc1i6umjHuZoK
	oNc2Z2DontcsFDG6+ybxRrmMvr/fI5x1t6WI2S7LJbm5saA/QFg==
X-Received: by 2002:a05:7301:2d2d:b0:35c:89df:812e with SMTP id 5a478bee46e88-361a302a214mr9428291eec.34.1792376160255;
        Sun, 18 Oct 2026 19:16:00 -0700 (PDT)
X-Received: by 2002:a05:7301:2d2d:b0:35c:89df:812e with SMTP id 5a478bee46e88-361a302a214mr9428252eec.34.1792376159644;
        Sun, 18 Oct 2026 19:15:59 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm33841550eec.3.2026.10.18.19.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:15:58 -0700 (PDT)
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
Subject: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Set snps,resume-hs-terminations for USB controller
Date: Sun, 18 Oct 2026 19:15:46 -0700
Message-ID: <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX7MTY1QM/Mc8z
 G5erDUypdpUAYiDcI3jejMfP5Ets8UusXd2x6J/T69xZUcqExAkg77ObgOvwVesPU5iYp4sJ5F8
 HQmkwuWQo1lCvfZBX5n6/hRWRjQ9ZRc=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad57d61 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_PA-CDJEJREJmSlHXOMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX9SQQDO/ykywf
 bTNkUC4Eeh/L0yJfKlsac5QwHTtfTgRaT6jd4ONVedukOUCT9T6lDDY1Kqt+5Xo5REO+2b2xkeV
 /iDZO4yv7pBgnEFXq4aLCEp2Zdx9FCv1ulhRpFowLATVIhXKtkjLxk5YwdpzoIEUXNHUZhpBN2T
 mFBCtpcN9aLIZb3mXC0NIv6buxKy0X9P/JkCmvExNm35l/IJdoC8soTmVs4wior0MYjyZA9My3l
 kaqcgSdkxnXOu8g0f3SUOs08L2gGafdmVq3Q5w6YCHd4w2jV2zaR4tHS4t3+q76+cjLO3daDy13
 O7U/rlTp6uCHSCMd0ZUB4YZYhambFJt30AizlEA6F0Xc7MVRbm9VtqgAVmjyg3UqGimv9FnYYz6
 9tYNmAsYfF7VtRQtxl1F4R2RrbJpXUG7vko1yJq0aH0fGsjdW5FQgpZXEqG2cmYBOyKb6icZVYZ
 VKgaXo650J/0PXVJ7lQ==
X-Proofpoint-ORIG-GUID: IkPr_WMilNnjMQRszBc5u6UrjHyBQxq-
X-Proofpoint-GUID: IkPr_WMilNnjMQRszBc5u6UrjHyBQxq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190008

The DWC3 controller on Kaanapali is paired with the M31 eUSB2 PHY.
According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
(RESUME_OPMODE_HS_HOST) must be set.

Set snps,resume-hs-terminations on the Kaanapali USB controller. This makes
dwc3 core set GUCTL1[10].

Fixes: 3d395de80a46 ("arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bd51cd3b70c7..60c6c2c09bcf 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4347,6 +4347,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,usb3_lpm_capable;
 			snps,usb2-lpm-disable;
 			snps,has-lpm-erratum;
+			snps,resume-hs-terminations;
 			tx-fifo-resize;
 			dma-coherent;
 
-- 
2.43.0

