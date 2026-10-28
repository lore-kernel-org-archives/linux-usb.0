Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213989;
	b=Rk3tzFxV9o0iL3e0TxHg0mnYFQZEecZdYAW/+mPPLLYeF+4B/vx4JelWg9y9aXItQRyn
	 s0aSbaAZcH93KH1X2Ne+A67wUyYhsU53O5zEvo2t87/bHFq4CaSlp4Jlcz+SCH6E5e9PO
	 4QgWs8sfzyNWzXERFKWnrdszjc4lnQKjkVqRgMunTYY3Knik636vl9ai62YODOf/dcAEc
	 hUSb8j2b4VnXLa0fouQhQa83vEnRELr5/B1Cms4Yjd/EnYlod5hCbhKqFeTvFBuUdPVRb
	 oS2MKtgKxhcMU6SwrSR2GExh9l0svGWDuieE2AKnGfT/LgcTkG9Vk2LKGjfjj1T6Y8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213989;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KgcDUP83Bl5a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=;
	b=r2VikVcslaJn3sCM9QU593GXvbpCNBe6NPCvfy7YV8U9mRQ+WvRStfm0vp3aztJJIIJI
	 9ivJbpmWHQgFvTBGh9Aciiky3XAq1N/xBSb6MYktO/EYfDMq+aY+T4bts+5651Kyf4TdC
	 OZAL8/wn1EVZ2jJx1JMo3ZXUhrp+g1fUi2mRv2/4OzK/kEzKwhwZn7xunmbPyHkrYISnD
	 +FZqz/HiPelE02sw2zEbT6v75RHVeQABs9vMw9IHKQexOY6UUwyw0zjmjnAM+QvmtT2Pl
	 szGRPJlmPn953lFOYwUJ9K/jNhCwUwyuPKgLv0XVxylZmASPL0ZXHNPXInnYtERqsEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pIhyG/vn";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=We4tUeLj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B09606A31C
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B09606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pIhyG/vn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=We4tUeLj
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SInpog1090705
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KgcDUP83Bl5
	a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=; b=pIhyG/vnmam6DilkyHyPOyvYlzT
	/vZHuBjxwY6qGjRivCp3/1plEEIwEyuiEUlmVZYwLicmPhIsUaJ92iKP5kz9Hwta
	9HIe+KVRjIdGf3ErF0boW+GYPrueX224JfkEEaqGSUCA130gfTguo+rD3SuKa+vW
	l3XF/eZPnkdu0OFEDl7cui7/BLwQ9GH3oNj+KxumcnT6UQREbktrYK4tloI10RLB
	6XOgD7zCx7qrhjuut6KopOg5iEfP8mN5wX3aH3JSBNBsKHX97UVLTWQ0uU9MCZCN
	saf4TKLzS4kZpd8eiPlDW0P65ZD0NDntbEGPC2/5wUBaCmnjlbYddpuMLGA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb28dj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:59:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso1546136eec.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 11:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793213987; x=1793818787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgcDUP83Bl5a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=;
        b=We4tUeLjz8FjUuA4EGKwdwgGBkVlyeUdHC63vVJKvS25af9aY6uoaTNQ9dDoYzjRTO
         Fdl8AQbiKC5CC/6tAfJTBH1Lohq2rfVQQDKpk+/QafUpe+QGew52sLcO/+jWXr/Kjt0j
         YuogEa0fBl39DP6CIjrCUg+TDxnxZwUYm/i6r7sUJtfpn5TU/Zku9MUFCkWRzMvHjHSk
         9R0SG+gTaBSITVa7JkwuI7QGZo5vUDTk2g3gABNmHpiRQ07L1idNmli+t1yfb3MBylOC
         j4iTlUuBGDEG9lG8X5sL4QXLx8H+pvEFJZeHGB9bQhnzP96I3m+wsGTeVBGjMkG1W1Kq
         YhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213987; x=1793818787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KgcDUP83Bl5a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=;
        b=eR9noFNY4RNQhAKZ78J/Tc9yGurC7JfycZgmLjaeoPib5YLnQyoeOpKVZ0FrBWsB/T
         yuwCpcwtDwG5msBlMkaGhYLyfgs6HA4nFZqHDYR+paCitPEMNpUw7kHDw9/+hCZ6c6ck
         ISGMcayHXgfNjY1IoRbnGWonARB0NpqhExl67uhNG1auHV6mVhHTaJxXycext07oMXCy
         yP9oHrtH55S1hR92s8YkTrUzIcaXTrF+ZLcoDRL8TGluacZMIgPM/PKCqLQGpiYyknnc
         x9UYCjIpxDD0aVY2AeuldJWD4O0dtv5JmuvdV0Z+XcwPb89MZSv7P8rxZgyOplYqlzJk
         oEOg==
X-Gm-Message-State: AFq9FYL9LBmzElGwE+AeAWTl7TWVmoB79VUxSkid/VcF82JP32/ePI0/
	+dZS/HbnXYO4BCc9BKO38qujxSjFA6n/Br7We34vBqleJWJB68Lov5OAVnI0tfwNrXQnm7Ihsms
	8vtPyR0uWKakA4LE31acTOLkaGY4ZcyVdArUNeXmIE7k31K/9xY6aWykx5D7kbjVV7Nqe184=
