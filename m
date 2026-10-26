Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011691;
	b=AWbmuWuXZGnHKJdhbcWwMTACG9JLk9zmnVhUak0ucdKl9nrUkyfZr0HtWKtPT6pz+KVa
	 avrQKV1sfeeodj/Y0Lwbu9k0dS9w5Rg0W+PG3Nc+WoGlqGPYbcyDNfuqQymaw6j4O9hd2
	 PrYh/kkqzZi0Oxyk2bg1vvisQSnO7khFRFMvillf7Mey3cUuwr6NVjbZTp7Wj8/8xCljQ
	 CTNKMj6z5bcKFdYJeoaG0UgN919i6eA5UDbuC7AgG6Vujt3R3JPJcuWcajMS1h/Jd86Bl
	 1syb1bHItoNqk6yqZKNlhdVecCT1p8YcsRqgVBmejiVj/B9wzX5knFTguki96cwLpVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011691;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hpP5tLffFJhPMvjSaCAXA998R1QWgtC32FCFV1syJW4=;
	b=gRT7sNOF7iPMjAqqhXowVGJ+Pw6LRSSnFY3/p9ci+nY6BcBL5WNdW2CIBun/96AOBuS4
	 rmgdYvj0zxHqVE/GLZHlGbft9E4NXgA2fmbHmL8Zt1Fde9Ywsg9bGo0Z3nQWXGmF/SN92
	 BlW12j+5cxcCAkAzsrOThZua/OfqYB5ly/TFs9UwBfXznr8cIgw6oqUqnnBkPtwmigo2v
	 pd4t/jU8qFqLcsu7bke9NuP3GoBkIo/0YhcMn6DLooDdRn+gSF4AJlNNM0Y+FojOeg0sS
	 sU65xl+gsBB4x/mx86Gt3G9R+Avyr1Hclh0hikKHGA58PMQmYHWnywMGL5bXavyWqOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cxMbWFqs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bBmCdW1g;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DD1606A31B
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 10:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41DD1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cxMbWFqs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bBmCdW1g
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAPZQY4067837
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 10:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hpP5tLffFJhPMvjSaCAXA998R1QWgtC32FCFV1syJW4=; b=cxMbWFqsga1pjxpH
	skh2Ck+N4PE2B3VyEgYGXfNPzhlF+eOUceVu22KisRT6KGOYFkXkOApAT1Yy6v9Z
	wvPkfsf2jclxpBME2B0QIbsbzIEmyPWwGxEzklK1asnjhUyQUNP9c4SkF+z6LDLH
	hF30IcArqCbEWSFkX2J3yPuTqN/zEJUPtoT04uwxiAJWrktrx7g0X1fIUaSue7Mp
	6YORh6eGcj6Y44yVtTmsSfMWQovvqBN0c+ZXxf7HBuV7SXNW8yJdl1TFGy+59XMr
	Kfuefm/osjEVaUX+3xiCDMY2MiLlkK976+/WR78WfUybCf3h/tJE1pjmgHa6iwhC
	ssA5xw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q02hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 10:48:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso566663285a.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793011689; x=1793616489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hpP5tLffFJhPMvjSaCAXA998R1QWgtC32FCFV1syJW4=;
        b=bBmCdW1gezobAuzzU44oTlPkNxLgRPI+V1NkicdCc9PaNBd1y1fDh+59fFGwaoUkOz
         DWeXbfPA7RZq/syuBin4l+UKn45YtiYDKHFzd+PbXFnFsWdMHiisv4XpAeDU7O6fB8XK
         zJ2QHGcv67QNGYR5YvdKOSvCrsptMYaj/wuWMe1mpgGUsJYlfa8VQ3KLvF3U7rmJ0AQN
         0IORPtwd05lPXzKC1VYzgHM56vN+SeqI70dGBeF+/q4Lb4/dshzmEhUrYy67knByCT4W
         48vPJrRFCoh6+skqCqK54oKRSyS1m9Mn6y0xZZ+2CNv1O45EwS5xME+z3XQ7koD6ZR0B
         yruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011689; x=1793616489;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpP5tLffFJhPMvjSaCAXA998R1QWgtC32FCFV1syJW4=;
        b=Mz/eUOL3m0VF3GERo2qk6iTHZnMVNqaV4s4he/nV5mnhD7LFWXcMYI+LxliQ0RuzRY
         I07QVfmnSowBzxlPj08hZI24SBEHsBdP17gSdcWxKg8jjLBGUIK7D+qKVWe9Koud4jW7
         Ac40LDMuF9bTRVhpOsgorg0z/e4BIaUuy3nDdy1P2SzyxL8/6hMS13Oxs453jisD1W7L
         Jg9yur2p7I5kaOcCks2ZWnXllzMlpJRHuHWVz+IwdK/IhSxz9vbTmQAxTIs8E/HCHAQ8
         PU4ewJDTCWjv/UzGo68OA7shFp2B42kYMMmbQe331yXqvdm/fL2w1tMidoA2fPeZm60a
         yPxg==
