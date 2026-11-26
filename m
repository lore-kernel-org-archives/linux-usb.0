Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719597;
	b=o0Jkhl24kb5yrJGINC4oV04ti/6Hq0KjJFImVGUIbwMyrgh9MCIULnCGxZDDmKghsgSk
	 XFYP1OU9ImlDJXycP9QG+ok+XfKW1rUWx30vK8r0Sg8QcZKBI96dQ3uMvB2ek9LlGgny4
	 MKg0RvRrIDVednI/t1Wa3sXSnZMVrNzfgThEhhAg0N01QKwWdVWHKqWCjSV60HNitZhS8
	 hk6/QVtg8rf6XCyN84fs6c6mlVCrGOGYu3lh06VW45oEZjL5+kZ1qABFZfIgxxaJbh81o
	 Mf9vihwb/8HNJf8W3ARYH2IVndBRnTNvucdD7xE4j7QIH/OEQTo1qMSveFWKBohb9vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/00NqReDgsN7DpEOL6VOh9ns6kcq/8uBglgUysJara0=;
	b=1fMrUdTUXQSITsnAL0q5R99qQphb6v9I4X9QX0Nz1B5GI7zGpHMCYuOUXMQ77p6H4H1O
	 2rQilLBQeEnrh6nGVr10pPbbOwxUI+xa82Tzd6BxECrwBImXET4SRD8Dj6U+OQwqYcA0q
	 tcK25Pft0JE/CNonFiMxWfVhTceZseKiEvQJQjjXVpst3WSrG6C2BwSVkdZKhfjdWeAs/
	 8/m0exCfM//Piqff5Krg/Dgdnzjo05jyVuU+JddvHWr1X2TVRjdTOA5i/5zks/u47i+vv
	 OgPEpxVHXBTv9Ofat86/Oe8AC9LBHstLces2k6OgxS0+GxK6HM3cBhstUcNi5tptTeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EuCqEniA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JWmqraN3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92140606A329
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 18:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92140606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EuCqEniA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JWmqraN3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuBiv1847909
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 18:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/00NqReDgsN7DpEOL6VOh9ns6kcq/8uBglgUysJara0=; b=EuCqEniAuaycpS+j
	QAyhLkuo95LaWZ1vhIxVcP96OjX57gFDo+foNWMeoJQlj5vjDv/WKuOlh7xvDlVD
	3Iy2f4BnNeIOnXjudnz1p+CmNnTuT2tKhQQN/H7ORm6kgASgScdB2f/eHJTmTDaT
	5tGBhEqmfaow4nB9bd7Mi1GkGOeEj11gv4+Ga8v1u7qSwku337TrNk/m/YMXaZtE
	OY1xY8Thz67zyEtZsF6jj9B1GKlrT0kn+m8tLhvgTSSZzsiFhMS2/11XgexFWiVw
	mTAJJ0rHOFQeSqQHM54PkN1bKCqMcPDIKxD1S/eB2NfTX16C0RylWND3gdSbPJ/K
	UxMdMQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7tgm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 18:59:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386ad819860so5308263eec.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 10:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719595; x=1796324395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/00NqReDgsN7DpEOL6VOh9ns6kcq/8uBglgUysJara0=;
        b=JWmqraN3hJmxXHFltg+Uoxu/8t2gAqLj7kEtRvaBnxcEybxjzPpoVZGPw10PGa/lc+
         JmnnmM8z3sJm/O4ZKOWCX8PL/n20LzyIhOPW8lqn2l8iCZXNjlMKEGdXc3nyyif5cQ+y
         U5re3sAA9IAvASZbWyxbBfGoe1HW40VNRT0FeyFzLaGiy2RzyMSsLqL0yX581RXOpROc
         UjtOZTstutHrzCd5qaJSycuKrM0iLbaFzU00oAsNsi81gs2GTOBDXTOy14n1HT5nr4LA
         VzFen/2p8WC/T0+KOKibCzSp8afMOLL2MOmKDBqz2dWCJa2ilpIC8iNq6HXokibNb8v9
         fvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719595; x=1796324395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/00NqReDgsN7DpEOL6VOh9ns6kcq/8uBglgUysJara0=;
        b=zEWHhESHLwN7f/Nmm2QxcPm7vvbbJRzZUmpGT/szJaDCEoH8yo7yQeYHKvZYe4cljZ
         n1bC7ZRaEIx41TWEQJXJelfedZRIk6bsKy5XbxobeFVGpjx86DCK482xa8O7OYmsn/hN
         vsaULSHA8ARdMZXkA+VHBd7Adow41VblHJ+yYiYt7AziVyBgm4+IY3DeyaXK8pFn8bJp
         HivKlNv8thofHs8LmyWhFHFvvp0IGbEiPRIM0uX7CsRPkUynUoyYCrsFUUVFWDLe2Osb
         BDRQ4HSGsXj9e3GVpYmbEhIZMCWXvWIjdKthcnA3Kk1nuOuKNPiSDPbdLpganyi10qHC
         CO+w==
