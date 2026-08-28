Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F045A3E3D86
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 21:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953081; cv=none; b=uliW8VPjm03t2Z242HOyEYVRQrU33y9CRInP32Ix0jHwKDkdi9uEbhgHT7MSYWxg6KhjY8gw9E3JY+S9h8JyNoYDwmGDvBxr6Fpt6YCfyKLouR9g6k+K9ndBJO29vZXeAkxMtkepAZCzl23m3Ka1MckSAabyxRtIzmUl4Kkk39E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953081; c=relaxed/simple;
	bh=6k3p0ySqBDsyF/vFgmLfucoHCiVzOtKxA6qYkh5DRN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGz8Fc2j4jJQ1LU0xncxvmE045MzLAizE8cYH7TyN89Ri0XmWsWyAhz7EzgR6Ug7awgWBL71z5Ypcry+792Zv3shuzBiHVvbEPkZp+zzqlShft10gcYZEek4PqIlOtzQw3ObOKWNURFRLawUVTza4R+Jt9H0jLejvoJKU39TQ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3OlHNtQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NEt44Klp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3OlHNtQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NEt44Klp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SJrCvO3879270
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 21:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6yZymeJtaZo5lERvmK0bkufR21pmFncW0lW87uQacK4=; b=b3OlHNtQDLxxWgkH
	vZlP6F9g/Yib2f3oKfIWTJex3sp5cnOeiBe7vG0+Bu8171znXyzSz5UFagBcefBQ
	dRZqPCUqNuU34WjVHP3QSHZFBg4xlw4545qoRVdPcp77Yx6M3r7b/dlcXbMorA5W
	753v2QuVEkgCr7ApykfewqtkSWPIlHW5zZpsbx/Y+6ZhwGujgxLqhpI62yBFkmr9
	thDvRPf7M1K3zdAPrx4R5DHTN6lcWU4XwWf9gFqR+3xly7RAgiumMRmWPuxxz6Nd
	GiKbl4ferOpecVHGyogmADW/BVzwbCQbSL5SqAZqgc2DR2/hWZaiC5pDL+u+yAnr
	Gi8oYA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbgvfg8e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 21:37:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2316668a91.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 14:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787953078; x=1788557878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6yZymeJtaZo5lERvmK0bkufR21pmFncW0lW87uQacK4=;
        b=NEt44KlpXlwDgNnmUE3bsh71d84a8h8mLRU9KPcrJM9RWwkPiaH7dd2+qL5GauQ/x8
         6HSyC5z0LR2lNHMJCdw5JVgOJ+Rb7ezTK2nyab+xQEYPvNYUtIc7qIDqVYf/0vdQ6/+q
         1ZRI8QPRdRkNGD/DTSU4Z55y+rG7IbYONuPYRh2IqEt81738btN+gUDpwIpAxNzeUoSe
         jYD3WcNBT6ADHZumFGvTmrav2IEv5az8wrEjr0YvFvxZHB0gMpa0RzBs23G7xIvQmfJD
         eU3heMXBukUDxrbm7423bPbtJnvnvoD/t6u7cgNbjtecVIxfAEhVUbTwdKFusGcIYW/Y
         LMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953078; x=1788557878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6yZymeJtaZo5lERvmK0bkufR21pmFncW0lW87uQacK4=;
        b=VK2HH/GGMrsvgtE6s0P/vSf1VAZ3Uq2as+Jipr7iQ3f74gg/zgH/E9+XXb8BLpLfL1
         +P9Gr93ytcBx4HVaqVqkZrFPvePkXZEdWPOLUwHpP8xkS5v/jMyASbVD0texeyEGthrv
         Z8+21FQO3BR8IZxQWxvyQZys6V0TRUD1fn7+uJq5Mhzbcs9NrpndWgMq7el0gepH6Vgu
         L4JjHQ/COtiUHwCro2dpZ136uapj7n6NpXjsr/JWhDqOuIH1EP6gCg79JMKTLWigMpDi
         0pAeOVTTaNF/6lVnKzeRMBmrF4/5DqBT4aBbY9ZD+O51vV1v9DTp6hQQQ0UMNHX/AaOK
         +k7Q==
X-Gm-Message-State: AFuF++l1ANVfCL//vW8w8AXX+H+OVPRgK9Qg9PfnN7H/6E+ReWPe8nCk
	P6QzLGAZaeD5cHBF5l9xrbGmz5vPK7LKJdY5CJkUMOcRvRDuXLqyXRGe/61DFHEkeRB5Klpa7GW
	qivfkaOYPr7iRIHYNYwB3snBlnz9gQ2Yi0624ywEswq8/U5p2IQDrxPFu7r0C8uc=
X-Gm-Gg: AYBFou0SJMeHNRrkjnQojAf11vLJLAt3Z395WvmEE45W1xlMkPm9jF+i+eQLV6ycgs+
	gcgAzi9E3KVqKWUtbjQpibw1zX098KeSdXuVnwmNce1GGWdNWACLGRIot2Zf8fOal6+mx7VawuP
	55HhuC6IWLEpoiyu1y+RaaM9CqkxD0FaRYOe1j5rSwVWxk68jltrHOHwlzBY0ISa2sH88PGmsqV
	u5TSLWz5J2TVZ7tDuY8gkDHZLfRCFBquMJCzMABFij98bVV+pDe3VM/wCuAxvJuCrJ0TnEeQ+oU
	iZZ+fEylUEuqeAoQ3nhwYaAXKFgy1Q8sBqHRKktXwj9A0WG1vlt9yRUVfT/tQbo24MAfMAJoSt8
	U2JJXK+yQRw61/cOSyYMyGR+Xj+huvy0VCNQVxjDbnGpTTfC9k6Rj
