Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719611;
	b=sH8TVJWPhrLHVS0sLIYUXqqLsY+a6GXGA6DL8+XepdhwQZkKbaKrW6td80vFLPC8ruMQ
	 kLuHk9sENU+7TE+adQlJ6SrcVW1Ug++FT7xGEBH84xUmkP/Lw5g/OyaWv0WDu5FiPTHtC
	 1NU/320ihqfGuKEaU/EMSQ7zjuY3IlMi6Tchccn+YTijbAdVoaDd5+ZMAlgh0cOipXR7L
	 7WGq4VprXdgWkEzow2KKm2gbEh92JdyVgw88AGxUAxgLIG6/cIBR2Fk8W9bp3v4JDusDp
	 LgBSCoL35vHWKPS6B2k4y0fT4Ol7GR0M9Br0QpU0iYSWoFs9ImqDsWf9/FWNfsr4YZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pDb1bViDSMIyx76M0CQL8Q8fh+r/vAHy8VyY0ktLyHE=;
	b=JWwhjB/y/ltwB+gC7r5AMhCW8GTnq2umjWmoU+0aolQw6NEeQD8xDrh4smwAt8PWeGUm
	 A36wrq5QMV3JoAIFFg+6Z6Bs/DvruCMG07Rgq09L/6o2y9BMLtEvfa4yltSc6GDyJ8bLy
	 o6l4feG6qI9+InHNSoJsryi20oNuZgb3ElGXQ9YzxSjmHTu1JbreoXtv/wRoKKNVQKh7J
	 g2gl/UVLQBpwq5k+IXoOQCQ9BKRMoRzNJzJIprbGa0LyiD87xs8ci20FqjFtQfkzS4pM5
	 UyYJjVCl4SP4B8eslY+rNCMwNtGQf7Th+LL3EjKCoKQCUGbx7wC6i8XZb7t+vWoY43A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T5xT4EpZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TavMYgxr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBCD606A6A1
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEBCD606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T5xT4EpZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TavMYgxr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu25Y1847749
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pDb1bViDSMIyx76M0CQL8Q8fh+r/vAHy8VyY0ktLyHE=; b=T5xT4EpZWtvAT+SZ
	blTm/3lR53uV5o3B97RR96hZ71sYYPLk25oxDULtBk38KbnqSzZ1bKHTqA3bkSXV
	Rj2bMCPVuSoMu9/KIqp34RQz6BIoN4jc8NDiSABcMfB3FyFaPI+Ts+Qv5R1y4tdc
	BI4NE2Q+IBsA1mchp9rcavH7fa5G1semK7BH2JjOiwlPmj4Zra45XYAHVTrZvccQ
	n+0fbe6+82PIsFJUfiGh3YY1+kOAhsk+jQmuUk/jHJtpU6wTLQ2FLtjTS+Ey+M7r
	mm5TzxqVysAntcmm54DI3RGrLFkf9QTpLST7xeVbB4o+j9CAF2XXBwO4ZEcuSbGH
	V90XoA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7tgp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:00:09 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b592e9841bso1629407c88.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 11:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719609; x=1796324409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDb1bViDSMIyx76M0CQL8Q8fh+r/vAHy8VyY0ktLyHE=;
        b=TavMYgxr0MylSuoQpSpfhZbVzcpnQraaz5xt5LSFtALfyBBPTgKIo2D5cmSHyKHFri
         Rkw+u3vaC0so21PBGM1D2qrXDYOzZDnxQMpYPgnuiA1vo4lAk6P3ISykmB2NsigrNS4/
         8rhMN4GUl1G/fjWQt3HIYYIYFLfTIPZuXIxHbmJ9veVOdhOK9d6OCoZAm1vd3AtOOmLZ
         9UoroSvOF7O1VlSp0CN8uYypB3FSi9BdT7K0LZywF9/zk2GCJc+n2NnrhFBNe6uZPJFi
         8JWnQrbL3kc6kIomJ6Khl0D8si3QtkTS4nUqAAPjFxfBZZfqGMOT7snWvKKYnH/zUyFI
         d2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719609; x=1796324409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDb1bViDSMIyx76M0CQL8Q8fh+r/vAHy8VyY0ktLyHE=;
        b=EavzWxjwenyHkyUGSkf+An7D5rfA+KtQpWkuGAASs26uqmorHSRzg9Pt+tBqbd01kT
         knds+sUbZ034q6W5Ou/g9D+3yzjxInlii1GwDE4TtclCZcY3eAigVU7Y3jWOIYjvnPun
         dCthxLH7cyIAnkTjUTrEN6d4mQwJG/6g8k4lQDB+4et+E7ATp8tChTvUF1iIxSqfGN0P
         ayhDFjJsDz+fgakBy3798IpiobOLC1kTP8a0GfPPI/iO1/vK66BMmOlB0g2IckJgbiHE
         fjkZo6nv+0W1yMS+VsS1pe4y9UiQkfzjVstHQrPj4Z9nrQniJZ7Q2rBLpifUXfSEhkIa
         ENkA==