X-Forwarded-Encrypted: i=1; AL+hErGf/DA3yB1sMEnLDwkF+ceo6qG/KNcLMohNBCjghGOL7HoXWMHFnq9qF1soy4mdMIvTQoRZEM7sKA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z86sxUVXnWylrKR4lDLZy1kEy6+5aEFkWrSwcOkjXIJ52ovn7BL
	IL8m77+2vqYyvCke7/aY6tiK1OKTT3wJf53XJxY/1CEF0W/xfGhr2QjAaL69tBwB/kAhWq5qG0m
	FLpi9NXigfDPWGpJcyR/34750zxEh1OWFgFwOGmtPbYNJdH0Kbk/g51QNCR7kbcA=
X-Gm-Gg: AZFdTZdURzRFuCG2XmSdKi0sfo9NFQESIX3tpJY0KU87oklVgtkQpnwHqngZytBryKi
	SJWU8uHeZZ5rtXbbpYJE2Ngw+hzHfwmYLSjiUCTepk64OftGQkkcvXBrq6aEyy0g3bnXDN9R0D5
	taFZoxCw1IALsXJstc0J+74EAhcv5s8NHIZxzwJLM/dveR5pdAZnxxFm+oBdwLS7UkCH4r39AzO
	Qb0W+Bw7cHGHOPwInpTAyBzf/WYq835c4RRjHB02pamdsPyi8jDqGo3wDv1TY9om+Kq/smB0/jU
	fatmZ9tY3YmrOpdFFFDJuj/BgO+j+gdQXn30e4MBG5xyQq4tJtyRNpdeXMCzqvxCBqEtjLyQZVy
	0OiatERy7yvHgFHKTqI7LvfRQou/r3oO0tp8wg2VRqe3Dwu/z4vZ+x/FQP7G78nZfOeAXR1Ed9h
	HlBaiZ
X-Received: by 2002:a05:7022:1583:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b5568c0198mr23680000c88.25.1795719594280;
        Thu, 26 Nov 2026 10:59:54 -0800 (PST)
X-Received: by 2002:a05:7022:1583:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b5568c0198mr23679971c88.25.1795719593789;
        Thu, 26 Nov 2026 10:59:53 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.10.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:59:53 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:10 +0530
Subject: [PATCH 2/8] clk: qcom: gcc-glymur: Register set_hwmode_dev
 callback for USB, PCIe GDSCs
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-2-485a08ffdc6f@oss.qualcomm.com>
References: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
In-Reply-To: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pci@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX0/drMROTiUfc
 apzJUhWm5O2c3CP6iV1y6QmV6efni9QBwulrJTyBYsE9+j73i0h41Vwv4TZ2HwkLndtgHba4Ir7
 SWGpcPQxp5eew65v3Ol4t7SeCb1O2u8=
X-Proofpoint-GUID: gAza-NRaadft8iZEuJy0ByElvJm6sKBQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfXyTGZTVp3W3Qg
 7JoUrpn1JygfFg+DvH6w1OlXYtpUsyUJVuGZsO0fZ3m1haop+IW/nFyNPTrQu79Y2IHxIaNYB8i
 DqyY686468W6umsNTiZmBI+iswPWhow+0y3ruhY8JyZQn0I0c93CLDDPtIZiakoXWkNN9IIKlt4
 MnfDxhu4zPKU6TvPw1qshmVIRqj7R0hzoPIz2P/ipuI2OqUH00f8nIw2xePbzaMke+SZW+s6cdK
 UboxLy7ul1RlprbeEEsXnxGl1gIBOtzkVi6IM5nue1eohs0G93mOF9i2uaUFV+N5PN5z4+c/GA9
 6K7vOTYwUoBCTeCFi1/pBToKfDOrRbhEZ91W7eCbnX0stwGnCkNmrrXpqzaTjbAFk3qEBh8Tpxs
 GNJlHxJYdOtHphZcyBHMLuBuF1lI4yw/y7H8o7l2V4PfkR3VuSo/gi4N9BXXCLGm+mqrP5aYLCS
 oh+KkQs6XdrJhitLRvA==
X-Proofpoint-ORIG-GUID: gAza-NRaadft8iZEuJy0ByElvJm6sKBQ
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b0881ab cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DIGDBJpTELtvEum99LgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260074

