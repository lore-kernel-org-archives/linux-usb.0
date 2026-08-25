Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB1C348477
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 05:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787634523; cv=none; b=k1X0iibAkp+8GsfuXLHsVqFZ9OrXCMFhJCV3BEUQsCXRSwgkvk07QGl+UjM/RSoQo+3SfAJ8c9ai39LHz58+BZsMfChtldrIqVcbIiu7kmmFOU/1yqwscmgfrqLtLCmK8VLBdCNWpOUuwL49EnpdXPqv9Mm0nWakUPnYdzt4fcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787634523; c=relaxed/simple;
	bh=bKVyWC0JA2sBKmeI8R044MZu4rQ4yvvMXpcdkh+IlrA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HFVoCn1yCPOfqzcjW5Eq4on4nNF7BGY8Hm1YIdqfsoCe+eVpN73Kdeui+MaOZ90BBA2sMUMjbhyweFdO8E+xLJxx9M13S/iCHYAKxsD+RV8tqp9c5lg/Uoef2pN+0jr5Oq5Pwgierwo1rJr9tLSYVf4YLemShfJe9wD5CANIG6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mXvnAnTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcG0Djki; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mXvnAnTO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcG0Djki"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RMbn1633998
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 05:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gFx7jxzHqWJADEiBCOZtF0
	jm9jFO7g0TZHDt+OXlOEo=; b=mXvnAnTOBM9NN8TQHZDjDGgD9of0i1Nmrqk9IQ
	tzBseYJAvvTH45USJh4OtHDRdBIyQvbWBdZN+Qm5gNICXeDmqBtrM2/YDNNQmQQY
	X8Kkp568FoqdVcdZK5sSB4Pw+DHB88FcdPKDGaMZhghDe2VbohaJm3rfvGenWdVY
	Ysez58oDN2Umj6x7Iaw7UjnIRxyvCopDktmPUqz8C60+ZFZrDBppmO3oYHPj3TVu
	3yw8iG6KhWtlyhNNR7ojhVB5aQ5epv585HGToy3PyWsLMStDOBpYTskWv9R8LMRv
	1tZcRn0+bFRmYy+NkCgdkyeO7atgPlxMq1YUXz6Anv0T0L4w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swra9c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 05:08:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso6145809a91.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 22:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787634521; x=1788239321; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gFx7jxzHqWJADEiBCOZtF0jm9jFO7g0TZHDt+OXlOEo=;
        b=JcG0Djki7t0Mei0J0xu794/5tr1h6ajJr3IiAeIyZQ1JCs6gPO5rdCrVyFvNIwJRx9
         7SPcu+Sc2TeKGuHNJufBi7ZPYm8wx7cK7d1xgwqLmWX/yR29YYF0hQD83xNRUzVG//WS
         wLzurN7eemGgEp9JxaDzt7c+EehbTebprk0ad6ra1Rgc56RMd4bMAFPrFT/hTr4ZKCb1
         6QF3gKbNkHuEg90kP8c465q2YfBWz1ZYIrUEnzn5XWQwEyrpRoFkI/brm7BLC8jYLNNg
         xjd8vUcR6XpuPK4eTdCXG4tj2ey/04uMNwL8P1pTvQ81MFi/KyUVZ7MIOepG0lI/Nj3g
         XruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787634521; x=1788239321;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gFx7jxzHqWJADEiBCOZtF0jm9jFO7g0TZHDt+OXlOEo=;
        b=Mynlc1bc2MglMHECPn8f7oGwQbw2luwXOTQ5KFDmC1DZhjoFXOIGoaSKiyQptVUZi0
         E8JdXH1KvReFRnMpwKKuwv9mtl07jznVYjANsH9f6YnBnqF+JieNv2yRUg8G/2f+vpfM
         i6gybc2fu6BWGoAWu9YvPQ0maO7bqrInocvu76PoURW1OLdhPMlCVsG6ddRkE3ffU4bP
         bIOI4iG9sCGo0328nY2uKkg6oqHadfoZNNogqOH9sbZ+jnqlLXxd1QCjp3HmJaLb0dst
         XesrPetKq/2ensLJURny+FK9Gm1y0c8A5TyYOQ7khfTNGYQn7w7j4HnbEGp6ObbfpDFp
         04Hg==
X-Forwarded-Encrypted: i=1; AHgh+RqO28o5avO2T5CyBooFFwUN3cXHIn6QZSmQkJNzmN30ptQQSfJ1M69VBoJcVWXgFqCrrd7Iat2cDa8=@vger.kernel.org
X-Gm-Message-State: AFuF++lpapRJoN4ETn71wjLVE1SQrFU0EKpzcY3rWWMSAIHcpoVrJbGd
	av8tRbA1PicKUzlV/i13/fYwa3PwHsiPctbOHNetJkildeBQ8JyOzl5ea/eM6GPWLvmHdwlkGFy
	b7fjfYodhrIJaa6npfUiG5wxn5yJJ63lPidTXUvpdb0Ci9x64hy9++grEsdiM0Sk=
