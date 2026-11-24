Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550539;
	b=rvZisojpAJH+LAjwcYBIR8/kFDXOqXHRPNgnMyYJsoXZudab05KQvCDZZMaSiot4gbnP
	 cqjhj4llaR9yUQyJ+OMPkebVm8WCn/Zt6IYwoNSpDtL+P1hDD/ntwpu66UKVP+cuX3LCP
	 qNYM9kNT9cZpk/3FyhNU3JYAjCxV32c1IOeKZUcnkKCMsk/lqdbxyI4KOXW9BqFH04eSl
	 7PLgHTq1pqmG38Y2HUdBSwlX1GMP4ume3+cRHz2aFQ3ju8tPU8rnK5/f2S3zJ6dNCGTkE
	 yzKXbG68UWbgVEd/sqQhtMWeB/ujquP6058WYU19sKjjl67SCEh7NeXuXZMqsQhbrMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
	b=pHrVvVHzoZHPx6+zHuHw25FFReN2ZrDRTwZfPTcBJWfnhjBCh/AgVEuTGkbE0+Zb28W8
	 ifDR2qmulEzlpzB3+mUhKNXpA4m0GKox4nPhliwG4Dy33qQ0vbTc5+MWE2mWlN4Z35RT4
	 cERgJH7XYP0EYseNNRFAKTNqZcbbuYFNLmQOi7EgIowJrTd13uYnXhzxWFURbne/yyeeN
	 jDqeU/tCudlxnEFyD2RJzQnOD0A2k9JOdxtc/P43gwbswtoqRE0cAeGjrWqD6Bx1vrsAX
	 BJ5WYrArNPKlrx/tRWN/TujtV/wo9rm9yHxvilkn1dSl7sD3iKBqNCHYz5lGgwbzW/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3fp15zK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixQDEJ+U;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F0B60A260A
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F0B60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3fp15zK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixQDEJ+U
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXQYe1767162
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=; b=i3fp15zKSnYDtfXL
	12z6eUu4/VTtjGc2lcePyiRftP+y61UDo/+pdLMNaGNwYcd/TKw9SgQizYgxJoIe
	lfWeNQEXGsVa3FdDN5IqqSx/zHZGfv5Il90dCdpUlK+TOoQ9hy0AgY+k4gaaCPyK
	BIMYh0/ackSVhDz8F/Lka77G1RDzM6dcH5kiunCEtDnT9xa8aFYV1WDteRS1KT5V
	0alo11H6TY/2h0xEO6lMSCyRqQObC9BuuH3XsbFRmnUUn4crQ+NCPKcm2pw5NunH
	ZZYNNZLCFpflGr9lG/WUB405kmPWG+8THdm0Nwv6iRHe/iMPVwDeoyjr9QCW/xMR
	cEpLnA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egs8udq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9496156f74fso58360485a.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 12:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550537; x=1796155337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
        b=ixQDEJ+Uq+T+W8OUIEtBUMjm5aQ4+HEzuyThNyVxQIQonsgavURzKyN9NmortfJIQt
         0Dx78KJ1sUICPxrsl8QChOlIb/rYVDuQao7w71J6R5OrCLDznmzUbuxRmvfAGdAtRowO
         upciD05H3e1oCVrqt7EhITHV84xVUkbZvFEdbTljnk3a+hqO2+9nsDjssgmGSddw+tD2
         yujYzQ7WqscaUTMmKr6bfXCALs1NzCZPeCHwAsh3t4K1Gu4EmzuBvYzXm0afxw4C2KqK
         bMZolIahlZKqeBOF+uspsGn2eWp/nhYFhZpmtkNwtD95Jr+hfWXGRq0Jkp36gtTDHgsO
         3yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550537; x=1796155337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
        b=VwFKerZvvAGZHD200dTiP6r0c4Gh2A5aIRCRWXifQkw2dlmXbqqt+YzIcdgNItsARB
         6VZ1PNDiG/kZ699SLfwqIchscNNNM5nDP7YBTNkrJPrvm8LYGEWi1y+8+OgK0Y0k3vs8
         GiR/g6SHbu8thjMuTV32n6KP/79Qr2G7opKuHjXCJOz/NPGb9QQ9eVKBrzSM87pOg78c
         JKhAihDWe0rwJFDT7/36EB8MO7LKFXQfUyJHg0UVBMk1NUNWWqZU56OZS2KBe7Qrpu6B
         z3ZoKAJSX4Sp4B/qvluqEUFk5HNny6FXxLWsDQJSEM5BFJe5hhKPs0yvOQp3sDYC69tk
         0t5g==
