Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980774D5988
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603746; cv=none; b=CkDkV9MVnt9fHAY7TE8Hn8+Bc6xxp3agYELV6yUE0QC6oncN3lPEEVHIOWMFcHu+DwOQTJ/ljxBXGQS6+RRRL90OVP5IwuEq7W9sqCEjpgEI9qzg6Rtko9jY7L/o1tS1bMEkc+Ko9mJU8/0kwcWWwWRDILg3wrRgkWZfkP/t47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603746; c=relaxed/simple;
	bh=vI9c5rTuv2MFHLpc0LO69CguN4V55h1LfmXgqKewMEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jzJ0uzxD6LhyjZOj290vPhhs7bsVbluyrziSNjVu/i4128kMeB9dHgA/d7PURVQtcQZ3DHV8mUK7rZG39P6V5s8RG+nHkFVnUeGzhcEy8CVqXLqDO40FNd8JI6v+Wj8MIAXGFrR+CYJUEaB5mL2drUUWOdZxaGzjWRQhXhVX4dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/iUjaJ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8ACmdDa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/iUjaJ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8ACmdDa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAZPW2295415
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 13:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B/rtoACE7wUdC1UOb3HizFNURHsO85oBdpIJtVTpcEE=; b=M/iUjaJ+jvmdz08+
	CclFxiu4LpKG7Z3Fd409uYT4MDYtmzLAUZu41W0PcGVxug0IyZzBXPl9G9/O00Q7
	60JwvfvSorWh8DUzDMQhQbtfcgox1NvqbzWKlXCs9/a+6Di5MRKQhlSgbPbX4CYf
	aHi/wv//FatohnKGVboMFF5/uHT0lfUIK+rWWyZUBewz2tpR1DpOyaYfanjOXbV0
	XFjQuSbbtuJA8qUiDbDvLXVuPtR/h0optUyiZ/KXtefgNnH4wX528KA5uNCsfM6k
	6NsicbgGuR2BMe8T+D9gaFql+I2LmqHovsd2Dn+hEQCR/EhYzNqreN1sL6WCYv3Y
	TzSmcA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubhu8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 13:55:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a04805f8f1so2692120137.3
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 06:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790603742; x=1791208542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/rtoACE7wUdC1UOb3HizFNURHsO85oBdpIJtVTpcEE=;
        b=I8ACmdDasiOyxn5/yWgMCJKwTBp9SVrwYk6Bu7dUEWNJHm6FpDA8iSzY/HgWFUrevf
         dou6oae1doeszy/A4TGm9k/F0uPqsMNwdBg0IVB6+c1Qg7V1sMPKtliJwqWdYA8cu32i
         G1zUhFfrKVB/6XCR+tzz6+fI4+p37r+tEXeCLx2aY2EBSPnE+57ACxAstgjpj1YwHlyv
         +Pu42vdyg2gwI67s1tA6v22PQ4RpfA1RqozW0tmC5Jf5n3TzEfzBvoBe713UInu86QQN
         cwOw1ti+YjyLl2iaN3jWpK+7HVbagX2hUq3LkQwSpyB/gO661sE6xMbKtIP8S6O8mPKm
         Wugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603742; x=1791208542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/rtoACE7wUdC1UOb3HizFNURHsO85oBdpIJtVTpcEE=;
        b=isAQhzZQJ9a0aXuQ2bs2Wxy+b3rqVoonwNbFSu3OU8f7KyO1iX+gpO1lfUDNPXVYdC
         rPLf0sw9jXMGIrLHSN/vw3iwMJnwEjY/BTBIneegLRq4znPgQniZt/HGCIhr+q/MjRW8
         dbQ3FQhJjklMKNvkgheiAxRDvgpbffnJLLBghDuIDdmJfmsojS7pFtcyi5S2n40BOPP9
         TwXYQ+ZtHd0gYvuz/tRFc0EDLgcudNsF7Ti85pTTxch+DbkZuk6MWAI4yOkkWB8AaICJ
         ZXVDStFj8jL5W+iqsFfqK30QECtoNnQv2PS7Dq6GZ6CGdnj6DCAlPeXwjZqqznGFk4Zm
         ur3A==
