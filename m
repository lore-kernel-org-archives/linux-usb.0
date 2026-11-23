Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430910;
	b=QHsQY1Nr46XfPLCkD/6dpSnGCDv8WF/QCYOGLzgIGL306Uqdui8MwxCxOaXRA0PGNcBr
	 kzcw1hI6aowicoihzLQ0AS5ZednnJVc3PmukGGwCuXQxM+k97K98fhvYaCyR6v9HhkqYr
	 D4nXZZr3CgJ3nGyOm5HchrkNghJJLy8vSAxkkEov00mF2i6CkekPcMXemJ7Bukr593pwN
	 RsOq2+YXeOckz6k/CLm5hSdseDsBA58k3D6m+B6GWfohgKfZluW8puUACCe6WIViLA05l
	 qeMqp1tAcp4owak09fPFTRI6k9Nylb4AVGrE/3YN9PEvxJGp9WyY+4hHEjnQwM7Y6kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AxA3UDwrCLZ0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=;
	b=3tQrbips/MqPYrKS++AKFpCglA8vNcbbHmNmraEOseHmr0wA7KiMTFzGDZaOPlHbfN7d
	 mFhDJzY+gu/CNJqGX92Riu1ElUT7UuhBA0fjfoqz4aK5E5rcwW1KzlyNnlvsYUGAuA+sX
	 B5T9RD3+M/Fl3I4nzDHHUvyKl03gKptAeySArVXyzPXmKxXt8ZnRvfBcg/hipNb3CxpU8
	 zwqlzcmIox+KfVGuf/fcITFtIt1TIKM9nUyH8RVLiwb73Aw9Qo1YfC29awvhE4YsqvYMB
	 rcR6q6O4+bJIwPajgnhlkwUszjUfRY2wrmcqQ+hGJVJzREOGq8vhEUDqrzeVVTXNa/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ng0D3ywK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdFiXysp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F647606A334
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F647606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ng0D3ywK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdFiXysp
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G3ZN2528377
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AxA3UDwrCLZ
	0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=; b=ng0D3ywKkLAAHR6Aox7XLN7nmk8
	Bu1oLsf6n6N/Wgma9fJOyBWpRo8paRypnY9dTERefkI15/tPzJGOUemNzw63GG9b
	D0bkhnP/qKymg/iej1DeAZYxVfTJsFGJPIvGK0NSugljDjjvLkwvilS+fORTaUSJ
	WdV+7XJtez92Bq5Rn4qJCFGUO3XiJ7ndfuITQVpRalCjV7bn95Cfe1H7Om8i7TUI
	caMg/sHXfG68SPPH4YEdJDNTUzOg1Ouq3VPBkGu9ZiV8dmUVQ3siJa5HADQYiqKK
	5fnE+2ZkPJEsXzHK0nLk3ccIZfzwsMUsN1+eIHO8b1z1eWz3lJHYeBJOEoA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7rmmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a065e2933fso3636606b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430908; x=1796035708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxA3UDwrCLZ0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=;
        b=bdFiXyspaspYoUarUwQXLCyZEiW6uuH3wWijc4CfHakGn7mURPUmwykQPArC5U3IUh
         B3iDdX0r8qSwlNd0btSHI2Lmo4O9kfv/7iKvJds8FyYNGl0PRkaRWtzSbcjZk2gH0ioB
         Vm16JqW/W4F4VTQ8f1HOhDrurqDSJ5/ZEmPfvMaATvxUdnoPscBEqon9RH30+RemRRUd
         QQpx/BlXbSEe8WVOp5yCN1XLA8skfKp/N/HIpZMcymFvTpprCUHkM9ziRJPxfJ5r9cpX
         b+LiANTyv6QL1kqVHbFw5MB4il3TKXww1yrCTyPOqsPet5YIGkGZGA10zRRPRHQvlwUf
         rvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430908; x=1796035708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxA3UDwrCLZ0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=;
        b=ZLHNjMX62La5rElG/B3UrxCqxMilbGyt+ScGtjXHoQKigacUreTr86WWAtlwsjL0Cw
         y/YCpeafXoFOJ9mCCIdEgOwUHHmlFdNBhdxuL8iFoF8D6mpDMOz5Rn2UtM2kLXCeat+d
         shJP3ij78649GQKw/4r9s6zIESSDTU6ZgDxzUpI/bb969QP117OoO2iG9hcqiiJHP534
         osaXbV4C8gdyPHTJRw1hX6xRC844O0gX3Sz+A16M1YwhpoWgfF6JvnbbLO/oVSiTO/69
         yzOnHxS8L2NzPlgeNGpxMT00YBN45HVZ5dXY6LZTU4TmILiNsTG5QEGA/XwnIOEswRy8
         v6wQ==
