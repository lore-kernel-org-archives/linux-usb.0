Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CE94E5320
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 11:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977182; cv=none; b=eeqnH18k67eWFRLS3BZSOQZfjMsPswCc//KHZ1PG5eOPrYYu6BMzK7TIhRLVRdPviwKTJVcpmeQy+dE7IwdwtsCsZF2sa9dFJYf5C8k3QoYXX1RRgAaaJVqgSfxZgYnjdHGbz5PxBL6hdBBP0CiQfA0W9z9tnMwDZqkY3YY2khM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977182; c=relaxed/simple;
	bh=zes7WRJqROE+3USwCgJF90m2S/ahuHQhT9F5Bstf5nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EfFR2AZgP3XaOa3xTJrawuwj9mDWjnnOCvUHuMCtv8ussOcrh1zzcRO5BEal7QzmUl/1BQhTyfYORHSRDPyla1qqy0DcYoMqmCkLhFE2FEnsa2azDnUGqSwzFACGJst5OvgJlQkbO4lMhM1MEbIridX5nE2kfYZfCyo6JlG6LdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ke3jMVin; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjhBKOaO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ke3jMVin";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EjhBKOaO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7VIjI2874162
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 11:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJUhqTehC/TBaJjoHjfTPZQvGroVm27uWPQqsihFEok=; b=ke3jMVinGT84S5GK
	20UqgRmt2tDmchJqsQG2m5ZRh/VV9oSZA4vXs1zIlToKlJ/a2kjmYM+FMqK0h7Ml
	U3ySSsp6VNVCNSqHcaJSqjVn8UNM3zAVWpV5VG80QEtD4kxZf9ICiWknzq6oSni4
	SL867OrV3kt3QVkbWPTW+235m+h7gH3uyFQbAVis04iytCbHuJLkpGsurvEyBASV
	9gwoH4eqmexFIoxVwoFVqwnvsPsD8t29LetYqZGbLjUEyDC9w6qZ7KOmC9OZQlrY
	R5Rms2uNgzHq1Gbmqc23Ox0ALGvr+353E7aucLx9wQ1PcrEQC5PFKBfvKqUa3mTH
	a/ai7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphj9hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 11:26:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e83df1d54dso12367755ad.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 04:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791977178; x=1792581978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJUhqTehC/TBaJjoHjfTPZQvGroVm27uWPQqsihFEok=;
        b=EjhBKOaONc9N63CooXoaFm0ZU/0uai0KGm+zVK/MCAVegsXlhv9KiIQPkjVSp0rl9i
         DiYYkyMYf/1B5CmiMwU4CV3a4kb4M/Bmw9m2qNgWdOfsIRqRtfgdIiXGgVXhLu+mLgAp
         ATIS8tW5VL0SVti5nzbK421TzIJnUI1AG6e7IzZ6LJ78z2nKuD2QTI0l3oxG4HqvcdoP
         jmsauXeczm4llxGjFYS5CPl4r7f6mueZEHposjaBNcADOazqJTGAFTxQdw6ur8W95kHW
         TW82Cc4CM+oMkVI6jb2Mjts78n2pfGFN2CDogrXvhU5NeJuyimamoqcLhV43DKaISx5w
         +XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977178; x=1792581978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJUhqTehC/TBaJjoHjfTPZQvGroVm27uWPQqsihFEok=;
        b=eZdY+NaXJnPF1wTVIlYUL29AgvY65j6vZzYooUu8ESpYpKOe5xACbxdMknhXLR5ql0
         SS+X+byAqfMibrWQCzCJqxaQ3qgn1lRByMfBFPCAnZkyBw5ySP4RLfmprujB/jbMYcxp
         kC1xuCJ0Y64Hak4fOH5RHnNJJvvuVVVjb8wWSO68W4XlkTOmYZ15Tu28NWxkMMBJM/pR
         mHaQKA/khjhl6MJ0culbarFlEHHx5ldjJr04lH0cODhKQiz18odJHNbTSws3/hiE6ftJ
         GkxAlkaK5illY/ZdIydu5SF+Vlzt5f51xyoQCcb6ZzfELtKVFcnLPZWhyEWkoypgqwKI
         5/oQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7WieWxI5J47OGoBBUCADP4CYKJdOlGV6pI08flZ0dd2yZ6sB+5QVsrla5VpFs+mZI4NpAYzMQNDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2W6EUe1J2fvAk0VDqo3sn7sKZD7sPRVTuSW8fJM1kt6nFur3w
	Ipocv2L1H1lQbqJfAZ07U8xoLznscb1KiNlHGd68yyOoJ8nv+55pFDVJ4JFImDq5DXHtXecTR/B
	XV/Mf4F5x2XX69sYyPp/mPG0Ma4KrbC12Q4+7qiC/3euKlNAx8HejZfmdbjsmCT8=
