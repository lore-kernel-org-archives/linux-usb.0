Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719645;
	b=Ved7NL52HcfPdaEqocbgfNvB1Bozp2643BBiRA53HtN+N8wCwCHcQhw6t+Jy/oiShNmn
	 zhLAvwJiI3k8zdDgYMZ6G6m4ldlg0+HnvWJwA6y+kRIcQwAEXYaj2APKgssyyvHlFMMft
	 cASDpO791Pr5+WYnYWigyppocHAmQcsAE2FQTvcmiPVbycM2Swdxdv5yRMU5KMoxwyIAQ
	 3Ksu9kgO9GlY/JDObDv92BkV3zszjRbyGyJnE0LgfJfs1ZYRgol4sGdbkH4YgVpHsszcu
	 HNQ5lwpecIqgXZEvhg5KZs4XeXkKy/KoY6t9QId53isq5bD5rUV6tHdaGfykiV4J/Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ql1s6Wqvff45G+O9tfHzNyc2plPbkIqdZSJOZHvJEO8=;
	b=dy93b1tP5/YOf6dWXqe/pIgWy2lTtBxCwsebfHNCbtYRCXAOQr51k8+uSGPbUL2HNuPW
	 IqEjt2fN96WeXIn3ojeItBzghRd7vWTLG4KkL0CGaAewTrt0QI5M/U6UCnrSDVaW/WkJw
	 7iUJACBRypiBaJwGiOj+4HmaHiSHR9JQ/pjZg7TYHWT0yWv0iYbTHB/eGix67t5/vEg6K
	 4P8ejiEG4gdvFGv43nrGbsj5NfyVoXkfl/jpwahqFFFdMOxI5q8bw/Rdxshvq3OOpHvG3
	 snjy/Wcx1UFu1kMJ4dVZQJZGeerAtbZ3KsbaKE+DuEuAdgQ24QXSl5aFu3EuG4vdTsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KckpE27P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K+obZYRx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A12B606A33D
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A12B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KckpE27P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K+obZYRx
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuJUa3750175
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ql1s6Wqvff45G+O9tfHzNyc2plPbkIqdZSJOZHvJEO8=; b=KckpE27Pnc7JARjp
	MzLs6mLmrBzDyxPH+8dr0RK9QQrlA5YHJ4hihocS4UJbIu36aKKeYt8A6OTwSQdC
	3KyxHR7ds9lYXsZFHBi/OYlf2lrFtkRT9VXywuQHjxV0bFd6J1xvpF7hJhB3Pz4Z
	ucygLQrTkRlN03NBrKunYg+1PRvwVOAtxEtyY3bLhtThVcWOZoGWqVC3Je+0y3YJ
	RdtrwOkiqgwG2Zv96p8a3E6uyuLW/qqiDAudAcTXX2qT92Wwq6FnBuZ9+CdDjSPu
	CPtxnrembLe2oCmgkn2iz0YACPJqp7PhDlQYN3Y+2wL3seP70law+vgCg2UW7Ja4
	HkFS2w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662scbye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:00:39 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b56c696405so10474650c88.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 11:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719639; x=1796324439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ql1s6Wqvff45G+O9tfHzNyc2plPbkIqdZSJOZHvJEO8=;
        b=K+obZYRxwYumv6ZiG+MSWMmB08Z0yH+xcgtgjqpZ+XKG8/IZTGJ1qJZN/VXfVXAzwb
         NKJpQ9Q/L+40R4zWuoAcH7/pBLH4//qyXGJqLLWdtEY0zMu1BGATX1TJedKq3k7CR7yY
         6h0zcn6vKtadxxTh1tybGvYHVmesaat1kwXSMv79SeWY/gY0ipnh20LhKJDeT2K+rSjx
         zqrpbyWwoC2vUD5EGv4kaLiFNeGE4Zb7xUQfJhW5RHf5ZU8F1pR3F9K+p+1sawhWS1ea
         w2gWwWGPg4kDZUcAIbHLghoS2fGtcHZwnUAu36yzbbwMWjXjLSHnQPutBfmniQha1fRT
         skag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719639; x=1796324439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ql1s6Wqvff45G+O9tfHzNyc2plPbkIqdZSJOZHvJEO8=;
        b=n0HecF11nrLLIrWPLzphYy9qf43wRmCwo+8stXlAJuPbpR3wfjPUcdb/9tPBDNQpph
         se1aqVMNPaDhstB22b74f+9wFrFgBh/Hwm37XsDA9NVn2s2TSpbtr5GNZyARyJ05L+I3
         dP7+K516kjboKuChXf0obH5HVJN7SAMtWxNljyxZoxnonkXTYukBJbIFPZeuYAaXj5QP
         xXafGe1nYrgG5OADd7iLcM5FLmMK4JHTBKEgdQpDpaRxCi5P3QXGpgq26HLw0inz4iv9
         E7cvNabVSSNlRHnUtB4QQT6nZpJ0cmkKHPzRM3+Iqzl4MRPqll5CaCJqKssetou22Fl8
         sGEQ==
