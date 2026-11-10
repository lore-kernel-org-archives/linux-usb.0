Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302526;
	b=qxGqMqM8+tA6kXWBQBAZFn/Bfm1Dh8WKxKNFpKDqhQ5VG5Da2fCuADlrNW4kZjmdjGgM
	 rq/i/wAkdfbpt0896DUUGZEhJYOFpcSDHAoBwpbGjI4jvO0Fc5HCNr6qvN+IkIbTB08Ee
	 iNNuxzHmaUib0l+alTrQvm+FHt/70LUPOzZQfXLw922EXrQ8+W8bL9bf96wJKIR1Das2M
	 LF1emuoasWd1f5g4k3n1loUyNAixa3A5DVtQ1Jaq++voTFA0DnSgJzvw1YaTIhQWkYkLl
	 MVSkRutxq7aeWJyu2vnmw4/ru/CNdns4RJeHwD2qAihAh62FvXppLKIKYOiSiaBcOng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7luiHaRw2yBauh0ow9oHCU32cPRl15BDQ5bNisD4nT8=;
	b=2oz0Ef7dAVnbiGmXkSTcdifYoA1u+elPK6Vb04kt1+3yUEbv8XC5Nd+fGl/8rrROBiYg
	 kGEsfiv1/upck3uuZTUA7Oqz5ZjYqOen7+gt1sOvwmufY9FF7YJNejl5Zeno4GvpdJdjC
	 GitgJThepr/ZeuL5VMNKGfk/ckztCXSWn2joEUYpF9YX1XSUjvNTu5M1tQS/MvqTRb9zO
	 iNmt2k+SkqVnmIzcJuqXJvtqbTUVIZ+JoqsBXCsFhz1U8/T2sBQQ/esKYIm+UHUVKYlgr
	 if1qaE/98bSfZ0pXCLou0OqITS2jiH0x7DcdWZpL4Bv849V7ApTDK4wMZNJpp4v19XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z/bh1dJz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AkOBSyQ8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945FA606E59B
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 09:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 945FA606E59B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z/bh1dJz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AkOBSyQ8
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l4vV1155030
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 09:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7luiHaRw2yB
	auh0ow9oHCU32cPRl15BDQ5bNisD4nT8=; b=Z/bh1dJzEu1VV8lS/IL+vUcPQa+
	M2kgYdLPkohSbQU3wwLfLE7M8HyE8V2FXRBPVOZ8tkYUg7LgEAN53HnxqAsPIj+a
	qR+JJSZuAaej7b8guzkr752Q9WMWgBM4hSuB79S02BQbEsVwQk3LfRsCmalPSpi0
	pbAf1pMRPcf4S1LTPLyBHPTXLRTBEMnrA5e2et35UT3SzNWpIAurvsSIkNkn5AFI
	qj+5PonWloAXvA0iBgggigRVeSYbXD7gZmHyJmirIdx6qxkNlcCW4V7ii6G7UdAZ
	vS272+0SQI1eVCSpQPZMFnwjEjAcKQrl1ccsQM+cDIHuLrFiZNtdDmJs+Vw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49eec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 09:22:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so105744eec.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 01:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302524; x=1794907324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7luiHaRw2yBauh0ow9oHCU32cPRl15BDQ5bNisD4nT8=;
        b=AkOBSyQ89ZS9jjeiPI4Soyj6qeExiNO2QuoLoTTi+aD+3b82hQzzjICMX7F9cpRSfh
         0uub0Zu9n/Vl+LZom34gvOOkObuGqZ6y2agbXNi+3rTjDKVrtdY8zHp9EiRT/3Uu2H/A
         iQeh660XSC+LT+FYCQvpC3bOfIouDjpwn10eQoFdCHU28ai5lKzBW1a+e/5fEQX3c4LX
         XIfm4XESK9QNmi9ky9dYg1scTdPq8b5EKk0tj/RNxuIo6qlDnMHtVbcYqzXye0wD7Iat
         GeesNGcixeZwnkXvPyPII/QM6nDAlPix2wi2iPmqxuUzCVY0x2Tks3VLWgHFhB07sou+
         BHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302524; x=1794907324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7luiHaRw2yBauh0ow9oHCU32cPRl15BDQ5bNisD4nT8=;
        b=siYIK3klkxGA6rWVndlBqah9Pgga3qV5XoivB2nBg7u3WXxrGXf+OpVpxhKN3tdjAN
         YDjUaDzkIhy5MRyCe6qo+gUek+u9xyA0faAmeft//8a6P9PqIwea6R/iWQfho5mIvHNg
         is0HoBYjXexm2uxO7g9Qk3aMHhgTmhayIQyi7xTZ1lZI6gCmSAnEFfbPHgZFfWbwMBnG
         ExP43srT0zsID0xkAULPG4ssXRimrSMfM+QTGdyIHUGnEzN5SBpCuFLw//24rcPsR+Si
         hfWht/qy3S5zjMknKH6akINtI307rLMsnLMTaeGj0e2oip+yZTWqdPucRZCsU3M7cbow
         k9ug==
X-Forwarded-Encrypted: i=1; AL+hErFjnQZCX14gwDqng0H8FzYL1whU3ZfOp8iRMrjRHIFIR+2BV0GxoMLRTBz/7HChN84PJ9OLV4OboHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GYtyHXSqz/ck5QHXGO/F03jvE+Af0ORT5wEtKCPDugz7KhKx+
	En/zZpiZqAFSqnCtI96at9Mj36Yo+sZvD/H89D/RQCLTzs4qdWqviIE8IZdprHSfKkarP06nH9w
	uJGle/zEPbRvOTuzVPJhY/52lO9aPzSTrc3HpBUeM+EzbWU39BmRVy5RXMgPIohw=
