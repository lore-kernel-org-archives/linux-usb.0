Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782C23B05B3
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786522767; cv=none; b=ISLtalSRbgxrgxKyuA0ZWcHapXagWjBj/9J9KVLsfW9O6FCHCoc8+o8BiZwjgE7DI508yCCzC3SRIEZLtdIUdgv1zsoPsNIAJWGS+IHRaqnDuU8BlgDJrhj+U5iBX2ih60wPA2nPp4M98mJILJbs9Q+6lP2o7ITWFSmiSTdU5k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786522767; c=relaxed/simple;
	bh=O4tS74Qpamlgy50ymq4f2hv0mNK8g08TXH3vrTvTCcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6oKiT0SJeinF7TB7Y/V1zYTXOe6ijTvFCz6i0Jf6m2ES87En1aNDaZVJI3CVKVapLrIKwYZcRo2BYyaFjXoCQE98E8zZ0+6FZHzs+QsHFbBsm0V0YA6CwjfCxoxphYGbGQ4Cif6xzGQs7H6gkBQycX9wEO/TzX/Dmp191Ok+Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jP2QrAhV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMzR6H0K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jP2QrAhV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMzR6H0K"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C79SA03144255
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 08:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yCvY8dTpd0m
	VJHRvRNyakrvKHP85LZh5EA/bbkoXk+c=; b=jP2QrAhVd2X9t6b9PolWGLVwmyY
	jTSuLjkHzlYqsQzwCZztmmKZKdamqaKwFG956agY5BPIcAY5prVoSn6lVCtGC1Cz
	3wx29co/ly71FbKzwBFOxfHV6Sjbjlrk9l/kB3Izb4H9vaAu4yxjat4lDKf0NXC3
	/w/0TUty+OmSmB9dM3fwzl62Q2oaIADoGlbN4ksGomQHp3Kg96hHYbBa8JQAs3Ew
	QGO0lfAyh2oBt3zPYNTDF4AnlyBise3q3d6glrJH8zUcBNzxqBRDpfVIIXg3QoM2
	7MIOcUBtQbDNorEFPZxcfUYdU4ZM9OQoxnG2QruZtD5fBcDz9t1rtEdv9rQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0m6rg8b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 08:19:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso12963891cf.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786522763; x=1787127563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCvY8dTpd0mVJHRvRNyakrvKHP85LZh5EA/bbkoXk+c=;
        b=eMzR6H0K5cB7bBvhOlnSa7yY+KTtsxPKOZm6grfKLTwmMd698Qn9R6Fq84HyOoIMXT
         tS5WtWWgLhiHOwOw9Mg7LAJwCqggw9JEyGKUsId+Ryl0E0B5ehmUQ80hhXrexo6nneNP
         7EiDcGdG3TFpUIzdfVGNCWHjWSMnpwt1ztiUxo1CJPSF8v1Oard5UsgI8TKLACe67qYv
         uEhPyIS7lawocxAD4xk1ZiTMrt1aXQN/gXPZnKo5pqgFpESQ4oeqJgbzBwpPOfX74UzI
         lQNyKRLvk1BIpmIQUOKqW4my9CD5bcgnh+7Xf8ALvs8gy8IRCYwd1CA1NdNhwTDXaVHe
         Ez0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786522763; x=1787127563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCvY8dTpd0mVJHRvRNyakrvKHP85LZh5EA/bbkoXk+c=;
        b=KA967U18wpCrAsh6CeZ8AuFQya2Px/PbRQeR+GOR8fppw8842iM8u1G3zakP+E6ZWY
         k89RPSTaIbtdi+CFyxS7UWttnAV+Z6nxtgQXfAYBVmVZEl4OVGcZ/0503Yw2xTsT64Y8
         /TIL13a4hiRlIZLDNI1z/nCkkwo2egncQiIgrH+g73LaURrJjVvYFKbn99i5YC2X500Y
         jZu4fWsd7j4dugW0/ysdBM9l+XdK7fsiE6M2byvgcu5Sk73j3tsfLlUOiiOtMkWpO4Hv
         E2HojoI2pE0RFUJGXtH10t2K7DrwVXy2nJhXpPYj5pI5j7WFgFeD3ygeFfHNrqfqSqS0
         r8ig==
X-Forwarded-Encrypted: i=1; AHgh+RqPppUkiXmBnY0mD426gutpqxmeutSCUOJEwprODnUAcjetrM52IxagkQPI/JoOU9zRuUf8FCc4Qj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGCMamf7xuYrmk3CHdutaPQYhzWibBXcU7XOLR0+JJF718SDXs
	hNqwVx6zdAkMcBJIt3Mn7+igT0KAsmAvZOGlZbhkAW83ckrrmtsnUErY+j/3YQHE32MrxJr+7da
	g3g3vkdFwLgfigPu+OjuPu/ZOo8N+h41A3cskA3tGAxfIcnDOT6k3GscisgJH4xM=
