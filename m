Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518811;
	b=sPPAxRrYTYiNuT4jDHV+hR6ONv0hTxjP2/PGXRv99bcqOEIP+rYYgo0YbCmO789zm1sg
	 tTokzAmc4Su87/RVK76tEeH6cNZ0ASFlxrtHYJLGZfD37ENwI9Fg1SD989BGutBLyNGA0
	 7QfoDJm5NQK4uBXiSkAUwTrwp8eluDKyY4sJ/ukas2iQBcb0/WNkyRBn6l2275pIsG/Ai
	 vRRdxcc8ADt31IOMmBVXIiCeVwLLuv/fibel5sG+MkI9hie9syYWj5GZm2nq4chNFhlvv
	 7Do7OOppcn6+Yr9T78jZQv0xjUpHikEL9yHkLG+FmsExY8F+nqbdcWPbCgEt4O6qxTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=43yBSSKB2s2lCQSNwP9RzhEdheigc7I5z48lFs86RnU=;
	b=dmTZqyhpM2d7wCLgliMJicjRhNZVHJXVHa7KzDdgXXtdRXkJHFiqKxuaxtoxjxFHeVea
	 XqN9Hw4LynNqQ7Cems6oHYBfxe6BH55buI8S02Jafozh/tg0TLe0g66JCI2zm6+VcuCkq
	 oxhw7/1+rL6fWSJuvXudDfcK0y+fciXjffKNHP99kG9GJuEX6AUM4DZ4BE6M2kUBpsyFG
	 AVfQeGE5wb4M/GapELtFdfV5seFGEHvcbmVqXfiXdXsIp4xI/qAADaOH6TnQ/7ydOK2QC
	 oaiXTPS3PxIbYreSepG2HtynDJrk4PGjYVezfaA3rAu0yKHo9wHhFtVseH6mLyyxccw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XklhORRD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aHYbrhdN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE22606A330
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 11:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFE22606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XklhORRD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aHYbrhdN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuh4O1291461
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 11:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=43yBSSKB2s2
	lCQSNwP9RzhEdheigc7I5z48lFs86RnU=; b=XklhORRDknF+u5kwFFGUlFzr9yJ
	J7bZM4BjYJ7GU8jEyX7Vo/JAUwwupijkSAyXn9TPAfbUi4hzZ7y/R0Taijgtqon9
	tKxxjb7YEbHtAgyVhYwa7i/VwKwPxS6elZ/YmTRNHF0vU7hEbu8tGaUvftqwGJ6l
	SjqAOd2OzYUP9jLmwgbNgNKx+IZWM6r3zFAk3zB2QxA7jqWgluHUzu0EdLhIpSr+
	b/2zfPjTuRWiom+wCHMwkOWW2PpB8qpsgCzI3tNBxig7GyiKm9SKZKgOi0s0Y80V
	JKa1UjeL/QSz0swnJ95d5tM1JjzDG67RWIGseSprqiMoJNdZtr+7nUApKKA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrbcqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 11:13:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869accaac2so2573951eec.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 03:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795518809; x=1796123609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43yBSSKB2s2lCQSNwP9RzhEdheigc7I5z48lFs86RnU=;
        b=aHYbrhdNxS10UdZM2VVarJyhTFQXGFkstvG4zpCmFLHN92D8x0titCQRxxoe1MfFry
         nX09NrCBKM5Uk4pdfGKcGm679M/2njgoKgYL3FVmDlbEq+M2IzzKuwLdAUhyxw0JzaVp
         nOpzvGGwvLYTRISquDG/7h359tsf1iVcRHNGLOz9q7U0s8pYrud/sBSwJf6fXD7G0HG9
         K1d6DvgIVK3wfl3VsmEMmq23juI42zAYANUDLxLWZ/FebHeXy+YuerCewD6CECut8v3C
         nl6U6ryXB0Zu7bxS74/2Ki6zkYyXmZNprBUmPxYwhUQDuqW1lsvJw7psZ9EZ/g4eUwdM
         3imA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518809; x=1796123609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43yBSSKB2s2lCQSNwP9RzhEdheigc7I5z48lFs86RnU=;
        b=q7hgGvdmIbHkJzCWDQStlNsgERegVKgKzsSJCH8tvZrhVHectvqm/VzcLagD51MGTT
         tzKVYH1KgI3CPQWQ3K0YVXoghwRWWEdJCSfJyFqpc1SHwzQh12I5xo93lu3hLMeNBwGk
         +MgJg3XD9tw+uv5I9p2fF/0sd6dYtv1mCUVMNm1mwwQeAPwCz4StpA0+7OQLvXF8pzJU
         7spZFQbH/ZaepwuvTDYvCIHybZx0alwR38lgG2x5I9Jm0TG8G2h/HRYhjV0cnI+qAyy9
         wd8GuXp4XqsE1RlWk1lKT7tbs4OZceJx+hEhvgSF4X25jLjBdw4IrufMsvkEBgSSL+A7
         +zWQ==
X-Forwarded-Encrypted: i=1; AL+hErGb+I5AaE+n1k929YLYNWAQcGh9dER1B95z6yEL17XgUNonxxKT3j0XVbc3LlBTIlaG6c10ZqkI5o4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aGBiihMpcQ7Oeby+Xr/UXvbkdKceih24axQKa7YX7iZmwGBX4
	HRigSlqiwgwjPvyOVGtBVPxseX91/NSjpDIdV4ltzRs+bBFOE+1pfeskgXc5PLEdy3irhj3bxO6
	jDZJJgGMRbLkdn0nkhTELX2hX8C1Ij96QQrgTFThUXQVDaRwYk9hTWdu4765hVW/YJXfiwZ0=
