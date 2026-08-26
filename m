Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F3F3A9620
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 17:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763840; cv=none; b=OX5kUxHRwJntx29tJDaE/leOk21MxcNLwYSVeTaizIZUXk6WcfyT+ff6USWVnIIiWh1tTBNgVlKrNwzWfUBNfRDfsOtZeVx2bWkyPKPctu2+VAGoRd3Vgpqvv5LhoN5bFdZAUCVcu0LAyEgKXzL56Nw3uJlpSe3RZrK+cQM07aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763840; c=relaxed/simple;
	bh=JmNFZyPbdOmvWrGytmgIq+OZ/ncJmYtkqcaiw9+0EZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ah9l1JXqOeIPpc09IoZ0wzpgQacfVZyfkqNl6NN3NNMaTj0lyH6Cra6upvDW1V31H3ke1zfTaNb/Z11UBUlstz5/l5SB/9PvipQ9pKdOg66II8+/2RJmG2MKmE5NWol7oruTSE19gU56x9dzJz0qszYjAJKobdM2KWYSVJ2/XhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1atVNFc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eeASjJb5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1atVNFc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eeASjJb5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGv7dq1008434
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 17:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1yggnaC19Gp1PuLDDoUv9K8YjHZMTLGQKuxWhz+C0c=; b=b1atVNFcf7vwR9Kj
	TTKCO3Z39yxNDHgW33D7CZFihE15Lon0pTc5r6/LPJTvhRz5wImmprLb9mVlFfEl
	fT2UwU158dAchNPzdPa1fzn8tqkkUaA49rFKzkeW9+xlrLyUtGzopNLPRUJQms+Y
	Eokrr35qgcUSvm/8TvxGG3HScjrYJnIQbB7ovVa19z2uudYXH6RWcFDYjeHNEtqH
	BYMPiThEyM+1qTz+BhXVBR+3wGv3oV9z5c0kOKQelN5bATbljYNuie9z2NEj+06B
	1eNrlqeksyRG8bDsfTrH+umDALynHyYJgwdLHVbl9a2/FkG/OyXvUts1OfPzsLOK
	bdaeWw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smxauwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 17:03:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so16128025ad.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 10:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763812; x=1788368612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1yggnaC19Gp1PuLDDoUv9K8YjHZMTLGQKuxWhz+C0c=;
        b=eeASjJb5Axgz/XP4lnWIz/VKxkXL0ERV0eRX3lkobV3HVnEPQXqvXLE3ULMFXvEXiq
         ExBY7Wcuut0x+y+AZ6XTJ1nHRRZSZzBCitb9Qmb6l4jXp7nSp2iCJFDGDX8uJ59moIlH
         69JMNONp7vPXW33e2eyLRcWBlcypT2uqEXPZKEraR1j49wGhwj1lz86d5hPFAi0zBk47
         aJZjZGz0/89g7skW/j07EWFp9Hmljg/kLDkQQQHXny9JYoWMgqMqXKTDjl04zyJvFwEz
         u9Vxmqz+bcmjEefvrOk4PTFgvROF42Vk0E12fQzT8xBGFcJkXY4CcMGCRY5RM8kC7L8C
         U/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763812; x=1788368612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1yggnaC19Gp1PuLDDoUv9K8YjHZMTLGQKuxWhz+C0c=;
        b=VFk6lJdxdzbBEJrCqihk0gvMSH3hwWcuXqDo/cg9Zwm8iV0agJLCtlJPGsJ1YhR7K/
         pDsyCPRX80KX2epIG6zQSAoyWBUJyf+kCmJKGz58NIl0pFc+0VroFSRgLKWJXUHgr/eh
         Gz65n+pc3t+cS/JH8wxdDU/hq16awDfAF4+a3rwAmDizF/8yNDo/IF2z5BKHfbTFCc8V
         clG2ABDyN0LBdQT773EU74P3pU2oVhen4WR1Whh+V/EdX5oS5R4MmUSZZ/V9S3Uq8ynJ
         WFYoel9vGJu9UfAuL1UT8875R+nP+YChtcu7dCrq5+/n7EzA5p1E4sPAl+bwY+Kf6ewQ
         owQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrx60ffPawFF0rwdGJKjkhaVqvGSydP5NXuCSsQDs+vUyd7jyp81LOzZ24Iv4GHdirMVctXbAmbx4U=@vger.kernel.org
X-Gm-Message-State: AFuF++lx8ODH0wmrCe6l/mW9WZRuZ2Es35w7Yjpm8PVtw5iDX1DOhoYm
	0tc4xonPhLpEt7rnNl6sq6PhqS8tImPYP3v8gESBiLJvCAMcUA3RlmDGgR4x8mO95rCgtJs5wQ4
	MPHLKi1I9FIYSzUROQ/2xcsLzvxmnxdzxCff/sQzi8DOVU1Vknu64mL+Oz5cl55g=
