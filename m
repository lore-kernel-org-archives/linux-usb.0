Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203894C6EF8
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321096; cv=none; b=RDAK9i1tjZnPMVV3Gdn3uBHDjx1LClhkeHChMDCEsQeMiXR3cAsUy9KTcRfV0qAekQvumMdC7dJFFoCpPqfB7chA2ct1v3BEwrFfeIU0+PPhXrpgsOAFyXAZqGlOW1cp0NWjFlzug+kAmfuP2kMOb9koHY1xSvF8ilzNbICZ5Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321096; c=relaxed/simple;
	bh=p5ms3ettnsZUkMaMVpgaQ1dF7NvICnT7m59e4toR5Yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UEbOnQFLaDZvtS6UCBXJvCY/9/zUs8w+TbgbKbzq46A3XRjFEEThJ1k+O3pcG4oqyyloiodZhpcfHyBiyIf1K7i2Oved1+BFG08aEwYBDapreNM3S7q5lnfSAjlTRYKZm6uTwTZuJJ4Z50caiUrRYlWUZNQjKdU4RKxAHkhL/QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6A93P90; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLVrR6UZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6A93P90";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLVrR6UZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCokLK2257264
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 14:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHxd2nhjsoPjXsrENyRfnR3wWpIKcv2XiaMwrKt9YmA=; b=X6A93P90A1+gXmS4
	sQ924F9ZEelFEAAlsvB4FCYrHYhG0NuGkK3eEsWfX+keqmu3/7czdEeLWn8Y1wFe
	q9GZE4sQGQm8pJ1Ffh3HutYRt6vqIDttCM4hi4LnwIou4j9ZsN1xwfyrcTZqrap4
	UN41YUSI+I+eaqkXZCDgE9oLR+A6mnTeS4OlTIZMwfWx99BHGgamkVzEdSGJ35WK
	YQFc8xiw7skv3h9dHeYiExDPHM8NMYEM1fMCAMgH5O8pYkE2hAx1p66LA05jDBrU
	AK3ApYHkVlcCZFN3I8suAmVEwn+8iln3MvtOuMs5cjs/gEq29xr9pfZpXfAXKMgy
	SzMMHg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecbaadb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 14:04:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1514387a91.3
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787321091; x=1787925891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHxd2nhjsoPjXsrENyRfnR3wWpIKcv2XiaMwrKt9YmA=;
        b=FLVrR6UZ3p/S/Zm52aiTRoUHFNApN3loZXRfCM4aIcSluznG3rj90jW4oJc58Ss0UH
         BHUc8j48QZ547+vZPlExejp6l7NWJO+mXf2zf2WR+LV1FRrtx1BSBaf0WbpZh3cxb2gF
         c8Z+e7O3PZp++uA8XDqMsIzG1RYgWop5yh9eAQ1E7dJOqpsUzJ93MsltfSl/IP9g2Kp8
         o8cJCpxBhyqmvVc2ByhOabq3f55zgmfjn3rs9vLa2Zrls7pOmccXesus2MkagkO6y82h
         J9q5sYzgacklNOsmmMd7jYrjeTx/u26ApZCgD46J9xyMqTVzromsrrCXDS6btuPH/Krx
         jKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321091; x=1787925891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHxd2nhjsoPjXsrENyRfnR3wWpIKcv2XiaMwrKt9YmA=;
        b=Q0+Sqz1PZ8UOc1gj7yPxUxcCTwzozYESxlmByIQhORu3z5PHDczg/STYWdCqlmfSjO
         9IbT8O3UV8/QpJY4D5+7Zir/DBO20pEis5TPRO1/eRaqo+v+2ar6l8ZNUqfL10pGodcQ
         QfudW4L8DwKxIRRqU9i4sEEn/VZOCkdhdhTygIlswN0Chb8PO7iYfORTFnjr8P+jQI5Z
         7POp3uqMtqxmjx82y8Y6oTak6cKCegUJJ2H3RdYsk0rOxnqJRSfW0vNoPe7/hnz5L55G
         Ay4Pt2WwJLCuuBF+bvUTmXCAfs7o3Da3ZL4Q1jxdzhsM4YVVkvjuXxTa8qMxEnsLPNNO
         X1Ew==
X-Gm-Message-State: AFuF++mYiHoxne42vc10UjsKRqUNF3YQy9SnqZCP1R7AWPul+sF41PSB
	sGCxkrGQwBiifIkW9aLocNPg1Fm61vPsTgQ93M16zsR22WxlhPRLkjMo+GPWKeCuuc2UEAdB+Mp
	vVDGQGrRwHyBuB1isG4Yiuek05pI8z3O9WjYWGZH/jzkLP9XIQvsSsA+UU4Mb5dU=
X-Gm-Gg: AR+sD110KREnzEwiazltMlcT16ukONZjOJdbSpN96jb2tn3gLXTbp1ryPQpEa6v9yiI
	Na2/ErhdJ28Ezxw22IUY9JBxKanppFGWxO9clrDY6sYu17SeKSUnQB0ZCm5IckJznCp4Lq2FQkU
	nl1Te7QGvU4EAg6w9KvUpvxycRYWzRNp3V2vJt51NuPX3Wa26FkN2vN3Xg4DWP9JPfZIpQmrNPB
	qSpwK9YMDKTcBbrteHXRqQxL0hUYXRuB0X3I1tzEzIqpl/WUVeX647qi5vNT6oDWjYf2jboVLWM
	IhGcY7GMl7HPe0+0IMokoLwKmAwREm/uIsBx3hCB9pMhJKfHKozp0wuJo9E7Kgg3fW9UFqhHYyV
	py0yzIZ4Q0eaDSWTvqUxMgQyeTIW8
