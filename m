Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A8556B855
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 19:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711910; cv=none; b=D0JNiC6bDrTJdXaB5fpFhnC+9lFuUbbEsLoz5u8iAQRnuULL5Nh9ILDZH83dNNxtuoOBT1xB8llhumtfwHe8ZYxk2R32GlO4RXCjMlpoZ8Uqmv25RQ22VFIVDkq+lJ8xFvGifGlPkfBIWPKsolAiaUwPGuNNn6xNAfVF4K5rvT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711910; c=relaxed/simple;
	bh=PNe+E46nBy+rIIMkz2VXEfYVqX+ZJzbn+FUhL+libPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SshapireSu/t24LDGpfglh2NQjM53ZnpON1UD2EyNG9iIJHwcVCVEVddRFToYMvSZRbEOwRm5rjqgu3lZmwD49rH+99gHdBS1puWXAA3PFSDWYbNKx95MeF7Ufh6dTbHmWlcQSftp+sQEcCUUrc843k249ca8iTWQZj0SrMEaCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1B8Hiy1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAuuvhID; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1B8Hiy1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAuuvhID"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TI3uTD1725137
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 19:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1tehw+Aw6Sd2DbyXttSdQ3cH24YDSQ78S5aJSyAkmRo=; b=W1B8Hiy1n2jxyiVp
	26DAfUJ73fDSOycCzD0DuFrQkW6Yb/WYwIZXHq6ERhY34Essamz+RxvAPDf41MfQ
	WhaBwBbPlCClmxqxaGDc1d7DeC0MSxjrNSsbXMYZ4VF+YttvpiLOlUHl8pSl0dOt
	SKjlYOb7Is4IGuFf/GOwxJnRosKTXuP2SuTB6bWG9NXWAUUMapdg+Azb4tottQ2g
	Ao8kP2Q0jLTcqQGNODIeVgYF+nL8QommBA3hjnBLgr0yKL8+qAhVSQZrtBDLBiEZ
	Ec5JFpka1/nMp4/RHpUUVWTshkMQWFmXo2rZqZbWvC7jAYNDvxEX7z0unz04nviO
	SngVHw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97rewh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 19:58:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0b66ecd9so706940085a.2
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 12:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790711906; x=1791316706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tehw+Aw6Sd2DbyXttSdQ3cH24YDSQ78S5aJSyAkmRo=;
        b=AAuuvhIDf6BMQ+C4uYs4JoF2TO//sbEOMI/s92i4s3YJ7HhhzkgGtj4U1BTcSAtc7r
         IEkEpSp6y6kU5+7LPZWVgdRI4sr9xVJ8SuK602560Y3udoFn/UUjl1F3lMywGxbtevKJ
         p+t9/4s4z+aYUXIK2FRECd+NrYR8TpqxJjPRHkYhTeW0QUZAwEV+r0vIhRYZVuMnoWps
         7sEHi9qZNTu80hL5RSBmbmXT1x7B5d5xacLdLwbdTmp3U4L6DxAF6f/gVZhLolujfjsH
         uqdnRFwFLSnRcoV5ainZHVLAVwj8tmCaXwlMi7uvi7LGBT2oh3yLeafvakH9QEx/VyXo
         Y0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790711906; x=1791316706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1tehw+Aw6Sd2DbyXttSdQ3cH24YDSQ78S5aJSyAkmRo=;
        b=tSl/7e0c49pKaKwvE5Uoyvd8ltjsJZH/qL2OtIiKSO7OsPR1HSGCvB/N27kdtVeNwl
         bhOQ72cCcn/MXgUvonL2p5uwst9ysnLPaYsqAhZiQnbZDvoewxHOSxOyRaoPmnhSQ7fj
         G1rl7IOplivi+a3UXvxof8MFemxdZlv9Oj3VQh6Xv8bXvqbNkEFvZ6893sFXMdy4qA+T
         YH/npU8yiKd6isAtX65NZZyA3gmNyVQfsMFlbvPJAp0mLQUBQSDxsqlC5VYuL7Zjnlu/
         aODHhqBaG/G+bLK1zZmWm783w3fb/ffIil7WDBMFh5UGrmM9caeXkA1AZyYLLygntaQv
         s1ww==
X-Forwarded-Encrypted: i=1; AKwUvByPnGrY8cJzz3XE4rCZyLLjxdQwTFOzoWuLfeIz4JYX8ZgvdjOSThNwgh4b5SwbRfhNZNfCUbGM5YA=@vger.kernel.org
X-Gm-Message-State: AFuF++lp6XO93Ojjt5EWXREt4WaW0tUa/xhDHfXkSWtATELOW1ZQTNo7
	n4VCiMP/1UheTmFjaWT//QI88qjPvKsJ6oGjdqS7V3JVkZdl7iuJx/KIMiCbvjQ9ctz0ajVTPuL
	glzYZvOPn2hteVtvp2DdN9mbbMnW2t8BG9g/GoVHUxZC9rf399JT8H7btYBeCKzo=
