Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF5F3B9950
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 07:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089296; cv=none; b=DoloXqDi/P662NTT/t/O2B/P0SudhKieVhGcU9Jc83/3szQfPlhPRKOjxTxQ6bemdBYMIvJ362XtAjWhAPcnm409oGr+GxsJ1cZ5M93/1q4WvD8YclnLOUs2i1UHVrtzd01eXkfZkECkhqimpoo4JDdxZmweOhja3QYtm5g0JX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089296; c=relaxed/simple;
	bh=L1QHa+g+IXPKtZns6X08KrtS7KC3C9WNaYI+cWuJpsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qztEq6Y5nZYdUoo+i1bJyeEch5ocEWpvMTHvXAKK4Yuy8BmPrcwCzBZ9Ot+42VNazQPcivhlqmUGYcbIQqlvTCMYzsdzM+s6PSJBcKA8cEKMc6ktFNPXcjV6cgEq0wa3XRwVMiEjU1VLIee7VzVgScic/kP3yHTH3tdboM1VPDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+fTAx5v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqP9stSJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+fTAx5v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqP9stSJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770Gn8O3564471
	for <linux-usb@vger.kernel.org>; Fri, 7 Aug 2026 07:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9Lekz5JM4+A
	I+uj3wmBnfvYLGC2vYDIjBkJOBq9+I50=; b=P+fTAx5v3lghEWjVP1DOEFjrjMh
	UZNPCz/CBc28R0m69PIgxJfKOA0s4WkKY8Os9PIP22yH8NmpZ6JqgPvkDLNJUJcL
	Ggt2RKaaqU+oCyqtum7rUNOqIcejem5jKgOq/DSItmx+3fL9ECDBLQOZE7uEM1oA
	fi1Qx7xNUc6gYJrD3ohnk7WYxxB8ke9IVGwpPhxw04U7zw8eD0O9bEhTrbHmaOpa
	CrRO0nWh7z/GNf5euA5uG3a+BKn20FvaWPzwNe8fTON3ePVDivYZhgL1FdbBk6Os
	xXwBpsoFu8N/WrkVgrl6xtUjaQ+mW03CiRg3nr2deUD1MvBjzIACwi7j7ig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jtsk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 07:54:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c083f1818so32751951cf.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 00:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786089289; x=1786694089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Lekz5JM4+AI+uj3wmBnfvYLGC2vYDIjBkJOBq9+I50=;
        b=fqP9stSJWoxPMvaGdY2vObKN0esqkox5B2yYmRUF5mpw5JIXyvB2akwqf+eGECqOd5
         P9aseMFIZVyhEZ6MFOXjNEDXA6Ae2XhSLUl40oPUryikZH4QpbJCLyWRAsmhjP9whHnz
         6QhHEOVJYM0CMqVR8QI+nqgVdoasIxs6g5w0ayXJQkrIqA/M12os930XUQZamINgUboB
         kdRDpe3Qo1is/eBpIoFum4x4MvfTLLyCAAKl04AIlFZp3b2L0i/qITlPxjZB0j4mqG3n
         DPGFMFpyZkBdBlsy6qRCJ9i0Jp0fWTG40MphifiQ2fHHt66twX9+c13HaU2GCk47GIbF
         hD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089289; x=1786694089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Lekz5JM4+AI+uj3wmBnfvYLGC2vYDIjBkJOBq9+I50=;
        b=TkL9wf/jXGPyhMbRq+tDmVOi9jtLrj420Ua8Nny9zHPGUsMZ0o00uaeBQLZdN9U25n
         T+BQU28pviJCKnjQTLUdQ29Ov/d06BBPpOPRaVtIlftiUawNUfBuSS8xJijOYAe+p9Bw
         8v9GkL9rdes0klsLIDAjn5rvldyaGOOvItdILIIwop77qJzU+WqK9Ro0k4hf6Ou1o4/y
         PpsGvWHsMNxHztAZPnDbxhCdRpP7jkTKbnRNjMPCYlm0XKfcQ56CFJ2f07EbzCkt+ME/
         Y782zS9E9QSSvlvna7iSoq4BSYo9M2F4dvzmbdZbCBbt5KeRnRvXP4GrcrXOqTIWit+v
         B8cg==
