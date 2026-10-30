Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341519;
	b=fCu3MxXGT62hNI/ZySlIkCd/TF8ZfxeMNfGfzuBI19qavAXlf8vuBmTRTCTLNF6V+NHO
	 y8Pl5p9IRxE5WlxxIzCIwATXTzuDAxbyk9dsp/iJ6wVtqdf0C2+urWxlAg2+L96/g+Yx5
	 TOqMCB+khwTER81d0wN8NIYdgfJIiObIXEH9wIz16yXQ4ijBzJUt2j/VTUgS9Wdn0AEvT
	 xt80d3QGOJ2ngDCqfuNaBIiHx15b3kqGWiEGucmsq9zrWkrcbVRSQ0bZzJ0yKvU3zOIBB
	 PDA7dZJKVThTPP/vH+F+FCSZzO9wKBNYhoCh3zU9DVOPd/1wlDgo14tntJhOQkm0IQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341519;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VAkmBFj52Y9xtSVpZvMUsO7qDuuRN4Pc+cof/1IaOb0=;
	b=EA3sy7/36bY/kLKmnzw1RIzr90iCzzkrxt8886SLrsD4YVcSx0rZ+8sm8+7S0OBNte58
	 5sJhPgMJdAf0HvgkrwM9a5nYDMwauhBLnOoKFiXsyrS5qS8J5FuyJy5R2E5D1/mQRfXNM
	 12gAeTF1PG4Nt6/5w4RJr75/e+XkiLu1LuTMs4XPQ73H4xwpfZButxYZlgh2HXgkjtFyW
	 WFUcCV8XoPpyBztFAwcgA4461kf8V6Loo+XkGhlEhSMtHJWA7F5rwvJ4mSbS/fEMxrFo2
	 1G6nUWLJvg2RGvscsR8Nfqls0zmlJWQ9JJ6o1nCEY+Kq/4hVK4IkQP9Po76jKD966xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=peQqOITF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KooWfM08;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541F5606A31A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 06:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 541F5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=peQqOITF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KooWfM08
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F8CX2913244
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 06:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VAkmBFj52Y9xtSVpZvMUsO7qDuuRN4Pc+co
	f/1IaOb0=; b=peQqOITFTayWRkOgPtnOet0tJYgUDdl39HTFf3YNBGMEujppnVA
	1hDHjo8C0C9/eX1QKs7NTEUZNNSXARp/4n7Zami0aqIgSVqJUeRlHYNHDPfvaXtT
	V1pSN1FjGo60lrbKzuPsqz8D/xUUMcYoTk38wjTDmrMIoz03rRUmSO2zYmilKV0D
	xel8uvn6B99hfQViOlK5CaDuQiqer12dc9c/8cNAqTTTk5t7ggxZo1aes32X7IB8
	aTckBCaHhyWNNC4jpzR/2reqt5nBMOvy+ma7zJmGg0pKLZBLv9BbAtNDc0cQR8Ah
	EUyhcl/6KI3xqcO5+G1/9XBk5npM6NI78sg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qshb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 06:25:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso212352c88.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 23:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341516; x=1793946316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAkmBFj52Y9xtSVpZvMUsO7qDuuRN4Pc+cof/1IaOb0=;
        b=KooWfM08kmhZxxCjbEV5DN7AI+zAsGDo3jMHIDyLSYd7N88TQMbuFMzXs1vDM/FVcH
         s7At08xcrhWsms/whkAA9rY9omm4rtNaZ1rBTaxsJyRBEAi3IPFjE5PcsJRKXj/t0D8v
         IdRaJzG/Y2VvvWyTSjceZRfAubhLYazw8aityaOcxgN0mYHPWt6ZhkBCcBLfst+wOWLo
         Yfv6E8yv7WFYkzJPV95zCO/dnkEZKNF4z91xE2SxzuJnf+3C723IrbD5FhELmPbKrb8q
         ZG6+gIFOmwqfujawWVLZKa/BZNc+6TOoPrBd1+0OAKvUHRZgOmjAIlTMlonycZ1t9Me7
         vjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341516; x=1793946316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAkmBFj52Y9xtSVpZvMUsO7qDuuRN4Pc+cof/1IaOb0=;
        b=gq/3eEgEUOv+oY/1kKe3FeXEaWab1K3ySyBfSXkjGzohmQgW9i7gxAodyymA4k1Jvo
         SFrwGcXMG5f0XWI1jPU4eL+8YU2UWkfAKjPCvLjtlVVcyxd5oH3+W9SiEySSlJ3F04bS
         WuUTrwpsI8ux4GsDvbeRHB7j3SsC9hrJ2YrNeVKZvVbBQlCuWYCovz/yCNkpjk6Mp8X9
         +47UTP6KUectB1hzLYIC2iMVgAG4fI8b1PlKtZEC6iAZvpCzKYDdz6wzC66fK+rmfCV7
         ZuPfFbOs8oaxbijOiGvNC1kDSM8cH6/1RjuaRXaV/EjUMLiXLeY28eh8Hds38mpx/w/W
         OxvA==
X-Forwarded-Encrypted: i=1; AKwUvByDBrNK6/zomca1GsMPaKt0ungVFIfNcuqZK1K4MULyRcRlOlAp3s0XL1ehfQA8uszNn249eo5qYPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmZSbcbOTsyX1ZuqO426Mbv9YG6KAF3yoyxkYJ5Yqcmr2fH74r
	rdKMUjODgMmupIdIC4tqSVJ9sTBE5O5nuDZQFl2bfIaqq/HOu1eRP8lJYj3YP35f4fu/xHJMYMA
	8kDb+ildVwO9KldrNOh5ioSWJEKadL9qxBIjXJ68f3cDOB7YxMP8tYCx614z3w50=