X-Gm-Gg: AZFdTZfS03ar2UYma1AT3ujREAAaA00iqD/3Kld7KkUSpgLNfXoQWvyOQ6XKpOuchqG
	lqGQajoepNFzz96LTHj83YWmSpYFDE6OpnoUHhMS4NdLGAC+VF23eam96LT5+id8noTgfnArmcX
	fx4rcWCzxi9cWk67BFiEra1C+HnJkq18ud2D/njEZaYHwXOXhc/e6GPfbjUnjBatFH1Xro5r5af
	rHP3yazHEIFBycqGiK8Wy15YpiKt3PnNWDIGy9JuyBeWQCG0sSnASoTVoktNoqeicZPXs7H00LE
	0rUH1rfBl/BN+WHhETtGGQEI9+waRN7JFiMadkGuU7QPqoRQu7Kq+WhXfCeHykj3bqPeeGQolP9
	9lKSSOxmzatLMYfNnusnG7CGeeJbbfCBeNDeWVtu535exwvOTfsklTmM+T4YENdMoJgQlmiMd63
	Hi7UQnYA==
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr15881246eec.7.1795518809146;
        Tue, 24 Nov 2026 03:13:29 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr15881213eec.7.1795518808365;
        Tue, 24 Nov 2026 03:13:28 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm43259567eec.15.2026.11.24.03.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:13:28 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, faisal.hassan@oss.qualcomm.com
Subject: [PATCH v3 1/2] usb: dwc3: gadget: fix DMA mapping leak of requests without TRBs
Date: Tue, 24 Nov 2026 16:43:20 +0530
Message-Id: <20261124111321.2731905-2-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124111321.2731905-1-faisal.hassan@oss.qualcomm.com>
References: <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
 <20261124111321.2731905-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MyBTYWx0ZWRfX9dFvAehYVfP6
 lDeGl0BWKmo7hgPOWbXxJncxMkonVeFn6XGtW1SXQm+3j/bHrRRXbZ5t7wQofH+srzKZvVYIT8N
 e0uRep3STN9Hnx112x2THbr3yPRMKDI=
X-Proofpoint-ORIG-GUID: Ylyv9el3_IUWNiYbC94vw0hyyxCZZUrf
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b05715a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Q5tkd2OBlz4b3Mc1XJkA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MyBTYWx0ZWRfXwThoSQXZBCIh
 Ty3EU61PBXCNcp8fFm/F/G0mFq9ldygReP9ROVkgBRbD+9XQSxTcQjGKPsiHqJ3lfXRbuTzJyyb
 6FwFhNSyh+r4Mvpuh3f6MdluCyKdI2guR+dSZkaffUrzXOixSyo6Z+rMg6aRL7Uf0PJli7tj6xP
 dXwlHoZVX8uhV/clmErXdVuzxKoeUeea52sWJqb8DxOuuep4k+YnsUlBZgMPMHoHbISA+QSkSe7
 jh9PhRGhPzqCds4Ntyyhv1LO+wWRspafGnLTUsN33nzAtRE73rJFb5hhzVRNbPurRVPtjRQqAEj
 wOUSMGR6HON3BEX40hsgn9XW83i5K/WolEj4RMgY1JF4R/7OfBY9H5HE91p/KzgrP98BoN49udc
 LBKoQDTcDrvIPoxUncCzNdFlhaawlX4pHmdzuHZPov63ypjBR7MPHUldfOpVO0bGvPBEFbmoXjA
 goT3iWLyM3AGCK8vTmA==
X-Proofpoint-GUID: Ylyv9el3_IUWNiYbC94vw0hyyxCZZUrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240043

dwc3_prepare_trbs() maps pending requests lazily. A request that needs
more TRBs than are currently free is left on the pending list, mapped
but with req->trb unset, and is mapped again on the next kick.

dwc3_gadget_del_and_unmap_request() only unmaps requests that have
req->trb set, so dequeuing such a request, or failing it on
disconnect, leaks its mapping. With an IOMMU or swiotlb this leaks
IOVA space or bounce buffers.

Track the mapped state in req->mapped, skip the mapping if it is
already done, and unmap unconditionally on giveback.
usb_gadget_unmap_request_by_dev() does nothing for a request that is
not mapped.

Fixes: cdb55b39fab8 ("usb: dwc3: gadget: lazily map requests for DMA")
Cc: stable@vger.kernel.org
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/gadget.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index afcbde73fcb7..e4436abd222d 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -203,9 +203,9 @@ static void dwc3_gadget_del_and_unmap_request(struct dwc3_ep *dep,
 	if (req->request.status == -EINPROGRESS)
 		req->request.status = status;
 
-	if (req->trb)
-		usb_gadget_unmap_request_by_dev(dwc->sysdev,
-				&req->request, req->direction);
+	usb_gadget_unmap_request_by_dev(dwc->sysdev, &req->request,
+					req->direction);
+	req->mapped = false;
 
 	req->trb = NULL;
 	trace_dwc3_gadget_giveback(req);
@@ -1659,10 +1659,14 @@ static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 	list_for_each_entry_safe(req, n, &dep->pending_list, list) {
 		struct dwc3	*dwc = dep->dwc;
 
-		ret = usb_gadget_map_request_by_dev(dwc->sysdev, &req->request,
-						    dep->direction);
-		if (ret)
-			return ret;
+		if (!req->mapped) {
+			ret = usb_gadget_map_request_by_dev(dwc->sysdev,
+						&req->request, dep->direction);
+			if (ret)
+				return ret;
+
+			req->mapped = true;
+		}
 
 		req->start_sg		= req->request.sg;
 		req->num_pending_sgs	= req->request.num_mapped_sgs;
-- 
2.34.1