X-Forwarded-Encrypted: i=1; AKwUvBxI2mGT8HdH9fxTxaLWsFfr72NSj2beS+DTmIx8ptxUwagjK3yVwFw9eBv8mNUL+1embXTj5JzHJ/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUNs1s80GWJ+Ka/fkhvcfdr6wEdAcXz9CqY6GccuXkwm/R+tQ1
	dFk4q3jCQlMFhO4gcA3QDjz0AmDRuI5ycwWWdAsKkMcFKxjtofUlkeQNh54lPKTHzRXxpObTXVD
	k7mOP/GHLxK8B5pjMTZED8JxYe5CRigijfXBzKKfZABPS5EdyAB503J2W2M/LfHA=
X-Gm-Gg: AYBFou1ztpHdbXrlRHAf5QLoSVsIijJG7S+7axA7+zMQM2PeQKCWTqFk1kOwF546mQh
	QX3B+l2uVaUnM6InJar7Wm0F7F6RhYhAcIoy/OUm4R3U3pUPpYAwWoiv+Ej4ALeb0tsOz3Q0fm6
	x2fjyTVsYuAv1EoUaayaucySSmIvBZuROouNvB6kdPVx7DGKyZT6Di+zWUjB+AhSBDLw7t9exKU
	wuv2XinJoyf1QevOeNVC2Sxxjn3YqHhwsmEh61Tn2hWEbd8haiD6g2Qk6Z/7wSKTPBG1aLm/0V0
	jf5PmNdkQ8NAVEuUsFLBRI0SBguwiTCEa3YSSx/gzHm5mR/JW5NASbcpi1zk3+cfvnbWhxDA+kj
	LZz2Xfvuj4NIhtewEDq+VopZGKjectw==
X-Received: by 2002:a05:6102:5129:b0:7a1:f7c3:3a41 with SMTP id ada2fe7eead31-7af1c17d7a0mr5392811137.14.1790603742318;
        Mon, 28 Sep 2026 06:55:42 -0700 (PDT)
X-Received: by 2002:a05:6102:5129:b0:7a1:f7c3:3a41 with SMTP id ada2fe7eead31-7af1c17d7a0mr5392797137.14.1790603741799;
        Mon, 28 Sep 2026 06:55:41 -0700 (PDT)
Received: from [10.224.243.150] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc1fd9sm4031577a12.16.2026.09.28.06.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:55:40 -0700 (PDT)
Message-ID: <1149e188-7279-4c60-bd96-f8d75d721ae0@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:55:38 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] virtio-usb: add dual-role virtio USB driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang
 <jasowangio@gmail.com>,
        virtualization@lists.linux.dev, linux-usb@vger.kernel.org,
        Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>,
        Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>,
        Anton Yakovlev <anton.yakovlev@oss.qualcomm.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20260924160907.145405-1-igor.skalkin@oss.qualcomm.com>
 <2026092520-aerosol-brim-22d1@gregkh>
Content-Language: en-US
From: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
In-Reply-To: <2026092520-aerosol-brim-22d1@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XuZmtBy9TkNhEa0zqwPXwvECqsQGLdWd
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba71df cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f4vCLKy3AMPYjWFKXbUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: XuZmtBy9TkNhEa0zqwPXwvECqsQGLdWd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfXwJoUD9Cf0Btx
 oYy4gK8U4tCrOk/MQCS4QlJNNbUxYT9G+EaUxblNoQo48OGVGnK2NzoqvxILXAJmVj6pscQMoYZ
 PexwSpaQRDy2Xychh1rvK7LCN07AuyObojpoH/3urf/1KNQtnXk9SUgatgdWt/Ok6bXtkVdUrgH
 E1PG03ZD8RhrdvLhb7SUSyMseck8d9WHi4y7OwqNBqXrq4IO2Tl8t/z0ks2nOrW4Pc85Umtr1u9
 xvCqxuNKRFjo2c2HBfVLLnChSM4mK3Vlo3tIwoMv9EPAE7Ss7XqMzjaTmZJjlLy7cwBbZBuGN8Q
 lXiWJ+GOfh5zVdQFVb8F8EurlxFQGOBWK2ZiRkqRVSmK3qRAKH5tfUaQkhLxIsOhu/ZHf2HapYx
 YczRMLaxDMgVcbjR63/kw4RftQFKaY/QcWV6qN+rz/90UMGkS4J9zYGXupu953bdqGYxHGLZa3k
 iz0YDj/z1FgumJbCp+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfX2PX1vg2ruZXu
 H2m+B7PeyK7DBwLbLQsuCJhBvEDo7dNc9h5cZDknFbht6jkdzuvMIaSctN6raz3LzoIHUbu5MQp
 GvifTIY9I8mTyOkKJe0YJoxCTzI/k1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280055



