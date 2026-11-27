Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756999;
	b=0l+CvXY1eXQXKzuBtq9WMjo5YBq+f8lQNs7d2YjF3rw901YyMe7d9D5QCvIbVgsfVqd7
	 +udMi0l3EsZV2xgE/gnnk3zUfKrdEXUYExPwiyfujaz99ElP810FHbklDaoSy3COj+/Qe
	 /6344mCR2EW1pHJuDtIRkQskfRntGsgVngl5g+guaskYc9EV0uTZkptoKf0KQkVs8ydES
	 AZW1cSvxR5gX56oTX/7lFJVkVtZaXAUr0dNf/KWIzK5WyNRH/xPXtI0bN58WXXLs+NBnQ
	 WwqbU7EHWK/Odt3GcIcb3oD6MJhcfcLyYN+jc1u8JBH6T71n2olRXtzKO9J4jPgnerw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756999;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Aa5C98FmLG2wS02Qeyxqx60CWS6uvWaFbALzAgMC0B8=;
	b=S4qEbk/G1lv9CJsrJCuy3/ARI06o9eX6ZxMqvpbRzQ1RH4zoaDv82AHmWG5GyLwIrAsj
	 KsmiDj6USDTBVrbk5x34U2RHpTUmeT9qXdcdpMytnzMpNTC2lkfwPfSpiEGKw/8ygt4bC
	 B7VCeEc+lXDNasv22VnQoaOCQ9ENMxnYug8fSbK+g4NerY3JpyDXCiUt561noUpeqlrJp
	 m0NuNvZisZcQTwqz2wX8WzN6YUBVVSsHPBw8dgnbzzNHKKACJ4xigd3+sOxRdZLDFgCVZ
	 evZq/t23FFUHPOZO7qz1boFmRhQM8RmU54VrtHdJEA2QAmtbFN9vhGjSLZItT04WtOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L+Zye8du;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gFT6a0GP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEF1606A31E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AEF1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L+Zye8du;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gFT6a0GP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw3UR360960
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aa5C98FmLG2wS02Qeyxqx60CWS6uvWaFbALzAgMC0B8=; b=L+Zye8duvw8bv27E
	L9A+akWGT1ReSH2hGHPchwxauf4+zu+YVtofPy7G9368+neqxYvBSofzvXoCK3Hm
	RuY2vZ9PTYwPmV0W0XolUIg3mM5j8AJ3MTY+W216zefK2j1EZwdyu3P8lLfoLZ4C
	UmTnJTugUAErxRL42LgdZ/Pu/2d9XmLvJ/Oay1YNT0JIZvO2GeGdi9Ab5v7yxFw6
	fnaxnJ47b3GOJbMRWkwUlkUG0mTKBOSGUjjqRJsHJkBOA3MDxajIUS6FYvv4nS+P
	yEy7ufZ9yTHD8fnrly7IHOcfETI0QuoUL7PUMZOpB/ckwbRp6bk72oMW2t+XIV3M
	mA53ZQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rm28a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:23:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b434b96117so1372677a91.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 21:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795756998; x=1796361798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aa5C98FmLG2wS02Qeyxqx60CWS6uvWaFbALzAgMC0B8=;
        b=gFT6a0GPg1/Cp2pioDStv24+4oNLp6KD62Iy9EOp49c1qSSal7cnadyUyD2Oet8E/V
         BQdHxsOmiqmqd6T8wpxsVtRqu4z6XRr3lFY9WcxJhDH7t65UGNJUQk2iTlg2UWu7VgWf
         UANLxnx0hhbrmv1l8rWxMoT8XSyQoO9s6Tl6FtPLQvRL2DQ0ufdyHpX6w9iTzmZYlTxQ
         V4QJkSZf6DBbYbSYDrNefbUmq6yIRe9U3TfgIihSGsrekLNu1PcpnNtj6ShDtRzVD/ya
         IfZpp+Fq7HY+5nLINPo2cDzuzI1COJlncEknKpetHSOL1/slV25YuS5qYt2a2ZCKpZfw
         YzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756998; x=1796361798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aa5C98FmLG2wS02Qeyxqx60CWS6uvWaFbALzAgMC0B8=;
        b=pL0jUA3IDcO83LpH+NQ7ZSzyXEV/gvhJVlybvH1d4jELRdXvi+hwfpZirVO9Cpgjxn
         HpWiFXh9tJBVkqAEKurWEgApmh04wCyHXnKMx/gQOMh0oFGgyAx4zlh6RRiaFjPm5Ex/
         GUlnnyoJytOB23Rpm8UpTApuNt3PwvA3H1MVt80xG/IfwN41MlZ0WbcvNNn5e+NFUn3h
         XNVPJb7hWoHG1CWUAjAHsvFK+cqqleElWdRc07KE7mtJ14QKHH43kw9vF7VPOUbvpCeJ
         K9/uYFHcj9GCfIzFaOJ6uBHPmuvFN1u11CNTlVsnxPDUyC3Vd0WH2zHLxEBzq74UClFt
         Skug==
