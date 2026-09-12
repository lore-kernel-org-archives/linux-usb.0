Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1B53F12D8
	for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 22:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253599; cv=none; b=JGh0jxXV074GrBePFEBOR6nLqA4GGs6blvU2ApOOVVOJPMwpiiPIgIL35Coox/qVtGrw416xBVjxsr6BgJNO2oUGxQrMhlYha+MGum7I5WbKWc5uk/9CyMFyhWO4I9Rc6Tq9yFXaoOBmlzTKtpDvzg3oR2l7zJ0jwe600L6IBac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253599; c=relaxed/simple;
	bh=5h81S+wiLRMEczDKuwMd63Le1Hq21YJ+sdFojiZDA1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WiOZmDjWLQP8Jyg9AULibtld/K5HzkR7oIKDd5v1dnUIRPFR0D+4Vm2NWcEBoAudVZDfxL+EJMOEe+6ogIEWvuvDYM21+172eFzouQaLdlZeWOcbjJIDGHJuLblpC6L64JyglI154Ccs6J183WIn4P3fJQJCGTVABcBecuWcIT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ksjnalqz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cwsqc2u+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksjnalqz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cwsqc2u+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLo2fV1081027
	for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 22:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M2XxE1c7rix
	aVzyJRTHw6QQF+YpcgRrq2gG3nMUhGIs=; b=ksjnalqzj0MX6Mo4HwkjMcqEjbF
	PT2EzdV6gAHkPFTf8kiD4WvG2RNCaTWN/0ieKJp6JATvasZ6ZR7kNE90Jv6XjKv2
	fFkYQ8FYzIpfvfvh78doXgRoFEiP1Xmp4f0IotKpqlrR1D7ab2TSmzez43O4ZQfc
	50uXJr0q/bqdWkcBW/P+AlLM6mAK8xBwy78iS5cvhvFkRhtf1Cw0TxnNtVgnu2mf
	E90rfW1JNjAMUbDfoezptfq2/bD3u/WSBC7/8OU0C6xZWC+rqQnNmp8DSXfUNwwZ
	klU5WIUpZeLt50x4LeH4xJoO0p+mprIc7tY7MKEK8OSj+YiAlRnZn+dILow==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cj2ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 22:53:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4e0dd08f4so591300a12.0
        for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 15:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253595; x=1789858395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2XxE1c7rixaVzyJRTHw6QQF+YpcgRrq2gG3nMUhGIs=;
        b=Cwsqc2u+nAN5z0zbCmyb2O45dW6/Z0GoIC6HMjgbk8gwTpbfBDRBI/CNdt+YGpSaVY
         yvJQJ0jvFVyaAPSYjWNda0hfb/p3yUrVaUSI0DFSSwwRSkw6Zlor4iIU3s2xZPpOApgH
         ylAqBJpsa6Xq6zx5masaGGgLxCQ3sr1guhfX/ArsN00/3Aqwk1YHNJwG2iurxBUOaohO
         F+eUzRrLFLXEGxCLkk4aVfjXjjB9jtKW6kyntX+dszQDX2iU1J+ySNqh7v2tJrIpljF1
         h3YbItBFUJJRh1bcdGwdjs5O7HfHaDkDQvK9jyKNpa0IZZ6wgdmN3kjMNfgnfLtbpXOy
         JEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253595; x=1789858395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M2XxE1c7rixaVzyJRTHw6QQF+YpcgRrq2gG3nMUhGIs=;
        b=fAcG9jPL4oxn5sf0WT7pXiuMdAN4lpsJSPdNF90KaQukXwM9i1ZLUvOF8COMG496Cw
         hhJuQ8qtzvTKaDX8SIiyfci8kJ5hmUt/0GhKUnEJDe8hD2F6Mx5rnuiTbMCp9ku0i7J4
         xhmEsmR9Wz1fflm8yiOdAMCF7OKhwsm3Qv1+bQ9eCVGjsQ3/tGJ7ixABIztrevAMXfw9
         5PLGIwj0nCA2mhg6glMtl4q9lhYySBFgV3UMnASJUzDQdr0g9ayv1DQ+jhfUbZ3zuIi0
         ZZztyA4XEtG1mEqFRLulZ/IMCkJnK789+d5JE5F0tX+wvG0bW5A2HCmLn29j5LOsHhwP
         EzhA==
