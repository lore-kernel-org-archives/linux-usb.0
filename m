Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953664;
	b=MB79WNg27kcMXpDZSalHlOO/tGebPHu/hBDqGXztfZsD5JCufdrGhMB8AYckdA/Bz9ZA
	 d3kKdf0/OptUL0WQfKkyMScIiY/Q2CybY49w8Euvzh7EnSp4zZF7BAJCHPZ+qfE7pulxA
	 jHJ86JckyTocpCnxT3+anAPhE2YQsyQUtuq5JiTljYklJXliX7THG8WZ17Tr8zFartp87
	 pseOBATvcxyA5oFpS2hZhpJMSLuQyxTZyfySekmfD+j8aNZXyFeZoX+SLspjlPKsooDIH
	 cjyL/a3Z9FahOvD/dfvrui9LPARxmSDJflP/uKtzXI0YgIN54hilYgR9x2wuvV5DRQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9tk+I4vZOr9XanR7g9lQ0IcR5uGKfPMbK/eELVN/uXM=;
	b=eK/YjKIRp+Gpn6A9opSjr3k7qax5QpiP2WiO9g55mlcf8YdazoG11mRUZX2GnzVqlduq
	 X3z/UdbKqosnMgOHXutB0vkjS79yn8xKzcNVV/dro5HSBpurbpnPSyq9GWe0c9+//yqsK
	 SDvQBmrUHZg+adxhLYDfH+3xLZiNuZoJ6q6cJ9R1hxp03DJM2gDHoIKAQv6A9XUjzpM3q
	 cF4sBMhrb122/ikKTVLl8TOsy+lsDSeudOMbV5ENFYoZqWzNVs703GCYwwV+d2zw/UPYC
	 o8iajMAWXW0FN5rkJo5ZzkVjBGrj/9+ILB8xWxghXh28bZQoaFulzmwu3WlqLywXnCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E5z0jlUu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AoSR8SL3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4266606A328
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 08:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4266606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E5z0jlUu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AoSR8SL3
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RPQx1679899
	for <linux-usb@vger.kernel.org>; Fri, 6 Nov 2026 08:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9tk+I4vZOr9
	XanR7g9lQ0IcR5uGKfPMbK/eELVN/uXM=; b=E5z0jlUuI84O/9TmJuPY8MefdF+
	ncOvlz9BVDgebFROOGx4/yn5ZcGe+YXewiUd/VCnYAS/v2sCHOP1pln2r7FQXNgJ
	fu5XF/4Vq9Pa8lMbhGpAUwFlxoU7QDULMx5ehsChvwbtVfOYUBWVp43qfL/9yCkq
	fBT7ArP1Vu/yMdjY+eUceDAG8vXkp82QwOZrPyuWJf/zWJc4wINevAACZiMfjCe/
	fsc5Z/2tM91xR1kAxjnoKR13HI82vgqwiLhK08ulH3ZbXGeB+RYLexXTbyBpeBRs
	hxeB89qBvAmH92WSPpH0RD0hAtdPvLIZu7JZS2lqnw9ZU1wbitewLY2swAw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pc9utd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 08:27:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso632295a91.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 00:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953662; x=1794558462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tk+I4vZOr9XanR7g9lQ0IcR5uGKfPMbK/eELVN/uXM=;
        b=AoSR8SL3i823moGVYyzm7GRUwif/+xj1twJwQ53T8u0dq+/4k7NaZA1TAvN/b7OwNv
         FPDyOdf9DtsvJUjVl52MxDbLPQ4Iolem4IyKuevmgYECvgp/1c36NLUipq1y/uFpk6G8
         e5eohCHhVZ943/K3eGRTsXoMa8K8GBuhgyI2mjL4ujDXPKQwHRRXjvp/Ighj5Yo+81Uc
         z0OfWymrT7K897arwStwgKHzANfa3ggy+wGZ9b+WKXcd0cPsUksjWfs1dknllJcGOhcm
         cfrM+MKwMJf+jZuCJsKGJmJkdOhue4Dzbp4XpIEQxz9j9opWkb1Mb3//Qmmr3zmdpmpa
         RYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953662; x=1794558462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tk+I4vZOr9XanR7g9lQ0IcR5uGKfPMbK/eELVN/uXM=;
        b=puTHRiqveIny9odozTIixPk1r7i8/CNMM71hUc3tIn7Zaikh2SCP5hshGtyxBqvTsH
         MQ3PIy1oJq3A/eidkh1HDgv8RfzynOG2KiR9YqPuHaFnqTWzq4Py6x+QZsTK+slerrny
         8z7wqIuAkHulnAzFpkysli/KJKDcx5HRkoSMYPndrLdSCxph+epzRz1SUdpwbTEI98wc
         HHXPGItDf5+vvewji6HAFy7CAin7AKP2A5pmFVOK2caBh/0rC/JtIatJdKM67oDuC4L3
         x5rVnwvesY5oEXR3E+9KK/JOg/y+mNukBsWJMltOGnFtzhMC7KTmoBrjo/lw0U6WaHLx
         IBiw==
