Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3773BBFCB
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362177; cv=none; b=Yuwdh7LxC3+dgYXy0aB3bZUMUykfiQK7qwef9XKFcpBjgQ2Cn8Uv6WUllKnG0qinpGCAcxWyZjwivFyzQ3/Uabk37fTsnWG36Z8o9rZxlVZLZlVAAyfwS2RI0W1GNVOOzjyocTOhwv9A9qPGD0EMiHMRfy8G/G6zGpRMzNo+2Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362177; c=relaxed/simple;
	bh=4fUsW2vr3VtdTcca0TQ3POF+LIM2tVnCfjqUfYO3u7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mT4sNUVNBBXBg2Vjjg45Yc0FNBE4r1fcx4Gp1SeNSmeIMwp6PHGUl+3k6fQCcI+aknfRbosHOkRjDgGHqiJVziUnJq7pMeJAK040xBBZQbyycifWVPoU67NRhCfk3HCYkLcgRedZs+xyoysBfm02rG8Z9sM+uwHmwKjuvSzE7gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MC7L2hWt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGnTtM9J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MC7L2hWt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGnTtM9J"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SPeL890721
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1R/M0FVHN3ZmfbTKK6TlJ8nWQLuQm6tCm8CfKF/XL0=; b=MC7L2hWtVxKuEQea
	10m0UnHKunesfwVzm24CArbmLKMAcp2tXHy3G/Xp8k45U2U+j92IdETLVf65+mxv
	BDMmD/oPyEHIUBjtHdTIk4JRuYvPZ7KdQ3z6y633KWMyJl4hhgXW7ldRDFK21gxl
	tvKuCt++R2V66eQFGJMb+T3nNMU7hhCaU9cMaZtsn1i+3LjLkIRcYQk9feFpEi6N
	BrtRKwpP+cUHYxZmgAQgYiiNgsgbj+vl3ZT+pEAhOm1nf7Zg6RLz8yRVExH1ofYs
	0si9BzmDXfS8oUEs8yqh3J6hkOh/4zj8/Fx9Xj6uYqh/VoC60kywCuBsl2CvGNVn
	hsmNLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v49aje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso16523651cf.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 04:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362174; x=1786966974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1R/M0FVHN3ZmfbTKK6TlJ8nWQLuQm6tCm8CfKF/XL0=;
        b=jGnTtM9JAhwwe77OJBqWSFXNtujAqc3TKdX2aBKLrplmvxCD/KDN6amOpG+t5vv77a
         2UCCYX0DdwXGGhdfg/cCPkzWi8dTjR2Q+HYkGtFqFgs4oYZ2fDtn9iEVtBRbaHaUvf6K
         rmFEx0qKHBJ+F//vz2E/yxAQg5hDbVQ3smXHDsbYmXdJa43Bs12JEvfSySDzQD+r6QD1
         M3iCDdWxZ7JlbaCs8DGibCCmwV7xd+hX7jkd7uluaHUVzyt7JKvOGapPwN4HnGMimFb5
         hvcFEk51AMEKhJBFeART4H/1yJgCpC7DEVb3TRJOzTJiYLWF4jB8kggKdXnIaYctaven
         joDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362174; x=1786966974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1R/M0FVHN3ZmfbTKK6TlJ8nWQLuQm6tCm8CfKF/XL0=;
        b=pdKGPGyWYoCkpLqxLSuU0x80SIbmJ51vurQrdkoC04BtbSClDDs4WjvxfR2hZBdpr0
         CoGdkpsgORCBcAKf85qTTbZATAnRmHFydYQLrSFUJS0w16kTdA9UhaD3W+e/l+Mj0a+8
         IvZctRMEIeDCAKQy0womEwllkvyT9yeqSTUrfRmixnh4o9dP52X6kfoEAX2ix6eERaYk
         0b3ZJS5KymeeX6JnCLxkBnvoFlgDGQ1hWtwYeZ/+1LqTtmWO42IUyLgMkppZ/RnpJf45
         PqcXt2YkG4hfV2YtMB4lrVyFFhWOqsognPXqQVxSbaP2nBS9MV1XMn0jL61KQz5HcC3G
         TIpg==
