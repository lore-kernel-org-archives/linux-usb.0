Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550533;
	b=H88iGRbvKgW8D6OxFbMRX/kGBfwrw46mrR/wboNVskX4l41YyGi+SoDZvc0McSaGpPuc
	 kgA+gP8jxiq4fbRrpDwc9VBm6IjVWMB+RshI/J8w9psf7DX4L26w5S3vaGdcXXZwtTpZD
	 VPXHsSVkIXGbLv/OvDQxKzKBxZWoCkmDUuiBAMccA8sewqY0VkwQF2Ee8/DcX/ikfydha
	 w+AXPYJJmvhxUHqfrqFdZyCV47WMu9tGE/qgVbhlWvEpKdePxnkZfyGmwpoe6sUqWYHQQ
	 lKXV7U2sAfadOkj3gRXEKCBmkVbLDxlm8kxN7eCZk5rGVFPQGoCIX/6JyFKe1zROA+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jDFGofZS9wIbG6zZ/KoqobVo6RlFteO9ubwUWazjPnM=;
	b=b3LU3qpYf5vIrLkXvcjxHxSE5TKFDAaqkCpjSr7JLOROHJeVfexjbqHU0dKt+uDdiT8Z
	 532QtNhQxX1qjgCtszDGFfIP1o28qURyjvy68qHkYquNcmkhCQ0NN7AwlssPnHPJ2RQ3O
	 qsEbOXr2PecccL/BbMxqoAKZP6B/IMpX3I9SiXhNaG8ICfbZCyi82AwFzXV5rc6bLW/i7
	 2wYZ6rXQaKm3Jdx9IFa0Yw+f+MSZM8DYtNXuvmeIDVC6CwGHi8xAGxHeQBu7tRL8VlJtP
	 /Dl4rnb9e3AeL/giXGQgFeDS3FRFywsg22tTgrOopn4g9bvX7lvte16NqUDkST1hvgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TGvf9KwK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLVdftPQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2612606A6B6
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2612606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TGvf9KwK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLVdftPQ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIY9CW1651351
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jDFGofZS9wIbG6zZ/KoqobVo6RlFteO9ubwUWazjPnM=; b=TGvf9KwKvWtorsv7
	IlkKQHvhJ98YDIcRXg+OLTdiq0/gIozGKCv3qjHuNnCfF1KQPdQI0p4WDdDCbuTo
	EEBiY1xW99qNtNT3aRywF+X8/RB+pZacJPSK2khsA/BX6GY5wNZ+yV3tbQ9huJaO
	MuPwJCublkI/HInKTMAxX+y0oHfR9egSgOKWafrjzOVisMzqAf+Wsi+ZwCRiRWCX
	oH01GTUTd6AmgLaPJJT1IWb+EzG/SXZAmY1PGhjuLi5A8zIFX9/RdYyLg8rai3As
	zrl70kWcugI+5WDWyDTahbZIcpASndWkVhN1lYJ9Pf+cB693g4hq1fLPOcaskxVa
	OdRjzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpks6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495e11a684so31650185a.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 12:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550531; x=1796155331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDFGofZS9wIbG6zZ/KoqobVo6RlFteO9ubwUWazjPnM=;
        b=KLVdftPQp7M44I+EmAHNWMfsiHduu3P8YvJCAjvRfdOuuQNujTPihV3paMim1a/PKW
         A2wsqWS/uRIMRrVIh2g43Rrt944/yAlUc9ZPodj9/n+IduljF8voQQlByTj1/hsp00TX
         DsC7xbeKbJiiPoZ/W4gi/6D3R9paJ8djD7fynAC5zurBKwcAtmwg8QdI9VehNlix0lZ3
         X9n04HUoyQTjhYsrvHtLQdsinHVqCrH8kASnIxAEu3ZO5QJo6EzQyk8cH3pP4eAOE9kY
         EUH5SUHoQ2PogKeACo3j5eBcsEuBm7n3OlqD8vW2aFgTAyEzAEFV7se1/sQb6Zy0Vdqp
         VEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550531; x=1796155331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDFGofZS9wIbG6zZ/KoqobVo6RlFteO9ubwUWazjPnM=;
        b=V6X0M5+symNt+VgxjGMb9J8ikndtWLqGPJm0mqi9wfSscNnebN+fPAwtsXzX6Kdeuk
         kShotP/xjd0/0b4thiKDNtBJusGgW82xhudkplJMnmzU99fh9Ebe2QJjNb1RnHHl8I3+
         4OIPlmidhgRj3qNwZ/XS3abMIkjBapceIcZeUhzgbdddZEnNf9eTIKU5XwxGOtEPe/xP
         4ELBNbFN40DPJ0+tGMVl7aBGy25pXlsaTEQopOq3sxTP4nDx/I9qbcJl+rnHZg36eI+w
         wXtn/8v73XJprNDNG64wsDTx90ZJpmVpyRQv1c43i6McrmA3nKQVihJRT/gWBXfrW/5l
         mBCw==
