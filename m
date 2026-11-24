Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550517;
	b=DDyDNdvbjhQlJuAdptcqmT6syGoXlazI7ovRXCaEQSvqrQ/4E6DuBoOJeMRsPZXBBMsJ
	 RqMngLFnLUXdAlT1dgRCuaA6b0flsOGevtq1oFljVy1lLGXSeATYGryiF7ls6CEsASzdq
	 hZk0LGuoG7XLWbDi1DzYDV3p0FvmR4ACs12fjUyurIgVVAwhgAS2lhHwOl5Av3rBArzC9
	 bOaNN0h6Oa1Kb/RIbbgGZ+HRP2AFD8GMv4BxSrz9cydfAcf8Wvjx0hViT3B8KXWY7hIBz
	 wv+06WdgNivD7UBmqMnfQTOuzikYssDSQSb+2GiE17v0qWzqBHAzX5idTuGEtNBQRUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550517;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=;
	b=y5R84h86bqkIe7xFHrE0m7IAOBnCnBgvNm/QdtQEm9ec2Gi6ZIJZfuHbKHL7q2y8vtjj
	 Ot32HxgkkJ1FwEZTfoyoVWafnOimSc04XR1Wf2IDw/tc6zsM/BRB2T2qDWR1Jr+DsveSR
	 xqM0SSnFB5/5NG7EG1T843fHSeWm1k4UouPAkBf46xXHQd3z6XC7rAYsNHHCpYbvFvY9n
	 mTPrqYFGSwllCBBI7xSKySPQBm6j6HSv9paLMXCjo8sbGyxlFN2yfWPDyE/9/fY4RCDPi
	 3h+JRXf+/ahYkeE6shrWUB7oSp38FlyFbm3Z3VZQRyUFztMTRXhtl9GzFjo/q7iurNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxgJ7pYe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLEu2eo2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FB0606A691
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FB0606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxgJ7pYe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLEu2eo2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXnqK365861
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=; b=WxgJ7pYe7a1NhCBD
	3RPzR2OHdYUWIS5BRV3ASd9SBJtUla9otD3oKx8Rfv7ZmXMWn5wMrWC+hzhMqeHN
	rDL3LST8DUaiCMJMLwHyw9wBgMJzLdgjCRaPd+8FZZVO6WF2zSwPh+PltM38iAbc
	cRVdPpj9Qvtocc7imwvdK7kXy47+nYBFgMSbiNZUeLuaq2qV4ZVDyGu0h+BMG34b
	djSFX6vFJaJHFZpNRAOqBeO4y/XLli4Xo3kNK0NUcaEgGRhJ5OAKLbzyf81x6XGe
	0Skyzl3FVkdBBRd4lN/Kj7lZwho+eyTE59HIU/bXUHeEEctJ9bHyPPHemd+65bBp
	y436Yw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhbqh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d3747ef323so159646137.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 12:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550516; x=1796155316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=;
        b=KLEu2eo2VWV+zfB5v0/DQ6r5HvvxBS9v4O1t5cNjDxe/dSuCwJbymJgdpycgXvGT8O
         laYrXCxEmswibdJweEPn0D/85/ucz76TqvaNLzlRuKYEfEZQtnW7yxgEoMxY5tNP1ZuZ
         IG094R5cxYY9adxLtsi40A+7NXkhc9VS/54jSSqOQF6LLS8ofJWqcIKepFGHeqp/FD8x
         UCU9AjIBLKG6qI6Ig0swFsyiZBxRFxOisgGpexBvNKqYad6Git0ba6IPRTb0rFMtwC7c
         onKul2Gsu1SKL57d72auP8rkwMdeuKAVepMKBB6OjITKlAi0eIoZsJmnclhrl80jQosC
         Sk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550516; x=1796155316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=;
        b=nXEAWxqAg17ISlUQ/86YEKHVPy9HQxoDwhk9JgB5tvSWTMISW5Ana+yN9Qhhhcl6Ep
         8eKYU8YaanareRF7OXyShI55Db2gTMvdcHXi1Sa1w+t7IUj9mU16XbRPOF0fwsaRdDjh
         ShJ3KikjVHYDlmuNBhGsUNP8ITkxiHoO/CrA4nhPixAJIZL9FvCHi/HgtN5xd105CVap
         PhIGcQ+5NuySiwWSHqSgprPYpFnURpYHOExNLyXkRbJotxkTS/GkDvLIZQg6+3Ly2uRL
         +vyaR2z7kZodA+QevuSIHi4n4fRDRjHg7/jI7rfbSLszRPk76NdKu0eMDAlGbRPWmRMh
         cdlQ==
X-Forwarded-Encrypted: i=1; AL+hErG5dYGZEFwJskWXlaB0roQNKMdBdTMr9yA0DI0p0MFnJmrdUaNQhdKRDF4pAS6BzxvsQU16VcGsrBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TtG0GFHd3TIQ9NnU59AIzmg5TxywqoCcxN8vNBipGk2lRjMt7
	x3BsWlyvMpcGiPHtaJTSG/zeRxqWszWrmt13iHvowqF08b1rYPxG5IHtodj372SLC2JiPD4NHX9
	nT9AMIPB3Cy9o+cIft9yUiet2sVCjlXdn76pkicH0YZMlphKxZgUA20bYz4403ks=
