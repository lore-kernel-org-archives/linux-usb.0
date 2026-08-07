Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBF0469846
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 07:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089298; cv=none; b=EDoTmLzu4PkwGZCMFGVpf8HNRNleUIhrZ3mPNFrtwQfS9fnbT9MtvoB9r/BExbUUmA2NlaZNDj+V9ePoSH1HC+yPEyXN6TQkKcAONOfXNZGd7FKQcvB7lwkHOT80+JVGpY67qULwFA1tATBsLmA6G9HItVJNyMd2dd920HKeVj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089298; c=relaxed/simple;
	bh=VPNozWz2W2hIGOxxxRdF+a8z5jnoAg8HG4oYPzXEthY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LOpJ4TasEPYgB/xXn+uW4FXyAkeCsLyxzu/JzEo8bbEUnnsTmZTOR2+o3jSB0F1Nplscv+BDYAjXG7VBzDOiJ7uprRUp/Q0g2FitpMa36YFVQq63ALymadaoGxM2NjnCv7LeELTTu1OflUkIrGSE6oBG1WSryMhP+2HqdFIxs2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHFVXDHI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQ2EJe3g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHFVXDHI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQ2EJe3g"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GgbU3477030
	for <linux-usb@vger.kernel.org>; Fri, 7 Aug 2026 07:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a+AHdnD21uX
	JNgpoGS6x8dFnVCJZZxlxku8wGjceFEA=; b=BHFVXDHID3RmWE8EWoKhMglAupn
	9NJKr+9pMidv+K3kthvZIS/cWWmQBgQZbF+xr2ViMhtEoFoi9A1YGa5mEF95Ya1u
	IcSia3VAmV4YAJHGtQ5BGxpUalVArcUEyAkA0szeRavdUUQuB2HRytHVLI8/tC/6
	RtyOSPVVCruZbYlFjmsvUJsj0RmietVO3YD10Zwv4TeLpP+j6ivPATDVTyOXA8XG
	EMt25b9dPGJIwTwYxHR5+MDiIxElLsTFj/Q4v6ZufofXv1vqvUhIQKnZ8SK5Awix
	gPDwBr0DM2bIl80uNST00i1jEpwU+w6GBtrO1bPyg8s4lwryF7jmUVeHeWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hawb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 07:54:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so339025085a.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 00:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786089291; x=1786694091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+AHdnD21uXJNgpoGS6x8dFnVCJZZxlxku8wGjceFEA=;
        b=AQ2EJe3gbWkksyJpKeEa44obNo7voTeerCDMJTwuk56ek6dlVu9kGa1SD+I9g58Ss1
         K+P+39I/nDyNZVRifCvu7YY+hWjt0Xt3nEgiEtQh0vuechVR1fCQLM3VPCOJCZg0r8Kq
         VQqQGBHSNOP7ojqKOBksrsyXqeCbZkNCKgSt7ygvxkDCWAtByVRqF+w0Xpnv2bVguWXA
         qm064u/6cwlEYhPnnZVCtIl7Ndg2yRNkRfNld3mmlBNKxXJ9jJHQMARykWwRCb36Tu03
         mc8zZo+AHXR+GvkP0fLv1qXyF6tE2qdU7Accgqgqr/09IkUHUZ6b4Asz7mBZUr01wHj2
         opsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089291; x=1786694091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+AHdnD21uXJNgpoGS6x8dFnVCJZZxlxku8wGjceFEA=;
        b=jwWaL7XfX0bOufqv0NT+tHENffzhTqLc3FBwoOvTuIC4g41wf+pFdqc0gGjhkOTjI8
         /MUUSBxmr5xZZOOpAZmiktYTITRYKNcHW75gVEVTiMr49b1YLm7W/18bUZ4xVfMgonU/
         ws975mv+LgvXti+jaHe0WRCg6yuofTc9QZwy49RskFc4/bJsfJ5hfrsz2mHqfM2vKbgN
         nQLhmFEeiJyu2uuBSlH5zLPNHpW9qbufIgkhYPqBHfIcpPr5G5ZCwywCFqVeVLhBgRdr
         e1xg2p2Sqtl+cPY6+5mUhtqMu7hRHXFXSpt0TSHfmhMBzEWRsBgB/JaTWhlbOeF4OYs/
         t2bg==
X-Forwarded-Encrypted: i=1; AHgh+RpW68uUHIjwTlC5nM3He38YJg1fgZuUJooDFlKKEXt5IFCP0zZ9IdQs+q2JxBKPQ4skuepIge/5wn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF51shqPswG0lOvubgw8tRYmuC7ceUzf2fk3LbMs8J9ff4ECHE
	8BBpJzkcuHJ3UDSAcwHmzIqXadt1CL3E9lGSjVvF4AMHPIzuZ2zjbMdsrgmTu+z9xg96OwAaYrP
	zrVaOdTBycS1zU6o8sxWuN0EXSKHhysfhpwFXjdAchK8YT4mMv1Pdk7Nl38aj20g=
