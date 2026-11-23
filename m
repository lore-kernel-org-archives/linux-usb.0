Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452196;
	b=XsU4GT+nwg9LQsEMskmnNKBaTlnR3ea74KubzKxFM0TWsFQ8y/PbRo2uPL4kZ14jF0hA
	 YcmNQX3t8l8sSuRr3xdN5s8b71o5x+e7nBWZ6ItIo5b8PJGJtUPc7JCKpX9iTW2u5EhYh
	 1F0V0lM1ysOclJ8nBtOevz8An76hizRaTEuFv3VuCMOoasDX09U1ZEPWv6ZcDGPi8pUT2
	 7p8EFrFffuOUsheJPsn0dTeZZ0bQC+OZd4ppwOmJivmIio0YnwcwgmUuuHHHD6k9fm22D
	 KUuF3VoTUt+tPml3tydwXgV5CaJjwjcGleBoiWiiMPrERSPgEMLO5JCgm4Fd31D24rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4dujEuBXbtdpkxlaf3V6YXDJHRlkRou/+U38dB2bzLI=;
	b=Kb+epiFtBzb7L4O/PeO0DSZf0EbHebS+72/Ci3iNPUN4gnjDHBl8G38iaQCST1OKl92D
	 ZwP7k7QzL9KxwbmISlqh0gPxneoLEIZITu8DWtE+T+hV4wawif3gBdXMuhVQMj0ROsVkM
	 twgBM+krpiKQ4ijVeMUaxm/IhQgl0pvXPWYhdPldwn2mgt5xWm+e93WrrGh2tOXFoZEpq
	 4IOh+Sta4EYWHmlpk2jsr9eQZpAXIxy0Ko1SUi91e8Ohtt7MxmySn7Hqn22yf/QdseDxO
	 voOQaSe6CF7dw5taLDf0dJWNlY/29TtCPdwnFl5ye5LEPz7okTg44FDLD5osdJae3hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJxLbydi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9wepR5N;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E568D60A260D
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E568D60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJxLbydi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9wepR5N
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3A91093816
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dujEuBXbtdpkxlaf3V6YXDJHRlkRou/+U38dB2bzLI=; b=BJxLbydiFh36cspL
	sjkt6M6rN8VAnIycKHiGxY9g2lFI+mhGFgkLoxusd6OBXjQJhbKnpQYGvXqb5JsB
	ONVkCBLGcpewlx+PPz52uWazm9Vmn0QtMSE+lUZEm0d3xdqGGDEqpSKzdu+NDLy5
	x1STtGIlRK83phRttxuFZkmP8Oh20GPlJ02HU4vUkXO4IJZLawe3flwg8/VswFyu
	9ZRNmjziL6T66mowY2aLoUzUwGxZWqUCLOZOVUbYj5C9GfQ2OSxEGX/XgpCcA7Uk
	NStCa6Er+pOIT8Zdr8e6fB6Tgr/RKAiaXeYMsjtG4K/NhdwC8K4JrBBljHjwXw5D
	CNB7Pw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0sbd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2ec691518so3150648137.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 08:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452191; x=1796056991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dujEuBXbtdpkxlaf3V6YXDJHRlkRou/+U38dB2bzLI=;
        b=d9wepR5NDCKmoeZcLD0kH9eyIiTwFA4e8UgUGQ5IuHeGgLASnlzgnwlSHL+b13YiHz
         XOBimlr0zEryQpQDjoV2GNeGulSoJufsW/X1WLP2F3YuwN3BpCX1CJABqQsZZ1SUANsE
         spiuAw94zoRLPhDE9ddaunkvGh8i/C5St09hCqLd+eCoKsNx/2sOChVhgaf9ICw+uAV5
         nzxYo3yLUPd1FtjeoPGM8m0cf9iHtVbXbdDVlt9TtC/vJuqPtWmdUAp57qciKA613a70
         PMc9XoKvNINxF16Ohqg4C01PEnJ/85xmPGGuVx5jr5rNfZEar+0ejdVgcqEQegiNKJDQ
         elrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452191; x=1796056991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dujEuBXbtdpkxlaf3V6YXDJHRlkRou/+U38dB2bzLI=;
        b=ewuova9jiD0Pl6Tp2P8BrJunFX4DGVJS1SKwDPKPUKEgN10B+p8tNFFdLVK6YVbAhq
         fZnBMAKzU6qz54hzeqHqofxdEA8Kp7FZNSaNcc/vKkBpErAV9/j8SY/UQjWz0OEuY5B4
         xhHwzODiaD1ehE5t9vliDnHdPL8lBMndC5fxp3/86Jl3mhQv9YqzvlKfoDKIYC32d2Mt
         y/Piq8yybITKO160m9/u6syQORdUXbtyEQKYFk6n+CLRNbKduaY/KoRmDpWzNNUaUpXy
         l73jZOoS01RN7ekzt5cHacjAB6lOK2VGPQCVPiAWHcyMYQK5vHJpXb2Q4KIvGAPykAb9
         dAaw==