X-Forwarded-Encrypted: i=1; AKwUvBxm0Zh94QeWt6iy8hy56sg2mvQfyDKMy/6VVK57LF2FF6lVLEBsKfL6asKZRAu+cFhZaIfz7h5z+dY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYgna3PYEFCsfcdnOM5oHEiTDfPvwFFBiw/jqyRayMmo8RML4s
	mT2ykzq9ukDm/2B2IcVpfwwR4iVjljDGezGdIz5BqTEcsbFu4gheZzk78KIXu51+gfO0ePq4/tD
	BHV58sznYA4dyK6zlmxuQlzL9KtnEKiKmWPZlsQToOXURKmXgODUppvfOhN0q/Hk=
X-Gm-Gg: AYBFou3jJQQdmhEI/3LSofDmim7OSJ0foEg9WMf2gz+RuARDwF387Uz/YizG+rQKelr
	A/kE3FaGokrPpfxSkTohyQ9rIi46gsCI6vv4zX5DZbF+gfYxS11TUPI4A2MnC52Df2EAKPVsbEz
	VG7VMfqg2upN5XJNah5/t77ZiGmqko0BLh326CSeMmB6sIbn1qch2qbg4UOc12Ul8Muy55PsNrq
	gUSgiId+Ny0uMz3KTyF41qyUWm08i04Ba4f+Txm7MfxWZDGMdzxbwMj64KSo9LGJw+bPoE2UaWK
	Gdf/zgL9BGVPNx4KUblDCbDya1da8C1pup8xgFQb409TjJOUgYEhpMQeKFPe/8bq0XFN0URVWcu
	YQ4oLmXv2j0Nmm7PEuyQ=
X-Received: by 2002:a05:620a:17a0:b0:93f:35fc:5260 with SMTP id af79cd13be357-940ef94c10emr900165685a.35.1793011689216;
        Mon, 26 Oct 2026 03:48:09 -0700 (PDT)
X-Received: by 2002:a05:620a:17a0:b0:93f:35fc:5260 with SMTP id af79cd13be357-940ef94c10emr900163885a.35.1793011688557;
        Mon, 26 Oct 2026 03:48:08 -0700 (PDT)
Received: from [10.40.99.45] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595e70asm3579692a12.9.2026.10.26.03.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:48:07 -0700 (PDT)
Message-ID: <686b2d33-7a50-44b7-940c-70c30f4c941d@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:48:06 +0100
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
Subject: Re: "thunderbolt ... (DP): not active, tearing down" error breaking
 DP over thunderbolt displays
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>,
        linux-usb <linux-usb@vger.kernel.org>
References: <b5145213-9542-4351-8f98-527aad74ee64@oss.qualcomm.com>
 <20261026052331.GC158991@black.igk.intel.com>
 <fcbac09a-be91-4fac-ae0f-934f628afa01@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <fcbac09a-be91-4fac-ae0f-934f628afa01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MiBTYWx0ZWRfXwdmbeC44Sv3R
 mVmvRH4TELxQ/SEjKeqdMzrsCpm21PWSruj1OKzuvf+K2izUdt1cpAczSUTTsTWZlFyVSX1kHNn
 zcvPSWnSRlvoW3R85RkSsH8cC3jABwI=
X-Proofpoint-ORIG-GUID: AF34YJwD_wiCoEVZOhpx1oHYwjDqDRum
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MiBTYWx0ZWRfXywzkOLDeWwri
 mdCsETMX/aDKSozZy57mS5s5ZQn8rYU3BocctP/dUkTPQxumsFiQcES32RlHg8hnCm8Wm3vfP5P
 MgmzOQwk/jFKrageX7pXJlWVnOKbbA3bXpqdDI+YiRLAg6VppUC1UhpJV1a3BNIUN4vxtTp5RD6
 JybVpsvdLvG+GsWcDOMOOd2cXw3kOuSSuYqy0AExNRJ8+g+7jsTuZXrOPh0ZejOXLf9d2wBDynA
 UwIu+h3arHTu5Lor9j6TFT9w7r2YqkX46zZbpaRT0eUeEHGi2sZ/7K+MZIAM+L6ykwTueuupDaD
 5izjWMX0y+KNAstMn3Rtd25lUW+2/jf5coHP0jEny7+ljHYtygccAeOj/QvRMxReYQUgu/trkgz
 wsjZd42F8TeYLvXjeFqNTKpL5QIFwkSjh8jeBfF+nM7RchpBzZxYDk9x7FS2H9ZEXJZXKBoCu7A
 4mNjzCbjRW/9JMdmqzg==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf2fea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=yxZzxqTSAAAA:8 a=vTr9H3xdAAAA:8 a=VwQbUJbxAAAA:8 a=ruI9u7PbHT0s8uxAMK8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=O1CjF_u66TjtNpJpfgT8:22
X-Proofpoint-GUID: AF34YJwD_wiCoEVZOhpx1oHYwjDqDRum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260042

Hi,

