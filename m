Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719590;
	b=yNYomx1nIeSxl1IWH+Pj4fpTa22LRyAv24OiuD3hJzVbizFA25FzhFIaBpbGN1KxRno0
	 jTTowv2BWNMXVKZSRRU7j1tNOsso/MjwNnv3h93wvkEQQc6KhuSdbOEP3nmPUlGfoeVQt
	 P/X7A15geRTVMX3SpCg9kpcR6MGqV3gUvPR8b6EA9rrRPB6AsNy55KOpsVDCKswkqQDwJ
	 dsvfeDfjBc7NfdSLWtH+aDo3i57qAtWWpFXo0GMWFmqPM9dSpGwsfxp9cnspLKp4BiEXZ
	 3/L9zTEd6M32PhpWRKaLdBBy1QyEFxtM5SZkCCzRgTRyBCpXkc8EH48LLDbw87+u/QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719590;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AhIc54J/K4e2MmEA6laRAf4VD5KH58JtaSUM84rvsJE=;
	b=LZgtTAzlJd9iV3g56bZpQlqYsF9Cshk/dsHN8NrSPbkLPaDRC5EdsXbh7dU3MlkHVeEZ
	 L5Fp9Hv0Eoga9Xh9ja+YvgwE1YLrj3goRAG8b5t0IukNIq8RI2XTEGHcDT/EpfWY661ES
	 KmkfU8ASw2/0w5F0s8nm2wlO8XwvIZcYwveeKa39y0pt5y3QGsBIwTpgMM+ebEF+scWug
	 T2lE25oNMaR+mQJWVyzAhgRAzp6n88hlpJvfnJ1R57XTdSgSdWH4z4s9K7Ah5okup9z5T
	 DeZtbJM8ogGTTpLa8Z+vuTbE/SQtgnKW1xv9KIn41XiyTsgK0F5Xh+SAjtAMVHi9hTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MK+PgnPw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+F22DCc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C1B606A329
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 18:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C1B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MK+PgnPw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+F22DCc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuOAK3357965
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 18:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhIc54J/K4e2MmEA6laRAf4VD5KH58JtaSUM84rvsJE=; b=MK+PgnPwU6+GUzoN
	AcnNkwEYSUDutNe+H0SmSllz4ZaJzG76xQSMz3DJsiuF5Jfn5ZV1xFW960GJHveo
	7YuUMcG77MbXc586q1hIhg0i0DMsie+u6dkAGWXMlhScwL9e8dsRGXyWlxUWuq9X
	pXn28xEzU1yOKA5VeCPVeAzls9p52Bf5ZO1vS2Venca/A8qLpmYdvsn5aG5W3VCZ
	FWve6x+qpHMQ0Zn1QNt0+p7GahqCyRTn5vawV9RQAuhkpQf4fbPko5k1PGiAm05U
	ao+IsY1fdtlnsB1urjM0aGrodwgNPrODwj91vto0rFXUSgNnCR+G7kP0VoPFy4wt
	jwNQ6A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfc66t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 18:59:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso9021017eec.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 10:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719587; x=1796324387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhIc54J/K4e2MmEA6laRAf4VD5KH58JtaSUM84rvsJE=;
        b=A+F22DCcF3PbLhvOQl/jCrD5J0quqQofaH6H20jW6qGF9+L4tArM1IgQwwT15qGDry
         JqQZkzMH8B2RiTp1cDzNuXW0zPrRChTvZOEWsojFqjdiWvbpnI6WodI9hBA78+gN0aNj
         Tm47UhuXnAX6hi+G12gXKSm157SJ93rXYmS38zBbI641ixxWRkrv2caAmrUqrLYLlLVi
         6nBscLxQHADWoQi4lLtkC4etbvLVVWnteDUQXzZrv3juDrnkqi6dFatpca6XjGEWa7fb
         OJBpTsuMjTU8Yj79/+4bCSba1x7zpt/dke9DlGyfu9RJGCpZSwzYnnaB7xoPRovA88Ft
         tMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719587; x=1796324387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhIc54J/K4e2MmEA6laRAf4VD5KH58JtaSUM84rvsJE=;
        b=0ZR4LZO1P7GQiti/2+ByECs+HHUWOaj7lp3t6b65LM4zyxz7yOHK0ZdqHbOT7FT7hr
         8YP8Lo3bkdIqIN4YMKinCjB6PpT1L7SS+FLA0ub6CF+rkEx9yqJs0Zix9qua/aAMijji
         P25SvvyePz7muMBI0EdeEtMxxB3Z0STBdrK1L1Qvj8xGPDe2sNYVjVtUl4MWNdDrR0hw
         5CeNbF2vfzeJvppgd724svTmL/H001lbieFu89/DWb8S0dFPqufhFiPpGzbgen7N2HPU
         IHrsvHieMO1QVDAmeepg72j1USLjjnaTBG23zX/Wj/ZMxQgQrTEYPPKmFsoUXxQ/bVLh
         5chg==
