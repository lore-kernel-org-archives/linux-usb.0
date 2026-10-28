Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214001;
	b=2IdgYcu1dqFYIItVdbnj1ZCrt34O0B0II+51rPdyISmPD2m7Rjf3hyEoXErI0JGAh+/a
	 RzeQpQZ1xSSn8NbfkzGyyeIMwZXpYhzIQXg/lzB0SjJyZYuS7unEfwUqQliBigWSUMt8U
	 8kv7ozyz3jEcmdK62MxLTNZiDzmlLaCE9g98Im194Wc6oedxnfum2yGN4FU2nMgWTHcVR
	 9t99wv3gg56NhKwwAq9SuKtA6Wn0dDdWuljlwY6AYQdvksu0AvTs0goS92MzTJUi+aUG3
	 DLpRr7Tx1rfeEexUnNgc/6wlqMlW6BDMVFaq+Q1Qa71cH/jZkzqsHH3ZLtii1oLInxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214001;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vMX5mTiEmVPEae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=;
	b=WtQ3INSvYOItAV2zyt0ffXNaLfSfi92FZZtrGffWySrtbXtdhI9mRwTWO4caGFdozRv1
	 Dd7ZS1Z/rwCLgdi6wTF08P753D7u8aWtSm2GrarVlnguI4roJ7IrOC6Tnry/pBoKfTdmj
	 iGgd5PVAN3eX5JdT4bEdP4kA0Y3/Q/yaz4TcIUofxvKV8OMjiGnp8FY96WyatoVnvo6ha
	 QJI+7oC/DOyxpkmgvj6TqhwSvwzExGCS5D0DdDRyKGi22i8MNseL6wXD5RZP7dzoM1GPQ
	 Q9s3pATRxgmhXAm8o9EjT1rXe96E8VfEFyQmfX/o6DfufrWnHDYb+sY1cSms7HUP2Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfQqSZN8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hbl9ZqCe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDF0606A33A
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 19:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BDF0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfQqSZN8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hbl9ZqCe
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPosw1395641
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 19:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vMX5mTiEmVP
	Eae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=; b=MfQqSZN8+nDjqRL8kwcIv6Rs9A8
	ocedGDkFCTbgqUbXvjvIt8Y3F1l9SAYoYDnwBz+mDUTKBe9eip/csoGm4a5MeuaC
	mqsWBYYmbDFyuuJuu5uPQPm0IgpfA6wVEWejeglaqrD9SwqlJCY+V4CWwhsDQduF
	5nn4idd4CSWQdO/UeS1XByuQa1v08lCgUBfB3P6+HFCh8betkX0a9VShG4/DtS4m
	HRNkJLy5gMyGYA/OxVPqjBK7apWFXY3O/jLgWJuoJs/LayZtlFNvze5hgScy3AKC
	PQzVFkIjtPNdx8zTEhFvAdWaCxgym2oAylOgP4Lhs8C1jhZdJoutmp03Uuw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjhhrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 19:00:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so2545711eec.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 12:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793214000; x=1793818800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMX5mTiEmVPEae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=;
        b=Hbl9ZqCeZW6WuB/q+GOTi/+oVSWNIXetmAL5lcPFdD+a4nOpGQyalJEBm3Ykr1ceZQ
         Hmae6q5mA4Z7YJQxrEWtMMDX+0zjFaqPuwPbLKAoT6Sy0aHykGefRBdujtUd4bj1RxnH
         IsQxHwFnrPY1cwooMFlnzT9KkKJd/xDNcAkO5qXRwpPqWoNDs+6gSrS+SmYE19ohUOu4
         tmlJ8D7SZLfXcdPl59k/DsfJb6NC/LKtfLCBerhlqef4kEJp3cTpi6OE2R7xVdjUJIe/
         5Pi+ucWjI0Qm4W2H57Dae03M3ud2tqbFT+JJl8dxIE7fti84qu0uABCElnQEneNwC3xp
         po6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214000; x=1793818800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMX5mTiEmVPEae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=;
        b=F6hS9DGy4XxSoJsDK15eDXcq2avBvzngCUEFPfHACA7mO8U58xaRmiZbPH3Cx/cvaB
         HKvI3oStpBrPU5aKeFiCCMRXuH2mEBXj9ie5YU3hugJAadxyeV/eQKQExlWYg+Ywa5tT
         AIcw+Q/RDgc4L2XhEqhI+FYMArwrA5VtU2ynxzO06Zwd8LxRizsH5P3bhM/b4n4s8u0k
         r5FhLt51DK1ZvcfMJuOcOsLyXj93q7Z23kGF+DZ/lGw1thx2JrLHbtPNhpu2UJZSD64W
         qkSDGZPtNMLwcIumEkD4M95RZkUcj+sFX85ybXjGi5VU5ID8VD2dhrFxPw4E+eaIoZ6K
         QV9w==
