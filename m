Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4588E456E05
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 23:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059641; cv=none; b=Mg6SMJ7AYvwd7VWhWL4xdST7MCjlUmjZYiKZeGQMXuQqDNOEnSpupbUaSp0EgDKKQVQVEieJiih5ZpckzfuUkOM6BbyfZZvBliwLESy3Hdq/xiibVtJ25Jx+B4Fd7lXFPmh15AdsyJvj0LZnSMcSpHU4YR8LPumas5eivRsUw+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059641; c=relaxed/simple;
	bh=Wx94yW7ALtKSBLWbhJnSlUD6LR5UQpjenk/XOMsNpQo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WQ8iV9H9CEfc6XAZiqmjeW4aaqm4GYYjhzKRxZSkjEXlSx3YtfxIFHK5hwL66tt9R28utZ3UgaV0Cy5ps/qkf07CWKC+sa468ja43HotXLFwIG1JFSYqUibvLirUc2HsvNZRJyMJoc6K8vhZz9iqbitzwNg9sZl+FgiWTW5afZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqCf5HaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bcz/j8wL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqCf5HaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bcz/j8wL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676L8W2g2816851
	for <linux-usb@vger.kernel.org>; Thu, 6 Aug 2026 23:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yqVmiI6E8zzLlQqCZJ4qBJ
	AFciiRRe0GNn/ysSt/wVc=; b=CqCf5HaR3Dkzq2+WldyPMkZKnsUzcO/xOt5ndz
	3zxYWu/t1/rNBYmcjnKNkSerIBEhtKxOSTI1ost9PF9umAMe3amC3+09aJJtuiJA
	RhnUD5RswMOSloqzAkCwXnxmIK/lMFVeLdeo7TDVXBh3u49ULFFzv1YgYRtDnfVY
	bGhznVDnFkZTuaMUtYIqU0ArTG+eeRr2NhSR2uWg58yetJPhQE3exx9YAUj2QSlJ
	1LgSDpAv1UxsX1Xcsme7YG9Hu566CidMA6TMDgJwChSZdMCOjj1UXqK8MFHWnXSq
	ByVMO1JDxuHcbNWJz+MfT49oxZ3UwnMT/ziuj9NJDdMKmsAg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hs900-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 23:40:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so1668664a12.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 16:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786059639; x=1786664439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqVmiI6E8zzLlQqCZJ4qBJAFciiRRe0GNn/ysSt/wVc=;
        b=bcz/j8wLHNaakxa8zQnR8JHA86a1+6t2SgTwi1v2BFucWxTTUQvrBLWuvTxIEsFB/O
         dQl40BZP1kNsYvnldtNfU72Ee6bDSYD63VlynweUYzIfH/szCmEPVNXMVcJPj/FoOBZ4
         IbWrrG7eMVarlpf8Gkue7sd8Ow+xUofjmbm25jUuieAIeRZG2I44BzQyIB2qeyGS3DVs
         EHSGW8XNmgG9wGXt/TXbrSu3RoW0nFyYCu5A50WF4mqQpVrkB3Do718dNmHYvmsDNVoo
         jkxSCh2HbWiYOKIiNcO9iQC8jPIdxkih88F/hYtdy5VFLNUPf01Mt9JBPo2vQ0QP7pkE
         fPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059639; x=1786664439;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yqVmiI6E8zzLlQqCZJ4qBJAFciiRRe0GNn/ysSt/wVc=;
        b=kg40BhOnA+iOZ7NVuZJMfVd7KlluuIZwNNE7r5LzV9ALiauASbufgPfadjwSZcyh6A
         mvY3AFYNDKYuwShQJsR00lZfhzC8fneZQL25z+2pbWGvVmNAz+bO+T2u3/jIjVTL1CXZ
         xDFQWjzv9BkKlr3O28eMrFawtPfkI6lMWvtMDGJ0kRLEWCm69Oha3PtvMGGOWRoPAIrI
         O25dYtMjN6DaCxYgqoOdo/Hgz0ITndH60XNV9EwFob1dj60PQIUACkr2nmoWtsPxRr3k
         2qVMcV/3oy2MfSdhfLX0ShTAoSHO1vV13jzn+FKnHHMdQzVnUYcuBe12jKrtotdjSpON
         ahzA==
X-Gm-Message-State: AOJu0YzMWG+YSk/lHN+mdQr3D4o/DEcbsHcWcOFMx4E2sj4ZYeh8qqDY
	2hzDlCObzffbGzvc2BDvUeUK5mb0Q8GVMDMvY5ZlLC0esKIVZI+Atxs4/RM8kSfhbiO8YSIli/f
	fVRmhCkU9d4w5C2KBddq4r1WjDtjFPhfkAt5gpcHFy3YsU4NqKELDIHuBU5gnB6ZEcCMQ91E=
