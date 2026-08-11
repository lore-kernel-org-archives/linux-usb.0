Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF4D35201C
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484185; cv=none; b=j1GlOLVBqHmF8eeDvnuOIQtQfJ6kmmB/r3959ol4JV5fHtodlIVT2T0nvdrfZ1z7Zpc2ZfYD+iq9aO7jmIVtdO14PUghasEZXkqE6XACeQKWXfy7pKUouDlHDM3iOQtgaJ/QtWgav+39i86lrenZSRk1JkGNPN3C1iV77hdH6EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484185; c=relaxed/simple;
	bh=OsqGFuhhnJac4LgELHu81FXuRF9QOc+DaaigaKXvUu4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i2oVvzMud3qj3ERj2jy8iipmmQ2Qs7o2aGhfisEhZjBd4t5Al8BouEVfuC3acHDu3MZkwsmZTfnde8gVdwRroYK1eesdBdt9xwzUECFq5blbt5WDFnzwPR/gy0pZHEhm3Qv6nZTmFII91ArjQ+gEbbDy9Ir1W3gb1iiHtXj010M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZ5Pw//a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCw9N03q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZ5Pw//a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCw9N03q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLQR6w2159730
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iRVA6jIwRIm
	p5fdXm+zZGGs6C3xmYNbUcGmFLl6rhtE=; b=WZ5Pw//aKBrmiKcYXFx0vpDtrtb
	qLBx7HSy+z5YRaEMdHSXRER5772hIZZaKRhEffkeeTaXGApRGHB5tKqnvFTlcUwS
	EO0Hd0nftKgydCzPXj7UYSaXKcBHNrX2XszYqmIQVV3kqkT3s13TQFNwI1J8FmoV
	kxa2kWnCAF9JSxHDnLQvi4B4D32gfiOqXAkHEGTzWLrk5RLd9ya+X36+l5Ztqci1
	MXNQ4fN/VE6bFE68Vu86cg1gdAf50ytwIIJtiey01vd1sU/IZ0FUGiNYLgXXZIBo
	dtxVV20PF2TRZjnrGa/Ad+GFlRhQTp4VgRp9uexVwxvoBo7y5Z97btIjFpw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049et684-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so203592a12.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 14:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484181; x=1787088981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRVA6jIwRImp5fdXm+zZGGs6C3xmYNbUcGmFLl6rhtE=;
        b=FCw9N03qgl8VvdylvmFVwNShxsZBF2IiJ4I18lmePVHCyJQqS3UJ/p8ZNdbqZXgkrQ
         uQ6S2OeYNsslsATOl42QlfWjIIPZiAlM7eaAZjI9Yz4g4UKQY9Oht0awBQ4Y6CXcWf3U
         xcc4zOC1D7s518hL7MFmHX6u45dUKjJBw+qy2pRWzTwONIY5hKG/H/HEJNe8Y9B/Aufj
         4SmzdVARZ8bMBQeuc9IvBp1g/l3bNHuQ52nNyrHXjqAnRyi+e+aq9LbkpuxlZg4Qi6BR
         1CObOtia8UoYwjR9Ws5FoXt4ZlxAYbEKo5MKqS2gBznYVqr1+Ts08bkZpduVt0sbVbKT
         7VRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484181; x=1787088981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iRVA6jIwRImp5fdXm+zZGGs6C3xmYNbUcGmFLl6rhtE=;
        b=L0N7UuNrZAS8vbNoR3RN7T2U4Vu21xMygNXp4HlYqvTLLrDOHraZouJhBgoXP2Be0H
         GfVccEH9nA14DaYX9IACYCmQaqyiGSD1Dn42BfjKIYKCHMbatA9xvJGsL2R0OyBlqpEl
         bvw2B4R+xiFWZrZYpFkGOyDOn0W/pqan2oNWDWNkfnchAZQI0Soddj65C74cA3BSFPiR
         eRExdr4r05PiyjT086F6BS8ASeKz+KA4xU/cfff0TvBgY+AiJBsCCc4MuAwTRO3NU/hv
         eNPOzQnVKz4NmaeAqLERwC/KJs+r893QILgxj4uh0MoDk0LxY59Dx78ml7CtntLS0kZi
         iJRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrxnd6cy8buMC1Opski79W09lxKQVTuZRKr4E5itO+lfu7a0mDSWWjCpYxTHKmOcvdt1g7AAAbStlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX+lhFp/xim6QXbWLzTIEnI1ARJsAYwGQy0EQz8BZdKlJrTg38
	9tWkI1TAxyqtyPqn3Zls+X17q+FxiQPwwnCEnuo47WvLZK+2sZQglyN6FMt0dHRQuxa1jw2/th9
	Y1kSADnwSveocziIUFm87J22x2hrFRRDGYruqG3eHP0L7FR0x/w+Zanusu1gU3K8=
