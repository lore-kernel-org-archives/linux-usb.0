Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464793;
	b=LHnY0w/KJm993maUdLIGlJ/OcVPm6T9FccNvdjOq44z9mz/TGvdK+yQ7ZcdbOaV+Ktqo
	 9wKoD/OpJMowU9+8vdZmUZo1nf4Ax+fv9BpwSDi6zT56V2gConrmfgdhaDKVpRk7wfl6l
	 KSO1/ty7RMrMM4Z0LQ6NviL4rhcwYABY7WcSeeMU4MaPMo+ArQMQGVQXXpjYrJ4XvgKM8
	 Y9J/Rxd11N6PoI3+kt7pZLWWBgKpK/PhvRPwp0RbsdmeyqEk9yyyX28F+kuI9m32FLY/A
	 LOj9QXPXVDNUq++5WJB25Vl2Wdq0kznvmDo9e1GySJXWb5hH7qA0CuKuJjX2x9PaT0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464793;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+s7Yd/h15zxtsiZmXE4XXXRh9abd0OuVy3YLITk0lBo=;
	b=HOia0ulpZ0V5ZD1a+DrM5Iy3iaikKj7nhb5zLDs/HUumEXLhcmjiGGjOJj8UXH1mwUmx
	 V0lzBVHllVUHUg6RngNuG1WkOefD+muL+dmH4XYhqNXZu+lleCab7+H8d9H7nvT/36e0y
	 K+buGVDPlegXGXgj5/I35PktWdqr5fvjs4O7ZEnhZJNtPR0gU7h75TGHoiIwV1mZrT7RF
	 bphB3+ejbwZmBxNZ3eY+HP9tqyqSxbYCNqLKv5gxgZpc0t2YgxodQO2HVbulBS4Cm2GvA
	 z0l3b29vP1oOnh0eR1VqeQxIhCVt5vMU/xnE3NmqQ08iiHCN942xLc5B2Jtp8CmGHiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3YaV0gb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PBamI4f4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E397F606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 20:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E397F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3YaV0gb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PBamI4f4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuO8T2349973
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 20:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+s7Yd/h15zxtsiZmXE4XXX
	Rh9abd0OuVy3YLITk0lBo=; b=M3YaV0gbJkcWQoKQD5yDmve6v9ffMfiifGTi40
	s7Coj3KztGwycVzuotwedweUDiaWQpKJCOih2AUVm33Km0ZuuowD79rXLdLW4yFJ
	wc41bgA43eNivPLFOKE2RmvKU473NEGq2Qq0MvhpWUke6L9jSjrEzmmwY7pFHliU
	/DNw2sEAuRDz7G3IJ9X59G/xw2kz/5Q8tGZ4I08rFdunGacycjjINz+wNCVuHStl
	BoIaj0PKzjcV7zGjD5yuj8tNMiGk+/6N/jO30WsbcFxRbb9CgpjbvlpMS7dArQc0
	T6VREbM5ta7CBoHCx7eZUXlwB/yJKPLeczEZUKDALslrvwCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a380u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 20:13:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949664eec1fso43281085a.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 12:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795464791; x=1796069591; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+s7Yd/h15zxtsiZmXE4XXXRh9abd0OuVy3YLITk0lBo=;
        b=PBamI4f4uVActxQ0DH3Q9VP0ylx1mFBARJYPacGO+zB1u6xf+pHe3vstgiVF9Su1Di
         l7ncV/yOGb4w6/4SLY3OB2daLW5Jgc4I6IPHnpb6b0ehnFgpbVffnnZQxk0axwvxGoEJ
         sS3j/dTN255JtVLTNlw8F0o1JnPulSZ8/jKhb8nylW8LHQDHkOWrAXY5z+xcnFav9Iwz
         P05yKpbW6LwMP8w3ddZCiWRuP8mi4CD9YD3Xief2l934zDotXRfLvo2QUPXCGk73T4yc
         FMBiTcEUwp9nz/xWccyr3ZqOSrYRp6w3rR/mXmwv++xC/uOc2/8M5NEe8nPX5PAYeIof
         KOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795464791; x=1796069591;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+s7Yd/h15zxtsiZmXE4XXXRh9abd0OuVy3YLITk0lBo=;
        b=chKa+gsuc6gQpS8trGxVBPOhetrRheEPeV/RUkrMxpkNpUArL2TP8V0XDsSflq55xu
         /BbdXBwRgo4bR/eNWffkj6iuubFljITderi0kvkwUmOLdsvK70+ljLfAIXxrF5u822QE
         D+/2h1GhQoyhe6YqeGGWZTLs1sswmFlNFvZ/MsGsn1DpCR9UAeZulJALQm5z6HfLfS55
         U9QXONGEwAPrO5/fLC6LWmT/aXdhSCA7ZGFb0zglAhx0+KoV2tWwR/HQevo8Y9XKpxS5
         NkvEA1tNmpMD+42ozv7ntj2jD0P6phEjuEPq3i3hw0x0DcqdrSDGZXjs7Yyqbu1GpzoQ
         vtfw==
X-Gm-Message-State: APuU4Z9vLjqD5i7aQbLItifam0gOjDolUy3Hz+rtTRg318D9IQ67fdP6
	MTMRTW5vuff+yH/5l9+xitKelkSRNRCmwMfRSoZvYF5G6uKpi2KZ3XM7p+w3/ruWRTdi971uxsg
	v4uX1GbEEKKJ1LXgKqZ4iQolGAlTziI9L9Im+N+wedetwXvxAWYEK/dkjMrH9gOI=