X-Forwarded-Encrypted: i=1; AL+hErEoF/iD0l3vXqwacAV+tHpdbfnbUMN5qawNe0CJCL6TEaiL5IHE8cXZHIojwpyt9yW2YJ4rzl/w6uc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KnF0a9C05CCKoRhs7xkmOo4UtXblOioLnoiluSE+k5NV0PUxG
	x9rQKuUv/nT6D5wXazDPizCidG2GKActjZYGjQRaulpEJcTbXEYWi6JncvL+SDl124fjNkYlh4c
	WN4EYovnNmXBb/OPVNbdu4IRRUtQu94n5AnmJzSTQCmn6NvKFxjKCmOQVDW0q8WM=
X-Gm-Gg: AZFdTZfcLR0UJfhvG+NFQXMJUie50Xfqtdx7arRH4aDAtiSh1GfbYgj2ka+ryzhSeVN
	QzXVdjwDliqXo1SlmiEzyRBNokg+Ba/84r8MWEFpBFFa7lGjjc01Bz9q5a238n4FBV+7IQm2yS8
	7bEVjRZ616VBvHN0+cJ7fhPTzByCXulBJr1gb8fzww0vNL6QuBLkVDjPeP7FOx62Uc5UfLgjaBF
	goUIRZ/NIsXuhzWt/2KQaqG1uDkqdZikeb/xV84KIQU5sje+UKJJjFRCLaP7hjD1OyUZ/jLQm9C
	3CXpvFOEHVNiunKsAXB4DxmEN+RJqn+rjFanK/0BW14UsoeRf9+4DiRU61SDcA0OMpIWbONjSfK
	nwGbPEdpVdUKcwgguBNcCd2cRtTMzgsBI5w6xBHyarAufbhWQeab6uPf1MH7eVP6drbLycsgIEa
	c9ljSDAnF5NIgB
X-Received: by 2002:a05:6102:3913:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d6db84e3a8mr4489892137.3.1795452191103;
        Mon, 23 Nov 2026 08:43:11 -0800 (PST)
X-Received: by 2002:a05:6102:3913:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d6db84e3a8mr4489882137.3.1795452190556;
        Mon, 23 Nov 2026 08:43:10 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:09 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:59 +0100
Subject: [PATCH v2 4/5] arm64: dts: qcom: agatti: add the Embedded USB
 Debugger
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
Message-Id: <20261123-qcm2290-eud-v2-4-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: rfVEdXa9iEsQaxhoKmsVckMNYqvNnyV_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfXzAmO/DJCB3E5
 QEfCpdEiv7uf6OZ3+1g1Tur6OzTIlHIQCm//5hLJ8c5JLldWayY37sUoZ97AqHlle23Mwm+vScd
 IUoCkeM88lFgDaCm0FTdQQO7RIS+1B4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX25Rs6geFHWl6
 pnwSEYQ9eM/eWueHHD7mi1h20/Q1/qzACcqAQsjk8x+yFom/0KPUdxuOlk0fhx35teHxpFS68os
 L2t7mODxklZocsLNHW206ITYXtpxSzsBdpmURkzCIs9MNyv+JBjYwn7Q5gJqfM52MaHCNkyxSAg
 d9qJgWqpBAMTkwIuOPjKMUYjUTiYT6LOvqpzM3m2t4Y+1RJbh8T1FpSDQ2dN3e0oHi+in298/dN
 jbrCgDjJTfyNu3OeEqn6IHrepKu4xboLV40n35twtILJ96zToIJVjp9QaWID7sOwa45EvteMBJ9
 HYGGIinW80oP4YefonMde4pzcBbxW3wbUe3AJGs8xtJ7Nk+/UFGRvZWkm06DxXoVgYH7rHavBAn
 9ivL1JwILTSg/GBzzx6MeWX4XaDcDeq7eJrCLY3z4zD7/XNUhnSb4IlOV/74Q6lEVLm7L9iw5gA
 i7t6nnuXNCD8H4M2tEQ==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b046d23 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RP-5YM1mH3AJJUWU3rkA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: rfVEdXa9iEsQaxhoKmsVckMNYqvNnyV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230066

Describe the EUD:

- its CSRs at 0x1610000 and the mode manager register at 0x1612000;
- TCSR_APSS_SPARE_REG1 (0x3e5018), as offset 0x25018 into the TCSR
  syscon;
- its interrupt (eud_int[1], GIC SPI 189).

Hook its port to a second endpoint of the dwc3 high-speed port so the
driver finds the role switch, while the board keeps the first endpoint
for its connector.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index ea9b39b1ed43..ac7a653a6f03 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -826,6 +826,30 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		eud: eud@1610000 {
+			compatible = "qcom,qcm2290-eud", "qcom,eud";
+			reg = <0x0 0x01610000 0x0 0x2000>,
+			      <0x0 0x01612000 0x0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+
+			qcom,tcsr-reg = <&tcsr_regs 0x25018>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					eud_ep: endpoint {
+						remote-endpoint = <&usb_dwc3_hs_eud>;
+					};
+				};
+			};
+		};
+
 		usb_hsphy: phy@1613000 {
 			compatible = "qcom,qcm2290-qusb2-phy";
 			reg = <0x0 0x01613000 0x0 0x180>;
@@ -1680,8 +1704,16 @@ ports {
 
 				port@0 {
 					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 
-					usb_dwc3_hs: endpoint {
+					usb_dwc3_hs: endpoint@0 {
+						reg = <0>;
+					};
+
+					usb_dwc3_hs_eud: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&eud_ep>;
 					};
 				};
 

-- 
2.53.0

