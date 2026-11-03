Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730597;
	b=Au05wkCiQxxr6PcZARckjyXiJs6ccd30M1gKn5phx3lLP97H5ZIRgfiP/7a5Q6DqGM2n
	 u8tutGQcW+AjdPJAWbx5T1H/aOVcbOWpT9YqJKABoonQMZ4GJBO3JLVsVrb8eCYkrHnRs
	 j/eelDfGOd6Kq/rvYiY/YfwPfy5nREcxnSHzcm8Ukt1TWGgBs8jSp0R82hTpBg//Yvq9m
	 dH7fuOEnkToSVdTiK1e+8lg0cQbmnDKBf7hAbMo/wgcPaqo3sg3/SDiFmpkLOQcWtQ0yS
	 O4rcvmBBF7ZoHopsdC6LA3ujAioJLlClmCVACM3Bj06HSMoReSnkoCZqBtGL1GzadJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iBhhiklJSyJ2sZ9SAOzTtwXUR/nAQ8p/ESWwp9myjuw=;
	b=mhwKrJXuTdsCwk6jJS0AEo1+VUpyhIIA5fbGkmICMJ/5Dcq/gBSUFQAdX3JiynNcXMCG
	 zINTUy013nvay3umTi/wx7PQrbWUX1WIycQ3jHhPstSDl98pJfGW5HWam7tpq0ARvtKjN
	 iMSciXdJKXus0rOLGDVjZMS7I2ALlDhOw0fhDVXsNa7dgWRX1A41ceohN5/5CT0m0Fd3O
	 WhPud7KhVsCKJSu4BiKZRxc3K3J39TNtq0PVOp+cFikPxxtJ6PG4BpBdzdqv0cPDfNQU0
	 ShpAVJ06VcqQv+eZi4MPy9BiC5yHc+qVl6Wh5bT4bvp3CJFoyPI/sYZj7p3u94f9nOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoQk0e5l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SwXFABVW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7CB606A326
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 18:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F7CB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoQk0e5l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SwXFABVW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPNjt1885073
	for <linux-usb@vger.kernel.org>; Tue, 3 Nov 2026 18:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iBhhiklJSyJ2sZ9SAOzTtwXUR/nAQ8p/ESW
	wp9myjuw=; b=eoQk0e5lfOEcB5ZbrvCTwseqLv9rR6Dm5ENdPvaUy/92tCqE0pD
	SPU8SVCVxis2QxFzgHexuzUanliS3fs4XddUbcWWmlkdT0NV4+PgryCNJPtDV611
	lwhWKf13XxAFp6EE/Ow6l4nfaC4IHlpH/lh0qgYjCIld2mu/BQCdagIBexaxxnew
	rwflCgBSbVJERUBbFH+g5DqF6G2sz7PHynMWlGgxEdgnlmr0lmg3AgY1PcJ+0SEh
	wTzdjf2Ix0IpksjVkYtMIHGc0XbJa85Gcpe7pcDZITFzc296OzKoChb8tnxhuUak
	clfR4wl3X1ESe4E9cY9iXP9q5/dxAU+9wUw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd0x00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 18:29:55 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so4279724c88.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 10:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793730595; x=1794335395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iBhhiklJSyJ2sZ9SAOzTtwXUR/nAQ8p/ESWwp9myjuw=;
        b=SwXFABVWbgubg0eTGux4vtV5HMsxw1pcBU+Zn29cNoEA6DSBQU8ltGrEtAtuorAQz3
         QYYp5aP3Nbap8bbxbOlb2t/rnabdEvM86iNLSD3j2Up4xKDPct7G+OfCJS0T6PLXgTUi
         AG8DP9y/ynZb6W6ubIKQmjKhusqUKR8i4xYsxnamgwak+YZLt/LJ6+IvXTqY1/i4vj6q
         Y4mmSNWrkFjwwGqez7291t908Aec6kwkQdT7qUOw54UWWemRTCkv8SfBLo3eM205UgAG
         VDdgzrP3htmI5frJLROHoKYsaYMss7XH2Ci5GBHpBIqBEG4GXnLhFZ/hcyNQS8mzuZum
         SM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730595; x=1794335395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBhhiklJSyJ2sZ9SAOzTtwXUR/nAQ8p/ESWwp9myjuw=;
        b=lXUztVFUeSlMQiXgv33+LDeDGVgSvNmOWqiAXyb9HFGGHNJ7jATVbe7/mdPWEMYo3d
         VbvzG8739QlEe96Z+wcfzGuxgZuv2aycV2E5QjoqGpVCPiBDwZ6lgeE0B5NbMlqpUsar
         x/1xxjbxcWEUPNLQdqWjKtWFN4r4ztmZfwxbSsw0HWZqEDRKN2tLISuqLER6UdsLrRhE
         yeTD3NhYzwkeMoUUYoOXmGFMDy0jyAbeyKqhl7n+104hzB8E5Vt0gOo7apeyYh3fKFXc
         NLJEr8LGK6s4juEZA+Gqsj4HZrV0Do12uAcX9YDxnJb2rR4vuE268SE8SRUDCI257u/P
         BX8w==
X-Gm-Message-State: APuU4Z/vDosoZhqUpbKBMqXGLp/vev6J0iVIVeI0bG3QHA7j09UM7RKu
	JzeWiHD+l9DRAAvNDs5itTpE90DC6Z1F/h4ONAC8lREIxFyFx0IjylvcUJ8zdUmJ9I64r0dKFeU
	WmAC0LKAxT0IBBLlxPUrdfahs4kKKKreBMmkHEQZ8pk1rVjggVUrM04/Xep4eAvQ=
