Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550549;
	b=TZbcABM1jQ/SYWRE7CqCjQpOyEDgXgodu0LC4LePuJReAC3eVfWLUrL07YQAo3LrDOpt
	 wtJviITLt4NlC5InOmvPLTeUta6Uye48YpQ9bD9Ykm8MbLX+7ivpONMAzzN1eYEJAwtBn
	 NYhk2kYetu57AefHoyU9KdWKYapi+NrydNnbca+TLo0ABRwNITQTl3HeCnJmRkVT95vBo
	 LHmCGQYqu2tcvxEoG9YWjBfNHXHijfiorglNJdQs33Qn7wWu7g2PSGKVw+sUDgr96CLdR
	 TZYOdf/E1nzfLFF2rqhhsIBVcCbzF3BRAuctdyaGUcKFK86OffI4b3pKjPoRvIlvULw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Eu2E32/ol3peL/W2BGbxgpIsqZt2KnAdADPuIMiKPDg=;
	b=5dUYoHDB8W+ZhOSEIcTgW3NqLoAqjoVrHZgvx53DH/n3+EXD/BChVZR3x2EJWPgd5BWW
	 XWvSGtu6h6/LfGlES7CI7H/dNpqHJLg7uR9gGDb7+E6/pzIzChTd9dOdcJubeJGuOx2kz
	 SDpE0Q8DcVEMWcm4sjtSxpjufxh4Nd5IaMH8VgpnKadWs7ydO0LK3tWBlkp0ZLq3k0zL3
	 L0qe3NoY0hkVM9OYN7z3xzzBXTNBoO7quOSUgeaQK+aSzRYT37KSS1hApxB/9HXnSSdkO
	 0CJx7n4idKu39Z5w71OFxzQnWY9qdOIbwmqi6Ig6Ar9XsYtikH7o2O2hIYjkHDwCXFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j5QU4sZh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BRbAeAyj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71231606A69E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71231606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j5QU4sZh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BRbAeAyj
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXCJA1132238
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eu2E32/ol3peL/W2BGbxgpIsqZt2KnAdADPuIMiKPDg=; b=j5QU4sZhI2xHgCjR
	p6IcSFGTcbJ82rex+xr1SMhGv1h5qPLhaPUFbQ/1uV3wPzeKB6gijASmOJCZjoxb
	dNITbOgJfcdtYUXdpMOdcdddYWfQb5Szaa2aDTSIm7iUoheXBY+8a1E1fykqei1D
	+jMaynYSLdyNOvppZlm5BJWbXBcajixJM3KoN12E2iQoYP/QFghY5ADuIO86VMZO
	QUxAt791k2lHBqNZRa0hiyiJiBidZrssi2oDSsj9V+fwv2cV8tTuEjJ+mkeQ1lMB
	a1S0FbXF4oSniGR/j5XMGaKap7HsRL/sORiGho1T4HmYda6mhA8PAWUL1DT8A43s
	WnzyTg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eyd8nw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b436d37123so801938a91.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 12:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550547; x=1796155347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eu2E32/ol3peL/W2BGbxgpIsqZt2KnAdADPuIMiKPDg=;
        b=BRbAeAyjjgVr3ZniJikg8nXWvG40uDcmCCpYVMXLCw71vNKT+5q/ytU13K7e0A77Sf
         5OGecJTEopUAwi6CPvtZogEHOQBoqjPFISMZs1wd72jy5sV1bhZJu6t9P2/8xLE2NCLd
         IpdcAje667BKsM8Tum6/ybsr+SbmoYBXOMgFXZDwRodzH2kHgHfsXkiXnjVVaDoUr4Xw
         Ri2S7ZjxJ4OW0X0GF7Aqyo4yLiG2Bs+N0uM6rzgv4UslaXxLvtrfeJW4yNI3YSz8GGxM
         PGrW3YKQOxndZtoeqyCCxd7xqfy28FHlQI89MNLVpMqBGGVrBHLQV3a8BPop/uJaRRTe
         Er0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550547; x=1796155347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eu2E32/ol3peL/W2BGbxgpIsqZt2KnAdADPuIMiKPDg=;
        b=Og4OyJBO3bUFxXQlUe5E/y+Hm/k8/w8qEs7RStfSV146xGrbtMskKIp2eB+GsmaXM+
         2SEHGToi/C/6O8MUL+gN2aHV/rIJkdldNaKGJMb0XeUwyCWgIbXCbTnXXOL076bEQtPD
         4gNR8/rBnAxuK7JecXWOULGmXNPGAPK97GlTFyX8PODWlZIn9r3XjdGpY9nkn0lJIU+l
         dNocTBAxyqZsXhTYMzNMWbvbALOVLBnaezQ9dhK4ZIPgXKFIniiCf71SInQLyCIwW+TY
         yRJNIkUV4pXG2fqw9DBtwI0UHAaGZQ/dhjd82pfzDxyDhQPyh2RJZr8BnzMcNR+S8MfZ
         1IjA==