X-Received: by 2002:a17:90b:384d:b0:38e:7f1b:efa with SMTP id 98e67ed59e1d1-395c37130eamr10641007a91.11.1787321090596;
        Fri, 21 Aug 2026 07:04:50 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:38e:7f1b:efa with SMTP id 98e67ed59e1d1-395c37130eamr10640910a91.11.1787321090030;
        Fri, 21 Aug 2026 07:04:50 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c45530absm3331680a91.4.2026.08.21.07.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:04:49 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 19:34:33 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: shikra: Wire up usb-role-switch
 for USB Type-C ports
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-shikra-usb-dt-v7-apply-v2-3-628885fc1d0e@oss.qualcomm.com>
References: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfX1HEQjg1QtDyZ
 kHglxL8Rv+fwy9XBv2tF2Q+4TN6cCFAaiva3n4GJjTniTcfpqFYfOf11fimXZLTPv8v4aszLpQS
 U/cqi4sMWBtb3dkrKgIuiYGeBf5WIeFt0d7JJsatBM/B1C39bILhIKIcqavrHkSBt4NrO5q5H/W
 gG4ge13USneOwTKijn9t4qoqaPCZuhjgZlk8gckZHFG5+GGiYY+2q7V1qY2gtRUAtsWY9aqWhYv
 pCfaLCxcpcQ1Ue3I/IGsmsR2YJvC1g6WnSht9NYUKpjNewOvnoCdMe0vVfdQ56NuzWHgqPpu6gv
 XvgLhou94N7QHVSc7UQiEFp4hmQRpfZzsUhk3m+gZlzfwRmOWz+kIsltWHNLTzGIdnvS5IFx5do
 y2baSJhDxh5mqI7mkbSGXLhfJj3X6uBL64gEKn7T84zcFTY5t/iNMW62rxtFbd3Ck/QwpjpAK06
 GXn+EcT313XBFPtCQaA==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a885b03 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OKfUiDEiIDe3Zo9lHMoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Dh6yWpT539M0m07DdvXy_i7-omEo_FCx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfXy48acihnFCrp
 6Gd/w1Xsf3HaRNwd5zriNyDltZXSpWvsEORxZ5sGcCOU/ekOaLjqJzTfV7QcPCH8iGJy5IDLguU
 eJaGo+6Iwo9DXteWyG8DSIUSBKjzDRQ=
X-Proofpoint-ORIG-GUID: Dh6yWpT539M0m07DdvXy_i7-omEo_FCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210108

On Shikra CQS/CQM platforms, usb-role-switch is handled by PM4125 on
the primary Type-C port and Cypress PD controller CYPD6129 on the
second Type-C port. On Shikra IQS platform, usb-role-switch is
handled by Cypress PD controller CYPD6129 on both Type-C ports.

Add the CYPD6129 typec node under i2c3, wire its connector endpoints
to the corresponding DWC3 controller ports via remote-endpoint
phandles, and switch the associated USB controllers to OTG mode so
role switching can take effect.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  |  84 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  45 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  |  84 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  | 107 ++++++++++++++++++++++++++-
 4 files changed, 309 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 3866ab8b0faa..41290b562fa3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -42,6 +42,51 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
@@ -58,6 +103,23 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb_1 {
+	/delete-property/ dr_mode;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
@@ -66,11 +128,14 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm4125_l8>;
-	vdda-pll-supply = <&pm4125_l13>;
+&usb_2 {
+	/delete-property/ dr_mode;
 
-	status = "okay";
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port>;
+		};
+	};
 };
 
 &usb_2_hsphy {
@@ -80,3 +145,14 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..e4dd793c882b 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -85,6 +85,51 @@ &pm4125_resin {
 	status = "okay";
 };
 
+&pm4125_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		vbus-supply = <&pm4125_vbus>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm4125_hs_in: endpoint {
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				pm4125_ss_in: endpoint {
+				};
+			};
+		};
+	};
+};
+
+&pm4125_vbus {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <500000>;
+
+	status = "okay";
+};
+
 &pm8005_regulators {
 	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 34568f1c7b63..36514a31d66e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -42,6 +42,51 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
@@ -58,6 +103,23 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb_1 {
+	/delete-property/ dr_mode;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
@@ -66,11 +128,14 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm4125_l8>;
-	vdda-pll-supply = <&pm4125_l13>;
+&usb_2 {
+	/delete-property/ dr_mode;
 
-	status = "okay";
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port>;
+		};
+	};
 };
 
 &usb_2_hsphy {
@@ -80,3 +145,14 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 543d769125ef..ee0b55b2c462 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -42,6 +42,72 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6229", "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 50 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB2-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port0_hs: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		ccg_typec_con1: connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB3-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi_ccg_port_1_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;
@@ -58,6 +124,25 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio50";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb_1 {
+	/delete-property/ dr_mode;
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;
@@ -66,11 +151,16 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm8150_l6>;
-	vdda-pll-supply = <&pm8150_l12>;
+&usb_2 {
+	/delete-property/ dr_mode;
 
 	status = "okay";
+
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port0_hs>;
+		};
+	};
 };
 
 &usb_2_hsphy {
@@ -80,3 +170,14 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&ucsi_ccg_port_1_ss>;
+};

-- 
2.43.0