X-Gm-Gg: AR+sD13/p+MnzfhFm4VArL8CEkQK7A9hQNqqnMyg31o3D/1H1iRkNpS0bB6R9g5NjEm
	6kcwe/MMPQ499VFCxpMmIYITXr/wt29hOSj0DT9baUDbVMP5KDz+INTHQiRdxeUzovCRuq0/HPx
	M9Al+r1BVsY5v3tXqBJwvYac/fyUttD2vB0HjWG+CMK7q1d14QKCPQNWJPVU3G6CjITZHU1JKcV
	NIgd3bydNxngWOyOUr8LSAmLWfATqG/bo2j3xKd7/U93Lx56bBDELDJKWbGTd1PJXVL9eaZ5w/i
	fTCmN6FOts6RYssWyj1JYNp+2Lr8lDPix70EvH8mg75RWn1ASZrqIU8eUN+PtQHUCG3zrOyYdmH
	EfTjY6K5UOhN1Qkj0z9XmDif7y0852A9JYrZpLCNqI3lvH/wfo00irY0OkD4570/5/1GXDg==
X-Received: by 2002:a17:903:8c5:b0:2d6:3c2f:69b with SMTP id d9443c01a7336-2d707aeb1b2mr176403145ad.8.1787763812379;
        Wed, 26 Aug 2026 10:03:32 -0700 (PDT)
X-Received: by 2002:a17:903:8c5:b0:2d6:3c2f:69b with SMTP id d9443c01a7336-2d707aeb1b2mr176400575ad.8.1787763811597;
        Wed, 26 Aug 2026 10:03:31 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm9938285ad.31.2026.08.26.10.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:03:30 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:32:53 +0530
Subject: [PATCH v6 3/5] phy: snps-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-eusb2-interrupt-v6-v6-3-ae2601cfa80c@oss.qualcomm.com>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787763791; l=786;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=JmNFZyPbdOmvWrGytmgIq+OZ/ncJmYtkqcaiw9+0EZw=;
 b=Thl+MigrVDnRdnpf4myP9BVRYDtHiWYAUHR1335aGtIbK3xOLkXgyVazvZ7swZ06H2nxhcsXH
 oqB80L+BqkQDO+CEySKkSIK/UxAoYfhrrsRERBKPEj0XHDgLJtm9BXe
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8f1c65 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ugjOiUgvsQrqGD8bgbUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: QKCE2FhVcXcxK-iofVFoQ066pPa5ZLQh
X-Proofpoint-ORIG-GUID: QKCE2FhVcXcxK-iofVFoQ066pPa5ZLQh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX+tIOFLADR+3y
 85J3fRph18ED4JOmkDDefp3C9BxV0+EYvCI+/jvhGRW6+MemiYT/AraBsanua+pU3/rH/lcc+k9
 Il2lfa6WctM3z6U7BQtQ9R1NHPoo+MFZ9wDCNI2fAnBR3kjKplhuYzjkFttViCCufRP3e7sQoOQ
 ZoxsqDDn8xqzyShKrEOXdsyKaQrlXUzLh5HqBo1+lEfDx+OAwai6kf69JTpPXBr6Nw6sXBGO+7i
 xSLs2K5D6oaAgGshniCy5998hhN9qhdO+QFnfFL7JT2dNE6ORC3msF4TCOUiGc4a3bs6CpIDWfA
 Wopk6WRU/wk03CMCkLsIgL7lTb2YH5s88t05ql3SYZV/eGV8A2ewQrC6ojhyglGJT0GhMg/8H9K
 H/0+EecEH4/nIAViyoOWBiDqxMy8zje/Y8CcmjowLFwCeylnk3M8/mPd3AMnYC4MgdgqdBkGaiG
 w3caCa2i090wS4PiC6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfXx8mdX6P0P9VK
 RDnstE2C+wn4vJho9XM/Ag6v7NO9EBbfY8D4f9a4P6z3ac+TIRoNmkqWkppgh1vdMNDcNYZ6x02
 jQQxcZKy10H1HrFVoo8KjWPkJw2aCus=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260141

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index f90bf7e95463..fe4ce9d752f7 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -597,6 +597,8 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return PTR_ERR(generic_phy);
 	}
 
+	phy_set_type(generic_phy, PHY_TYPE_EUSB2);
+
 	dev_set_drvdata(dev, phy);
 	phy_set_drvdata(generic_phy, phy);
 

-- 
2.34.1