X-Forwarded-Encrypted: i=1; AHgh+Rog1jlzCLNSPsXfBNCrjLIItgK1bV3j6VhYjrGRilOfmrVK/pLzBx/Ymv9wu0bsLMPohit3OnJVsBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMFeP+pHO87oXCkK6C1mx2ZVZ74U4iZdJPYwN/32F13sI+UmrQ
	lLnI5lBBLxFfNSSBAZuKCsUyvf18eWHIO/oaJXKv04EOkrKCtq7/l7AQ2rVLbIG7YlrdCIj288f
	ci7BzkTfK8aLu5FCcqdINDdetIYRqhX2Rc/yldBE/6ClQsYElvg40RdOQZdtGlXTItfJ9UBw=
X-Gm-Gg: AR+sD100P+PkGn2aBFN1GRYGcXEJb+DGiUW/AQaGv1RzLv8+4CttgMeGQ0ag4mRDl4Y
	XHUA5AWH0iB5XUU8K5Q0od/toqA+2OWO8Y5E9kKngSvOgfmuPYtXagK9mlgrJ5Gxg/45ebn3rgW
	PHwr6yBC7yFhdwtqlL2X1iwaEsyjrVBY40NhGeZh6MVRivP3iXn7BcxNEo9ALDEiGgUn1hbAmNU
	RnGN2FuV13ZWpRumldbDvDJsXgagG+QWN1P/dFrZELesYTZU/ed1eWlCJUqhgObc4kPxZouiiHh
	EC1oNaSdEhZP8sn/c4/bo8zDlNZmrB4XC2buNtI1goBAXdxqHbNHJ8ryWAtLRIoo3sJ0V1tdr/Q
	pTCrB6PuZvpPmFC6ocYs2kAC/K60MsVwIeb1wtjem25/HckyJbzz5nv/SyWyw4pES6k0WJkqTx7
	dK0p34T9U0g5dkvA==
X-Received: by 2002:a05:622a:592:b0:51c:4dc:287b with SMTP id d75a77b69052e-52ce5f5f836mr434465631cf.7.1786362174203;
        Mon, 10 Aug 2026 04:42:54 -0700 (PDT)
X-Received: by 2002:a05:622a:592:b0:51c:4dc:287b with SMTP id d75a77b69052e-52ce5f5f836mr434465151cf.7.1786362173754;
        Mon, 10 Aug 2026 04:42:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:40 +0300
