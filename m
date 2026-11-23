Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452195;
	b=cusK3495Y86q+4OhqpWX5WjMOPH1uaSVTmqJsBeg0AgSjAxvSTT79x5exLVDpAFQu/5n
	 35VMrFu6JMdssMB7U7uA8igqXpfXpZzHtfFg3kg8qZzoZTtprQyr3jF5F+ht/Si50c3ip
	 3M1BpypAhD4hAl62wcXRMzia8ySng2oYxi7lPIy0x21GLOaiuy8iurVz9TWFEnYgvxZlv
	 aQY0AHYh0MltvqPlQsvHDVxR/mBn4nNdbH1oSys2zowRJNlwus5VoXnv0yj4NujUXbSsf
	 oLp+L/ZeyDk0iXFa2fdKOXWvZsogNGxP8xIT3lxgM9voCGwC3IoSNpeuxLlMsvhRvFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452195;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
	b=W7WAXOwmUL+cSsOE5tFk2BoHQA3oSV59bW5pgxqzEbrTrK5yWkIM828OQaWMLbGyfLDQ
	 Od+vUfvK6nXSWllB1mnHbZIekkORBcVCPtjXRLRQ0j77HdL9LpO50OIxebLYg5qnXKTFz
	 KgbprIWThQlmTOl3mu/4Zmvjf4qyJqJzG0LQgagz2CJtJSsvCih50hD2orHmyArv3lPCS
	 fzv5//cfoa6NWvNLbYaraS3brnL9iYuK6hFAcr7HlQLlFxHw9jlBGnW2qlDNtk6aXiLti
	 O5peXZC2wxLBLvs0kVbAOZ6JBodvl0txWr6dIf/Hc/PjuuJiwaWnA4B+/6PBJXOVuzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bYi20q5q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSPPntkE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BCC606A69A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8BCC606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bYi20q5q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSPPntkE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3RO1093799
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=; b=bYi20q5qmtj+mmQ/
	RBnmM37JL43Sv32HyZV40BcU0nKWzO90dX3rVPBh+1lNie/T/OprsBUPNknFKkxj
	HAPisO4bFdVYDJIVjN32uTjKpmY8b7NIi08EiaH0YgDVTF+TueO6osskrfUVtjoE
	UbNFmfaiU8JN8Dz7tkad+zWVJbi0R52qAuL/t6z3D4d7P2YfPN+fXf4TY0VGSBrt
	antkIZkSepzsRvbrHSlT08UrzekzX5MCOBsuzLtzWO1wrEnF9JzMGEy9ZdjNKxW8
	aq1UQi0B2bvlSR+EI6h+Y35kNgutMEOYsURprvKt629I0/i2wvueMyGfhmIIhvv+
	d5tieg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0sbd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5edfa36f42eso2532755e0c.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 08:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452193; x=1796056993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=JSPPntkE/swE6x9ThFFHmU+dc07IYKfAskGaaC/ny6rDJof5n8MNJGyiLBLMDUGaMV
         ZCuAQa0Fgrbc4J8w9CNrYoK6moJVxuGJvwX/vBQ7b/tD8c0ufDC7xGMhwTMhI1pQ6jsP
         2gmL+AiayoJhai+fvrxLj7JeAdMhcMHIA+8zM9Q1ZOZws0kQF2y16RjKNrJJQbmfcdZt
         4GewrfNMcEZf2gVFFaPP9/xsCK//QlpCwLlTgwXEMNYDRny71OaNz4tibu1lyAGQGb9s
         FOm98+b1VpkHqNFEshV60uEiB8ejP7q+wKDsvEPOAvYpmkPiTCuo/7I437h6rJNvX2F5
         9kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452193; x=1796056993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=lzQjhbkW10NCEng7fUp7BqO1TdetVvETiW+R4IITvwXibnbDu7RylAyctdivuT8y2F
         itLuDNbx105geQvtQczitytSyZf6t/uz63NBULTX4UQjBI7tSHsmiMFQmkbszFoXHGCn
         G8a1nIx3CmvJ/n3Y8wTUvftpban3AeHMmTDJjMPg0tCQp1Z1rRWSnLFr8pOGh4PNJqmV
         XM3cWThxOa7QGSMQ5974RAABrkmk6O4aYX1GPOP2tcJgWfy5AyEeU6MfQav7/EnSKYRi
         HYGqxFOZPqPkC2GNtSbmWdoxy8iv2ZhCHku8ONFakvwh33Nd5juToZlEA1Qymuf/UsS+
         JDhQ==
