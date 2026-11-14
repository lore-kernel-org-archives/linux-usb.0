Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670771;
	b=tDAMqzH8MWJBMBeeooBCJoybZn6K3Sp/J7I/Yl3tVoQhPxiCleQXKwV+M+DByugKV9a/
	 plSvzRR/5vmP9AJd5nmRSu8ta0TyDMxUF9dguJFwNRhT7iuKOf22JKVSu6Ic20KBZBgjz
	 CFf0jUzpQPndy7qewuF3Wt3RcNt38b1YokuvtE7FZwvpB1rPO2ZCcWQgIBExDsVTjdtII
	 5VjPXqWErbo7umayEZkHpq5sUsadDd8egCCXy+1aua1gudE8ZL/4jVv4kzeedbxeIlb8p
	 5uvIrP8ib/4F1B4J/0Fa0ZSH+sSPwoNgaYqQdPMB6/++caVRN7bhuDWr6QA1NBF2Oug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670771;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AJwCpIiUvPfpqcaTQvtJcrEnZheHjwbUexZ98D7cO9A=;
	b=XTU1vPX++DX+ns8nqoffPWaxNNmShCil6pW7QDGmPyA6c0xr2lnXufek7ayiyTe0J340
	 DdcS1C9DYZCeIeNF50y1+ix/N9gLacxqITH7/MbboYiQy5tSI1NKovEO8Ssepfh0kTuIt
	 unPc0oxdCQlyqXhBwjSPCQFeHpGhNWsDRNsReu6G+F0m/hCnLg5MHUUskcGs2dTDbJ4jn
	 89dYl2PlY8LvOFXHija/pYo7nOyFIMIja3gwAm/VCjsiP6tXMt/v2pjFq75+rW76AJB/q
	 r7Y48I6JzrVKWH/CG31PCvn0gpdEfnKZCg/L717lQEDwu4GCusaIrLjiaZESppRzAcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTP3ivf6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAJjPyx6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0A60A2600
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A0A60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTP3ivf6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAJjPyx6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkLnG3174145
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJwCpIiUvPfpqcaTQvtJcrEnZheHjwbUexZ98D7cO9A=; b=cTP3ivf6ECAC8YBw
	9xu4fuEKf2DVcmFkoxNpWJ6pwlOo53wu8N9R4HF9xBGmeDnIujobt4euOZIkoM4p
	9w8XNbByZ2Gz3QaVzfgo714omKWb9vOVQgFVZTbrwEsdfF5EjgQOBh/nOeOPSLl4
	uLxQzFB/UMotjUYj5LTrquyTYcT74OU7Fwps3OgK4ymuvtR7n3fhnVQClAI9Kady
	c9M/XDJrEGlqQTnINeq0PAis4eVSIvxKuImDi8tNmJJhTjmj9zymCHVrZJxC3RoS
	AnX6QrTZavTqveeCUKj5bp2EFrpRT5TrKPi94vyjmR0YyqYMip2JqFpOa9nol5W7
	m/He/A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhh3f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ea4a2210fso24906346d6.0
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 07:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670769; x=1795275569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJwCpIiUvPfpqcaTQvtJcrEnZheHjwbUexZ98D7cO9A=;
        b=TAJjPyx6aHklflDWIS0bZpBYZVBvuVT/OGYsEeiq9QI79tc3RPjc8JgZg+ppT/79EU
         DP/ksMz+v+DEtesi00b71dC8QHzNuDjsXm8Hl3HaBmnfaitK2DkekN7EP6IkgPVJS9DZ
         HToJCgpemqRQcVyTXB2sT7H930ZCZLWolQ78Dz/IA9HEFTvCquIJY/z+6mUdx47y5BxV
         bUEvD3AA5k4wIDGAtG1Tr0YX60faYz7x7AuQR4eumXtHTVnZdp8g9lb+NVevOBGy61ao
         ZgqRsXZ3DRn97TBkg7j9BwerdVeYl3N/QCwo7Ra6q8jdTBEo5l6Z8yvDKvc6u1KkG+q+
         h48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670769; x=1795275569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJwCpIiUvPfpqcaTQvtJcrEnZheHjwbUexZ98D7cO9A=;
        b=IGY07YcZrM1plXb5RdsCZI6KFR+QSThux/PfxXyNW6UfJ+2hBpUCB1I/CpD1VDFPrQ
         QIN/pBL1gdBOFj0VtFVwu2qZJOS1C+uWewCN64X41j7oM1y9L5dC3WPxHfOQbuvNg09H
         tIifLQJw7h1XyBGDMUPdp9LBPBldszn1y3ydVeF/EJA/z8/JKjxQGfaytQKLcBa+b5Yo
         GEoWVYbWkquasUmVaA83P76jt6yTnNCWEc01hdRg5mko59rWAAwm0xUZI+1Vc7OuXKfk
         BW+s+uBJP7izImmErcFMooyyUTzo72k5N59g6tc18hsfH773JWuaEUOo/oTNE3LkDWU/
         XJag==