X-Gm-Gg: AYBFou2FB9FM1XhqR2+DzpWhmMGwp8wfBTJt9dWkBJHct2bQ7qwAYtw+BewhHWmGwdy
	HxoiE/xe5WKVn+bQI86TgNXNqBnVoMB0IQt6ivxRgZq4yce6c0op0RTjscnEKPxqdjchywP+JNx
	PXR72gMBR35coD5yB+CRr6tMxe1llRoHTzHhJQ8P1MermkLypZ6hLp1GsRQoHTy1zqjXIcBxzqQ
	+XgSu2j7hxLrhYAnfY7jbpbERs3jX50wL+i5HorzrzHRluBlyR3Gg19QGp7d7Z+ER4uEu3NubUJ
	TMRKTpQ6PGKU+4eO+OcCDoBNivQxhV3iUDjx9mhDBmYZcZ3PMRqPV8Blh1bQXuwXEIlgXeFalKx
	h7xEDeH3ymKetio9V8C8eXTZSVmxDBGkRC1o=
X-Received: by 2002:a05:620a:8010:b0:939:fde0:a71b with SMTP id af79cd13be357-93c9f315edcmr144754785a.0.1790711905725;
        Tue, 29 Sep 2026 12:58:25 -0700 (PDT)
X-Received: by 2002:a05:620a:8010:b0:939:fde0:a71b with SMTP id af79cd13be357-93c9f315edcmr144751285a.0.1790711905266;
        Tue, 29 Sep 2026 12:58:25 -0700 (PDT)
Received: from [192.168.178.72] ([185.72.232.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f68basm111314315e9.12.2026.09.29.12.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 12:58:24 -0700 (PDT)
Message-ID: <9161039f-c68e-4f86-8f8d-2339ddc4b128@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 21:58:23 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] virtio-usb: add dual-role virtio USB driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Skalkin <igor.skalkin@oss.qualcomm.com>,
        Jason Wang <jasowangio@gmail.com>, virtualization@lists.linux.dev,
        linux-usb@vger.kernel.org,
        Aiswarya Cyriac
 <aiswarya.cyriac@oss.qualcomm.com>,
        Anton Yakovlev <anton.yakovlev@oss.qualcomm.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20260924160907.145405-1-igor.skalkin@oss.qualcomm.com>
 <2026092520-aerosol-brim-22d1@gregkh>
 <1149e188-7279-4c60-bd96-f8d75d721ae0@oss.qualcomm.com>
 <20260929054346-mutt-send-email-mst@kernel.org>
 <2026092928-borough-tried-1ea7@gregkh>
Content-Language: en-US
From: Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>
In-Reply-To: <2026092928-borough-tried-1ea7@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LSvEkxWdiT7nkPIwDKrsYdy-BFaTtASD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA3OSBTYWx0ZWRfX/0uTlLlsys0A
 E+ovxn/pu01EYZW5EQVbtgN+wfOkOBhkTzRtyFAtB6psn2eM3Ey6bM/ilEmF2bSTCdL18Nbxwsl
 vGJdDO0zCHAOTJZRBmTFNH+ETb9YTHyD6WecYdExJwadQswDLhuah2zDDNl39jI90o5UMKwsSxQ
 4mkPnTCvyJPRgqf0MVnBn8YG8AVlv0LjLqWBraug0391NEJKhWyZmCvC6phPU6o8t3YFT8OpXdc
 njuySsiAEdwqijHDaai+CQD1dTbHoU2GPv2jUumj4hrSQiF0MDQs5BZtB5a/BhnBh0ED7phLgDs
 I4UCRUr4AZ03hs5n8m5c8W4OB9VjhIVe74UB5Blqnw+o2XXj0CPws9Su1ykf0LjVOdniQjco4+N
 5xPdyOzx1UW6KSJVXlhZIatP3doYTfCH3ImdM/N5ZiT/aiXCLBKaEzI3ox4+sE1UbmwhDH789hm
 uqOuQi8pVv4uB3sbN0Q==
X-Proofpoint-ORIG-GUID: LSvEkxWdiT7nkPIwDKrsYdy-BFaTtASD
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abc1862 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=BpkRnlkrQxY2rq7xvushAA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rUxKn3iPH6X_qJRErHwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA3OSBTYWx0ZWRfX5SlC1QaoAvaF
 0WLwfz21a8KVYDdqPRD9E0tA9MOMLLveGrHlhm9ewTL6z5MGLO2IWc3QxJr2LLHH+hQi9l/jkbU
 9JsvJN6kvhbTv9FQRQGH1YilnMKI8z8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290079

Hi all,

Sorry for the formatting issues.

I'd like to join the discussion and share my perspective.

Greg's main concern is: "Why is this needed at all?" Let me explain.

First of all, our primary focus is embedded systems, including the 
automotive
industry, particularly infotainment systems. In this area, the easiest 
way to
provide USB access to a GVM is to pass the USB device directly through 
to the
guest. This is even simpler than usb-ip, since we can rely on the 
standard Linux
USB driver.

And it works well until we need more flexibility, such as:
- Sharing different USB devices connected to the same USB host among 
multiple
   VMs (for instance, assigning one USB stick to the AGL GVM, another to the
   Android GVM, and a sound card to the PVM).
- Sharing multiple USB gadget functions from several VMs through the 
same USB
   gadget port (for instance, providing ADB connectivity to all VMs, 
including
   the PVM and both GVMs).

Once this level of flexibility is required, simple passthrough is no longer
sufficient, and we have to rely on USB sharing mechanisms.

And this brings us to Greg's main concern: Why not simply use usb-ip to 
share
USB devices between the PVM and GVMs? Why introduce an entirely new 
transport
for USB virtualization instead of relying on existing solutions?

There are several reasons for this.

First, we aim to support not only Linux-based hosts. The host could be 
running
QNX or even a bare-metal (no-OS) environment, where usb-ip and usbfs are not
available. Igor has already explained this point. However, as you rightly
pointed out:

 > Or more realisticly, why should _I_ care about anything other than 
Linux? :)