X-Forwarded-Encrypted: i=1; AL+hErEtN+6nNuCKP1Ho/CfVMiVHMhRP8G4oWfYevVD0zzA5OtKNZYNy9dEwsIAOCg8kRb9ImJ681HSqiZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z97MfoIO/uzBl7CFpt+xcnqgCFHO7DpV8Oo3BY3vojK8qqFJywd
	PE/IPWc1xFN86RyCNPHII5ol3s34bnZ+VIQHQ9W7H6jamJoRCkLXuZoCy4Z9Qen+VyPL7wuE1PH
	irOuVEO/eOGnt7LDKwAZiObVawlHPe1RKRGKq+R9UnBRGTpsTTcaDvChFmoPU1/k=
X-Gm-Gg: AZFdTZfpXeMF0TytlH6rhI3fen2MdK4b5YGs2whfNk/aMtdWf6u71Oei9jROhZJNpi8
	Wdvyfygkt1UtMUSnRQnjsQ6YglKBAmEsHYotXfbYHtL7qSCUepNjL1J85wTC49Fyx+MmKwx9fYE
	VQTcf/Chs2omzer8tug0W9ZLKkxEEF5t/DcjgtAHWyYT6Af/cczKnn7GMYqDzAPUiAe0olyFnEf
	JzMT2KhzwDyvUPBM0d2aS3P3qO5h/LWIJE2OY6Uhn6/MKXMS+yriFRTGbGC7i1mqYy+G4KZgZyx
	+VhMZrwZWaHhnR0zWROjf7j7gAiedixmCVZ4pk/xwPbZRiNeFfxunKI2F6lbSQ+fKwf0xTPjPNu
	4wlpCqlYz9nIYnzFgTPPzKgI4wex+UOAEmOFDwb4wbFHCCF5aRwa+mhAhpO8oL3afRZ6gkRq96Y
	ef97TVtR4=
X-Received: by 2002:a17:90b:388c:b0:3b4:393:453c with SMTP id 98e67ed59e1d1-3b41c96fdc2mr24660921a91.6.1795550547099;
        Tue, 24 Nov 2026 12:02:27 -0800 (PST)
X-Received: by 2002:a17:90b:388c:b0:3b4:393:453c with SMTP id 98e67ed59e1d1-3b41c96fdc2mr24660850a91.6.1795550546438;
        Tue, 24 Nov 2026 12:02:26 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:25 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:44 +0100
Subject: [PATCH RFC DNM 15/15] arm64: dts: qcom: glymur-crd: Enable the
 tertiary Type-C
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-15-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=2970;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=Xbb0k+CFqxQM/ieeZbaME85BBswl0ncWd9NTFpQElYI=;
 b=AnKx11Ytmn87ykR5uQbnyVsvTuFo085fcMybmpqMDR6+5APySmsUsX48jB0surCW5xRs4p64i
 uFocYqhyBcKBl+t/XRjLMJBrshrD8rnScFeWwkIVxA+3PaN8jSHdpzX
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX3d5ycz4Ag8WA
 H7vBLBE1O4UKlcBbfcmT09HGF0HVNi/5oHAeUqg+21VnANxCd76tcxf59QN9Xocy0QVPvtIOOQZ
 ZhXNbSf7FXV+qkFZljuP1ldzpNHNoOI=