On 9/25/2026 7:17 AM, Greg Kroah-Hartman wrote:
> On Thu, Sep 24, 2026 at 06:08:59PM +0200, Igor Skalkin wrote:
>> This series adds a new virtio-usb driver: a dual-role virtio device
>> capable of acting as a USB host controller, a USB device controller,
>> or both simultaneously with runtime role switching between the two
>> (USB OTG-style role switching) on ports that support it.
>>
>> The corresponding virtio-usb device specification has been posted to
>> virtio-comment for review. This series matches the v2 revision of
>> that spec, which reconciles a small number of protocol details
>> (per-role virtqueue presentation, host-role vp_idx for hub/multi-VP
>> support, and the device-role BIND/UNBIND event split) that were
>> clarified while integrating and testing this driver against the
>> spec:
> 
> Why do we need this at all when we have other ways of doing usb devices
> through virtio?
> 
> Why is a USB virtio spec needed at all, who is going to use it?
> 
> 
For device classes that already have a virtio equivalent (storage, HID,
video, audio) there's no need for virtio-usb: we can use
virtio-blk/virtio-input/virtio-video/virtio-snd directly.
What virtio-usb actually addresses is different: protocols that are
about raw USB semantics itself, not about any particular device class.
Two concrete cases we care about. ADB (Android Debug Bridge), a specific
USB interface/vendor-class protocol used throughout Android development
and debugging, with no meaningful way to express it as a block or HID
device. And Android Auto (AOA) / Apple CarPlay, USB-level
control-transfer and vendor-negotiation protocols used when a phone is
plugged into an automotive head unit.
Our motivating use case is automotive cockpit virtualization: a physical
USB port where a phone is plugged in needs to be handed to a guest VM
running the head-unit stack, and that guest needs to run one of these
USB-native protocols. The existing software on both sides already speaks
raw USB and works unmodified if it sees a real-looking USB device.
virtio-usb lets that keep working, instead of needing a new bespoke
virtio spec for every such protocol as new USB-based ecosystems show up.

>>
>>   [RFC PATCH v2] virtio-usb: Add initial virtio-usb specification
>>   Igor Skalkin <igor.skalkin@oss.qualcomm.com>
>>   virtio-comment@lists.linux.dev
>>   https://lore.kernel.org/virtio-comment/20260924154007.143927-1-igor.skalkin@oss.qualcomm.com/
>>
>> This driver has been tested end-to-end against our own userspace
>> virtio-usb device implementation (host-side backend) in two setups:
> 
> Where is that code and why isn't it part of this submission?
> 
The backend we used for the testing described above is an internal
implementation that we're not releasing as part of this submission - it
integrates with some systems that aren't ready to be public. We
recognize that limits independent verification of our specific test
results, and we don't think that's an ideal situation.

>>   4-5: USB OTG-style role query and role-switching support.
> 
> There's a reason OTG isn't used anymore by devices, how have you
> addressed those problems here?  And why duplicate the failures of the
> past?
> 
We're not implementing ID-pin detection, HNP, or SRP - none of that.
"OTG" here is just a reused name for something much simpler: an explicit
role-switch command exposed to the guest via sysfs. Device-to-host is
driver-initiated (guest writes to that sysfs entry); host-to-device is
host-initiated (the host switches on its own and notifies the guest).
Either direction is always granted - no negotiation step to get wrong.
Happy to rename the OTG-tagged commands/constants if the naming is
causing confusion.

>>   6:   endpoint-lifecycle robustness rework (async split-phase state
>>        machine, replacing an earlier out-of-tree gadget.nonatomic
>>        patch that didn't pass upstream review).
>>   7:   SuperSpeed device-role support.
> 
> Why should speed settings matter to a virtual connection?
>
Because the kernel APIs we're implementing on top of are inherently
speed-typed, not because of any real electrical/physical constraint.
usb_hcd (host role) and the USB Gadget API (device role) both bake speed
into their core design - it drives enumeration, bandwidth scheduling,
and descriptor selection (e.g. SuperSpeed companion descriptors) in the
USB core and in gadget function drivers. dummy_hcd is a good precedent:
it's also a purely virtual host controller with no real signaling, and
it still has to declare and support different speed configurations,
because the framework requires it. We're in the same position -
unmodified guest USB class drivers and gadget function drivers depend on
accurate speed information regardless of what's actually behind the
interface.
> thanks,
> 
> greg k-h
Thanks,
Igor