It seems, you are right: why you should pay efforts reviewing our 
patches, while
nonone excpet us will be able to utilize this for non-Linux based 
workpaces. In
reality, the opposite is true: if VirtIO USB becomes a standard part of the
open-source Linux kernel, USB virtualization will become 
hypervisor-agnostic.
For end users who rely on open-source or commercial hypervisors, it will not
matter which hypervisor is running under the hood (for example, QNX or 
QEMU).
They will be able to use the open-source Linux kernel out of the box, 
without
any modifications. If they later decide to migrate to a different hypervisor
that supports the standard, the transition will require little to no effort.
Therefore, the Linux community should, in principle, be interested in 
supporting
this effort.

Furthmore, this is not only about host OS, this also about guests. Let's 
imagine
you want to run QNX or VxWorks image under qemu on Linux Host. Both GVM OS
supports OASIS Virtio Standard, but does not support usb-ip. Therefore, 
we would
like to introduce a common approach that works across all operating systems.

And we also plan to add virtio-usb support to QEMU as well. This 
approach will
be available to the broader community as well, not just as a proprietary
solution.

The second important reason is that one of the key virtio-usb features 
we need,
and which partially motivated this work, is support for a dual-role USB
controller for Apple CarPlay. usb-ip cannot provide this because it 
lacks OTG
support.

Third, performance is another reason for introducing a new solution. 
Igor has
already partially explained this point. Existing solutions such as 
usb-ip rely
on sockets and therefore introduce additional overhead. This becomes
particularly important in resource-constrained embedded systems. With 
our own
implementation, we can avoid this overhead.

Fourth, as Igor has already mentioned, usb-ip and usbfs do not work out 
of the
box. They still require additional configuration on the GVM side to function
properly. Yes, this is standard Linux administration, but it still requires
additional configuration and maintenance effort.. In contrast, a vanilla 
Linux
kernel with VirtIO USB support will boot and operate as is, requiring zero
additional effort.

Last but not least, let's be honest: usb-ip is not really about 
virtualization.
Its primary goal is to share USB devices over a network. This is a perfectly
valid solution, but it serves a different purpose than virtio-usb. By 
the same
reasoning, one could ask: "Why do we need virtio-gpu when we can simply 
use RDP
over IP?". In other words, this is not about inventing a brand-new 
transport. It
is about defining and standardizing an existing approach as an open industry
standard.

Best Regards,
Vasilii

On 9/29/2026 6:01 PM, Greg Kroah-Hartman wrote:
> On Tue, Sep 29, 2026 at 05:47:30AM -0400, Michael S. Tsirkin wrote:
>> On Mon, Sep 28, 2026 at 03:55:38PM +0200, Igor Skalkin wrote:
>>>>>    [RFC PATCH v2] virtio-usb: Add initial virtio-usb specification
>>>>>    Igor Skalkin <igor.skalkin@oss.qualcomm.com>
>>>>>    virtio-comment@lists.linux.dev
>>>>>    https://lore.kernel.org/virtio-comment/20260924154007.143927-1-igor.skalkin@oss.qualcomm.com/
>>>>>
>>>>> This driver has been tested end-to-end against our own userspace
>>>>> virtio-usb device implementation (host-side backend) in two setups:
>>>> Where is that code and why isn't it part of this submission?
>>>>
>>> The backend we used for the testing described above is an internal
>>> implementation that we're not releasing as part of this submission - it
>>> integrates with some systems that aren't ready to be public. We
>>> recognize that limits independent verification of our specific test
>>> results, and we don't think that's an ideal situation.
>> Supporting vhost-user with a backend doing pass-through shouldn't be too hard.
> Wait, if all you want is adb to work, why not just use it in network
> mode?  That should work find across a virtual machine, right?
>
> thanks,
>
> greg k-h
