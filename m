Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1185468C20
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142024; cv=none; b=hrgZ7F8xAn7qcFENn2+yGgV/zH4+9V+5R25Z2GwDdohFxY4+l1SIxWn6mQiR9zAWTJEcUmTZIKUZpl/IPz0aO3yDVV2PGoUc+2SC+Cr+b36mhCo+8kL0BFqABlt9TL4aODA7jXH5BJeigTxBjYNhR8oR9V4sIys3gpwQHfN0Rbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142024; c=relaxed/simple;
	bh=7q9agbgpzQxOyX+M44hAZTyBMqFZNk98vDVwI1A0EKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n70Eq80s+bRdySLAlOL6Ll27R0kBHLs4VMjDnJCuvaDYw/zXatI2AWa/FqrBkTwXOHcUv1C71rY+fBbWA28LzkE1YZr/AvUZ+ardAlLzgPn9eoFY3JTuR6QKmczVKU/Ym8w4ennfIB9kCZ22b0B0X8MjzSMoaKjj86V4cMaqMTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLiVwYC8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LH40EfmR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLiVwYC8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LH40EfmR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lKxT303560
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HcVpAEASL7gGTutXPUb9lMspPQldyH8a6+z
	fEwnScU4=; b=LLiVwYC810WoivBfVxXkpAGkJKvB4YUVUKfQOhI9naBmYJ7ieQM
	9TODIjAzwsDKHhildK6BAw5to0HHkdzWQakdNrVwc+uzV5dU5+WvFj1iD27RhrgA
	8CrYAwFV+sE1WB39iHLBkXtXI3YxcUvxdeC6IULm80B8EKu4rheMK5gEzBKDJgTR
	fNTR0WUnse7qeSAlcB5iqngtoBcM1Ns8mcrcE/W7A8HXMFGt1bYONWXTO3L6bXKR
	CDQAIs/XtNrZhPHaayBX6s7CIGIcUF+wZvhdZZDN0B0iPF/RCQurdNw/tSU6fen0
	iG5uLb3Hh2qo1IqE2QoqJtOVjXsRJBO7qrg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt93vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:13:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a04491c56so801306eec.0
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 02:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792142021; x=1792746821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HcVpAEASL7gGTutXPUb9lMspPQldyH8a6+zfEwnScU4=;
        b=LH40EfmR2xVkgNQVDmb7p3K3qwmDMb3LtCe89bypF/NsulJ2D7d7Vu+NvgQzl11NRd
         SqZT1iYPSNKIv12YpzfL99bM/VyDNiSwYriyD/M2Kaex2WDi109EfDjWjhwAcafJjwS8
         5DBcxpNk5yIixImU5kJKbUlzh95f3AR0QC2eyq99IbgqPFRN2u0DUOkOmadFxoPg0DLh
         yg82hBCPnv/M1l8jEFl9Nl166VT4fPcCFibS7ZhbnaSkrohIaCBBSKkeTGzxxPxIuIXx
         Ehqqi3G9NIuKJ+cbqds9oZ4x3AouAtnGhsAOyfOYJzE8zoWdr++gtNHCWKTFThDQLT+1
         q8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142021; x=1792746821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcVpAEASL7gGTutXPUb9lMspPQldyH8a6+zfEwnScU4=;
        b=S1li9FD1Tm++G2qiLPk/vxkBKfdITYX7kBEb6s+567LVEI+58LVQ+HdDipINc21AfU
         VWBVWB3tyf/GBmuXn25Q5ciAwbDlRoDzVvitBTn5QGayqqghZko7rWib6OcBwQjy1Wom
         pOrTohsCwAVIt0KV1LwTpy5cvl5UofeHyxME1tLp0K0vFzTx+bmpLHD/Ukg3YnqbXLAM
         jHap9aGAUTvjVjK9bLWRdvs9U5Hz/JEJ6FRZpKmUdY6/2L1lUPgCZuEq7xuqOo5vor4X
         aMr8kKOQLNjuFHTDDyWpoOyicZX1mj8UDRgk4DcP3lrOjYOuamAbfrhn+YWWt7sNkkB5
         nxnw==
X-Forwarded-Encrypted: i=1; AKwUvByxA+h4bxgfKd3QHGI9Hw2QK4FV7UEMrPnYUwTQc2oEjNVurSL2EF751nd7lIVvVuomd2xSaLMqEqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ3lijhvpPtb01HsgLZ6/w5xiwhz1TJlBpw490W7VUNaDGNOYQ
	LmkFzIi+G6ium2JeWlibMBtspXqAEOD5p+/HOaJYiyHNSZkZ7QhXLmTZfGeb/iSUXzpCNe4NDpP
	jLJkZr6RmTdGUma4jcjQN0WgQClz/SMZzUVGmg7pLDZGgqqPfkfpCQUcxxweXJ0Q=
