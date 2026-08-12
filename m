Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707F239AD51
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 08:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786522763; cv=none; b=DNrt90aTw0n+YWyIXLYL75UtJvDLhZPWP/1pF0pwoKzTLyymIXv6GhzNqdWTH0EsfwtWpUAvW5dMebQyWZAw9Up3gySJik2Y8aU2CRxyq45A00HnLpOMXBD8K6VTW8Wvnh/rb7cD4DoZQzRHH7JarI0Ba+scAhTI21xXNNJ6lRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786522763; c=relaxed/simple;
	bh=D1X81vd2KLPz37oQ6q90rjiyhpDA8rh1gkcydw+HrrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/NVIxNFg66v7HwoglCKJcP2ewJPy1gbJ85J96FlpDvovdW0kj6N9DYg0yzHzXIcJzr/w94HmQGUHilhOuJE+tqetaFA++Zn+8ZqX0pHCAdbqJOe7tCa4hSsAxtPd4kPCs/Aeq5DfTtnWGDtX7d7VlXJrFgMTi80s5DZ5r4MzbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lAR3PsBj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfNjgKZl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lAR3PsBj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OfNjgKZl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62StH1720193
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 08:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q3JIg+OngKY
	7iCLbz15ubyF/RIEnjLmMqDycYXVYXlI=; b=lAR3PsBjZM8Ii97bIfKgU1eUj8b
	/OPoiTKw4qUgtAN8U4thXy5zal85/sDrAHTkPtZo480t+AFXwkKOJkaxPlisWQu6
	EXpcGakmXasPJLqKQfkvpkW8aFWav7NS7QdPonb4dRug3lVxtIhKvv8MYSLRjMgv
	tJDOI/KdnQ6txFsTtdMdGLi8vNmE2rjzyZnzwz3EtR9MKXE1bJ6BAxGAAWi05wZE
	ILpekeCN+sevsNpMw4lvgudQthoGrQa0OvnEszW/HVo8kXM8PovPqZTYg/S1FBlC
	oZvastbWaNeTqxO09PDkII/dhJMVwAm3O/PVxhST8wKuUKJAPREZTBUSDPw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hfw0vq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 08:19:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eac2620cb0so7796986d6.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 01:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786522760; x=1787127560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3JIg+OngKY7iCLbz15ubyF/RIEnjLmMqDycYXVYXlI=;
        b=OfNjgKZlCd5e8SMO8Jat+oeH7ZpnJA1z1zeup1rhP9v0q26wBo6YHXGLvegJm/oWNR
         1aXahjddJEd9enaft2gyTVJE06Z+6x/84zDUKpMzXTCctj8+hcC9GK2Iw2MhLDCaqWbI
         ruCroJeWRKGOiDZh6QcpkIgM4WEDIPGXkCo+/hL3wffvOfPg8VUnF/IEbW0MW2toIK09
         Ya98+FvTZ1IPc1bljbnyg675bjJ14odb4gzehJB5cU2n/296aqcdI03ZW1pbhqmO0D88
         keyF8FosO6etPDiaKzAf+gf5O7IsN8unWz4Z+BEUb93/rrUWoXqfMI+XBwJ1aJTue5aA
         9N9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786522760; x=1787127560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q3JIg+OngKY7iCLbz15ubyF/RIEnjLmMqDycYXVYXlI=;
        b=XvI5g689LL1d10osCCpFhzv/fyQMJpR3EFJ9mXiG1ploG4H9CeOpHFKsq4N6scAQL5
         ZkcdoNjXEDHtUOF3+eWtCY5w5hWDXuOz0trMNCprKQl6AKNIRi/PIQ6uCYQCW4a2PleV
         Sr9GJzdQ+vTppceph/NOn+18TqdOiGSYZa99pjHqwlkKIKz9wcu27Tlby2QhTDgCH4/Y
         4/GTxcd6fhvkDyRhLAsjui1KslBntZSzqZ3CmvtlzqjX6gMnGvvG6RtgzIq0XjXrw7H9
         lhUl4i8klyTTZ0WWFnOs4hoH64w71zEXjbfc+D0hjZSwkQ8jWv15PcWiFNnKlv8Dnylx
         qXjw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3fVUc9adY13c1kuXImE4ztpzs4m/PRwLWaxxgKL7prbDwJ2kgB611AxRXsfWMZtbSJja07Un4p0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN17LLwyy2sx4U3ctrkjLn7zlqxexz2oe+KXzyew57HCrQRPvY
	tnvfQpL1y2SIwZMJU8YYjwbTflNFHp2y2MCWLRaVSIqu64JBBCzIG46fBYJ1Uc3aZMazOh3jcEb
	GK+sIPEj1j1F4OuRqMfom9isDs+HCDQ8h67gzMtqAa2OG7RftWABUVHH/BEMSTlQ=
X-Gm-Gg: AR+sD13c2roVZL3A9SuAclgSNJy57YOX4ft6vO3T92ii3ClVjRfGAVlhCX6nUsGtIvO
	9Lmx+bfl4+aJFPgQTibiJZEdHfZBGVIPDVEGeoW/6NGbvYJ3nG90M86iLMCT0HsaVdQ4tpplsxQ
	xLunlf46qNJCdqaXslN72SL21dPKQ6kIilaH7Kkw9BljnBxoCAh1fmZDF6LJcVzMrRczvJ7HHJz
	nwC83uxfpu/vbCFVKR8yNyLs1P+K3ARDjrENh18P6BxxYS/DLjdMm6lmZFAEvjc323SQPC7KGId
	DiLnFOKDj45Gmv4aPSJyEFij2jnxZ2ObS7eUwQvWiYhOr1Et9IGBzALNKuIIe8fUOv40+IC+jq9
	MeNJLGtnzJR1hmTygTbtlcalddTt1mVo=