X-Forwarded-Encrypted: i=1; AHgh+RpE5xaPLO4GMlQBhcCOlQMjTnkdq/8FccoGfuWNP2i+74ISdTKL4z50YMlP5RRFL2wHlf07ndmsbg4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv9lG4O7bnTqHu/GhxQTJXcfnjRiDk5LicRwHfvXSEi1/q3pwE
	/9yo1kIxF/sZCTPbUE3acDEZwbrUg3HqKB3R1ohlzt71ZLeRZREiK5mlnoKbBQYxQzA5et7rMcq
	3LP53VOd8nCqHVu7aL/ROUeFX49rlNG8O97ENmGPnumKSGvI/SABoXeRWejVEDqSQsVV8oI4=
X-Gm-Gg: AR+sD10gfUhzF8Jcco78kYmLwqBi7GPpQB9a9oJ/Nyueh7cChCDxHZFaGeyOwWlldjV
	6/tR2fz2vispuRQqI/N0Wp3Sw56R8v8w4NouJfJw/ougb59e2qExTJGXjjfHA0A+xCUdEUU9rwm
	TIUsHxoUweL7CBThjCwVK5U3mALdWQyQA5F9UWDezzetYcccALZxFo0eH6vy6wEHn7MD4YkEM+S
	9UVdetiRDuh4026rQuyuBcudjFr7CSqA1C4jBXh1B2qyzpxzqvcZ+x75DdicjbfnFBWwnsKid5l
	oBnBFhCsaawlov2a+BNsKNWSOqAl2628nABym8mixDMbFqrCJVxb60nswOE4ItJNTo5BzVR34ek
	qGun5PtHokR1onQVzRdLURBdWYjaJ5j4=
X-Received: by 2002:ac8:5cc7:0:b0:51c:709:b81c with SMTP id d75a77b69052e-52ce617568bmr228875841cf.32.1786089289506;
        Fri, 07 Aug 2026 00:54:49 -0700 (PDT)
X-Received: by 2002:ac8:5cc7:0:b0:51c:709:b81c with SMTP id d75a77b69052e-52ce617568bmr228875611cf.32.1786089289074;
        Fri, 07 Aug 2026 00:54:49 -0700 (PDT)
Received: from QCOM-WFsSr66Fqw.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cfddbbsm20020666b.61.2026.08.07.00.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:54:48 -0700 (PDT)
From: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@ti.com>,
        Tatyana Brokhman <tlinder@codeaurora.org>, Kees Cook <kees@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sebastian Urban <surban@surban.net>,
        Seungjin Bae <eeodqql09@gmail.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Subject: [PATCH 3/4] usb: gadget: dummy_hcd: fix SG transfer handling across chunks
Date: Fri,  7 Aug 2026 09:54:37 +0200
Message-ID: <20260807075438.5566-4-igor.skalkin@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
References: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a758f4a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Nijt3JpmL5Gph_9as-EA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1NyBTYWx0ZWRfX1MxzYipZoTSa
 IbXWad5zCLeaz7SA/GmVRcD9IzcQ508dOaFhm0CmyZhHJggteRNtB1CsEqh3iglyl3her4+wrff
 HezZQTob56DkGPA82e5Ednn3Kab1YPzQoXb4/iFMnBNoklt0QCSFxC3e4qMOeGjqDyQ3YeC86uh
 i9pWeAL/A/rSPHkK/DBu61EiopqMVwXuR/3JjYuUc5D8jOpw3M1fVsDdliXuOWTBFeEY3elJ5z4
 9ZJWj8bdZngR8Mb23R7uFghQXwQhDS23cIQVlkC6VASqL/LvLgFQY3Iw3sBkwXAPiD0WbvMQR/O
 mSqLXHwktupK/LtrCHWNKJX06+lQyTWtZrz652zoeUumPdsLjDIRtfVT34f8G4Pr0r1GqS8N3ve
 ViVOB3j2HmGlbZyXUIHUg8LxHIn0OAiAtW0+X7VFd9iJMFhzTGIcXkoO57BXBxb6Z9Z9A8AfXPJ
 hRtTxOmKVhE53yAELQQ==
X-Proofpoint-GUID: d30zQ_6LL5Nm9Gnmw2TnVlWA-y2sbB6C
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1NyBTYWx0ZWRfX77bs2l/ZyT1g
 C5cDJ75I/7Md0BjDlDcYP117yZW959kua42IGKdNPunviv/SXbFa0nCdk7A8pdt1UjqBmqnrrPS
 zsaozQcM4JjIDqvKa9B49bT44H0a74k=