X-Gm-Gg: AYBFou01YeQwNXqT0que588s0PHBd9dyf0PSslLFGIzRUUlz78wFkyg6ymyKxNuA65Z
	wX515Zhiahx9RBYfRYMAGznBarSU/79C0rWIW9/mXr0nCdZbDSL1ltcmPMvGn2x2YWyeAYqSXI1
	qa7nRNFUVNv7IE2B41JxaEc03cVgSTgufo1RN8BIyy3gjp2Xe01K7Vjlfq9HB83rOWlNiM6szn2
	FZqRvRliKQJt0FOECVF08sNKSj32ZrvdhRtq3R+nTJL6LkOUGRjdJerBD8z66bDRViZ6lpyqdnf
	wWHORxC5XkyyvZvcWu7nP5HnyoHxO/8gl+HP5TgmQVCrn6/wWyEa8A5Wla1ze/tiK/1WQWwa8iS
	Qtc9Q02gvCyONkXCK3IZcnNEraYVNIxCSrTtyetWbntL0OyIm
X-Received: by 2002:a05:7301:6181:10b0:353:5d7a:cabe with SMTP id 5a478bee46e88-3602e2ac972mr3055237eec.13.1792142021146;
        Fri, 16 Oct 2026 02:13:41 -0700 (PDT)
X-Received: by 2002:a05:7301:6181:10b0:353:5d7a:cabe with SMTP id 5a478bee46e88-3602e2ac972mr3055186eec.13.1792142019999;
        Fri, 16 Oct 2026 02:13:39 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cc23sm6195378eec.2.2026.10.16.02.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:13:39 -0700 (PDT)
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
Subject: [PATCH 1/1] arm64: dts: qcom: glymur: Set snps,resume-hs-terminations for USB controllers
Date: Fri, 16 Oct 2026 02:13:36 -0700
Message-ID: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX2x3xVZOW++Y5
 ZInlw8PyzQJmhRiLEZPhZjf8eRnJU5+Ovo255jTr2sXoRWUsr3PzQFWKmA3cdeb/hcxrmZUwIFf
 jop4EyL7XYYwwFBJgQjBqVS7HseUQuIKmJPILYYd2eAwucReOe0VdRFiWMLV4ZwG2gRlgB0Ylb0
 z5omPiSKvJoWtfiAqhKnbFWXmP4EVdpsv9NyxmhDM1e3kruEmPtPGNQj3EIBlyLo/yEIk+0DZW2
 fd65nunPD7NBU4eLw/vBQh3xTn8RQsNCI6Eqk96U9X/qfxVwNfVkKY+D6AqX0ya47LOdNt7muK5
 xV0NjgvU4ic3enFK7iT5cjIZ9Kq2gSlCZl2GPMr9Svey0SPT0TI/Ou2LPCoa+v4mhA1Sq1AlRys
 fN/kCjMVjqXDCHshqQ5vZwvdPmeC4gZKtnf7rt5dTV6onvifjnWARTgp743wEyhabRhBxU5UK0M
 qie1P8ySgRAHJpzcN2w==
X-Proofpoint-ORIG-GUID: zQHJsvCsHHjMDN5axvU1Yq-bDAOnbWGh
X-Proofpoint-GUID: zQHJsvCsHHjMDN5axvU1Yq-bDAOnbWGh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfXzx2f0i9YHpTT
 BGf5dFgdxO/NDxlzYLcDiY5fgOSfVdXfYP2/bJG6Iy0mEAymkA2AFeEArFmqULKL+T+A0s36RGO
 x/mOTMIdADcyT3Gi6JWX2Kg0wFDIQAY=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1eac5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=5sioUILVtsypdmoVIHwA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160036

The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
(RESUME_OPMODE_HS_HOST) must be set.

Without this bit setting, USB2 HS device cannot be reset after it is
runtime resumed. For example, after:

  echo on > /sys/bus/usb/devices/1-1/power/control

PORTSC.PR never clears (PORTSC = 0xe11) and the hub driver fails with
"port_wait_reset: err = -16".

Set snps,resume-hs-terminations on all Glymur USB controllers. This
makes dwc3 core set GUCTL1[10] and fixes the issue, tested on Glymur CRD.

Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269ae6e10ea..023a8448449c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5544,6 +5544,7 @@ usb_0: usb@a600000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			usb-role-switch;
 			wakeup-source;
@@ -5620,6 +5621,7 @@ usb_1: usb@a800000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			usb-role-switch;
 			wakeup-source;
@@ -5696,6 +5698,7 @@ usb_2: usb@a000000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			usb-role-switch;
 			wakeup-source;
@@ -5783,6 +5786,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			maximum-speed = "high-speed";
 
@@ -5858,6 +5862,7 @@ usb_mp: usb@a400000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			dr_mode = "host";
 			wakeup-source;
-- 
2.43.0

