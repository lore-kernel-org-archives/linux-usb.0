Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719604;
	b=aoOS9UkQ2cuOq6wP2kzoxl+YhLhLfounlrhZdHR0imeYFrFWy6LHCE5549Hsjh8Gj8A3
	 DGvfzbkrJfoN34+F9hQUaFujAELRSjhZhfHs64QHQHOYttzwcPVVwBdVKB6rYaQhUmuy3
	 Jeid98FVJKIOfVpeR4QI59EdIzk0RmaQ+AUArjZ1bL8Drs/KYaAaXwlVEbsmXt7DDMPFS
	 Aa29BqmXFK4zD1ftIa2/aUjD/Tu5rLHA0+rxfrjHqDQQdMzKrTGCjqAtDqq5RGJTXmb7C
	 vSPp5KdxWuhkI6LdHjCadYkctJsqpEi8pT5VK+A69TnNhHj8+K/9Ea8WN4cOGWrSZsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719604;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NII0+L88Wv3q4wyUgO6D17Ai3ObjNTZatzOLfgRo1vg=;
	b=1kV0BcAn1R55D79F5PDkQ9/KpSmlVyUURd/W7wswgdJaC+gi83jSAuyle9hVK3jb18U6
	 2kXMRFJJHZHLQSj7yK3lpKlnOZEl5kMcgZlZsJTjIEJ4JloUIjPulCExxFaquMB16W1IH
	 OLx/pfRJSW7oVnIzCQq09uJ7U7MVG/1iLUGTl3O/uO3yiJap6Otd+YRyKqfxsxmdVuiyU
	 PmQWwn1Urfw0mIQG8YMApFURIfiYalUYNwVDrjCL4BcglMrwc51/DEeWThZj8jyQATKyp
	 zdUENnGaSZ1FterK8fUU6qzDuqZr45YnDHbGwK7Qa5K3qPr7NtJ5aAy+vq+uT+42WLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTCW4Tav;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qk+4cFwB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86928606A337
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86928606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTCW4Tav;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qk+4cFwB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuPT23484681
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NII0+L88Wv3q4wyUgO6D17Ai3ObjNTZatzOLfgRo1vg=; b=PTCW4Tavs8sEGIGD
	sz8/fOge8yOQMouJw4pYBniAonjpd3qi1v40dZYuOZsWJDzyNco7HZjpzaTemJGB
	lfyX9S15RhwnPg0fUXshot5FEWJ3byCuw1fItJyIVgWbqjeC0gSevY6mTBrg+Xb7
	shXxmBvYar5xERAy+pUrE1hjJ6zJOl9JvvjTf9leLKLRDm+TKW4iFCcbdFy9tZDz
	4FshGmPhoCGlot+2Ps5Cq3gJ6lID+4jnHm1DFq3LwROaYunKW0hqRYfPMhznD0PF
	Z7ASnAYCXpmzd+MxqnEWJbJduT0y7YbG9fSFeEi/XXgR3foa3FPt3ddcUr92mFOW
	IxA9hw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak03gcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:00:02 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so3063070c88.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 11:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719601; x=1796324401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NII0+L88Wv3q4wyUgO6D17Ai3ObjNTZatzOLfgRo1vg=;
        b=Qk+4cFwBGGKT1PHEUp7Ej2lcsLlXezJhA/E4hd7A0b5Fpm6gHthacNuw6PC8+R0aaa
         8LCiMylzZQAJkxDPxiEOQY7Ih/awYn1qsulkkvgW6/0QX3FJnI9AoA6bmlRDMtTiCJN0
         UrhCl+85p4JsM7VJbRqIZWr+o454gyOsSWjb45qcp9V4WeBvt8YgGDzz1SSgl5XBEr9R
         7dZ66kaiFVJj1fOfFezkUVJe7loI/c5SMvp26CWCqyYWBaMNfJg9nMB5be9OdPM+Pfvr
         OV2VdFh2cTKzp8dnCBwA8EkCHcGvGV9AS66MLnAW30G95o+EBapgnlJ5fJh+0WLa/Wog
         Hz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719601; x=1796324401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NII0+L88Wv3q4wyUgO6D17Ai3ObjNTZatzOLfgRo1vg=;
        b=nmYNquNTv5vIdcwTgHVxszJ5xFIZqyKPNQmcrcY+svE+6UibqxcZEkOvHhwszLxiqI
         7yPOamLRTicN7lnW6PTeDu1BU2PHzsDMzuZR/bASEtE/4uoJG7PZ3K4mssA5ZAgvgHkT
         kqF0F+jwX0ge3toAlVzf1WjDVIH5uz1R8uhJMsPuif1WOuChj710b7ii21d2OEAFSgzk
         rJJrtQVm0Jomdj3M7zIGiHa0BcXeCgBd5jbjzx/bhOWOS+9YKbSecvjlommm70GAu2ej
         IK6APjB+fyPbge5UDRBP1dZu5kFPcZxKt4shNVxwJXNRXKaJqf171p1dnw926L5HV3zL
         NxEw==