X-Forwarded-Encrypted: i=1; AL+hErEGTdFqlLYq8m5Kpnta94ovPyLxbF768T8WZEy1K888T4SE5xQT8LJr1CiCaLtl2Hj9/sHswHH/yQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tCUMz1Rpp/xfVv4Gi/CcTKnL6mPemCnR1XjQ7ejgfiSrvpZlj
	pPdDUJyNtoOPY1ntBh/xxx6UbO/CVKiR9horcERVcu7UrmrQostl1SxS2dB/Xgutz9j49vHtwQ8
	ushTRsMj9B0hdcF5HOlpXwBVIzDLiJm5QcKnDWyTWpqEmX+LR3zv+U1t9OuRnuPhEj6P4Dd0=
X-Gm-Gg: AZFdTZeIHDyKGi+4tsbbz9drbaiOHsxdfKs3AHfR2W+aA9/pHBElRU2opBk3FkuXqJO
	9pqiZy5jryBzEVMYKimF5iRybkJbSfn58CwDaktWIndAycWWgfq6YHsisdSG/DbtQLC/K87vMvY
	E1j2dfI4KqChKw3klWCf/CjsrczrBjo+T6UEkpTc0Ygt6CT+ezxh7PeJsWM4KsIM+nMlHmkFTyk
	AxBajC+lE1oJ0srlc1KhrgQz44YuxX7xxh0Z+OYdfXO8oXt2kc4eiy9k/8uluiWsIdq6a8kHTOo
	jNixPyL8+SQyjdQTSN4ZMe+kG7uy7Kw9tv7cuUOX4KRDEcm9ZV6L+ex7GSJUIMv6QmfOAHrYkD5
	hBY6QmklSgOSv5qw8ctupk9MVTm/fc9r44f/s3q5EnU6slu6RERsfQtSv8EJfn/jJxjMJ2x75Di
	Nnv9fikvo=
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr2941329985a.2.1795550536697;
        Tue, 24 Nov 2026 12:02:16 -0800 (PST)
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr2941322085a.2.1795550536057;
        Tue, 24 Nov 2026 12:02:16 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:15 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:41 +0100
Subject: [PATCH HACK RFC DNM 12/15] thunderbolt: Refuse to activate
 DP/USB3/PCIe tunnels
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-12-a9b45c69cd38@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=818;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=xwW3bA6llgOPKSqs1BeEuZQOAAAkb355SkxSOtj9lcU=;
 b=z/91Ffst28wbqwkdjx3GfJSrokIzn34lkqLhPQ0QHj3mOadUBYwq9mfP486m5L1tFwqCcuKFg
 U9LW3XliwnnCDiVva3RM6Kb1InyIgYlgQjJ+9aP6K43DNws8/DYTDtY
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXz1n63bvBl5Gr
 m7eDAbn53ONehCFWIzLWjeZaw2wkFi2Jh/62/XhyAMTGQH3akSNblD4cI+O0JoE00gwVxlWATAA
 hrwSuDuj1IUK7lDx69IoUPVgwc96t97fwJXoChTJUDzs/nra7+3b0o+u7hvfH3O14DHy1OGiKfZ
 oG43HElu15HPSUekNyR5GncMWNjYGnJaLdz7mZiVZC+7n+tk1/ageKiO5E6mchKqZZHShjRMj6K
 IBSFm2p9JUGG53hvAEuMZM0aFq9loY6/rXFVi2o9LMLqRUQSjfoNOsAmFkHIy/xLWGxNm4eZ7W+
 dvZm17XFG4McrJb1ZASHmBY044zxEBspRD/0WfQghSOVwBRUZlf7mucdYNIbKgkRqbxtxFOXC9k
 +/D89lL6puKqsvP4CGVah1reoHbYeF1uZ6Pdmv3lMOkNfRRzk6rcGDZMSeWWGdzj6VILYOGZDUs
 QPzX0AML/xmA5cI/97w==
X-Proofpoint-GUID: uRgEXRIRoa7966Ml2OSE1yq-3F213f6p
X-Proofpoint-ORIG-GUID: uRgEXRIRoa7966Ml2OSE1yq-3F213f6p
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b05ed49 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Jr2PhzqEZPgRj7HVupcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX63djpyjIkioe
 AGE0JKJU2dsz4h4ceilntkjAoup+PYXz4bVbArCdUXABEGKOdf0MKx0u+QHezI6fL1RM3/6aTQ+
 tT5vTU4Ek6C5qs2Bjgkr64XYd9RHV7k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

This is for demonstration purposes for anyone wanting to try out the
series on real hw, keeping in mind the constraints detailed in the
cover letter.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/tunnel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 8145657835c5bb060812770a303cbf2649082a55..8b497da596b99d7f9d2e04636caa9896617af2e4 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -2430,6 +2430,8 @@ int tb_tunnel_activate(struct tb_tunnel *tunnel)
 	int res, i;
 
 	tb_tunnel_dbg(tunnel, "activating\n");
+	if (!tb_tunnel_is_dma(tunnel))
+		return -EOPNOTSUPP;
 
 	/*
 	 * Make sure all paths are properly disabled before enabling

-- 
2.55.0