X-Gm-Gg: AYBFou3r1HxXiSPyDynaGq+IMaAc5B6ngMl92fNd4c5GQdjEVU76Hp6wWEO8ObOgTG9
	O9XEmdc0lopWGB3FDzka26amyRqR5X9UhMRXHB33GLPFKkl5RALCUYzERPF/RBMJR1H+lnReyAC
	+dkzjw9O0Y1iUpDGyjNvCtHXZeVcRluKLuQnfcZ54b/jnfwur3WNi634eqQ/vcDjatADmVSK+uj
	inWydHpXpZ+YJkrNr7wpRbuvZnRXmSQgCaXo1mhW6ekvtcpBrSiTXzvLqr/pFRszqH3Sc+qkloI
	wY12f0+wWQTHFre5iIqx4I6CXRfdASBGxXaqMfkwtKT0q4V8vHUyqTvHEyFDpPFi7ipsB75bLOe
	i8mawjXpWaP8v9wQGSYXZmfvpE5TcFvHbHBzf7e44Yhg3cVSEks/2QyrIF3FPUKImdr22yjb40V
	esGVX1hQvIr89nmUh60QtZ1w==
X-Received: by 2002:a05:7301:4d05:b0:369:535f:4d12 with SMTP id 5a478bee46e88-3751c53edf2mr2529607eec.3.1794302524204;
        Tue, 10 Nov 2026 01:22:04 -0800 (PST)
X-Received: by 2002:a05:7301:4d05:b0:369:535f:4d12 with SMTP id 5a478bee46e88-3751c53edf2mr2529575eec.3.1794302523674;
        Tue, 10 Nov 2026 01:22:03 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm5257153eec.28.2026.11.10.01.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:22:03 -0800 (PST)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH 1/1] usb: dwc3: qcom: Keep wakeup option default off
Date: Tue, 10 Nov 2026 01:21:57 -0800
Message-ID: <20261110092157.2989350-2-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
References: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX1v+0u3mzCCiw
 bceFyxlf4ka92tkh1EDHL/srBZQRbRIxFPrnY3kNxZGkhKIhM1U6l1CpTa4fzayezudiC7XGkBX
 8bTaJ+flLvs5FbyB3K8ykujBPL38VYc=
X-Proofpoint-ORIG-GUID: ESheFNzPfZuXuuCFEBjswUUSfhX-vuvt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX4Z+yEk/ueUId
 5Ug54GuP+FA1wz9iaQ9jE92VSrreMWd6Rz5O01bMaTf5iJ4/g0eahNCyLgHile6F5MmngQLNXvT
 Bzxpn+AOm5zj5cvYPgW6SMEH9XKcBheviI5LTjV1y708y5VyUfagUt4VgQt2C6rXZ55XtkJeiWM
 DHgQMXKPUX1x/BgEu5g02V6jdtBa58A9tu3W2k/TUnG/WoYbXqz/MC/5E9QGqbuwoDHJQnS2/k9
 KGl+FzIKc6dGaTa7gmqTc1szjc1QYAK+c1635sBT52i8ygAeKSEhzc/cOIgKiIdECwQtj6/PR/5
 Mxe818nvt5NS++nc9XenwidsleX2qem9Lr8qen5acngqdzLU4X+1Q9rJpgIPa3Dqbp/woRe4d+O
 dQSu6ppDs3MuideIYsrZHirbIcT6tv7sh64QoPZ5+J/3Ei3tGaenGtfPtZfgtQpj1cx4N0pfm3l
 pTGXDyaAo/Xh9IOus2g==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2e23c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UBq5q3rzQQf4y2_YTtcA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: ESheFNzPfZuXuuCFEBjswUUSfhX-vuvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100037

The "wakeup-source" property, as described in
Documentation/devicetree/bindings/power/wakeup-source.txt, only says
that a device is capable of waking up the system. Whether wakeup is
actually enabled is a policy decision, and drivers use
device_may_wakeup() to decide whether to arm the hardware wakeup logic.

Currently dwc3-qcom calls device_init_wakeup(dev, true) when the
property is present, so USB wakeup is enabled by default. Users who do
not want USB activity (e.g. connect/disconnect) to wake up the system
have to disable it through power/wakeup, otherwise unexpected wakeups
may happen.

Having wakeup enabled by default also costs power. In host mode, system
suspend skips dwc3_core_exit() and keeps the PHYs and the wakeup
detection logic powered so that the wakeup interrupts can fire, even on
systems where USB is never used as a wakeup source and the controller
could be fully powered off.

Keep the wakeup option default off and only mark the device as wakeup
capable, so that the user decides which USB controller is used as a
system wakeup source. Users who need it can enable it with:

  echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup

While at it, drop the local wakeup_source variable and use
device_property_read_bool() like the other property reads in probe.

Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..fb535e9a4a64 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -616,7 +616,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct resource		*r;
 	int			ret;
 	bool			ignore_pipe_clk;
-	bool			wakeup_source;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
@@ -715,8 +714,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_core;
 
-	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
-	device_init_wakeup(&pdev->dev, wakeup_source);
+	if (device_property_read_bool(dev, "wakeup-source"))
+		device_set_wakeup_capable(dev, true);
 
 	qcom->is_suspended = false;
 
-- 
2.43.0