X-Forwarded-Encrypted: i=1; AL+hErGAcTt09N6DuWKsCGgMdDk8y9CJT6P22b5FN+MIYU/uwonOobNZvpchw3Lt3jMxlakUgDPZrsi8Las=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YhnOFmcW4AbUHi4SWZWLRdxkxU/H3eb49tPHhegGvwCJgA38f
	Y7gn5WnqU9whar08mhyTATrroiR++1LX+RdOiCua+9+KqWcms9sC0264H4icZSdoJyrzLaPncTz
	vJyXWS4QxVHk2w3+mCCGzS5n41etUmd0oM40rlG1mXnXkz9Zq9y27y1Zn9TXZXwo=
X-Gm-Gg: AYBFou2fGWTd0qYUl0CN/Xb+mnbBCiWmYgj6/WzCAtboeuG+oayYTz8W7MPIznazqsQ
	r9+wMWNsQxLpZ93I3jYjFF9mBPd0rXxND0fh3jZBRC6n2Y1zGzgxGGSpi5TTYxyMeksbfwM1KDH
	NIXuobAxFoqwqvjclYZ2sfF7A4+ptVYyLYY8ZGwqd0YbroFaKt6gS1ABqoa12540O2VWOW01mXg
	Xxz2ldHajOJotO9LolfWYvmotsGPaNyX1k9cCmuvUqCXle2AjmZh/f6IkMPBnEkC4Gf3LMbqSzy
	nFlEaQITT+8W/KJYYuOinsQ0u+W+CWVx6aqwtHgohI4VsOrPo+K/h8HWM9ffu93MAGkBWh8IjPH
	SzdALXRqQuOpkpigGP/kewV5jRU+QIjtv9TER3ojeOOR5wqGJkkot7Sv0HxgUg7yN6NXlMa7t34
	R8vw==
X-Received: by 2002:a17:90b:52cf:b0:3b0:ae41:2706 with SMTP id 98e67ed59e1d1-3b0db5f60efmr1936170a91.4.1793953662458;
        Fri, 06 Nov 2026 00:27:42 -0800 (PST)
X-Received: by 2002:a17:90b:52cf:b0:3b0:ae41:2706 with SMTP id 98e67ed59e1d1-3b0db5f60efmr1936132a91.4.1793953661802;
        Fri, 06 Nov 2026 00:27:41 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42a72sm2433951a91.3.2026.11.06.00.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:27:41 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH 3/3] usb: dwc3: qcom: pass live SS-link state into PHY at suspend entry
Date: Fri,  6 Nov 2026 13:57:16 +0530
Message-ID: <20261106082716.128968-4-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: h4ME4dlkNmBea2krq064xJQnjeFrwsAG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX3lgs/2VA/yuD
 /Gto643C9EABCMUNRg5LBeRNdWsL5+HgW0txgm6ZOVg5awFOAsAjYKSXtJbhXyn7gl9sIFSmdPE
 wnqMr+DHcbNTXWA2LVI8YMrLnxbzrmOIYeWuVZCtZ0QF48g+bLE3KDnrdKmH6buFhBjRKJ0asku
 vyymdIrlixdJTPXeVeFnzyE1+IBak5qfLG3mguCEHjtuwcpgIa6KvSkhyBlNu2bmGlf+wa3uOC3
 ou35CDKjyc/06Ql+xOIA+jtwvV9Pggw4sOT8/68H/qMetk6dDDEpzBuV1JG93aWK1ptXe6xefBa
 wzRJEsK8RhhKwyn917Xj4tEkQGxfLa3A9Y2xiQbWyXyKK/t2wdk6BmUymc6LFZ8Cpeg0P7EZaZt
 wLfhzisflB2Oz20CPR11Y63tMqkWVUv8zcTAnv3HjmX7mWA3YQk7ewrqh6EqeIYDwP7FgV9s7zF
 JiltZ7MCcVORPRBM8oA==