X-Forwarded-Encrypted: i=1; AL+hErEEHhIQvaZJokFLuJbpVVcXnapcL8ot1BqTGxmpewrOVXD0uMDI1hhbp75rkpz7aGgUylXP4u1CWlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wscDT3fcgEYufx+o05DoaAgP2tGA12eRu508qVeMiq0oe5AQ3
	7sXaM4DT4b2tLgD3whfvMQOtnWh5pp9NlvBcUE8Ad/9m1Dgdbrw/tbuSqBXe1tdafm5YJWAICNg
	ju2xuOqd3F9bulcg29Gp8221I65/yAMYo0WWj/KCVoRfoMvwrxs5Xhffp0vKxMUs=
X-Gm-Gg: AZFdTZeA5WBcHb0nDBK+E3IQEMLw37Yn9VTczwMT/1JAwEzuCk7zmXtnSRaDeiAZI+e
	eyKJ80/aRM0oCNQMIaCrWZ4I/z6BBEzBb/YeohvnnR/3dTfhr0iY14O/T9yn/P2QtQqKpywTP2i
	MvsMa5gnMA6Wl+1M4XS53dNHLBafXT223mdBiDRmBXxiHtkuRm37JKdK4MJ2hbMBbY5oP5/G9yd
	P8qhJK2Lw4R/X/t9Bd9A2a6l14molhkdtR/WNN85zXYC9D1E2WWiTdkWtvWsrtAa/0pzjE3wCg1
	yBMBEz4KSbmsUxK+TNHRCAI8HpEfBWzzlPxa0NnEkcmuM92VQG5ZxJIs6WUBYIigNnb6hzYOtxp
	9lFOXm50gP8bIj3ewfO7KgKNgHH2v8meQe29TzlgDQk37S+5K3oQSIqCT9riSKU5TB5i/59xFWJ
	H1x32E
X-Received: by 2002:a05:7022:4181:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b5568ba440mr34051530c88.17.1795719608712;
        Thu, 26 Nov 2026 11:00:08 -0800 (PST)
X-Received: by 2002:a05:7022:4181:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b5568ba440mr34051461c88.17.1795719608015;
        Thu, 26 Nov 2026 11:00:08 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.11.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:00:07 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:12 +0530
Subject: [PATCH 4/8] clk: qcom: gcc-shikra: Register set_hwmode_dev
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-4-485a08ffdc6f@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfXxNp0n5xOy+Pz
 GJ5t0CzdRjLCiJmFj96ZP9Fp3anTU6Lo+Y+jAIyD+ik3eZ0eiRbUCYxQ7J8DGIYQda9zPCHs0Wp
 y61Jjqabd4wqSpPS4Hhw/TkQznGHroY=
X-Proofpoint-GUID: -2Z2axm3MKd96TwEy1Ld5usYUzogoIer
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfXxmWgWvVbCXUs
 F7Lw47g70kxEVkAYmZhyDmrtykL5Q6+7N0BMKol1u8uPIPT6MjRi2jYgDc8LzrN6CRGENSdthRk
 S6KNS7PFs4iVoWUpUk31KaTnOLRHpol9GYVukheSfoutzrF/wkGXSQX+ZD0rgx5cB7Oh6+MytgV
 zl+C0qY4NRzey+8Wsibl2lnrnahnKsMvcPPOGNo7giLuR+/zb7Lwf3ZxDYFvdldqKusYVowIqeI
 Ua7NHj738HJkSpusiPGbVmt9g1aPd8N7bW0XmOvWfjvg1YyCnJftwCpLXtEE+p4zLGzqV+lnDgJ
 tPP6tMYV7t7sd1ABpgx0Jy1S4RaDKVsugJ/zuGSPF2768hm45IHyKq9slwe+WFbZ67wPzdGtK7J
 OPOG+m2TukQQtJkUO4R3CjLVmsyKzZgC0LAl9y9get26Sms3+vim37x0ya14+6X016qyB84+0Hq
 EIfBj0dGGZkKupHc3Fg==
X-Proofpoint-ORIG-GUID: -2Z2axm3MKd96TwEy1Ld5usYUzogoIer
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b0881b9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zroWNzDgHOBiqxzc7EQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
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
the requirement in USB host mode and PCIe non-D3 cold usecases.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index 13c99a883e29877d9a929f26ca0b3b04b1ea0b11..075a9a5e503d0a1aa9ea2c772216a19f0feb16b5 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -4036,6 +4036,7 @@ static struct gdsc gcc_pcie_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_pcie_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
@@ -4048,6 +4049,7 @@ static struct gdsc gcc_usb20_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb20_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
@@ -4060,6 +4062,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,

-- 
2.56.0

