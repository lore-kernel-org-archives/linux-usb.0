Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179CB41F5D9
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376553; cv=none; b=rZ/irLVRh9/i1bmQK/WO2FSgKwKmFBEUrxtxBHII7CHkKEF5PS4z2nAdK10LG/Q3xSFqmOndIobfrARbYu4X+3FTDO7/u0TXwNhVTCcc3+ZNtiflWTrA8fDwPCo5oylgeupHMfWGPQdRwq9RdWgVDcnwtnMG3g7kE+MshRERny0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376553; c=relaxed/simple;
	bh=AoZJqVVSo+ZoP1B5mllGlVyWEAwh6nCg4CrfFN4+HPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e50LruGCnW/ZIfEVhHPGYyyB8XRBReJf8g4ZsECfOs6CgGoATupfWhlutt85d/J8svIZBirUzCZxUEbtfAxkVKXDoR+/DY4KPe6ddhBOcGbljgiDgxjo7ez00d22L7uG9qhqtrSEq2fJ4jXEAHxeylyuhSrHA9CYcj8i02fQOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHfxMlLM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMGpjohO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHfxMlLM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMGpjohO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFW8IC1694301
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 15:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+hOVlvodWUaHCF6f8ct+3ncKE/NpJynp45drgitce8=; b=jHfxMlLMUSqIKNqk
	RolHCMaBomN8/F0ZFjIgz3uMj8kZs+53IRllyuqSJaYSntJUDOynfw2sW2iDmA4s
	AHNWQbEKcsOpvHfF2KlpsL2zGfFme3o2+gvJzvdc7yc3UwZr/61Vq3TddCuvVWzo
	xu6ZuVez09e6JysCkQsZbQT55ZSi/Q2lwEp/g4/UDzulrP5CXybWoldpzSe3xn4F
	vFzYAqmTqh7hd3Lub26fS0Mlwbwb30zqycD5ckTRuqeat1+CfEcfRLCrxukLGvgh
	Jne7RezkSJpqmfbCW0TT7rvPT7dn/pS/jmNSkkdZw67XrOlUV6WxMP+vVQ4Yg0il
	LqMfqw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqseem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 15:42:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ebdfceddcso25680981cf.3
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 08:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376550; x=1786981350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+hOVlvodWUaHCF6f8ct+3ncKE/NpJynp45drgitce8=;
        b=DMGpjohOKqS+NjxU0WQe1yGzceZO+j2NcNt9sxfE+otAlb5AqLaNKpTouqRCWiADEd
         dNBDOErqutc4lDsveGEbVA+/TOfAtsZatDfc62m4NtS14eTzE2mobxJa/VMBI3uTtb9K
         D7o9Ha+IhVxlRo8yofVeLwRTOcngYva86BY2Vz1u/hajeKRBfAESkzlU3vq5WykKir9L
         1JoJRHfMeUo4eKBNlZmpDBk9RsAOismWIxo7i62ocnNJ97M78FzzfIIFXLBLxxltpTJS
         BV1D55Hhao3/l0XohKVUDzUQvQxhBvGN5PdK9mbMUOm+CcNZD32BdYFSnFUg/FEs2nL8
         MMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376550; x=1786981350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+hOVlvodWUaHCF6f8ct+3ncKE/NpJynp45drgitce8=;
        b=jofB330TKj0tV/utRUW0CPfQJlc+MGWZbDL2TtYtLcG4uuyM7DWPy1BXkNbO5r3ObW
         1slba9sj+kQ/aLhAqKeIQbGZ9WaSy6AnmQ6DMgvAZiomo77dhjRsyJ/rxs1+Av2kbNfy
         UzpVv1rMVSm6S9wzgqYEqFLmvcznAFJJyLaTGTcvvoVvPiz8Dhuhn0SiInlx4Djh8pVf
         Yk4fyzfNBzp28fbV8jaRhLfxhJqnMzU9VIIcU3QC+i3PIMwpeAxUu83TOp7CG3eAPtH5
         mxHL5SHCMavuf+XTj1EP54W7q46nEQxrENFXIqKNoeKuHpJe6QQ2yHaeGY6tA1r+CK8F
         OfzA==
