Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33149175A83
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 00:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790899667; cv=none; b=rMpiq3a+Fjdl8cby3wxyeZ6IX9LDssFwMdRgdMnlD4+t5Fx9tX+1mtor2BtLceJYzJ+xO7VQ7Ryx0iwko7SDHSBnndZuVso8AfvUbMG6Dy2INfibRA/eqCb8sc9FGY4aoOc1lQPvLmn438PccRuQxFwucPuziG7GZpM4WD151Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790899667; c=relaxed/simple;
	bh=zBZcmNXuO/NzbVEJ2ouyLzvkw/Q/Q315SZOdwDqgSz8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NueStVmxfiLx9RGQ05AglSmqOlv92nFxFbMzX+HLlfxw1DpFsBcrx3xfB6Fbnco/xD/R5Y/uiYpH6kmIU5Qnppt5SAEy5fSZ6fjU3IehjBmOBsqHl2oG03xr0RWSVLPzzEE5G1CurHkPPxKVrUL981hT5Smj2oInMHhEHsXo1Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGYY9l4N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyueMjFm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGYY9l4N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyueMjFm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NEmTK2601773
	for <linux-usb@vger.kernel.org>; Fri, 2 Oct 2026 00:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQJfU3IjbIoORZkplTaHXj+Q637BAZn/Le9NwQ7gxrg=; b=DGYY9l4Ni1dKF1cr
	nTiRY0j2Mh1V3O46h+ohmBvjRCseYBcrr5rjXL7LXOU+vsCaGHrsJcTsNKIgdS+b
	ZU+tVVyV7JB0ladWSyf6lkbQoi4GZ29GJIA9na/RnbJv+78nFJrzjICJMDlM1nGC
	Jkffn6xR2YvbiYRXjAHD60ahWjaed4PYNowUIWqxZmTAeAakPqp6znphesKyUd2V
	tIE+CwqCpRn4KwlfGq3jMizCFoBNL3Sp6V67/4F+Kqr06KoWEwFobxHP+l/E0cg6
	OGso03e1EuUYJB+pd3Z2AgWOw6XywEe4YdDVxJsj5sPP/PftGBeiH/QMZLjZdrfZ
	fwuM7Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxe91ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 00:07:45 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438719cc1eso8419392c88.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 17:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790899665; x=1791504465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BQJfU3IjbIoORZkplTaHXj+Q637BAZn/Le9NwQ7gxrg=;
        b=VyueMjFmTnhLyjGYEOSlTrE7Dr0kTSabq//nll0hNYgwExaDytY3+Gv5y1ydbw/bM+
         UVep01CTNk73funsdordBt/dkGp19BmnF/WlUcaogqsPgr2Lk/e0OGl5YvckoJSzYSvz
         jHyZxVSknNGPom7C2LN/Puwnc2eZ6vRBhS3ANucJEYIDD7LKcgWnSNdunkhcdIzvKkVj
         oS+DWqjtZuEcskvJKEhsq5Kknpd7AxBpNXGLYs3/Sr6wvtVQSf6YgVMiGOHe6yEZZRP7
         WoK/I3WQyK/TA8fn1D1dMWI5qsuCV65BV74Fxr0XygyhN2Cup05Z6GDp1Is81omaosQv
         zoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790899665; x=1791504465;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQJfU3IjbIoORZkplTaHXj+Q637BAZn/Le9NwQ7gxrg=;
        b=EU0Nr7KqKJLBBHDf/01LBBeDc6pJfrpqEjmZ1+hQ8cpZjgQ9x82kKF1UhH+mL6c0qK
         hhY4SKbxxIc/cTqaiQip5mfwhBKy2ojK2OGK2oq87siuQyOkQV/AkCuyWdJdhFfTmU/q
         Q+lPaBWqxJ3aFp2u8WHDTENKM0myJC69YOiSJxIyKg9GMkCuq6kOwOQT+QRF8dbHkRNU
         t0VBTxGvBPb4SYCXEu29ftkrc5wEawp19Duv6+H38/I0tg1TAZAAfjHvDisKgBgIW18w
         cQXl4el+yfOD387zk90GLVAUlqY0VMhRydzHjAS0MJl0pzMzVB/qbQw6Pw1C8ygSIsBK
         Yq+Q==
X-Gm-Message-State: AFuF++nXP49OinJFgZHqxuCFDUUC0Ur39mi8bUd8zkn5M4Wrf7r039ro
	qjnPK+Wdj766uhUcPd/tam+ZirE94LwTAchu+XT0EFKeMPo0pSOfCVtH0rFUgiO4tMD3aHeuVl+
	wAxvFiHxepJJVrAhHsRMlDFxwSz2iZAp61kPdnSqJR48+ypoR5hRaB5gzk3ODPjw=