X-Forwarded-Encrypted: i=1; AL+hErEdG0tm6eAN6sfwFFDxjCMNHfqIi8Y5LO4OGDNYq88Xw9jJ2PUuyeTYwYC47ipogoGaK7DGQsfLlIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yr6jrgBvrrp1/5CeBQGUOxKYcPTbaYKCeWQXXoKxzjsGI7HSp
	b6CTk/usUmuEw5i1IiZ3Uicnz+iIZPH48t4f3K1WDItnL3N4cjKeHqnFeR0Ww1iNRk6wGwujBzj
	mhBP2XVe7XK3vS03pOTL7M/qWKWRXlV6yylnAtWgUn0WxlpVJ6QE15FI7zqM6dRg=
X-Gm-Gg: AZFdTZeAzImRwRrCTPeZtyGGZrsHSc543ZaPAKetl1gnojVXk+sApMAl42b4vjlizhO
	SdDOpN8x5xErDwibi/4HYthVU7ekBymR/ikUyW6HPpT2QMsxXhlXSmOX8D9d3rdafsNTUAxEE8V
	YsOqscOAZAa5xFt8o2X1iptXEy+u4lYPN1Bt4Jrhmf+n9c59QBkq4pPVbw5VB3DWNLXu8/QgKeX
	DHLwgrnN+fUZSntZSFC4KwynMwrlJgmnqmfqI1goiWJTyons7hAoBb3389p3B919qwcP2Dld6Pf
	Ke+Nps0vuzILfmnL/bj91x3u5DFOsUYM1Ex2/w2KVPvyc/R3BP+fOsgzXkbl1kv9HJQCBpQHj3W
	9aUFQBxmCgwKmkL1sNy2SjtgrEq0s2s6bd5TWjl58E4zVs+cu7n/0fXaaTcdcSWqSIsEkWL2wED
	0AhDCRlK1d7Rl44rfEDs6nOO5gerkdlyGm2tvr6h6i+i27Y3txQSdQRX9rnce2gIasIw/xzkcgW
	pIdhlUbFxIRxqlpBBolUh/+kXZw
X-Received: by 2002:a17:90b:180b:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b41c7d0dcdmr37266032a91.1.1795756998297;
        Thu, 26 Nov 2026 21:23:18 -0800 (PST)