X-Forwarded-Encrypted: i=1; AL+hErGyJHGPWjBRfqcU69N//988VabVYR17lD776Bbx6Ty8Mq8FlWVtrVgvMpfqnSR1FJRfswKV6wygnsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8x9IzC7vHTZyk7baiNeXjzrIsXsVcla8jI2IElR2fYF1YLCECi
	fIVGAStmtVgmvIzYEOEcQJ+4gYToh15LJMXEbdjAMaa3TwpLf9b9VU2HrOVbpKbWzpauDVON00h
	zPAKvyFY0qsoto5K8gQCGTYgoEP3HFmQhCJmMQaz3SpBpowGxrwnR2643F08FDMA=
X-Gm-Gg: AZFdTZdpaUKkGpeCFoPXB+PiCHtWmcxQtX3ijdLT4O9m9iXwSxg4Zx0swTn9kkchk1i
	oktpatKNsZq/G+8V9qzbBYUnq2wRJ3IBtLCC++ZqYEBmvJ1VcnnxHB75lSmd5fOoa+5lm/6GsCU
	UqAlWtDjZ8t6J3LzNJpjv6nvWCf6dgljxAsjveTJ8xSqlCMrj9JP8RIhyyvmMHUGQncxEpmAP8o
	FIA4G0/XXTAugYmgx+mYapaT/44nZA64h7Ncs+lYQO4nKabp34IDD517TQRoyxGNsvcDwgF4BjD
	Yuy9rsBDqPEAsgyAvTVk9ZnUjRtN8MXeK2HuVrxflolvaQeBYQQNLwveNfzO7jFkFpS070hgCJy
	nyKH/LUJtSlwb6YcUD9/PRwsckjHoXg5cSq2+EPfDAvvZwi/Mv6yAYztAp757AXUPuUHDyXAWST
	Xm7lhn
X-Received: by 2002:a05:701b:4308:b0:15a:9834:73f2 with SMTP id a92af1059eb24-1b55692031cmr22317823c88.38.1795719638632;
        Thu, 26 Nov 2026 11:00:38 -0800 (PST)
X-Received: by 2002:a05:701b:4308:b0:15a:9834:73f2 with SMTP id a92af1059eb24-1b55692031cmr22317792c88.38.1795719638043;
        Thu, 26 Nov 2026 11:00:38 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.11.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:00:37 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:16 +0530
Subject: [PATCH 8/8] PCI: qcom: Keep GDSC enabled during non-D3cold suspend
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-8-485a08ffdc6f@oss.qualcomm.com>
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b0881d7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qWrkvF7FP1bAQ4F7tlgA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: QP-50dTPbsCqcSX5RNVYPTiPn2d69mkH
X-Proofpoint-ORIG-GUID: QP-50dTPbsCqcSX5RNVYPTiPn2d69mkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX2DfIfv4Wqcl0
 4KB0RroFsKlNQTVyWqLpInnW4gQNos238wJnepZ/emyWjFZf+Fzyb8D0H0ZQDDE/RlB8f0AX4x4
 NEwStOWHhNNOEZSwyrDQ0IbHx4ivPyFF/pVwEr9AIDZH9/ZLYldZIpXsTCDalotSn+M99GeR+dv
 4r9bizC5KAd6yymZJG6ATbSHy4cig5yIW+3oEHfuT35ndszKrsiV7jlsiP+JdZWsoMNWXMhqZVA
 oS5NoZmSRq5bRAjfJ0W1hp+CG72jPgXpU+Kj9/maSQVfDyRijyQH3ayJISZCBzTir4CzKBhKMPy
 6obDtxoWBDTJG9fsD+0GXEgfGyllPkENA5fItOV88nr2TB03zpxYpsHNGVZF/dHab8DBhwTbK/s
 miQnq773n0+RtaUWkPLhlgkpmKIBtuV5W1wg0GfaFdKAzHLOfpHy1ThD3T+YVBJ+wqcyXI0ZCll
 J7z4hgsJfI2oR1pbG0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX+yB6uXUQlkDv
 BIPGHgHj2PZhnAQl1hS+VW9GjVDbFTQgy5TyR0Nhds+8j6BPjZq/sfHV9ShMwO2fJxgF4sxQOef
 Jw0shpXITd/CR3h4JaJfKbqrwhXHBfk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The PCIe controller powers down the link during D3cold suspend but the
GDSC is required to be kept ON for non-D3 cold usecases.

Set the GDSC hwmode to true for non-D3cold suspend paths to keep the
GDSC ON during suspend since the link remains operational and the
controller resources are still required and set it to false for the D3cold
link shutdown sequence to disable the GDSC.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index eba1b2cb30f0a22b22a40aaf2ec75cafc12b054b..a4cbd7dc896e5472dd2cfda3846c6ff38cf34ef3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -26,6 +26,7 @@
 #include <linux/pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/pci-pwrctrl.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
@@ -2495,7 +2496,12 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 
 		if (pcie->use_pm_opp)
 			dev_pm_opp_set_opp(pcie->pci->dev, NULL);
+
+		dev_pm_genpd_set_hwmode(dev, false);
 	} else {
+		/* Keep the GDSC ON in non-D3 cold usecase. */
+		dev_pm_genpd_set_hwmode(dev, true);
+
 		/*
 		 * Set minimum bandwidth required to keep data path
 		 * functional during suspend.

-- 
2.56.0