X-Forwarded-Encrypted: i=1; AKwUvByT7Ta7c6P7zqS9u5LZGtnDVrVzT4NCxfpy3O8Wn1i/n9wOAP+xcK2c9l8AyM8dvkuuCdc+FfDgeWE=@vger.kernel.org
X-Gm-Message-State: AFuF++kqt+BfvHsI13ARUbpwhtjC4v2ruY4qndKDr8eY2FPLDNDyY1ZC
	9YueSXZraPDTwfIP9AgEy2Gh05D46kQEUwPJqh+HDaGeT3K1129WCrSgJFhBTncelA7zzhGgWD5
	/Dzz3VITCnW+zqjw19kRy49US432wnbdLyp6kokn5YZJ3YwOEgoB/2YfrEd7MRBk=
X-Gm-Gg: AYBFou14KJ6bJxgJGDNOovcbBwVTSpcaNws8MiKzhteDKpF6Ej2lmqNfvxCVX/j/D+G
	UiRjcypfK0NIvWbtmWuIXOiNV2t8gNU+thU8kPL2KkMJGlffW0JZnIcKhjWp8e4eLaJ047/SkIt
	nnCrE6Zf8MuL+8DYHZzyUr5hf/KNdH16kMHZewP/hYIY2XNX8Jx6wxLGcztNFkwQmzPt+ZiHTmT
	PsA1cLRNFp0JZ04+arNhl+yp+HXJT0piejvurB7hJKNH13mA5srZ23F8aq22uedk7fktAUA+f0i
	COWFGeySBQIh7OkB4xKpad1t4WcZ1kX+j9FC4rTAalxEzUXOE+FEx6c+HethJneHt5XexQnRxq/
	5BLVVp0pS43qTQWLMO3ZBcesfwRtlpQ3EPo3XMIxENoI1UGVD0dv05Q==
X-Received: by 2002:a05:6a20:1446:b0:3d8:1f68:59ac with SMTP id adf61e73a8af0-3db0e45d166mr8378887637.23.1789253594852;
        Sat, 12 Sep 2026 15:53:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:1446:b0:3d8:1f68:59ac with SMTP id adf61e73a8af0-3db0e45d166mr8378863637.23.1789253594373;
        Sat, 12 Sep 2026 15:53:14 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:13 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 8/8] arm64: dts: qcom: kodiak: Desribe EUD UTMI routing and connector mapping
Date: Sat, 12 Sep 2026 15:53:01 -0700
Message-Id: <20260912225301.3396556-9-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX4W9xUDLu1a/K
 ZmTelNkegXKNGN3DePNlrrE3YRjEwiQSDHDVwz2jZs9YmxmkOjoUuhqI/sDBmA7w0uGH998ugoH
 S+sol2SQ5SsKoT93uIkZE2RASR5n55x5htRgPNt5mOISn+wbqrQmMX+pJwewC+RkgZ6N8FzWEJk
 24Sg8Mxuw8blHDAr26iQ00bbILTUCmlpn1VRlP6AuqPX0M9y5ghTA96660L3uOIiJjj/2QAa6ZJ
 /vJzuCZTC9ycNpmHq2011d7HOZnsaybymQMZOQqn1whhfuu3w4KYJL+zfEA2tQCff3Xe5rKcABI
 Eb4JlLtytbSXUBsbOMgPN1gIayG50WBUwvS/m1qO8NkQUBbz031quVVn1w0nESguc2iOe27k4Jt
 KWqFRZC8N2N1CThy/fYflgM3IfU+ptTN6AlE7mbrCHe2Qa+5w9fUUiSWv/cNMTE1diQUukr13VQ
 1Tzq545PHWrHIuGSksQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa5d7db cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=EqwfFjFrxzYmPp_XjFsA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfXzMdF0ugWVOxf
 3oMaAOOTetRsoBuAQ/HMbZhi2NNNHFydmsOVOlexUnsfB9gGjwtbxcj6R10zCBLwx8Tvm5/ksO5
 Xpi0+J1Cd9l8j1qAKbBFS0XbyJXNwDU=
