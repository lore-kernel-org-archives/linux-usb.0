Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518808;
	b=IYbEvR47U6/98kJm5Jxy8XL07sWRCX+2YspzmeFFADS0zFK9yxFz5YXq/pYPYqgxvJ9J
	 ufrdjN/e+NONiofMppCShmojrPbkLJVfMTeQKB2XQfzT8igUtcW/8VMMgdTNJ9XjkCXPW
	 TjXBXlVa6gchw8bodz4Bf9TPc+Pe1TCcjRLGVANnHeHqGNcxNXDElJDRrI9aOzep72IDz
	 lTCwH6EJKVzMEihDC9X0JMgAfEMh1U2SHHHNa9B0eU1bgLZ+aPFbKdP1y3anX0ABUkSpZ
	 AwW6fW/JBpH3ViVt0RkZKyp5t4FrXZHSfk+z9WB0C8BHGPvz/jMgV1h2KhsvmtbNp3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fQtK99vn4dQya8aK5tgZSG1rKrlkKylgmwYEe9Qe16I=;
	b=gVNuHLxYHrOcAFQKLX3y2fwXwYYkLlYkETdvYnXHeGRekWVrq7W6y9wvVuhwbdAtmXL5
	 t7Th3n8EeAS6a3XoIDxZWSE2SbbDyDlw6bW1qDkjGT4cXwWU5ZZQ0S39brdXsaw5Gwbmr
	 +czfy55RyKRzpYncH4qw/XOpS1SIrRAoo5AOkxKxa8vyZUrzI8TPu8TgK4CXn/44ZfwpS
	 pg2BUwGjorcWqPDMQd7EFkjnUz1LYFpAVK0tIqZwUm+dJN29iZKxdtV6T/IogTPV3W4KC
	 /VYM4DZ6wEwl96eJodyQ5CdXJhAew2ucOQScolLEnBqdNVQSOb6Vo6HFNLNag6xzKZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S2aRjtkM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="I/BUHEbm";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6ED606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 11:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA6ED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S2aRjtkM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I/BUHEbm
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAubhj1991581
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 11:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fQtK99vn4dQ
	ya8aK5tgZSG1rKrlkKylgmwYEe9Qe16I=; b=S2aRjtkM6/QHaSvsXDAiBZIfHik
	if1LpJsmmcEeBeKOAXL2PJz8qNrfoHDWUH9uATE4HLPrSSYWFwEQnjuIw1iMl8fs
	ajTGEVm3AU1hQeCl2KeqEP+u4VmFYjMmOYmmBLMxvP5UVuuaDBBqOSDMsoWlBuw6
	oUV540izfr9qSb0XG27uG0Q34clykCulf17iBJ4f51QhzbTrf+SAWfWlULmbDmwJ
	XFfHL537UJOaO2vc5dZKcOivrhUf3tWEUBxSxiumbSvH1t8vUe1PZffn6KjfNWrY
	dLoseotXOx1QHSJyr0yMOeWZ/StFrtdyjWtOoo6DVSVN05lPFLW+zwl3JPw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6sty7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 11:13:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so3366608eec.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 03:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795518806; x=1796123606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQtK99vn4dQya8aK5tgZSG1rKrlkKylgmwYEe9Qe16I=;
        b=I/BUHEbmtLA1jLc80yo8IrOCLoxW86crUk2FmK1QaoKlfirIpuBiNp+jt3eeqpdSvZ
         Sji4aWU2H5BVkLUUYGrYxLTC0rDaVKvttQj4DNWs1pepdENXcquMS2FeosLj2BgnR75K
         y4iorKiRuOJPUBLxsM31NEDQPOtkMnhKdZSXRdIH5HDB4YK2e00ToL1mbP5T8ZIjRJvT
         ep/s8PTzEQ3d9Nywj2otOurHCkg0ptTAScTY7fe4xAzbZVp4wX13F7TZarv25QvYhUQ/
         lZF/AT1aeKEbgnYjQq86q8sObKzva1lux/zv5hpYKXfomdT2YkuUoUa2aT9V+Mal27Vq
         3/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518806; x=1796123606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQtK99vn4dQya8aK5tgZSG1rKrlkKylgmwYEe9Qe16I=;
        b=L23jUv0DhFfoX5E3z39ndBoLbCz5yMimjv10l730ihw83jqh2UAF+OCTCJY3YnUkkC
         TZYBGVqn7ZONTbjrah0H7kVbaqeHEHk/B0j80bfkDrez+env0ATA+ZtEH9JRJQyxLmUj
         yTzKi9KQQxrFe+gcXCZXodDB1GIXnkrvazTSqMo7eaUe2vCXN2uzjEzdwpUkdIY9URsp
         REvrbu3ZFtERb6X5HsLKbx0vpMh/sAsOJW9XK+Ha/EwoU13i3wNWROciGcxEZ4Z53d5E
         GG3YUwEGEs709Lj5tUTR9dWDoYCoqIef6GBaIrn23QHmPU5lEJQ8eyZ/t6UWkQ/KC9Xj
         5TOQ==
X-Forwarded-Encrypted: i=1; AL+hErFIF/5IAuvB9L0CujLZiONaYotPnGcTjffO14Ne8hE0w2itF2aJOpBAtLSRifR+uhM7J0DFpByyQc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YXAkkUWiQfGV29j5L4bfqKOHlnf0/qN7x7DfYpP9TksEjxpx9
	E73vMuGup+JIoUTRdlYay1cqsPU4Q7hS7p8+klFsFjF7zcCc7yhZDa3tyTeRHdZuQiftu7OmbXG
	taCUe0yI7Hl/mu6706fPXvrG4parbcYfwi0vTfMWQLUFFCrotnzrlqzY/jeWjU5s=