X-Gm-Gg: AR+sD11KAc240VYZyDxX68IgnmAzFDK0i9dkYY2uwNBGo5cTffgR7TQbeVuNeTL1HJh
	+n9j7emZSV7k4Y7uuTgycPGW0R7k3fVrgMbHetW6pgjvo21/lVYwC0r9ayo7oW5/3iy+624AzGo
	393sTiU2+zUdb+VRpOD/HOWcgxPHXoD1ugJHYpGthaPJNj8dT6N6dSBFwVLB+qSwO6mNt1/YoOj
	155wFMEno7QKs+Snnhmjk2LaR8G7j+CwJNva4i8ZjVBk69d6fEBJm2+4ZCc0pN/mS6UlnV5kG8I
	BsIEXJMBQ/20J9oODwvKR4WXWEJxoOoQNQjGEPhsA5DR0PReDmylGnE3/1pg2LfwsuElOwsVn6h
	AsMzeJZgeygJE0OqoCaTxReVA+i43RcWYFZ1PeMp62ntSyx79ExDR7Q==
X-Received: by 2002:a05:6a20:728a:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3cb85ded9b5mr19830839637.4.1786059638553;
        Thu, 06 Aug 2026 16:40:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:728a:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3cb85ded9b5mr19830675637.4.1786059636662;
        Thu, 06 Aug 2026 16:40:36 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb877b4sm154694eec.19.2026.08.06.16.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 16:40:36 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] Add version check for setting ForceRM
Date: Thu,  6 Aug 2026 16:40:34 -0700
Message-Id: <20260806234035.1078704-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE4NSBTYWx0ZWRfX4pbLb54bPhZ8
 Ux+wh3EXNCxYpr8EEQ6wyZB9rOp8sjrPjNmaL3jtnd+vsU+ZANzEDKebCVCQO3SlUhd6BokrBFP
 73KFYWaHzv8faSR65PydPUqcvuNYa8E=
X-Authority-Analysis: v=2.4 cv=PK0/P/qC c=1 sm=1 tr=0 ts=6a751b77 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=TA8obj8FJ-QJncC9hTIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE4NSBTYWx0ZWRfX00BwJgh1ZoI4
 ZyMJHQzfwLRD+Nqu6qLEQcZd3ydppR9tKCQTdnHkDaj/f7sKQ3ZQtu8fajzp5GNNICEaCPMdbGq
 BwEGzh6hsQBWsq/PI64r+5hKri9yoZVzccvv0GTPWIXXd0soxNCrNSl0+dVL58Jl1fccHOdIiao
 gCyE4LHm4M9ROMKHwznBtmVMoIHbV5RJexP2fGGsi1oPv1UV0bm+sRqapyVtDiolypeEyB0SZgj
 l+ApghGpgTAHMQrP0OOMVAFWDACIBIVJM1S7lwcL9svqW0aTAnVfBMmucWmdInd+9b8vd1+IBwU
 7keNyG3HNQWTuki2YnnEDjljxC+4GY968qOnso/gifDOEXmGuAdJBkOd1zJF/rxMkAa6nshIr13
 wrElAR385k4p00nklMmIClBdCBqxxHtvGQwQOq0tLDwlu2bDroSu6ywFbPGsEUBgoTx2o5L+95+
 ERao3bVhJBpY6l6mrYA==
X-Proofpoint-GUID: 9gLEqFgpfx3Ct5h51WtqLDU8si5qxJGu
X-Proofpoint-ORIG-GUID: 9gLEqFgpfx3Ct5h51WtqLDU8si5qxJGu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_03,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060185

Hi Thinh,
 
We are observing an issue on DWC_usb31 v2.00a and v2.10a controllers where
a transfer aborted through the ep_dequeue() path continues to generate
writes even after EndTransfer has completed. In our testing, the issue was
reproduced on an OUT bulk endpoint.
 
The stale writes are not observed immediately following EndTransfer.
Instead, they are triggered when a subsequent StartTransfer is issued on
the same endpoint. Since the transfer buffer is freed as part of the
EndTransfer command-completion cleanup, these delayed writes result in an
SMMU fault when the controller accesses the already-unmapped buffer.
 
We found that issuing EndTransfer with ForceRM=0 eliminates the issue.
 
While investigating the issue, I reviewed the DWC_usb31 programming guides.
Starting with version 2.00a, section 3.2.2.7 (End Transfer) specifies that
EndTransfer should be issued with ForceRM cleared, whereas older revisions
specified ForceRM=1.
 
This appears to align with our observations, where using ForceRM=0
prevents the stale writes observed after a transfer has been aborted
through the dequeue path.
 
Based on this guidance, the patch clears ForceRM for DWC_usb31 controllers
starting from version 2.00a, while retaining the existing behavior for
older revisions where the programming guide specified ForceRM=1.
 
Since I only have access to the DWC_usb31 programming guides, I have
currently restricted the change to DWC_usb31 IP revisions. Please let me
know if this is not the right approach or if the change should also be
extended to other DWC3 IPs, and I will update the patch accordingly.
 
Thanks,
Elson

Elson Serrao (1):
  usb: dwc3: gadget: add version check for setting ForceRM

 drivers/usb/dwc3/gadget.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.34.1

