Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489239;
	b=X4Gx6Nd8rwFEd87zBOUvJsKfppQsCnSM3InEvboG8VpdScKXHiXq1kixn2D30jfWDKxK
	 tOR+uABG/CZcXSn6LDmZjbC5wGXhXggf/xNktwszzDzlAtYyzcszBt8y3jVRoP6fl81Id
	 8jXhZNniKPsaTZWjBGGvDlgrij4nDtmS/E15P+kU+BY425sSzBdNTYKzNZNZOaj4RdvpT
	 Jv/5MLXd9Kq+VIVmBP9ykV0Cev/ALpOdydMFJSfd+6MPLerIWHt5sYXoP3Z5E10ql9WPc
	 L+R+YrWZdcof9LavrguE++s7Ly4MX0FUFyOJkCOh+mIgHCMyd5M8nZgvrb9u/E+xhlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xoKvbEvgKogPy4RpCMbvubQf8ED/C+r7igXpBuZNiAc=;
	b=ARIo/uCohCK1NZ4G40nIEK8W7jdKSqCqE9SkYfLyMUAEBgikKM2tvvb2ux8iaQRksJ6L
	 sl1+lMekrhfwnmktHO9IXB4v59G7JvXKWtJVx+ToUfW1KRA1QYZSIIGJDe1d7IMEmC1Mj
	 mS9ftakqkPCk3SESsOuHiz6P1oKxPqIfj1CCdoAzkZ9CifA4JdjDysWe/diGzwyhX6q6C
	 iYXTBbeLB+yaRDCz4hwmrzVmhuc2VK6C8msMRmCZSGpAwdWHoOIqRj4VdrjPmDkIHhAZs
	 GnDV7dpyWshJ7DOPVLg6N/27nEJnxvJpWQbZWZQ/+H1n57iSQrlJ6Pag/rdNgAX6D7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R9DeZRCF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQ7R5zhL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11A7606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 03:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C11A7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R9DeZRCF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQ7R5zhL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kLVo2452913
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 03:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xoKvbEvgKogPy4RpCMbvubQf8ED/C+r7igXpBuZNiAc=; b=R9DeZRCFMhL995Xk
	s+sM69Guy/p7ce7/ExoPcBoRDQc/mDv2uNkVWlvsnT3Vmr4a/Rh8SHoEGIdGcfPk
	odFrgmuCWZsqdXsx1zJjMLArADQGG4mGV32hoHefJwi53XSUo7s4eCXnxYjS0kiv
	chsNuANDIKenko4CWUaKrVHkLS9DIDcD0QjfV1wLqpChezm5Yvtpk8cJVTZVa9Bj
	V3Kp5Tpv+bIerwzPY0DvQ8RSu4Rh7SyMLVX5MyG6/r7kYnJXu7lh4QgL6b97xRIp
	4AMbLiAUD644d9ch3NDVeNSrb1nxro0uxF13yGZSFuGfQbor6lHMLF6ijy9r+j82
	DWqEPg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0ueay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 03:00:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so4446557eec.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 19:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795489237; x=1796094037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xoKvbEvgKogPy4RpCMbvubQf8ED/C+r7igXpBuZNiAc=;
        b=QQ7R5zhLG0AoBQY0WMJ0Pj9pURsP5hDSgiCbXKxrolw4B1pOWAe592njHUsb3zB4bS
         xrc4V+OuZZNXemz2ajNIjow4vLddSCCCGd+SE6QSBVANLYurbklA8m6Pm4+5W+NgzFhz
         WVWYq0KNJBEqWDDI2QZgFCScZZpQ9dd6eZwjsboVUQ/wJXREMLFzq9mJ/VMly32bLo+G
         PesMAY/iehaZ3MFYkU9AbOp/1vzhCLGRZep14wnKjjd0awPnaD4fNDu6aYZLV2E7Wwod
         Xx5E6ao1MDFZ7BQW8QNOW5R+5KKX5Cl+HaesZyuSLLuwwXieQntjUQ81Z1nrN8cYmJ4S
         3wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489237; x=1796094037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xoKvbEvgKogPy4RpCMbvubQf8ED/C+r7igXpBuZNiAc=;
        b=XwJx5UXLTnqJ5QxLSpTHRF0CSAdTyBde0ces9DNimkU2BED4myh2XT7gbMNTuqePpU
         lffEH+50zhZuppstHsejysklTJdNzKet2pkrmkocaOGkw3WjPBwdGbuHPwlAEhrPYkPF
         kqh96DhfxHRzJkRStZUGAT3vqoRxnCzyC+CmIcm+kLTwM5lOWC/rYKBxLFBGHzpqnqTD
         XFtS99d6qq/AXBbCjVj1GqIbvZQ7g/C1Wd5Ke/ygG7FlHDHYiitIzlXCQpvCsuN8nrbS
         7tGrly+p1kw8jgZOLdCQ3GJMGoebyjeqaI+qcszdzTXFBjG4RdKiOJ/mjf5VbXsf2eSA
         waSw==