X-Gm-Gg: AZFdTZe1v6gm1+4PA8nqPmQHLgyBXmjV1Q+B1jfeEnwFQl9c3JtfQboC1Kf0JgnZErH
	eD3RVqJXivwHO7tmPFx5217Z1QxciWb93wxIYCscrE4WRQiHDwlfE58/MHyK12mkisDAFrIYpIK
	xW9YaLgTXPq5wRbdSG3ZMvYQwI/yW2yjgXtIUEbZrGx4C/GbtygGSZQ3nnGhkKSkvBZhPesB4qz
	5ZH6GP6LBknr3AucnrXPp5j91zKz567ehyUY+1jeMgjtBap2ty2oRF0MJOgoSBNoi/VsxXUK7ZU
	0dRjdJPYRG1HTopL5hg8SBTxtZEcoI/WFA4zShafJ2L/hnipVhxlPN0Cku3j7g3ShdkO3iTPYuB
	0MDuaAj74pRNmKQehlfD4J4WeTlivPuONYSXPeVXvgbzjrgBXh3o1HGV6Q57JPuGQrYfvw2Vp17
	7Eba64zg==
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr5827739eec.40.1795518806203;
        Tue, 24 Nov 2026 03:13:26 -0800 (PST)
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr5827717eec.40.1795518805666;
        Tue, 24 Nov 2026 03:13:25 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm43259567eec.15.2026.11.24.03.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:13:25 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, faisal.hassan@oss.qualcomm.com
Subject: [PATCH v3 0/2] usb: dwc3: gadget: fix request unmap and linearize SG requests that exceed the TRB cache
Date: Tue, 24 Nov 2026 16:43:19 +0530
Message-Id: <20261124111321.2731905-1-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
References: <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-GUID: yQPFzizTZhy_pgolG-cv7U0mKWlsGMOP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MyBTYWx0ZWRfX6JuWoqM/Z5mf
 7DXlLSd30alwLhMb77VHqyx1GXImRO2nlXITkh+KKpl7Plw5H+34Lz0sDdrL+ipksSFPTRnMg5Q
 rU/ugJkVxcRZ2vm/6f1szu6dylhlEBU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MyBTYWx0ZWRfX2Ty6hNAXSQDe
 z81ZSo1sVWmWBxpunqkxrcijDOjP7rnWQMw8QFFkBDO3NbqGtgZS6KyvTT0OBjsPvtwmFaTy+pj
 wy8VuEnFyiaQ1SbSdnkrsPvIBwyXla17yYcClUoO12pwo4h0hRZQ/vqq2KWN/ZdEEI+aYhzMgS7
 uRP0nWSTXLYzJcILaV3VI2bfNlbnytreAJD54RsG7Ztd26qsMjwW2f05RLozesuPWApepQCTY4H
 js7CxWJydPYDeVbxhqDwjqpMRf3w+y9NjMOgOsNj86eQ7PwW8BbnTvUXe1oCIonBTW2C9kyvaC7
 RLs9GvjbI/VRTgFlAoWM03giJpKCurQ+MXYlhH37pHhdDRC4BnOSbNLyUCVINdzo3Hz2PBW5K9g
 NhPczybmNkIkVmM4J+lUV/Bqjk7NpGN3flCbrdzuG9bNNH1XsFrqjB864DbKGQ929RuBZSbcaCz
 Lb7G21VtYh6OkpSp2fA==
X-Proofpoint-ORIG-GUID: yQPFzizTZhy_pgolG-cv7U0mKWlsGMOP
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b057157 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BC1X_EGaO9jJDtBbprQA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240043

The DWC3 TRB cache holds at most 15 TRBs per transfer, and a packet whose
chain needs more than that is never assembled. An SG IN request built
from small entries, such as a 1024-byte request scattered over 16 pages
of 64 bytes on a SuperSpeed bulk endpoint, stalls with NRDY and never
completes. Patch 2 copies such requests into a contiguous buffer at
queue time.

Patch 1 is new in v3. The sashiko review of v2 pointed out that a
request which is mapped but gets no TRB is never unmapped, and is mapped
again on every kick. This has been the case since requests started being
mapped lazily, but linearized requests make it easier to hit, so fix it
first. Patch 2 no longer needs its own unmap condition.

The review also noted that __dwc3_gadget_start_isoc() errors are
returned from __dwc3_gadget_ep_queue() after the request has been added
to the pending list. That behaviour dates back to 25abad6a0584 and is
not touched here.

Changes in v3:
- Add patch 1 to track the mapped state in req->mapped and unmap
  unconditionally on giveback.
- Drop the req->sg_trb_cache_bounced unmap condition from patch 2.

Changes in v2:
- Linearize at queue time so allocation and SG list errors are returned
  from usb_ep_queue(), and restore the original request on giveback.
- Apply the workaround unconditionally instead of using a DT quirk.

v2: https://lore.kernel.org/all/20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com/
v1: https://lore.kernel.org/all/20261004031445.1450196-1-faisal.hassan@oss.qualcomm.com/

Faisal Hassan (2):
  usb: dwc3: gadget: fix DMA mapping leak of requests without TRBs
  usb: dwc3: gadget: linearize SG requests that exceed the TRB cache

 drivers/usb/dwc3/core.h   |  15 ++++
 drivers/usb/dwc3/gadget.c | 145 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 153 insertions(+), 7 deletions(-)


base-commit: 8e31dedb9ad496ea7dd7064d77d6f7d459c1c90f
-- 
2.34.1

