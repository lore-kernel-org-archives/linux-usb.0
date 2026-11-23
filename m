Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430904;
	b=WGPQ0mJTX9C3de7FLKE0VhyVpzSu8TdG6Jm9pLVtlP2lrfyVZVD/rk3NF06Fm+wJBSCZ
	 fNSNh8tXM2XixELWmTBW31A2h11ZlT069Kdoi1siA2DqAxd41Z+FWheRLlbYayBkmVao9
	 0nZFjYxXMaPvSrALk7vT8NGvD4FReS8teGZwg71XymR+Gy/j/xXzUo4YI4HybndJsjW2k
	 Ns+5g1VZWDeGwxkev/x8m+jH7sYfz250kD1iCGTeOkd8rUhkWZwLTQfwnk/RjAx+pFktt
	 OM6Y7XluUhicZnQlHmbTD3t/VfOX6lGH8XTi+XEnTG+8AACjz4J0oGCFarZN0V+jnOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A4ZZmj98b3JyuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=;
	b=ymppVVWLI6sBq3Sa16b2moBaig5EZmkpm9WszkrBbZH5L1m2hWEKkduX3evMLL7CEFTc
	 6wXbCmKqrxs34kQ1l8yR93k2MtZohJej3oJ6z7PxUeQY58YZT2UUTfPwHVTdI4qCf7GKf
	 R9w/X3nWQQzCYqCYCvaQgG/ZfbToS5gnX+3lEjPE/WzRY3KAyn1Pse4fLIiMsAdTWDMLp
	 FTv1PP/nZqUEHRpzuBMgaA1y7aIDphR9XAAsniI4UHikoGuo2kHrg2Jv0Gd+z1n9ywJ9+
	 lpo0C98yhF56Xm6eGfaWLxBPGtZnqbXtUIyhIQk8bpFl84LUsVszMqb1TTOHD4+dLvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ff2TL9+f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ix+o1GXp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD75B606A699
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD75B606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ff2TL9+f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ix+o1GXp
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fnf42785428
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A4ZZmj98b3J
	yuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=; b=Ff2TL9+fT1OKjC5ByaS5VBM+lk4
	JW1cagTu6jxe/QdjF6RMcrSjg2LdOXRZtUZaP96WaW3gL/zZ5c1o1sypCjrJhmSP
	UA+P7lnIA/lj77KrD/5pg7hU7Vg4CqMIQMixCdPhIW5krXwL8otD4uZ8GtUOGUXO
	pPL461NhttzWo8o2w5qjo4aQO1nxh1/Pq1H0XqGeumv7U8Gv0edyA2qZWzNaihjd
	RaZQz6MjZSrJ5mckhGRfCoiWIMUn2+uUUIGu5P8oxTcI1OwZgoRvR7GUw0HgwOMp
	UgsKvPnPw5cMOw/otubASA3TYkvm9/Fo8ClNA47/DkZVxUFMEgiRYDvWbZg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd114h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd77f53db5so1624940a12.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430902; x=1796035702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4ZZmj98b3JyuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=;
        b=ix+o1GXpdBNeZ2vgOzSP5/Y6LmN3jxNGdFDMSJgqc/372T8pPlCaKLwz0mYlU8Cw7P
         c+6xwFVM/IlEIRuANgLj84o4HbFynGBy/O5sKUukE0MPVcTIW4IwdQs038N9/IKOi7aK
         3h7+zZJS2qrOEMXsK32vfOdBFbfcCjNPEbriZvqPVTCiWJ4uNLyUionxKc5d0S686pmp
         xXEZWQuo1CDUzrpOxHZTNN4CpYzIkuZn0V/57+4OzpzrOIraQ+4JrvarCywY+qIPouL3
         jsEN8FNQEqjp7fzFk/tm61IsEVCut59/p1wB0PJJqKqgeIZiaqKNTyBWkrIosFHH+mkR
         FqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430902; x=1796035702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4ZZmj98b3JyuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=;
        b=1/0x1P5zCwCg8ssHdDLgiewTazkIBeUhiV004turBrrYuhmgqHQ9xr+7MKjP44XUey
         ZtAYJtLV5d+7idOOpMPP9a8JTQOqJa80EEXONgbm1W+WIoR/0FtWZYoWpKExQNloFcxK
         BQw7yZ5KbIZCcgRj5D94ETOtnkCMVIuAHP1XkpnUpb+iU9nxDa2OMCQ+GIr4EKyBbOp3
         D0dEpx+CO8WAAQTVjQ3arJ3lO8Qa37VEAw/khSRJOMEfI86NTVolwEIG7ZxVvxYG1J31
         gboEW9jOVr0/ncq8Lc7gEDNdGwIi6K4X195z8ScVe2/g2RoOGLwAxAtlYo/KpBVX3tq0
         xR1w==