X-Gm-Gg: AR+sD10fLklHJ8BzGBZGEEa62XV68u9LQIU0xvhmCr9zSVtme73hjZb28mPo1LtFlDg
	J42zOP9WniFRIjB1vJ5QN7bwO/UK6ByRQ/5nBj9Kg2XbowuQivioUjYpCc2PEDh5Y1sz8sWKyRJ
	WFy8Eb/orscnftBtePkzsuajQ2h8KTjAJTVRv5Tlw3BoR0+9vhj+7Q7Qw74jIiLdVnpHpU3n1vE
	wK/arKMacjIB8zR6ytuAZcYjPDA3HRf3FanpoohPkYhyOVHK3/YnZGSUufIrdRXuQosWuv+OakI
	gQrCt9N2PKMRgb1hn2rKUMCVPF9w4ZvmOM95GXDWJy52TlLQxomO3XHjDhIO2z6TkSI5EBqAmht
	9h5org8VZImUvK+vYV9e9ZKkhzqxYLCw=
X-Received: by 2002:ac8:5845:0:b0:51c:1a11:75cf with SMTP id d75a77b69052e-52d646b8fd9mr24139251cf.7.1786522763485;
        Wed, 12 Aug 2026 01:19:23 -0700 (PDT)
X-Received: by 2002:ac8:5845:0:b0:51c:1a11:75cf with SMTP id d75a77b69052e-52d646b8fd9mr24139041cf.7.1786522763124;
        Wed, 12 Aug 2026 01:19:23 -0700 (PDT)
Received: from QCOM-WFsSr66Fqw.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20f059195asm63327366b.0.2026.08.12.01.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:19:22 -0700 (PDT)
From: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Seungjin Bae <eeodqql09@gmail.com>,
        Kees Cook <kees@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sebastian Urban <surban@surban.net>, Felipe Balbi <balbi@ti.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Subject: [PATCH v2 2/2] usb: gadget: dummy_hcd: set no_sg_constraint only on the SuperSpeed bus
Date: Wed, 12 Aug 2026 10:19:10 +0200
Message-ID: <20260812081910.6821-3-igor.skalkin@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812081910.6821-1-igor.skalkin@oss.qualcomm.com>
References: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
 <20260812081910.6821-1-igor.skalkin@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NSBTYWx0ZWRfX0Is4y7lUhxeO
 tY0K3e9kkAVvE+CFNEmaZJ1zZBv1GMmU7XeCUmfdkR7jA2FLeAvb67u7hSC4s7QUkHWVi2sjWvy
 aHiaFEZLMqwIXOE2RhHSav5B5XRVE5vx4Q7P9+UfpNOfeWFLucTvJEQ6KVtWTNLNY7l07TTTSfb
 Z+KN4JZesEnrYMaG/T76p/0LsadYr1qOHS7qS7rtyRyU3W+LCVb1/X6sgUm5ne6hrc9pOCBs8Kh
 EOARrtdgZrwbOJnfXs2esdpQK2SaJ7fariA+TWvBnxyiSaocO7MSIbCSmbczG7wwDiPZOTNztdG
 T7KSQkX6AI5gMPXSNRwA0i8hRApdwbXVCVdkQrn3LQbqQV3PkaZnx7q8geIX3vKTSbQSXRln+hY
 pkzVqe+qe8Cik9jJyVWhOQUY32PyTqF/vLllfd8ET6h3eye7L6VDI9LPLFZmeqS6zPGVSdWcdD0
 EIE6GVefrhAPhlwPtsg==
X-Authority-Analysis: v=2.4 cv=Wb08rUhX c=1 sm=1 tr=0 ts=6a7c2c8c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ErlKB2RathMbn5d_X_QA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: TrO18MLopfEoQMpsTKLk4xcvrhnWWS9S
X-Proofpoint-ORIG-GUID: TrO18MLopfEoQMpsTKLk4xcvrhnWWS9S
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NSBTYWx0ZWRfX2SXsvr3qbP5e
 EmW/tShrbHwwJsehMr9N+ozHHRQcOaBPP6sqfrw6jsDNd6RDe9Fmw5aeBMULerydprLtNfQbYqm
 na1zXcZcaDW+esNpk2HLcGKayorJG0k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120065

dummy_hcd registers two separate root hubs/buses: a HighSpeed one
emulating an EHCI-class controller, and a SuperSpeed one emulating an
xHCI-class controller.  usb_submit_urb() rejects SG URBs whose
non-final segments are not a multiple of the endpoint maxpacket size,
unless the bus has no_sg_constraint set.

For SuperSpeed bulk endpoints maxpacket is 1024 bytes; usbtest
generates SG lists with varying segment sizes (e.g. 512 bytes) that
are valid transfers but not maxpacket-aligned, causing usb_submit_urb
to return -EINVAL before the URB reaches the host controller.

xHCI-class controllers have no such DMA alignment requirement, so set
no_sg_constraint on the SS bus to match.  Leave the HS bus unchanged:
EHCI-class controllers do have this requirement in hardware, and
dummy_hcd's HS roothub is meant to emulate that behaviour, so the
constraint should stay enforced there.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Assisted-by: OpenCode:claude-sonnet-5
Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 29f671c7b319..0ae600159478 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -2578,6 +2578,15 @@ static int dummy_setup(struct usb_hcd *hcd)
 		dum->ss_hcd->dum = dum;
 		hcd->speed = HCD_USB3;
 		hcd->self.root_hub->speed = USB_SPEED_SUPER;
+
+		/*
+		 * xHCI-class SuperSpeed controllers have no maxpacket
+		 * alignment requirement for non-final SG segments.  Only
+		 * relax the constraint on the SS bus; the HS bus keeps
+		 * emulating the alignment requirement of EHCI-class
+		 * controllers.
+		 */
+		hcd->self.no_sg_constraint = 1;
 	}
 	return 0;
 }
-- 
2.49.0

