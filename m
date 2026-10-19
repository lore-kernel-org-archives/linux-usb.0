Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73A8360ECF
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376160; cv=none; b=jkb/IxeKuVlsHvGg4/147Xe4y5hhdlHOmFtv2wtdLFdYgfiy5JBKY2AsfaQWnQwvbXdoY8m3QGsGvHkKGWnNAnACpidsh+JNYS3HeNsEJiKW1VLodxyahaH5aKw9xTJ8K36UfYCBdf+uiGfUkRLRuDBmwVfGYyCzUeyoAb0IfxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376160; c=relaxed/simple;
	bh=Dp1TMlpdZ+dS91HNECLHkK4AGyB4hgRlbjkwGiarOSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ATckABn8xWveOvomUS/lhfH3iALUNaMTGvUW1WUmmsrYaCQBNbDW1X9efOfnvo33YFoxaDQanwDo2GMfyfs/+jO5e8pOO+UcbQ00qndzzNuGM+dTjNa34QeNZZoN+6oNl9/uZE6YTjpy+Q4LhqTaizL/IdQVCYUD5v+1KrC8FM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKwkhejK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJJ6qYKZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKwkhejK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJJ6qYKZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1FRVh244434
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z5XVahu8zK0
	MXgLq4fcKODdpjac/qhpvtXBbd9Bo29c=; b=iKwkhejK8co/NAJKei3qD86umom
	OAj3ES4qJgkDtzYhL3VxJRzIKT3JUTDwHTqxy7syhM1msGx6/TOE0eGL2BBQtqFK
	zyO6SC0D6OApzqTWbxivtK74L2NH1QGAXwox5v/ejnvJp4xjW3ETaIVFLxtJ6uKw
	VuO4IpC+Y0eaeP00jpbMfkzAI1mPWci6b1SOq0LMPVh2jjvRnES0XN86zHpFKEPU
	uJFCWAmXxcmQAzbNT0hIVxS+I1cH/SQfqkdpdnmSR9pzlJcRPDGKOSV2emcVbfoc
	k5OXlybQ5ydT+/OaOC8yiO0LeKRoCNhTG88muub2B89+yQ1JvbsIG3axd6g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7vevd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:15:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3580c07911eso5085607eec.0
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 19:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792376157; x=1792980957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5XVahu8zK0MXgLq4fcKODdpjac/qhpvtXBbd9Bo29c=;
        b=UJJ6qYKZBl7OQmx+uUIavhafc8O42h+Hz7szqnZhPWD7YRr3mglm7WjX3J3PQ+wwlO
         LtCG6qGnH35gxhL4ztjPMXXpaKMW9fhzl9J/iaRGKes95/w1Rqk7v7z+AmE/oLYDN98D
         aPfwCRSLPjNuKusJCptGq1hM0mL7hSd62Lmqod4h0mMOqhif5ulgYgbNzhNkxzM/qrVI
         dpo8FfDFDHARGdWP4nGBHc0yYHtrOcIunuSyt9+J2nvIyOyJIwjz2qi3D5IY4Ukx1mQu
         eN3ea1+8rsWzq+bHRkA01bg/N9tCBw4XOwKnqW14sY4ayhYn055/duRgvzHW7URPU8Q1
         lYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376157; x=1792980957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5XVahu8zK0MXgLq4fcKODdpjac/qhpvtXBbd9Bo29c=;
        b=MJfnkukyFRhPNdIOFJVMngUMzGsJdq83g8iFVhwV1EDzHBNNQSV8MLJh8PiLWs0SCF
         GLe9aIHXspQacF2WG6il1aV1VryDr9Nq1Kx9v4u94lL5rXtwNtfxOgu3YdUxooKAQfOM
         p7gGmhvYJviofXDAbumQmhLzHfJc9zu7CzGx+obyTj1IDZfYfXfZxjv7wU1D1ACgXKLH
         wruoit0ZcGhm182G6p/TFQr/ZlF9P4ekCPWsKSMOswHju2uWKCiCDNoRJ86BqMw0bqW0
         XCDmZx17WbXpaYY6TdHPQxtFl+pxLo5CvL54daPCUDuj0doaWvEfTHHH4ynapYHsBquW
         4pPA==