X-Received: by 2002:a05:622a:6209:b0:52d:4ea9:b3d8 with SMTP id d75a77b69052e-52d646b8fccmr25388861cf.3.1786522760493;
        Wed, 12 Aug 2026 01:19:20 -0700 (PDT)
X-Received: by 2002:a05:622a:6209:b0:52d:4ea9:b3d8 with SMTP id d75a77b69052e-52d646b8fccmr25388541cf.3.1786522760072;
        Wed, 12 Aug 2026 01:19:20 -0700 (PDT)
Received: from QCOM-WFsSr66Fqw.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20f059195asm63327366b.0.2026.08.12.01.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:19:19 -0700 (PDT)
From: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Seungjin Bae <eeodqql09@gmail.com>,
        Kees Cook <kees@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sebastian Urban <surban@surban.net>, Felipe Balbi <balbi@ti.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Subject: [PATCH v2 0/2] usb: gadget: dummy_hcd: fixes found while testing virtio-usb
Date: Wed, 12 Aug 2026 10:19:08 +0200
Message-ID: <20260812081910.6821-1-igor.skalkin@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NSBTYWx0ZWRfXzOxYIp9QPsBz
 SuPdrAvv2xPPkd2u5AiSUe0dlL/O/vXv8qRvZQkidii46i9bcj2VehlgRzaqhWtjOnd8LwOu5TW
 zg4WPF72iCeB6varLvFpkBZlSLBQIbI=
X-Proofpoint-GUID: WiEA3FjfYX_6h-CJh_X7l2Ht4N-zxoCB
X-Authority-Analysis: v=2.4 cv=fpDsol4f c=1 sm=1 tr=0 ts=6a7c2c89 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=iuzS63gaIvbllXXYX80A:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: WiEA3FjfYX_6h-CJh_X7l2Ht4N-zxoCB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NSBTYWx0ZWRfX6Z1dKqHumOE8
 ysIxj/MknSkzOKEmQzdEsUKi14yVkd/DToHbTWFILqqad/R3QyNvnApHyHhAPBJv1nmpkppDy2K
 q+zlYa9mgiJ6JJ7C33KcJyB8M5fDzXzq4XfLE249/5n2RPmb1/tvdgJBDnWB/uTJxNigLmcNgCW
 LRZ7q5AhfIk+V6b0V2iYZiYtfsENqxRY1MGeAhryQoJ4B8LZGVEAT6qqgr1s72D4vP71nNPn8J7
 4/GzKfL1jKUnc1HXowoMP0elvLNE8wYt7pzgKcf+ICFQirxQUDkWdTynIme2pbUrbDSUoIMBXMq
 kTtKDv4TFkpR887fp62H/Hq3Jy32SNXFEDfA7Rn0sRsmRrjalpooMfumLYEeMmE+GIQHSi5gk87
 3JmL2vlKRAeA6fsEQOEUnbXuN9luxqTb3xAVr0Xiwka9MqzBxHCtCjwHbhDZoU7AncSwizDU1HQ
 WbTebw4HoI/PgLBOgPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120065

This is v2 of the dummy_hcd fixes found while testing our upcoming
virtio-usb transport driver (patches for that will follow separately).

Changes since v1:

 - Patch 1 (ep0 maxpacket) is unchanged; carrying forward Alan
   Stern's Acked-by.

 - Patch 2 (false overflow on bounded IN) is dropped.  Alan Stern
   pointed out the fix was wrong: an IN short packet where the
   device has more data queued than the host's buffer can hold is a
   genuine overflow, not a normal bounded completion.  Agreed, and
   there's no replacement fix queued for this report.

 - Patch 3 (SG transfer handling across chunks) is dropped from this
   version.  Alan Stern confirmed the underlying issue and suggested
   a simpler fix (resync the sg_miter with sg_miter_skip() after each
   consumed chunk instead of restarting and re-walking from
   urb->actual_length on every call).  The original failure was
   reliably reproducible against an earlier, debug-instrumented
   version of our (not yet posted) virtio-usb transport driver, but
   is not currently reproducing against the current version of that
   driver, which makes it hard to verify a replacement fix with any
   confidence.  I'd rather confirm a fix against a real reproduction
   before resending than resend an unverified change, so this patch
   is held back for now and will follow separately once reproduced
   again.

 - Patch 4 (no_sg_constraint) is reworked per Alan Stern's review:
   instead of unconditionally relaxing the SG alignment constraint,
   it is now only relaxed on the SuperSpeed bus, preserving the
   EHCI-style alignment emulation on the HighSpeed bus.

Igor Skalkin (2):
  usb: gadget: dummy_hcd: fix SuperSpeed ep0 maxpacket
  usb: gadget: dummy_hcd: set no_sg_constraint only on the SuperSpeed
    bus

 drivers/usb/gadget/udc/dummy_hcd.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.49.0