X-Gm-Message-State: APuU4Z9HP1TGYGtCPLliXjasAPfoero0YvDirjJLrym8S9kamXmViEPR
	QMOH0lZDbTcUl3Xuzp49royEE0MGYFh1faaQXpaJXlZ0jqUTFnbec5w9Nwul5xAgRroe1ZG9+Yb
	wDOiLT0FblBsr6AXwaFEBPZzHPCrU5cC3v/XuXQV/s0TRDknu/5TdOUCD1BTymzI=
X-Gm-Gg: AZFdTZchTR5L8jjaMb+1kfiAMVca0x15jWIybLBoeTTXuI/hYhiQcFK21VKWyslFjor
	YBGwLW7D5Kgn2kW/e0aSItuowcfq4MuWKqogdTgL6hw+4QnI1c8Ko5edZl0N+8b3laCyDv4Frvm
	z42Zrs4WuxZ3+713xeHmUhPFViH4qCGm5oVymN0PbOW59PV+H5i95h5hqfrvFBjasveIieDqPW0
	yQmmYMbh+VhqYbIDVi95ILz3rs/tP3r+Wr6wlk7Z2EUPkcP9eGlKr97bciWzFZZC61ZFENjYw01
	uvXtS3JaNQnuQpEmpYYULwX4ZIM75hKyqjlZBgnHRROaZvHDtK5f+F81HyaMlgolgvzf0m5o1F0
	xzZkpQdjXCkZLOm7kwdYMp5w2Uh3fw5kMFnI0K0f8L4FiLI/sEHfym9CYkopi7azS+RvNtmc9TA
	9dfvDXow==
X-Received: by 2002:a05:6a00:1255:b0:89a:19ae:10ed with SMTP id d2e1a72fcca58-8c87c291f79mr9890480b3a.31.1795430907645;
        Mon, 23 Nov 2026 02:48:27 -0800 (PST)
X-Received: by 2002:a05:6a00:1255:b0:89a:19ae:10ed with SMTP id d2e1a72fcca58-8c87c291f79mr9890454b3a.31.1795430907176;
        Mon, 23 Nov 2026 02:48:27 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:26 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 09/11] usb: dwc3: qcom: Assert controller reset on remove and probe failure
Date: Mon, 23 Nov 2026 16:17:24 +0530
Message-Id: <20261123104727.1539149-10-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0419fc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=SipdNjeEsZ0rhQ0KXr4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX3Q08vWlsI0ch
 ERt+3LAGC1ai3JJ+bYMjpxGco2bkklihVlpTUxrNA3wHBeZ0b0d88oOtmQ/VY58vGcXf9LYOALZ
 AEBSJSwfuzCf4kuZEtotrG+DZ8IC5SeQ8O5eZVD9n3ou/KbgwjhV/J7/KvCzBtpHwF9QV9wrNMN
 hef2z+B3qITcz7/LMsjR6x61rUN1bm0FpHAW/YMU9D9hY2YY8jeE20QCVabwy/JUSINQOa5mwo+
 EgE3EjSonSyLMTZAHXkmYm7dOVyqIPkB+FMEtQSU2H6Q4PIAR5QQ7Ut1oPBW+ZI200AHMMjTMjS
 bOdcFA9vxa2Nx+EFb5PFR2IWbgDsXUBJOqj4AR0QVASbtUgY+bu70vYDch5eEEjwpOoE9SUujmK
 cZAxKWh+mM5xkV+CT8CA2zCNtbJhJB9nw1/9HzlfpqfZ2Bcxmh91T8B82yol9fEOaZXGUmsjRyU
 oat4XripFqyunlh6cyQ==
X-Proofpoint-GUID: MGEtdWZTF6UVnfSjzyZtaHiGMoIKIOQH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX19AeWFnnzHee
 D7qbCVwU1YoZQQ0jXIoxP9+tGwEeDu5aF9sKSr6pc/eaA5PZSJdJZINNwkp4gUK7xnSAN9/nNo8
 T5gpFpy9YN7RNvdq/DAZMKnZiLh7E8A=
X-Proofpoint-ORIG-GUID: MGEtdWZTF6UVnfSjzyZtaHiGMoIKIOQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

The controller is taken out of reset at probe, but nothing puts it back
into reset when the driver is removed or when probe fails after that
point. The controller is left running when its clocks are gated, and a
later bind starts from whatever state it was left in.

Assert the reset before disabling the clocks on remove and on the probe
error path, so the controller is held in reset while unused.

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 50fca06c83d4..61a3e3c38f59 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -804,6 +804,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
+	reset_control_assert(qcom->resets);
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
 	return ret;
@@ -818,6 +819,7 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 		return;
 
 	dwc3_core_remove(&qcom->dwc);
+	reset_control_assert(qcom->resets);
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 	dwc3_qcom_interconnect_exit(qcom);
 
-- 
2.34.1