X-Forwarded-Encrypted: i=1; AHgh+RqN/2iE4d+fN/lTaDhWrOypEJ3GCge3Oi2n2zhWIKAQVUsB0mJ8qfnNNlUpJi7UK477KHznGh+J4VA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv09AT8ZdVXcu1vFlO3EMrCdTkYrlovXaFQryLCn5uCuiuEMwi
	4SWiqqpKjVG52k9fa0lCg3f2Yl8MT18q0vHYYcszPS49xzPpVBnjblyRXkPbzOLaK8SqN/yWqRz
	RrNXxLdmGT84bsG6dOY8Sba8hOxCfe3DLn/2NktRuGgNVwdS0OE3IpNvd3Ptn0Y8v2HFV5aw=
X-Gm-Gg: AR+sD1099/1z88+86uTox6sA+m1Fy2VxsVyTVjmT8NzSJchyulTkzfZOFJxAhNqYZ/V
	/Ti5W18GG/jgQYoZ1vykAmamEJ4nTX0CgQAk5an1fCn+24JzfyvOe6rQgmBeZbEe4xW+rtmTy2h
	jhgReLeNLSGj/2CWg8ChgNd+W/GDlYCp9VovnvQGUQHrhlN2kgV8w+Ffx9RWwnBxeRePp1uJZqf
	LeZXvPvJXvy/u9rb7L7lyOqmfkyv9J7ckCnXNC/9yrx4qWVX/EsG6fqZwa/Q1OYeNvIsPxCeAhW
	ratdzJPhQRmKLheoQ+nD0OVKaYv8Jevhgzi8uGQRBVjB4m409PhTGB1V/9tEH5DNIL9/r7aGcoP
	IObV/E/pheeMk0TCSL4JNZDbofGhAns8As0PrPdtqyUs7B/OY4ChNe97eC3wa+U+IxCenGwpC+u
	nfKRyJmbApwdFCAg==
X-Received: by 2002:a05:622a:1f09:b0:51c:167d:b328 with SMTP id d75a77b69052e-52d4c251541mr32256401cf.40.1786376550320;
        Mon, 10 Aug 2026 08:42:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1f09:b0:51c:167d:b328 with SMTP id d75a77b69052e-52d4c251541mr32255431cf.40.1786376549857;
        Mon, 10 Aug 2026 08:42:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:13 +0300
Subject: [PATCH 09/10] ARM: dts: qcom: msm8974: add the HSIC USB controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-9-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3085;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AoZJqVVSo+ZoP1B5mllGlVyWEAwh6nCg4CrfFN4+HPk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFRg39N0tUH8uaZmrJ4GFul6JSkWDtgH3bqy
 rr5MP2jP92JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUQAKCRCLPIo+Aiko
 1SiVB/40EuDT4bcTQdsQdEN3kOWqySmkpWkj9bLL9kuiS+NlkLln6QGcFc13/zxSkQSk16yZEZ1
 h1K+H0irtCBFzFGTidDD9UA/gadXnkDrAwxrO363i3O2rr0HPV0bwmf2pZO1vsEyu2Nv352E0I8
 SzD0FflaDxjAJw11WAHgly1oyJq176j8h5+3ONtci7mAV+2N9m+zFJtVrNxz2QmZoMr5VrwgqgS
 qU/4/Pg/4oEKd790sT7a2LSAXiIrG961BRz8xhsORLvADKhfalwb++/kX9yXPjjgGq/FXx0uFxF
 ML67h1d8LFVTGKXfnticFrcAaXfHw5Gcci0GGDf6IGAZqsl9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Ooq0b27nstzguCXQ39OGCBwfF5i9cXMU