X-Gm-Gg: AZFdTZc3MevbAZGQKFq1ILxoyJG11kJEvZNRuoaGW3EN4+ehO+RD6phGMf5T6NlrhYO
	1IN+Xui2Axls6VTwhExCM3FMG8NhOpkGXVHLq4xaulFruxeX3yy30+7p/XmyP2lDLcp9lWIkCX4
	VaAcRRZcYQp2GRxfE/ulaBjKoEEiunvgx7BE7v8kceycVAfiuipU9xnfpZ/mlDH5MjDHbWYaYVx
	lESUlH7tazjOMWztE0q7vcQ0VgXbEl1JJZ4HViO/Ns12b9mnPe7HJombQH+QsRAGqWQ0rSvkoxe
	/nxKWK/gjIwp8uXlYbfxfk7bYEag/2X11eZHUl3MVbDpyk612mz5Mo6zhOWWV2cM1N7mJXpSYEF
	G3SphFwio59d/m2uHvInC3GrWpqaOMW5VDvuV8wKNJQX7VURHPValIJ8L8Kf67N/MdIIrsOWdxe
	F8xQV27KA=
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr9353326e0c.5.1795550515684;
        Tue, 24 Nov 2026 12:01:55 -0800 (PST)
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr9353247e0c.5.1795550515061;
        Tue, 24 Nov 2026 12:01:55 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:54 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:34 +0100
Subject: [PATCH RFC DNM 05/15] clk: qcom: gcc-glymur: Don't poll the status
 bit of some USB4 clocks
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-5-a9b45c69cd38@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=2300;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=GmuoZNziZvPu1UlsqsifvQlY7SuM/U4EVYwsYPf4EdM=;
 b=GTjcW3B9vr7Iepca856fdLsOvmCpCMBNJCU1xy7eO8dKAHF60Cf3bzFsN4Z3SQoTNDUIH315P
 skO0DtYej3eAgai19OVL5aamY9nYLh2MmYMMnuwrsr1b1hs1Qu2gIJe
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05ed34 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=zk98c5D4pPYhsamE--UA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX8YFl+CxJf2/j
 MROMss/2aNckVhEHIS3A17TkkuXEAdapf4pkLcj0DiEM4LvVS5euS8Bo83841bSoFBZeRCAiBtg
 DNUJZdXN/w/yLUmQoOuW78VGcuUrt8Q=
X-Proofpoint-GUID: RhQLthS-8Zoo4Y89YVx9yH5eIE-KQ52l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXx75T5WxhqIb9
 I0N6kKpzDhrHdp7Z1ePcPaH55fdBxfJULsyr8GRNtG+i9yKXGswRR9pDXOrgoXPtfsiPYmAZ2qV
 vlhMhOTfotr8SWkBO+YbE+mCljE9DOmmx8lRBNo0UB9R1P2S+YODS05M2UC/OtZORZhB/MvmtRm
 FaO26D/aoMRuJ2QSe2vjvJozBrhVWFZRJfksBXABDjV+KpdkYKGzKMT0aYFPS8h8fSE1fIPpCBr
 qQXjOae2I11Rtf1F41kaDvl4XAjc/HkmsJi54qE33DUr5buiuV/79aGlsaoUwvhh6qWbgN+XxFi
 l5HiR4CSRP/CZ8BYw4gD0tMDGVVk+YmR421CGvF5f7lJmXNYePM4E70iDjJtLPfyFt3yfX09fU/
 vbDi2+HXzZIahq2roP2iBG1eNoFC/hDrO55Xv0FF6QqJ3nxR2t7mD4W7IT5KYKikUJAa8QCjtyM
 9f4Cjcza8jRNj9op4wQ==
X-Proofpoint-ORIG-GUID: RhQLthS-8Zoo4Y89YVx9yH5eIE-KQ52l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

These clocks are PHY-sourced and their halt bits seem not to update
reliably. Ignore it to prevent spurious warnings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 186c779e30846fef5fbcf66d114d58389d72efa7..3323792929d9292db0fb28b116723dd054d6deec 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -6833,7 +6833,7 @@ static struct clk_branch gcc_usb4_0_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_rx0_clk = {
 	.halt_reg = 0x2b0c4,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b0c4,
 		.enable_mask = BIT(0),
@@ -6851,7 +6851,7 @@ static struct clk_branch gcc_usb4_0_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_rx1_clk = {
 	.halt_reg = 0x2b0d8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b0d8,
 		.enable_mask = BIT(0),
@@ -7068,7 +7068,7 @@ static struct clk_branch gcc_usb4_1_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_rx0_clk = {
 	.halt_reg = 0x2d0e8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2d0e8,
 		.enable_mask = BIT(0),
@@ -7086,7 +7086,7 @@ static struct clk_branch gcc_usb4_1_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_rx1_clk = {
 	.halt_reg = 0x2d0fc,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2d0fc,
 		.enable_mask = BIT(0),
@@ -7303,7 +7303,7 @@ static struct clk_branch gcc_usb4_2_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_rx0_clk = {
 	.halt_reg = 0xe00c8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0xe00c8,
 		.enable_mask = BIT(0),
@@ -7321,7 +7321,7 @@ static struct clk_branch gcc_usb4_2_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_rx1_clk = {
 	.halt_reg = 0xe00dc,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0xe00dc,
 		.enable_mask = BIT(0),

-- 
2.55.0