X-Proofpoint-GUID: h4ME4dlkNmBea2krq064xJQnjeFrwsAG
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed8f7f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=qBW0Ez0WUtIADFg3DaYA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX+NlsKXGhhkl/
 oQV5IJh+iGzUvthY4Br6mWH09XsD5QzykZEEGo/qFPWq8gneC3hg7C4kKyQasRo+RfXjM4zAJqM
 BwDP36ke+jxCpfwue6oi1688JC1Vx68=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

dwc3_qcom_suspend() puts each host port into autonomous/wake mode
without ever telling the PHY whether a SuperSpeed device is currently
attached. qmp_combo_enable_autonomous_mode(), made SS-aware in the
previous patch, therefore has no live signal to act on and always
sees QCOM_USB_SS_UNKNOWN, falling back to the legacy receiver-detect
mask regardless of actual link state.

Add dwc3_qcom_read_ss_state() to check each port's USB3 roothub for
an attached child device running at SuperSpeed or above, and pass the
result as the submode argument of phy_set_mode_ext() so the PHY can
select LFPS detection when appropriate.

Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..d4ba095e47eb 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -19,6 +19,7 @@
 #include <linux/iopoll.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb.h>
+#include <linux/phy/phy-qcom-qmp-usb-ss.h>
 #include "core.h"
 #include "glue.h"
 
@@ -66,6 +67,7 @@ struct dwc3_qcom_port {
 	int			dm_hs_phy_irq;
 	int			ss_phy_irq;
 	enum usb_device_speed	usb2_speed;
+	enum qcom_usb_ss_state  ss_state;
 };
 
 struct dwc3_qcom {
@@ -251,6 +253,34 @@ static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, i
 	return udev->speed;
 }
 
+static enum qcom_usb_ss_state dwc3_qcom_read_ss_state(struct dwc3_qcom *qcom, int port_index)
+{
+	struct usb_device *udev;
+	struct usb_hcd __maybe_unused *hcd, *usb3_hcd;
+	struct dwc3 *dwc = &qcom->dwc;
+
+	/*
+	 * FIXME: Fix this layering violation.
+	 */
+	hcd = platform_get_drvdata(dwc->xhci);
+	if (!hcd)
+		return QCOM_USB_SS_ABSENT;
+
+#ifdef CONFIG_USB
+	usb3_hcd = hcd->shared_hcd ? hcd->shared_hcd : hcd;
+	if (!usb3_hcd->self.root_hub)
+		return QCOM_USB_SS_ABSENT;
+
+	udev = usb_hub_find_child(usb3_hcd->self.root_hub, port_index + 1);
+#else
+	udev = NULL;
+#endif
+	if (!udev)
+		return QCOM_USB_SS_ABSENT;
+
+	return udev->speed >= USB_SPEED_SUPER ? QCOM_USB_SS_PRESENT : QCOM_USB_SS_ABSENT;
+}
+
 static void dwc3_qcom_enable_wakeup_irq(int irq, unsigned int polarity)
 {
 	if (!irq)
@@ -359,8 +389,12 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	 * freezable workqueue.
 	 */
 	if (dwc3_qcom_is_host(qcom) && wakeup) {
-		for (i = 0; i < qcom->num_ports; i++)
+		for (i = 0; i < qcom->num_ports; i++) {
 			qcom->ports[i].usb2_speed = dwc3_qcom_read_usb2_speed(qcom, i);
+			qcom->ports[i].ss_state = dwc3_qcom_read_ss_state(qcom, i);
+			phy_set_mode_ext(qcom->dwc.usb3_generic_phy[i], PHY_MODE_USB_HOST,
+					 qcom->ports[i].ss_state);
+		}
 		dwc3_qcom_enable_interrupts(qcom);
 	}
 
-- 
2.43.0

