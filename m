Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78934364943
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376164; cv=none; b=CYOHTJDNEvTXps/E3eqpU0JgBkoJScKfDwJOFTCA8TfplJhHUTG41MQm9xPckoUo/tlMxYjTDi0hoXAc6Dclj/3SUPYjH0GVSiP5tgOtauszkGH3ivocHF5oSkNWR7UvXv/1/6Lfbv0OFqHVNHRh/re1bdPbfFnHqpwazSCc8L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376164; c=relaxed/simple;
	bh=CfsKmXvQMmfwhivJPr8zI/3pkslY9CJXxhXXPKPNpk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oh4dsKdLCazTeS+Kl4xZFUeUYZcTE14gvuTVvPclXx1Uc0AT1jWXmLy5ABsLr26aI3w8zKcSX4n1d+tql5naldIX16WX2erojrlWrfKzQzTLpubYzYYDc+nHxsKr0MJs1AoeZbq8WSJfgfOfOTbonZD46jgXoUxYz4B3Wf6lsdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IF6SvwoF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvbDvqu7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IF6SvwoF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvbDvqu7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1Ftan244868
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PPDc/2Iyewb
	HKgbAhopwYa/tAZzWomqFwflZJ88FaEk=; b=IF6SvwoF2MsrRNDG1M5neVgHJqX
	3S4yeRjytbLnsi8jiRbGV2m+HT45CXlAwiJ7nh/SycYS7+wP2q3F8CUFjnCWv9o5
	6ny40mjkam7C+7YZyGq9OQsmalCEKDg+KvlWPX/Bf1UQ5Ka5c62TRNJa+GTOPW+1
	9/bU7f5uB3cRMvQkaij02mK2flTwojwa8k9YRiy/MvucmtmXmLG2CW0T6iFVUIoI
	A2cm+OziGXmdZp+Fyy+4tkot72CqardmoBm0TMDqJWdWB67ikTsUSXpLSs/SK34L
	5mn2mgYVGxk6sQowEai7MJmsSHf0rm35dazQ/mcEhARDcz5ekThuBy1qiIw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7vevv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:16:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so5251594eec.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 19:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792376160; x=1792980960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPDc/2IyewbHKgbAhopwYa/tAZzWomqFwflZJ88FaEk=;
        b=RvbDvqu7S8AbRt4IOucVzryYMaSVoLFY8va3ZNUOcNUkMW5YNezNpx+rQglz/QdUnn
         Ro2OkRhGxF6bDBSqx3lrRi8Ry2Jvt4dEIWYtL0uQe+tegL50X2H0nVHzhrqNz7hbJVrr
         v8bkEKFNfJiLZKWnUyv0dIB2us86IN5OzM5nGe2v6kUaPgdSV36vaCqCvSQW7/tYW1at
         Br294DqqNljQuMtabxe44XKKGpJgcFaX3snBKyoPJ+j7hIZUHRvP2/0rnKfQxJJRFKlm
         VqBai3zOnsLtjfGbjFoqwAHLzwSxbtk99JHlKOMNWZDFkz5/hAhx5fptzfTCHk3EW+my
         FvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376160; x=1792980960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPDc/2IyewbHKgbAhopwYa/tAZzWomqFwflZJ88FaEk=;
        b=XEa6+GksnlA2A/PcZXmG5x2gjmfU6i4Ul1crAuW0n7KG8vd38+PQ15gBUyogD3j7qe
         QWVAv1Xx1MacPMbysf5yftg99TcQkRkK6AO/OvL2x4slsZanKZUGlv+HIClfpwnc4SGk
         filMufl1wO5aoCqL4cjJWSbvWTiTUfSTAuFXND+ROmWMkimmbIXnb8ij7BJOkAh9q3YY
         85Jl8T7yN9r2uQYh2W8cmCrXZsqfV+Afm0PbczgPIlk6Si5/EKTqZZocDaaUgR/1BQsW
         opCyWgy2xBZf963cnD+u44DbrPVLhTF3AdztCwkThTS4DHBKIgUx2SDcnoKpN7lNTSmY
         Q3UQ==
X-Forwarded-Encrypted: i=1; AKwUvByFaw1oDS+06phbg6OUzI+RCtthlsqJ5UlVjsJeY1vxT03IyhUSEZqBwI6OvQP5UnUqWrQyNp5dAUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhFRG2jLie36XzBdH1lcmy8i7LQAXxf6WOCjbL74ieF2VPNWqE
	Gji1jgwMu3VSdba1yQAS1D21xraSXxh2K++aVVQboz6XjoMpDXkym5RZ3wPqVoDliF7rhgkPImA
	BnE32jtwSaogp/jy7L1wooupjzJ4dA5NWhbugmGfR2wnXuh/Ssd+20LpCyIoJXus=
