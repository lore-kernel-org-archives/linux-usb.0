Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E958442B30
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 23:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059641; cv=none; b=nhU+kQvESVdjBs4e3hrK1ymK1RraWVJVCP4JmwyOyGHYjV3zUgK0rWyjlk+WXPJE2DYlVI96RkB7oGqaQ/zMiOC1HRrMIaOwj5jXpu5XiK7wYEeG0KLAWrEDFtneZYQ6YCwypB/zYJL7pn1FYKGgKDez/D7rN5cXFegSl19u3vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059641; c=relaxed/simple;
	bh=JAA81vpRRaPvbn8Qk7Q5/2AalrGhpihpY8nPbY+98GI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/fc5JcuFEobF5MME80FTZjM9nfG6g4nCbslzOaaAE6Cyokx02C7V3WcbOoui9BIbgJApTWTk17K8Y4HQ05mDU9ueddN/CEexS0C+FQtjk+HO31BB8zJ8Sf5/8ouTAWcME0b7ETJ2eYfM3ddkLtTQnu5EcUPJOdpSccRIzwKCV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izyhhPLs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLipEE87; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izyhhPLs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLipEE87"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676L85al3662031
	for <linux-usb@vger.kernel.org>; Thu, 6 Aug 2026 23:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWXQckph0JnQMI/BG6hZ4k90rdSFUNrjopRCJIVR11Q=; b=izyhhPLsHcfPViZG
	z0TxDFnXixDKXjtLH7PQPSvXVuGXM0+Vz6lEVnxz0og3cmYbvioCXE0jW1oKPBcg
	txjdr9yAzm/tXQxQkNWnkJ/EVH8XqME9nW2B3VhHrQqXgt2PHt3m7oUabeyqHxWs
	fEPj/Uh9JM2MZ7bfqYEmwFEkdc/a/3x1uq1J2ohuAaNM2IT7fcUYNm0/f3ytYn4s
	QzowcxqoiXhaiJ6oSRPQGcQSF0iWkL/ZD0kCmn5FfHiWSu3HaTua0q7FQwgXveOA
	dYokDfOR4nnDVsjlwLDRLagMFcgmxyVD9YmYdWEbuAtjyymsnovZ36gCYL+Xp40k
	caNimA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6h97r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 23:40:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so1398171a91.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 16:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786059638; x=1786664438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jWXQckph0JnQMI/BG6hZ4k90rdSFUNrjopRCJIVR11Q=;
        b=kLipEE87pVLzQYOr4dyBdMeYEJLblmkdsvPTTy8BBW2FQQHvQZlfT/h2bsLGV+c1fu
         wpBWdSVeoVop9ohFjzQEBXPnwwwCU8lG/Dfwf2FEjtw1bA7K892QSbVPHGsSyvOtrbYO
         6ysXNkYsoFoJ6dnRr2onB7a0jYM/hNTVmLWonQ1qVumv7d44h9Vt8I5fe13VFvOph8mx
         /y30+jGUHanR/cMjX7iQnGHJkonp7S+yIqxy0kClxIC08uy81uE7F2xucw5DLHEa+AGS
         Rec+sYvPpFBdJ/ijAwlLJmxdmsMRgLe5WhcUnVNghG3gqd8sojTnMTloZWNYNLHclO5w
         4BQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059638; x=1786664438;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWXQckph0JnQMI/BG6hZ4k90rdSFUNrjopRCJIVR11Q=;
        b=orYsMyqRBd7os4MhUr3DMC4mHFAW645qF828LEVwLgkapX5HX6E7vvmDAViXjYc/Tl
         BrB0nvCWU09zRuQPGg3PIuVvn4UPSTmAjytrHhD1+1DSokUvyPZuXsSBwp7Fr3VqUy1F
         VrQuZAHCCvCQg8yJgoH0bUVX0iWdVhigbqZ7DyiaXARq6iS8Dth1nSN2gEEuKMjW7A+Y
         SblfuPu1uerRz2hi+m9oP9qORoh7dscwEhWgpe3nH7C6ZdxqEqTEwVNjQhp0jGMZ+5Nm
         2IkSe0V9JGhMWzOm+sRSSU+xhvzgA+xTdzML4sxzUGHvADcLtzHBncfTgMOOT9eyswTV
         6kWA==
X-Gm-Message-State: AOJu0YxQ/ZJ09CX1yc35R23kFhfGwTb3g2waK7+s9AuP57mn5TvKFyZ6
	zl1cHyJISYdFpI9+ffoUzW3lc6sBjsfgpjpXAk86ZOhDeLZHIOZM2WepErmYcYVShFzroHtMf2H
	JfoaHQ2zb71zFQPGakZ+6TOITd/tmHXBiD4Mbn7qyhnq2PiRJE3TN4RbRKtX/am8=