X-Gm-Message-State: AFq9FYLkykI4d8gSM5swmXROiS+iMpDp4gCLSPkQCe3YHqpq3zzSdtMW
	7AQ+bPRclZ1tkGsU7LrZD+ocVRv0ryDc0gcTpirrtHBR7jbnOPX1Z41ILT8jk7+3oGZkMMqrtYQ
	do6tPNlF6e83v+WLm9SKl03Qbp7k4gw9wRQJJeh8Ml+OB05yK9wufNDhD/9Jxq4DJsH96N+8=
X-Gm-Gg: AYBFou2iQBr+mpf6LHTWRqLQyEik/IinhyE2zLN8QUUUXjvhJBZebBleDwFBBrhiYnq
	b4lLGw/JC88XWn6jzvNj3H0NMXEgg0PU7CizjGfnYX+EwzmBZhiqD3UXosGTVWilH5JTEpJkWGS
	f5gOSA/Onwvc3UFor4tLohYS5U1To3fTCuxGCxrepLyBUPLPkto/vw4E0zY/CllZzthpkI2SJsi
	lsCwVJrjV5uUlG1m3C1PpwenK2lh4Fx0opVWwYrEmGks2lpv2Xv5lR5mv/qZ7kgPgNAYqNydCeG
	ydvmwEhtKhJmBfI2oIW6qMQC5ntAKARx0UgIZNUP4s/bPrWPYn5OzoLoBfb4dx4IGOUdje6OVb0
	wYna0OP/6SiiI/Ej1vqObG+uMYsUTFs9hN5+OGNeluLBOlYxuwlqRiRcvxAewiMvyn0mxax1fPc
	HnGcnGfw==
X-Received: by 2002:a05:693c:240e:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-36a204049b5mr4592430eec.40.1793213999814;
        Wed, 28 Oct 2026 11:59:59 -0700 (PDT)
X-Received: by 2002:a05:693c:240e:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-36a204049b5mr4592405eec.40.1793213999315;
        Wed, 28 Oct 2026 11:59:59 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.11.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:59:58 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
Date: Thu, 29 Oct 2026 00:29:34 +0530
Message-Id: <6499d6761ba6f338544fc8a90b4a96e55b5b4b12.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX5GAkW57UUaSr
 LcGrHjO07DkV8cBkspgYaltRPmQjlxa0o15waXJurlLW51vpW2g2TR1d1mfaFV/nJDOG3aMJU15
 9Km7gxNwn5FLT0prReqReLpVSXGMZ+wsicxgIwOt4uxtFqRfIp4bO3DHpswkX87Cv+vAuIEL8sR
 N6nuAFAJ5wZQ6w/mUiHe//cP3S+kkxbehqYm2iLSI6cCFhcZmiXS00p3faezvldW3Bm6Tj1VahP
 DsPZVYFn29fvuxS0vh5V7ih+53gcos9C/krn2mbL4IsuMS4Maz7DjIpgABbtWd6GF7Yv5Mog98Z
 ijWh8wHSp8N/xk02D2yUR1SVjViPnJjToVvHqDb7jXygSi7SX/S63LW57iAzjwQl6QjrFz4IZAy
 sc73ygokz2ZtfB+9MQHQJfP1GH38Zy4Ugo7m7s72sRu0WEujaDnajAEC//+hh6NH3W4bxVK/lKr
 by3bfiSon98x6l48tlA==
X-Proofpoint-GUID: QHEsavN6aWqvWEi06CWPih9Ne_pyPTMS
X-Proofpoint-ORIG-GUID: QHEsavN6aWqvWEi06CWPih9Ne_pyPTMS
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae24630 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=A6Vjp3zFaTA1NjdqV2IA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX6o5H9Ey9+fkb
 Nn5ij7a1iEkPQYdpyez5rqoXl2ZgstV6BHrJQc3bNozY2VazseMegYBk+cSxI7vLcLGTZ3lVQsE
 2kRJRw0IEjS3AGoWpK+KWF1vRabVAaU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

When the USB controller loses power during PM suspend (as occurs
on targets like SA8255P that fully power off the controller),
it generates a Host Controller Error (HCE) on resume requiring
full reinitialization. This is handled by the XHCI_RESET_ON_RESUME
quirk (introduced upstream in 8b328f8002bc).

Read the "xhci-reset-on-resume-quirk" device property to set
XHCI_RESET_ON_RESUME. This allows parent drivers (e.g., dwc3)
to enable the quirk via software nodes.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..0093ed24ac3f 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
 			xhci->quirks |= XHCI_SKIP_PHY_INIT;
 
+		if (device_property_read_bool(tmpdev, "xhci-reset-on-resume-quirk"))
+			xhci->quirks |= XHCI_RESET_ON_RESUME;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 		device_property_read_u16(tmpdev, "num-hc-interrupters",
-- 
2.34.1

