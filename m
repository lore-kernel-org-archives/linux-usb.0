Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E884DA9B5
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 14:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605158; cv=none; b=QdFdxopeI6No4iOtHUyL8d8xUZh9ubtQM6yiTzXPiG9IRy7474hHbwjchyHr1nWrO0BpnxhbVm96qB1oXTOB7qc21uQPKFaEZ/+Drtwx4cdB3CwSZgI/Eb11KFRHZHdG7Zd6brkdwOuiz3+aYdZurzmPbonoEWyYxuRb4dogLWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605158; c=relaxed/simple;
	bh=cHd+AGbgiR6kbIWovPWUkjehsKhorHaJgk8OxjzXVA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+/t50vX5U2miAJlL/YdWl6zBzg1awElEfGCIOb+J3kcSwfJrpqOM4F30A+QJXyHjqoVCyPq47MUJ6s3X99iJjOCPkyuP5GU54vXOPAbaNpob9TZViQNWeWRn9Yn4tu5q5giJeQef+X1imqL8zeBN4GvUHn7m22udOF108nNJCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dmf4lOKW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVuGGKgR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dmf4lOKW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVuGGKgR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAubZ1841013
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 14:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1Gq9bso3QuSJSV85bajXkwDOEjJ3tscsrkv0Eiicfs=; b=Dmf4lOKWKQFKbjLC
	dldeUARoifDCTaF7dMN3ZVYYUTqiJiiM0EuZO31lLlqf3QlAXMXURuujrjo+qdue
	18illohXArUq0GAeXN3QUFuio1PcJJHo9VgmL1sjHgZr1tqSMFcecudTP+2nqGTM
	1zNJvPLW4cUfYsg+cSPJGZtiNvZgIjCHoV+rezVf8Xu1iT2L8tfZXbWe/JxpM9Gp
	cd65vcmAyGWiJG4gcUV8d0FI7Kl6Dl9Ed58tFr7/UrkZlWNyr4bYqNJIsiJzshGo
	DO/WDg+c8tDv7R7DoAy9W5dEJg5TusExwlLu0/frWgi/vr4U+M1GUY3m5I77Rden
	ND6cxg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6h4sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 14:19:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-985374f150aso296770241.0
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605150; x=1791209950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1Gq9bso3QuSJSV85bajXkwDOEjJ3tscsrkv0Eiicfs=;
        b=GVuGGKgRPfHwFrXM3qt1qmYcp0xjcAb8YoyFr3NOMAbZUvflPgmHyUtsxHTztO19n7
         B7idKokrpDQ7mxPPXqoKLCRLRR4CEQkDfYxEDqUd5pAfvQ/myrlU4WCUQx/aNOyHWfPf
         TOPRoJQdQeVjmxbfM+9tWdg85OpeRoFCto/i4+xoFw6nmMLtwaAVwbIH+ToOURyj+0rQ
         fzB0E6SyuQsk8iehyTSQURHdpEDXU1fQvmSjq9UT/S8bEK/jArUd/BW0GFyJawdVMOwj
         SYZAGDnJo68JNvG/Zcfnp7osz8ORNQy0kS+grObxqMAmsIdOa+IYWN6YIy0d4NIMdBsd
         6d2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605150; x=1791209950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1Gq9bso3QuSJSV85bajXkwDOEjJ3tscsrkv0Eiicfs=;
        b=TpRYssV7YWEI454P3WiSq3BlrgTEXFZA2Ujh7/4f/ELkbebAKGqhIJuCuvB3p6LI5s
         k00Ddbb0Hq3wgfIawwKAEaCYZKD5+GrlaYL8vpr9mvYjNBhjMIlQpF4aZVAMpKMs75ac
         fYuh8hvSA3JiG5nyJEMlWYzmdMy7WbpFBN6TRoOON/NeMPOVrrf1VXgAM5kukK6YZzFe
         KzBkctm+S7ZqIJT132PJqTqO4A9EuqDyQD02pmorGvOqO/HdUU/smB0yjpEhfR4xAFkE
         wzA89Obbvgy1/TEmLVa15sy380CwkYrKs0ekX9Fn5XxTU+5l/PJYg5yuf+mNsLA3RUBu
         67hw==
X-Forwarded-Encrypted: i=1; AKwUvBx3sxysszdNcNtIpx/SfsEAqHPJIemC76rfSqj93fpUdtJsbF5CwZxrDvFrjmE7b9zbl17qQF2OEqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL16pmWaiDT0GCjUJ1gAkWShfVPkNuTBgi+VhS1gN+E6xVsVSDJ
	XLCccyHE2CgWjbsiNjxZkZ1eP7NrzuH8bgHDXvkHnbJEaNGAxFeZfC+e0jqaQLEMFvSXYoetW6s
	OccMHd3z8Rm+S3z4IfqzNHMARPwmx4lLENcD1kqbdR8RnJp/lWkTHIFCCqYXl9+U=
