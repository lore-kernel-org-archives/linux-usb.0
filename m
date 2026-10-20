Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508745;
	b=eK0mN+zbHLaZZ8v92fASla2F5gub2Rn/GfV/8Dxn2PffumsMhv9MQD6RulThr93+kJol
	 wbgjDSf2VllGGJBPqbLwxipWlWKma4BiuqwloxNNVa71U0Jj2Pn/J75vDKk5Mo1INIvw+
	 SBgb/tcFVq06k3DR52AxlvbkHpdEPyKJYHOhVlhDNSIhoC3Vo016Pkxav54IUTupNdExU
	 sgUc7FBFWLHAJXFqkBLqlJb651BariCGLOFPN0nyAh1SYau964J4m6YeYRrJFJvLf0lOP
	 1PNY2sJSU2yqotd5arekSiQ3coj1kSYm90Lv1ZSMigRphsB0VbtOnIIdyNHOMDhKMbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EWJT/LZ91KZcU9yRbx5HYVK03kKWvI4hKl6c29Ki7JM=;
	b=JV4ckqP+2p4V0usLSQjjLpZKrigiCAfjFa0kl6ais+TfQbjzRJB6VZmBDy6cVkFhaF0c
	 ipiA8vPx1eUf1ytqO39y2GnnPwkrsJhSRlNYECS1ZUL0h96UbhIEQu3k0PQzsS101JGQS
	 x+pe4UiShi2Rtv8Bl/plCVcRo5hX8AtFaPIKT+1DNr5fAoXqSOcP2usyyqhnQjluUFInO
	 xKJ/MfMWGk/YxoCUum1tBeMhh5QU/NwNOI+1v1UT7IIj9oyH9zF7ahfM7x2oblZC0uqNB
	 z6dWC/d8G62eaKRardlo8nfss2sZOjGe41aqq5s7WCrdzzL/tJSspTz+UYIlAh0PjvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTK8bzdw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvSMQRjX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA5606A31E
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 15:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BEA5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTK8bzdw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvSMQRjX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9pWZ1781303
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 15:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EWJT/LZ91KZcU9yRbx5HYV
	K03kKWvI4hKl6c29Ki7JM=; b=LTK8bzdwSt0YRkQGJq+WVVPnWEagWsC/SmEqOO
	ZuJ1kocuz4c/EJtbSQd/lTetMTK6yPggo8bHZinU6afRhxYX6HSVRnHS+60K7Ia7
	16+4mdEp0ZS4Q7WOv3Ln5Dq4J6UiXY9F5+GELvECumt5LtlKeorvHYpd4GJvpokX
	P6+x8x5mLGpvpIu74tVfeulKVdxGccNsnwX7ikl2tyjTk30yqBGSZR9t4fvxNCcf
	oyKYg7Vnl3oXjdF+D9UxZAEFJ/kPtH9pDnAzdGV4wfLUk/25sPWOA1zQ0zsB6aqI
	5vRKavVLLoBoTo5MAqVySeabhSUWbX4oNPzYevNPaZPLMkRQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h28sb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 15:05:44 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so17055e0c.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792508743; x=1793113543; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EWJT/LZ91KZcU9yRbx5HYVK03kKWvI4hKl6c29Ki7JM=;
        b=bvSMQRjX4p195e04tvfCwZlf8OffqVuyV2Bp9rN58Ikjh42Tq+RtQWNGOOUA+iYaSh
         j9ceniKOzM1iyWE9GIfiq54qS31odo0EoN+PgzCpCZMkPRPoa/LhMG2VQiYEWJn66fQn
         UwVUK+l5TZFUUaFUaJrb7MAcfrlM8Cr2Z7/mHtK9B4pflNfJWAH2FOFF4pOAV4KxEaKv
         ihabU9Mim0n4VUM1LEdIWpKP99XWRvCIbqpPSSlDdeiWdOfCQ3XcmcNhHt5zTmWcIJzE
         DlfJgKsNpfIhl9L1jDClE8hjC7Jp0q6aiQmyuel4NCt6Yi+QvYYwZz4QYv8WeWbczyuf
         aK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508743; x=1793113543;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EWJT/LZ91KZcU9yRbx5HYVK03kKWvI4hKl6c29Ki7JM=;
        b=1muYHF9c4qmbTy7NWlYPEtzeiLF57G3bUK2cp4yzYLdr2FzpI9cnb7sZVEXcSDVlE8
         UrdZah74ticNuo+0U/ydfQIMaJqznxTWDcICt2jfquRM5N5fT6eSIOBeuVEkDvmZqELE
         QeqFsuFyhA43brScsmg0GozAkPJ+9bLoejwYGABA4Ypt81umAXh5+by7+Z2NzK4fI03k
         psPaMNmLOQ37HFK8h29LJX5N6qA0B3z5jC6MSAGhviC72OuJC70yIfTJUkOQw+iXfbDX
         QNwmot7mwAABkx3uxGnmW+Bk8xFFm0Xp+cR7NWJ0837mPhq6xL4D55eDmpOael2/rH9p
         5ikw==
X-Gm-Message-State: AFq9FYJPq/PnBAomzmxTxptGNjZNiCEDn5HeGPQ24k4mo7r65MhTTPkb
	lzCBY1hPoTzZx44Y7Zck6W/C94kiDq4v36daGetCg0fLNr4Oxwh7qSCw67+CO3+f0qVLLdueVLu
	I2otbWjiZhIzgDtfzUI92Hzj12LlJfUJRppnKBB91BrEOOqcqdyuGqKh9GVHLNHDgZKvvl1mH6A
	==