Register gdsc_set_hw_stay_on as set_hwmode_dev callback for USB & PCIe
GDSCs to allow the USB & PCIe consumer drivers to keep the GDSC ON based on
the requirement in USB host mode and PCIe non-D3 cold usecases. Also drop
the PWRSTS_RET_ON flag for USB GDSC's.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 46 +++++++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index d8d33eff419eeb9885f8560c2c7c71d542371658..73013133fa27cf0b908a8e5552a6fe981ab197d4 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -7557,6 +7557,7 @@ static struct gdsc gcc_pcie_0_tunnel_gdsc = {
 	.collapse_mask = BIT(2),
 	.pd = {
 		.name = "gcc_pcie_0_tunnel_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7571,6 +7572,7 @@ static struct gdsc gcc_pcie_1_tunnel_gdsc = {
 	.collapse_mask = BIT(1),
 	.pd = {
 		.name = "gcc_pcie_1_tunnel_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7585,6 +7587,7 @@ static struct gdsc gcc_pcie_2_tunnel_gdsc = {
 	.collapse_mask = BIT(3),
 	.pd = {
 		.name = "gcc_pcie_2_tunnel_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7599,6 +7602,7 @@ static struct gdsc gcc_pcie_3a_gdsc = {
 	.collapse_mask = BIT(4),
 	.pd = {
 		.name = "gcc_pcie_3a_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7613,6 +7617,7 @@ static struct gdsc gcc_pcie_3a_phy_gdsc = {
 	.collapse_mask = BIT(5),
 	.pd = {
 		.name = "gcc_pcie_3a_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7627,6 +7632,7 @@ static struct gdsc gcc_pcie_3b_gdsc = {
 	.collapse_mask = BIT(6),
 	.pd = {
 		.name = "gcc_pcie_3b_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7641,6 +7647,7 @@ static struct gdsc gcc_pcie_3b_phy_gdsc = {
 	.collapse_mask = BIT(7),
 	.pd = {
 		.name = "gcc_pcie_3b_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7655,6 +7662,7 @@ static struct gdsc gcc_pcie_4_gdsc = {
 	.collapse_mask = BIT(10),
 	.pd = {
 		.name = "gcc_pcie_4_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7669,6 +7677,7 @@ static struct gdsc gcc_pcie_4_phy_gdsc = {
 	.collapse_mask = BIT(11),
 	.pd = {
 		.name = "gcc_pcie_4_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7683,6 +7692,7 @@ static struct gdsc gcc_pcie_5_gdsc = {
 	.collapse_mask = BIT(8),
 	.pd = {
 		.name = "gcc_pcie_5_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7697,6 +7707,7 @@ static struct gdsc gcc_pcie_5_phy_gdsc = {
 	.collapse_mask = BIT(9),
 	.pd = {
 		.name = "gcc_pcie_5_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7711,6 +7722,7 @@ static struct gdsc gcc_pcie_6_gdsc = {
 	.collapse_mask = BIT(12),
 	.pd = {
 		.name = "gcc_pcie_6_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7725,6 +7737,7 @@ static struct gdsc gcc_pcie_6_phy_gdsc = {
 	.collapse_mask = BIT(13),
 	.pd = {
 		.name = "gcc_pcie_6_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7749,8 +7762,9 @@ static struct gdsc gcc_usb20_prim_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb20_prim_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7761,8 +7775,9 @@ static struct gdsc gcc_usb30_mp_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb30_mp_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7773,8 +7788,9 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7785,8 +7801,9 @@ static struct gdsc gcc_usb30_sec_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb30_sec_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7797,8 +7814,9 @@ static struct gdsc gcc_usb30_tert_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb30_tert_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7809,8 +7827,9 @@ static struct gdsc gcc_usb3_mp_ss0_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb3_mp_ss0_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7821,8 +7840,9 @@ static struct gdsc gcc_usb3_mp_ss1_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb3_mp_ss1_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7833,6 +7853,7 @@ static struct gdsc gcc_usb4_0_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb4_0_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
@@ -7845,6 +7866,7 @@ static struct gdsc gcc_usb4_1_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb4_1_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
@@ -7857,6 +7879,7 @@ static struct gdsc gcc_usb4_2_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb4_2_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
@@ -7869,8 +7892,9 @@ static struct gdsc gcc_usb_0_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb_0_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7881,8 +7905,9 @@ static struct gdsc gcc_usb_1_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb_1_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7893,8 +7918,9 @@ static struct gdsc gcc_usb_2_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb_2_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

-- 
2.56.0