X-Gm-Message-State: APuU4Z9nbLrltsINIwG1ajTMK7QxbTbLLQB1JUbRFHF1slkYN7N9PWjD
	tvO5po3gWmAIFdRI/9EAyk48LkUN5p/XXbgaksZyzknzqMf0YBYsxUcTj6HT23TSjb5wdwnVjpc
	sSYAWbI8jxIfJcnnzGIiW2X/n1lXzclIOzBmQniQJJ6sgLyWKTA7A0pMzosfJ6Is=
X-Gm-Gg: AZFdTZdVmdhVvY1XpyFlCiwipOdhZhK8SCiI+CquPXsQBWYyYqPUOO3bhGtMNiKn/f3
	Y57ifkIrBHwHcRdRP4OdqJ6yKoGZZBdjfP2Jc884yIpsz53ZGvpuWryW3zcqnEDJ5N6Rc0CGz9j
	Ae2I1BLvexT1MMsCqKuvdRbI7n0vPPYie1/9t6GqkqVQyTmmC3fyvM26TnI6VZQe1Hgiv5B1Lln
	d551n9zY6LUNRvIWn48FLZ+BAUZCX9nJE4AR1W14+i16doIZpfQB8f3uiGya1GFHYfLjfHxE+SY
	QKaIISUk11zvXVawcb7+ZgvF1R4cKz6recMA4SX7rNOIz+CzjLKxwgnO6CYJceBP3KeEIfx2oYB
	cch/7S3QFmJVhyGFnomBOVdf8N0hQmP3kLNBAmO5WwoTUw0I9dtRjZDEGq97vJnkgPnrUUnl2bs
	Rg9Fuzig==
X-Received: by 2002:a05:6a00:a117:b0:8bf:cc92:55c0 with SMTP id d2e1a72fcca58-8c87ca5202dmr9115258b3a.37.1795430902441;
        Mon, 23 Nov 2026 02:48:22 -0800 (PST)
X-Received: by 2002:a05:6a00:a117:b0:8bf:cc92:55c0 with SMTP id d2e1a72fcca58-8c87ca5202dmr9115252b3a.37.1795430902002;
        Mon, 23 Nov 2026 02:48:22 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:21 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 08/11] usb: dwc3: qcom: Restore VBUS override after system resume
Date: Mon, 23 Nov 2026 16:17:23 +0530
Message-Id: <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Hl-CsDmWiOrjeHkv2YpgDx18QfuB5Raw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX0eAsJFm1C7F0
 wGflFEkw9wGBPMK1qU5+2cpsTDg7xokDx8igSbSkznibPP86QUO/qKMpfY0m0vGrs4d/XOeFxfr
 JG4q1zREsPKtUUhVK79pUb2DVMonXLiMDSHQLxk++uh9reWjM/lnuxZnFwdWqD4kodgYCHGOnGv
 L0mOaYj3SPEEv6T1zD8xRgZBpLLRWqsDlfwpfwZw9//5U0dur96fAgBjATvqB7Sa86UhCdwFmIu
 izWaAswWa+OLTCd388Db8gIF3Fzx4/lFIELHKg66gbhX4pU4wthF03OkcJLSsjIASWHaC0IXBff
 pqnIGUrYVPdGqRIuJCZ4Bsje3g3+loZ2SU34R0UyzcG4E4htPusyxQ7U0TVsGcXBlNVu9ge0VgX
 DSVoLwxho2T3N8GsS5r8gj+Qzpu+uobYzGNFXLmtxBjQaHA+KNacd0l+ncuz2yCtAzi1aw81iRi
 Fo3+Kbp//5rEiB4cybQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX+Di3hm378Ylf
 0VcOLHK0BWSpxUTTtH2fRX/1xLQMaARBzwU4Hoj1oZ3r5QZiewITgKdyre+vuWE1hxAIPK7nXI0
 2qowA0gyiyV1UoTFXkh9PFSQPrHpOiY=
X-Proofpoint-GUID: Hl-CsDmWiOrjeHkv2YpgDx18QfuB5Raw
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b0419f7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=IFn2jvwIVmFqnHeiHmEA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

The controller reset on system resume returns the Qscratch registers to
their power-on defaults, which clears the VBUS valid override that was
set up for device mode. Without it the PHY does not see VBUS and the
gadget fails to enumerate after resume.

Re-enable the override after resume when the controller is not in host
mode.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 8e8d7e59c6d5..50fca06c83d4 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -457,6 +457,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
 	}
 
+	/*
+	 * The reset above returned Qscratch to its power-on defaults, so
+	 * restore the VBUS valid override set up for device mode.
+	 */
+	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg) &&
+	    !dwc3_qcom_is_host(qcom))
+		dwc3_qcom_vbus_override_enable(qcom, true);
+
 	qcom->is_suspended = false;
 
 	return 0;
-- 
2.34.1

