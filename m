Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4A469849
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089294; cv=none; b=W8uKvclxWeynFR+83+mu/5gnETaGjeqx8gdYfl2WjEQMLw8v6VhpN/Irv+LcT5s4NfRESw2PtP57lumFxob502GBKriqzVmfHLBTxHA3d/vWT7rjzkQLTOBehzENjGSz1YVim/LtLANm6GrT5aWsoQskjuctiOgc5SyOpN8cCBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089294; c=relaxed/simple;
	bh=h/wrKE9UI9vVTiD6wFM0qTzctxZ3jhDpA5RT8Q1AXhM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VnPOPDykT+aNtJtvT/ac5QjFBl42CRA72Ub/SGpqRpT/pnVFg3Z5pnB89YLdlSDRSEFVtJCmsSrCdumTrjGAc1PmxGlYYcu04fEGmOQIYV0KKp08S20BtoosMf19VDW19IOaudDNogTKLpGA8uOxrbvivrEHZvLDLgmIjOiRIJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nl07FWQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MTfn7dIw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nl07FWQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MTfn7dIw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777bw4i3534934
	for <linux-usb@vger.kernel.org>; Fri, 7 Aug 2026 07:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zIsc/Mx+/YgbuRko6xlitzBSGxerjuSBdTI
	+P6ep0Ms=; b=nl07FWQZGhFo8VD2Z5/PWYL+oRWmVK7I4/k7DPsiY/Cz+W2psoH
	YoGwjEmUuWNQkoYJ/sfHMKRSVaorUx9YHUJ1Cxf67cewf4crPLmbebkOf+cj8wD2
	uKdsgnEtVobsTsB7LjgiZ2NZncI2WVVnUDYI6+jmHSIVoFHcEcDRdh9J5RqbsFfn
	cpxfRwFr+ccE7nlWqoNDaPwpfs09rWgH0AiB/8GTNrAH1OW3rONcqGlPPcPpqhTn
	Ojri7zkGptvfeYSq0UT0xts2YPGgigbKm7tVMnuPzw3kXIHHcLyVV+a5idxPhLIr
	pVUIxzfFtrwXENzGb6Qfw4NS6HTK4gLviFg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fu01e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 07:54:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso15098361cf.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 00:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786089284; x=1786694084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIsc/Mx+/YgbuRko6xlitzBSGxerjuSBdTI+P6ep0Ms=;
        b=MTfn7dIwgioQZ1vZO0QdIJZUCVMx+Fmx3uJpXV9f5vpVwJ46gnE6jCB3XUNtJd7TV3
         ShkZ5iVqJyrvR3ZukG5bAWEGBiq8ujjXujCifz/iAAz1CQBhDLHepIUMhkvu/7Uc6614
         QGf9jHugHGfCq+hjahjUt3L+mTqDQ+tyIPJ+2SmG0Q/sMd+abpi/akXOlty2/YqySu9a
         ss8JT9M4L2q3ZSRIFDtHjKnmBtYtsKYuEYrAo2+WsPWVDLj2FCMZK65qBPhQBljw4apy
         y9u+muXrxxAVO/DMAjHaWNOwNEPHM2bnt9S2tUWgUw0truuc4Hv1+qWGI/QIpC33KGe9
         ra0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089284; x=1786694084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIsc/Mx+/YgbuRko6xlitzBSGxerjuSBdTI+P6ep0Ms=;
        b=ILfeJvzhUHcblvLx8ZppaGALm1avygpjoNcgRbDgGEwLkGHVUmNQpQmN8i1FkJZUi+
         m/qbJ1VSnMR2Ina+NruEup6HnHbZrrqc7nTjHvA/N8EhmGykw+k5wN/ufeAx7NA8dB9e
         NPuwTLAvBjO1qz7HLHw99YyEdK/n1ZYMds+9Z2DxPG/9W2J71EeT/O5J8DjS4rffo6kd
         6fN9IL34bOKgK6AFu59leM78r/CalR4QOfktsE/xJsHLwIOnB6atfHYU6KmLQd2yKHIR
         +dbwYBI2zo+1U9+SXMOIgYI3sm9nCCic/dthDsjYOBcKIf3VGNOofqpzfO+2Wx2mPr1f
         et2Q==
X-Forwarded-Encrypted: i=1; AHgh+RovLBQIZa4UTNTBYPlAZ9p/xYg/9vUI9Q5P8a6JS/WKtjMBrWm/VgPx7hOVxDaAEcBWz2zVziStWlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsE3Ab2hgLYSYzj4CVsX8O+Y8ayhdCH99dxUVhdq/n/a7RDHea
	/Cg7POL3jCVlERxG2jd/gYta1UDM5a2ghdJv3Jwu3TeCVeMBya2qwYyjYsyKtSS9y7EIF6xOL61
	E8NjTBrWtCizHGpNuuHIKH3C6mx51f7qUosBXETzGm6DvyYtfZ3yUER0OXE5Sblk=