X-Forwarded-Encrypted: i=1; AL+hErHtsdSwAaQ6u37AANXVg9Ies2oOOQNG/W83s1j3olvrigqbmTB7smstYQdRghXHFIwyMjovB6ONOX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sj2PBoVMJwuWmk0iqUURqtHUd2LUNe7rBXstCkgsJe/HFioi+
	iDf4w4OfVdkW/kwJLH5mW8by7d5rBneXncQLmFE33/mrCTh1GGUtepQ1dEHBDuuqNyN4ugCZEYV
	0McW+5jNqIHtZCtpRCxaeM5gc8E2EOUJ0FIUPY/RINtRqLErhZghIGIWpgcJTWZA=
X-Gm-Gg: AYBFou25QRhZ5zqsH6sNyUt6frUWfDkVqI72VfGzIqy4TtCBHbb0MCwdMds8Yex5d1P
	rwM7QY6KqBDnJHQ31uw9JrBeBAGj93rrIOgQnIFBaMn1EmiOT7t/RogPGMLe6BJqKS7BDoh6uLl
	HhDfQb6EbwaZVvI3/jjwivH5J/WsIf3+dLQl82F9Kgh+eMtM/KoKskT/gYwO88785DP66m9FDpw
	Lit6RCxipaF6itDhZUl2toGfwbI74rMjAYk+WvrSL9Amv+O2k0ne4H9QxG1xYHVM0WtG7LVA0YN
	9IxI8KXb9ER0dQlS7j+WMUNFFwaPPxkWLwW+mHLesaJfUOmbD3BajnsK9CD2ExqFU96LKHAYAUT
	DkMaADHB8QgryoRB+HD9fN4i0CJM5ipHurfBSBQRbxONl64TaGEzknwXrfmU0t3itRHf2/dy9G/
	L6yRjxYGqwauEd
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr926690485a.16.1794670768640;
        Sat, 14 Nov 2026 07:39:28 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr926686685a.16.1794670767914;
        Sat, 14 Nov 2026 07:39:27 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:26 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 16:39:06 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: agatti: add the Embedded USB
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
Message-Id: <20261114-qcm2290-eud-v1-3-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
In-Reply-To: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
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
X-Proofpoint-GUID: uHdPExf_bgjxMmbpAawCCvXJniejTG5K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX3piNEonUbGdz
 mDDhqfDPucUUA/hDjJrKHQMPA+6mQ0v1RrBWVni5AGbZTbvBAu4/6O/pyW12KuQecrBuUpMbZL8
 /vJeknOcQvO6oQRU7DYu3bXxnMcCzzo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfXxq+xas+k0qGE
 aC2iUhqNegtbvHYdjnQQcW3UltzGDap9YAFUQSn39p71xQHxvbO36j/x3oRL7lB/YQCZ+55hZKu
 py7PIH8ys6Z4Ucym6V5PRSc9lQ5hTBSx6FaOkGAUrCC5mYogeuz/bgmfhkSf8P/Q8d+0CKGnugS
 t5I2o3P1kN8CG0zZGoV/8VHn3NKbGiYft+/bcNqZvK73bEXVXc6wUIHl7EAbdyqueFl9L5gIQmN
 PmZTXkTa3R4XvrbbnPnOvL35OQIvas8ujOXP85xIKFx8FGu1Kr3ry2pJDOAjUDosb/gATeHvNAk
 tNCYgaE/NQ4mMmEVs2px0Se7+HAq7vOwSou7UEB9tqINzryC+Xp22/Jq6G/oxbYGyDqVbgHeunc
 r+Qb3jJtdFxtGriGBnlWqcnnunqyfY30JpRauyEOhGWBDG7n1HalkFPtZ78/zNa/1aIY+qFVDax
 cCDFVs6zt52cY9CuwXQ==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af880b1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=aKcbli_B80hdjCVHfU8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: uHdPExf_bgjxMmbpAawCCvXJniejTG5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

Describe the EUD: its CSRs at 0x1610000, the mode manager register at
0x1612000 and TCSR_APSS_SPARE_REG1 at 0x3e5018, which the secure world
writes on behalf of the driver, and its interrupt (eud_int[1], GIC SPI
189). Hook its port to a second endpoint of the dwc3 high-speed port so
the driver finds the role switch, while the board keeps the first
endpoint for its connector.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index ea9b39b1ed43..a77a5bf87838 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -826,6 +826,29 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		eud: eud@1610000 {
+			compatible = "qcom,qcm2290-eud", "qcom,eud";
+			reg = <0x0 0x01610000 0x0 0x2000>,
+			      <0x0 0x01612000 0x0 0x1000>,
+			      <0x0 0x003e5018 0x0 0x4>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
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
@@ -1680,8 +1703,16 @@ ports {
 
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

