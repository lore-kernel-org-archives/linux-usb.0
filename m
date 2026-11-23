Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430890;
	b=1GuEhw1HELjCMJxmdbQtkkN5sVbPBKn5l6dtMo/XGzumgWGVJ5DD5Hx2tiL6bgDyN405
	 pdUI+axKXzrVxCTCBqhSrhx7HscDWmQavcHq037VtT4ebCHDTyORwY7Psssk8EhrjVAXs
	 DvTsJnbEe80w0LuL41YcyHbUK4ujnU/AnxR7ADrdQH4m3KtZ76fBuqiemeb3t1LPocNgZ
	 o1KUUSt7pSaiSKjyOxrKuKb2jyBbtwvTfpyzbNJWQPDF1fqjB4dOsFvFgb0gR1w8bQeBO
	 +By+b3E2htNVfbeMIxJYuqbdH2t0YVXmhNN0d6L5BlPuKSVbv3FO54Y53RYWMMBDeGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=e4rxHmb8Mfs2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=;
	b=MsR2fNdqtYesz+gphkzGwjo/vygQbOiQTgg9HIOtpbpV/B2wXjw2XNACphRqthqsqZ0B
	 TjHZCcIKugIQekDpSZv0ISP41fQ7vBnAvhrnfz3ozFgOk981iu52V2eQytlmgR39tswpY
	 J92epj5zJX/C32BF+NdsOrFcqGOabXrWw02ryXv7jkuM63oaWe20pQHerAeLRRN7Uwy6/
	 0xH9O6Ku+4U7QRWi0EJOL47hpw6zReHoBmiCf4PLPqUPOktU4RzAACJTkFAFjvsAnFusi
	 ye3NtMAbG+icyHedIPcroDzAMTwOcDxYM/8ox+7L6isb3Q+nFVLz/13oR6GbQqrk7fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Zd/uHTvI";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PBWMIW9d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2BF606A32C
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B2BF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zd/uHTvI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PBWMIW9d
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FwXv2528090
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e4rxHmb8Mfs
	2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=; b=Zd/uHTvIdICT+UPLuXyWg2CSkE6
	82I3JHYoho6ZjBGRlAy7vgPsHfLI6PdSg4uz34ZCfwunmd56MRrb4z3SaPovarQT
	p9amf4bbJWW/TgokESA+/G5RA2WmLvUgJiEL/bK4yhnA6YUwDjwMPMnIrvLwxodJ
	MPVDybGz5UtSmb0DKKBFVDPJhS44LJcvmRLci3CbyBf4jNQeETkhEEkaBYzLMn3p
	pgSTmkmWncJFwK+Z9TDbLNWJUtQLohQJEpuu2zw0AAW8urVyPRyxslFXEqknYzJC
	gCBvRaAYMEVLpFznOqaXOapa2Koc3iFn/w8tIqjDr9gvBUK+cKlXWAi/Yjw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7rmkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a073778890so2533486b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430887; x=1796035687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4rxHmb8Mfs2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=;
        b=PBWMIW9d8wVVMtc5ke71vIOwqGX9EL2Ohj9DBbwULHGwKI0oYcBQEKEXS0lyliKNxw
         00i+Gc9Eb/K4Jj5IaR//NQs7eqFWQj/dPy/2p+UqzgoCgNSjKKayDfn+DMmlJaVbRzRS
         WbxkE6+CwknrIEziXzuYRyIJ0wtb9+XQxYOpYBS5pXm/jN/pHvz12d3iZOOQaiunQZ6R
         XXA7BFzlIZ97T2xagjxTtXz4+rsgAh7jpAN+9Q2Q6mrkVmxHQjpqh3EMhDRTqQFTKtE6
         onDEvVzA8Ca/ZxYcUmYuw5Gus1drooem/LV7Rsse8mEPvaP6wVuezAQQ6K0r83Gxsx9u
         3VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430887; x=1796035687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4rxHmb8Mfs2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=;
        b=kqcD2PzMMNpQiKPpxSYunXBF0+Gr//izQecm9ZAsQHVkV7GedPxsJupnd0/k77U4jW
         1mpAok8k/Bn1nRvLEzAIGlI+c+SqQ4aQx/9GRpqo8YSdowD+lmlzRZeshDyBMeqzbH9p
         70d8wTlJEg2ID+8EF45SqtI8NBIt6Bk5fMdGklonu5sKjSpFGwM5OJPV0Qh1beIdgV2D
         Ip5ABZE/BgI9bGz2WFl/mQJVAbuvYmbWSP3vw9BTFJMraxPnEgylWql0OuUl/WyCjBDR
         6BGWMyCh/QrhEgldPReH1YkVcCyMNWy0AuyuZlpcuf5jlqmkYEMGupcI5xYZY3A9hWPw
         326w==