X-Received: by 2002:a17:90b:180b:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b41c7d0dcdmr37265997a91.1.1795756997875;
        Thu, 26 Nov 2026 21:23:17 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm38637787a91.14.2026.11.26.21.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:23:17 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:53:00 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: eliza-evk: Enable DisplayPort
 over USB Type-C
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
Message-Id: <20261127-eliza_evk_display-v2-1-e4223634aa2c@oss.qualcomm.com>
References: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795756988; l=2104;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=vsQAYbucchggiOG1eC6Cdcxm7QBFzJ+TIVy837iYiyM=;
 b=kRJFi4BFGR1//S7aPDcejgG++y1TSuhLsWYml0HIa2fh7LObxdmhGwG3PeCLrNR5L2PFovMJ1
 IyHXJNPZXahD4WYHxrBvJe90moUYqWZ+gVy/412hEbbY1rfszsTXIux
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfXyIgEvrMmWTzj
 Y8q5dh5VLP/IqTWPC9YlZzcLVo9j6wDERZpmVfXcieEQ6sUxMatdMDgYOwQ8/ReT1F4OOP5ZF3h
 M2XsU3IBdrozGjYiqd/YTkBfggmr4XFU8DcOScxWMtKZuTwjWiwplJv32J4MxXDVsX1+IgRbT+l
 MIbVeKEYRcp9gTgvpPpeshgbCKcJoEcdL0L8tOgkOvAVIdwI2Unz8YglPTBBtDqPrK+b6uO3gCY
 tASl/d3fwSDp/wvSeh3evhTu4QRJKS0byvqjY/iqv61ryUFkMBrpEXF7a0tyPAQEV5PJRDCmet8
 aMGCM316go1IK7+QAlSWWZtpuMyyst7b3dUz8tqSIr8aqbdXcbrjnmQFkSkfaL6kWUvqFUOKs6m
 15biCXkdR7LcmNPpEbwBqx2VMCNkDOPY1MvnukPWviNDRAnHqljwoNmcPYo5/OA7n3/qBSLww8l
 OOiJzi88VSNrPqCXaog==
X-Proofpoint-GUID: LtlhXZQkF4-wD4z85ohHAoIJDdq6Dw0h
X-Proofpoint-ORIG-GUID: LtlhXZQkF4-wD4z85ohHAoIJDdq6Dw0h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfX38JGVQ/FsW1A
 N1lO29ZblArAlfgy4PSnLzcjkuwHxivwckGokkKiHMUjst/EBAogSOdaewJsM7JQ8Rbvlri+jf5
 PD/KtBupvVOGZe84EuOC4Jk2oW25xo0=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b0913c7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9mMaBN0c_Hc-0ybOVWYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270021

The EVK routes DP0 to a USB Type-C connector driven by pmic_glink.
Enable MDSS and DP0, and describe the SBU path needed for DP alt mode.

An onsemi FSUSB43L10X on the EVK board routes the DP AUX pair to the
connector. Model it as a gpio-sbu-mux, with enable on TLMM 177, select
on TLMM 178, and L17B as its supply.

Wire the pmic_glink SBU port to the mux and mark it as both a mode and
orientation switch, so AUX follows the cable orientation.

Tested with a DP sink on the Type-C port in both cable orientations.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 49 +++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 02e58a4bc91d..8c663ef6718d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -61,6 +61,35 @@ pmic_glink_ss_in: endpoint {
 						remote-endpoint = <&usb_dp_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&sbu_mux_in>;
+					};
+				};
+			};
+		};
+	};
+
+	sbu_mux: sbu-mux {
+		compatible = "onnn,fsusb43l10x", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
+
+		vcc-supply = <&vreg_l17b>;
+
+		pinctrl-0 = <&sbu_mux_en_state>, <&sbu_mux_sel_state>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			sbu_mux_in: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
 			};
 		};
 	};
@@ -491,4 +520,24 @@ m2_w_disable1: m2-w-disable1-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	sbu_mux_en_state: sbu-mux-en-state {
+		pins = "gpio177";
+		function = "gpio";
+		bias-disable;
+	};
+
+	sbu_mux_sel_state: sbu-mux-sel-state {
+		pins = "gpio178";
+		function = "gpio";
+		bias-disable;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
 };

-- 
2.34.1