X-Gm-Gg: AR+sD124pV28PNlkQhGGz4XQtx9al66qWnmrTmVt6a1Z/2eJ0OvsTDoFdaKDXaaL3aQ
	WQCeIohBS+TUoJe8QepTpjdSALoSh5jLdcC3z6FfUBta6nlZ1w0nk87kpwvyTxeiQSn0gFr7h8s
	ySHlor0zeAYFfebAOhNotFu5/GHBkeb97+Vn0IVI9FdyWEa3j5YYE7EWTA7fhlTgwy8DSR7vbqN
	va6m1q5q2AAxGEdpHT0bA2OXiSfLIaBbyipDaejy93w++QkojY5PnsaXQMawxxac4v4k8s0Ui2L
	Ex1DJWp2SVB9fo7XVHFvYaUS571dOFbLQs16L8ZKbOR1+BfVmnaZlzqygj1XINxT4mxCG5NrFLX
	IUEhiMDXgdWk3+QRmasqqlBSmrGO6+hg=
X-Received: by 2002:a05:622a:301:b0:528:ce0:e9f8 with SMTP id d75a77b69052e-52cfaedef0dmr124696001cf.3.1786089284512;
        Fri, 07 Aug 2026 00:54:44 -0700 (PDT)
X-Received: by 2002:a05:622a:301:b0:528:ce0:e9f8 with SMTP id d75a77b69052e-52cfaedef0dmr124695661cf.3.1786089284102;
        Fri, 07 Aug 2026 00:54:44 -0700 (PDT)
Received: from QCOM-WFsSr66Fqw.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cfddbbsm20020666b.61.2026.08.07.00.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:54:43 -0700 (PDT)
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
Subject: [PATCH 0/4] usb: gadget: dummy_hcd: fixes found while testing virtio-usb
Date: Fri,  7 Aug 2026 09:54:34 +0200
Message-ID: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1NyBTYWx0ZWRfX0h2AP0esXEnW
 peV1JMczJJJHC8tAtZO1P9UgFVKlYZFRfs9eusDMCV/GkxcO1hEgFpzP0QKGYNdHfvXnnbGavdQ
 Gkj5d52WxV5vx2JlvKwF1QiPTldUE2DiXHriTTwQoGJe18by1P9PQy/GgYKw+sRiTwqVt7NbVkj
 OzSSvSPuZfmtSTJrWnUw1BGEUF3MRxrsmMwX1J27JQNMbg4/By4ksySXekbIsQKNtJZyXUfFM9i
 fD/E7xGrOQ89IdChuyq+Y7dh//RcoHfOlwHM5oBOQp/UeSj8nQ06HLFXO3P9ozOP2eT3Lc2E0/R
 bkMVsh53K5EO1iF6x6rHcPNTKm5cd9ijAOXgoVwd0MJCfmv33n5OxJrE6JMtwQZBV80p/soao57
 elbjbTto9ddJOWJdSpKPHGZVA+IX519qXvoHWPMvwhyIoEVu7gn6JIuiWH4o0l/RhSwMZyi4Ot+
 TinSzw6Ru83wKDfVAdQ==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a758f45 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=UyOYcBzQ0Ol5CKPl8_sA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: reuHzPvf2gxPaf0-UvGk4veRvCXmzEkl
X-Proofpoint-GUID: reuHzPvf2gxPaf0-UvGk4veRvCXmzEkl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1NyBTYWx0ZWRfX1WPTb6zH4od2
 gb4Wndi9LYTwCBdSlhswTeU1ZUu1tJQ8uIw9L0OREkeqOQ3M7y4G0nxsFwU2BJ7Wu2dp+TCtNwU
 AjosBdBdtAvbgV31NlSshflzvGS3bDw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1011 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070057

This series fixes several bugs in dummy_hcd found while testing a
virtio-usb transport under a type-1 hypervisor, using two Linux VMs:

         host VM                            guest VM
    +----------------+                  +----------------+
    |    testusb     |                  |     g_zero     |
    +-------|--------+                  +--------^-------+
            v                                     |
    +----------------+                  +----------------+
    |   dummy_hcd    |                  |   dummy_hcd    |
    |  (host port)   |<---- virtio ---->| (virtual UDC)  |
    +----------------+                  +----------------+

Most of the failures we hit were in our own virtio-usb code, but
after switching the testing from HighSpeed to SuperSpeed a few
issues traced back to dummy_hcd itself:

 - patch 1 fixes an incorrect SuperSpeed ep0 maxpacket value
 - patch 2 fixes a false -EOVERFLOW reported for legitimate bounded
   IN completions
 - patch 3 fixes broken SG transfer handling when a URB is serviced
   across multiple chunks
 - patch 4 sets no_sg_constraint, since dummy_hcd has no hardware DMA
   alignment requirement and should not reject SG URBs based on
   maxpacket alignment

Igor Skalkin (4):
  usb: gadget: dummy_hcd: fix SuperSpeed ep0 maxpacket
  usb: gadget: dummy_hcd: fix false overflow on bounded IN
  usb: gadget: dummy_hcd: fix SG transfer handling across chunks
  usb: gadget: dummy_hcd: set no_sg_constraint on the host controller

 drivers/usb/gadget/udc/dummy_hcd.c | 72 +++++++++++++-----------------
 1 file changed, 30 insertions(+), 42 deletions(-)

-- 
2.49.0