X-Forwarded-Encrypted: i=1; AKwUvByjciz3NrJK1qspAh3xXrAebiC4p0BKb/u1LrNxckaou+GLgg3JYtBIzS4+nbUtpuxk7cKqDQz2p9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbxWSKkqDpBrvYEdi0gBjhJe6Ddbd5A/hEdmUi9bX2GxN3LM/g
	WeWSm8lo310RJVz2tT0oK5uVjuRC8VrmCrEe4r1d4iYf9LqLNlcHGxo5GacWbMIrsqVp3Vj3Bxz
	adQAQiShZWlEaCoz5eq1+rgv/0rEKLhPoz6ZlYmCJE0MYMbc+Tyf6q3Mdtrgwleo=
X-Gm-Gg: AYBFou0FfOC4KcNvnkV3EVrywgf2baT2WBrHl4ZTp7aCNgBm8k/wNWKqZrPM/hrY62R
	/055lWvx8tl842biTaVVzQRaRXeKQGkKcMgkl8fmr/3B19XjzJu5eHxqZohr6SWyzTRMpgdCvG7
	RK4iwtUjs7rj4OoPwckqiFd9tPEQssZBHsXwpC2NO2jTX0pNpa9NF1Rs4EOZrlnSmLM8bFh2H7M
	M6jCyP+nwfgrFDPgo9f2gXkWpajJtWwHmfeP+Kkcy+SnR6N7i8Aztac/BLpf0/4XrTKFEnrPedU
	zzzVGZwJRpi9JcYn2nFS5BtLX0CUwHMwFTV0psTAVZbvv3qwyQvxRy82b777C2ip36AIB8VgTqn
	4/u86K3d/kSdu5rQu48P/kGWbQ/ojGZYjHRLPrXSqkkl50HbfJA==
X-Received: by 2002:a05:7300:ff4a:b0:351:f762:a10c with SMTP id 5a478bee46e88-3619b20edd9mr9199651eec.0.1792376157392;
        Sun, 18 Oct 2026 19:15:57 -0700 (PDT)
X-Received: by 2002:a05:7300:ff4a:b0:351:f762:a10c with SMTP id 5a478bee46e88-3619b20edd9mr9199627eec.0.1792376156877;
        Sun, 18 Oct 2026 19:15:56 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm33841550eec.3.2026.10.18.19.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:15:56 -0700 (PDT)
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
        Peter Chen <peter.chen@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/4] arm64: dts: qcom: glymur: Set snps,resume-hs-terminations for USB controllers
Date: Sun, 18 Oct 2026 19:15:44 -0700
Message-ID: <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX2hZdk3XkwcP/
 8HiisuBE7dJeXgqMmrMfzOEiowLXbyGys9R6dGbTDqCES4rCRT8QARVmbHvVuB71gFwwgrxU+qw
 /fJTr7+fbB0iiOPO3ulwcocfY4fciBg=
X-Proofpoint-ORIG-GUID: S01vi58IkQmPf_HHFsliLO1H2UFOSHAM
X-Proofpoint-GUID: S01vi58IkQmPf_HHFsliLO1H2UFOSHAM
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad57d5e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5sioUILVtsypdmoVIHwA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX1e+6jCrESjVO
 wGFpqjU/lPA5JyLy7vLJFF/GUlIipsLos78hOUyIoGnrL72EFlrBR9oVqTSG+Jjqfr30NXVjXYG
 NVkH/vn3zDLD2KHny6GpVDKP8Tjrrt1fhx+vsG0O9lNIUSR/wg1FCoywmMWQUntJyOl/yxwAlj8
 6OUuHf56d4NZVo5H5ftWdZUxzbknQ/f6kuRGxiy21ZgUfWKHV3LxSIyI0XjCMlVDSHMlXH+LnjJ
 4PkTQbnkuY2mGpXb2JOhsASt32ChxwP2UCUk5016WyutOIBQQHN9f0bTFyLoGzuuijn3mhjKv8c
 sCnQpFHkOY+NWgHN+AczA4GSHjZ/jQ+YVAecTUJC+ZKF201jyjklCH8dR0hld4DSK0yCGFIRP0x
 HTj9xTKNo2Vos+NyJwzmP/lybawR193hc9AzKbogBzEj4e5Av1K1hDyYx4KkKTbYV92N8xrbDL7
 an3DDKsRrkmAxmY6h9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190008

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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