X-Forwarded-Encrypted: i=1; AL+hErH/93VaMObUHMLFgj/pmitE8tCgQ6v/airDJOxlk2QhwVt3QgG6qKt8KgEnG7C968yhN9hX/iJyomI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AmhxqeY0F1aMOwYarryrZoaGlrExlBGfGbMJvIkD6Oz8YR/4F
	oEKxYU0PtZaFIIE8vkfCkGA5DFP014RDZZPw91geRUHiyp/L4QtTh0ZNl0W45oxLEnrg9wv5+RX
	QYHjK6FIPNe/uYzDnd0EGX3lqoJdr+KtodEAPYvX04nUXX2vORSZyqBhpDNgqHEE=
X-Gm-Gg: AZFdTZerP0eSZcrAA74JCPUjtASib8a0qYp+91MHPIPaUIga1URbfHK+S4D83w0XbUG
	B4BeZLvYUX7ksSqVEA+UHPMweZ9cCNOan/DQ7KY9ZzbF6BnvLMBQe2GNWDvslZcAo8n2YMkbfXy
	N69hHfkPZatBOyaOWNPA52vLvbSWAKBT5aHrobP1ljtFgsTK59/fEG6263KYFB6Q1EaGDZ7f99V
	jd7B2ehJfLC2i1/dldPatCSd+WqQ43356aOh1dnhvqTV9ysmzX28Aup2nqQtUMQJmyKvkcuzRgU
	N7x6/ueLrLcWfwZ8XfQcH/ZTrklSxCvPKoDItl7oXKjOwpw8gZ3UvFulBGZ7RoISGpCy0M8oIIA
	B5BXfzJgfjcOR/TXbuyxEtHgQzM3VSJngYb23WZKGefbrNBec3DlW2B7rnsOzZwrpp4yv0CdTfn
	AFUCxp
X-Received: by 2002:a05:7022:3a83:b0:184:992:c9ec with SMTP id a92af1059eb24-1b55693aaabmr29817021c88.38.1795719587129;
        Thu, 26 Nov 2026 10:59:47 -0800 (PST)
X-Received: by 2002:a05:7022:3a83:b0:184:992:c9ec with SMTP id a92af1059eb24-1b55693aaabmr29816968c88.38.1795719586636;
        Thu, 26 Nov 2026 10:59:46 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:59:46 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:09 +0530