X-Gm-Gg: AR+sD13JdsaizJbn+Y7z25W0umVLJnw7i9PAaCq8kxhVioSDkUsHOnhupsfXk0wvoHi
	LBq8palHks1AdjKOiVLe7J37zMoy5U+81XQbVtSVTkXCyO4eUf91MLQLhGd1KIWvl4mNc9oZbb8
	RBalhoUSxtU0v/7m54WLHcRChar2GeSQggicwOfTFLiFvrpeG2NalJYilmD67t3eiwAtP3xtQIw
	ppIqMhQhJFnGXwS61f4+xrgQQT1yIPcnHIOp+Zn/5qIjBHCHARdPvXeVBRihLfkIDoHHnI28Btg
	oA4PPBCQ5R2JgRm18XRVGFS9B/IN2j9jHsHDB8/rdCCIY5f85Fg9dWnh1sPyZPlbS/8g6WMGRq0
	iAJa/39b7u5NgNH6qerEEyFxx5c16C8JcBE9mdfC/bpe10s/KFb5Wsg==
X-Received: by 2002:a05:6a20:43a2:b0:3bf:9bd9:cf60 with SMTP id adf61e73a8af0-3cc37846dc1mr4351390637.6.1786484181291;
        Tue, 11 Aug 2026 14:36:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a2:b0:3bf:9bd9:cf60 with SMTP id adf61e73a8af0-3cc37846dc1mr4351321637.6.1786484180853;
        Tue, 11 Aug 2026 14:36:20 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm2713563eec.7.2026.08.11.14.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:36:20 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node
Date: Tue, 11 Aug 2026 14:36:09 -0700
Message-Id: <20260811213610.2956147-9-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfXxND7QI5tpTs9
 lH2O3oYhVKZHnCYc76CkAUR2/7S/bfp+KFKW0k6HV0d6xOCZXn0KJnkbtNjEYIlBljBnS0Dummr
 fbyTm0yo0jW2pwbnXzx0FPn3zUSV2ps=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7b95d6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-Y8wEhFFMILef-Bpc8oA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: TwvjMlad81QyU88v3MIgWm6Zgk2md9wX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX33A1ZUR4qYzb
 YA5GOKNJ+n9t1OM6s9NvYlpupmKpcu3GKDVPmNPvXgE4uzSYjKAw0FQ/CGJKSKKSTLJLkirTxsO
 qA+GSy4rzliQew43U67L2Anb1HQpwy+K5dwjphc39ilu6TyTcNkIZwb1tw1cs74i4rUrPndxOcP
 KQlz8rgpbGCniZI9Wj8ONKnGh5wqxPHgNXbtGPBxnNl+nYbmNu7yUSmyRLAuJpJDInrvE5rjJY+
 4ogQl7mlvsZBLKVDsCKi0fgfWdZzUAjsUGiP8kf4/eRfO4Z4c7THRQlkWdSHfC+o9ypOER00YzV
 oIjwB2kHvanTzNzP06Yax6Vs51DQu8XuWYkLVxxU4ylos9kZqh/l2rGvBnPdt1AQNyOGw3BOFD+
 jFX40AEhk1Y4xYB2DpG1GLS7yg7LeDP/v0YlXGFSUfsKULg7gBM8Cz/KY0uELPsFqWGrkv0CPFr
 QOb02dPlgmsP1Q4PjKw==
X-Proofpoint-GUID: TwvjMlad81QyU88v3MIgWm6Zgk2md9wX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110182

The existing EUD description uses a legacy single-path representation
that assumes uniform UTMI routing. This was sufficient for minimal
configurations where the USB port operated only in device mode and role
switching was not considered.

Update the description to explicitly model the topology using eud path
child node and add a role-switch declaration to reflect role-dependent
UTMI routing. Also on this SoC, the EUD hardware intercepts only the
primary UTMI path. So remove the USB endpoint mapping to the secondary
controller and associate it with the primary controller.

With the UTMI path now accurately described, enable the EUD by default.
The connector side of the path is left unspecified, allowing board-level
DTS files to describe the physical connector mapping.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 35 +++++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..30b62b406906 100644
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
@@ -4753,16 +4747,28 @@ eud: eud@88e0000 {
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
+						eud_usb: endpoint {
+							remote-endpoint = <&usb_1_dwc3_hs>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						eud_con: endpoint {
+						};
 					};
 				};
 			};
@@ -4989,6 +4995,7 @@ port@0 {
 					reg = <0>;
 
 					usb_1_dwc3_hs: endpoint {
+						remote-endpoint = <&eud_usb>;
 					};
 				};
 
-- 
2.34.1