X-Gm-Gg: AR+sD11dZXguC3HyzITeBm9d+bY1dZSwS65fD9vJLlP9c78bt13zk6qVWRZ2cKc429S
	yOte1sPz0ejAKqKLkamyV4J1jVt96QY4IBC5uOXAKW+bmq59uDVP/3oOR2/u6Sh7lxhdhReHOjz
	fu2DCX/xfsgxZROEpJncisOQQIPe9zlxGv2gLJW/peztn8kHry1cxVMEu5bRP2Uq1fMP0t0QXaa
	C54tBf/mdKHZ4npepEbNG5A6C8Wn+LpdKzzoqy3WD5diBT5HViOYhK863MAtiLPK1qddNTwQRD3
	90YWtIEuT2iP69RFbc9a1fDpA50UjJPITwCpQyJhivtX/zl48ITFEpJwMG9ORP3ym0z7ZuRhpDO
	I0P+4/mG6uKSMm4yReSphwAC4/tabB/9mM+bK169BPUm9tfAfE90Yqjd7hu4ThiZU17KKi9N9oJ
	OnfqZR8QwwWLOQ712bwx69y1nKMF+XGA==
X-Received: by 2002:a17:90b:254e:b0:381:28e0:6259 with SMTP id 98e67ed59e1d1-396464d2917mr8090900a91.9.1787634520669;
        Mon, 24 Aug 2026 22:08:40 -0700 (PDT)
X-Received: by 2002:a17:90b:254e:b0:381:28e0:6259 with SMTP id 98e67ed59e1d1-396464d2917mr8090812a91.9.1787634520191;
        Mon, 24 Aug 2026 22:08:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ec7f7sm32335970c88.6.2026.08.24.22.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:08:39 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for IPQ9650 USB controller
Date: Tue, 25 Aug 2026 10:38:31 +0530
Message-Id: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFAjjWoC/y3MQQqDMBCF4auEWXdgkqoUr1JcaBx1oMZ2khZBv
 HuDuvwfj2+DyCocoTYbKP8kyhJy2JsBP7VhZJQ+NzhyFT0coU/6wopsybake+cKyNe38iDrwTy
 bs5U/36ylc4SujYx+mWdJtQm8JrzEApp9/wOfPTishwAAAA==
X-Change-ID: 20260820-ctrl-6015e1503b24
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: jG4eF9dB6KkVc10aAvhLKuUNGg1tJ3YQ
X-Proofpoint-GUID: jG4eF9dB6KkVc10aAvhLKuUNGg1tJ3YQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfX66hoJWlaBN8/
 zHKMB8x1PAl5Zvmde/mvF5f+TnLA4dGVQecHSqPEA2+z+sDPDJamfrIcjxNG/nMOKFmlEA9dClP
 KgfFPD9BORgkFGCnPlHJmPQDdZsi7cE=
X-Authority-Analysis: v=2.4 cv=TqPWQjXh c=1 sm=1 tr=0 ts=6a8d2359 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rjxQJijIFNsto2uecrYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfX+5VSUPeJ/EgN
 rvM2CK9owigwy1R4jdfJfRBBiVZdAXTwLssLQyd3OKYZOHB15o56nCt6zHBYgMxGKKkU6vvWs33
 +8xoIjKO4eMOhQBRBWejXBb+5/n0n3GUI7k1VaBeTVs7Y8iGk2cd8nMqgVqgwq3B/DlxHNAMnl/
 3u+SWAkHCUArxwYzijmnksey1P4RRNW5cs1rM7fRebHT/sgiKtFJViQrlHY9AgP5Z1mlYUQyuN5
 aaGHZ4FsXpYt6C8/RB44RxbsaCABsoL3XsrymCXSG+d9xyriLwav1IUH7zE3rUCXs6xH4VSCvxp
 xw6WT4lu+HwS0FWfElg8vvRj03UobiNDUZNvYOKE3iHK41L5CxyBGePTAGaRrm34dbs9436wFPi
 3hJR4HxF/N+ZCxa8isbaD7U03pTBqTLrRroJHHtdqi0tg4mvjxE2j2yZZkoJCdp3IHwcnHVE7j4
 FpORkYDW1AZPgIqSDIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250041

Add bindings and dwc3-qcom glue driver changes for adding support to the
two USB controllers present in IPQ9650.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650 compatible
      usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 22 ++++++++++++++++++++++
 drivers/usb/dwc3/dwc3-qcom.c                       |  7 +++++++
 2 files changed, 29 insertions(+)
---
base-commit: 7c5f62582256b505a57975d1a8faa501c8d8878e
change-id: 20260820-ctrl-6015e1503b24

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