X-Gm-Gg: AYBFou1RZK3lZhhXKu1U/ix4eIp0pHXBhoRkTTzUhYBDc4NMi77ogIP2EVBpyQ2dbNn
	HEo3tRFrhTtgcbV6fQlRYuMp9ymL++luf84uDkrsK3Jdn6EUFe1+gQrSOWWGf8fKyLDUmHMgD/X
	6J827XF9E9FhfgD2BNgw1/arS9+cfvnGYBVOGbJMuuXpvfw4scotypegYjZgNAJqSPlR0C2k7Yj
	uOhLypwv1Utp6/HNKf1m+sSmvBkG3uuadJyiUB0iVprnS/VDrTH9cgEMvJNDefl0DhGnAhTThnV
	F54vyFn88CLJQg+vjM2tKBGau9tcvcWoqetf6wzcIjQ8bf5c6GDdZwxLXDzZKAefyKPf83yGiRF
	oSdFdZjG7ecYSBA8uNZUvBaYN98rQJXFMRw==
X-Received: by 2002:a05:6102:418f:b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7cc368f207dmr1898155137.2.1792508743357;
        Tue, 20 Oct 2026 08:05:43 -0700 (PDT)
X-Received: by 2002:a05:6102:418f:b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7cc368f207dmr1898131137.2.1792508742853;
        Tue, 20 Oct 2026 08:05:42 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:2178:c9bb:4cda:9f4d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d66d6sm5168567a12.23.2026.10.20.08.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:05:41 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 17:05:39 +0200
Subject: [PATCH] usb: hcd-pci: avoid double disable on surprise removal
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
Message-Id: <20261020-topic-hub_pci-v1-1-bccdaef0344f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEKD12oC/x3MQQqAIBBA0avIrBPUoKyrRETalLNR0YogvHvS8
 i3+fyFjIswwshcS3pQp+ArZMLBu9Qdy2qpBCdVJoQQ/QyTL3WWWaIkPojXaSr3J3kBtYsKdnv8
 3zaV8v4KLHV8AAAA=
X-Change-ID: 20261020-topic-hub_pci-903b8c18d17b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792508740; l=1089;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=KnCWtDRZNJ63UHLvRCKMA8r8EZjb3xAjvrVzr2DQjO4=;
 b=HtVuHL+v3Qa8UycbGzkQ2/PowbyoV/uCjKLhN4rPCUlCYZ3FTIB0E8VmA7Nkv1rRebY6IGWi3
 DbA3nFdcf3CCUTVQjY+meJ/jJJ+QXYWV8xH9pUaFuPSbc7xJe2mLyl9
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: FRLtGfTnEycenMZk3LHd4lRJxV6KXCmy
X-Proofpoint-ORIG-GUID: FRLtGfTnEycenMZk3LHd4lRJxV6KXCmy
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad78348 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Y30hiCGzOIVvoHo1-qsA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2MCBTYWx0ZWRfX1Wi1fC06QRFY
 +H+gIAsrDoRx1+1sM/iuYn2eO/zb79aDZUz2cRpWRuI1F98yR5st1Cc+4CiWehfkNO0VZaefQc/
 P2p1vrgCBiPb8bf+HM4cof6ZzDiRu7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2MCBTYWx0ZWRfXw5U0Pbn/ytfl
 /aGitjoAZ2AJF1e3cfazVaUyKKHcYCxSegVxq8+pqt7xxa1y4EzD/Ym+q1uuV1E62+bLAAfsMML
 yUafErToJD/JWleRspg/9+ytM7iJHBvsiIyXlL6uufi/a3YfJYBQ0Vbr6ncILvjUf8zOKoVKQ0w
 yvuj0NpV6j9EjCf9i/t1M6Cu8dNvl2pwDCH9QPnfRQcUhIqnQHK5Dib4HknG0YhVPSzPtKsqS0w
 OMh+dGqPW51QAZQHNmlGkCJxWRm/7hejiWh3WjMkHEjaRUGnkss86AYhCV625OZ1tkCTYUnyYe0
 ZkmRpjdJaVauuwD355U//EaaYZTDMUROfdVRXVXqvqsbo8a2NPtyUwkEzhKPbkdpbfC88XPFJgW
 00xpdmM9HES2Qt7avdSxCafX6Gaix0iZK9GDWcbn4FKbPGf+Sbe4xxnaWpitg+1bxjSGlhLWq8E
 KZLQcJgIiNWwwmfEtWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200060

A PCI HCD can be surprise-removed after suspend_common() disables it
and before resume_common() re-enables it. Avoid a second call to
pci_disable_device() in the remove path when no enable reference
remains.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/core/hcd-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index cd223475917ef199511311eda5c6aaef073b0ad4..34c4d352b40c40c54cf17c30fc264833ba05bcd6 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -348,7 +348,9 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
 	usb_put_hcd(hcd);
 	if ((hcd_driver_flags & HCD_MASK) < HCD_USB3)
 		pci_free_irq_vectors(dev);
-	pci_disable_device(dev);
+
+	if (pci_is_enabled(dev))
+		pci_disable_device(dev);
 }
 EXPORT_SYMBOL_GPL(usb_hcd_pci_remove);
 

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20261020-topic-hub_pci-903b8c18d17b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