X-Forwarded-Encrypted: i=1; AL+hErFXC5mkQXwVuIT1RmXO/BtvPjln9TI/j34FUC5UFIdi/Hzp81l3p1HtDfwByKZr4z91iTIE8v/UuiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eC0XIqQcEtZLmpk9LogpykB2cK/1Q//s3BuNB/TCz3zS47G+Z
	+kxLxSYS+kCX54n972o7OISpDgfO/d8QCOe+mFKHFFqHCXRvWs2Mr43PyLOnvTld4d6usM9Ejx6
	rXmgiNAz3VJK9Cgc/lEqop6nNzzweEa480dUui5G6PNoPz/n42wju5I6+ud8Z6z4=
X-Gm-Gg: AZFdTZdEv8X4a9AtQPo1MlwO8AoX3nwh6DASGcTlzWtuvzv/OdXFQERwjgjXx7XuHsB
	j9C8Qnrcn6QHeDq51znRWLJv9PIRSqijW4N7HVPOmQis1d5+tI3wRqzV8XDINXDYovd/XX+3Nx4
	eEqbJGV4uzjSxMny98SHd4SDYFcCFj8Jcr29Q+RkGmWHnzjtRoT8co22kV4StqA6BIXXjAg+xE2
	OjAwjAhmIZ8rJFjbOmH/b2YsxCyfrJjdxlNkebg9nKS56OroHSyDHtO2JCo83uIPN5uN+4h7N77
	MADK/3b8ckqzweswJxM3GHyRIBA9QUdC+NAmLpSXzeVz2Bq1SJrT6nouJtL2FoSkGN1bzFgxd/v
	HhLpXXBXog65ZYAABSCDUKT5yeSgZw8j9JWPRypOV8aYtV01kstXQ/BFA7aJvTeFzC5mlNslppp
	ov53rh77Z6+dvs
X-Received: by 2002:a05:6122:1994:b0:5ee:13ad:6c8e with SMTP id 71dfb90a1353d-5ee8af3d2c9mr6205491e0c.17.1795452193289;
        Mon, 23 Nov 2026 08:43:13 -0800 (PST)
X-Received: by 2002:a05:6122:1994:b0:5ee:13ad:6c8e with SMTP id 71dfb90a1353d-5ee8af3d2c9mr6205435e0c.17.1795452192792;
        Mon, 23 Nov 2026 08:43:12 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:12 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:43:00 +0100
Subject: [PATCH v2 5/5] arm64: dts: qcom: qrb2210-arduino-imola: enable the
 EUD
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
Message-Id: <20261123-qcm2290-eud-v2-5-9bfc432dee07@oss.qualcomm.com>
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
X-Proofpoint-GUID: Rsf2g7uefLg-bKfmgUdc7oNhnpz5wGd8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX2vqxcRkzTp5f
 cEu2DK070rkTuoFxV2IqwdSBCNTda9LiFDpHp8l6EETSQdHDr3b2yieVVuQkFkkh45PpFyf4Mb+
 WUbh+CmSw62pw2SfHmsAzh0r71xdS8g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX8wLZJgWWTdaV
 BGlENiQ7h0hXUYxeGqlnhW/eg/wYzMo1KuzzKCQNyQKuYyynCXisc+9ffygsMdRD7lMcXakBsNo
 0p8ZwIyggSnFjtMb0V6p2FyLhAaVOelCfCzcDOpfJDDPysIeUJpHjrk/b/JxzKJzoGOvtokS17D
 GYPA3Wm2gNsL+4xGcpl0tiJ21RCImVg3p3Kv9ud/eCqofnEbPJmcuwrt9SwL1qOEnRSKDmWF2uZ
 J3mqqzjYcFilgDckI8oGQINPHs3hW/YKv3csw8Z28Iqv7LtrZuudoOIRWqsZytel9iPqWHulQgD
 P4TbPsj74jkyuMSgVUYnhLthfj5nA3qokbdWizr2dSvq3U+fkoCtxdJOk86GwF2O4ewqLKiA0nv
 MHNARMTRUhnob9UtQDnWPN03hrxbARuKvlisSm5yDYbmH0vZo1PlYvBvA2yrl6/PYQ92NvBsPr1
 INULT5JuYiO49Zv6Rng==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b046d22 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pvBjvzZ7d9aESBAnF-kA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: Rsf2g7uefLg-bKfmgUdc7oNhnpz5wGd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230066

The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
adapter uses to debug the SoC.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..a1af2caa5bfc 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -226,6 +226,10 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&eud {
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.53.0

