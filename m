Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16747080D
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 00:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790899667; cv=none; b=fUf37ejdWhXH8eRgGmuych3jhhfvpdSOkzYp1kQyw9fat0kaGvJ2dvpwAufWeYzWg/u9k90kTQNV/D5dPeV6CNEX0g+cMIDDe+l9sY9JgiAfVuikpFqqo9XZwxej/YZ6GS4JtRxMR5+Qat0vNKt7T7MDJ/kK+XvKVNlXYPlfh0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790899667; c=relaxed/simple;
	bh=6rmt054WcgR/sUykGVDW9KdieYf0NX8FnzjOGrZpeiA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=d/Wiqf/amIISBXucYFDbww7/w3Dvqj9uzP+iQgJr1KCCrk3GyaEKNDV1dU8e/tZowyqQU+tS7QIGkuqkM9q7ll42b3s8k6Wko0n3g5sWfd49v8CvfP3o1OJlm3h0K9aUJvngLL0FmISGyIJA3+kh4OUYnrSSplp5Gq5hyzvAAgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoK+LnhZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aivm4wKv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoK+LnhZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aivm4wKv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NFSgu3829670
	for <linux-usb@vger.kernel.org>; Fri, 2 Oct 2026 00:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QsPd4SyGa+WJ71aCuvBXvF
	F5fEVwvkPkzB2deVo6AQ4=; b=UoK+LnhZaJfHoRD62G/eucYr2PdeCG+5eN5DoY
	0WuiMxIAGs+3fp6CvfRXxOYGuk19+WV7K0lvu+/c9jaO6rpn7cfupHb91uIJXtWe
	kRMIJ/4mdLi5jOG3RdRbx24WhEm29jp63Em0jR62r0p3mbeBppYaILQn3z8x/TA9
	LkvFj68T4xnYH0WBtYMILe8EfJF/whyU2EaWpoIoI7GO8PrT0P5RMrzPVC5cfvxp
	0cbdP+uvV4GGOWul87OdtAucBFneSwy7M/NrDkLmK6UhN8xZ1JyAbIgVy+f/fExd
	QgoWijROy+L8yp/ZTWWgbpTFFjyEIa3FDLt9AvKAR707/2vw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdcjbg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 00:07:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so13741921eec.1
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 17:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790899664; x=1791504464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsPd4SyGa+WJ71aCuvBXvFF5fEVwvkPkzB2deVo6AQ4=;
        b=Aivm4wKvSIwZSNflkn+Q/lzq1/REx9FhOAR9LZ6qV/SWr1Elg6wQSPDnaBi39ciIUI
         e2apfc9chiUtClOv07k8oL7Vqua125uXWpNIAYt2WsxeA/8B91J+ao0d6lZ2aNNLVReR
         GQzoqj4TaobG6ihYjpCtrv4EKTZ7J8gst4DVHPc27Kbd5dHEWCVGpl0sqFwCvfnY2YW/
         YF5EpnxFwWjUaI5CKpnfnCUDzYdL7foAaC08Qzg3kEJjPoDLUmqa4QI1dlr1kPu/ITSs
         rjy54slqPuDxV03QvdbbhqFri5HktswL+tMh6q4uFmioAEXL+B1+RmdKgl70DtbjTvZz
         8Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790899664; x=1791504464;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QsPd4SyGa+WJ71aCuvBXvFF5fEVwvkPkzB2deVo6AQ4=;
        b=tPD5M2YzRBizomkWKjQ3Yqzjvf5IR91IrkVxupirVLl3vKYEPW4BVyQ5gyJVtaTEle
         rpus6C/CyeQ5/XW5a+6X4OJQ1jd82Ag89p/J6g3bDsy5tnJa58wYf0QnJ+vSx5E9pnE6
         Zo1B6uyCARLv+a7ILZm3jzzW9MYwWsuvZc5WcwSgVQnbQusvDUsjeBTOyZDnXqRt+uhA
         wGC6c00/E5Ez8UTjQuldCfI28Alriuq6N4BBF2Un3s68wQQLyHad+TqSH0ymfSksHnNp
         mP1rPy+3bO71m3/1IAaJd1gcuIaOBlOCPz/vrTFA6WQJ+03+aC6Uik1bIPLkc0/kvPhj
         aAkw==
X-Gm-Message-State: AFuF++mzmmCPBbAgA54kpAtE0tILKdVDr72XK7ZazyLV8K0m/l+Ck6Wx
	D+cN+GEUrT+k5j81sbRjRYO8FySFLIw6MJ4GHdwJ2nTKXFVDCFvshfpj8WHHLoq89Xx4LjhAMa4
	9NsKwkhEtJzfUTxHoXgROdIh/Tq0k4icjlBLtiWjSSH4FnW+trzRf1DHr/OY/A8E=