X-Proofpoint-ORIG-GUID: Ooq0b27nstzguCXQ39OGCBwfF5i9cXMU
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a79f167 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SNm9lHMw0LAWI6_J5M0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfXzm+0GV6taxhb
 HHrEDxAJkT9nGdkcNnBlY9dr55HWTJK7UVaT9akNUukvnMFL7Sefyiop8DcegJsDATVIriZVMdK
 Ad3jItQbgtCWWb28U7lfT5n0K6pjDAw1fn6EQ8F9ktuTpplUvlfWrkDqnLSUmEwUJLhzyL8+cpt
 j8tnxV3sWgu24AcUy0xso+xXiBmtRAWeUo/cEnvhnSnXiXp8UXrwiNF+jt5h/e2pYxcZ+5wOTm3
 Z1vfCF3M0Qv7+KTxDwyfq8bA2Le+oPbJ3JJf1tciAoi2IXxaga6Lkyoyv9Qkf63YjLSHZG54fu0
 vvAEQZDzgtzv48mZLunz2Fi+FoPFqbHD6cGGIUFrrkuqZmG+5NmR0sNmXqROp66d7Sirb25HVgI
 4WafxOtIFHKx7zNUn1volxB42ihFXfFkgoE8uZdtglQO8+qJ0AJU/RIizmhDjJ61Ql+ev67bJmp
 jWfbFdF8+9DK20NegDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX6ysSVYg2B49x
 74IKAytgCFB3HL+leP9WoC1KKpEWX0MQX4KspVFCIg7ROgJOYbHUt+PrsRAKq5yR7fLJLwy4uAF
 EHRB+mhpK3FGZmpxcqa5hBHWxYm2F1I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The MSM8974 HSIC USB host - a third Chipidea controller with a
dedicated HSIC PHY on the special hsic_strobe/hsic_data pads - is not
described, leaving boards with HSIC-attached hubs or modems without
upstream support.

Add the controller and PHY nodes. The PHY is a ULPI bus driver present
inside the ulpi subnode.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 71 ++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index bac3c8772e0a..72cd369927b2 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -760,6 +760,49 @@ usb3_ss_phy: phy@f92f8830 {
 			status = "disabled";
 		};
 
+		usb_hsic: usb@f9a00000 {
+			compatible = "qcom,ci-hdrc";
+			reg = <0xf9a00000 0x200>,
+			      <0xf9a00200 0x200>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>;
+			assigned-clocks = <&gcc GCC_USB_HSIC_SYSTEM_CLK>,
+					  <&gcc GCC_USB_HSIC_CLK>,
+					  <&gcc GCC_USB_HSIC_IO_CAL_CLK>;
+			assigned-clock-rates = <75000000>,
+					       <480000000>,
+					       <9600000>;
+			clocks = <&gcc GCC_USB_HSIC_AHB_CLK>,
+				 <&gcc GCC_USB_HSIC_SYSTEM_CLK>;
+			clock-names = "iface", "core";
+			resets = <&gcc GCC_USB_HS_HSIC_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc USB_HS_HSIC_GDSC>;
+			phys = <&usb_hsic_phy>;
+			phy-names = "usb-phy";
+			phy_type = "ulpi";
+			dr_mode = "host";
+			ahb-burst-config = <0>;
+
+			status = "disabled";
+
+			ulpi {
+				usb_hsic_phy: phy {
+					compatible = "qcom,usb-hsic-phy-msm8974",
+						     "qcom,usb-hsic-phy";
+					clocks = <&gcc GCC_USB_HSIC_CLK>,
+						 <&gcc GCC_USB_HSIC_IO_CAL_CLK>,
+						 <&gcc GCC_USB_HSIC_IO_CAL_SLEEP_CLK>;
+					clock-names = "phy", "cal", "cal_sleep";
+					#phy-cells = <0>;
+
+					pinctrl-names = "init", "default";
+					pinctrl-0 = <&hsic_gpio_state>;
+					pinctrl-1 = <&hsic_state>;
+				};
+			};
+		};
+
 		usb: usb@f9a55000 {
 			compatible = "qcom,ci-hdrc";
 			reg = <0xf9a55000 0x200>,
@@ -1677,6 +1720,34 @@ tlmm: pinctrl@fd510000 {
 			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 
+			hsic_gpio_state: hsic-gpio-state {
+				data-strobe-pins {
+					pins = "gpio144", "gpio145";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				ctl-pins {
+					pins = "hsic_data", "hsic_strobe";
+					function = "gpio";
+				};
+			};
+
+			hsic_state: hsic-state {
+				data-strobe-pins {
+					pins = "gpio144", "gpio145";
+					function = "hsic";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				ctl-pins {
+					pins = "hsic_data", "hsic_strobe";
+					function = "hsic_ctl";
+				};
+			};
+
 			sdc1_off: sdc1-off-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.47.3