Subject: [PATCH 10/10] ARM: dts: qcom: apq8074-dragonboard: enable the USB3
 host
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-10-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2975;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4fUsW2vr3VtdTcca0TQ3POF+LIM2tVnCfjqUfYO3u7U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkqrQi4MHup0wtsPo5HbcREclT0npTNf1UJX
 wC6H1cwL/WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KgAKCRCLPIo+Aiko
 1ceZB/40PwhtCC21vEUign1WqrxJu0PiZ+W1mNPhDBEzFzFkf9NGpxBv+xEXVzZ4YLe3lFVWgtX
 l+ceLedgf7M6ZF/7s2G6BnAV3rv719DVVd2eYaOMcLOn2SRDAXAm/3cjRyCabvHw2lMRhfC/VGS
 L7l5EQJz3OXJxU1kYiacQnwr+GL5Iw/VjnIvc1ojdxirTyS3AVUIvL8UVEm3RGPOl0ouWJk7f4s
 d2guopCrRectSnqjlVvSWoABCnHmueZ9cFyHN1kdYv7lqS6RCFzcsmHtn3JBNbkuFF+fYOoQUGh
 n2oiFeB5I+Z9kAtcZFd/vNm1sXFafqe5DLd+/haTFEpdOaPk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: E_6UADXFRu8N1CF_WA2eql26JKa-9zW6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX4BTRg6scf/iL
 jCYVeItemHuv7fRYE4oWrq28PxxmAaPFKZ/x/059CN3XSoqM20f6ObZbSZzW4wjCB04rkQunZaU
 vHGmX/ohtFQVwfJEY9SlIYPWq3n2OG8=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79b93e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8wdEFO8XJvJgKCc5rEQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX+rRXwgSJUi/j
 UyvZrv1JxgV0dk1hi/GPkrN6//90foZJwfSKhn9vVux4LyITs7RS6zHSf0PS0tMC46TYQU/UhVp
 oyVG5g7YhcpgadatlSBTtIJyZdXFNiwB9NPmwpcqAhEiSiFhBm3TehQGP0mIiL7gwBO+b+qSHTi
 oYvtgQ6J1vsjvcHuoQylHOyG+sFYQhGlEUDXprZ8vnaJbIFGT9IpNXjFfTY/7cNxyaI3zpnb973
 MxwdPlS6vTu2ZSSdG7qO+Uq/J5D1zD0OKmR/h1e4u65YwNQI7w4O0exugqD6OgBvv/BZtXmzqr0
 L/ap794dzNsTGuLutiV+NMhi5egdnrzCpeF8VGsX0WVEHJvwI1AVSauy5Ceyw2//6xvA/JxAaRU
 V+PQwgu2hqSkseQedH3q6EymxsOXZgyrme4wozyVhfoQXQrQNEd2vIldzW4tA5cVmFelwMoDx3o
 Pb46E1TRLVVLUoR+UdQ==
X-Proofpoint-GUID: E_6UADXFRu8N1CF_WA2eql26JKa-9zW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100102

The USB3 port of the dragonboard drives the onboard TUSB8040A hub with
the AX88179 GbE controller and the PL2775 USB-SATA bridge behind it,
but the controller is disabled and nothing describes the devices, so
their reset lines float and their supplies are unmanaged.

Enable the DWC3 controller in host mode together with both of its
PHYs, and describe the onboard chain as device nodes under the
controller: the TUSB8040A hub pair (with the EEPROM-programmed
0451:8041/0451:8043 IDs this board reports), the AX88179 on the DN2
port and the PL2775 on the DN0 port, each with its PM8941 reset GPIO,
all powered from the always-on 3.3V carrier board rail, modeled as a
fixed regulator.

The SuperSpeed PHY is required even for the hub's USB 2.0 half to
respond: with the SS PHY left uninitialized the hub connects but never
answers enumeration at any speed.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
index d3ae6c6a6f83..083fd8fa0aea 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
@@ -50,6 +50,15 @@ mpss_region: mpss@ac00000 {
 		};
 	};
 
+	pwr_c_3p3: regulator-pwr-c-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pwr_c_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_boost: vreg-boost {
 		compatible = "regulator-fixed";
 
@@ -477,3 +486,55 @@ &usb_hs2_phy {
 	extcon = <&smbb>;
 	qcom,init-seq = /bits/ 8 <0x1 0x63>;
 };
+
+&usb3 {
+	dr_mode = "host";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	/* TI TUSB8040A four port hub */
+	hub_2_0: hub@1 {
+		compatible = "usb451,8043";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&pm8941_gpios 6 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pwr_c_3p3>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Prolific PL2775 USB-SATA bridge on the DN0 port */
+		device@1 {
+			compatible = "usb67b,2775";
+			reg = <1>;
+			reset-gpios = <&pm8941_gpios 10 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&pwr_c_3p3>;
+		};
+
+		/* ASIX AX88179 USB-GbE controller on the DN2 port */
+		ethernet@3 {
+			compatible = "usbb95,1790";
+			reg = <3>;
+			reset-gpios = <&pm8941_gpios 9 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&pwr_c_3p3>;
+		};
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb451,8041";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&pm8941_gpios 6 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pwr_c_3p3>;
+	};
+};
+
+&usb3_hs_phy {
+	status = "okay";
+};
+
+&usb3_ss_phy {
+	status = "okay";
+};

-- 
2.47.3