X-Proofpoint-GUID: j-AUKr2Y9Gi8gjF03Z-X9x6AJgMnqzhl
X-Proofpoint-ORIG-GUID: j-AUKr2Y9Gi8gjF03Z-X9x6AJgMnqzhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120334

The existing EUD description uses a legacy single-path representation
that assumes uniform UTMI routing. This was sufficient for minimal
configurations where the USB port operated only in device mode and role
switching was not considered.

Update the description to explicitly model the topology using eud path
child node and add a role-switch declaration to reflect role-dependent
UTMI routing. Also on this SoC, the EUD hardware intercepts only the
primary UTMI path. So remove the USB endpoint mapping to the secondary
controller and associate it with the primary controller.

With the intermediate EUD node now in place, update the Kodiak board
descriptions to map the USB connector endpoint to the EUD instead of
directly to the USB controller, reflecting the intended hardware
topology. Enable the EUD by default now that the complete topology is
described.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi          | 37 ++++++++++++-------
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   | 10 ++---
 .../dts/qcom/qcm6490-particle-tachyon.dts     | 10 ++---
 .../boot/dts/qcom/qcm6490-shift-otter.dts     | 10 ++---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 10 ++---
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts |  4 +-
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 10 ++---
 .../qcom/sm7325-motorola-dubai-common.dtsi    |  4 +-
 .../boot/dts/qcom/sm7325-motorola-dubai.dts   |  4 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 10 ++---
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    |  4 +-
 11 files changed, 61 insertions(+), 52 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..6c64dc9902e4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4421,12 +4421,6 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
-
-			port {
-				usb2_role_switch: endpoint {
-					remote-endpoint = <&eud_ep>;
-				};
-			};
 		};
 
 		qspi: spi@88dc000 {
@@ -4753,16 +4747,30 @@ eud: eud@88e0000 {
 			      <0 0x88e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
 
-			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
+			eud0: eud-path@0 {
+				reg = <0>;
+				usb-role-switch;
 
-				port@0 {
-					reg = <0>;
-					eud_ep: endpoint {
-						remote-endpoint = <&usb2_role_switch>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						eud_usb: endpoint {
+							remote-endpoint = <&usb_1_dwc3_hs>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						eud_con: endpoint {
+						};
 					};
 				};
 			};
@@ -4989,6 +4997,7 @@ port@0 {
 					reg = <0>;
 
 					usb_1_dwc3_hs: endpoint {
+						remote-endpoint = <&eud_usb>;
 					};
 				};
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e..b1f1ff6b99e6 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -98,7 +98,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1530,10 +1530,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1573,3 +1569,7 @@ &wifi {
 	qcom,calibration-variant = "Fairphone_5";
 	status = "okay";
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index 5bb33a8a9830..41836afd3acd 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -74,7 +74,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -828,10 +828,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -864,3 +860,7 @@ &usb_2_hsphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index cf74b3664cf5..45b9318ab54e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -84,7 +84,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -951,10 +951,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -985,6 +981,10 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &venus {
 	firmware-name = "qcom/qcm6490/SHIFT/otter/venus.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb0..6520e920a844 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -211,7 +211,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1402,14 +1402,14 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_dwc3_ss {
 	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51d..4c4afe691d64 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -77,7 +77,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1052,7 +1052,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 13e8e62f6205..b9f92bcf84ab 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -93,7 +93,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1098,10 +1098,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -1135,6 +1131,10 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l7b_2p952>;
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
index 3860ab8508a0..2a90de989dad 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
@@ -96,7 +96,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1429,7 +1429,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
index d94571c05a59..7a97a3eedd5f 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
@@ -98,7 +98,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1428,7 +1428,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index 7db9ae1c3cef..540dbd247c38 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -99,7 +99,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1438,10 +1438,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vdd_a_usbhs_core>;
 	vdda18-supply = <&vdd_a_usbhs_1p8>;
@@ -1449,6 +1445,10 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &venus {
 	firmware-name = "qcom/sm7325/nothing/spacewar/vpu20_1v.mbn";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 87f267aaeec0..b0bdbcd47503 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -94,7 +94,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -882,7 +882,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
-- 
2.34.1