X-Gm-Gg: AYBFou06xmvnUgFB1PC146n7Ei9hgDKv6HmtZyM9hBKqY4ONuevlI/4/8sFOYjdrcQy
	pK/NhHXasYxhLCS/ais90vsg6LNVyOUseXLZErnRfqiIXWcbwtvdGXaS1+0aZFDN3zdPAmweCb+
	8SsHoIokwaArGCSYqB4owDaMlcIuUgB3XYoHyIrr4PU3yfI7tgrujKmw1c8JuobQY6nUxr0n2Cq
	G4i76dzKMPLiNdkHea3MjP9TODWYF6wRaeubNoJMBO9jT/UukvTVMKqBGQqT6++WO0HYnUBRdkt
	vdG4Py59evWhGtfHasFuEfkcViy/mynvZPvahHFwRMSSEW5lAfc0Ehod/4mcuBtlqh3HbfH1XA6
	hF5IFhEdy1m8lGHQ8KNiiUHEst5gcTi8JEpLvBcck0EcmsOKgzy2am6Ggh09Y9JEIE5UpK04sHW
	bzN+eKdtPY0PweKcYUECTPEwYsuJs=
X-Received: by 2002:a05:701b:230b:b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b2437835a8mr1882304c88.21.1793730594858;
        Tue, 03 Nov 2026 10:29:54 -0800 (PST)
X-Received: by 2002:a05:701b:230b:b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b2437835a8mr1882258c88.21.1793730594224;
        Tue, 03 Nov 2026 10:29:54 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm609796c88.5.2026.11.03.10.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:29:53 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH] usb: dwc3: Increase no-IOC ENDTRANSFER delay
Date: Tue,  3 Nov 2026 10:29:53 -0800
Message-Id: <20261103182953.3437202-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aea2823 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aYgS4yw4GKKPh0ZsU78A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: XzoH7wTHmaJHLjQoYvZK6g8u-yBPdjae
X-Proofpoint-ORIG-GUID: XzoH7wTHmaJHLjQoYvZK6g8u-yBPdjae
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MyBTYWx0ZWRfX3JEG0qL7RzTG
 XzoJEwRkRGvnBgzbdhlyAvseFgIhWiL2tjb7nYOg9npKSF0I73xq+hWEjpgoYrSeMBlyHblViKt
 F4AE1GXVYjJo567suF0yJLs54hG6JAw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MyBTYWx0ZWRfX0AY74hYyL8py
 1z5RGX7n8muz7jya30mmvFRx8mkiAqDp4P7PPx/zqhqQdUCdNYt+L4+k6zDVk0nAzd9AfoA5HdO
 2pvR3AbbAU+l9DPW8i96xSCvMKAnzgDlMqgzveZZH5YVsMte1rV3saaKsyaTJYBLTINNRKy1Uj7
 TBbj8MtQe3GD1claFhOYrD59tIcfRMlgxeopcwgVSSk/RNstJHQPRRjkif8FqFjSOlYIOoIWpjX
 sqJ7TJuNpdqozv92fJ3nwcNRufnb7fR0kv0wA64Wdj1o8jzC7vZAThGrRiLDKx/KJfdv+FPPnh1
 BSFdUSR9WlG1PD1T2/w24vmxIDmOzSiCahDnP1ZZFzd82bLbnVg/vPTF3qtJm3KMqfezkEKimOj
 GR8ycopjUPPa09/TBFoeDq/cQxreoz82/dggXb+Op7lq64DTX9qoYwiMu/vE3q4TXHtGNg8GtLW
 aC37Xw8Rh0K0aC/5/Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030073

When ENDTRANSFER is issued without CMDIOC, software does not wait for
command completion and instead relies on a fixed delay before continuing
request teardown. The DWC3 programming guide recommends using a timeout
greater than 1 ms for command completion. Increase the post-ENDTRANSFER
delay to 2 ms to provide additional margin before request teardown. This
prevents SMMU faults that can occur when the controller accesses unmapped
requests before ENDTRANSFER processing has completed.

Fixes: d8a2bb4eb758 ("usb: dwc3: gadget: Add 1ms delay after end transfer command without IOC")
Cc: stable@vger.kernel.org
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
The DWC3 programming guide recommends a delay greater than 1 ms for
ENDTRANSFER completion without CMDIOC, but does not specify a worst-case
completion time. The delay is increased to 2 ms to provide additional
margin based on observed failures.

If 2 ms is considered excessive, guidance on an appropriate worst-case
timeout would be appreciated.
---
 drivers/usb/dwc3/gadget.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a76f669a796c..a907fdfac8d7 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -445,7 +445,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 
 	if (DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_ENDTRANSFER &&
 	    !(cmd & DWC3_DEPCMD_CMDIOC))
-		mdelay(1);
+		mdelay(2);
 
 	if (saved_config) {
 		reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(0));
@@ -4158,7 +4158,7 @@ void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	 * returning from this function.
 	 *
 	 * This mode is NOT available on the DWC_usb31 IP.  In this
-	 * case, if the IOC bit is not set, then delay by 1ms
+	 * case, if the IOC bit is not set, then delay by 2ms
 	 * after issuing the EndTransfer command.  This allows for the
 	 * controller to handle the command completely before DWC3
 	 * remove requests attempts to unmap USB request buffers.
-- 
2.34.1