Subject: [PATCH 1/8] clk: qcom: gdsc: Use GenPD hwmode to keep GDSC enabled
 across suspend
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-1-485a08ffdc6f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: GGnsgMatY8Krd98smb-YytNjm405KA-P
X-Proofpoint-GUID: GGnsgMatY8Krd98smb-YytNjm405KA-P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfXzeHXm3zB0/UB
 t7+IBhiKMGjjDlD/RWxehM80HS4XEsNwckGXDfZrjsmGYtXNs279Xv1WKancVVIgdO/361/ddGX
 bJEpPGow12LlHiFADaTFTkPpyeQXHuQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX/gaMg/bBQkKN
 FJ0eUVOioOl41SXYLvS0zawT0ihIYlZTZ+Hw5VNOlZoZ+ar5dzaHbPIdYzCw75GXzvd5bka+PjN
 jFpLnVPlCE0ZPtvb9QGbbR8v0ZBJnXI43OwJ7zU+cSNUnONu3BItBt8/pHHtidKFxCejiHido7e
 slL6C4pQO1Ovj8LyxNOqssimBAZjb4dvgxuZOCfq2n1G4yoE1/aaefy6SUgVkKBlwzrruPj/ukt
 KsvYmLk4Uoa/RVNOcJmqnE1j+tnrYW27PSFSRYDEGLZXT1Eqv/vLtHxHpEi0yEuboCoxVfOwTwc
 odBwYJ44EDUnFe2Tg3wIPlQjdP1oPRjPZeZNcuKNwiOF4ITyQArBxnx933vO5z6DwSQO3HcoLx8
 eYY/LBp5AzXfscromgK03TRAG2Z0NDZsE1zkaFJ/pYdwp6zY/Kdq2gRyGC6qD67zpF08KeXhm93
 vAiah1p+HXWYb3cjzDw==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b0881a4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=NuUCN_VPl_z90dSYpTgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

USB and PCIe GDSCs need to remain enabled across system suspend for
certain use cases, such as USB host mode and PCIe non-D3cold. These
GDSCs currently use PWRSTS_RET_ON, which keeps them enabled after
their first enable even when consumers no longer require them.

These GDSCs have a HW mechanism to stay enabled during suspend while
allowing the parent voltage rails to turn off, with HW handling the
parent transition to active voltage rails. Use the existing GenPD
hwmode interface to let consumers dynamically request this behavior
only when required, and clear it once no longer needed, allowing the
GDSC to be powered off when unused.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gdsc.c | 21 +++++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index be9c14eb7b064f988bb4b330c8784cab82e43b2d..7b2b9ad0485e6035af6c72d035ceb2bb8f4155e5 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -345,6 +345,13 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;
 
+	/*
+	 * Skip GDSC disable if consumer drivers requested
+	 * to keep the GDSC ON in HW even after suspend.
+	 */
+	if (sc->hw_stay_on)
+		return 0;
+
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_assert_reset(sc);
 
@@ -746,3 +753,17 @@ int gdsc_gx_disable(struct generic_pm_domain *domain)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gdsc_gx_disable);
+
+/*
+ * set_hwmode_dev callback for GDSCs that let a consumer request that the
+ * GDSC stay powered in HW across suspend, instead of being torn down.
+ */
+int gdsc_set_hw_stay_on(struct generic_pm_domain *domain, struct device *dev, bool enable)
+{
+	struct gdsc *sc = domain_to_gdsc(domain);
+
+	sc->hw_stay_on = enable;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gdsc_set_hw_stay_on);
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 2f9665b664e606234fcc632c3f6b302a448d06a7..12bf74a1b2a431cefdab955de15ae6b01db7a10a 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -79,6 +79,7 @@ struct gdsc {
 	bool				needs_icc;
 	unsigned int			icc_path_index;
 	struct icc_path			*icc_path;
+	bool				hw_stay_on;
 };
 
 struct gdsc_desc {
@@ -94,6 +95,7 @@ int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
 void gdsc_unregister(struct gdsc_desc *desc);
 int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
 int gdsc_gx_disable(struct generic_pm_domain *domain);
+int gdsc_set_hw_stay_on(struct generic_pm_domain *domain, struct device *dev, bool enable);
 #else
 static inline int gdsc_register(struct gdsc_desc *desc,
 				struct reset_controller_dev *rcdev,

-- 
2.56.0

