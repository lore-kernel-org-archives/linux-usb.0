Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550509;
	b=LSZ4YTurTrDmrx2uFpdhG2qInrbeBRJz1Pvmk0j5jWSrMHtbNR/4LSKH5U2+pAW4oN6l
	 laj1IcYq7qNYeevigs8am5LfmKiyYDUUmv928k2UMcZsgFdtotDrIH3WrH6LMEteeUm46
	 pvLkhIeO/3D/kHAI44f4RyzAqrBvqAVdwhKLj8T8nA6BZHX3XlI9PLH64L2YnGYI5FmCR
	 JPI2mE9jsq//HtRG7onxjuxsp9w2OR7KJ20FQctw8SEMD7T1hGlBZdQKke61ttuD1Kh0h
	 6lbRC1stuPCxQcu6Y2+Kuq/e5pRhbic2S9trf2KhlVvkwLPNVq0zhZ984G29GEbg+Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
	b=DZlOIXUHNB53Xkw3PNdxYYGYV5z9ALtK0uKKlDGxMnlGlRj271INpKqkEtKgEulhrN81
	 fI7zPkDakc8zFpzrduDvrf9UfUY8hCxyUtIlhBMoh6vNqBG23KOaDNtXoPJfg11K3uboY
	 herWKbPXrG6f7ctKLSSrm1l8ePfrOK7PL4qAc/X7HVn5g7cV/56TulcUJLsmgnUBIjJK+
	 YX1ap5gNaRpeFj5Sb2ky5jPHx9AxMtOciab9pO1x628LX3+eCCiGXAJ4iYI2rhta+zD/M
	 qvtpigWOmDcDw52EaKWrkspw0A1ySeN5IoMf+dXb176o6I5YbOY5r7eApO45ulwgtsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=onxWI2js;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTbKs4Wr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3933606A32A
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3933606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=onxWI2js;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTbKs4Wr
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXNIt2036938
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=; b=onxWI2js/qa0c91h
	l/J8lCF49XdAetJqFVrI7XmVpaEGNRwzO2ejLUesHar/CwxBp1Kh+WJTJ3pk+IwM
	QNIOCNFEy4ZV0Q4oDM1xZSAaghIxGoYZky54XgIduzeTXWeLjfg0F5jvi2MMJc0i
	ASDpMpSHAY+/j3aAWgTqMzMsFrH/ka6/FOQqDiICHDf4DAmGUaSFTdTK7TdckGGD
	0wl36+4VHsgOXuelx5nzd653eNdAEvk+RlJfOySyIuO8VUexEEaFJ+lLkjcgRSYA
	2Zuq5HH+mWIJWoGxjfkj6S2hrW51B0opt76jFqxFDj4CkfFHeErjgMGzsqoQy7hZ
	FSZwkA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5dngh3xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d3747ef323so159606137.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 12:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550507; x=1796155307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
        b=eTbKs4Wrf4k16vV8tsUqx3N2+E9DTG8qsQG2oAC13SbJdcVQDu0QteXjXEBieKBAQG
         pGbFipEAVXkzdkNeSig7GkrFxvOc5HN6m+G8hXT4ogNPwi+iFSEDOn4q9wof7d5sxzea
         oSidk2pjDBfe1D6fb/bu1rqzi0yNI4BVpcsldwXMAYZIFvMqZ06nupU957ZrDm/XtdLD
         2TZW6NHgGVGoG/n8TxRXzA5Zk69fvNFnbmhWvSzBDzamgCNT+FtWO8L+k+CeRiTcpctX
         1Z2wyytXEjKK7wTIo+TOUnYIdcqBMks31cMiu/1DA1R9KNnnjzVWtNcq3uobdf2b7YVO
         P06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550507; x=1796155307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
        b=Peo1Z7cWBYHBoKpik0EvU2Dos6tg8f7stE9angPQBW/6G7hkjm/QyrxFgF6D51TDvn
         EhABCNeKuDOH46z4yvvTBQaO8a2yg6hqU1DTCYDxKKeatpqbL94Ndh0U4J+HA32siTtl
         MCOMKNVfhIs3oeEf3mpMJTSsorhYXIcXCdHaU3fYpBzKLM+Lnf5aqYpt2h1V7h33y+k4
         bUvW6Rdya10Yddp9ez8gE9RyFD9rAMupWVegaOBpZw4LPtqxDQwJuLVOEs/a7rHVZzEK
         +6xkTUJf1mDOE7jLfsZnkVXp7O/Jm9wFsxZDyClFBPX+kLMgoX8PwQVB4Lep6/y8AiSf
         tE5A==
X-Forwarded-Encrypted: i=1; AL+hErH6hGVpSSUJmu1pmOKKIoTEiE3Lx8uP3cqL9SRMKHDJ1Y4Utf95ouZqXMk5nE7Bjlqsd6BbGeiXJEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vm7dZw8zPz9wDQ3kQxTshTh7SPcPfLyu6j4T1IJqAXI6a1xlV
	ODsCys9wsmlyu+PQD/XdvG8wHLinROgFrYZsKcqpfBrpbm9cp4VPs43EemGcnchi302ca96ugxn
	uwVe30kwijqlrQNWVZoeKfrKOz9p+zflKOgLr9FqtEBclluX+Q/1DdRw+DNolqN4=