X-Gm-Gg: AYBFou1Ef60lW47Cfxsiv+gCItFYaCy3vThLL1NhiFfAYzTwjQRLw1XXB1PuezQIKBv
	aMuWP4VTTbEXkbvBnEYmFG57HUbsMMuZepVQzxqveuu/Ly9u7uYJC5No28zoKa2o3vP/mbIBHgb
	jvmxdMjACvsW993Rs8edWdGU0m9hpGyP7vfdsVPUA/FMcsezj+0p3ojNLAFPzja4yCAI2Iny7hs
	45nhwyfEG0BsqU0mBOsgF0h1X2v7jt1WKc8c12X653VCuYTkpFx1rD0Llef0ePqSGLWEtkVr1np
	fKzEvJUEhh5X9PEJ1uhIdXW34Y/x+ncQ1o/TgvClMjCAXJX+5dY4Vg7edD6/AfIdQDg6Xp9rkhL
	Nw83wOkpAxf4pVud0+6WPONs0GXVZ
X-Received: by 2002:a17:902:dac6:b0:2dd:c100:4253 with SMTP id d9443c01a7336-2e842e061d7mr134166775ad.55.1791977177761;
        Wed, 14 Oct 2026 04:26:17 -0700 (PDT)
X-Received: by 2002:a17:902:dac6:b0:2dd:c100:4253 with SMTP id d9443c01a7336-2e842e061d7mr134166495ad.55.1791977177190;
        Wed, 14 Oct 2026 04:26:17 -0700 (PDT)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8419ff572sm67497455ad.2.2026.10.14.04.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 04:26:16 -0700 (PDT)
Message-ID: <e1ba6c21-a22e-46da-ae7d-3ba7893eaab0@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:55:01 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: host: Mark dwc->xhci as null if xhci probe
 fails
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014105711.1708244-1-prashanth.k@oss.qualcomm.com>
 <2026101452-wow-scarecrow-c7d8@gregkh>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <2026101452-wow-scarecrow-c7d8@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UDkZCgTgPpsFC-a6YU4MluQkdPNJgzuy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NSBTYWx0ZWRfXzRS4RHrvrDvP
 sb+lMJ5z69gnTgwAyJaopyQ0+R2YjhJqpDZ1IeuvD26rCZ4UTLxuC2fUeS1p09b/JNq1M6jl4Xl
 47ig0rZ3lkepae2gYl++sjh1/J5kkv8=
X-Proofpoint-ORIG-GUID: UDkZCgTgPpsFC-a6YU4MluQkdPNJgzuy
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf66da cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=faojglw4N2pyK_-Dy4YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NSBTYWx0ZWRfX6h4dsccUrUGT
 Kjw/wq6Cva3r5FbmZOvr8Nnkyl8fc8Wy9ZSi9e/Ds+LlvS+RCiqIuZFz3B9908E8LJKD6ej3ifD
 Nqca+JlqDJEZsxixxHJ3r/rsZoS+QJ0fHITumciWfk+6Epb/YUzcI3bpbR8RP/f7R+ZbGyyH+Aj
 6zRjdTU+rvuaegiNBkA+CH/Uen8KpkcRPT/Q1R6l0HNUucJlrED8GyP/ctv5kmovgJJzx4a6046
 W5NvY5FZRplGkU5uxDiZDcSGjl9QMcsRac5qC7j/heOIsefpu3RDYxHQQK4SSOJlSHkSsrmAPr5
 2aqwEJmaY47CV9iq8YBgqmpKxx2ewD7v5nLFJLC9xqrhtFgR3POaZX4JDUo0Cma+ZKPykc3JSO6
 2tn32qjMsiLsOUwW7vkmaw/wjo1ISZyIMczQFCYvPVFE3wA9OrvGVuXVozAgjrJ5ISTALcRbzv8
 FpOY6sm/L7/RKiiO+PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140045



On 10/14/2026 4:47 PM, Greg Kroah-Hartman wrote:
> On Wed, Oct 14, 2026 at 04:27:11PM +0530, Prashanth K wrote:
>> Currently dwc->xhci is not cleared when xhci_plat_probe fails,
>> leading to null pointer dereference in dwc3_qcom_read_usb2_speed.
> 
> Why would that happen?  What causes it and requires it?
> 
>> Mark the xhci pointer as NULL to prevent this.
>>
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> 
> What commit id does this fix?
> How was it tested?
> 
> thanks,
> 
> greg k-h

This might not fix the issue, because it doesn't take the 'err' path,
just realized that platform_device_add() doesn't return error value if
the device probe fails.

The crash happens because xhci_halt failed (not sure what caused it),
thats a functional failure from USB, but later the device crashed while
trying to perform system suspend.

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000058

Call trace:
dwc3_qcom_pm_suspend
dpm_run_callback
device_suspend
dpm_suspend
dpm_suspend_start
suspend_devices_and_enter
pm_suspend

Sorry for the spam,
Prashanth K
