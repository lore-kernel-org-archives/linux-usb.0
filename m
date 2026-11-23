Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430874;
	b=G49TVPFrQRCeJixC3ReaVkKfh4+mCuDfNURaa5z4fUx5rW9fYdH9h5UHtPNZGY/8CNlr
	 tyggMAUsG8/wYMRtTH3IZ0ubxDecog9vRtEs5oaQQAOJsQubmfbx0R07EK/sZNJJNzDs6
	 DK1FSC0abJkQZdw+lI0MMqIyqMS3ZMeRM/7tRzzujMon5YUOWfFvi+ez3FgTbiiT/TFDg
	 VtgipA0nMVd6IO5+dL+zhqS6npRp7VufrpUMX16lJOPClQtBwEKjyV0RqLPallTrraFSn
	 k5aBw5Oyc9j3CJ1aYj056n/vZ8cO7cFVi8xqf5W1F2feKcN5TkhKFxiK1gaMd5sVI6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZkJ+rVwIQ8v5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=;
	b=Qqb5Erix3ALC9BqHgIS3D/imWyfecH68mblvPefPUguFkPJg7CPAyWQqIL1UmSw9JsQb
	 zKdEzpkrXEMRgqmpSej7MP2HxV+EO6/DECpiN2SyBu7RHgUqaVlb4BFHDnfYZxabN0C3+
	 erMfwbAD6Um0wdBfUT+Hif37tZ3c8HALcj5orXEfms9woFsHbz798A4u53HKW2PvOoEPm
	 NniU0U4iRR4S0lzb6Ut1SC3WeynHlDFl3smnTSQmeTDHkjNk8FnUJnCw6TIhd0IQirTRH
	 ZNJZHXEKQ4Zk6Ts1blyGL9iDe8J60Fu2paeURYmt1KD/rn+MXymUxekVTqZIO9neaEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SvUx0kdM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO3ouOOM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03CC606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E03CC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SvUx0kdM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO3ouOOM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FtB4917066
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZkJ+rVwIQ8v
	5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=; b=SvUx0kdMi1jka39L9W8Ygx88qBU
	NqPK/oy1EnLsd6SqYoGFnI6S81lXgfRHWu+xA370ukTljdIusnvbfPgXHePM3iwz
	7wbwZH+fOz4CYJMuTFpTfOilqY9srRthsQxJSTPzRLvprmC4b4nyxhQzgqiy98Hb
	uqjEqJ1lSs80d/1U9IXQVEWFFxcIDxjnNSClTQewUH6W4xtYFOpV1sW2mxQfMvnE
	ZbM6cZinSO4G/Fr8cO5I4UTPyPuz7x+puL7iqV6DmBXKtyFo4d/xluFz57OvFIYq
	Aa0wNiyDsuxTT7ALOh9qYpf1byG6SiMwjcjTogHTd3Iu7DzYtv/Kf2DfKHg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a0xrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:47:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so3380645a12.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430872; x=1796035672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZkJ+rVwIQ8v5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=;
        b=NO3ouOOMsGAKQqxhs+kP3wMese9Vw+36kTahtMRgUql1+Ipg5oqxJIaRelOEjdreAl
         XmR+le0UZldZSwyY8WJdwl/m792t0NYqvcBX6m0E2YaOqvS3AwtUS8W7cF1I0sRvGRVu
         9vgFlXYvD2WuslI9iDI4SnZ2fgo0QRFsuPWy1sDY4Qk9ZApvZqwUcfFB4jiDzXviTKbG
         Qa42+xteBWBJwPezLIWPYAMrIa6OUOXKzEMSkup7w916LBDoCH5Dg63mNG2Fduq7CT4p
         E0O6+ut5H/KwSN/Q4cBepn9hOP7lzjAtNQBS43XN/6mgLll0qavESVL75GO7SxTV9OC5
         XZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430872; x=1796035672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZkJ+rVwIQ8v5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=;
        b=C/mNSl8Y0S6SHbGuR+jSKqW1SU/DZcFm5frbDr+b+OLKJCzlXaAiNiYpPKL1tRRcLG
         pNPTW4lIRTod7VtBSpd52uTQrAm/7jFLMn4PWZNk8MujPve5wFAcKPpleRgS+n0zW5aV
         03KaT1BWEnPbL1DXbRkkjdyvVMUE1iy3Db43lN1jtZ6JIK+Ig1v0a19WkJM9d/Suq6h9
         7Aj1AoG/nRtoycrec/q40v4A4A7BZx8aW8onAjRUEHZ+cgKzqVfn4AO9g5/7KYhUiMX6
         pTgo/pITONDtPZimzDo0EYPJ03Bfcxn6L0BNvFf0ml3BbjBYwNJYf8eYGJ+auVrQQZoh
         wOuA==