X-Proofpoint-ORIG-GUID: bRvmnfGO2Wxtlx5xydmx0nTq2FABIJRU
X-Proofpoint-GUID: bRvmnfGO2Wxtlx5xydmx0nTq2FABIJRU
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b05ed54 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=WzDp-nSq77L6p4kU6a4A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX9CoU4he4WAxR
 S182/rSc6AFZ5ZQsP0+CVGM1jtqVpx9Be0P3vx5Su0Kopl1GC5m/5nH3K3YLCL1ZDXeT2ixVat6
 DdA3xfgIoiqQF3lIdXmA3sl5npkKg8iizPWoL+Ui119JCP9a1sb/IJbDC0xiy8lPwncpcqzq81O
 oIW7Az8Vnu0qifqbnWJI6xV3h1G1x2jPEqBzIvywNiV8iF1m2dIJW5GiDaUtd8yvXCc3+NqOAx/
 r1qlZpIxFKl8X8jRha6V5jgpW84FAbEsWFFXfiGsGD6eFenEEvHCX3gJ+isD4ZjernTUfsDVNEA
 k1uerUtmZsRfXCba9qy9Ua7fXzIOraKOFgU29vc3D+g6Z050y20yAuxbCU1hhSjM/oRUOVanZby
 1s0YKD3Iwu6v1T3CG9d+BUd5pfxpEABxiLkzA4o9+rGEAXyP3RC4jx+Wt/XWpbg9ToFlVNI5F3I
 akBGBdri3hbKWp7Jqgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

This is just for demonstration purposes for the series, a cleaner patch
handling 2xType-C + HDMI variants will come separately.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 82 ++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 53f134878b1934e8627678dd1d3b8b73ec91f308..5d557d17ca29c4b379209815b2ffd426aaa0b093 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -123,16 +123,16 @@ pmic_glink_hs_in1: endpoint {
 					};
 				};
 
-				port@1 {
-					reg = <1>;
+				port@2 {
+					reg = <2>;
 
 					pmic_glink_ss_in1: endpoint {
 						remote-endpoint = <&usb_1_qmpphy_out>;
 					};
 				};
 
-				port@2 {
-					reg = <2>;
+				port@1 {
+					reg = <1>;
 
 					pmic_glink_usb4_in1: endpoint {
 						remote-endpoint = <&usb4_1_mode_in>;
@@ -140,6 +140,42 @@ pmic_glink_usb4_in1: endpoint {
 				};
 			};
 		};
+
+		connector@2 {
+			compatible = "usb-c-connector";
+			reg = <2>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in2: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss_in2: endpoint {
+						remote-endpoint = <&usb_2_qmpphy_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_usb4_in2: endpoint {
+						remote-endpoint = <&usb4_2_mode_in>;
+					};
+				};
+			};
+		};
 	};
 
 	vreg_edp_3p3: regulator-edp-3p3 {
@@ -563,6 +599,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -735,6 +779,10 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2370_l_e2 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	vmmc-supply = <&vreg_l9b0>;
 	vqmmc-supply = <&vreg_l2b0>;
@@ -1018,6 +1066,10 @@ &usb4_1_mode_in {
 	remote-endpoint = <&pmic_glink_usb4_in1>;
 };
 
+&usb4_2_mode_in {
+	remote-endpoint = <&pmic_glink_usb4_in2>;
+};
+
 &usb_0 {
 	status = "okay";
 };
@@ -1062,6 +1114,28 @@ &usb_1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in1>;
 };
 
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in2>;
+};
+
+&usb_2_hsphy {
+	phys = <&smb2370_l_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_2_qmpphy {
+	status = "okay";
+};
+
+&usb_2_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in2>;
+};
+
 &usb_hs {
 	dr_mode = "host";
 

-- 
2.55.0