X-Gm-Gg: AYBFou2zsqJjQUgEhBJZZWDNdWRfPQfzhInAi9kOvEFQ0AT042PWqmQ8Ui9jTA3w17t
	W3KtInUbb8baUlxVoYb4vpV2h2OC36j26+DI1FXrU1BGsEfjC6J7749jcPudHPnIwZmyU3Q/fpO
	vNrf6DROXTMqgQC7i2d+jcI68JAis9KF7exwKEosDv55aSqNH9N5LFehIvTMkOBgtiWgFOBV4TP
	+UamenfPnc2iMdC6sWtqnEpmvD+JAu0hK5gor/3pOErf7EYrGfR4p716HYcBwhWqkwmzTN7EDfc
	zTaAvucZ0DTjSlMIBgU2BhuyoxnnlwQxB4N6sem1D5vnyiSgichGg+C57oiknaioaa/cbT9Vkhs
	XmDDugIzO66CzE7czXNCA0DcGB3r7G60IFydleXh8kDBG7hZzDNhypg==
X-Received: by 2002:a05:701b:4509:10b0:143:2967:c0b0 with SMTP id a92af1059eb24-14f5bdf1a6dmr871489c88.24.1790899664533;
        Thu, 01 Oct 2026 17:07:44 -0700 (PDT)
X-Received: by 2002:a05:701b:4509:10b0:143:2967:c0b0 with SMTP id a92af1059eb24-14f5bdf1a6dmr871441c88.24.1790899663730;
        Thu, 01 Oct 2026 17:07:43 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f660f1sm1561300eec.13.2026.10.01.17.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:07:43 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] usb: dwc3: Clear SUSPHY before issuing core soft reset
Date: Thu,  1 Oct 2026 17:07:41 -0700
Message-Id: <20261002000741.450793-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002000741.450793-1-elson.serrao@oss.qualcomm.com>
References: <20261002000741.450793-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abef5d1 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=08aMs1y6DiTsec35tm0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: -sSoeoGdoACnkJAC5APmcOrP2w6cwwQE
X-Proofpoint-ORIG-GUID: -sSoeoGdoACnkJAC5APmcOrP2w6cwwQE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAwMCBTYWx0ZWRfXzX7Os0hCbc5u
 NL1RRnXb70XFOxcveSajrzxC9gqdmop3xjUsNVStCObAYGBhx3Iva7qyySYTroO7sCeAYd3RTJD
 ixIsV0rRZXaxtHW5tDWGMwSYlbmSKIDLrrc1lJ4BaN+b4y+AjUBchqjnTfIA0FUvBHZYn1cqMxm
 UGVE9LHpTgrHFL2OI64JbBl+6KIcIbNtbGhEk42vqTi6eTs9v5wPHbpoQf+23/GRrawnp3tIkru
 1QMvtJ6KGmhS8pbwyX1R/pAGNm9CJaXZKwDoJ4Sg3t5dRenxzK7WYoeAFAr+pWljfdIuxoNlJFg
 ROgPzlNVRWnl4ch9t5Ppn+pSvyNn5febAWdXINPUT5tUJbDpwicVY2g5x/kcheEKof+5CECOACf
 gV7PSxaJBp3jShsDK7RzsWCw1iDN+y2yV0owdr0nahEYdWV6Ch8myDUi22GfA2kfAUkuwTrZtN5
 AZmcCHSZb91GMi1SSzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAwMCBTYWx0ZWRfX7HtRoVs5cllS
 8LdI1rhOrP2g1ScNcFTE0UGo6SIVzqMQMa6QHfuklU/xxTjPP2kxdgMN4AbEsnVg4wcZBxoUPnU
 rdq8eY5+dDsZtOZFMK4Q17XkZE2QpPI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020000

The controller clears DCTL.CSFTRST only after all required logic has
been reset and all PHY clocks are active. If SUSPHY remains set, the PHY
may not be fully active during the reset sequence, causing the core soft
reset to fail to complete.
 
Clear SUSPHY before asserting DCTL.CSFTRST to ensure the PHY remains
active while the reset is in progress.

Fixes: cc5bfc4e16fc ("usb: dwc3: Set SUSPENDENABLE soon after phy init")
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..282a853c364e 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -332,6 +332,13 @@ int dwc3_core_soft_reset(struct dwc3 *dwc)
 	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST)
 		return 0;
 
+	/*
+	 * The core clears DCTL.CSFTRST only after all necessary logic is
+	 * reset and all PHY clocks are active/running. Clear SUSPHY before
+	 * issuing the reset so that the PHY is active.
+	 */
+	dwc3_enable_susphy(dwc, false);
+
 	reg = dwc3_readl(dwc, DWC3_DCTL);
 	reg |= DWC3_DCTL_CSFTRST;
 	reg &= ~DWC3_DCTL_RUN_STOP;
-- 
2.34.1