X-Gm-Gg: AR+sD11QoYSTnBZxHjC6GPIezh6do1h4Cm7ghXUiEmHwaWJixQ8TLBLSK1qNGHJSj1f
	0kQxzanBpGrf2hXSVizwuPAP5WgqcSFhXxcgpaU+AD7xSQoNG2VE/Xup59MNwTdvQbeU9JRUS0G
	GzTX13qsgkoUySHF3L2ZvYXcLbdRC9JDMhf1b8dPKR76/rY/W7BW1ObZ62qiEpoHve7U+bk/EvG
	kqlbvsr7l10SJL0tSysT8FnQV1HzLXzNLbGiGgarmMTIFz4JNPBIAlnTUengkH4hSqdflgqBuEa
	8MrRqvzuZjZLpzrjN+Vao2vAtVlhoCqRCoE1P60twA2nxhE8ijA6nJjlgoOSJet0e4H9QnJQ8NH
	HUHIk08vzTNEKuTNpkNB4+3sduce3i58=
X-Received: by 2002:a05:622a:15cb:b0:51c:8432:1753 with SMTP id d75a77b69052e-52ce6159e3fmr199727081cf.30.1786089291648;
        Fri, 07 Aug 2026 00:54:51 -0700 (PDT)
X-Received: by 2002:a05:622a:15cb:b0:51c:8432:1753 with SMTP id d75a77b69052e-52ce6159e3fmr199726901cf.30.1786089291278;
        Fri, 07 Aug 2026 00:54:51 -0700 (PDT)
Received: from QCOM-WFsSr66Fqw.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cfddbbsm20020666b.61.2026.08.07.00.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:54:49 -0700 (PDT)
From: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@ti.com>,
        Tatyana Brokhman <tlinder@codeaurora.org>, Kees Cook <kees@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sebastian Urban <surban@surban.net>,
        Seungjin Bae <eeodqql09@gmail.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Subject: [PATCH 4/4] usb: gadget: dummy_hcd: set no_sg_constraint on the host controller
Date: Fri,  7 Aug 2026 09:54:38 +0200
Message-ID: <20260807075438.5566-5-igor.skalkin@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
References: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XOzNsn7qhdzDz0VIzjevMRIuwaAhMoM8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1NyBTYWx0ZWRfX9zSkbO0Zywr/
 iSwCrZXWToh0LA9Awee5CHK968mf4kMfHnKEUvy7Q/VF5e51Qh4rdDLppSKpabhZFYzIsb+dQl8
 zeyp613DcO31bXqwHKc1n7nyvEF9/OKz+Xgi4HX5vFsgye2MWJ3Fo6P4/dt3ASB0DNwr5HBQnTy
 dHCh8P7PPPhKGDNgLDnck6pT49dL0AowFEUywZ3oHyciw4UWlWKE4V9jTNKyIfEF3oTfdCIt07O
 8tPNdPAU+dxMYghAC7qDm8dvGHy95RCdt6TrvTEfNc0+daEF74HMAthsb5ibrXaA8yLnynWDoBB
 w6wq2wW5SYqB3ilQ5mpD0wNKncz3aJeHk2ndmvXlOyBrkoHpl4OSo4v92DrdD8pG4peJWB+6Vp2
 4D32X6c2Je12nsdu/5T3ll0FSTCsI+8UvLRY+aL1Lw+KyzvVibhMIXEWsFiaNSyF2OP0S4OyP+a
 dkBh8/N1EMbkPqkDxGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1NyBTYWx0ZWRfX/evwkWwLswoU
 0PS6UfyxY2tQPF/SHDfO2ArMABaqAXhLZ5Zi0he/CkqchsdhAga+16YK9XmH9iUdpBm7FgGMSAM
 R1obS+pzX5utsZEWrTcqEytap02VyZw=
X-Proofpoint-ORIG-GUID: XOzNsn7qhdzDz0VIzjevMRIuwaAhMoM8
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a758f4c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=WZ_pTnkcMvjAhArtRZoA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070057

dummy_hcd copies data in software and has no hardware DMA alignment
requirement.  Set no_sg_constraint = 1 so the USB core does not reject
SG URBs whose non-final segments are not a multiple of the endpoint
maxpacket size.

For SuperSpeed bulk endpoints maxpacket is 1024 bytes; usbtest generates
SG lists with varying segment sizes (e.g. 512 bytes) that are valid
transfers but not maxpacket-aligned, causing usb_submit_urb to return
-EINVAL before the URB reaches the host controller.

Assisted-by: OpenCode:claude-sonnet-5
Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 7597c9e9fa66..2cfb1d035b34 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -2550,6 +2550,7 @@ static int dummy_setup(struct usb_hcd *hcd)
 
 	dum = *((void **)dev_get_platdata(hcd->self.controller));
 	hcd->self.sg_tablesize = ~0;
+	hcd->self.no_sg_constraint = 1;
 	if (usb_hcd_is_primary_hcd(hcd)) {
 		dum->hs_hcd = hcd_to_dummy_hcd(hcd);
 		dum->hs_hcd->dum = dum;
-- 
2.49.0