X-Forwarded-Encrypted: i=1; AL+hErHVUhI0E/iaVYzEEX+P7TQSQCWgFKSK1oK0stUIIuw/J60+Wdn3HRZNXunjxMRMMBO4mFKCfHG2QcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0JpMjYY2MqLR8VkXHT9lDPwA+Hgw+uwVyOcSbbuyiot492G1o
	LjQ2YKk4pITORMUvC3AWj8JU1HBpLb6uzp+vhj3vV4XU3vXa8CJ+Ev944fvQ5MKMGmr1O+pnc9r
	7RE13quMw+w1lQxFVrghibT3MbboI+LanUkS97nFso9NYJcBB9cOrwE0w1CgsNBY=
X-Gm-Gg: AZFdTZfn22pfOwBQy9BkkioEczPJaM1ReUqDFOrihfBkkWrVQWFAGkVd0O8JbPhmEj6
	/5d0LxOo2mMjuv7EUtmsggPsJFSKCkxONxeDQ0El+OO8B7FdEKiqg/nIVr+MxTGUSoI9Wdum99y
	GwuCmRMEiD61Tehy0WGWKHo8ewzesLSfazi5T8Z99BoWSShEJiL5QZrTb5DFdrlHnfsIHt9W7Sc
	B0BO+tur+yV0WtIq7aUFcLjcnEA8tnHH4JJHE3SuReGQPe+mPnOuH3CZC3wA8inRFrLl6IBnteE
	kiwgjOzGVSCjx4LvJkjXUyCkzWakNDdfRU3l6KGagQcAjRzxPMDik459Z8ZqLOS/AU6LgRD8a76
	Jiesb1TN/f+CGdt/BMddDhm5XwIwHfJ6vj1I3D/dRoTQDk9qqMocsP8BjuX5sCSJztO2zsF+WYD
	dF8EUm
X-Received: by 2002:a05:7022:1701:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b55feaa6a4mr19781257c88.15.1795719601441;
        Thu, 26 Nov 2026 11:00:01 -0800 (PST)
X-Received: by 2002:a05:7022:1701:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b55feaa6a4mr19781239c88.15.1795719600868;
        Thu, 26 Nov 2026 11:00:00 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.10.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:00:00 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:11 +0530
Subject: [PATCH 3/8] clk: qcom: gcc-qcs615: Register set_hwmode_dev
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-3-485a08ffdc6f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b0881b2 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zroWNzDgHOBiqxzc7EQA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: PZ6N3wW6VQgr7cA9kcFD8dLlLWGBRKHZ
X-Proofpoint-GUID: PZ6N3wW6VQgr7cA9kcFD8dLlLWGBRKHZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX5kXNOo+XuAwT
 3DdQKGqr+WMMoyXtbKxKxZlDzMRLG7NPkY1IbIRkQs8IqRBUe9Yl/veSL2pGbOzR6gWHFfrR0fw
 LmLnZf6cUoXpOQGzUVmTTajRcdhOpnv746chhD5xO0yd4D8cZdyaF1afoQ3Y3uuhp2NULMaGd4U
 VsZE3afHGbCJwYtIRYbn6Z6cQcbkDBYWOlhrSmNlhk/yhTB1vFeFYBxc4rztprCHf3avErIDrls
 iadQAN/lBMoGRuKHpE35joO7D53y9QHtjHKoC33zXMhlpQbduc4DeNQQ7EUY1RKs+UlI8jZDsR4
 BB6DiGg7bbEkFRWzWMDi7LW42+OkvUEpCYWgi6ZSEnYM10E3u1996Uxuv8hh//DFhPgfNoQybHq
 sG5Jw2n9ENUkjJLaAH4gJYrABe7uHni+wYaLGV7Uy2vJpaK+G3w7rsXh8lIl+0yeb369+LKKdQ9
 7rJQiGdVwRuBpQ5HlrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX6MTIUpzKoPps
 Bn9FIGurajfPDTGSMi8dxCpRtxHwkvxEAT0BWGQzDHnQor4+z/l/wXmxMCpDMowI/IDIIp2HUNy
 4YIipcTW/oFJNoSU1FYf0AJQwG4L0wI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

Register gdsc_set_hw_stay_on as set_hwmode_dev callback for USB & PCIe
GDSCs to allow the USB & PCIe consumer drivers to keep the GDSC ON based on
the requirement in USB host mode and PCIe non-D3 cold usecases.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index f205de3a936170413b21173c7af9668c14495369..76d835346632ed672e0cfd896723b84c185de270 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2654,6 +2654,7 @@ static struct gdsc pcie_0_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "pcie_0_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 };
@@ -2676,6 +2677,7 @@ static struct gdsc usb20_sec_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "usb20_sec_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 };
@@ -2687,6 +2689,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "usb30_prim_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 };

-- 
2.56.0