X-Gm-Message-State: APuU4Z/BfB5Z/Rmh4PmLu2bxPN7V9H6q0+YmOCbcTtu7T919PHJeWKur
	y2bLWmQnJSmrFPDYoDTV/zmFF4beesMzri99pwUeBL0pTFckfolet21b5hCa8E5q46rpd/A+vmi
	rCFQKUs9HG/onP+o3psrKyMcrnFvet5xSU5pY716uvb21BBywXG/Eixmv1L+VL9c=
X-Gm-Gg: AZFdTZfoE7OaSf2YhU+g1BZxgI14tjuFBHqohLI87zGBaOiWkFMGVx/Sqo31pdbUrjd
	NG3OBF2rPSfG5u0FfbV5DjPJ21niHc5cNC0SmEYfCJYHzjPiYM0CkRg+FY4y3kEf9JWzOiqVs3z
	W8DdYR7y1riT4/NtiXe9v8G38jZlhjosTPlR/xvX4sgUVEAo8kEx99z4DdObn1NksLqBi5Kh9tP
	yOnuSiNXEtDWAikPat7lD13pP5EortFv47RzpKckC3icunKfCvlWXtrKkmRQsFSXv0r/7TjRuMO
	MHYUc5l4EMMUuvNotvi+P5aOaRFO8kxz0NszYQ4Y8FnVqJDrPaOJskzmvGoHGQdPmOGKzmVbc8R
	yM8Xwj5AFJM0OEsUGWf5qy6beZlxnPj0khHMawGrn9+8FxtwW+dmtW2HKPVrBnHw0dJgHjrJ/2i
	FaB5gG4vJe6hl9oz9cSKSj
X-Received: by 2002:a05:7300:e003:b0:386:a75c:4a78 with SMTP id 5a478bee46e88-386a75c4cb3mr6815022eec.15.1795489236991;
        Mon, 23 Nov 2026 19:00:36 -0800 (PST)
X-Received: by 2002:a05:7300:e003:b0:386:a75c:4a78 with SMTP id 5a478bee46e88-386a75c4cb3mr6814981eec.15.1795489236172;
        Mon, 23 Nov 2026 19:00:36 -0800 (PST)
Received: from [10.73.198.203] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm69668834eec.3.2026.11.23.19.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:00:35 -0800 (PST)
Message-ID: <633ae539-f386-41e5-a852-55b5e1b19d64@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 19:00:35 -0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [[RFT PATCH v2] 0/2] xhci: sideband: fix use-after-free of stale
 virt device pointer
To: Mathias Nyman <mathias.nyman@linux.intel.com>, quic_wcheng@quicinc.com,
        hulianqin@vivo.com, selvarasu.g@samsung.com
Cc: linux-usb@vger.kernel.org
References: <20261119214841.1552318-1-mathias.nyman@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <20261119214841.1552318-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7j6J6n6Ucd2zKupqx77vLHB8IWlS1bob
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX8LuNiX5W3U/8
 7/6lEal+DFC+Phg/24BcQIsRdi/S/GDzAaigoVdl15QyR8ueUbiMdCDwZHP7yRJJEQmNvIV/opA
 27p7KWOqPMG7+xSvrTj/fszLySdSfEY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX4j6shi22xF9l
 pEqQWLBnqWJGetZ1FVs0w/JPGSdjJqpWtiHop+y5l1/YgKjI801kDMdI1ZIcRzqwYCzXg4kJxyp
 Zf2gQMBEGAHqPQXP2G2aCos96d8ckVCSNlNp04/KWbEP3edxRKjhDRiA0AtqYZX5/0dI3zAIfer
 blY42UZCFJjWx2HmhU14yb0d317OEeJtXa9Yq6epGmQTpyOqwxvmqTAcIJmusdsKQnvdGRO/LS2
 4gIBtCN3NWG7QcRJa7/nGgDzKu77wVM65IySgosf2Uaz65W93zvfAFOAXa5UrqLTAydN54YwG8p
 kh/xpn6cSMkToyIGMWDG/Oje1JiVOQjgjY5Ns1sBK+QHI3syKpG6Xp6rEsNAPTMX0piPsuxMlMK
 4MoNbbum/MIk7S68cro2iv41haLrTooPA1nW7bOzFa7Vwtna4w9uMkaDd34Rrc65YL2CE/KDAOb
 iQ/FQ1YusLLulqsSg1A==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04fdd5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TNEfe_mfAwQwEifYcSYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 7j6J6n6Ucd2zKupqx77vLHB8IWlS1bob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240011



On 11/19/2026 1:48 PM, Mathias Nyman wrote:
> Hi
> 
> Second attempt.
> These two patches attempt to improve the disappearing vdev issue
> while sideband stays active.
> 
> I don't have real harware to test this on so all review comments and
> feedback from testing is welcome.
> 

Hi Mathias,

Tested this on our platform and it was working well.  I also 
injected/simulated the initial error that was reported by Lianqin, and this 
series was able to mitigate that error path.

Basically forced a reset_resume situation and overrode command->status = 
COMP_USB_TRANSACTION_ERROR to always happen in the reset_resume situation. 
Was able to observe the error w/o the fix and wasn't able to reproduce a 
crash after.

Tested-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Thanks
Wesley Cheng