On 26-Oct-26 11:30 AM, Hans de Goede wrote:
> Hi Mika,
> 
> Thank you for your quick answer.
> 
> On 26-Oct-26 6:23 AM, Mika Westerberg wrote:
>> Hi,
>>
>> On Sat, Oct 24, 2026 at 08:17:16PM +0200, Hans de Goede wrote:
>>> Hi All,
>>>
>>> I hit this error:
>>>
>>> Oct 24 19:16:58 x1 kernel: thunderbolt 0000:00:0d.3: 0:5 <-> 1:11 (DP): not active, tearing down
>>>
>>> while doing some work on a Raptor Lake ThinkPad laptop plugged into a Thunderbolt dock.
>>>
>>> After a bunch of debugging I found that the problem is that I had:
>>>
>>> "UseSimpleDrm=1" in /etc/plymouth/plymouthd.conf, which combined with
>>> the latest dracut version causes dracut to omit the i915 drm driver
>>> from the initramfs.
>>
>> The error means that the graphics driver did not read the monitor
>> capabilities in time (~12s) and therefore the tunnel was torn down.
>> Capabilities read is required for DP tunnels to work properly.
>>
>>> And when thunderbolt.ko loads (or maybe only once userspace pokes it ?)
>>> and the i915.ko driver has not claimed the DP connection then the above
>>> message is logged and Linux does not see the DP attached display(s).
>>>
>>> Building i915.ko into the initramfs works around this, but there
>>> seems to be an assumption on the kernel side about things happening
>>> in a certain order during boot which there should not be.
>>
>> Right but as above capabilities read is required by the specs and we cannot
>> keep the DP tunnels up forever to consume power (and there is also
>> complication with add-in-cards that don't have all DP INs connected).
>>
>> You can pass "thunderbolt.dprx_timeout=-1" (or some number or seconds) to
>> work it around.
> 
> Hmm, I see thank you for explaining this. The problem is that these kind
> of timeouts *never* work. We've been at this since the late 199x years
> where we had initramfs shell scripts which loaded scsi drivers and then
> had a "sleep 5" for the scsi bus to get scanned, which of course was not
> enough on some machines. This was never fixed until we made initramfs-
> scripts use udev events to actually wait for the specific disk to show up
> instead of a sleep X + blind mount /dev/sdx / which failed when the sleep
> was not long enough.
> 
> In this case specifically there are plans to stop including the GPU drivers
> in the initramfs because of the ever growing size of both the drivers and
> especially the firmware the GPU drivers need, see e.g.:
> 
> https://hansdegoede.dreamwidth.org/28291.html
> https://fedoraproject.org/wiki/Changes/PlymouthUseSimpledrm
> 
> The plan is to instead only use simpledrm during the initramfs boot-phase.
> And the recent dracut changes to modify dracut's plymouth support to stop
> it from bringing in GPU drivers when UseSimpleDrm=1 is set in plymouth's
> config file show people are sitll working on this.
> 
> Combine this e.g. no i915 in the initramfs with a LUKS diskcrypt password
> which the user needs to type in in the initramfs boot-phase and one can
> easily exceed the 12 seconds.
> 
> AFAICT the GPU driver never showing up (rather then showing up later)
> would be a (configuration?) bug of the system. Under normal circumstances
> this (GPU driver never showing up) should not happen.
> 
> OTOH the GPU driver showing up late is expected behavior when a system
> is configured to not have the GPU drivers in the initramfs.
> 
> So it seems that the current timeout of 12s optimizes for the wrong thing,
> it optimizes for a scenario which should never happen while OTOH breaking
> a scenario which (IMHO) we actually want to work.
> 
> I think using a timeout of -1 should be the default, since by default
> we should expect a GPU driver to show up and claim the DP connection.
> 
> Would you be willing to accept a patch to change the default timeout
> to -1 ?

Ok, so re-reading your answer I guess one problem here is:

"complication with add-in-cards that don't have all DP INs connected"

Still I would expect at least one GPU driver to always load and
initialize successfully. Can we have the GPU driver make a call
to the thunderbolt code that it has initialized even if it is not
claiming any DP connections and then start the timeout from that call?

I think it is reasonable to expect any secondary GPU drivers to load
within 12 seconds once the first one has loaded. But for the no GPU
drivers in initramfs case it may take longer then that for the first
GPU driver to load.

Regards,

Hans


p.s.

We had a similar problem with deferred_probe_timeout handling, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/base/Kconfig?id=56e3ee721b33bdc4ce0765d370983aa4384f8a59

there this was fixed by making the default timeout value a Kconfig
option and letting distros override it since previous discussions
did not lead to a consensus on how to handle this. But that won't
work here if we want to deal with the "complication with add-in-cards
that don't have all DP INs connected" case.

I'm mentioning this because it shows there is a generic problem
with this "timeout design pattern" trap us kernel devs seem to
keep falling for, especially in relation to things not happening
in the initramfs while it waits for user input causing all
these timeouts to trigger while they should not trigger yet
because more drivers will load once we switch to the real rootfs.

This has made me thinking that maybe we need a bootup-done
or at least switched-to-real-rootfs sysfs file userspace can
write and only start timeouts like these once userspace has
written that file?