X-Gm-Gg: AYBFou0jJ4EAkSpw8BCpeU29IK2eFlmscpw5sbOYYUkx8YgKFVXFp9s5wLpXJoDDP3F
	WogKj2HcrW7t6XNaTfjVmaC4GJQ9ZN2DuNM/g1LvPqnjCh9rsWJa+jIKCySvxtBjMZiAGHs8Yir
	RIJ9OZ5RMrTFktRhR411FRr4nRXB1ZhcsppVc5NMN7gRvvc9H5jdBinsi5W5iljIlaRYstAnlbt
	pYK/UZRWzGePoE+Ztko8abzRQZb2Tw3fwPS2j5XqJygmb81th7FOhvK/rml+Wrb5W7ybNr6EWRq
	YhbtRk0HAuQ/8zbA/9WB/CVPUlZ4A5J8oevS4pxHZEHFgAcBi1UOfy8tyIRbrrswQP30YPBPLli
	Qv460k6pEwlTUDB0bxwb/zrHGvOV70gflpPvvUJqV6331Ok7+g3wN4Q==
X-Received: by 2002:a05:693c:638b:20b0:34d:60c3:3957 with SMTP id 5a478bee46e88-34f21859681mr963621eec.24.1790899663563;
        Thu, 01 Oct 2026 17:07:43 -0700 (PDT)
X-Received: by 2002:a05:693c:638b:20b0:34d:60c3:3957 with SMTP id 5a478bee46e88-34f21859681mr963590eec.24.1790899662923;
        Thu, 01 Oct 2026 17:07:42 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f660f1sm1561300eec.13.2026.10.01.17.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:07:42 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] usb: dwc3: Clear SUSPHY before issuing core soft reset
Date: Thu,  1 Oct 2026 17:07:40 -0700
Message-Id: <20261002000741.450793-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -5RZY_JszGEWaCuUor-5xV0YzCQTG4bI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAwMCBTYWx0ZWRfX5PasoSAhUeR2
 TBIkFHxhZr/3vB7D/un3uqt71B1VDDkLFDyblM4xY6V4wF4fGeCp45uBnHdo66qh3i6CCAHwRex
 pBNBIF1nym1Fd8tEv03upI1NVxqYQ58=
X-Proofpoint-GUID: -5RZY_JszGEWaCuUor-5xV0YzCQTG4bI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAwMCBTYWx0ZWRfX37GBhNxkg/xO
 64y+OHDRNcoswtyXynWCf2YVHKjIVcB3S0JRHMUXJUqFfUzJz+VYOl6/e7VGLna1FKiTcxdO8kT
 iS9t6FjN4VYLVxlChpMy/kT7pHXpCLowMRLc9SPQL6lMczmGguEF0flpfQegD2bxW+Fe/VourwF
 LQdKVifAGgDFLvvQ9XxD9r7mI018rM9I2F/Mhn/xanxrLWY104m3sK0SHE9kjO8i6s4fmM+vVxm
 spe2Zd/z5MtuJ9yXGlo9fMuLXwwa2z1VXn44CSoDfeciNsZpkXanHjnZuY+IXmTVaPjbx2gHmzf
 aRbgSGBawnEhXE2wPTd0E1xnFS0TKwJIH67rfbkR9q19ganOn1kp8C6SOXjRduf3iBclibokOBW
 CmBqJ0iOVVoNuByla0xk2uNl6x2tUli5WE9PNNkk0lnA0AeV04ncqW1asIsXbzY3TQWxzIsmFuE
 usngJlR2lnkvFxrfA1w==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abef5d0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pF2x2taR6QuopRQjwAkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020000

We are running into an issue where the DWC3 core soft reset consistently
times out when snps,dis_u2_susphy_quirk is not present.
 
We recently dropped this quirk on our targets to allow SUSPHY to remain
enabled during host/gadget exit paths and avoid controller faults, as
part of the changes introduced in [1]. However, this exposed another
issue where dwc3_core_soft_reset() fails when SUSPHY remains enabled.
 
The failure is seen during the following sequence:
 
[  126.110298] [0:    kworker/0:3:  671] dwc3 a600000.dwc3: DWC3 controller soft reset failed.
[  126.110347] [0:    kworker/0:3:  671]  dwc3_core_soft_reset+0x3b8/0x568
[  126.110352] [0:    kworker/0:3:  671]  dwc3_core_init+0x900/0x17d4
[  126.110356] [0:    kworker/0:3:  671]  dwc3_resume_common+0x5c/0x394
[  126.110360] [0:    kworker/0:3:  671]  dwc3_plat_runtime_resume+0x28/0x88
[  126.110365] [0:    kworker/0:3:  671]  pm_generic_runtime_resume+0x44/0x5c
[  126.110369] [0:    kworker/0:3:  671]  __rpm_callback+0x94/0x3b0
[  126.110373] [0:    kworker/0:3:  671]  rpm_resume+0x43c/0x64c
[  126.110377] [0:    kworker/0:3:  671]  __pm_runtime_resume+0x6c/0xb0
[  126.110380] [0:    kworker/0:3:  671]  __dwc3_set_mode+0x48/0x580
 
This occurs before PRTCAP is programmed, where mode-switching
code already explicitly disables SUSPHY as needed.
 
The attached patch clears SUSPHY at the beginning of
dwc3_core_soft_reset() so that the PHY remains active while the reset
is pending.
 
I would appreciate feedback on whether this approach is reasonable and if
there is a preferred way to handle this.
 
Thanks,
Elson
 
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e1003aa7ec9eccdde4c926bd64ef42816ad55f25

Elson Serrao (1):
  usb: dwc3: Clear SUSPHY before issuing core soft reset

 drivers/usb/dwc3/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.34.1