X-Gm-Message-State: APuU4Z8/bkmuKLjgZ90/UjaHfE8di5fy1uaN6ERKios+2BdLlp+eUN8W
	Pw1FgSfcxLtXkR0GDTI5qFCNGk0icgWqgFZ/iEJcUQLM84lPBDr9U4O5EdfWi6MxGFgBwCbvw1e
	6YgJKwolE+5EL4VMg+ks8RDszxY7EwknLGHYEJ2dOahd3IdIms2H5hWXRt5bs260=
X-Gm-Gg: AZFdTZdyKcxlklpWx2icJ0j8QpNqaFBGnevPDEy9w9gtjGLM+tepQ/M8iL7ljXrCRK2
	+STqVojoBPY3+MYOaVm0LWKi871q14OEpTNf8hh9qJlzJxrTWdt1G2RpGyWryusQALg2bf8scCe
	7Y1zVqB+aMgAK6uN/xamfZezSAHjGamyrR1Z0CyMp38yKWWZhf1UwxkqOPZbJgp742QHnnnO9hY
	8LYFtO7cOFXj1T82sFbIe3eFJQVH4BbDwcnsKxzTocAL1JBhYmrYa8FJSgDEkX0LJzU3JbLbTZq
	/wV2/YnAYN11XldCgjM/A2x4ewpqRR/eOco6H8pUv4lGaXJ0a/aeN/TqXb2OPCkC2zA2M1q5dFP
	z1W7oiUNcWy33gh728ndbK52FRTjx3nHKusQ20y2ozHa6Vn9dOZaPVgcKcCd7CkM1QzAMybIc8a
	oJLyi3oQ==
X-Received: by 2002:a05:6a20:258d:b0:3f9:9897:4bd with SMTP id adf61e73a8af0-4014da5de2emr11243521637.57.1795430872451;
        Mon, 23 Nov 2026 02:47:52 -0800 (PST)
X-Received: by 2002:a05:6a20:258d:b0:3f9:9897:4bd with SMTP id adf61e73a8af0-4014da5de2emr11243503637.57.1795430872028;
        Mon, 23 Nov 2026 02:47:52 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:47:51 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v5 03/11] usb: dwc3: qcom: Keep wakeup IRQ enable/disable balanced on failed resume
Date: Mon, 23 Nov 2026 16:17:18 +0530
Message-Id: <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX3flTCd2iGMhu
 vjcwMakSTXQo0t6I8pi3NfF2iigSfCAlgoUir6v2CUmnq8GlallAzsV8WCzXbNcMm9hKnu63g4E
 +vxMe0Ii7rE9fFa+PsqrHS0tVxWzuUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX6q7k3WMbRnkP
 iaxZPK612MfIjtRvzVZJ4u0Rp6/CyLh/VmZvtJh1TArE9u0OqbPoLO26JSHgANQ3UwUTJDjzLWN
 /FQLjMbgH/hR/gytpNutkP1U4RiaDOktm19mHxVIq/kBTCmfbaArPVsCwIfoimCOhClWSlPvXIb
 9lP6SU8IMjF/mpQ0fT+WM+PzqsmJLvMDynUhp2TVKh2/t+orjqPYPrtT7Gyww3ODprZw6B927kW
 PLuLDUIbjxwTQ6EB25GVsqFePD+ad3wmEagVNY8gnFu9rqxSno/pW1EHRJwldjJbo8mxfAm3kMh
 9EhdmdLYxLxIxOAcTcy43SdFHPwUar6AzO1AHl+S7RuyLbUrCb/0FCjL0A2pKz9+h64uL7t4oX4
 ufhxAu6wl45Md9opqchyND7p2VUHp0JS1qwo6h4hDcpX9s5KfjhlesLhA7DtvUdMq/EjB16Sspj
 ZwZHRAhh1KuLsERW1iw==
X-Proofpoint-ORIG-GUID: Zh2kgYwD4HFmTWQ3wYlTPG9aaQFz8YyR
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0419d9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=zjLylsKXzqFT3lpEvI8A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Zh2kgYwD4HFmTWQ3wYlTPG9aaQFz8YyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

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
balanced, and the next suspend arms them again.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 18db19cf2065..e7fadad9a4e1 100644
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
 
 /*
@@ -396,6 +407,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 	if (!qcom->is_suspended)
 		return 0;
 
+	/*
+	 * If a later step fails, the wakeup interrupts stay disarmed, as a
+	 * level-triggered wakeup line could otherwise keep firing while the
+	 * controller can't be resumed.
+	 */
 	if (dwc3_qcom_is_host(qcom) && wakeup)
 		dwc3_qcom_disable_interrupts(qcom);
 
-- 
2.34.1