X-Gm-Gg: AYBFou0+Hqpw+rlhxy+wd6PBPXrYdeKtCJw7UPr+yEJgFHbvaPuSGZdwsDAq4DY43+h
	7QMqOUyzHVoD1QCguC6x5LfBSPCZJHRM4C1IItyOFJNEVb3pnj3J5D6TxPTEUp1kEDmxetMLRjv
	yTRErrL3boG5ZFlgNQ1SeKVQ1/yMW0Qe7K6obHF8FmOD33WOLvOf9ATJViom3iPo9lCuFa0D8hY
	MDwWfHq4y4Z2qDQT/DazTFzCEiaMj6NLvm0oOD0AzXlXwyb5iQdUfQ7iGzwLIlSZPVVTFm+9Wiz
	5t22kRvMwkJxamfmL0qvJ91RaKK/Lnkc7I5cUZy4625oy5WZSXTM2J/+sGmw79IeC/93Mks1Fo9
	tiv2LdngIJ80DNmaNsQBLJn0lbVtstunfgbOk+9bzW45X7E2p4Fc9zDLIv6BQ3hFdl1kmko7bU4
	ysU7C7GA==
X-Received: by 2002:a05:7301:7e0a:b0:353:7e33:664c with SMTP id 5a478bee46e88-36a20401baemr4316300eec.37.1793213987077;
        Wed, 28 Oct 2026 11:59:47 -0700 (PDT)
X-Received: by 2002:a05:7301:7e0a:b0:353:7e33:664c with SMTP id 5a478bee46e88-36a20401baemr4316256eec.37.1793213986385;
        Wed, 28 Oct 2026 11:59:46 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.11.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:59:45 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable balanced on failed resume
Date: Thu, 29 Oct 2026 00:29:31 +0530
Message-Id: <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae24624 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZXqkfniAK1spq4Hy8MUA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: kYbVhawJ0OwYyQI7WZ8OJfclFO0nQnb0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX9SGmNHCZkU4/
 BUM2qwDgvBDrUfDvmpAeDdm7L9DBNn20+DyNhBs8IUEBU7jFTi80w+OPEUfUjrLX1Al5jvo9JyT
 brSjvnsmUwFFUWXdNj75rpqX4lfDV8c=
X-Proofpoint-GUID: kYbVhawJ0OwYyQI7WZ8OJfclFO0nQnb0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX/dUNo4flWTUW
 B13dEIMxtfIGhkuuae7Vbh+fuEbLvqTSzwP9buvJnLK24HW/iPY55AIE0Wkq0aPbD/Bw93vEp+B
 ei2Nf8Ntezgc7tNV46mslqVB9h32B/jgn4nYWYdo4efs/Od34jLDo6D/8CmIq+60k8IGr0lMTyE
 jz1x7jMRtYg1V9s1Pde+kqZWbzA/BunpIIKD9bWbEsdKe1c9s9HG/Asv7VHbgr6VCboysfFcV2I
 IBv08VMxkUj4jKWguoHkhXfZ0YAEN+f8dfFM6DirKQRO3/VB++KyFOeaZn8/6xgakmS/XhugtuN
 sJKfBe4Red7SeAcnGfouisUpytJ92Tpff8fvy7Kj8igdSNfIln9rorO3wa9zlqVakfFOYKIGHcI
 aKSe5h77NmdZEAjEHPYG82RK2300O8rUIvFD1BUYRLkQRHeRkJ+Zn5OLZnVSzAm4hxJC2EyiEEr
 PJ9ZTem1qcugOmSDHpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280075

dwc3_qcom_resume() disables the wakeup interrupts before enabling the
clocks. If clk_bulk_prepare_enable() fails, it returns with them
disabled. The next suspend returns early on is_suspended without
re-enabling them, and the next resume disables them again, so every
failed resume leaves the disable depth one level deeper and host-mode
wakeup is lost for good.

Re-enabling them on the error path is not safe either: the
level-triggered ss_phy interrupt can stay asserted, and the handler
can't make progress while the controller is not resumed, so it would
fire continuously.

Track whether the wakeup interrupts are armed and make enabling and
disabling them idempotent. A failed resume now leaves them disarmed and
balanced, and the next suspend arms them again. Disarm them in resume
regardless of the wakeup setting, so interrupts armed by a runtime
suspend are also disarmed when system resume runs with device wakeup
disabled.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d44f093ac243..d4fda4dd81f6 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -81,6 +81,7 @@ struct dwc3_qcom {
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
+	bool			wakeup_irqs_armed;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
 
@@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (!qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = false;
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = true;
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -377,8 +388,13 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 	if (!qcom->is_suspended)
 		return 0;
 
-	if (dwc3_qcom_is_host(qcom) && wakeup)
-		dwc3_qcom_disable_interrupts(qcom);
+	/*
+	 * Wakeup interrupts may have been armed by an earlier runtime suspend
+	 * even if wakeup is now disabled, so always disarm them. On failure
+	 * they stay disarmed, as a level-triggered wakeup line could otherwise
+	 * keep firing while the controller can't be resumed.
+	 */
+	dwc3_qcom_disable_interrupts(qcom);
 
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
-- 
2.34.1