X-Gm-Gg: AYBFou2B1YTtrAcPxc38TV2wOmfGqpvmaPicudlKWS3OWpKyNAoH+rytwk8aF/sosRZ
	pFkV7QCpCvIton1O8Ls3RL/RTNtOptAVeu6eBU/UGSvKudOk4pPjkaSfSRPyWdjt5KuLAqyD4LV
	Y3xHVk1iFMUn3v51EOpmhGWK8mTkmsoh8CNQi9QEGMFccFNPLWjjeQ4lG76jsSFDy2kU771l9Tc
	VD5xY1sMxSq6djY2eZBcdsayrzBsB23wJysMJ8PjXlu6bBjvDTTTSfxkPU0gYnwhHc7rQvrUOFi
	1j0imGwTq0IvA3h0Un5MTzEDWgEp1kCMTWMwMLeE5ysqJdIo1xwed6Nq9abskqoIKt/Tv1v8+5j
	r82AthUpNmQQYdxDYDFckdC5UsPU5eA==
X-Received: by 2002:a05:6102:5801:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7af1c99cf51mr3398368137.6.1790605149826;
        Mon, 28 Sep 2026 07:19:09 -0700 (PDT)
X-Received: by 2002:a05:6102:5801:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7af1c99cf51mr3398358137.6.1790605149168;
        Mon, 28 Sep 2026 07:19:09 -0700 (PDT)
Received: from [10.224.243.150] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2af8ac48ccsm390077966b.38.2026.09.28.07.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 07:19:08 -0700 (PDT)
Message-ID: <b4d8a778-0a32-4d0b-9610-862ec5721be2@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 16:19:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] virtio-usb: add protocol header and skeleton
 dual-role driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang
 <jasowangio@gmail.com>,
        virtualization@lists.linux.dev, linux-usb@vger.kernel.org,
        Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>,
        Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>,
        Anton Yakovlev <anton.yakovlev@oss.qualcomm.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20260924160907.145405-1-igor.skalkin@oss.qualcomm.com>
 <20260924160907.145405-2-igor.skalkin@oss.qualcomm.com>
 <2026092557-condiment-surviving-ec8f@gregkh>
Content-Language: en-US
From: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
In-Reply-To: <2026092557-condiment-surviving-ec8f@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX466U0oUfit4R
 P6cdhsk5AVSCdbw3d+fNVOzdj8QPGMnWN87nqiw0SRsLIJWPJaNTwDihYe0SgL9wQ9BpD7goos+
 6AnE/h8bwgnCT4t59p+aS9wFhOwaOJy3qoCcBk7nU+/gLXyEhHE32ubvjO8NEug0qhTFFr0AB83
 1rnZkFlvK0+XUU61R3fl5GTH8Dm8mxo+6KhcODsFugJVHPVuuTtU6ONNyjeV+qh4L5dcghhxXcs
 +0CVCAUdNneHPQlZLN8Bd0DZu4Owd4B/Z5ZwfSytohr7QuS+mpULQk3EJb+WqBM6lyCI5dFNtgI
 81NAYTV3KHJ5Q1R/qnCN49Bd7KBZTdJ9sX2lCDTvfretwfgR5DlbAo/N05PO/6X1YE6A6Tp9ims
 3hMgl5tn2tWBU3/d9oMeaVW9nzMJd8FQrWY/GxAin49ywZywFJebVxfQ5TjdLQtmahWe7nQNnUs
 7ntA/4AY4k4jDZzoAzA==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba775e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LOiNTj8lzfyKgz_g5nQA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX45MJHI25ev0Z
 Lp/eN4BbSIcp80ycug/CVW+wS+OoeokMdkDTijQZGzI4PiC+HgSKp5nrOOJvjRyAdMTDYxSUVgP
 zoI3k7sSXhswb7FP/sYygPCLwpweK6A=
X-Proofpoint-ORIG-GUID: VyilyFuhlydpMw4m5xcIz8IeJEzL36n5
X-Proofpoint-GUID: VyilyFuhlydpMw4m5xcIz8IeJEzL36n5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280057



On 9/25/2026 7:14 AM, Greg Kroah-Hartman wrote:
> On Thu, Sep 24, 2026 at 06:09:00PM +0200, Igor Skalkin wrote:
>> From: Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>
>>
>> Add the virtio_usb device and virtqueue-wrapper skeleton, the
>> protocol header shared with the vhost gadget driver and userspace
>> backend, and probe()/remove() plumbing with no role support yet.
>>
>> Introduce a per-port virtio_usb_port array (vports[]), sized to the
>> device's negotiated port count, ahead of any code that actually
>> populates or reads it. Every later commit that adds a role to a port
>> (host, device, OTG) builds on this same array from the start, instead
>> of the host, device, and OTG subsystems each growing their own
>> separate port-indexed storage that later has to be reconciled.
>>
>> Wire the new drivers/usb/virtio_usb/ directory into the USB
>> subsystem's build (drivers/usb/Kconfig, drivers/usb/Makefile) as a
>> new CONFIG_USB_VIRTIO option, listed alongside the other USB
>> dual-mode controller drivers.
>>
>> Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
> 
> Why does this not match the author name?
> 
Sorry, this is an artifact of squashing a much larger internal history
(100+ commits) down to this 8-commit series. Will be fixed.

> thanks,
> 
> greg k-h
Thanks,
Igor