X-Proofpoint-ORIG-GUID: d30zQ_6LL5Nm9Gnmw2TnVlWA-y2sbB6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070057

dummy_perform_transfer() may be called multiple times for the same URB
as the transfer is progressed in chunks.  The previous sg_miter-based
implementation kept iterator state in struct urbp between calls; on
resumed chunks sg_miter_next() would advance past the already-consumed
segment, causing -EINVAL and broken transfers.

Replace the stateful iterator with sg_miter_skip() to seek to the
correct SG position (urb->actual_length bytes in) on every call,
followed by a fresh manual walk for the requested chunk length.  This
makes each call self-contained and correct regardless of how many
partial transfers have already occurred.

Return -EINVAL if the total copied length does not match the requested
length (e.g. SG list exhausted prematurely).

Fixes: 14fce33a960a ("usb: gadget: dummy_hcd: add sg support")
Assisted-by: OpenCode:claude-sonnet-5
Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 59 +++++++++++-------------------
 1 file changed, 22 insertions(+), 37 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 5384806347ab..7597c9e9fa66 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -229,8 +229,6 @@ static const struct {
 struct urbp {
 	struct urb		*urb;
 	struct list_head	urbp_list;
-	struct sg_mapping_iter	miter;
-	u32			miter_started;
 };
 
 
@@ -1278,7 +1276,6 @@ static int dummy_urb_enqueue(
 	if (!urbp)
 		return -ENOMEM;
 	urbp->urb = urb;
-	urbp->miter_started = 0;
 
 	dum_hcd = hcd_to_dummy_hcd(hcd);
 	spin_lock_irqsave(&dum_hcd->dum->lock, flags);
@@ -1345,12 +1342,11 @@ static int dummy_perform_transfer(struct urb *urb, struct dummy_request *req,
 		u32 len)
 {
 	void *ubuf, *rbuf;
-	struct urbp *urbp = urb->hcpriv;
 	int to_host;
-	struct sg_mapping_iter *miter = &urbp->miter;
 	u32 trans = 0;
-	u32 this_sg;
-	bool next_sg;
+	u32 req_len = len;
+	struct sg_mapping_iter miter;
+	u32 flags = SG_MITER_ATOMIC;
 
 	to_host = usb_urb_dir_in(urb);
 	rbuf = req->req.buf + req->req.actual;
@@ -1364,46 +1360,35 @@ static int dummy_perform_transfer(struct urb *urb, struct dummy_request *req,
 		return len;
 	}
 
-	if (!urbp->miter_started) {
-		u32 flags = SG_MITER_ATOMIC;
+	if (to_host)
+		flags |= SG_MITER_TO_SG;
+	else
+		flags |= SG_MITER_FROM_SG;
 
-		if (to_host)
-			flags |= SG_MITER_TO_SG;
-		else
-			flags |= SG_MITER_FROM_SG;
+	sg_miter_start(&miter, urb->sg, urb->num_sgs, flags);
 
-		sg_miter_start(miter, urb->sg, urb->num_sgs, flags);
-		urbp->miter_started = 1;
-	}
-	next_sg = sg_miter_next(miter);
-	if (next_sg == false) {
-		WARN_ON_ONCE(1);
+	if (!sg_miter_skip(&miter, urb->actual_length)) {
+		sg_miter_stop(&miter);
 		return -EINVAL;
 	}
-	do {
-		ubuf = miter->addr;
-		this_sg = min_t(u32, len, miter->length);
-		miter->consumed = this_sg;
-		trans += this_sg;
+
+	while (len && sg_miter_next(&miter)) {
+		u32 chunk = min_t(u32, len, miter.length);
 
 		if (to_host)
-			memcpy(ubuf, rbuf, this_sg);
+			memcpy(miter.addr, rbuf + trans, chunk);
 		else
-			memcpy(rbuf, ubuf, this_sg);
-		len -= this_sg;
+			memcpy(rbuf + trans, miter.addr, chunk);
+		miter.consumed = chunk;
+		trans += chunk;
+		len -= chunk;
+	}
 
-		if (!len)
-			break;
-		next_sg = sg_miter_next(miter);
-		if (next_sg == false) {
-			WARN_ON_ONCE(1);
-			return -EINVAL;
-		}
+	sg_miter_stop(&miter);
 
-		rbuf += this_sg;
-	} while (1);
+	if (unlikely(trans != req_len))
+		return -EINVAL;
 
-	sg_miter_stop(miter);
 	return trans;
 }
 
-- 
2.49.0