X-Gm-Gg: AZFdTZfPjp/oLH2lwRnGjktsgP752APiI+/hpo5xQJMPVjeWyFfjGpe770okGOmoWqu
	BeilfrcpC8ZHwQg8ccLLjQQrZmwjK7KfKebdmdDaeR6/VIlJWrKCP4M2Lj1AW313Vz0z/hcKFyi
	ZfwMbqi5DYsvCxNyYs7wNFWdElwNulMaxPtgiVXldAG+sLk94s+tJK85ip657pB1zKz9Akx3kNS
	Vcm0LnN+ll7IcWuJWLWNeMfxqukaE8dzpN87QurIedVUlxzM712U5Cgz6sDiywlN60N81O46pGN
	ADjUFJiqhrtGZQM1xCNErVTBRosO8dAhCYpqXHiZO60Qlotn3GTm4R18hGcCLcJpKHXpUqx3PGZ
	Eye7g72K7FbAHhpG8eIb5kD7a20dEF/yMLsZjEF7cE+8VSG7zsUgEMXhilO0OiwjHXY0DV7BrgV
	LKIPOdTfM=
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr9654708e0c.0.1795550507118;
        Tue, 24 Nov 2026 12:01:47 -0800 (PST)
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr9654601e0c.0.1795550506454;
        Tue, 24 Nov 2026 12:01:46 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:45 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:31 +0100
Subject: [PATCH RFC DNM 02/15] phy: qualcomm: qmp-combo: Add USB4
 power_on/off to de/assert USB4 clamps
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-2-a9b45c69cd38@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1739;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=srDcbvCKmzTW6ZFC7dL4jM5RmKmDLk6L/F70k459R2U=;
 b=DfUOTBjSbX0G43dLFvbwRwSUp1QIURcaf26xg7MQFnmkwZFDhPAYrQBYi9bxMtPyd5DhHL2vt
 v/BQpOYKbSMBQSXZAZARt6EWTVGTYwoL/LONH9icnOTkbQiOeETL874
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX1mn2laD3WmNt
 SplZzjgZNUkzcKEXaevtXs/HFwMXStB4e4DT6kWkS7Bkv0VuPEVocJlO1L4I9OjB65yCefPQywo
 Qv6mwbHWyDeNV3LfZgZD1d2IV5ZCQ2s=
X-Proofpoint-ORIG-GUID: k0-w44a_zignDYAZdZ5jgvXZQXn3Tq3l
X-Proofpoint-GUID: k0-w44a_zignDYAZdZ5jgvXZQXn3Tq3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX2p9lkJE2nK7J
 e1gfZcTi4kRIv3CNNVbATDApbF5oU5dFqvAHh/tLjwpHydHAuaDuW3RX8D8JXquId4opK1tIdVX
 TqiTg9HlqqVaZIo6QyWBFd3TPLGZr0kaiN6lWoY7jXTD7Y/xVAKZQ1Fxcp3GT+mJkiyDCOGfgl9
 tSGvpZgbpIqD39kA7A8SvSpBKufQAlF7f//ZrQ9KCvP3IlsWIy7NBZJ5/H2i+Gk+eiScRcAXac3
 B+XX6Jw+g8Ba0OOJuZNrJ5c/EoODfm7sATkEWtkTdoz+znbjWuaz26xp8Vs+EgtpBMMHq9C4o85
 lRiPKPuvskK69uOEmIDytgNl4iKALL0i7eVyifJg3rbbHOfQZnQeii5EVX7s2mZ0xnKXS644ZXY
 wJRGe4DYwE4LTazhz5OgZGoHf+IKZ3ZDhUQXy8Jv5C6AumeXiEYA+OItfjFNaHpNDQNEL3hCknq
 GZUt1Kz0c+FUIvPoLOg==
X-Authority-Analysis: v=2.4 cv=U9cHnuru c=1 sm=1 tr=0 ts=6b05ed2c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1SUI9jfhOX1tsDrs7xYA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

The USB4 part of the PHY comes with its own clamps, which need to be
asserted during suspend. Use phy_power_on/off to let the router driver
do that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 03fe66dae8b86837fddcc59956529ae374c1f6de..475b9a43baeeeaf18efb6e55d8151c170169c742 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -5085,6 +5085,28 @@ static int qmp_combo_usb4_exit(struct phy *phy)
 	return 0;
 }
 
+static int qmp_combo_usb4_power_on(struct phy *phy)
+{
+	struct qmp_combo *qmp = phy_get_drvdata(phy);
+
+	guard(mutex)(&qmp->phy_mutex);
+
+	qphy_setbits(qmp->pcs_aon, qmp->cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
+
+	return 0;
+}
+
+static int qmp_combo_usb4_power_off(struct phy *phy)
+{
+	struct qmp_combo *qmp = phy_get_drvdata(phy);
+
+	guard(mutex)(&qmp->phy_mutex);
+
+	qphy_clrbits(qmp->pcs_aon, qmp->cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
+
+	return 0;
+}
+
 static int qmp_combo_usb4_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
@@ -5110,6 +5132,8 @@ static const struct phy_ops qmp_combo_usb_phy_ops = {
 static const struct phy_ops qmp_combo_usb4_phy_ops = {
 	.init		= qmp_combo_usb4_init,
 	.exit		= qmp_combo_usb4_exit,
+	.power_on	= qmp_combo_usb4_power_on,
+	.power_off	= qmp_combo_usb4_power_off,
 	.set_mode	= qmp_combo_usb4_set_mode,
 	.owner		= THIS_MODULE,
 };

-- 
2.55.0