X-Gm-Gg: AYBFou0UP0Xi8TZusrdei1QSQ8O79lH2/v3f4q+w5vUCkV1+AHHYaNu1ZmHjuqm6AIU
	+2vUAOBw90AlfQJe5xMRZaxfQvix8xOOUZBBMyzMGR0pMCW6SUoX0+nOrbCM7DZUn6QefqyxX2l
	Bl4PZbgpiWjcbu2CyAdZZ3F8nSYn5qvAXJTEn+enBAeSUhptusyW9ORhFsmIrCXCzhQPJ+6IBtT
	Q8W/Q5xHBOtXabGC+xeyIlGDu9jkOq/fYFNkH3OmQD+HqhE7fw1Und21KhJEatZ1AE+KbnUo5sI
	0Lp1z9FrsO1ozzPsNZoLgWHL72FjyXnprlvGjiTqHxrbWsmIcjOppRCkkBxwU8HLyMTTCqOv5iE
	xZzhcH6o8zd6pSWRkmEBmd2VBcODiLS7U5IdDkjEkVCWFdB35Xo1+aWVVXQBbSh/e/CpjBAXEXe
	uD6O3CNo5UD1g=
X-Received: by 2002:a05:7022:110:b0:1a6:4679:6cf4 with SMTP id a92af1059eb24-1ac5c64c790mr2794343c88.36.1793341516224;
        Thu, 29 Oct 2026 23:25:16 -0700 (PDT)
X-Received: by 2002:a05:7022:110:b0:1a6:4679:6cf4 with SMTP id a92af1059eb24-1ac5c64c790mr2794294c88.36.1793341515616;
        Thu, 29 Oct 2026 23:25:15 -0700 (PDT)
Received: from hu-uaggarwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458fa3sm4655443c88.4.2026.10.29.23.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:25:15 -0700 (PDT)
From: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Subject: [RFC PATCH] usb: dwc3: wait for USB2 PHY clock recovery during role switch
Date: Fri, 30 Oct 2026 11:55:09 +0530
Message-Id: <20261030062509.3475322-1-uttkarsh.aggarwal@oss.qualcomm.com>
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
X-Proofpoint-GUID: 6HvTe4SQq0eawUnuiV_bSgD5_r1aU8YG
X-Proofpoint-ORIG-GUID: 6HvTe4SQq0eawUnuiV_bSgD5_r1aU8YG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXy7ArDC6UgCy9
 uMdDh4LaBwm/lxguf0DrTdjnwd0TbG37lakjf/9dUUCacYtTazDeiLNOKY5dH3+pusJcoITqs8J
 SMLin/oDTiVmDON3zOYK422Bc/ushJ9lNC3ylOBS+RFH7LhKzrFV2YqZ8lCxLQY/QsFLUFS5dRl
 yvHNnqY5mSSC6g+OZlIFqeYiaHZMCQ4SANpn8b6BQ+ZwQLM+Q/D31REAbLS32uZHv1Ut8kbk3gk
 lH2TvAknkgY2XEoxMQhsQjInOUC+BPpAJNAM3s6gaSz1YzEOiBiFUFCpE9Fvjky8fyYa9dq2Ob/
 rAug5kZUO9Rc5c8BQJ8YZaSiA9uJdCF1+6T9KXaUZ+9/euWOrXPl1iCBHY3RpkxkYz0ocAPpAd/
 H9aGV/YpvQ20Aq4CvDos/lyhAhIhM6YKvhD6iqAhAJdvJ6vpYMV7A3Kfnpq5a+JPEZi4MsOt0Oh
 HzRV9MaFPJGSYCHYuig==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4384d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-jmU5M79SyYRcw0d2-IA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX9+a8kJNw2ZI6
 Wr2mhew8LcAB7SvQTbfglRvQNDVzm+URDtkCsvYZKuV/TFiobWFZB34vGdCy1B3BDIMNimd8jsv
 sbBr1X7+V9LlligqVXIVpnIiJVH9xvc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

During a device-to-host role switch, the USB2 PHY may still be
suspended from the previous gadget session. After clearing SUSPHY,
the PHY requires up to 1.5 ms before the UTMI clock is stable.
This was observed during a device-to-host role switch with
a USB earphone attached. Traces showed that SUSPHY remained asserted
until __dwc3_set_mode() cleared it, after which host initialization
immediately started accessing the xHCI PORTSC registers.
The USB2 PHY specification requires up to 1.5 ms for clock recovery
after exiting suspend. Accessing the controller before the UTMI clock has
stabilized can therefore occur during this recovery interval.
Wait for the PHY clock recovery when SUSPHY was set before switching
to host mode. Avoid the delay when the PHY was already active.
This change is limited to the role-switch path. Runtime suspend
requires separate handling

Signed-off-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..885bb9301866 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -233,6 +233,20 @@ static void __dwc3_set_mode(struct work_struct *work)
 		dwc3_writel(dwc, DWC3_GCTL, reg);
 	}
 
+	/*
+	 * If the USB2 PHY was left suspended (e.g. by
+	 * dwc3_gadget_run_stop()/dwc3_gadget_exit() during a device->host
+	 * switch), its UTMI clock needs time to become valid again before
+	 * dwc3_set_prtcap() flips GCTL.PRTCAP and the new role starts
+	 * driving further register accesses on it (e.g. host root hub
+	 * PORTSC writes in dwc3_host_init()).
+	 */
+	reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(0));
+	if (reg & DWC3_GUSB2PHYCFG_SUSPHY) {
+		dwc3_enable_susphy(dwc, false);
+		usleep_range(1500, 2000);
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 
 	dwc3_set_prtcap(dwc, desired_dr_role, false);
-- 
2.34.1