X-Gm-Message-State: APuU4Z+WYBYcNXedDUoONojEVQP3p6u6gzqNQV5mzBCiVrhH4OB9/cCi
	fNS+BQZSVIdWBc7ICQwwssEKrPgIaEYLZk0vYPqPCj+x5ifeQMgZv/cidpjVXEwUYBEhD3gt77v
	MNkC3PLy1LOoFpN8Vtf+VqIOI7uS2KL7XgrGBEn7tBoJtxSbVw+o/XNmGpfHyy1k=
X-Gm-Gg: AZFdTZd4nHFZOHUqbtg7hKZxztak3+VbXOibVhkAS7stuEeztHxFM9A0xN6FNtHd+Nq
	pfgQH4XyERrSioiZjSewl1GlA7TLEwd9tLiliW3R/sXiJpjqVguthL3kjhCUKf+RL7frpdVlDHd
	LFzYW0Qmqxd7vwWrdXzrSXtk3GL9AIfE5q6RztUno03w2ikvj0NMKWOIB+2O1eTjyFe1fh3Cs7e
	LPTJQwkNXyr/sWuAlYwsUzKwn6sFkq0vUClUFfhj+HFVQQxqwG7rptpJpPDjkycCZj94OlFQ36+
	qDx+otk/q8VDQBRNvO6+gHGvoiBXQsZW8HSzNsO1BkcMDdvfXava8kXVtbp2eRqWzbMLHISs1Il
	9RfshnpwjhRblUMuCKUaiDZE8jyi8SNzhJZAmRxJXcow4UG/Qek/TtA2Ibj5iZkzcRBry1RDxsx
	K4JwJfJg==
X-Received: by 2002:a05:6a00:3403:b0:8a0:3307:c46c with SMTP id d2e1a72fcca58-8c87cb4678fmr9206454b3a.36.1795430887507;
        Mon, 23 Nov 2026 02:48:07 -0800 (PST)
X-Received: by 2002:a05:6a00:3403:b0:8a0:3307:c46c with SMTP id d2e1a72fcca58-8c87cb4678fmr9206445b3a.36.1795430886923;
        Mon, 23 Nov 2026 02:48:06 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:06 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 05/11] usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
Date: Mon, 23 Nov 2026 16:17:20 +0530
Message-Id: <20261123104727.1539149-6-faisal.hassan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0419e8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=A6Vjp3zFaTA1NjdqV2IA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXx8au3gb/bV7+
 YITdb4E+OfBs1ALG6F9IqhlTFK8acC7FzQItq/pgruaA0djFxtTtfURdzcMelZ/YhXgBq7sUlXv
 5zWESLv3QA8cR2w6FdkgYT4Zr4sMq2VQgtJHGZMCMPjSe39a4cqBxXxKwvlJ1A7ck1JDMjDFFKa
 L1pkuf4kPohcKM8QrbRLnZlhAH0Hcogws8RiHn2eTI1Gzxhnvy7cZLrvx8ZML2/26tMd/sWiXTD
 hsOaExreZrGnvNym5sNrowvmDOnn7jNfqGeh7ThWX/mL8W/vllM8R0yuEAnFTYiclJjFytTUR2q
 lHlkBDbbNP8EdHzXZH3yowHFkmQjDNi4V0mX/Lecezx9QLGNSenT8jTQIMDZVKg0quteUAiUsC5
 T18R0Y5Q9MiqUYLo9rDmYdW3slRMmh6C1SRh6qp9QnuoszuoQV1W4XBSPTqVgpJMzg1zOGH6fo7
 eA4iA7Dyh0NOZVOZL8w==
X-Proofpoint-GUID: Feydmhl4qLptk13XXNG9c1bd_4Amxtt0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX8f0SW8uOEY3l
 QTZGvhgtHDDWSZag6J5tZFgCO1/nhGRtFdu8NPRT+vdC8bwpRv+Hw4/Xu+keFIwEPWQ648oGTmm
 RSs1KTxMVvmLnJZ6qXz7upx4ytFCjA8=
X-Proofpoint-ORIG-GUID: Feydmhl4qLptk13XXNG9c1bd_4Amxtt0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

When the USB controller loses power during PM suspend (as occurs
on targets like SA8255P that fully power off the controller),
it generates a Host Controller Error (HCE) on resume requiring
full reinitialization. This is handled by the XHCI_RESET_ON_RESUME
quirk (introduced upstream in 8b328f8002bc).

Read the "xhci-reset-on-resume-quirk" device property to set
XHCI_RESET_ON_RESUME. This allows parent drivers (e.g., dwc3)
to enable the quirk via software nodes.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..0093ed24ac3f 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
 			xhci->quirks |= XHCI_SKIP_PHY_INIT;
 
+		if (device_property_read_bool(tmpdev, "xhci-reset-on-resume-quirk"))
+			xhci->quirks |= XHCI_RESET_ON_RESUME;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 		device_property_read_u16(tmpdev, "num-hc-interrupters",
-- 
2.34.1