X-Received: by 2002:a17:90b:3a45:b0:396:5785:843 with SMTP id 98e67ed59e1d1-396d0f09a46mr18686547a91.8.1787953077866;
        Fri, 28 Aug 2026 14:37:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3a45:b0:396:5785:843 with SMTP id 98e67ed59e1d1-396d0f09a46mr18686481a91.8.1787953077320;
        Fri, 28 Aug 2026 14:37:57 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm5892112c88.11.2026.08.28.14.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:37:56 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:37:53 -0700
Subject: [PATCH v2 1/4] xhci: sideband: fix ring sg table for sub-page TRB
 segments
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-16k_offload_v1_b4-v2-1-8a46369ebbb6@oss.qualcomm.com>
References: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
In-Reply-To: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfX6gN4b2baSSMt
 HEJbpN3Q3JXvRz94UDcEl26gYI1j12zFBi3skTmTIA3GqgUhBGhDzoIgJ4JfY2Wk5nhyQWsS2+t
 xELW9ml0tQ/Q184Pi5uTuC7ZlMGH9D26oopgAoyRPxh6K+a387ki27/FmBAlGwKNyIJgaaPNMgC
 QYFSnZ7dVwQ0NI0Z9E5gyXN9dzIn+L9Bg0WXKf2J8kCzUYGooiEOpqK4m0KP9CEbtm4ip4eMylZ
 RQp6JC/wvFQWjE2uOoboo3zMSLPA/fpPXHk7B2BtdqYXgAoqjCdLJcvthRIdTLrltNkZn2s7CoA
 9uK+38I7BQHK7QsftSLbLrpqgVmq8XCfDJTq8/6J/lBOGDkCMYJLbUH7U3Zhe1w0UVwDPmVAMLe
 aXGrcrdOiKHoEkW/textFKJ2IoB1IDLawoY7DJiYJVJMs5AE23T3YX+cUVpraqKsxxEFkJZi16o
 +YTlYDsXYf0RaanuQMw==
X-Proofpoint-ORIG-GUID: hz6OqFOv2cd7R5cyL94vyzBjzIcTXi1F
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=6a91ffb6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aXGjAn6Wb1zARzc8srgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfX6rmCNSlZhyuc
 VyUGTStnhJhgZiBg8QLzyuBQlNDbWb1vvh+07YNe/HjOskKbaqskuvOUPbvvOJBF4SADonKN7UA
 SueaHtQqOB1BmBN93N7zk3LLEQOQjGk=
X-Proofpoint-GUID: hz6OqFOv2cd7R5cyL94vyzBjzIcTXi1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280188

xhci_ring_to_sgtable() sized its pages[] array from
PAGE_ALIGN(sz) >> PAGE_SHIFT and always passed offset 0 to
sg_alloc_table_from_pages(). Since TRB_SEGMENT_SIZE (4096) can be
smaller than PAGE_SIZE, multiple ring segments can be packed into the
same physical page, and the first segment can start at a nonzero
offset within its page - PAGE_ALIGN(sz) undercounts the number of
distinct pages actually needed in that case, and a hardcoded offset
of 0 silently drops the first segment's true offset.

Take max_t() against ring->num_segs so there's always at least one
pages[] entry per segment, and capture the first segment's page
offset from dma_get_sgtable() to pass to sg_alloc_table_from_pages()
instead of assuming it's zero.

Assisted-by: Claude:claude-sonnet-5Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-sideband.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index a5deeee4d5dc..1585c47720e0 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -24,10 +24,14 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 	struct device *dev;
 	size_t sz;
 	int i;
+	unsigned int first_seg_offset = 0;
 
 	dev = xhci_to_hcd(sb->xhci)->self.sysdev;
 	sz = ring->num_segs * TRB_SEGMENT_SIZE;
 	n_pages = PAGE_ALIGN(sz) >> PAGE_SHIFT;
+
+	/* TRB_SEGMENT_SIZE may be smaller than PAGE_SIZE; need one entry per segment */
+	n_pages = max_t(unsigned int, n_pages, ring->num_segs);
 	pages = kvmalloc_objs(struct page *, n_pages);
 	if (!pages)
 		return NULL;
@@ -51,11 +55,13 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 		dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
 				TRB_SEGMENT_SIZE);
 		pages[i] = sg_page(sgt->sgl);
+		if (i == 0)
+			first_seg_offset = sgt->sgl->offset;
 		sg_free_table(sgt);
 		seg = seg->next;
 	}
 
-	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
+	if (sg_alloc_table_from_pages(sgt, pages, n_pages, first_seg_offset, sz, GFP_KERNEL))
 		goto err;
 
 	kvfree(pages);

-- 
2.34.1