X-Gm-Gg: AZFdTZeBP7LJcpdmLJQXYbUngRRMbEqOAWe2Z3Osh7Zs7AiBDMwMErY3od9DMpJclf5
	n8mbQm4+HV3Laa3KrPLiEDbrq6RROiXIpBmCKjOvevL6lLl3Abc/VMXBuHohWrAVh+KA7QuCeTq
	aNTZ+i23c6tbQ6mGov25W/ugtSg40pcJVGh6xPnwp/cZHMmDfGxYzzJtNSlBK21RCm+9Hqwrmbl
	pmH6zPfYeXCIC6Jc6RFDt1EmvMGmXDDnQi7BeS9AtQCKRpV/5PpbjMgE8nFreFf1tcFvhr2CBfP
	GBLVB/LYspfbmkWWXE+ArVdbPTSVk8WRgsproUXgxigMYEMHNG3uPW6dcP1ij02HW/UTz4ljePr
	LeQ6l+dxMm558z0FCH5JD4TBQMt4mCoPRfHfPnOklB3SdKZAq4Dnt9rOno08paEL7sVV/y6oTXp
	75WfeiFRM=
X-Received: by 2002:a05:620a:a11:b0:93f:740f:5a62 with SMTP id af79cd13be357-949bab7d122mr2151069085a.6.1795464790994;
        Mon, 23 Nov 2026 12:13:10 -0800 (PST)
X-Received: by 2002:a05:620a:a11:b0:93f:740f:5a62 with SMTP id af79cd13be357-949bab7d122mr2151064785a.6.1795464790553;
        Mon, 23 Nov 2026 12:13:10 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:3494:1e10:6244:f64e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f0f1csm175753025e9.0.2026.11.23.12.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:13:09 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 21:13:08 +0100
Subject: [PATCH] usb: dwc3: gadget: destroy connect_mutex after
 usb_del_gadget
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
Message-Id: <20261123-topic-dwc3_gadget_fix-v1-1-dec7679b81b7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFOeBGsC/x2MWwqAIBAArxL7naDbk64SIaKr7Y+FRgXR3ZM+Z
 2DmgUyJKcNUPZDo5MxbLKDqCuxqYiDBrjCgxF4pbMSx7WyFu2yjg3GBDu35FuhkJ9txaNF6KO2
 eqOj/Oy/v+wFABJJMZwAAAA==
X-Change-ID: 20261123-topic-dwc3_gadget_fix-2d05048742cf
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795464788; l=1185;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=DVXihe9ifbfAzdWzgmpDpoYOmtGTH6ztDRAEoarxgdU=;
 b=rp3MmSzCep5k3/HG+ueoVtE6zeM2EOMgt9RPz7pISjtHTHYe/Klu4tUuTqE2OjeILoQjY+0+s
 CgANU2a7OgWBt2INj10OkCELpCsKcVCtKH7Qj0mD+hw9RUBypuKohBI
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MCBTYWx0ZWRfX9nZz2Jht8QK+
 FwaoPjDfX+CftPC+6FMCBPLHEOR2o8IZh4JBnRQe7oDzPsndrLVLGOnRo4a8QfmDjjbxQFs6egA
 8AUQMxSC6ikwkHYimgDg6HU0vBailUg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MCBTYWx0ZWRfX2CUfgiqau1Qp
 HIR6Qq+P4Rg5k98C3m5GJZUPWEdCud0HGwAZZvDeIBQSWVO8ApXbX7aesrsiq1lDVMJK1PfC5sR
 Wyg9qUyu/kr/arCbl1Wm8B8yiJtq82yqY88Ic6tNIHYDtpA6zB2DgZ7OwsX4REj3ltwl3wBQ772
 v6rA1Fq8JhMMlfCBoHzd4vKn3+Q6WTDuM/7eS0LnyAUVpILWixOtyflH+Cyti/ScfawEidhmO2+
 UX4HoBYXwEXGq81Egq7as+fdNLYuJRxxz1V6JF0/tkcK3Mt44QHfr9uAyhGBDASaJn3emiJwerD
 8Aj3EsNISGus4wmvAYEfvGE89tVYNAoyUCtyKVcJfKlGnfkVag7+2r2SNRn3x4vQB4GuCUKHvSm
 Ed1lYFnztMY9+ioFxcCcRYZ+cRi8jQlqMP3G8PyX2t1SrgLHXG26vmU2yr1WcT1ZKTuqwVqr91a
 gY+FaI2n0VAfiqN18qQ==
X-Proofpoint-ORIG-GUID: O1tYnLxkeUOaBm0wNbsgEkBMzpWgXhNG
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b049e58 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=JVrL-DDhf0MI11mQd_UA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: O1tYnLxkeUOaBm0wNbsgEkBMzpWgXhNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230080

usb_del_gadget() unbinds the function driver, which may still call
dwc3_gadget_pullup() and take connect_mutex. Destroying the mutex
before that point leaves a live lock behind during teardown.

Avoid it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a76f669a796c2e0eb955969a88523affcb672ae2..673f4bffb8ca85778d084820ecfed49f50d1cac3 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -5027,9 +5027,9 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
 		return;
 
 	cancel_work_sync(&dwc->err_recovery_work);
-	mutex_destroy(&dwc->connect_mutex);
 	dwc3_enable_susphy(dwc, true);
 	usb_del_gadget(dwc->gadget);
+	mutex_destroy(&dwc->connect_mutex);
 	dwc3_gadget_free_endpoints(dwc);
 	usb_put_gadget(dwc->gadget);
 	dma_free_coherent(dwc->sysdev, DWC3_BOUNCE_SIZE, dwc->bounce,

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261123-topic-dwc3_gadget_fix-2d05048742cf

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