X-Gm-Gg: AR+sD11u0PucirnwdVmLbwylJ4Oe42ep6nnlKEnsjgVMdzrdakKRcjAvFpxIbWhy0kv
	XAMKpmJ+gwRw7wxLoNSsahWsZSXWV0g9n3HFDAblIzGWVHEetmh7VjoCoE4HrLtmt+ylKIbqoYv
	k+ms1f/1L8PuHxaVcLBC98s4pM2zZbbWyRMsDd53KRjsS0tQrJrQ3PQJ4gbb2fPzc+lDsFxwpCx
	WCEY/7Cz5Cu01xt6NCKGCN+UvI9LH+gye0cS83YnqHIcg+BS5lAxQ/yXPAGJ9HiVwxjN00ltdP/
	HIAN9Bh/CWB/kSddb2hJJGYbE8oBOE8209cmZUwRKWNjFN6ODiPupHk/s68sDoOwYRqBSJgRYmx
	MWISOP3zHl7OwWjuQ51cPs9Rr0OvV9VE6alX/Yt/Cm2nqpc/LD4HY3A==
X-Received: by 2002:a17:90b:3fc5:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-39083780f1emr5705972a91.0.1786059638037;
        Thu, 06 Aug 2026 16:40:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc5:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-39083780f1emr5705929a91.0.1786059637460;
        Thu, 06 Aug 2026 16:40:37 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb877b4sm154694eec.19.2026.08.06.16.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 16:40:36 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH 1/1] usb: dwc3: gadget: add version check for setting ForceRM
Date: Thu,  6 Aug 2026 16:40:35 -0700
Message-Id: <20260806234035.1078704-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806234035.1078704-1-elson.serrao@oss.qualcomm.com>
References: <20260806234035.1078704-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G60s1dk5 c=1 sm=1 tr=0 ts=6a751b76 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LUm-8c6oXeeW0rykISsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: GRVCfjQl1QXJ6OTn0y-spmbByxmna7qb
X-Proofpoint-ORIG-GUID: GRVCfjQl1QXJ6OTn0y-spmbByxmna7qb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE4NSBTYWx0ZWRfX+vl78oZhGwUI
 PW64tI2BR5/vHZ6U8oDge9Zc1VvmF6zCVNLv6uXxLl2tngygyLWx314yQCjpY5LLroxnkMHpy/K
 IaIBtYg+W12oasJZLTYzFv0MGV++aJk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE4NSBTYWx0ZWRfX+vLU1QcV+XGu
 KvXdpn/7OwaP5A8mopue8j5SYXFXtQEl8M7XAxviCiRoDytcRF+HmnsnsTLa7yXsfMh9zGI4dnY
 ltusoJMqXoQ3WerdDdrkhaaoLv9Q3ABc53gDMRUIdRNNqU2nu/9hcZMzBOJ/Pvam+prCqcf2TDn
 8nx9q0MPsKR0a7CtaanJbm+9KpMeyNXWJWgvyYb9Xfc1EL5muouTRpgq0Z53w/vJsalK9b8Gf82
 IXQDVLZiz1zi3FMhf4P5bhunWOt6leFR70Ejv1rZsNAI51h0fDSZ51bfLxpBoPTV/i6a0ynQj7B
 MANBYYyTnlJRjhqg8eYJdiBi1olZGbaCJpfYwyFd4P3DD2BE5376BsJZYk2nN2r0LfmcE5JoDU1
 tdI2ETVZoFQiV3eS0oLE8EiBk7pTRu9f/WAKtKONlgbBeEDxlIxoiKVLjFwQOtJTo+N3rNycPDi
 zUKh4JE7gojQhOIBznQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_03,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060185

The ForceRM bit of the DEPCMD register controls the behavior of the
EndTransfer command used to stop an active transfer. For DWC_usb31
controllers prior to version 2.00a, the programming guide specified
ForceRM=1. Starting with version 2.00a, the programming guide
(section 3.2.2.7) specifies ForceRM=0 when issuing an EndTransfer
command.
 
With ForceRM=1 on DWC_usb31 v2.00a and v2.10a controllers, an aborted
transfer through the ep_dequeue path was observed to remain active after
EndTransfer completion. A subsequent StartTransfer issued on the same
endpoint triggered writes associated with the aborted transfer. This
resulted in an SMMU fault because the transfer buffer had already been
unmapped during EndTransfer command-completion cleanup.
 
Using ForceRM=0 eliminates the issue and aligns driver behavior with
the programming guide requirements for DWC_usb31 2.00a and newer
revisions. Add version-based checks to select the appropriate ForceRM
setting based on the controller revision.

Fixes: 1e43c86d84fb ("usb: dwc3: core: Add DWC31 version 2.00a controller")
Cc: stable@vger.kernel.org
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/dwc3/gadget.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index fa0f16ffafef..4b7bcad75d90 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1760,10 +1760,17 @@ static int __dwc3_gadget_get_frame(struct dwc3 *dwc)
  */
 static int __dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force, bool interrupt)
 {
+	struct dwc3 *dwc = dep->dwc;
 	struct dwc3_gadget_ep_cmd_params params;
 	u32 cmd;
 	int ret;
 
+	/*
+	 * Per the DWC_usb31 programming guide (section 3.2.2.7), EndTransfer
+	 * must be issued with ForceRM cleared starting from version 2.00a.
+	 */
+	force = force && (!DWC3_IP_IS(DWC31) || DWC3_VER_IS_PRIOR(DWC31, 200A));
+
 	cmd = DWC3_DEPCMD_ENDTRANSFER;
 	cmd |= force ? DWC3_DEPCMD_HIPRI_FORCERM : 0;
 	cmd |= interrupt ? DWC3_DEPCMD_CMDIOC : 0;
-- 
2.34.1