X-Forwarded-Encrypted: i=1; AL+hErG8/yRhac8eJj1anZ5wf28m2Us7nNrj/Yls7wm4Qt5ij+uWCCYXT0U8sC/3/hOLTrrnaOqziVeu9c4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NZ8HnLcdrIDDJ53Hik9V4+Dnepcb2f9tmoVZ7BMO4MJugzhfz
	0fKwNnkWCvpJ3YxygFE4Xu2SKfMIMfGs8jSxzkrj6+AyjP6s4uME/C82UKWB4mbz2q7JbO0kV2h
	+snDjLU9SlJLkCSAo46EkMLb3BUlfv+C3/02tFGPN6DjO7+WGDyCnsqBqp0yqQds=
X-Gm-Gg: AZFdTZe3nOqG6vutz6iBhSH73oTZIun6LhcwW426oSoJJHJLTCbKYEAuVB2omk7ln3s
	d/qpD5S6FCgj3516fgekMfB+KLxqGx0jjqR4cYei+mdyeEA9AQKUDPz+uTrDsXqBe25Ph5uQI6J
	BM8cHr6FnOFZ5+4yNSBz/hLEOWXojv/3zugRpwTmlqFC7YKqmltcaN8Z8rVH0pesfdJxsGI80L1
	3D3FKLQEHLULQvKMSHjG8gX06zAtWT7T0NiczNHG5fmC9Uo+ER8Bm5fKi1QBUE7QZmSo1JPR32O
	83QXXi4+77wksI1+zjcXNjT14uA+4vnUaZDArX5kWfFeHX/dKfc+ZoqRgyf2nFteHs/RKqpuxah
	zkvu4ADBsV188qeVNq6pGj9kflgEzB5+N4Q3stX+r7F6+1CPdLvnwxHdPxFBdf8egR+QDNecxg3
	Eiuj5RyTs=
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr2807628985a.3.1795550531126;
        Tue, 24 Nov 2026 12:02:11 -0800 (PST)
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr2807622685a.3.1795550530332;
        Tue, 24 Nov 2026 12:02:10 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:09 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:39 +0100
Subject: [PATCH RFC DNM 10/15] thunderbolt: nhi: Resume a runtime suspended
 NHI for system suspend
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-10-a9b45c69cd38@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1364;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=VT0A3Ff5mjwo5JFp7mj0fXPs8lsBYJ24xhfJ+8TyvbE=;
 b=BI/O1PsXCKL75DybTynegzhap9M3cUZ42FTlJ5Ou9qvJpR0kF5q8oxlq+CxsGnKfDU1bNa0J+
 DWYwwr0nFv9D9l+3YxFMBX2j0dcjtFaVMoXllO2R+3oUn4HJ+WZFIi4
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX2xL3IZxwKg7j
 /39rx1yKdRSplOU+DohkLO3o3OJgs6TQEA2+IWbC6WPrZ/t2HbL2bdw5Lxch1YbC7evZyNJMfW+
 5PVw+C2cWj7chStjmYjia7PWt4gJjWvG0GXSOvZXJsfBBc5g0/xd1cvit4yqWAdMtDuoplJkWBI
 WLgmeHRTnGWqmEbgJtuJHwvQbPNswBc+J89cw1Xi4Gam0SgaCzUSNNXLyW2BXOdM3OdUAQJ4e2+
 boy8ParFwimrKhuOXDgDTKztgE54YIyY+immmI1Z2bB0ZmgJivCU5QMgnbM5k7tElMFVi3qXHHV
 TchDPxDzNdnA0439CcgxYent9k0pvnRQycIQI0C8mij8Dy+3EeFIXGQId+UqzYgoX9h7uUUpEyf
 ilbQ8lH/KU+ovgyd8MHkDHPo7PH/HULNEDfbYc7EkZMVe2tGyJm9hibV9Jt+TVBVLxVgiOKJEqC
 4l9o7m/+PXn3iJD0MNg==
X-Proofpoint-GUID: aoncoLi1Fc8nbFOubmw77qbWUhwBMipe
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05ed44 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KHM4NlRHU2ppStx7mUgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXy6MzPb7Zb0O3
 a2rQdG0ZPcgZJJNtx+e+N7+/+TkuUkqNrhcYHx6cHE/2Zn1lZ84O1M7qwmyYBZ7R2WVUr73eBLb
 q/wbIFW8QrqxRVclXbt5KV++18R+KXo=
X-Proofpoint-ORIG-GUID: aoncoLi1Fc8nbFOubmw77qbWUhwBMipe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

The PCI core resumes a runtime suspended device in pci_pm_suspend()
before calling the driver's suspend callback, so nhi_suspend_noirq()
always finds the NHI active. Platform devices get no such treatment, so
these runtime suspended NHIs gets suspended a second time in the
noirq phase and resumed in nhi_resume_noirq(). nhi_complete() then still
sees it as runtime suspended and resumes it once more, which corrupts
the control channel (RX checksum mismatches, config space timeouts).

Resume the NHI at the beginning of nhi_suspend(), like the PCI core
does as a workaround.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index e2578740d569a7ee1d5ab22e8effc153cb7d4632..56bc5748b6515b9d4799aa87ce0f72e1d673d634 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1258,6 +1258,13 @@ static int nhi_suspend(struct device *dev)
 {
 	struct tb *tb = dev_get_drvdata(dev);
 
+	/*
+	 * The noirq callbacks expect the NHI to be active. The PCI core
+	 * resumes a runtime suspended device before calling this, do the
+	 * same for the NHIs that are not PCI devices.
+	 */
+	pm_runtime_resume(dev);
+
 	return tb_domain_suspend(tb);
 }
 

-- 
2.55.0