X-Gm-Gg: AYBFou1Iw+x7ATVD4+oqdxPSGdq+12OgCyUMiHayNF1QXQI/Pv6Q7ffl/t58KoXbbI9
	nho83/a/cs0Oa00h8z9puOfb9T5N/0S/DaFFWmTLEoCtkaHNPOq34X/htVzeKTLo3a/ZSSOYbjN
	ktkV+v+MrA9ZgU+2RXdcpNuVXLgf0hCu5rgfDhfTfvzb5GjxtV1NexvFavT78XGLaLHmsIrWAvz
	yPk4z9EDexi2mC2JJ5LAqTIHWl7pM8tP1goRazlcO1mINODWN9M8llfcewYMjo0LTwxCJ0F4kdL
	6aD1LAjS1+QWxEygEuLwdyWmR3lo/76lg3SJUEqluVWD2z6lOEPgnh7Ig2NVPqsYQLb0d5JoDt/
	FMdXarMg3DobtGjpYfeVqWtZj4EOmPMiXTDRu1Dee1rdpv/7PFg==
X-Received: by 2002:a05:7300:ae22:b0:359:2a1f:520 with SMTP id 5a478bee46e88-361a2052f01mr9491291eec.24.1792376160281;
        Sun, 18 Oct 2026 19:16:00 -0700 (PDT)
X-Received: by 2002:a05:7300:ae22:b0:359:2a1f:520 with SMTP id 5a478bee46e88-361a2052f01mr9491203eec.24.1792376158225;
        Sun, 18 Oct 2026 19:15:58 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm33841550eec.3.2026.10.18.19.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:15:57 -0700 (PDT)
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
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm8750: Set snps,resume-hs-terminations for USB controller
Date: Sun, 18 Oct 2026 19:15:45 -0700
Message-ID: <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfXyJexuGgdasBn
 HvtBsya7/FhRKy5iDMHU+6Q9Llush/JFxR4Vo2SeL1KLmY8DAp4nF+YpLJA7VyvrOtWAZRlZ4/7
 QveqYQuLxaWZ9fCygZFKVA/2Ce2Pwd8=
X-Proofpoint-ORIG-GUID: Vub0GYClqKgTpN67inToBTG1iBVWgmBX
X-Proofpoint-GUID: Vub0GYClqKgTpN67inToBTG1iBVWgmBX
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad57d61 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=_PA-CDJEJREJmSlHXOMA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX2xwefInWkgel
 AKOEX0GglbWylNzdrJ60o4QIcQ5qlL4vHYcziddJggsDaeC3r+Ll/uWrOPIHug9TwTSdukjFkKf
 7lT2yg6l9XaapQjw3GgXjVito3YBx1Q/s+1uUldfcWAXB5qIHu/R34O8l19KLgGxxyR/HVywymr
 B+w4CEdxmZxzE4VGBP+y9KCjE2PXG2dyTTGlIvMSp+jz/YtIpc6Y/H6vF87/qMNpbGjJCApX6hs
 BcRfvmDG+GqW5LK0ztjtdTXu87F+4OCESCFjPmFDZ8cRsgmCMvFWo/8y2sZqbHdVowkO+rRA7/G
 i4OZ1u1YuNguppkDAsvBWxU1pJVMc+e/FLtga0936z4lOvvrnj3UDDaHsq31eWZ2ccEmJe4ssui
 G2OS/LElHzBdAeIezB6dNxNaK/l6gyqOFO1l5Y5IlUJ8ECayaoG/8xDJMU8emJjkehomEWsR05/
 3T7LRWM+k5vsbAYH2vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190008

The DWC3 controller on SM8750 is paired with the M31 eUSB2 PHY.
According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
(RESUME_OPMODE_HS_HOST) must be set.

Set snps,resume-hs-terminations on the SM8750 USB controller. This makes
dwc3 core set GUCTL1[10].

Fixes: 7a5bb9f60527 ("arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 521b1d224c28..21ba6992eaa6 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3334,6 +3334,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,usb3_lpm_capable;
 			snps,usb2-lpm-disable;
 			snps,has-lpm-erratum;
+			snps,resume-hs-terminations;
 			tx-fifo-resize;
 
 			dma-coherent;
-- 
2.43.0

